// SPDX-License-Identifier: GPL-2.0-or-later
// Resolves and executes the original QVM SetColor/DrawStretchPic stream as
// native screen-space triangles while preserving shader-run ordering.
package mq3.renderer.qvm_2d_batch

import mq3.compat.numeric as n
import mq3.renderer.command_queue as q2commands
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.shader_remap as shaderRemap
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import std.string as strings

const SCREEN_DEPTH=0.001

struct Point x y depth end struct
struct Quad shaderHandle shaderName positions texCoords color commandIndex end struct
struct Triangle positions texCoords colors commandIndex end struct
struct Texture imageName image slot noMipMaps end struct
struct Material shaderHandle shaderName stages noMipMaps timeOffset clampTime end struct
struct StagePass stage triangles batch timeOffset clampTime end struct
struct Run materialIndex shaderHandle passes quadCount triangleCount end struct
struct Extracted quads setColors ignoredCommands sourceWidth sourceHeight targetWidth targetHeight end struct
struct Catalog materials textures runs archive scriptIndex scriptCount sourceQuads emittedTriangles resolvedQuads unresolvedQuads nextTextureSlot endTextureSlot shaderRemaps end struct

function fail(message) return error(7683,"QVM 2D batch: "+message) end function
function colorBytes(rgba)
  return [n.trunc32(rgba[0]*255.0),n.trunc32(rgba[1]*255.0),n.trunc32(rgba[2]*255.0),n.trunc32(rgba[3]*255.0)]
end function
function shaderName(assets,kinds,handle)
  if handle<=0 or handle>len(assets) or handle>len(kinds) then return "" end if
  if kinds[handle-1]!="shader" and kinds[handle-1]!="shaderNoMip" then return "" end if
  return assets[handle-1]
end function
function shaderNoMip(kinds,handle) return handle>0 and handle<=len(kinds) and kinds[handle-1]=="shaderNoMip" end function
function scaledPoint(x,y,scaleX,scaleY) return Point(x*scaleX,y*scaleY,SCREEN_DEPTH) end function

function extract(queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight)
  if queueCommands==void or assets==void or kinds==void then return fail("commands and asset registry are required") end if
  if len(assets)!=len(kinds) then return fail("asset registry length mismatch") end if
  if sourceWidth<=0 or sourceHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("screen dimensions must be positive") end if
  scaleX=targetWidth/sourceWidth;scaleY=targetHeight/sourceHeight;color=[255,255,255,255];quads=[];setColors=0;ignored=0;commandIndex=0
  for each command in queueCommands
    if command.id==q2commands.RC_SET_COLOR then
      if len(command.values)!=4 then return fail("invalid SetColor command") end if
      color=colorBytes(command.values);setColors=setColors+1
    else if command.id==q2commands.RC_STRETCH_PIC then
      if len(command.values)!=8 then return fail("invalid DrawStretchPic command") end if
      v=command.values;x=v[0];y=v[1];w=v[2];h=v[3]
      positions=[scaledPoint(x,y,scaleX,scaleY),scaledPoint(x+w,y,scaleX,scaleY),scaledPoint(x+w,y+h,scaleX,scaleY),scaledPoint(x,y+h,scaleX,scaleY)]
      texCoords=[[v[4],v[5]],[v[6],v[5]],[v[6],v[7]],[v[4],v[7]]]
      quads=quads+[Quad(command.shader,shaderName(assets,kinds,command.shader),positions,texCoords,[color[0],color[1],color[2],color[3]],commandIndex)]
    else ignored=ignored+1
    end if
    commandIndex=commandIndex+1
  end for
  return Extracted(quads,setColors,ignored,sourceWidth,sourceHeight,targetWidth,targetHeight)
end function

function trianglesFor(quad,materialIndex)
  p=quad.positions;uv=quad.texCoords;c=quad.color;colors=[[c[0],c[1],c[2],c[3]],[c[0],c[1],c[2],c[3]],[c[0],c[1],c[2],c[3]]]
  // RB_StretchPic writes indexes 3,0,2 and 2,0,1.
  return [Triangle([p[3],p[0],p[2]],[uv[3],uv[0],uv[2]],colors,quad.commandIndex),Triangle([p[2],p[0],p[1]],[uv[2],uv[0],uv[1]],colors,quad.commandIndex)]
end function

function whiteImage()
  return materials.Image(1,1,bytes(4,255))
end function
function checkerImage()
  pixels=bytes(16,255);pixels[1]=0;pixels[3]=255;pixels[4]=0;pixels[5]=0;pixels[6]=0;pixels[7]=255;pixels[8]=0;pixels[9]=0;pixels[10]=0;pixels[11]=255;pixels[13]=0
  return materials.Image(2,2,pixels)
