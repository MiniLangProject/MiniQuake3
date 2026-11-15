// SPDX-License-Identifier: GPL-2.0-or-later
// Memoized immutable BSP queries. Dynamic/temporary/transformed models always
// execute the original MiniLang service. Cached VM bytes never alias a caller.
package mq3.vm.cgame_collision_cache
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
import std.ds.hashmap as maps

const TRACE_CAPACITY=64
const MARK_CAPACITY=32
const MAX_MARK_BYTES=65536
struct Fifo table keys next used capacity hits misses evictions end struct
struct Memo enabled world map mapData mapDataPointer checksum name patchesReady playerCurveClip traces marks invalidations end struct
function fifo(capacity) return Fifo(maps.HashMap.withCapacity(capacity*2),array(capacity,void),0,0,capacity,0,0,0) end function
function create() return Memo(true,void,void,void,0,0,"",false,false,fifo(TRACE_CAPACITY),fifo(MARK_CAPACITY),0) end function
function clear(memo)
  memo.traces.table.clear();memo.marks.table.clear();memo.traces.keys=array(TRACE_CAPACITY,void);memo.marks.keys=array(MARK_CAPACITY,void)
  memo.traces.next=0;memo.traces.used=0;memo.marks.next=0;memo.marks.used=0;memo.invalidations=memo.invalidations+1;return void
end function
function bind(memo,context)
  world=context.collisionWorld;map=context.markMap;if world==void or map==void then return false end if
  // Struct equality compares object identity. Retain both owners so identity
  // cannot be recycled while an entry remains live; reloads of identical BSP
  // bytes still invalidate when a new World/BSP object replaces either owner.
  dataPointer=nativeBytesPtr(map.data)
  if memo.world!=world or memo.map!=map or memo.mapDataPointer!=dataPointer or memo.checksum!=world.checksum or memo.name!=world.name or memo.patchesReady!=world.patchesReady or memo.playerCurveClip!=world.playerCurveClip then
    clear(memo);memo.world=world;memo.map=map;memo.mapData=map.data;memo.mapDataPointer=dataPointer;memo.checksum=world.checksum;memo.name=world.name;memo.patchesReady=world.patchesReady;memo.playerCurveClip=world.playerCurveClip
  end if;return true
end function
function remember(cache,key,value)
  if cache.used==cache.capacity then old=cache.keys[cache.next];cache.table.remove(old);cache.evictions=cache.evictions+1 else cache.used=cache.used+1 end if
  cache.keys[cache.next]=key;cache.next=(cache.next+1)%cache.capacity;cache.table.set(key,value);return void
end function
function vectorBytes(vm,address,target,offset)
  source=common.pointer(vm,address,12,"cgame query vector");copyBytes(target,offset,vm.data,source,12);return void
end function
function aliasesArguments(vm,base,index,count)
  if count<=0 then return false end if;address=common.argument(vm,base,index);if address==0 then return false end if
  at=address&vm.mask;return at<base+32 and base<at+count
end function
function traceKey(vm,base,capsule,world)
  key=bytes(68,0);operation=25;if capsule then operation=83 end if;n.writeU32(key,0,operation);n.writeU32(key,4,common.argument(vm,base,6));n.writeU32(key,8,common.argument(vm,base,7))
  vectorBytes(vm,common.argument(vm,base,2),key,20);vectorBytes(vm,common.argument(vm,base,3),key,32)
  flags=0;mins=common.argument(vm,base,4);maxs=common.argument(vm,base,5)
  if mins!=0 then flags=flags|1;vectorBytes(vm,mins,key,44) end if;if maxs!=0 then flags=flags|2;vectorBytes(vm,maxs,key,56) end if;n.writeU32(key,12,flags)
  flags=0;if world.patchesReady then flags=flags|1 end if;if world.playerCurveClip then flags=flags|2 end if;n.writeU32(key,16,flags);return key
