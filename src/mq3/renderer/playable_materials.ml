// SPDX-License-Identifier: GPL-2.0-or-later
// Bounded Baseq3 material resolver for the interactive software-rendered slice.
package mq3.renderer.playable_materials
import mq3.compat.numeric as n
import mq3.format.pk3 as pk3
import mq3.renderer.tga as tga
import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser
import mq3.shared.parser as tokenParser
import mq3.platform.playable_jpeg as jpeg
import mq3.compat.transcendental as trans
import std.string as strings

const SHADER_STRIDE=72
const SHADER_NAME_BYTES=64
const BASE_TEXTURE_FIRST_SLOT=64
const BASE_TEXTURE_SLOT_COUNT=128
const MAX_RUNTIME_STAGES=3
const MAX_ANIMATION_FRAMES=8
const BLEND_OPAQUE=0
const BLEND_ALPHA=1
const BLEND_ADD=2
const ALPHA_TEST_NONE=0
const ALPHA_TEST_GT0=1
const ALPHA_TEST_LT128=2
const ALPHA_TEST_GE128=3

struct Image width height pixels end struct
struct UvMod kind a b end struct
struct RuntimeStage imageNames images slots animationSpeed uvMods blend alphaTest rgbGen rgbWave end struct
struct Material textureIndex shaderName imageName image slot stages end struct
struct Catalog materials scripts attempted loaded textureCount animatedStageCount effectStageCount end struct

function fail(message) return error(7486,"preview materials: "+message) end function
function validMap(map) return map!=void and typeof(map.data)=="bytes" and len(map.offsets)>1 and len(map.counts)>1 end function

function shaderName(map,index)
  if not validMap(map) then return fail("invalid BSP") end if
  if index<0 or index>=map.counts[1] then return fail("shader index outside BSP") end if
  offset=map.offsets[1]+index*SHADER_STRIDE
  if offset<0 or offset+SHADER_STRIDE>len(map.data) then return fail("truncated BSP shader") end if
  length=0;while length<SHADER_NAME_BYTES and map.data[offset+length]!=0 length=length+1 end while
  return decode(slice(map.data,offset,length))
end function

function endsIgnoreCase(value,suffix)
  return strings.endsWith(strings.toLowerAscii(value),strings.toLowerAscii(suffix))
end function

function candidates(name)
  if name==void or name=="" then return [] end if
  if endsIgnoreCase(name,".tga") or endsIgnoreCase(name,".jpg") or endsIgnoreCase(name,".jpeg") then return [name] end if
  return [name+".tga",name+".jpg",name+".jpeg"]
end function

function buildScriptIndex(archive)
  if archive==void or archive.entries==void then return fail("invalid PK3 archive") end if
  text="";count=0
  for each entry in archive.entries
    if endsIgnoreCase(entry.name,".shader") then
      source=try(pk3.readEntry(archive,entry))
      if not (source is error) then text=text+decode(source)+"\n";count=count+1 end if
    end if
  end for
  index=shaderIndex.build(text);if index is error then return index end if
  return [index,count]
end function

// Select the first actual image of a shader stage. This intentionally ignores
// blend animation and tcMod for the first playable slice, but understands both
// map/clampMap and the first frame of animMap without requiring a full shader parse.
function mappedImageName(index,name)
  if index==void then return void end if
  entry=shaderIndex.find(index,name);if entry==void then return void end if
  state=tokenParser.create(index.text);state.offset=entry.bodyOffset
  if tokenParser.parseExt(state,true)!="{" then return void end if
  depth=1
  while depth>0
    token=tokenParser.parseExt(state,true);if token=="" then return void end if
    if token=="{" then depth=depth+1
    else if token=="}" then depth=depth-1
    else if depth==2 then
      command=strings.toLowerAscii(token)
      image=void
      if command=="map" or command=="clampmap" then image=tokenParser.parseExt(state,false)
      else if command=="animmap" then
        speed=tokenParser.parseExt(state,false);if speed!="" then image=tokenParser.parseExt(state,false) end if
      end if
      if image!=void and image!="" then
        lower=strings.toLowerAscii(image)
        if lower!="$lightmap" and lower!="$whiteimage" then return image end if
      end if
    end if
  end while
  return void
end function

function decodeAsset(name,data)
  if endsIgnoreCase(name,".tga") then
    result=tga.decode(data);if result is error then return result end if
    return Image(result.width,result.height,result.pixels)
  end if
  if endsIgnoreCase(name,".jpg") or endsIgnoreCase(name,".jpeg") then
    result=jpeg.decode(data);if result is error then return result end if
    return Image(result.width,result.height,result.pixels)
  end if
  return fail("unsupported image extension")
