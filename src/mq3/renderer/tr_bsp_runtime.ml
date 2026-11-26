// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang facade for every tr_bsp.c entry point.  The retained world
// is built from checked BSP46 byte views and is shared by the playable renderer.
package mq3.renderer.tr_bsp_runtime

import std.fs as fs
import mq3.compat.numeric as n
import mq3.format.bsp as bsp
import mq3.shared.parser as parser
import mq3.renderer.bsp_render_data as render
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.playable_fog as playableFog
import mq3.renderer.playable_flares as playableFlares
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.patch_stitch as patchStitch

/// BSP surface type for a planar polygon face.
const MST_PLANAR=1
/// BSP surface type for a curved control-point patch.
const MST_PATCH=2
/// BSP surface type for an indexed triangle mesh.
const MST_TRIANGLE_SOUP=3
/// BSP surface type for a map-defined light flare.
const MST_FLARE=4
/// Negative marker identifying an internal BSP node rather than a leaf.
const CONTENTS_NODE=-1
/// Negative lightmap selector requesting vertex lighting instead of a lightmap image.
const LIGHTMAP_BY_VERTEX=-3
/// Negative lightmap selector substituting the renderer's white image.
const LIGHTMAP_WHITEIMAGE=-2
/// Negative lightmap selector for a shader that does not use baked lighting.
const LIGHTMAP_NONE=-1
/// Largest tessellated patch-grid dimension accepted by the renderer.
const MAX_GRID_SIZE=65

