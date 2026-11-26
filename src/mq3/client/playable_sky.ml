// SPDX-License-Identifier: GPL-2.0-or-later
// Retail cloud skies resolved from each BSP shader for the software preview.
package mq3.client.playable_sky

import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_window as window
import mq3.shared.math as qmath
import mq3.compat.transcendental as trans
import mq3.renderer.shader_parser as shaderParser
import std.string as strings

/// Stores one finite sky source vertex as four native doubles in a 32-byte record after checking its destination range. This binding is used by playable sky.
/// @param source Writable byte-buffer pointer receiving 32-byte double-precision source vertices.
/// @param capacity Available destination buffer size in bytes.
/// @param index Zero-based source-vertex index; (index + 1) times 32 must fit in capacity.
/// @param x Finite projected X coordinate stored as a double.
/// @param y Finite projected Y coordinate stored as a double.
/// @param u Finite base U texture coordinate stored as a double.
/// @param v Finite base V texture coordinate stored as a double.
/// @returns One when the vertex is stored; zero for null storage, negative/out-of-range indices or nonfinite coordinates.
extern function storeSkyVertexNative(source as ptr,capacity as i32,index as i32,x as double,y as double,u as double,v as double) from "playable_window.dll" symbol "playable_window_store_sky_vertex" returns i32
/// Expands a retained sky grid into 128-byte triangle records with scaled UVs and time-based scrolling. This binding is used by playable sky.
/// @param records Writable native triangle-buffer pointer; each output record occupies 128 bytes.
/// @param capacity Destination triangle-buffer size in bytes, including records before firstTriangle.
/// @param firstTriangle Zero-based triangle-record offset at which this layer is written.
/// @param source Read-only grid of 32-byte source vertices ordered by row, with columns + 1 vertices in each row.
/// @param sourceBytes Source-buffer size in bytes; it must hold (columns + 1) times (rows + 1) source vertices.
/// @param columns Number of grid cells per row, from one through 256.
/// @param rows Number of grid-cell rows, from one through 256.
/// @param slot Base texture slot written to every generated triangle.
/// @param scaleU Finite multiplier applied to each source U coordinate.
/// @param scaleV Finite multiplier applied to each source V coordinate.
/// @param scrollU Finite U scrolling rate in texture-coordinate units per second.
/// @param scrollV Finite V scrolling rate in texture-coordinate units per second.
/// @param nowMilliseconds Finite, nonnegative time in milliseconds; converted to seconds for the scrolling offset.
/// @param depth Finite positive projected depth written into each triangle vertex.
/// @returns Twice columns times rows on success; zero for invalid dimensions, nonfinite parameters or insufficient buffers.
extern function updateSkyLayerNative(records as ptr,capacity as i32,firstTriangle as i32,source as ptr,sourceBytes as i32,columns as i32,rows as i32,slot as i32,scaleU as double,scaleV as double,scrollU as double,scrollV as double,nowMilliseconds as double,depth as double) from "playable_window.dll" symbol "playable_window_update_sky_layer" returns i32
/// Draws a retained sky triangle range with optional ONE/ONE additive blending, then restores the previous raster-state settings. This binding is used by playable sky.
/// @param records Read-only byte-buffer pointer containing 128-byte native triangle records.
/// @param capacity Total available record-buffer size in bytes.
/// @param firstTriangle Zero-based index of the first triangle to draw.
/// @param triangleCount Number of triangles to draw, from one through 65,536, within the supplied buffer.
/// @param additive Zero for ordinary blending or one for the sky shader ONE/ONE additive blend mode.
/// @returns The underlying triangle-batch draw result; zero when the range or blend selector is invalid.
extern function drawSkyLayerNative(records as ptr,capacity as i32,firstTriangle as i32,triangleCount as i32,additive as i32) from "playable_window.dll" symbol "playable_window_draw_sky_layer" returns i32
/// Computes an inverse cosine through the Windows C runtime for sky texture-coordinate construction. This binding is used by playable sky.
/// @param value Cosine value in the mathematical domain minus one through one.
/// @returns The principal arc cosine in radians for a valid argument in the range minus one through one.
extern function acos(value as double) from "ucrtbase.dll" returns double

/// Virtual shader name selected for this module's background surface.
const SHADER_NAME="textures/skies/tim_hell"
/// Number of texture slots required by the module's fixed media layout.
const REQUIRED_TEXTURES=2
/// Number of horizontal cells used to tessellate the native sky layer.
const GRID_COLUMNS=12
/// Number of vertical cells used to tessellate the native sky layer.
const GRID_ROWS=8
/// Depth value used to place the native sky layer behind world geometry.
const SKY_DEPTH=1000000.0
/// Capacity limit for the cached views collection or bounded storage used by this client module.
const MAX_CACHED_VIEWS=8
/// Byte count used when storing or marshalling the source vertex data.
const SOURCE_VERTEX_BYTES=32