end function
function trace(memo,context,vm,base,capsule,transformed,reference)
  if memo==void or not memo.enabled or transformed or common.argument(vm,base,6)!=0 then return reference(context,vm,base,capsule,transformed) end if
  // A legal output may overwrite the syscall argument vector itself. Such
  // calls retain the reference read/write order, without post-call captures.
  if aliasesArguments(vm,base,1,56) then return reference(context,vm,base,capsule,transformed) end if
  if not bind(memo,context) then return reference(context,vm,base,capsule,transformed) end if
  key=traceKey(vm,base,capsule,context.collisionWorld);stored=memo.traces.table.get(key)
  if stored!=void then
    // Validate each new output pointer, even when all numerical inputs match.
    at=common.pointer(vm,common.argument(vm,base,1),56,"trace_t output");copyBytes(vm.data,at,stored,0,56);memo.traces.hits=memo.traces.hits+1;return 0
  end if
  memo.traces.misses=memo.traces.misses+1;result=reference(context,vm,base,capsule,transformed);if result is error then return result end if
  at=common.pointer(vm,common.argument(vm,base,1),56,"trace_t output");remember(memo.traces,key,slice(vm.data,at,56));return result
end function
function markKey(vm,base,count,maxPoints,maxFragments)
  key=bytes(28+count*12,0);n.writeU32(key,0,27);n.writeU32(key,4,count);n.writeU32(key,8,maxPoints);n.writeU32(key,12,maxFragments)
  vectorBytes(vm,common.argument(vm,base,3),key,16);at=common.pointer(vm,common.argument(vm,base,2),count*12,"mark source points");copyBytes(key,28,vm.data,at,count*12);return key
end function
function captureMarks(vm,base,count,maxPoints,maxFragments)
  pointCount=0;fragmentsAt=0
  if count>0 then
    fragmentsAt=common.pointer(vm,common.argument(vm,base,7),maxFragments*8,"mark fragment output")
    for index=0 to count-1 endPoint=n.readI32(vm.data,fragmentsAt+index*8)+n.readI32(vm.data,fragmentsAt+index*8+4);if endPoint>pointCount then pointCount=endPoint end if end for
  end if
  size=8+pointCount*12+count*8;if size>MAX_MARK_BYTES then return void end if
  stored=bytes(size,0);n.writeU32(stored,0,count);n.writeU32(stored,4,pointCount)
  if pointCount>0 then at=common.pointer(vm,common.argument(vm,base,5),maxPoints*12,"mark point output");copyBytes(stored,8,vm.data,at,pointCount*12) end if
  if count>0 then copyBytes(stored,8+pointCount*12,vm.data,fragmentsAt,count*8) end if;return stored
end function
function publishMarks(vm,base,stored,maxPoints,maxFragments)
  count=n.readI32(stored,0);points=n.readI32(stored,4)
  // Preserve the reference service's conditional pointer validation and write
  // order: an empty result touches neither buffer, and unused tails survive.
  if points>0 then at=common.pointer(vm,common.argument(vm,base,5),maxPoints*12,"mark point output");copyBytes(vm.data,at,stored,8,points*12) end if
  if count>0 then at=common.pointer(vm,common.argument(vm,base,7),maxFragments*8,"mark fragment output");copyBytes(vm.data,at,stored,8+points*12,count*8) end if;return count
end function
function markFragments(memo,context,vm,base,reference)
  if memo==void or not memo.enabled then return reference(context,vm,base) end if
  count=common.argument(vm,base,1);maxPoints=common.argument(vm,base,4);maxFragments=common.argument(vm,base,6)
  // Invalid counts stay on the reference error path. Never turn a malformed
  // capacity into a cache lookup or allocate from unchecked VM values.
  if count<3 or count>1024 or maxPoints<0 or maxPoints>131072 or maxFragments<0 or maxFragments>131072 then return reference(context,vm,base) end if
  if aliasesArguments(vm,base,5,maxPoints*12) or aliasesArguments(vm,base,7,maxFragments*8) then return reference(context,vm,base) end if
  if not bind(memo,context) then return reference(context,vm,base) end if
  key=markKey(vm,base,count,maxPoints,maxFragments);stored=memo.marks.table.get(key)
  if stored!=void then result=publishMarks(vm,base,stored,maxPoints,maxFragments);memo.marks.hits=memo.marks.hits+1;return result end if
  memo.marks.misses=memo.marks.misses+1;result=reference(context,vm,base);if result is error then return result end if
  stored=captureMarks(vm,base,result,maxPoints,maxFragments);if stored!=void then remember(memo.marks,key,stored) end if;return result
end function
