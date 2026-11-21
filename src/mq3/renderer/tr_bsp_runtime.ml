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

const MST_PLANAR=1
const MST_PATCH=2
const MST_TRIANGLE_SOUP=3
const MST_FLARE=4
const CONTENTS_NODE=-1
const LIGHTMAP_BY_VERTEX=-3
const LIGHTMAP_WHITEIMAGE=-2
const LIGHTMAP_NONE=-1
const MAX_GRID_SIZE=65

struct Shader name surfaceFlags contentFlags lightmapIndex defaultShader end struct
struct Plane normal dist type signbits end struct
struct Surface index kind shader fogIndex data flare end struct
struct Model index name bounds firstSurface numSurfaces renderData end struct
struct Node index planeIndex children mins maxs parent contents cluster area firstMarkSurface numMarkSurfaces end struct
struct Visibility numClusters clusterBytes data novis external end struct
struct Grid control width height widthLodError heightLodError lodOrigin lodRadius lodFixed lodStitched end struct
struct World name baseName map shaders lightmaps planes fogs surfaces marksurfaces nodes models visibility entities entityParser lightGrid flareCatalog dataSize end struct
struct State worldMapLoaded externalVisData world sunDirection end struct

function fail(text) return error(7710,"tr_bsp: "+text) end function
function createState() return State(false,void,void,[3.0/7.0,2.0/7.0,6.0/7.0]) end function
function i32(map,offset) value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value end function
function f32(map,offset) value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value) end function
function nameAt(map,offset,capacity) count=0;while count<capacity and map.data[offset+count]!=0 count=count+1 end while;return decode(slice(map.data,offset,count)) end function
function abs(value) if value<0.0 then return 0.0-value end if;return value end function
function nearPoint(a,b,tolerance) return abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance end function
function planeType(normal) for axis=0 to 2 if normal[axis]==1.0 then return axis end if end for;return 3 end function
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
function HSVtoRGB(h,s,v)
  scaled=h*5.0;i=n.trunc32(scaled);f=scaled-i;p=v*(1.0-s);q=v*(1.0-s*f);t=v*(1.0-s*(1.0-f))
  if i==0 then return [v,t,p] end if;if i==1 then return [q,v,p] end if;if i==2 then return [p,v,t] end if
  if i==3 then return [p,q,v] end if;if i==4 then return [t,p,v] end if;return [v,p,q]
end function
function R_ColorShiftLightingBytes(input,shift)
  if input==void or len(input)<3 then return fail("lighting byte input is truncated") end if
  shifted=render.colorShiftLighting(input[0],input[1],input[2],shift);alpha=255;if len(input)>3 then alpha=input[3] end if;return [shifted[0],shifted[1],shifted[2],alpha]
end function
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

function RE_SetWorldVisData(state,vis) if state==void then return fail("renderer state is required") end if;state.externalVisData=vis;return true end function
function R_LoadVisibility(map,numClusters,externalVisData)
  count=(numClusters+63)&~63;novis=bytes(count,255)
  if map.lengths[16]==0 then return Visibility(numClusters,0,void,novis,false) end if
  clusters=i32(map,map.offsets[16]);rowBytes=i32(map,map.offsets[16]+4);data=externalVisData;external=data!=void;if data==void then data=slice(map.data,map.offsets[16]+8,map.lengths[16]-8) end if
  return Visibility(clusters,rowBytes,data,novis,external)
end function

function R_LoadShaders(map)
  values=[]
  for index=0 to map.counts[1]-1 offset=map.offsets[1]+index*72;values=values+[Shader(nameAt(map,offset,64),i32(map,offset+64),i32(map,offset+68),LIGHTMAP_NONE,false)] end for
  return values
end function
function ShaderForShaderNum(world,shaderNum,lightmapNum)
  if world==void or shaderNum<0 or shaderNum>=len(world.shaders) then return fail("bad shader number") end if
  value=world.shaders[shaderNum];return Shader(value.name,value.surfaceFlags,value.contentFlags,lightmapNum,value.defaultShader)
end function

function surfaceInfo(world,index)
  if index<0 or index>=world.map.counts[13] then return fail("surface index outside BSP") end if
  offset=world.map.offsets[13]+index*104;return [i32(world.map,offset),i32(world.map,offset+4)+1,i32(world.map,offset+8)]