/// Stores playable sky layer record, including `imageName`, `image`, `slot`, `scaleU`, `scaleV`, `scrollU` and additional values.
struct Layer
  /// Resolved image path for this textured sky layer.
  imageName
  /// When constructing this record, `layerFromStage` supplies `image` for this member. Used by `upload`
  /// during subsequent processing.
  image
  /// Texture or media-cache slot assigned to this asset for renderer submission.
  slot
  /// When constructing this record, `layerFromStage` supplies `scaleU` for this member. Used by
  /// `vertex` and `mappedVertex` during subsequent processing.
  scaleU
  /// When constructing this record, `layerFromStage` supplies `scaleV` for this member. Used by
  /// `vertex` and `mappedVertex` during subsequent processing.
  scaleV
  /// When constructing this record, `layerFromStage` supplies `scrollU` for this member. Used by
  /// `vertex` and `mappedVertex` during subsequent processing.
  scrollU
  /// When constructing this record, `layerFromStage` supplies `scrollV` for this member. Used by
  /// `vertex` and `mappedVertex` during subsequent processing.
  scrollV
  /// When constructing this record, `layerFromStage` supplies `additive` for this member.
  additive
end struct
/// Stores playable sky catalog record, including `layers`, `firstTextureSlot`, `textureCount`, `shaderName`, `cloudHeight`, `cache`.
struct Catalog
  /// When constructing this record, `loadIndexed` supplies `layers` for this member. Used by `upload`
  /// and `release` during subsequent processing.
  layers
  /// First texture-cache slot reserved for this module's media resources.
  firstTextureSlot
  /// Number of texture resources or texture-cache slots represented by this media record.
  textureCount
  /// Virtual shader name used to register or resolve the displayed resource.
  shaderName
  /// When constructing this record, `loadIndexed` supplies `parsed.cloudHeight` for this member. Used
  /// by `buildBatchPrepared` and `retainedBatchPrepared` during subsequent processing.
  cloudHeight
  /// When constructing this record, `loadIndexed` supplies an absent (`void`) value for this member.
  /// Used by `release` and `retainedBatchPrepared` during subsequent processing.
  cache
end struct
/// Stores playable sky vertex record, including `point`, `uv`.
struct Vertex
  /// When constructing this record, `vertex` supplies `viewer.ScreenPoint(x,y,depth)` for this member.
  /// Used by `retainedBatchPrepared` during subsequent processing.
  point
  /// When constructing this record, `vertex` supplies `mapped` for this member. Used by
  /// `retainedBatchPrepared` during subsequent processing.
  uv
end struct
/// Stores playable sky cached view record, including `basis`, `left`, `top`, `width`, `height`, `source` and additional values.
struct CachedView
  /// When constructing this record, `retainedBatchPrepared` supplies `copyBasis(basis)` for this
  /// member.
  basis
  /// Left boundary of the interactive or clipped region.
  left
  /// Top boundary of the interactive or clipped region.
  top
  /// Pixel width of the sky viewport for which this projected-geometry cache was built.
  width
  /// Pixel height of the sky viewport for which this projected-geometry cache was built.
  height
  /// When constructing this record, `retainedBatchPrepared` supplies
  /// `bytes(len(grid)*SOURCE_VERTEX_BYTES,0)` for this member.
  source
  /// When constructing this record, `retainedBatchPrepared` supplies `batch` for this member.
  batch
end struct
/// Stores playable sky view cache record, including `entries`, `next`.
struct ViewCache
  /// When constructing this record, `retainedBatchPrepared` supplies `array(MAX_CACHED_VIEWS,void)` for
  /// this member.
  entries
  /// When constructing this record, `retainedBatchPrepared` supplies `0` for this member.
  next
end struct

/// Creates the playable sky error `7610` with diagnostic text `"playable sky: "+message`.
/// @param message Argument 2 of `error`; passed as `"playable sky: "+message`.
function fail(message) return error(7610,"playable sky: "+message) end function
/// Computes `name!=void and strings.toLowerAscii(name)==SHADER_NAME` for playable sky `isSkyShader`.
/// @param name Name used to select or register the corresponding playable sky resource.
function isSkyShader(name) return name!=void and strings.toLowerAscii(name)==SHADER_NAME end function
/// Calls `std.string.toLowerAscii` from playable sky `hasSurfaceParm`.
/// @param shader Record read through `shader.surfaceParms`.
/// @param wanted Value used by `for each value in shader.surfaceParms if strings.toLowerAscii(value)==wanted then return true end if end for`.
function hasSurfaceParm(shader,wanted)
  if shader==void then return false end if
  for each value in shader.surfaceParms if strings.toLowerAscii(value)==wanted then return true end if end for
  return false