/// Data record for `mq3.renderer.tr_bsp_runtime.Shader`; groups `name`, `surfaceFlags`, `contentFlags`, `lightmapIndex`, `defaultShader`.
struct Shader
  /// Shader path stored in the BSP material table for this surface material.
  name
  /// Surface behavior flags carried by the BSP shader or material.
  surfaceFlags
  /// Collision and volume-content flags carried by the BSP shader.
  contentFlags
  /// Index or special selector identifying the surface's baked lightmap.
  lightmapIndex
  /// Whether shader resolution fell back to the renderer's default material.
  defaultShader
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.Plane`; groups `normal`, `dist`, `type`, `signbits`.
struct Plane
  /// BSP plane direction loaded for partition, surface, and visibility calculations.
  normal
  /// Signed plane distance measured along its normal.
  dist
  /// Plane classification used to select axial or general distance calculations.
  type
  /// Sign-bit mask of the plane normal used for fast bounds classification.
  signbits
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.Surface`; groups `index`, `kind`, `shader`, `fogIndex`, `data`, `flare`.
struct Surface
  /// Position of this record in its owning table or list.
  index
  /// BSP surface representation selecting face, patch grid, triangle mesh, or flare payload data.
  kind
  /// Resolved shader record or handle used for this drawing operation.
  shader
  /// Index of the fog volume affecting the surface or primitive.
  fogIndex
  /// Geometry payload interpreted according to the surface kind.
  data
  /// Map flare data attached to the BSP surface.
  flare
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.Model`; groups `index`, `name`, `bounds`, `firstSurface`, `numSurfaces`, `renderData`.
struct Model
  /// Position of this record in its owning table or list.
  index
  /// Inline BSP model name used to resolve the model's world-surface range.
  name
  /// Minimum and maximum corners enclosing the object or surface.
  bounds
  /// Index of the model's first surface in the world surface array.
  firstSurface
  /// Number of surfaces belonging to the model or draw group.
  numSurfaces
  /// Prepared triangle and vertex data used to render the world or model.
  renderData
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.Node`; groups `index`, `planeIndex`, `children`, `mins`, `maxs`, `parent`, and 5 further fields.
struct Node
  /// Position of this record in its owning table or list.
  index
  /// Index of the splitting plane associated with the BSP node.
  planeIndex
  /// Child node or leaf references of the BSP partition.
  children
  /// Minimum horizontal texture coordinate reached on the clipped sky face.
  mins
  /// Maximum horizontal texture coordinate reached on the clipped sky face.
  maxs
  /// Parent node in the BSP hierarchy.
  parent
  /// BSP node marker or collision-content bits for this record.
  contents
  /// Visibility cluster containing the BSP leaf.
  cluster
  /// BSP area number used by area-visibility masking.
  area
  /// First referenced surface in the leaf's marksurface list.
  firstMarkSurface
  /// Number of surface references associated with the BSP leaf.
  numMarkSurfaces
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.Visibility`; groups `numClusters`, `clusterBytes`, `data`, `novis`, `external`.
struct Visibility
  /// Number of clusters represented by the visibility table.
  numClusters
  /// Number of bytes in one potentially-visible-cluster bitset.
  clusterBytes
  /// Packed potentially-visible-cluster bitsets loaded from the BSP visibility lump.
  data
  /// Fallback visibility mask used when no valid PVS data is available.
  novis
  /// Whether visibility bytes are supplied by the collision subsystem.
  external
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.Grid`; groups `control`, `width`, `height`, `widthLodError`, `heightLodError`, `lodOrigin`, and 3 further fields.
struct Grid
  /// Original BSP patch control points used to construct the tessellated grid.
  control
  /// Number of columns in the patch vertex grid.
  width
  /// Number of rows in the patch vertex grid.
  height
  /// Per-column geometric error used when selecting patch detail.
  widthLodError
  /// Per-row geometric error used when selecting patch detail.
  heightLodError
  /// Reference origin used when evaluating patch level of detail.
  lodOrigin
  /// Reference radius used when evaluating patch level of detail.
  lodRadius
  /// Whether patch edge detail has been reconciled with neighboring patches.
  lodFixed
  /// Whether the patch grid has been stitched to adjacent geometry.
  lodStitched
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.World`; groups `name`, `baseName`, `map`, `shaders`, `lightmaps`, `planes`, and 11 further fields.
struct World
  /// Map resource name associated with the loaded BSP world.
  name
  /// Map name with directory and extension removed.
  baseName
  /// Parsed BSP map used by geometry, visibility, or lighting operations.
  map
  /// Shader records available to resolve the queued drawing surfaces.
  shaders
  /// Baked lightmap images referenced by BSP surfaces.
  lightmaps
  /// Planes defining BSP partitions or clipping boundaries.
  planes
  /// Fog volumes loaded from the world map.
  fogs
  /// Surface records owned by the world, model, or drawing group.
  surfaces
  /// Surface references associated with BSP leaves.
  marksurfaces
  /// Nodes and leaves of the BSP hierarchy.
  nodes
  /// Registered models or model parts available to the subsystem.
  models
  /// Potentially-visible-cluster information loaded for the world.
  visibility
  /// Entity records associated with the current world, scene, or snapshot.
  entities
  /// Cursor used to read key/value entities from the BSP entity lump.
  entityParser
  /// Baked lighting grid used to light dynamic entities.
  lightGrid
  /// Map flares and the state required to render them.
  flareCatalog
  /// Size in bytes of the loaded model or world data.
  dataSize
end struct
/// Data record for `mq3.renderer.tr_bsp_runtime.State`; groups `worldMapLoaded`, `externalVisData`, `world`, `sunDirection`.
struct State
  /// Whether the renderer has finished loading a world map.
  worldMapLoaded
  /// Visibility data shared with the renderer by another subsystem.
  externalVisData
  /// Loaded world geometry and associated scene state.
  world
  /// Direction used for the shader-defined sunlight contribution.
  sunDirection
end struct

/// Creates error `7710` with message `"tr_bsp: "+text`.
/// @param text Input used in the result expression `error(7710,"tr_bsp: "+text)`.
function fail(text) return error(7710,"tr_bsp: "+text) end function
/// Constructs `mq3.renderer.tr_bsp_runtime.State` with `worldMapLoaded` = `false`, `externalVisData` = `void`, `world` = `void`, `sunDirection` = `[3.0/7.0,2.0/7.0,6.0/7.0]`.
function createState() return State(false,void,void,[3.0/7.0,2.0/7.0,6.0/7.0]) end function
/// Returns `value` from `mq3.renderer.tr_bsp_runtime.i32`; earlier branches return `fail("truncated integer")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function i32(map,offset) value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value end function
/// Returns `n.bitsFloat(value)` from `mq3.renderer.tr_bsp_runtime.f32`; earlier branches return `fail("truncated float")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readU32`.
function f32(map,offset) value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value) end function
/// Returns `decode(slice(map.data,offset,count))` from `mq3.renderer.tr_bsp_runtime.nameAt`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `slice`.
/// @param capacity Input used by `while count<capacity and map.data[offset+count]!=0 count=count+1`.
function nameAt(map,offset,capacity) count=0;while count<capacity and map.data[offset+count]!=0 count=count+1 end while;return decode(slice(map.data,offset,count)) end function
/// Returns `value` from `mq3.renderer.tr_bsp_runtime.abs`; earlier branches return `0.0-value`.
/// @param value Input tested by `value<0.0`.
function abs(value) if value<0.0 then return 0.0-value end if;return value end function
/// Computes `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance` for `mq3.renderer.tr_bsp_runtime.nearPoint`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
/// @param tolerance Input used in the result expression `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance`.
function nearPoint(a,b,tolerance) return abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance end function
/// Returns `3` from `mq3.renderer.tr_bsp_runtime.planeType`; earlier branches return `axis`.
/// @param normal Indexed input read at `axis`.
function planeType(normal) for axis=0 to 2 if normal[axis]==1.0 then return axis end if end for;return 3 end function
/// Computes `basename` from `decode(slice(data,start,dot-start))`.
/// @param path Argument 1 supplied to `bytes`.
function basename(path)
  data=bytes(path);start=0;dot=len(data)
  for index=0 to len(data)-1
    if data[index]==47 or data[index]==92 then
      start=index+1;dot=len(data)
    else
      if data[index]==46 then dot=index end if
    end if
  end for
  if dot<start then dot=len(data) end if;return decode(slice(data,start,dot-start))
