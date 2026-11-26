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
import std.ds.list as lists
import std.string as strings

const SCREEN_DEPTH=0.001

/// Data record for `mq3.renderer.qvm_2d_batch.Point`; groups `x`, `y`, `depth`.
struct Point x y depth end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Quad`; groups `shaderHandle`, `shaderName`, `positions`, `texCoords`, `color`, `commandIndex`.
struct Quad shaderHandle shaderName positions texCoords color commandIndex end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Triangle`; groups `positions`, `texCoords`, `colors`, `commandIndex`.
struct Triangle positions texCoords colors commandIndex end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Texture`; groups `imageName`, `image`, `slot`, `noMipMaps`.
struct Texture imageName image slot noMipMaps end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Material`; groups `shaderHandle`, `shaderName`, `stages`, `noMipMaps`, `timeOffset`, `clampTime`.
struct Material shaderHandle shaderName stages noMipMaps timeOffset clampTime end struct
/// Data record for `mq3.renderer.qvm_2d_batch.StagePass`; groups `stage`, `triangles`, `batch`, `timeOffset`, `clampTime`, `initialized`, and 1 further field.
struct StagePass stage triangles batch timeOffset clampTime initialized dynamic end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Run`; groups `materialIndex`, `shaderHandle`, `passes`, `quadCount`, `triangleCount`.
struct Run materialIndex shaderHandle passes quadCount triangleCount end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Extracted`; groups `quads`, `setColors`, `ignoredCommands`, `sourceWidth`, `sourceHeight`, `targetWidth`, and 1 further field.
struct Extracted quads setColors ignoredCommands sourceWidth sourceHeight targetWidth targetHeight end struct
/// Data record for `mq3.renderer.qvm_2d_batch.Catalog`; groups `materials`, `textures`, `runs`, `archive`, `scriptIndex`, `scriptCount`, and 14 further fields.
struct Catalog materials textures runs archive scriptIndex scriptCount sourceQuads emittedTriangles resolvedQuads unresolvedQuads nextTextureSlot endTextureSlot shaderRemaps lastCommands remapRevision assetCount sourceWidth sourceHeight targetWidth targetHeight end struct

/// Creates error `7683` with message `"QVM 2D batch: "+message`.
/// @param message Input used in the result expression `error(7683,"QVM 2D batch: "+message)`.
function fail(message) return error(7683,"QVM 2D batch: "+message) end function
/// Returns `[n.trunc32(rgba[0]*255.0),n.trunc32(rgba[1]*255.0),n.trunc32(rgba[2]*255.0),n.trunc32(rgba[3]*255.0)]` for `mq3.renderer.qvm_2d_batch.colorBytes`.
/// @param rgba Indexed input read at `0`, `1`, `2`, `3`.
function colorBytes(rgba)
  return [n.trunc32(rgba[0]*255.0),n.trunc32(rgba[1]*255.0),n.trunc32(rgba[2]*255.0),n.trunc32(rgba[3]*255.0)]
end function
/// Returns `assets[handle-1]` from `mq3.renderer.qvm_2d_batch.shaderName`; earlier branches return `""`.
/// @param assets Indexed input read at `handle-1`.
/// @param kinds Indexed input read at `handle-1`.
/// @param handle Input tested by `handle<=0 or handle>len(assets) or handle>len(kinds)`.
function shaderName(assets,kinds,handle)
  if handle<=0 or handle>len(assets) or handle>len(kinds) then return "" end if
  if kinds[handle-1]!="shader" and kinds[handle-1]!="shaderNoMip" then return "" end if
  return assets[handle-1]