end function
function parseGeometry(world,index,expectedKind,lightmapOverride)
  info=surfaceInfo(world,index);if info is error then return info end if;if info[2]!=expectedKind then return fail("surface type mismatch") end if
  data=render.extractWithPatchError(world.map,[index],2147483647,render.DEFAULT_PATCH_ERROR);if data is error then return data end if
  lightmap=lightmapOverride;if lightmap==void then lightmap=i32(world.map,world.map.offsets[13]+index*104+28) end if
  shader=ShaderForShaderNum(world,info[0],lightmap);if shader is error then return shader end if;return Surface(index,info[2],shader,info[1],data,void)
end function
function ParseFace(world,index) return parseGeometry(world,index,MST_PLANAR,void) end function
function ParseMesh(world,index) return parseGeometry(world,index,MST_PATCH,void) end function
function ParseTriSurf(world,index) return parseGeometry(world,index,MST_TRIANGLE_SOUP,LIGHTMAP_BY_VERTEX) end function
function ParseFlare(world,index)
  info=surfaceInfo(world,index);if info is error then return info end if;if info[2]!=MST_FLARE then return fail("surface type mismatch") end if
  flares=playableFlares.parse(world.map);if flares is error then return flares end if;value=void;for each candidate in flares if candidate.faceIndex==index then value=candidate;break end if end for;if value==void then return fail("flare not retained") end if
  shader=ShaderForShaderNum(world,info[0],LIGHTMAP_BY_VERTEX);return Surface(index,MST_FLARE,shader,info[1],void,value)
end function
function patch(world,index) return ParseMesh(world,index) end function
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

function R_LoadPlanes(map)
  result=[]
  for index=0 to map.counts[2]-1 offset=map.offsets[2]+index*16;normal=[f32(map,offset),f32(map,offset+4),f32(map,offset+8)];bits=0;for axis=0 to 2 if normal[axis]<0.0 then bits=bits|(1<<axis) end if end for;result=result+[Plane(normal,f32(map,offset+12),planeType(normal),bits)] end for
  return result
end function
function R_LoadMarksurfaces(map)
  result=[];for index=0 to map.counts[5]-1 value=i32(map,map.offsets[5]+index*4);if value<0 or value>=map.counts[13] then return fail("marksurface outside surface array") end if;result=result+[value] end for;return result
end function
function R_SetParent(nodes,index,parent)
  if index<0 or index>=len(nodes) then return fail("node outside tree") end if;node=nodes[index];node.parent=parent;if node.contents!=CONTENTS_NODE then return true end if
  left=R_SetParent(nodes,node.children[0],index);if left is error then return left end if;return R_SetParent(nodes,node.children[1],index)
end function
function R_LoadNodesAndLeafs(map)
  nodes=[];decisionCount=map.counts[3]
  for index=0 to decisionCount-1 offset=map.offsets[3]+index*36;plane=i32(map,offset);children=[];for side=0 to 1 raw=i32(map,offset+4+side*4);if raw<0 then raw=decisionCount+(-1-raw) end if;children=children+[raw] end for;mins=[i32(map,offset+12),i32(map,offset+16),i32(map,offset+20)];maxs=[i32(map,offset+24),i32(map,offset+28),i32(map,offset+32)];nodes=nodes+[Node(index,plane,children,mins,maxs,-1,CONTENTS_NODE,-1,-1,0,0)] end for
  for leaf=0 to map.counts[4]-1 offset=map.offsets[4]+leaf*48;mins=[i32(map,offset+8),i32(map,offset+12),i32(map,offset+16)];maxs=[i32(map,offset+20),i32(map,offset+24),i32(map,offset+28)];nodes=nodes+[Node(decisionCount+leaf,-1,[],mins,maxs,-1,0,i32(map,offset),i32(map,offset+4),i32(map,offset+32),i32(map,offset+36))] end for
  if len(nodes)>0 then value=R_SetParent(nodes,0,-1);if value is error then return value end if end if;return nodes