end function

// Exact tr_bsp.c six-sector HSV development-lightmap conversion.
/// @param h Input used by `scaled=h*5.0`.
/// @param s Input used by `p=v*(1.0-s)`.
/// @param v Input used by `p=v*(1.0-s)`.
function HSVtoRGB(h,s,v)
  scaled=h*5.0;i=n.trunc32(scaled);f=scaled-i;p=v*(1.0-s);q=v*(1.0-s*f);t=v*(1.0-s*(1.0-f))
  if i==0 then return [v,t,p] end if;if i==1 then return [q,v,p] end if;if i==2 then return [p,v,t] end if
  if i==3 then return [p,q,v] end if;if i==4 then return [t,p,v] end if;return [v,p,q]
end function
/// Computes `R_ColorShiftLightingBytes` from `[shifted[0],shifted[1],shifted[2],alpha]` using `mq3.renderer.bsp_render_data.colorShiftLighting`.
/// @param input Indexed input read at `0`, `1`, `2`, `3`.
/// @param shift Argument 4 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`.
function R_ColorShiftLightingBytes(input,shift)
  if input==void or len(input)<3 then return fail("lighting byte input is truncated") end if
  shifted=render.colorShiftLighting(input[0],input[1],input[2],shift);alpha=255;if len(input)>3 then alpha=input[3] end if;return [shifted[0],shifted[1],shifted[2],alpha]