end function
/// Calls `mq3.renderer.shader_parser.parseIndexed`, `mq3.client.playable_sky.hasSurfaceParm` from playable sky `isSkyShaderIndexed`. The final path returns `hasSurfaceParm(parsed,"sky")`.
/// @param index Value used by `parsed=try(shaderParser.parseIndexed(index,name))`.
/// @param name Name used to select or register the corresponding playable sky resource.
function isSkyShaderIndexed(index,name)
  parsed=try(shaderParser.parseIndexed(index,name));if parsed is error or parsed==void then return false end if
  return hasSurfaceParm(parsed,"sky")
end function

/// Calls `mq3.renderer.playable_materials.Image` from playable sky `additiveImage`. The final path returns `materials.Image(source.width,source.height,pixels)`.
/// @param source Record read through `source.pixels`, `source.width`, `source.height`.
function additiveImage(source)
  pixels=bytes(len(source.pixels),0);offset=0
  while offset<=len(source.pixels)-4
    red=source.pixels[offset];green=source.pixels[offset+1];blue=source.pixels[offset+2]
    alpha=red;if green>alpha then alpha=green end if;if blue>alpha then alpha=blue end if
    pixels[offset]=red;pixels[offset+1]=green;pixels[offset+2]=blue;pixels[offset+3]=alpha;offset=offset+4
  end while
  return materials.Image(source.width,source.height,pixels)
end function

/// Calls `std.string.toLowerAscii`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_sky.Layer` from playable sky `layerFromStage`. The final path returns `Layer(loaded[0],image,slot,scaleU,scaleV,scrollU,scrollV,additive)`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param stage Record read through `stage.isLightmap`, `stage.images`, `stage.texMods`, `stage.blendSrc` and additional values.
/// @param slot Value used by `return Layer(loaded[0],image,slot,scaleU,scaleV,scrollU,scrollV,additive)`.
function layerFromStage(archive,stage,slot)
  if stage==void or stage.isLightmap or len(stage.images)==0 then return void end if
  imageName=strings.toLowerAscii(stage.images[0]);if imageName=="$lightmap" or imageName=="$whiteimage" then return void end if
  loaded=materials.loadImage(archive,stage.images[0]);if loaded==void then return void end if
  scaleU=1.0;scaleV=1.0;scrollU=0.0;scrollV=0.0;supported=true
  for each mod in stage.texMods
    if mod.kind=="scale" and len(mod.values)>=2 then scrollU=scrollU*mod.values[0];scrollV=scrollV*mod.values[1];scaleU=scaleU*mod.values[0];scaleV=scaleV*mod.values[1]
    else if mod.kind=="scroll" and len(mod.values)>=2 then scrollU=scrollU+mod.values[0];scrollV=scrollV+mod.values[1]
    else supported=false
    end if
  end for
  if not supported then return void end if
  additive=stage.blendSrc==shaderParser.GLS_SRCBLEND_ONE and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE
  image=loaded[1]
  return Layer(loaded[0],image,slot,scaleU,scaleV,scrollU,scrollV,additive)
end function

/// Calls `mq3.renderer.shader_parser.parseIndexed`, `mq3.client.playable_sky.hasSurfaceParm`, `mq3.client.playable_sky.layerFromStage` and additional helpers from playable sky `loadIndexed`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param index Value tested by `archive==void or index==void` before the calculation continues.
/// @param shaderName Value used by `parsed=shaderParser.parseIndexed(index,shaderName)`.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function loadIndexed(archive,index,shaderName,firstTextureSlot,maxTextureSlots)
  if archive==void or index==void then return fail("PK3 archive and shader index are required") end if
  if firstTextureSlot<0 or firstTextureSlot>=window.NATIVE_TEXTURE_SLOTS or maxTextureSlots<1 then return fail("insufficient native texture slots") end if
  parsed=shaderParser.parseIndexed(index,shaderName);if parsed is error then return parsed end if
  if parsed==void or not hasSurfaceParm(parsed,"sky") then return fail("shader is not a retail sky: "+shaderName) end if
  layers=[]
  for each stage in parsed.stages
    if len(layers)>=maxTextureSlots or firstTextureSlot+len(layers)>=window.NATIVE_TEXTURE_SLOTS then break end if
    layer=layerFromStage(archive,stage,firstTextureSlot+len(layers));if layer!=void then layers=layers+[layer] end if
  end for
  if len(layers)==0 then return fail("sky has no supported retail cloud stages: "+shaderName) end if
  return Catalog(layers,firstTextureSlot,len(layers),strings.toLowerAscii(shaderName),parsed.cloudHeight,void)
end function

/// Calls `mq3.renderer.playable_materials.shaderName`, `mq3.client.playable_sky.isSkyShaderIndexed`, `mq3.client.playable_sky.loadIndexed` from playable sky `loadMap`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param map Record read through `map.counts`.
/// @param index Value tested by `if isSkyShaderIndexed(index,name)` before the calculation continues.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function loadMap(archive,map,index,firstTextureSlot,maxTextureSlots)
  for textureIndex=0 to map.counts[1]-1
    name=materials.shaderName(map,textureIndex);if name is error then return name end if
    if isSkyShaderIndexed(index,name) then return loadIndexed(archive,index,name,firstTextureSlot,maxTextureSlots) end if
  end for
  return void