end function
/// Computes `handle>0 and handle<=len(kinds) and kinds[handle-1]=="shaderNoMip"` for `mq3.renderer.qvm_2d_batch.shaderNoMip`.
/// @param kinds Indexed input read at `handle-1`.
/// @param handle Input used in the result expression `handle>0 and handle<=len(kinds) and kinds[handle-1]=="shaderNoMip"`.
function shaderNoMip(kinds,handle) return handle>0 and handle<=len(kinds) and kinds[handle-1]=="shaderNoMip" end function
/// Constructs `mq3.renderer.qvm_2d_batch.Point` with `x` = `x*scaleX`, `y` = `y*scaleY`, `depth` = `SCREEN_DEPTH`.
/// @param x Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`.
/// @param y Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`.
/// @param scaleX Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`.
/// @param scaleY Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`.
function scaledPoint(x,y,scaleX,scaleY) return Point(x*scaleX,y*scaleY,SCREEN_DEPTH) end function
/// Returns `true` from `mq3.renderer.qvm_2d_batch.sameValues`; earlier branches return `false`.
/// @param left Indexed input read at `index`.
/// @param right Indexed input read at `index`.
function sameValues(left,right)
  if left==void or right==void or len(left)!=len(right) then return false end if
  if len(left)>0 then for index=0 to len(left)-1 if left[index]!=right[index] then return false end if end for end if;return true
end function
/// Compares command count, command IDs, shaders, and all associated command values.
/// @param left Indexed input read at `index`.
/// @param right Indexed input read at `index`.
function sameCommands(left,right)
  if left==void or right==void or len(left)!=len(right) then return false end if
  if len(left)>0 then for index=0 to len(left)-1 a=left[index];b=right[index];if a.id!=b.id or a.shader!=b.shader or not sameValues(a.values,b.values) then return false end if end for end if;return true
end function
/// Compares only command count, IDs, and shaders to determine whether 2D batch topology can be reused.
/// @param left Indexed input read at `index`.
/// @param right Indexed input read at `index`.
function sameTopology(left,right)
  if left==void or right==void or len(left)!=len(right) then return false end if
  if len(left)>0 then for index=0 to len(left)-1 if left[index].id!=right[index].id or left[index].shader!=right[index].shader then return false end if end for end if;return true
end function
/// Identifies 2D stages with animation, UV modifiers, nontexture coordinate generation, or waveform color/alpha.
/// @param stage Record providing `stage.slots`, `stage.uvMods`, `stage.tcGen`, `stage.rgbGen`, `stage.alphaGen`.
function dynamicStage(stage)
  if stage==void then return true end if
  return len(stage.slots)>1 or len(stage.uvMods)>0 or stage.tcGen!="texture" or stage.rgbGen=="wave" or stage.alphaGen=="wave"
end function

/// Builds `mq3.renderer.qvm_2d_batch.Extracted` using `quadList.add`, `quadList.toArray`.
/// @param queueCommands Sequence traversed as `command` while producing this result.
/// @param assets Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.shaderName`.
/// @param kinds Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.shaderName`.
/// @param sourceWidth Initial value for `mq3.renderer.qvm_2d_batch.Extracted.sourceWidth`.
/// @param sourceHeight Initial value for `mq3.renderer.qvm_2d_batch.Extracted.sourceHeight`.
/// @param targetWidth Initial value for `mq3.renderer.qvm_2d_batch.Extracted.targetWidth`.
/// @param targetHeight Initial value for `mq3.renderer.qvm_2d_batch.Extracted.targetHeight`.
function extract(queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight)
  if queueCommands==void or assets==void or kinds==void then return fail("commands and asset registry are required") end if
  if len(assets)!=len(kinds) then return fail("asset registry length mismatch") end if
  if sourceWidth<=0 or sourceHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("screen dimensions must be positive") end if
  scaleX=targetWidth/sourceWidth;scaleY=targetHeight/sourceHeight;color=[255,255,255,255];quadList=lists.List.withCapacity(len(queueCommands));setColors=0;ignored=0;commandIndex=0
  for each command in queueCommands
    if command.id==q2commands.RC_SET_COLOR then
      if len(command.values)!=4 then return fail("invalid SetColor command") end if
      color=colorBytes(command.values);setColors=setColors+1
    else if command.id==q2commands.RC_STRETCH_PIC then
      if len(command.values)!=8 then return fail("invalid DrawStretchPic command") end if
      v=command.values;x=v[0];y=v[1];w=v[2];h=v[3]
      positions=[scaledPoint(x,y,scaleX,scaleY),scaledPoint(x+w,y,scaleX,scaleY),scaledPoint(x+w,y+h,scaleX,scaleY),scaledPoint(x,y+h,scaleX,scaleY)]
      texCoords=[[v[4],v[5]],[v[6],v[5]],[v[6],v[7]],[v[4],v[7]]]
      quadList.add(Quad(command.shader,shaderName(assets,kinds,command.shader),positions,texCoords,[color[0],color[1],color[2],color[3]],commandIndex))
    else ignored=ignored+1
    end if
    commandIndex=commandIndex+1
  end for
  return Extracted(quadList.toArray(),setColors,ignored,sourceWidth,sourceHeight,targetWidth,targetHeight)