end function
function directStage(imageName,image,slot)
  return materials.RuntimeStage([imageName],[image],[slot],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","vertex",shaderParser.blankWave(),"vertex",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
end function
function materialIndex(materialList,handle)
  if len(materialList)==0 then return -1 end if
  for index=0 to len(materialList)-1 if materialList[index].shaderHandle==handle then return index end if end for
  return -1
end function
function materialMatches(material,name) return material!=void and stringEqualsIgnoreCaseAscii(material.shaderName,name) end function
function addStageTextures(textureList,stages,noMipMaps)
  result=textureList
  for each stage in stages for index=0 to len(stage.slots)-1
    exists=false;for each texture in result if texture.slot==stage.slots[index] then exists=true;break end if end for
    if not exists then result=result+[Texture(stage.imageNames[index],stage.images[index],stage.slots[index],noMipMaps)] end if
  end for end for
  return result
end function
function loadMaterial(archive,index,quad,nextSlot,endSlot)
  name=quad.shaderName;if name=="" or nextSlot>=endSlot then return void end if
  noMip=false;clampTime=0.0
  entry=shaderIndex.find(index,name);stages=[]
  if entry!=void then
    resolved=materials.runtimeStages(archive,index,name,nextSlot,endSlot);stages=resolved[0];nextSlot=resolved[1];noMip=resolved[6];clampTime=resolved[7]
  end if
  if len(stages)==0 then
    loaded=materials.loadImage(archive,name);imageName=name;image=void
    if loaded==void then
      lower=strings.toLowerAscii(name)
      if lower=="white" then imageName="$whiteimage";image=whiteImage() else imageName="$defaultimage";image=checkerImage() end if
    else imageName=loaded[0];image=loaded[1] end if
    if nextSlot>=endSlot then return void end if
    stages=[directStage(imageName,image,nextSlot)];nextSlot=nextSlot+1
  end if
  return [Material(quad.shaderHandle,name,stages,noMip,0.0,clampTime),nextSlot]
end function

function createPass(stage,triangles,timeOffset,clampTime)
  batch=window.createTriangleBatch(len(triangles));if batch is error then return batch end if
  slot=stage.slots[0]
  for each triangle in triangles
    p=triangle.positions;uv=triangle.texCoords;c=triangle.colors
    batch=window.appendSingleTextureTriangleColored(batch,slot,p[0],uv[0],1.0,c[0],p[1],uv[1],1.0,c[1],p[2],uv[2],1.0,c[2],255,255,255);if batch is error then return batch end if
  end for
  return StagePass(stage,triangles,batch,timeOffset,clampTime)
end function
function createRun(materialIndexValue,handle,material,quads)
  triangles=[];for each quad in quads triangles=triangles+trianglesFor(quad,materialIndexValue) end for
  passes=[];for each stage in material.stages pass=createPass(stage,triangles,material.timeOffset,material.clampTime);if pass is error then return pass end if;passes=passes+[pass] end for
  return Run(materialIndexValue,handle,passes,len(quads),len(triangles))
end function

// Rebuild only the changing quad/run buffers.  Shader parsing, PK3 image
// decoding and texture-slot assignment remain cached in the catalog.
function refresh(catalog,queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight)
  if catalog==void then return fail("catalog is required") end if
  extracted=extract(queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight);if extracted is error then return extracted end if
  for each material in catalog.materials offset=shaderRemap.timeOffsetForHandle(catalog.shaderRemaps,material.shaderHandle);material.timeOffset=0.0;if offset!=void then material.timeOffset=offset end if end for
  catalog.runs=[];catalog.sourceQuads=len(extracted.quads);catalog.emittedTriangles=0;catalog.resolvedQuads=0;catalog.unresolvedQuads=0
  current=[];currentHandle=-1
  for each quad in extracted.quads
    index=materialIndex(catalog.materials,quad.shaderHandle)
    if (index<0 or not materialMatches(catalog.materials[index],quad.shaderName)) and catalog.scriptIndex!=void then
      loaded=loadMaterial(catalog.archive,catalog.scriptIndex,quad,catalog.nextTextureSlot,catalog.endTextureSlot)
      if loaded!=void then
        material=loaded[0];material.noMipMaps=material.noMipMaps or shaderNoMip(kinds,quad.shaderHandle);offset=shaderRemap.timeOffsetForHandle(catalog.shaderRemaps,quad.shaderHandle);if offset!=void then material.timeOffset=offset end if
        catalog.nextTextureSlot=loaded[1];catalog.textures=addStageTextures(catalog.textures,material.stages,material.noMipMaps)
        if index<0 then catalog.materials=catalog.materials+[material];index=len(catalog.materials)-1 else catalog.materials[index]=material end if
      end if
    end if
    if index<0 then catalog.unresolvedQuads=catalog.unresolvedQuads+1;continue else catalog.resolvedQuads=catalog.resolvedQuads+1 end if
    if currentHandle!=quad.shaderHandle and len(current)>0 then
      previousIndex=materialIndex(catalog.materials,currentHandle);run=createRun(previousIndex,currentHandle,catalog.materials[previousIndex],current);if run is error then return run end if;catalog.runs=catalog.runs+[run];catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes);current=[]
    end if
    currentHandle=quad.shaderHandle;current=current+[quad]
  end for
  if len(current)>0 then index=materialIndex(catalog.materials,currentHandle);run=createRun(index,currentHandle,catalog.materials[index],current);if run is error then return run end if;catalog.runs=catalog.runs+[run];catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes) end if
  return catalog