end function

/// Calls `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.client.playable_sky.loadIndexed` from playable sky `load`. The final path returns `loadIndexed(archive,scripts[0],SHADER_NAME,firstTextureSlot,maxTextureSlots)`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function load(archive,firstTextureSlot,maxTextureSlots)
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  return loadIndexed(archive,scripts[0],SHADER_NAME,firstTextureSlot,maxTextureSlots)
end function

/// Calls `mq3.platform.playable_window.uploadTexture`, `mq3.client.playable_sky.release` from playable sky `upload`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.layers`.
function upload(catalog)
  if catalog==void then return fail("catalog is required") end if
  for each layer in catalog.layers
    if not window.uploadTexture(layer.slot,layer.image.pixels,layer.image.width,layer.image.height) then release(catalog);return fail("could not upload "+layer.imageName) end if
  end for
  return true
end function

/// Updates `catalog.cache` during playable sky `release`.
/// @param catalog Mutable playable sky record/storage; this routine assigns `catalog.cache`.
function release(catalog)
  if catalog!=void then for each layer in catalog.layers window.releaseTexture(layer.slot) end for;catalog.cache=void end if
  return void
end function

/// Calls `mq3.shared.math.VectorNormalize` from playable sky `directionPrepared`. The final path returns `value`.
/// @param basis Sequence read at `basis[0]`, `basis[1]`, `basis[2]`.
/// @param focal Value used by `value=[basis[0][0]*focal+basis[1][0]*side+basis[2][0]*vertical,basis[0][1]*focal+basis[1][1]*side+basis[2][1]*vertical,basis[0][2]*focal+basis...`.
/// @param width Width in the coordinate space used by `directionPrepared`.
/// @param height Height in the coordinate space used by `directionPrepared`.
/// @param x Horizontal coordinate in the coordinate space used by `directionPrepared`.
/// @param y Vertical coordinate in the coordinate space used by `directionPrepared`.
function directionPrepared(basis,focal,width,height,x,y)
  side=x-width*0.5;vertical=height*0.5-y
  value=[basis[0][0]*focal+basis[1][0]*side+basis[2][0]*vertical,basis[0][1]*focal+basis[1][1]*side+basis[2][1]*vertical,basis[0][2]*focal+basis[1][2]*side+basis[2][2]*vertical]
  qmath.VectorNormalize(value);return value
end function

/// Calls `mq3.client.playable_viewer.focalLength`, `mq3.client.playable_sky.directionPrepared`, `mq3.client.playable_viewer.cameraBasis` from playable sky `direction`. The final path returns `directionPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)`.
/// @param camera Camera state used to transform/project the scene.
/// @param width Width in the coordinate space used by `direction`.
/// @param height Height in the coordinate space used by `direction`.
/// @param x Horizontal coordinate in the coordinate space used by `direction`.
/// @param y Vertical coordinate in the coordinate space used by `direction`.
function direction(camera,width,height,x,y)
  focal=viewer.focalLength(width,90.0);if focal is error then return focal end if
  return directionPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)
end function

// Quake III's R_InitSkyTexCoords intersects each ray with a cloud sphere
// centered 4096 units below the viewer, then uses acos of its X/Y normal.
// Unlike yaw/pitch, this is continuous at the zenith.
/// @param basis Value used by `ray=directionPrepared(basis,focal,width,height,x,y)`.
/// @param focal Value used by `ray=directionPrepared(basis,focal,width,height,x,y)`.
/// @param width Width in the coordinate space used by `cloudUvPrepared`.
/// @param height Height in the coordinate space used by `cloudUvPrepared`.
/// @param x Horizontal coordinate in the coordinate space used by `cloudUvPrepared`.
/// @param y Vertical coordinate in the coordinate space used by `cloudUvPrepared`.
/// @param cloudHeight Value used by `distance=0.0-radius*ray[2]+trans.sqrt(radius*radius*ray[2]*ray[2]+2.0*radius*cloudHeight+cloudHeight*cloudHeight)`.
function cloudUvPrepared(basis,focal,width,height,x,y,cloudHeight)
  ray=directionPrepared(basis,focal,width,height,x,y)
  radius=4096.0
  distance=0.0-radius*ray[2]+trans.sqrt(radius*radius*ray[2]*ray[2]+2.0*radius*cloudHeight+cloudHeight*cloudHeight)
  sphereRadius=radius+cloudHeight
  return [acos(ray[0]*distance/sphereRadius),acos(ray[1]*distance/sphereRadius)]