end function

/// Splits a HUD quad into two triangles while preserving UVs, RGBA modulation, and the source command index.
/// @param quad Record providing `quad.positions`, `quad.texCoords`, `quad.color`, `quad.commandIndex`.
/// @param materialIndex Unused compatibility argument retained by this entry point.
function trianglesFor(quad,materialIndex)
  p=quad.positions;uv=quad.texCoords;c=quad.color;colors=[[c[0],c[1],c[2],c[3]],[c[0],c[1],c[2],c[3]],[c[0],c[1],c[2],c[3]]]
  // RB_StretchPic writes indexes 3,0,2 and 2,0,1.
  return [Triangle([p[3],p[0],p[2]],[uv[3],uv[0],uv[2]],colors,quad.commandIndex),Triangle([p[2],p[0],p[1]],[uv[2],uv[0],uv[1]],colors,quad.commandIndex)]
end function

/// Calls `mq3.renderer.playable_materials.Image` with `(1,1,bytes(4,255))` and returns its result.
function whiteImage()
  return materials.Image(1,1,bytes(4,255))
end function
/// Builds `pixels[1]`, `pixels[3]`, `pixels[4]`, `pixels[5]`, `pixels[6]` in `mq3.renderer.qvm_2d_batch.checkerImage`; returns `materials.Image(2,2,pixels)`.
function checkerImage()
  pixels=bytes(16,255);pixels[1]=0;pixels[3]=255;pixels[4]=0;pixels[5]=0;pixels[6]=0;pixels[7]=255;pixels[8]=0;pixels[9]=0;pixels[10]=0;pixels[11]=255;pixels[13]=0
  return materials.Image(2,2,pixels)
