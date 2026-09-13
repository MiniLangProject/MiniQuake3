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

const SHADER_NAME="textures/skies/tim_hell"
const REQUIRED_TEXTURES=2
const GRID_COLUMNS=12
const GRID_ROWS=8
const SKY_DEPTH=1000000.0

struct Layer imageName image slot scaleU scaleV scrollU scrollV additive end struct
struct Catalog layers firstTextureSlot textureCount shaderName end struct
struct Vertex point uv end struct

function fail(message) return error(7610,"playable sky: "+message) end function
function isSkyShader(name) return name!=void and strings.toLowerAscii(name)==SHADER_NAME end function
function hasSurfaceParm(shader,wanted)
  if shader==void then return false end if
  for each value in shader.surfaceParms if strings.toLowerAscii(value)==wanted then return true end if end for
  return false
end function
function isSkyShaderIndexed(index,name)
  parsed=try(shaderParser.parseIndexed(index,name));if parsed is error or parsed==void then return false end if
  return hasSurfaceParm(parsed,"sky")
end function

function additiveImage(source)
  pixels=bytes(len(source.pixels),0);offset=0
  while offset<=len(source.pixels)-4
    red=source.pixels[offset];green=source.pixels[offset+1];blue=source.pixels[offset+2]
    alpha=red;if green>alpha then alpha=green end if;if blue>alpha then alpha=blue end if
    pixels[offset]=red;pixels[offset+1]=green;pixels[offset+2]=blue;pixels[offset+3]=alpha;offset=offset+4
  end while
  return materials.Image(source.width,source.height,pixels)
end function

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
  image=loaded[1];if additive then image=additiveImage(image) end if
  return Layer(loaded[0],image,slot,scaleU,scaleV,scrollU,scrollV,additive)
end function

function loadIndexed(archive,index,shaderName,firstTextureSlot,maxTextureSlots)
  if archive==void or index==void then return fail("PK3 archive and shader index are required") end if
  if firstTextureSlot<0 or firstTextureSlot>=512 or maxTextureSlots<1 then return fail("insufficient native texture slots") end if
  parsed=shaderParser.parseIndexed(index,shaderName);if parsed is error then return parsed end if
  if parsed==void or not hasSurfaceParm(parsed,"sky") then return fail("shader is not a retail sky: "+shaderName) end if
  layers=[]
  for each stage in parsed.stages
    if len(layers)>=maxTextureSlots or firstTextureSlot+len(layers)>=512 then break end if
    layer=layerFromStage(archive,stage,firstTextureSlot+len(layers));if layer!=void then layers=layers+[layer] end if
  end for
  if len(layers)==0 then return fail("sky has no supported retail cloud stages: "+shaderName) end if
  return Catalog(layers,firstTextureSlot,len(layers),strings.toLowerAscii(shaderName))
end function

function loadMap(archive,map,index,firstTextureSlot,maxTextureSlots)
  for textureIndex=0 to map.counts[1]-1
    name=materials.shaderName(map,textureIndex);if name is error then return name end if
    if isSkyShaderIndexed(index,name) then return loadIndexed(archive,index,name,firstTextureSlot,maxTextureSlots) end if
  end for
  return void
end function

function load(archive,firstTextureSlot,maxTextureSlots)
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  return loadIndexed(archive,scripts[0],SHADER_NAME,firstTextureSlot,maxTextureSlots)
end function

function upload(catalog)
  if catalog==void then return fail("catalog is required") end if
  for each layer in catalog.layers
    if not window.uploadTexture(layer.slot,layer.image.pixels,layer.image.width,layer.image.height) then release(catalog);return fail("could not upload "+layer.imageName) end if
  end for
  return true
end function

function release(catalog)
  if catalog!=void then for each layer in catalog.layers window.releaseTexture(layer.slot) end for end if
  return void
end function