end function
/// Adapts `mq3.client.playable_sky.cloudUvPrepared` to playable sky `baseUvPrepared`, returning its result for `basis, focal, width, height, x, y, 512.0`.
/// @param basis Argument 1 of `mq3.client.playable_sky.cloudUvPrepared`.
/// @param focal Argument 2 of `mq3.client.playable_sky.cloudUvPrepared`.
/// @param width Argument 3 of `mq3.client.playable_sky.cloudUvPrepared`.
/// @param height Argument 4 of `mq3.client.playable_sky.cloudUvPrepared`.
/// @param x Argument 5 of `mq3.client.playable_sky.cloudUvPrepared`.
/// @param y Argument 6 of `mq3.client.playable_sky.cloudUvPrepared`.
function baseUvPrepared(basis,focal,width,height,x,y) return cloudUvPrepared(basis,focal,width,height,x,y,512.0) end function

/// Calls `mq3.client.playable_viewer.focalLength`, `mq3.client.playable_sky.baseUvPrepared`, `mq3.client.playable_viewer.cameraBasis` from playable sky `baseUv`. The final path returns `baseUvPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)`.
/// @param camera Camera state used to transform/project the scene.
/// @param width Width in the coordinate space used by `baseUv`.
/// @param height Height in the coordinate space used by `baseUv`.
/// @param x Horizontal coordinate in the coordinate space used by `baseUv`.
/// @param y Vertical coordinate in the coordinate space used by `baseUv`.
function baseUv(camera,width,height,x,y)
  focal=viewer.focalLength(width,90.0);if focal is error then return focal end if
  return baseUvPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)
end function

/// Calls `mq3.client.playable_sky.baseUv`, `mq3.client.playable_sky.Vertex`, `mq3.client.playable_viewer.ScreenPoint` from playable sky `vertex`. The final path returns `Vertex(viewer.ScreenPoint(x,y,depth),mapped)`.
/// @param camera Camera state used to transform/project the scene.
/// @param width Width in the coordinate space used by `vertex`.
/// @param height Height in the coordinate space used by `vertex`.
/// @param x Horizontal coordinate in the coordinate space used by `vertex`.
/// @param y Vertical coordinate in the coordinate space used by `vertex`.
/// @param layer Record read through `layer.scaleU`, `layer.scrollU`, `layer.scaleV`, `layer.scrollV`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param depth Value used by `return Vertex(viewer.ScreenPoint(x,y,depth),mapped)`.
function vertex(camera,width,height,x,y,layer,nowMilliseconds,depth)
  uv=baseUv(camera,width,height,x,y);if uv is error then return uv end if
  seconds=nowMilliseconds/1000.0
  mapped=[uv[0]*layer.scaleU+seconds*layer.scrollU,uv[1]*layer.scaleV+seconds*layer.scrollV]
  return Vertex(viewer.ScreenPoint(x,y,depth),mapped)
end function

/// Calls `mq3.client.playable_viewer.focalLength`, `mq3.client.playable_sky.cloudUvPrepared`, `mq3.client.playable_sky.Vertex` and additional helpers from playable sky `cloudGridPrepared`. The final path returns `vertices`.
/// @param basis Value used by `uv=cloudUvPrepared(basis,focal,width,height,x,y,cloudHeight)`.
/// @param left Value used by `vertices[index]=Vertex(viewer.ScreenPoint(left+x,top+y,SKY_DEPTH),uv)`.
/// @param top Value used by `vertices[index]=Vertex(viewer.ScreenPoint(left+x,top+y,SKY_DEPTH),uv)`.
/// @param width Width in the coordinate space used by `cloudGridPrepared`.
/// @param height Height in the coordinate space used by `cloudGridPrepared`.
/// @param cloudHeight Value used by `uv=cloudUvPrepared(basis,focal,width,height,x,y,cloudHeight)`.
function cloudGridPrepared(basis,left,top,width,height,cloudHeight)
  focal=viewer.focalLength(width,90.0);if focal is error then return focal end if
  vertices=array((GRID_ROWS+1)*(GRID_COLUMNS+1),void);index=0
  for row=0 to GRID_ROWS
    y=height*row/GRID_ROWS
    for column=0 to GRID_COLUMNS
      x=width*column/GRID_COLUMNS
      uv=cloudUvPrepared(basis,focal,width,height,x,y,cloudHeight)
      vertices[index]=Vertex(viewer.ScreenPoint(left+x,top+y,SKY_DEPTH),uv);index=index+1
    end for
  end for
  return vertices
end function
/// Adapts `mq3.client.playable_sky.cloudGridPrepared` to playable sky `baseGridPrepared`, returning its result for `basis, left, top, width, height, 512.0`.
/// @param basis Argument 1 of `mq3.client.playable_sky.cloudGridPrepared`.
/// @param left Argument 2 of `mq3.client.playable_sky.cloudGridPrepared`.
/// @param top Argument 3 of `mq3.client.playable_sky.cloudGridPrepared`.
/// @param width Argument 4 of `mq3.client.playable_sky.cloudGridPrepared`.
/// @param height Argument 5 of `mq3.client.playable_sky.cloudGridPrepared`.
function baseGridPrepared(basis,left,top,width,height) return cloudGridPrepared(basis,left,top,width,height,512.0) end function
/// Adapts `mq3.client.playable_sky.baseGridPrepared` to playable sky `baseGrid`, returning its result for `viewer.cameraBasis(camera), 0, 0, width, height`.
/// @param camera Camera state used to transform/project the scene. Forwarded to `mq3.client.playable_sky.baseGridPrepared`.
/// @param width Argument 4 of `mq3.client.playable_sky.baseGridPrepared`.
/// @param height Argument 5 of `mq3.client.playable_sky.baseGridPrepared`.
function baseGrid(camera,width,height) return baseGridPrepared(viewer.cameraBasis(camera),0,0,width,height) end function