end function
/// Forwards `directStage` to `mq3.renderer.playable_materials.RuntimeStage` and returns its result.
/// @param imageName Name stored in the single-image runtime stage.
/// @param image Decoded image object stored in the stage.
/// @param slot Native texture slot assigned to that image.
function directStage(imageName,image,slot)
  return materials.RuntimeStage([imageName],[image],[slot],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","vertex",shaderParser.blankWave(),"vertex",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
end function
/// Returns `-1` from `mq3.renderer.qvm_2d_batch.materialIndex`; earlier branches return `-1`, `index`.
/// @param materialList Indexed input read at `index`.
/// @param handle Input used by `for index=0 to len(materialList)-1 if materialList[index].shaderHandle==handle then return index`.
function materialIndex(materialList,handle)
  if len(materialList)==0 then return -1 end if
  for index=0 to len(materialList)-1 if materialList[index].shaderHandle==handle then return index end if end for
  return -1
end function
/// Computes `material!=void and stringEqualsIgnoreCaseAscii(material.shaderName,name)` for `mq3.renderer.qvm_2d_batch.materialMatches`.
/// @param material Record providing `material.shaderName`.
/// @param name Argument 2 supplied to `stringEqualsIgnoreCaseAscii`.
function materialMatches(material,name) return material!=void and stringEqualsIgnoreCaseAscii(material.shaderName,name) end function
/// Computes `addStageTextures` from `textureList` using `mq3.renderer.qvm_2d_batch.Texture`.
/// @param textureList Input used by `result=textureList`.
/// @param stages Sequence traversed as `stage` while producing this result.
/// @param noMipMaps Value used for `mq3.renderer.qvm_2d_batch.Texture.noMipMaps`.
function addStageTextures(textureList,stages,noMipMaps)
  result=textureList
  for each stage in stages for index=0 to len(stage.slots)-1
    exists=false;for each texture in result if texture.slot==stage.slots[index] then exists=true;break end if end for
    if not exists then result=result+[Texture(stage.imageNames[index],stage.images[index],stage.slots[index],noMipMaps)] end if
  end for end for
  return result
end function
/// Computes `loadMaterial` from `[Material(quad.shaderHandle,name,stages,noMip,0.0,clampTime),nextSlot]` using `mq3.renderer.shader_index.find`, `mq3.renderer.playable_materials.runtimeStages`, `mq3.renderer.playable_materials.loadImage`.
/// @param archive Argument 1 supplied to `mq3.renderer.playable_materials.runtimeStages`.
/// @param index Argument 1 supplied to `mq3.renderer.shader_index.find`.
/// @param quad Record providing `quad.shaderName`, `quad.shaderHandle`.
/// @param nextSlot Argument 4 supplied to `mq3.renderer.playable_materials.runtimeStages`.
/// @param endSlot Argument 5 supplied to `mq3.renderer.playable_materials.runtimeStages`.
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

/// Builds `mq3.renderer.qvm_2d_batch.StagePass` using `mq3.platform.playable_window.resetTriangleBatch`, `mq3.platform.playable_window.createTriangleBatch`, `mq3.platform.playable_window.appendScreenQuad`.
/// @param stage Initial value for `mq3.renderer.qvm_2d_batch.StagePass.stage`.
/// @param triangles Initial value for `mq3.renderer.qvm_2d_batch.StagePass.triangles`.
/// @param timeOffset Initial value for `mq3.renderer.qvm_2d_batch.StagePass.timeOffset`.
/// @param clampTime Initial value for `mq3.renderer.qvm_2d_batch.StagePass.clampTime`.
/// @param previous Record providing `previous.batch`.
function createPassReusable(stage,triangles,timeOffset,clampTime,previous)
  batch=void
  if previous!=void and previous.batch!=void and previous.batch.capacity>=len(triangles) then batch=window.resetTriangleBatch(previous.batch)
  else batch=window.createTriangleBatch(len(triangles));if batch is error then return batch end if end if
  slot=stage.slots[0];triangleIndex=0
  while triangleIndex+1<len(triangles)
    first=triangles[triangleIndex];second=triangles[triangleIndex+1]
    // trianglesFor emits [3,0,2] then [2,0,1]; reconstruct the source quad
    // and let the native ABI pack both identical 128-byte records at once.
    positions=[first.positions[1],second.positions[2],first.positions[2],first.positions[0]]
    texCoords=[first.texCoords[1],second.texCoords[2],first.texCoords[2],first.texCoords[0]]
    batch=window.appendScreenQuad(batch,slot,positions,texCoords,first.colors[0]);if batch is error then return batch end if;triangleIndex=triangleIndex+2
  end while
  if triangleIndex<len(triangles) then triangle=triangles[triangleIndex];p=triangle.positions;uv=triangle.texCoords;c=triangle.colors;batch=window.appendSingleTextureTriangleColored(batch,slot,p[0],uv[0],1.0,c[0],p[1],uv[1],1.0,c[1],p[2],uv[2],1.0,c[2],255,255,255);if batch is error then return batch end if end if
  return StagePass(stage,triangles,batch,timeOffset,clampTime,false,dynamicStage(stage))
end function
/// Calls `mq3.renderer.qvm_2d_batch.createPassReusable` with `(stage,triangles,timeOffset,clampTime,void)` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.qvm_2d_batch.createPassReusable`.
/// @param triangles Value forwarded as `triangles` to `mq3.renderer.qvm_2d_batch.createPassReusable`.
/// @param timeOffset Value forwarded as `timeOffset` to `mq3.renderer.qvm_2d_batch.createPassReusable`.
/// @param clampTime Value forwarded as `clampTime` to `mq3.renderer.qvm_2d_batch.createPassReusable`.
function createPass(stage,triangles,timeOffset,clampTime) return createPassReusable(stage,triangles,timeOffset,clampTime,void) end function
/// Builds `mq3.renderer.qvm_2d_batch.Run` using `triangleList.addAll`, `triangleList.toArray`, `passList.add`.
/// @param materialIndexValue Initial value for `mq3.renderer.qvm_2d_batch.Run.materialIndex`.
/// @param handle Initial value for `mq3.renderer.qvm_2d_batch.Run.shaderHandle`.
/// @param material Record providing `material.stages`, `material.timeOffset`, `material.clampTime`.
/// @param quads Sequence traversed as `quad` while producing this result.
/// @param previous Record providing `previous.materialIndex`, `previous.shaderHandle`, `previous.triangleCount`, `previous.passes`.
function createRunReusable(materialIndexValue,handle,material,quads,previous)
  triangleList=lists.List.withCapacity(len(quads)*2);for each quad in quads triangleList.addAll(trianglesFor(quad,materialIndexValue)) end for;triangles=triangleList.toArray()
  canReuse=previous!=void and previous.materialIndex==materialIndexValue and previous.shaderHandle==handle and previous.triangleCount==len(triangles) and len(previous.passes)==len(material.stages)
  passList=lists.List.withCapacity(len(material.stages));stageIndex=0
  for each stage in material.stages oldPass=void;if canReuse then oldPass=previous.passes[stageIndex] end if;pass=createPassReusable(stage,triangles,material.timeOffset,material.clampTime,oldPass);if pass is error then return pass end if;passList.add(pass);stageIndex=stageIndex+1 end for
  return Run(materialIndexValue,handle,passList.toArray(),len(quads),len(triangles))
end function
/// Calls `mq3.renderer.qvm_2d_batch.createRunReusable` with `(materialIndexValue,handle,material,quads,void)` and returns its result.
/// @param materialIndexValue Value forwarded as `materialIndexValue` to `mq3.renderer.qvm_2d_batch.createRunReusable`.
/// @param handle Value forwarded as `handle` to `mq3.renderer.qvm_2d_batch.createRunReusable`.
/// @param material Value forwarded as `material` to `mq3.renderer.qvm_2d_batch.createRunReusable`.
/// @param quads Value forwarded as `quads` to `mq3.renderer.qvm_2d_batch.createRunReusable`.
function createRun(materialIndexValue,handle,material,quads) return createRunReusable(materialIndexValue,handle,material,quads,void) end function

/// Updates `catalog.lastCommands`, `catalog.sourceWidth`, `catalog.sourceHeight`, `catalog.targetWidth`, `catalog.targetHeight` in `mq3.renderer.qvm_2d_batch.refreshStaticTopology`; returns `catalog`.
/// @param catalog Mutable record or buffer; this call updates `catalog.lastCommands`, `catalog.sourceWidth`, `catalog.sourceHeight`, `catalog.targetWidth`, `catalog.targetHeight`.
/// @param queueCommands Value assigned to `catalog.lastCommands`.
/// @param sourceWidth Value assigned to `catalog.sourceWidth`.
/// @param sourceHeight Value assigned to `catalog.sourceHeight`.
/// @param targetWidth Value assigned to `catalog.targetWidth`.
/// @param targetHeight Value assigned to `catalog.targetHeight`.
function refreshStaticTopology(catalog,queueCommands,sourceWidth,sourceHeight,targetWidth,targetHeight)
  colors=array(len(queueCommands),void);color=[255,255,255,255]
  if len(queueCommands)>0 then for commandIndex=0 to len(queueCommands)-1
    command=queueCommands[commandIndex]
    if command.id==q2commands.RC_SET_COLOR then if len(command.values)!=4 then return false end if;color=colorBytes(command.values)
    else if command.id==q2commands.RC_STRETCH_PIC then if len(command.values)!=8 then return false end if;colors[commandIndex]=[color[0],color[1],color[2],color[3]] end if
  end for end if
  scaleX=targetWidth/sourceWidth;scaleY=targetHeight/sourceHeight
  for each run in catalog.runs for each pass in run.passes
    for quadIndex=0 to run.quadCount-1
      triangleIndex=quadIndex*2;commandIndex=pass.triangles[triangleIndex].commandIndex
      if commandIndex<0 or commandIndex>=len(queueCommands) or colors[commandIndex]==void then return false end if
      command=queueCommands[commandIndex];if command.shader!=run.shaderHandle then return false end if;v=command.values
      outputColor=colors[commandIndex]
      if pass.dynamic then
        positions=[scaledPoint(v[0],v[1],scaleX,scaleY),scaledPoint(v[0]+v[2],v[1],scaleX,scaleY),scaledPoint(v[0]+v[2],v[1]+v[3],scaleX,scaleY),scaledPoint(v[0],v[1]+v[3],scaleX,scaleY)];texCoords=[[v[4],v[5]],[v[6],v[5]],[v[6],v[7]],[v[4],v[7]]]
        updated=trianglesFor(Quad(run.shaderHandle,"",positions,texCoords,outputColor,commandIndex),run.materialIndex);pass.triangles[triangleIndex]=updated[0];pass.triangles[triangleIndex+1]=updated[1];pass.initialized=false
      else effective=materials.shaderMilliseconds(0.0,0.0,pass.timeOffset,pass.clampTime);outputColor=materials.stageColor(pass.stage,outputColor,effective);pass.initialized=true end if
      written=window.writeScreenRect(pass.batch,triangleIndex,pass.stage.slots[0],v[0],v[1],v[2],v[3],v[4],v[5],v[6],v[7],scaleX,scaleY,outputColor);if written is error then return written end if
    end for
  end for end for
  catalog.lastCommands=queueCommands;catalog.sourceWidth=sourceWidth;catalog.sourceHeight=sourceHeight;catalog.targetWidth=targetWidth;catalog.targetHeight=targetHeight;return catalog
end function

// Rebuild only the changing quad/run buffers.  Shader parsing, PK3 image
// decoding and texture-slot assignment remain cached in the catalog.
/// @param catalog Mutable record or buffer; this call updates `catalog.runs`, `catalog.sourceQuads`, `catalog.emittedTriangles`, `catalog.resolvedQuads`, `catalog.unresolvedQuads`.
/// @param queueCommands Value assigned to `catalog.lastCommands`.
/// @param assets Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param kinds Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param sourceWidth Value assigned to `catalog.sourceWidth`.
/// @param sourceHeight Value assigned to `catalog.sourceHeight`.
/// @param targetWidth Value assigned to `catalog.targetWidth`.
/// @param targetHeight Value assigned to `catalog.targetHeight`.
function refresh(catalog,queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight)
  if catalog==void then return fail("catalog is required") end if
  revision=0;if catalog.shaderRemaps!=void then revision=catalog.shaderRemaps.revision end if
  sameDimensions=catalog.sourceWidth==sourceWidth and catalog.sourceHeight==sourceHeight and catalog.targetWidth==targetWidth and catalog.targetHeight==targetHeight
  if sameDimensions and catalog.assetCount==len(assets) and catalog.remapRevision==revision and sameCommands(catalog.lastCommands,queueCommands) then return catalog end if
  if sameDimensions and catalog.assetCount==len(assets) and catalog.remapRevision==revision and sameTopology(catalog.lastCommands,queueCommands) then cached=refreshStaticTopology(catalog,queueCommands,sourceWidth,sourceHeight,targetWidth,targetHeight);if cached is error then return cached end if;if cached!=false then return cached end if end if
  extracted=extract(queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight);if extracted is error then return extracted end if
  for each material in catalog.materials offset=shaderRemap.timeOffsetForHandle(catalog.shaderRemaps,material.shaderHandle);material.timeOffset=0.0;if offset!=void then material.timeOffset=offset end if end for
  oldRuns=catalog.runs;runIndex=0;runList=lists.List.withCapacity(len(extracted.quads));catalog.runs=[];catalog.sourceQuads=len(extracted.quads);catalog.emittedTriangles=0;catalog.resolvedQuads=0;catalog.unresolvedQuads=0
  current=lists.List.withCapacity(len(extracted.quads));currentHandle=-1
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
    if currentHandle!=quad.shaderHandle and current.len()>0 then
      previousIndex=materialIndex(catalog.materials,currentHandle);oldRun=void;if runIndex<len(oldRuns) then oldRun=oldRuns[runIndex] end if;run=createRunReusable(previousIndex,currentHandle,catalog.materials[previousIndex],current.toArray(),oldRun);if run is error then return run end if;runList.add(run);runIndex=runIndex+1;catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes);current.clear()
    end if
    currentHandle=quad.shaderHandle;current.add(quad)
  end for
  if current.len()>0 then index=materialIndex(catalog.materials,currentHandle);oldRun=void;if runIndex<len(oldRuns) then oldRun=oldRuns[runIndex] end if;run=createRunReusable(index,currentHandle,catalog.materials[index],current.toArray(),oldRun);if run is error then return run end if;runList.add(run);catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes) end if
  catalog.runs=runList.toArray();catalog.lastCommands=queueCommands;catalog.remapRevision=revision;catalog.assetCount=len(assets);catalog.sourceWidth=sourceWidth;catalog.sourceHeight=sourceHeight;catalog.targetWidth=targetWidth;catalog.targetHeight=targetHeight
  return catalog