end function

function loadImage(archive,name)
  for each candidate in candidates(name)
    data=try(pk3.read(archive,candidate))
    if not (data is error) then
      image=try(decodeAsset(candidate,data))
      if not (image is error) then return [candidate,image] end if
    end if
  end for
  return void
end function

function containsIndex(materials,index)
  for each material in materials if material.textureIndex==index then return true end if end for
  return false
end function

function stageBlend(stage)
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_ONE and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE then return BLEND_ADD end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_SRC_ALPHA and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA then return BLEND_ALPHA end if
  return BLEND_OPAQUE
end function

function stageAlphaTest(stage)
  if stage.alphaFunc==shaderParser.GLS_ATEST_GT_0 then return ALPHA_TEST_GT0 end if
  if stage.alphaFunc==shaderParser.GLS_ATEST_LT_80 then return ALPHA_TEST_LT128 end if
  if stage.alphaFunc==shaderParser.GLS_ATEST_GE_80 then return ALPHA_TEST_GE128 end if
  return ALPHA_TEST_NONE
end function

function stageMods(stage)
  result=[]
  for each mod in stage.texMods
    if mod.kind=="scroll" and len(mod.values)>=2 then result=result+[UvMod("scroll",mod.values[0],mod.values[1])]
    else if mod.kind=="rotate" and len(mod.values)>=1 then result=result+[UvMod("rotate",mod.values[0],0.0)]
    end if
  end for
  return result
end function

function usableStage(stage)
  if stage==void or stage.isLightmap or len(stage.images)==0 then return false end if
  name=strings.toLowerAscii(stage.images[0]);return name!="$lightmap" and name!="$whiteimage"
end function

function loadRuntimeStage(archive,stage,nextSlot,endSlot)
  names=[];images=[];slots=[];limit=len(stage.images);if limit>MAX_ANIMATION_FRAMES then limit=MAX_ANIMATION_FRAMES end if
  for index=0 to limit-1
    if nextSlot>=endSlot then break end if
    loaded=loadImage(archive,stage.images[index])
    if loaded!=void then names=names+[loaded[0]];images=images+[loaded[1]];slots=slots+[nextSlot];nextSlot=nextSlot+1 end if
  end for
  if len(images)==0 then return void end if
  return [RuntimeStage(names,images,slots,stage.animationSpeed,stageMods(stage),stageBlend(stage),stageAlphaTest(stage),stage.rgbGen,stage.rgbWave),nextSlot]
end function

function directRuntimeStage(archive,name,nextSlot,endSlot)
  if nextSlot>=endSlot then return void end if
  loaded=loadImage(archive,name);if loaded==void then return void end if
  return [RuntimeStage([loaded[0]],[loaded[1]],[nextSlot],0.0,[],BLEND_OPAQUE,ALPHA_TEST_NONE,"identitylighting",shaderParser.blankWave()),nextSlot+1]
end function

function runtimeStages(archive,index,name,nextSlot,endSlot)
  result=[];parsed=try(shaderParser.parseIndexed(index,name))
  if not (parsed is error) and parsed!=void then
    for each parsedStage in parsed.stages
      if usableStage(parsedStage) and len(result)<MAX_RUNTIME_STAGES then
        loaded=loadRuntimeStage(archive,parsedStage,nextSlot,endSlot)
        if loaded!=void then result=result+[loaded[0]];nextSlot=loaded[1] end if
      end if
    end for
  end if
  if len(result)==0 then
    mapped=mappedImageName(index,name);if mapped==void then mapped=name end if
    loaded=directRuntimeStage(archive,mapped,nextSlot,endSlot)
    if loaded==void and mapped!=name then loaded=directRuntimeStage(archive,name,nextSlot,endSlot) end if
    if loaded!=void then result=[loaded[0]];nextSlot=loaded[1] end if
  end if
  return [result,nextSlot]
end function

function floorNumber(value) integer=n.trunc32(value);if value<integer then return integer-1 end if;return integer end function
function frameIndex(stage,nowMilliseconds)
  if stage==void or len(stage.slots)<2 or stage.animationSpeed<=0.0 then return 0 end if
  frame=floorNumber(nowMilliseconds*0.001*stage.animationSpeed);if frame<0 then frame=0 end if
  return frame%len(stage.slots)
end function
function slotAt(stage,nowMilliseconds) if stage==void or len(stage.slots)==0 then return -1 end if;return stage.slots[frameIndex(stage,nowMilliseconds)] end function