/// Calls `mq3.client.playable_sky.Vertex`, `mq3.client.playable_viewer.ScreenPoint` from playable sky `mappedVertex`. The final path returns `Vertex(viewer.ScreenPoint(source.point.x,source.point.y,depth),uv)`.
/// @param source Record read through `source.uv`, `source.point.x`, `source.point.y`.
/// @param layer Record read through `layer.scaleU`, `layer.scrollU`, `layer.scaleV`, `layer.scrollV`.
/// @param seconds Value used by `uv=[source.uv[0]*layer.scaleU+seconds*layer.scrollU,source.uv[1]*layer.scaleV+seconds*layer.scrollV]`.
/// @param depth Value used by `return Vertex(viewer.ScreenPoint(source.point.x,source.point.y,depth),uv)`.
function mappedVertex(source,layer,seconds,depth)
  uv=[source.uv[0]*layer.scaleU+seconds*layer.scrollU,source.uv[1]*layer.scaleV+seconds*layer.scrollV]
  return Vertex(viewer.ScreenPoint(source.point.x,source.point.y,depth),uv)
end function

/// Calls `mq3.platform.playable_window.drawTriangle` from playable sky `drawTriangle`. The final path returns `1`.
/// @param layer Record read through `layer.slot`.
/// @param a Record read through `a.point`, `a.uv`.
/// @param b Record read through `b.point`, `b.uv`.
/// @param c Record read through `c.point`, `c.uv`.
function drawTriangle(layer,a,b,c)
  window.drawTriangle(layer.slot,a.point,a.uv,1.0,b.point,b.uv,1.0,c.point,c.uv,1.0,255,255,255);return 1
end function

/// Calls `mq3.platform.playable_window.appendSingleTextureTriangle` from playable sky `appendTriangle`.
/// @param batch Value used by `return window.appendSingleTextureTriangle(batch,layer.slot,a.point,uvA,1.0,b.point,uvB,1.0,c.point,uvC,1.0,255,255,255)`.
/// @param layer Record read through `layer.slot`.
/// @param a Record read through `a.uv`, `a.point`.
/// @param b Record read through `b.uv`, `b.point`.
/// @param c Record read through `c.uv`, `c.point`.
function appendTriangle(batch,layer,a,b,c)
  uvA=[a.uv[0],a.uv[1]];uvB=[b.uv[0],b.uv[1]];uvC=[c.uv[0],c.uv[1]]
  return window.appendSingleTextureTriangle(batch,layer.slot,a.point,uvA,1.0,b.point,uvB,1.0,c.point,uvC,1.0,255,255,255)
end function

/// Calls `mq3.client.playable_sky.cloudGridPrepared`, `mq3.platform.playable_window.createTriangleBatch`, `mq3.client.playable_sky.mappedVertex` and additional helpers from playable sky `buildBatchPrepared`. The final path returns `batch`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.cloudHeight`, `catalog.layers`.
/// @param basis Value used by `grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight)`.
/// @param left Value used by `grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight)`.
/// @param top Value used by `grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight)`.
/// @param width Width in the coordinate space used by `buildBatchPrepared`.
/// @param height Height in the coordinate space used by `buildBatchPrepared`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function buildBatchPrepared(catalog,basis,left,top,width,height,nowMilliseconds)
  grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight);if grid is error then return grid end if
  batch=window.createTriangleBatch(len(catalog.layers)*GRID_COLUMNS*GRID_ROWS*2);if batch is error then return batch end if
  seconds=nowMilliseconds/1000.0
  for layerIndex=0 to len(catalog.layers)-1
    layer=catalog.layers[layerIndex];depth=SKY_DEPTH-layerIndex
    vertices=array(len(grid),void)
    for vertexIndex=0 to len(grid)-1 vertices[vertexIndex]=mappedVertex(grid[vertexIndex],layer,seconds,depth) end for
    for row=0 to GRID_ROWS-1
      rowStart=row*(GRID_COLUMNS+1);nextRow=rowStart+GRID_COLUMNS+1
      for column=0 to GRID_COLUMNS-1
        a=vertices[rowStart+column];b=vertices[rowStart+column+1]
        c=vertices[nextRow+column+1];d=vertices[nextRow+column]
        batch=appendTriangle(batch,layer,a,b,c);if batch is error then return batch end if
        batch=appendTriangle(batch,layer,a,c,d);if batch is error then return batch end if
      end for
    end for
  end for
  return batch