end function

/// Builds `material.noMipMaps`, `material.timeOffset`, `catalog.nextTextureSlot`, `catalog.materials`, `catalog.textures` in `mq3.renderer.qvm_2d_batch.buildIndexed`; returns `catalog`.
/// @param archive Value used for `mq3.renderer.qvm_2d_batch.Catalog.archive`.
/// @param queueCommands Value forwarded as `queueCommands` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param assets Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param kinds Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param firstTextureSlot Value used for `mq3.renderer.qvm_2d_batch.Catalog.nextTextureSlot`.
/// @param maxTextureSlots Input tested by `firstTextureSlot<0 or maxTextureSlots<0 or firstTextureSlot+maxTextureSlots>window.NATIVE_TEXTURE_SLOTS`.
/// @param sourceWidth Value forwarded as `sourceWidth` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param sourceHeight Value forwarded as `sourceHeight` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param targetWidth Value forwarded as `targetWidth` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param targetHeight Value forwarded as `targetHeight` to `mq3.renderer.qvm_2d_batch.extract`.
/// @param shaderRemaps Record providing `shaderRemaps.revision`.
/// @param scripts Indexed input read at `0`, `1`.
function buildIndexed(archive,queueCommands,assets,kinds,firstTextureSlot,maxTextureSlots,sourceWidth,sourceHeight,targetWidth,targetHeight,shaderRemaps,scripts)
  if archive==void then return fail("PK3 archive is required") end if
  if firstTextureSlot<0 or maxTextureSlots<0 or firstTextureSlot+maxTextureSlots>window.NATIVE_TEXTURE_SLOTS then return fail("invalid native texture slot range") end if
  extracted=extract(queueCommands,assets,kinds,sourceWidth,sourceHeight,targetWidth,targetHeight);if extracted is error then return extracted end if
  if scripts==void or len(scripts)!=2 or scripts[0]==void then return fail("shared shader index is required") end if
  revision=0;if shaderRemaps!=void then revision=shaderRemaps.revision end if
  catalog=Catalog([],[],[],archive,scripts[0],scripts[1],len(extracted.quads),0,0,0,firstTextureSlot,firstTextureSlot+maxTextureSlots,shaderRemaps,queueCommands,revision,len(assets),sourceWidth,sourceHeight,targetWidth,targetHeight);endSlot=catalog.endTextureSlot
  runList=lists.List.withCapacity(len(extracted.quads));current=lists.List.withCapacity(len(extracted.quads));currentHandle=-1
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
    if currentHandle!=quad.shaderHandle and current.len()>0 then
      previousIndex=materialIndex(catalog.materials,currentHandle);run=createRun(previousIndex,currentHandle,catalog.materials[previousIndex],current.toArray());if run is error then return run end if;runList.add(run);catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes);current.clear()
    end if
    currentHandle=quad.shaderHandle;current.add(quad)
  end for
  if current.len()>0 then index=materialIndex(catalog.materials,currentHandle);run=createRun(index,currentHandle,catalog.materials[index],current.toArray());if run is error then return run end if;runList.add(run);catalog.emittedTriangles=catalog.emittedTriangles+run.triangleCount*len(run.passes) end if
  catalog.runs=runList.toArray()
  return catalog