end function
/// Builds `rgba[pixel*4]`, `rgba[pixel*4+1]`, `rgba[pixel*4+2]` in `mq3.renderer.tr_bsp_runtime.R_LoadLightmaps`; returns `result`.
/// @param map Record providing `map.counts`.
/// @param mapOverbrightBits Argument 3 supplied to `mq3.renderer.bsp_render_data.lightmapRgbaShift`.
/// @param rendererOverbrightBits Argument 4 supplied to `mq3.renderer.bsp_render_data.lightmapRgbaShift`.
/// @param debugIntensity Input tested by `debugIntensity`.
function R_LoadLightmaps(map,mapOverbrightBits,rendererOverbrightBits,debugIntensity)
  result=[];shift=mapOverbrightBits-rendererOverbrightBits
  for index=0 to map.counts[14]-1
    if debugIntensity then
      rgb=render.lightmapRgb(map,index);rgba=bytes(65536,255)
      for pixel=0 to 16383 r=rgb[pixel*3];g=rgb[pixel*3+1];b=rgb[pixel*3+2];intensity=(0.33*r+0.685*g+0.063*b)/255.0;if intensity>1.0 then intensity=1.0 end if;color=HSVtoRGB(intensity,1.0,0.5);rgba[pixel*4]=n.trunc32(color[0]*255.0);rgba[pixel*4+1]=n.trunc32(color[1]*255.0);rgba[pixel*4+2]=n.trunc32(color[2]*255.0) end for
      result=result+[rgba]
    else value=render.lightmapRgbaShift(map,index,mapOverbrightBits,rendererOverbrightBits);if value is error then return value end if;result=result+[value] end if
  end for
  // Preserve the original one-lightmap allocation workaround without reading
  // beyond the lump: the second handle aliases the same immutable pixels.
  if len(result)==1 then result=result+[result[0]] end if;return result
end function

/// Updates `state.externalVisData` in `mq3.renderer.tr_bsp_runtime.RE_SetWorldVisData`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.externalVisData`.
/// @param vis Value assigned to `state.externalVisData`.
function RE_SetWorldVisData(state,vis) if state==void then return fail("renderer state is required") end if;state.externalVisData=vis;return true end function
/// Builds `mq3.renderer.tr_bsp_runtime.Visibility` for `mq3.renderer.tr_bsp_runtime.R_LoadVisibility`.
/// @param map Record providing `map.lengths`, `map.offsets`, `map.data`.
/// @param numClusters Initial value for `mq3.renderer.tr_bsp_runtime.Visibility.numClusters`.
/// @param externalVisData Input used by `data=externalVisData`.
function R_LoadVisibility(map,numClusters,externalVisData)
  count=(numClusters+63)&~63;novis=bytes(count,255)
  if map.lengths[16]==0 then return Visibility(numClusters,0,void,novis,false) end if
  clusters=i32(map,map.offsets[16]);rowBytes=i32(map,map.offsets[16]+4);data=externalVisData;external=data!=void;if data==void then data=slice(map.data,map.offsets[16]+8,map.lengths[16]-8) end if
  return Visibility(clusters,rowBytes,data,novis,external)
end function

/// Returns `values` from `mq3.renderer.tr_bsp_runtime.R_LoadShaders`.
/// @param map Record providing `map.counts`, `map.offsets`.
function R_LoadShaders(map)
  values=[]
  for index=0 to map.counts[1]-1 offset=map.offsets[1]+index*72;values=values+[Shader(nameAt(map,offset,64),i32(map,offset+64),i32(map,offset+68),LIGHTMAP_NONE,false)] end for
  return values
end function
/// Builds `mq3.renderer.tr_bsp_runtime.Shader` for `mq3.renderer.tr_bsp_runtime.ShaderForShaderNum`.
/// @param world Record providing `world.shaders`.
/// @param shaderNum Input tested by `world==void or shaderNum<0 or shaderNum>=len(world.shaders)`.
/// @param lightmapNum Initial value for `mq3.renderer.tr_bsp_runtime.Shader.lightmapIndex`.
function ShaderForShaderNum(world,shaderNum,lightmapNum)
  if world==void or shaderNum<0 or shaderNum>=len(world.shaders) then return fail("bad shader number") end if
  value=world.shaders[shaderNum];return Shader(value.name,value.surfaceFlags,value.contentFlags,lightmapNum,value.defaultShader)
end function