function directionPrepared(basis,focal,width,height,x,y)
  side=x-width*0.5;vertical=height*0.5-y
  value=[basis[0][0]*focal+basis[1][0]*side+basis[2][0]*vertical,basis[0][1]*focal+basis[1][1]*side+basis[2][1]*vertical,basis[0][2]*focal+basis[1][2]*side+basis[2][2]*vertical]
  qmath.VectorNormalize(value);return value
end function

function direction(camera,width,height,x,y)
  focal=viewer.focalLength(width,90.0);if focal is error then return focal end if
  return directionPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)
end function

function baseUvPrepared(basis,focal,width,height,x,y)
  ray=directionPrepared(basis,focal,width,height,x,y)
  yaw=qmath.atanDegrees(ray[1],ray[0]);horizontal=trans.sqrt(ray[0]*ray[0]+ray[1]*ray[1]);pitch=qmath.atanDegrees(ray[2],horizontal)
  return [yaw/360.0,0.5-pitch/180.0]
end function

function baseUv(camera,width,height,x,y)
  focal=viewer.focalLength(width,90.0);if focal is error then return focal end if
  return baseUvPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)
end function

function vertex(camera,width,height,x,y,layer,nowMilliseconds,depth)
  uv=baseUv(camera,width,height,x,y);if uv is error then return uv end if
  seconds=nowMilliseconds/1000.0
  mapped=[uv[0]*layer.scaleU+seconds*layer.scrollU,uv[1]*layer.scaleV+seconds*layer.scrollV]
  return Vertex(viewer.ScreenPoint(x,y,depth),mapped)
end function

function baseGrid(camera,width,height)
  focal=viewer.focalLength(width,90.0);if focal is error then return focal end if
  basis=viewer.cameraBasis(camera);vertices=array((GRID_ROWS+1)*(GRID_COLUMNS+1),void);index=0
  for row=0 to GRID_ROWS
    y=height*row/GRID_ROWS
    for column=0 to GRID_COLUMNS
      x=width*column/GRID_COLUMNS
      uv=baseUvPrepared(basis,focal,width,height,x,y)
      vertices[index]=Vertex(viewer.ScreenPoint(x,y,SKY_DEPTH),uv);index=index+1
    end for
  end for
  return vertices
end function

function mappedVertex(source,layer,seconds,depth)
  uv=[source.uv[0]*layer.scaleU+seconds*layer.scrollU,source.uv[1]*layer.scaleV+seconds*layer.scrollV]
  return Vertex(viewer.ScreenPoint(source.point.x,source.point.y,depth),uv)
end function

function unwrap(reference,value)
  result=value;while result-reference>1.0 result=result-2.0 end while;while result-reference<0.0-1.0 result=result+2.0 end while;return result
end function

function drawTriangle(layer,a,b,c)
  b.uv[0]=unwrap(a.uv[0],b.uv[0]);c.uv[0]=unwrap(a.uv[0],c.uv[0])
  window.drawTriangle(layer.slot,a.point,a.uv,1.0,b.point,b.uv,1.0,c.point,c.uv,1.0,255,255,255);return 1
end function

function appendTriangle(batch,layer,a,b,c)
  uvA=[a.uv[0],a.uv[1]];uvB=[unwrap(a.uv[0],b.uv[0]),b.uv[1]];uvC=[unwrap(a.uv[0],c.uv[0]),c.uv[1]]
  return window.appendSingleTextureTriangle(batch,layer.slot,a.point,uvA,1.0,b.point,uvB,1.0,c.point,uvC,1.0,255,255,255)
end function

function buildBatch(catalog,camera,width,height,nowMilliseconds)
  grid=baseGrid(camera,width,height);if grid is error then return grid end if
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

function draw(catalog,camera,width,height,nowMilliseconds)
  if catalog==void or camera==void or width<1 or height<1 or nowMilliseconds<0 then return fail("catalog, camera, surface and non-negative time are required") end if
  batch=buildBatch(catalog,camera,width,height,nowMilliseconds);if batch is error then return batch end if
  return window.submitTriangleBatch(batch)
end function