end function

function build(archive,queueCommands,assets,kinds,firstTextureSlot,maxTextureSlots,sourceWidth,sourceHeight,targetWidth,targetHeight,shaderRemaps)
  if archive==void then return fail("PK3 archive is required") end if
  if firstTextureSlot<0 or maxTextureSlots<0 or firstTextureSlot+maxTextureSlots>512 then return fail("invalid native texture slot range") end if
  extracted=extract(queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight);if extracted is error then return extracted end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=Catalog([],[],[],archive,scripts[0],scripts[1],len(extracted.quads),0,0,0,firstTextureSlot,firstTextureSlot+maxTextureSlots,shaderRemaps);endSlot=catalog.endTextureSlot
  current=[];currentHandle=-1
  for each quad in extracted.quads
    index=materialIndex(catalog.materials,quad.shaderHandle)
    if index<0 then
      loaded=loadMaterial(archive,catalog.scriptIndex,quad,catalog.nextTextureSlot,endSlot)
      if loaded!=void then
        material=loaded[0];material.noMipMaps=material.noMipMaps or shaderNoMip(kinds,quad.shaderHandle);offset=shaderRemap.timeOffsetForHandle(shaderRemaps,quad.shaderHandle);if offset!=void then material.timeOffset=offset end if;catalog.nextTextureSlot=loaded[1]
        catalog.materials=catalog.materials+[material];catalog.textures=addStageTextures(catalog.textures,material.stages,material.noMipMaps);index=len(catalog.materials)-1
      end if
    end if
    if index<0 then catalog.unresolvedQuads=catalog.unresolvedQuads+1;continue else catalog.resolvedQuads=catalog.resolvedQuads+1 end if
    if currentHandle!=quad.shaderHandle and len(current)>0 then
      previousIndex=materialIndex(catalog.materials,currentHandle);run=createRun(previousIndex,currentHandle,catalog.materials[previousIndex],current);if run is error then return run end if;catalog.runs=catalog.runs+[run];catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes);current=[]
    end if
    currentHandle=quad.shaderHandle;current=current+[quad]
  end for
  if len(current)>0 then index=materialIndex(catalog.materials,currentHandle);run=createRun(index,currentHandle,catalog.materials[index],current);if run is error then return run end if;catalog.runs=catalog.runs+[run];catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes) end if
  return catalog
end function

function upload(catalog)
  if catalog==void then return fail("catalog is required") end if
  for each texture in catalog.textures if not window.uploadTextureMipmapped(texture.slot,texture.image.pixels,texture.image.width,texture.image.height,not texture.noMipMaps) then release(catalog);return fail("could not upload "+texture.imageName) end if end for
  return len(catalog.textures)
end function
function release(catalog) if catalog!=void then for each texture in catalog.textures window.releaseTexture(texture.slot) end for end if;return void end function

function updatePass(pass,nowMilliseconds)
  effectiveMilliseconds=materials.shaderMilliseconds(nowMilliseconds,0.0,pass.timeOffset,pass.clampTime);slot=materials.slotAt(pass.stage,effectiveMilliseconds)
  for triangleIndex=0 to len(pass.triangles)-1
    triangle=pass.triangles[triangleIndex];offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES;window.writeBatchI32(pass.batch.data,offset,slot)
    for vertex=0 to 2
      p=triangle.positions[vertex];uv=materials.transformUVAt(pass.stage,triangle.texCoords[vertex],[p.x,p.y,0.0],effectiveMilliseconds);if uv is error then return uv end if
      color=materials.stageColor(pass.stage,triangle.colors[vertex],effectiveMilliseconds);uvOffset=offset+32+vertex*32;window.writeBatchF32(pass.batch.data,uvOffset,uv[0]);window.writeBatchF32(pass.batch.data,uvOffset+4,uv[1]);window.writeBatchColor(pass.batch.data,offset+116+vertex*4,color)
    end for
  end for
  return slot
end function
function draw(catalog,nowMilliseconds)
  if catalog==void or nowMilliseconds<0 then return fail("valid catalog and time are required") end if
  drawn=0
  for each run in catalog.runs for each pass in run.passes
    updated=updatePass(pass,nowMilliseconds);if updated is error then return updated end if
    state=multitexture.setState(pass.stage.blend,false,false);if state is error then return state end if
    state=multitexture.setAlphaTest(pass.stage.alphaTest);if state is error then return state end if
    state=multitexture.setTextureClamp(pass.stage.clampTexture);if state is error then return state end if
    value=window.submitTriangleBatch(pass.batch);if value is error then return value end if;drawn=drawn+value
  end for end for
  multitexture.setTextureClamp(false);multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setState(multitexture.BLEND_OPAQUE,false,true)
  return drawn
end function