/// Returns `[i32(world.map,offset),i32(world.map,offset+4)+1,i32(world.map,offset+8)]` from `mq3.renderer.tr_bsp_runtime.surfaceInfo`; earlier branches return `fail("surface index outside BSP")`.
/// @param world Record providing `world.map`.
/// @param index Input tested by `index<0 or index>=world.map.counts[13]`.
function surfaceInfo(world,index)
  if index<0 or index>=world.map.counts[13] then return fail("surface index outside BSP") end if
  offset=world.map.offsets[13]+index*104;return [i32(world.map,offset),i32(world.map,offset+4)+1,i32(world.map,offset+8)]
end function
/// Builds `mq3.renderer.tr_bsp_runtime.Surface` using `mq3.renderer.bsp_render_data.extractWithPatchError`.
/// @param world Record providing `world.map`.
/// @param index Initial value for `mq3.renderer.tr_bsp_runtime.Surface.index`.
/// @param expectedKind Input tested by `info[2]!=expectedKind`.
/// @param lightmapOverride Input used by `lightmap=lightmapOverride`.
function parseGeometry(world,index,expectedKind,lightmapOverride)
  info=surfaceInfo(world,index);if info is error then return info end if;if info[2]!=expectedKind then return fail("surface type mismatch") end if
  data=render.extractWithPatchError(world.map,[index],2147483647,render.DEFAULT_PATCH_ERROR);if data is error then return data end if
  lightmap=lightmapOverride;if lightmap==void then lightmap=i32(world.map,world.map.offsets[13]+index*104+28) end if
  shader=ShaderForShaderNum(world,info[0],lightmap);if shader is error then return shader end if;return Surface(index,info[2],shader,info[1],data,void)
end function
/// Calls `mq3.renderer.tr_bsp_runtime.parseGeometry` with `(world,index,MST_PLANAR,void)` and returns its result.
/// @param world Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.parseGeometry`.
/// @param index Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.parseGeometry`.
function ParseFace(world,index) return parseGeometry(world,index,MST_PLANAR,void) end function
/// Calls `mq3.renderer.tr_bsp_runtime.parseGeometry` with `(world,index,MST_PATCH,void)` and returns its result.
/// @param world Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.parseGeometry`.
/// @param index Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.parseGeometry`.
function ParseMesh(world,index) return parseGeometry(world,index,MST_PATCH,void) end function
/// Calls `mq3.renderer.tr_bsp_runtime.parseGeometry` with `(world,index,MST_TRIANGLE_SOUP,LIGHTMAP_BY_VERTEX)` and returns its result.
/// @param world Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.parseGeometry`.
/// @param index Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.parseGeometry`.
function ParseTriSurf(world,index) return parseGeometry(world,index,MST_TRIANGLE_SOUP,LIGHTMAP_BY_VERTEX) end function
/// Builds `mq3.renderer.tr_bsp_runtime.Surface` using `mq3.renderer.playable_flares.parse`.
/// @param world Record providing `world.map`.
/// @param index Initial value for `mq3.renderer.tr_bsp_runtime.Surface.index`.
function ParseFlare(world,index)
  info=surfaceInfo(world,index);if info is error then return info end if;if info[2]!=MST_FLARE then return fail("surface type mismatch") end if
  flares=playableFlares.parse(world.map);if flares is error then return flares end if;value=void;for each candidate in flares if candidate.faceIndex==index then value=candidate;break end if end for;if value==void then return fail("flare not retained") end if
  shader=ShaderForShaderNum(world,info[0],LIGHTMAP_BY_VERTEX);return Surface(index,MST_FLARE,shader,info[1],void,value)
end function
/// Calls `mq3.renderer.tr_bsp_runtime.ParseMesh` with `(world,index)` and returns its result.
/// @param world Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.ParseMesh`.
/// @param index Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.ParseMesh`.
function patch(world,index) return ParseMesh(world,index) end function
/// Decodes every BSP surface by planar, patch, triangle-soup, or flare type and rejects unknown kinds.
/// @param world Record providing `world.map`.
function R_LoadSurfaces(world)
  result=[]
  for index=0 to world.map.counts[13]-1
    kind=i32(world.map,world.map.offsets[13]+index*104+8);value=void
    if kind==MST_PLANAR then
      value=ParseFace(world,index)
    else if kind==MST_PATCH then
      value=ParseMesh(world,index)
    else if kind==MST_TRIANGLE_SOUP then
      value=ParseTriSurf(world,index)
    else if kind==MST_FLARE then
      value=ParseFlare(world,index)
    else
      return fail("bad surface type")
    end if
    if value is error then return value end if;result=result+[value]
  end for
  return result