end function
/// Adapts `mq3.client.playable_sky.buildBatchPrepared` to playable sky `buildBatch`, returning its result for `catalog, viewer.cameraBasis(camera), 0, 0, width, height, nowMilliseconds`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Forwarded to `mq3.client.playable_sky.buildBatchPrepared`.
/// @param camera Camera state used to transform/project the scene. Forwarded to `mq3.client.playable_sky.buildBatchPrepared`.
/// @param width Argument 5 of `mq3.client.playable_sky.buildBatchPrepared`.
/// @param height Argument 6 of `mq3.client.playable_sky.buildBatchPrepared`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds. Forwarded to `mq3.client.playable_sky.buildBatchPrepared`.
function buildBatch(catalog,camera,width,height,nowMilliseconds) return buildBatchPrepared(catalog,viewer.cameraBasis(camera),0,0,width,height,nowMilliseconds) end function

/// Evaluates playable sky `sameBasis` and returns `false`, `true` according to its guard/selection conditions.
/// @param left Sequence read at `left[axis]`.
/// @param right Sequence read at `right[axis]`.
function sameBasis(left,right)
  for axis=0 to 2 for component=0 to 2 if left[axis][component]!=right[axis][component] then return false end if end for end for
  return true
end function
/// Builds the playable sky `copyBasis` sequence from `[[value[0][0],value[0][1],value[0][2]],[value[1][0],value[1][1],value[1][2]],[value[2][0],value[2][1],value[2][2]]]`.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copyBasis(value) return [[value[0][0],value[0][1],value[0][2]],[value[1][0],value[1][1],value[1][2]],[value[2][0],value[2][1],value[2][2]]] end function

// Preserve MiniLang's camera/ray math exactly, retaining its double UVs until
// the final native binary32 batch stores. Time changes only the two uniforms
// per layer; an unchanged camera therefore performs no grid allocation/math.
// A bounded ring handles alternating main/portal/refdef views without growth.
/// @param catalog Mutable playable sky record/storage; this routine assigns `catalog.cache`.
/// @param basis Sequence whose length/content is inspected by `retainedBatchPrepared`.
/// @param left Value assigned to `entry.left`.
/// @param top Value assigned to `entry.top`.
/// @param width Value assigned to `entry.width`.
/// @param height Value assigned to `entry.height`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function retainedBatchPrepared(catalog,basis,left,top,width,height,nowMilliseconds)
  if catalog==void or basis==void or len(basis)!=3 or width<1 or height<1 or nowMilliseconds<0 then return fail("invalid retained sky view") end if
  count=len(catalog.layers)*GRID_COLUMNS*GRID_ROWS*2
  if count<1 then return fail("sky needs a cloud layer") end if
  if catalog.cache==void then catalog.cache=ViewCache(array(MAX_CACHED_VIEWS,void),0) end if
  cache=catalog.cache;entry=void
  for slot=0 to MAX_CACHED_VIEWS-1
    candidate=cache.entries[slot]
    if candidate!=void and candidate.left==left and candidate.top==top and candidate.width==width and candidate.height==height and sameBasis(candidate.basis,basis) then entry=candidate;break end if
  end for
  if entry==void then
    grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight);if grid is error then return grid end if
    slot=cache.next;cache.next=(cache.next+1)%MAX_CACHED_VIEWS;entry=cache.entries[slot]
    if entry==void then
      batch=window.createTriangleBatch(count);if batch is error then return batch end if
      entry=CachedView(copyBasis(basis),left,top,width,height,bytes(len(grid)*SOURCE_VERTEX_BYTES,0),batch);cache.entries[slot]=entry
    else entry.basis=copyBasis(basis);entry.left=left;entry.top=top;entry.width=width;entry.height=height end if
    for index=0 to len(grid)-1
      vertex=grid[index]
      if storeSkyVertexNative(nativeBytesPtr(entry.source),len(entry.source),index,vertex.point.x,vertex.point.y,vertex.uv[0],vertex.uv[1])!=1 then return fail("could not retain sky source vertex") end if
    end for
  end if
  if entry.batch.capacity!=count then entry.batch=window.createTriangleBatch(count);if entry.batch is error then return entry.batch end if end if
  perLayer=GRID_COLUMNS*GRID_ROWS*2
  for layerIndex=0 to len(catalog.layers)-1
    layer=catalog.layers[layerIndex]
    written=updateSkyLayerNative(nativeBytesPtr(entry.batch.data),len(entry.batch.data),layerIndex*perLayer,nativeBytesPtr(entry.source),len(entry.source),GRID_COLUMNS,GRID_ROWS,layer.slot,layer.scaleU,layer.scaleV,layer.scrollU,layer.scrollV,nowMilliseconds,SKY_DEPTH-layerIndex)
    if written!=perLayer then return fail("could not update retained sky layer") end if
  end for
  entry.batch.count=count;return entry.batch