function waveSignal(wave,nowMilliseconds)
  seconds=n.f32(nowMilliseconds*0.001)
  phase=n.fadd(wave.phase,n.fmul(seconds,wave.frequency))
  index=n.trunc32(n.fmul(phase,1024.0))&1023
  if wave.func==2 then if index<512 then return 1.0 else return -1.0 end if end if
  if wave.func==3 then
    if index<256 then return n.fdiv(index,256.0) end if
    if index<512 then return n.fsub(2.0,n.fdiv(index,256.0)) end if
    if index<768 then return n.fdiv(0-(index-512),256.0) end if
    return n.fsub(n.fdiv(index,256.0),4.0)
  end if
  saw=n.fdiv(index,1024.0)
  if wave.func==4 then return saw end if
  if wave.func==5 then return n.fsub(1.0,saw) end if
  radians=n.fmul(index,n.fdiv(n.fmul(2.0,n.f32(3.14159265358979323846)),1023.0))
  return n.f32(trans.sin(radians))
end function
function waveValue(wave,nowMilliseconds)
  value=n.fadd(wave.base,n.fmul(wave.amplitude,waveSignal(wave,nowMilliseconds)))
  if value<0.0 then return 0.0 end if;if value>1.0 then return 1.0 end if;return value
end function
function stageLight(stage,vertexLight,nowMilliseconds)
  if stage.rgbGen=="wave" then return n.trunc32(n.fmul(255.0,waveValue(stage.rgbWave,nowMilliseconds)))/255.0 end if
  if stage.rgbGen=="identity" then return 1.0 end if
  if stage.rgbGen=="oneminusvertex" then return 1.0-vertexLight end if
  return vertexLight
end function

// RB_CalcScrollTexCoords and RB_CalcRotateTexCoords, in original tcMod order.
function transformUV(stage,uv,nowMilliseconds)
  if stage==void or uv==void or len(uv)!=2 then return fail("stage and two-component UV are required") end if
  result=[uv[0],uv[1]];seconds=nowMilliseconds*0.001
  for each mod in stage.uvMods
    if mod.kind=="scroll" then
      scrollS=mod.a*seconds;scrollS=scrollS-floorNumber(scrollS);scrollT=mod.b*seconds;scrollT=scrollT-floorNumber(scrollT)
      result=[result[0]+scrollS,result[1]+scrollT]
    else if mod.kind=="rotate" then
      radians=0.0-mod.a*seconds*3.14159265358979323846/180.0;sine=trans.sin(radians);cosine=trans.cos(radians);x=result[0]-0.5;y=result[1]-0.5
      result=[x*cosine-y*sine+0.5,x*sine+y*cosine+0.5]
    end if
  end for
  return result
end function

function loadIndexed(archive,map,maxMaterials,firstSlot,index,scriptCount)
  if archive==void or not validMap(map) then return fail("archive and BSP are required") end if
  if maxMaterials<0 or maxMaterials>BASE_TEXTURE_SLOT_COUNT then return fail("material limit outside slot budget") end if
  if firstSlot<BASE_TEXTURE_FIRST_SLOT or firstSlot+maxMaterials>BASE_TEXTURE_FIRST_SLOT+BASE_TEXTURE_SLOT_COUNT then return fail("base texture slots outside range") end if
  if index==void or scriptCount<0 then return fail("shader index and count are required") end if
  materialList=[];attempted=0;nextSlot=firstSlot;endSlot=firstSlot+maxMaterials;animated=0;effects=0
  textureIndex=0
  while textureIndex<map.counts[1] and nextSlot<endSlot
    name=shaderName(map,textureIndex);if name is error then return name end if
    attempted=attempted+1
    resolved=runtimeStages(archive,index,name,nextSlot,endSlot);stages=resolved[0];nextSlot=resolved[1]
    if len(stages)>0 then
      first=stages[0];materialList=materialList+[Material(textureIndex,name,first.imageNames[0],first.images[0],first.slots[0],stages)]
      for each stage in stages
        if len(stage.slots)>1 then animated=animated+1 end if
        if stage.blend!=BLEND_OPAQUE or stage.alphaTest!=ALPHA_TEST_NONE or len(stage.uvMods)>0 then effects=effects+1 end if
      end for
    end if
    textureIndex=textureIndex+1
  end while
  return Catalog(materialList,scriptCount,attempted,len(materialList),nextSlot-firstSlot,animated,effects)
end function

function load(archive,map,maxMaterials,firstSlot)
  scripts=buildScriptIndex(archive);if scripts is error then return scripts end if
  return loadIndexed(archive,map,maxMaterials,firstSlot,scripts[0],scripts[1])
end function

function slotFor(catalog,textureIndex)
  if catalog==void then return -1 end if
  for each material in catalog.materials if material.textureIndex==textureIndex then return material.slot end if end for
  return -1
end function
