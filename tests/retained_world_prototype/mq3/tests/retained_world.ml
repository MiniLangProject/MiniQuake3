// SPDX-License-Identifier: GPL-2.0-or-later
// TEST ONLY. Not imported by the product. The original WorldBatch API is the
// reference, including all shader decisions and binary32 vertex packing.
package mq3.tests.retained_world
import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.playable_fog as fog
import mq3.platform.playable_window as window
import mq3.compat.numeric as n
extern function gatherNative(source as ptr,sourceBytes as i32,sourceCount as i32,target as ptr,targetBytes as i32,runs as ptr,runBytes as i32,selected as ptr,selectedBytes as i32,selectedCount as i32) from "playable_world_gather_prototype.dll" symbol "mq3_test_gather_world" returns i32
extern function equalNative(left as ptr,leftBytes as i32,leftCount as i32,right as ptr,rightBytes as i32,rightCount as i32) from "playable_world_gather_prototype.dll" symbol "mq3_test_world_records_equal" returns i32
struct Stream initial sourceCount runs draw pass supportsUpdates end struct
struct Retained full base stages fog faceCount end struct
function fail(text) return error(7493,"test-only retained world: "+text) end function
function snapshot(commands) return slice(commands.data,0,commands.count*window.TRIANGLE_BATCH_RECORD_BYTES) end function
function streamFor(data,catalog,skyFlags,commands,pass,faceCount,mode,fogCatalog)
  runs=bytes(faceCount*8,0);lookup=void;if mode==0 then lookup=worldBatch.materialTable(data,catalog) end if
  index=0
  for each triangle in data.triangles
    included=false
    if mode==2 then included=triangle.fogIndex>0 and triangle.fogIndex<len(fogCatalog.fogs) end if
    if mode!=2 and not worldBatch.isSky(triangle,skyFlags) then
      if mode==1 then included=triangle.textureIndex==pass.textureIndex end if
      if mode==0 then
        material=void;if triangle.textureIndex>=0 and triangle.textureIndex<len(lookup) then material=lookup[triangle.textureIndex] end if
        included=material==void or len(material.stages)==0
        if not included then included=not worldBatch.dynamicMaterialStage(material,material.stages[0]) end if
      end if
    end if
    if included then
      face=triangle.faceIndex;if face<0 or face>=faceCount then return fail("source face outside map") end if
      offset=face*8;count=n.readI32(runs,offset+4)
      if count==0 then n.writeU32(runs,offset,index) end if
      if count!=0 and n.readI32(runs,offset)+count!=index then return fail("face records are not contiguous") end if
      n.writeU32(runs,offset+4,count+1);index=index+1
    end if
  end for
  if index!=commands.count then return fail("face topology disagrees with reference stream") end if
  capacity=commands.count;if capacity<1 then capacity=1 end if
  draw=window.createTriangleBatch(capacity);if draw is error then return draw end if
  supports=true
  if pass!=void then supports=not worldBatch.hasDeform(pass.deforms,"autosprite") and not worldBatch.hasDeform(pass.deforms,"autosprite2") end if
  return Stream(snapshot(commands),commands.count,runs,draw,pass,supports)
end function
function build(data,catalog,skyFlags,faceCount,fogCatalog)
  full=worldBatch.buildMaterials(data,catalog,skyFlags);if full is error then return full end if
  if fogCatalog!=void then attached=worldBatch.attachFog(full,data,fogCatalog);if attached is error then return attached end if end if
  base=streamFor(data,catalog,skyFlags,full.base,void,faceCount,0,void);if base is error then return base end if
  stages=array(len(full.passes),void)
  if len(stages)>0 then
    for index=0 to len(stages)-1
      stages[index]=streamFor(data,catalog,skyFlags,full.passes[index].commands,full.passes[index],faceCount,1,void);if stages[index] is error then return stages[index] end if
    end for
  end if
  fogStream=void
  if full.fogBatch!=void then fogStream=streamFor(data,catalog,skyFlags,full.fogBatch.commands,void,faceCount,2,fogCatalog);if fogStream is error then return fogStream end if end if
  return Retained(full,base,stages,fogStream,faceCount)
end function
function gatherStream(stream,selected,count,updated,source)
  if stream==void then return 0 end if
  data=stream.initial
  if updated and stream.pass!=void then data=stream.pass.commands.data end if
  if updated and stream.pass==void and source!=void then data=source.data end if
  written=gatherNative(nativeBytesPtr(data),len(data),stream.sourceCount,nativeBytesPtr(stream.draw.data),len(stream.draw.data),nativeBytesPtr(stream.runs),len(stream.runs),nativeBytesPtr(selected),len(selected),count)
  if written<0 then return fail("native gather rejected spans code="+str(written)) end if
  stream.draw.count=written;return written
end function
function gather(cache,selected,count,updated)
  result=gatherStream(cache.base,selected,count,false,void);if result is error then return result end if
  for each stream in cache.stages written=gatherStream(stream,selected,count,updated,void);if written is error then return written end if;result=result+written end for
  if cache.fog!=void then written=gatherStream(cache.fog,selected,count,updated,cache.full.fogBatch.commands);if written is error then return written end if;result=result+written end if
  return result
end function
function same(left,right) return equalNative(nativeBytesPtr(left.data),len(left.data),left.count,nativeBytesPtr(right.data),len(right.data),right.count)==1 end function
function match(cache,reference,updated)
  if not same(cache.base.draw,reference.base) then return fail("base byte stream differs") end if
  output=0;fallbacks=0
  for each stream in cache.stages
    if stream.draw.count==0 then continue end if
    if output>=len(reference.passes) then return fail("reference has fewer material stages") end if
    ref=reference.passes[output]
    if ref.textureIndex!=stream.pass.textureIndex or ref.stage!=stream.pass.stage or ref.depthEqual!=stream.pass.depthEqual or ref.primary!=stream.pass.primary or ref.sort!=stream.pass.sort or ref.polygonOffset!=stream.pass.polygonOffset then return fail("material stage/state order differs") end if
    if not updated or stream.supportsUpdates then
      if not same(stream.draw,ref.commands) then return fail("stage byte stream differs texture="+str(ref.textureIndex)+" output="+str(output)) end if
    else fallbacks=fallbacks+1 end if
    output=output+1
  end for
  if output!=len(reference.passes) then return fail("reference has additional selected stages") end if
  if cache.fog!=void and not same(cache.fog.draw,reference.fogBatch.commands) then return fail("fog byte stream differs") end if
  return fallbacks
end function
function updateAll(cache,origin,left,up,forward,now,fogCatalog)
  for each stream in cache.stages
    if stream.supportsUpdates then result=worldBatch.updatePassAxesFog(stream.pass,origin,left,up,now,fogCatalog);if result is error then return result end if end if
  end for
  if cache.full.fogBatch!=void and cache.full.fogBatch.commands.count>0 then
    fog.update(cache.full.fogBatch,fogCatalog,origin,forward)
  end if
  return true
end function