end function

/// Loads BSP plane normals/distances and derives axial plane types and normal sign bits.
/// @param map Record providing `map.counts`, `map.offsets`.
function R_LoadPlanes(map)
  result=[]
  for index=0 to map.counts[2]-1 offset=map.offsets[2]+index*16;normal=[f32(map,offset),f32(map,offset+4),f32(map,offset+8)];bits=0;for axis=0 to 2 if normal[axis]<0.0 then bits=bits|(1<<axis) end if end for;result=result+[Plane(normal,f32(map,offset+12),planeType(normal),bits)] end for
  return result
end function
/// Returns `result` from `mq3.renderer.tr_bsp_runtime.R_LoadMarksurfaces`; earlier branches return `fail("marksurface outside surface array")`.
/// @param map Record providing `map.counts`, `map.offsets`.
function R_LoadMarksurfaces(map)
  result=[];for index=0 to map.counts[5]-1 value=i32(map,map.offsets[5]+index*4);if value<0 or value>=map.counts[13] then return fail("marksurface outside surface array") end if;result=result+[value] end for;return result
end function
/// Builds `node.parent` in `mq3.renderer.tr_bsp_runtime.R_SetParent`; returns `R_SetParent(nodes,node.children[1],index)`.
/// @param nodes Value forwarded as `nodes` to `mq3.renderer.tr_bsp_runtime.R_SetParent`.
/// @param index Value forwarded as `parent` to `mq3.renderer.tr_bsp_runtime.R_SetParent`.
/// @param parent Value assigned to `node.parent`.
function R_SetParent(nodes,index,parent)
  if index<0 or index>=len(nodes) then return fail("node outside tree") end if;node=nodes[index];node.parent=parent;if node.contents!=CONTENTS_NODE then return true end if
  left=R_SetParent(nodes,node.children[0],index);if left is error then return left end if;return R_SetParent(nodes,node.children[1],index)
end function
/// Builds one indexed BSP node/leaf array and converts negative child encodings into leaf indices.
/// @param map Record providing `map.counts`, `map.offsets`.
function R_LoadNodesAndLeafs(map)
  nodes=[];decisionCount=map.counts[3]
  for index=0 to decisionCount-1 offset=map.offsets[3]+index*36;plane=i32(map,offset);children=[];for side=0 to 1 raw=i32(map,offset+4+side*4);if raw<0 then raw=decisionCount+(-1-raw) end if;children=children+[raw] end for;mins=[i32(map,offset+12),i32(map,offset+16),i32(map,offset+20)];maxs=[i32(map,offset+24),i32(map,offset+28),i32(map,offset+32)];nodes=nodes+[Node(index,plane,children,mins,maxs,-1,CONTENTS_NODE,-1,-1,0,0)] end for
  for leaf=0 to map.counts[4]-1 offset=map.offsets[4]+leaf*48;mins=[i32(map,offset+8),i32(map,offset+12),i32(map,offset+16)];maxs=[i32(map,offset+20),i32(map,offset+24),i32(map,offset+28)];nodes=nodes+[Node(decisionCount+leaf,-1,[],mins,maxs,-1,0,i32(map,offset),i32(map,offset+4),i32(map,offset+32),i32(map,offset+36))] end for
  if len(nodes)>0 then value=R_SetParent(nodes,0,-1);if value is error then return value end if end if;return nodes