end function
/// Builds a shared shader-script index and creates the scaled QVM 2D draw catalog from queued commands.
/// @param archive Argument 1 supplied to `mq3.renderer.playable_materials.buildScriptIndex`.
/// @param queueCommands Value forwarded as `queueCommands` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param assets Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param kinds Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param firstTextureSlot Value forwarded as `firstTextureSlot` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param maxTextureSlots Value forwarded as `maxTextureSlots` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param sourceWidth Value forwarded as `sourceWidth` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param sourceHeight Value forwarded as `sourceHeight` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param targetWidth Value forwarded as `targetWidth` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param targetHeight Value forwarded as `targetHeight` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
/// @param shaderRemaps Value forwarded as `shaderRemaps` to `mq3.renderer.qvm_2d_batch.buildIndexed`.
function build(archive,queueCommands,assets,kinds,firstTextureSlot,maxTextureSlots,sourceWidth,sourceHeight,targetWidth,targetHeight,shaderRemaps)
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  return buildIndexed(archive,queueCommands,assets,kinds,firstTextureSlot,maxTextureSlots,sourceWidth,sourceHeight,targetWidth,targetHeight,shaderRemaps,scripts)
end function

/// Computes `uploadFrom` from `len(catalog.textures)` using `mq3.platform.playable_window.uploadTextureMipmapped`.
/// @param catalog Record providing `catalog.textures`.
/// @param first Input tested by `first<0 or first>len(catalog.textures)`.
function uploadFrom(catalog,first)
  if catalog==void then return fail("catalog is required") end if
  if first<0 or first>len(catalog.textures) then return fail("invalid upload cursor") end if
  if first==len(catalog.textures) then return first end if
  for index=first to len(catalog.textures)-1
    texture=catalog.textures[index]
    if not window.uploadTextureMipmapped(texture.slot,texture.image.pixels,texture.image.width,texture.image.height,not texture.noMipMaps) then return fail("could not upload "+texture.imageName) end if
  end for
  return len(catalog.textures)