end function
function R_LoadSubmodels(world)
  result=[]
  for index=0 to world.map.counts[7]-1 offset=world.map.offsets[7]+index*40;first=i32(world.map,offset+24);count=i32(world.map,offset+28);wrapped=sceneGeometry.loadInlineModel(world.map,index,2147483647);if wrapped is error then return wrapped end if;model=wrapped[0];result=result+[Model(index,"*"+str(index),model.bounds,first,count,model.renderData)] end for
  return result
end function
function R_LoadFogs(map,shaderIndex) if map.counts[12]==0 then return playableFog.Catalog([void],-1,playableFog.textureImage()) end if;if shaderIndex==void then return fail("fog shaders require a parsed shader index") end if;return playableFog.load(map,shaderIndex) end function
function R_LoadLightGrid(map) return lightGrid.load(map) end function

function R_LoadEntities(world)
  raw=slice(world.map.data,world.map.offsets[0],world.map.lengths[0]);world.entities=decode(raw);world.entityParser=parser.create(raw);return lightGrid.worldGridSize(world.map)
end function
function R_GetEntityToken(world,size)
  if world==void or world.entityParser==void or size<=0 then return [false,""] end if;value=parser.parseExt(world.entityParser,true)
  if value=="" then world.entityParser=parser.create(bytes(world.entities));return [false,""] end if;data=bytes(value);if len(data)>=size then data=slice(data,0,size-1) end if;return [true,decode(data)]
end function

function sameLodGroup(a,b) return a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin end function
function R_MergedWidthPoints(grid,offset)
  i=1;while i<grid.width-1 j=i+1;while j<grid.width-1 if nearPoint(grid.control[offset+i].position,grid.control[offset+j].position,0.1) then return true end if;j=j+1 end while;i=i+1 end while;return false
end function
function R_MergedHeightPoints(grid,offset)
  i=1;while i<grid.height-1 j=i+1;while j<grid.height-1 if nearPoint(grid.control[offset+i*grid.width].position,grid.control[offset+j*grid.width].position,0.1) then return true end if;j=j+1 end while;i=i+1 end while;return false
end function
function R_FixSharedVertexLodError_r(grids,start,grid) return patchStitch.R_FixSharedVertexLodError_r(grids,start,grid) end function
function R_FixSharedVertexLodError(grids) return patchStitch.R_FixSharedVertexLodError(grids) end function
function R_StitchPatches(grid1,grid2) return patchStitch.R_StitchPatches(grid1,grid2) end function
function R_StitchAllPatches(grids) return patchStitch.R_StitchAllPatches(grids) end function
function R_MovePatchSurfacesToHunk(grids) result=[];for each grid in grids result=result+[Grid(grid.control,grid.width,grid.height,grid.widthLodError,grid.heightLodError,grid.lodOrigin,grid.lodRadius,grid.lodFixed,grid.lodStitched)] end for;return result end function

function RE_LoadWorldMap(state,name,data,shaderIndex)
  if state==void then return fail("renderer state is required") end if;if state.worldMapLoaded then return fail("attempted to redundantly load world map") end if;if data==void then data=fs.readAllBytes(name) end if;map=bsp.load(data);if map is error then return map end if
  world=World(name,basename(name),map,[],[],[],void,[],[],[],[],void,"",void,void,void,len(data));world.shaders=R_LoadShaders(map);world.lightmaps=R_LoadLightmaps(map,2,0,false);world.planes=R_LoadPlanes(map);world.fogs=R_LoadFogs(map,shaderIndex);if world.fogs is error then return world.fogs end if;world.surfaces=R_LoadSurfaces(world);if world.surfaces is error then return world.surfaces end if;world.marksurfaces=R_LoadMarksurfaces(map);world.nodes=R_LoadNodesAndLeafs(map);world.models=R_LoadSubmodels(world)
  clusters=0;for each node in world.nodes if node.contents!=CONTENTS_NODE and node.cluster>=clusters then clusters=node.cluster+1 end if end for;world.visibility=R_LoadVisibility(map,clusters,state.externalVisData);R_LoadEntities(world);world.lightGrid=R_LoadLightGrid(map);world.flareCatalog=playableFlares.parse(map)
  state.worldMapLoaded=true;state.world=world;return world
end function