end function

/// Calls `mq3.client.playable_sky.vertex`, `mq3.client.playable_sky.drawTriangle` from playable sky `drawLayer`. The final path returns `count`.
/// @param layer Value used by `a=vertex(camera,width,height,x0,y0,layer,nowMilliseconds,depth)`.
/// @param camera Camera state used to transform/project the scene.
/// @param width Width in the coordinate space used by `drawLayer`.
/// @param height Height in the coordinate space used by `drawLayer`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param layerIndex Value used by `depth=SKY_DEPTH-layerIndex`.
function drawLayer(layer,camera,width,height,nowMilliseconds,layerIndex)
  depth=SKY_DEPTH-layerIndex
  count=0
  for row=0 to GRID_ROWS-1
    y0=height*row/GRID_ROWS;y1=height*(row+1)/GRID_ROWS
    for column=0 to GRID_COLUMNS-1
      x0=width*column/GRID_COLUMNS;x1=width*(column+1)/GRID_COLUMNS
      a=vertex(camera,width,height,x0,y0,layer,nowMilliseconds,depth);if a is error then return a end if
      b=vertex(camera,width,height,x1,y0,layer,nowMilliseconds,depth);if b is error then return b end if
      c=vertex(camera,width,height,x1,y1,layer,nowMilliseconds,depth);if c is error then return c end if
      d=vertex(camera,width,height,x0,y1,layer,nowMilliseconds,depth);if d is error then return d end if
      count=count+drawTriangle(layer,a,b,c)+drawTriangle(layer,a,c,d)
    end for
  end for
  return count
end function

/// Calls `mq3.client.playable_sky.retainedBatchPrepared`, `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_sky.submitLayers` from playable sky `draw`. The final path returns `submitLayers(catalog,batch)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param camera Camera state used to transform/project the scene.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function draw(catalog,camera,width,height,nowMilliseconds)
  if catalog==void or camera==void or width<1 or height<1 or nowMilliseconds<0 then return fail("catalog, camera, surface and non-negative time are required") end if
  batch=retainedBatchPrepared(catalog,viewer.cameraBasis(camera),0,0,width,height,nowMilliseconds);if batch is error then return batch end if
  return submitLayers(catalog,batch)
end function
/// Calls `mq3.client.playable_sky.drawSkyLayerNative`, `nativeBytesPtr` from playable sky `submitLayers`. The final path returns `count`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.layers`.
/// @param batch Record read through `batch.data`.
function submitLayers(catalog,batch)
  count=0;perLayer=GRID_COLUMNS*GRID_ROWS*2
  for index=0 to len(catalog.layers)-1
    additive=0;if catalog.layers[index].additive then additive=1 end if
    drawn=drawSkyLayerNative(nativeBytesPtr(batch.data),len(batch.data),index*perLayer,perLayer,additive)
    if drawn!=perLayer then return fail("native sky layer submission failed") end if;count=count+drawn
  end for
  return count
end function
// Only refdef callers carry a LEFT vector. Standalone camera/prepared APIs
// already carry RIGHT and must retain their existing ray/batch semantics.
/// @param catalog Asset catalog used to resolve names to loaded resources. Forwarded to `mq3.client.playable_sky.retainedBatchPrepared`.
/// @param axes Argument 2 of `mq3.client.playable_sky.retainedBatchPrepared`; passed as `viewer.refdefBasis(axes)`.
/// @param left Argument 3 of `mq3.client.playable_sky.retainedBatchPrepared`.
/// @param top Argument 4 of `mq3.client.playable_sky.retainedBatchPrepared`.
/// @param width Argument 5 of `mq3.client.playable_sky.retainedBatchPrepared`.
/// @param height Argument 6 of `mq3.client.playable_sky.retainedBatchPrepared`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds. Forwarded to `mq3.client.playable_sky.retainedBatchPrepared`.
function retainedBatchRefdef(catalog,axes,left,top,width,height,nowMilliseconds)
  return retainedBatchPrepared(catalog,viewer.refdefBasis(axes),left,top,width,height,nowMilliseconds)
end function
/// Calls `mq3.client.playable_sky.retainedBatchRefdef`, `mq3.client.playable_sky.submitLayers` from playable sky `drawViewport`. The final path returns `submitLayers(catalog,batch)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param basis Sequence whose length/content is inspected by `drawViewport`.
/// @param area Record read through `area.width`, `area.height`, `area.x`, `area.y`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function drawViewport(catalog,basis,area,nowMilliseconds)
  if catalog==void or basis==void or len(basis)!=3 or area==void or area.width<1 or area.height<1 or nowMilliseconds<0 then return fail("catalog, view axes, viewport and non-negative time are required") end if
  batch=retainedBatchRefdef(catalog,basis,area.x,area.y,area.width,area.height,nowMilliseconds);if batch is error then return batch end if
  return submitLayers(catalog,batch)
end function