end function
/// Loads inline brush-model geometry and associates each submodel with its BSP surface range and bounds.
/// @param world Record providing `world.map`.
function R_LoadSubmodels(world)
  result=[]
  for index=0 to world.map.counts[7]-1 offset=world.map.offsets[7]+index*40;first=i32(world.map,offset+24);count=i32(world.map,offset+28);wrapped=sceneGeometry.loadInlineModel(world.map,index,2147483647);if wrapped is error then return wrapped end if;model=wrapped[0];result=result+[Model(index,"*"+str(index),model.bounds,first,count,model.renderData)] end for
  return result
end function
/// Computes `R_LoadFogs` from `playableFog.load(map,shaderIndex)` using `mq3.renderer.playable_fog.Catalog`, `mq3.renderer.playable_fog.textureImage`, `mq3.renderer.playable_fog.load`.
/// @param map Record providing `map.counts`.
/// @param shaderIndex Argument 2 supplied to `mq3.renderer.playable_fog.load`.
function R_LoadFogs(map,shaderIndex) if map.counts[12]==0 then return playableFog.Catalog([void],-1,playableFog.textureImage()) end if;if shaderIndex==void then return fail("fog shaders require a parsed shader index") end if;return playableFog.load(map,shaderIndex) end function
/// Calls `mq3.renderer.playable_light_grid.load` with `(map)` and returns its result.
/// @param map Argument 1 supplied to `mq3.renderer.playable_light_grid.load`.
function R_LoadLightGrid(map) return lightGrid.load(map) end function

/// Updates `world.entities`, `world.entityParser` in `mq3.renderer.tr_bsp_runtime.R_LoadEntities`; returns `lightGrid.worldGridSize(world.map)`.
/// @param world Mutable record or buffer; this call updates `world.entities`, `world.entityParser`.
function R_LoadEntities(world)
  raw=slice(world.map.data,world.map.offsets[0],world.map.lengths[0]);world.entities=decode(raw);world.entityParser=parser.create(raw);return lightGrid.worldGridSize(world.map)
end function
/// Updates `world.entityParser` in `mq3.renderer.tr_bsp_runtime.R_GetEntityToken`; returns `[true,decode(data)]`.
/// @param world Mutable record or buffer; this call updates `world.entityParser`.
/// @param size Input tested by `world==void or world.entityParser==void or size<=0`.
function R_GetEntityToken(world,size)
  if world==void or world.entityParser==void or size<=0 then return [false,""] end if;value=parser.parseExt(world.entityParser,true)
  if value=="" then world.entityParser=parser.create(bytes(world.entities));return [false,""] end if;data=bytes(value);if len(data)>=size then data=slice(data,0,size-1) end if;return [true,decode(data)]
end function

/// Computes `a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin` for `mq3.renderer.tr_bsp_runtime.sameLodGroup`.
/// @param a Record providing `a.lodRadius`, `a.lodOrigin`.
/// @param b Record providing `b.lodRadius`, `b.lodOrigin`.
function sameLodGroup(a,b) return a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin end function
/// Returns `false` from `mq3.renderer.tr_bsp_runtime.R_MergedWidthPoints`; earlier branches return `true`.
/// @param grid Record providing `grid.width`, `grid.control`.
/// @param offset Input used by `while j<grid.width-1 if nearPoint(grid.control[offset+i].position,grid.control[offset+j].position,0.1) then return true`.
function R_MergedWidthPoints(grid,offset)
  i=1;while i<grid.width-1 j=i+1;while j<grid.width-1 if nearPoint(grid.control[offset+i].position,grid.control[offset+j].position,0.1) then return true end if;j=j+1 end while;i=i+1 end while;return false
end function
/// Detects nearly coincident interior points along one patch-grid column using a 0.1-unit tolerance.
/// @param grid Record providing `grid.height`, `grid.control`, `grid.width`.
/// @param offset Input used by `while j<grid.height-1 if nearPoint(grid.control[offset+i*grid.width].position,grid.control[offset+j*grid.width].position,0.1) then return true`.
function R_MergedHeightPoints(grid,offset)
  i=1;while i<grid.height-1 j=i+1;while j<grid.height-1 if nearPoint(grid.control[offset+i*grid.width].position,grid.control[offset+j*grid.width].position,0.1) then return true end if;j=j+1 end while;i=i+1 end while;return false