end function
/// Calls `mq3.renderer.qvm_2d_batch.uploadFrom` with `(catalog,0)` and returns its result.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.qvm_2d_batch.uploadFrom`.
function upload(catalog) return uploadFrom(catalog,0) end function
/// Returns `void` from `mq3.renderer.qvm_2d_batch.release`.
/// @param catalog Record providing `catalog.textures`.
function release(catalog) if catalog!=void then for each texture in catalog.textures window.releaseTexture(texture.slot) end for end if;return void end function

/// Updates `pass.initialized` in `mq3.renderer.qvm_2d_batch.updatePass`; returns `slot`.
/// @param pass Mutable record or buffer; this call updates `pass.initialized`.
/// @param nowMilliseconds Argument 1 supplied to `mq3.renderer.playable_materials.shaderMilliseconds`.
function updatePass(pass,nowMilliseconds)
  effectiveMilliseconds=materials.shaderMilliseconds(nowMilliseconds,0.0,pass.timeOffset,pass.clampTime);slot=materials.slotAt(pass.stage,effectiveMilliseconds)
  if pass.initialized and not pass.dynamic then return slot end if
  for triangleIndex=0 to len(pass.triangles)-1
    triangle=pass.triangles[triangleIndex];offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES;window.writeBatchI32(pass.batch.data,offset,slot)
    for vertex=0 to 2
      p=triangle.positions[vertex];uv=materials.transformUVAt(pass.stage,triangle.texCoords[vertex],[p.x,p.y,0.0],effectiveMilliseconds);if uv is error then return uv end if
      color=materials.stageColor(pass.stage,triangle.colors[vertex],effectiveMilliseconds);uvOffset=offset+32+vertex*32;window.writeBatchF32(pass.batch.data,uvOffset,uv[0]);window.writeBatchF32(pass.batch.data,uvOffset+4,uv[1]);window.writeBatchColor(pass.batch.data,offset+116+vertex*4,color)
    end for
  end for
  pass.initialized=true;return slot
end function
/// Updates and draws each 2D shader pass, then restores clamp, alpha-test, and opaque depth-write defaults.
/// @param catalog Record providing `catalog.runs`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.qvm_2d_batch.updatePass`.
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