end function
/// Calls `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r` with `(grids,start,grid)` and returns its result.
/// @param grids Argument 1 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`.
/// @param start Argument 2 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`.
/// @param grid Argument 3 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`.
function R_FixSharedVertexLodError_r(grids,start,grid) return patchStitch.R_FixSharedVertexLodError_r(grids,start,grid) end function
/// Calls `mq3.renderer.patch_stitch.R_FixSharedVertexLodError` with `(grids)` and returns its result.
/// @param grids Argument 1 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError`.
function R_FixSharedVertexLodError(grids) return patchStitch.R_FixSharedVertexLodError(grids) end function
/// Calls `mq3.renderer.patch_stitch.R_StitchPatches` with `(grid1,grid2)` and returns its result.
/// @param grid1 Argument 1 supplied to `mq3.renderer.patch_stitch.R_StitchPatches`.
/// @param grid2 Argument 2 supplied to `mq3.renderer.patch_stitch.R_StitchPatches`.
function R_StitchPatches(grid1,grid2) return patchStitch.R_StitchPatches(grid1,grid2) end function
/// Calls `mq3.renderer.patch_stitch.R_StitchAllPatches` with `(grids)` and returns its result.
/// @param grids Argument 1 supplied to `mq3.renderer.patch_stitch.R_StitchAllPatches`.
function R_StitchAllPatches(grids) return patchStitch.R_StitchAllPatches(grids) end function
/// Returns `result` from `mq3.renderer.tr_bsp_runtime.R_MovePatchSurfacesToHunk`.
/// @param grids Sequence traversed as `grid` while producing this result.
function R_MovePatchSurfacesToHunk(grids) result=[];for each grid in grids result=result+[Grid(grid.control,grid.width,grid.height,grid.widthLodError,grid.heightLodError,grid.lodOrigin,grid.lodRadius,grid.lodFixed,grid.lodStitched)] end for;return result end function

/// Updates `state.worldMapLoaded`, `state.world` in `mq3.renderer.tr_bsp_runtime.RE_LoadWorldMap`; returns `world`.
/// @param state Mutable record or buffer; this call updates `state.worldMapLoaded`, `state.world`.
/// @param name Argument 1 supplied to `std.fs.readAllBytes`.
/// @param data Argument 1 supplied to `mq3.format.bsp.load`.
/// @param shaderIndex Value forwarded as `shaderIndex` to `mq3.renderer.tr_bsp_runtime.R_LoadFogs`.
function RE_LoadWorldMap(state,name,data,shaderIndex)
  if state==void then return fail("renderer state is required") end if;if state.worldMapLoaded then return fail("attempted to redundantly load world map") end if;if data==void then data=fs.readAllBytes(name) end if;map=bsp.load(data);if map is error then return map end if
  world=World(name,basename(name),map,[],[],[],void,[],[],[],[],void,"",void,void,void,len(data));world.shaders=R_LoadShaders(map);world.lightmaps=R_LoadLightmaps(map,2,0,false);world.planes=R_LoadPlanes(map);world.fogs=R_LoadFogs(map,shaderIndex);if world.fogs is error then return world.fogs end if;world.surfaces=R_LoadSurfaces(world);if world.surfaces is error then return world.surfaces end if;world.marksurfaces=R_LoadMarksurfaces(map);world.nodes=R_LoadNodesAndLeafs(map);world.models=R_LoadSubmodels(world)
  clusters=0;for each node in world.nodes if node.contents!=CONTENTS_NODE and node.cluster>=clusters then clusters=node.cluster+1 end if end for;world.visibility=R_LoadVisibility(map,clusters,state.externalVisData);R_LoadEntities(world);world.lightGrid=R_LoadLightGrid(map);world.flareCatalog=playableFlares.parse(map)
  state.worldMapLoaded=true;state.world=world;return world
end function
