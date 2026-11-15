// SPDX-License-Identifier: GPL-2.0-or-later
// Headless diagnosis only: observe original QVM queries, then replay the exact
// same MiniLang services. No engine cache or collision algorithm is replaced.
import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame_world as qworld
import mq3.compat.numeric as n
import mq3.collision.world as collision
import mq3.renderer.mark_fragments as marks
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import std.ds.list as lists

extern function counter(bufferAddress as ptr) from "kernel32.dll" symbol "QueryPerformanceCounter" returns i32
extern function frequency(bufferAddress as ptr) from "kernel32.dll" symbol "QueryPerformanceFrequency" returns i32
struct Clock buffer hz end struct
struct Query op key count first last late output result end struct
struct Capture callback context frame queries lateCalls lateHits comparisons collisionCalls end struct
struct Memory data mask end struct
function queryProbeFail(text) return error(7687,"cgame query probe: "+text) end function
function queryProbeTick(clock)
  counter(nativeBytesPtr(clock.buffer));return n.readU32(clock.buffer,0)+n.readU32(clock.buffer,4)*4294967296
end function
function queryProbeVectorBytes(vm,pointer,target,offset)
  source=common.pointer(vm,pointer,12,"query input");copyBytes(target,offset,vm.data,source,12);return void
end function
function queryProbeKey(vm,base,op)
  if op==25 then
    result=bytes(68,0);n.writeU32(result,0,op);n.writeU32(result,4,common.argument(vm,base,6));n.writeU32(result,8,common.argument(vm,base,7))
    queryProbeVectorBytes(vm,common.argument(vm,base,2),result,20);queryProbeVectorBytes(vm,common.argument(vm,base,3),result,32)
    flags=0;mins=common.argument(vm,base,4);maxs=common.argument(vm,base,5)
    if mins!=0 then flags=flags|1;queryProbeVectorBytes(vm,mins,result,44) end if;if maxs!=0 then flags=flags|2;queryProbeVectorBytes(vm,maxs,result,56) end if
    n.writeU32(result,12,flags);return result
  end if
  count=common.argument(vm,base,1);result=bytes(28+count*12,0);n.writeU32(result,0,op);n.writeU32(result,4,count);n.writeU32(result,8,common.argument(vm,base,4));n.writeU32(result,12,common.argument(vm,base,6))
  queryProbeVectorBytes(vm,common.argument(vm,base,3),result,16);source=common.pointer(vm,common.argument(vm,base,2),count*12,"mark points");copyBytes(result,28,vm.data,source,count*12);return result
end function
function queryProbeOutput(vm,base,op,result)
  if op==25 then at=common.pointer(vm,common.argument(vm,base,1),56,"trace output");return slice(vm.data,at,56) end if
  fragmentAt=common.pointer(vm,common.argument(vm,base,7),common.argument(vm,base,6)*8,"mark fragments");points=0
  if result>0 then for index=0 to result-1 endPoint=n.readI32(vm.data,fragmentAt+index*8)+n.readI32(vm.data,fragmentAt+index*8+4);if endPoint>points then points=endPoint end if end for end if
  value=bytes(4+points*12+result*8,0);n.writeU32(value,0,points)
  if points>0 then pointAt=common.pointer(vm,common.argument(vm,base,5),common.argument(vm,base,4)*12,"mark output");copyBytes(value,4,vm.data,pointAt,points*12) end if
  if result>0 then copyBytes(value,4+points*12,vm.data,fragmentAt,result*8) end if;return value
end function
function queryProbeObserve(capture,vm,base)
  op=common.argument(vm,base,0)
  if op==23 or op==24 or op==25 or op==26 or op==83 or op==84 then capture.collisionCalls=capture.collisionCalls+1 end if
  if op!=25 and op!=27 then return capture.callback(vm,base) end if
  queryKey=queryProbeKey(vm,base,op);result=capture.callback(vm,base);if result is error then return result end if;written=queryProbeOutput(vm,base,op,result);found=void
  // Compare every productive cache miss/hit against the unchanged service in
  // the same frame and VM. This bypass does not increment host query stats.
  referenceResult=0;before=capture.context.cgameCollisionQueries
  if op==25 then referenceResult=match.cgameBoxTraceReference(capture.context,vm,base,false,false) else referenceResult=match.cgameMarkFragmentsReference(capture.context,vm,base) end if
  if referenceResult!=result or queryProbeOutput(vm,base,op,referenceResult)!=written or capture.context.cgameCollisionQueries!=before then return queryProbeFail("productive memo/reference output or counter mismatch") end if
  capture.comparisons=capture.comparisons+1
  if capture.queries.len()>0 then for index=0 to capture.queries.len()-1 entry=capture.queries.get(index);if entry.key==queryKey then found=entry;break end if end for end if
  if capture.frame>=30 then capture.lateCalls=capture.lateCalls+1;if found!=void then capture.lateHits=capture.lateHits+1 end if end if
  if found==void then capture.queries.add(Query(op,queryKey,1,capture.frame,capture.frame,0,written,result))
  else
    if found.result!=result or found.output!=written then return queryProbeFail("identical inputs produced different output") end if
    found.count=found.count+1;found.last=capture.frame;if capture.frame>=30 then found.late=found.late+1 end if
  end if
  return result
end function
function queryProbePrepareMemory(query)
  vm=Memory(bytes(131072,0),131071);base=64;n.writeU32(vm.data,base,query.op)
  if query.op==25 then
    n.writeU32(vm.data,base+4,128);n.writeU32(vm.data,base+8,256);n.writeU32(vm.data,base+12,272)
    flags=n.readI32(query.key,12);if (flags&1)!=0 then n.writeU32(vm.data,base+16,288) end if;if (flags&2)!=0 then n.writeU32(vm.data,base+20,304) end if
    n.writeU32(vm.data,base+24,n.readI32(query.key,4));n.writeU32(vm.data,base+28,n.readI32(query.key,8));copyBytes(vm.data,256,query.key,20,12);copyBytes(vm.data,272,query.key,32,12);copyBytes(vm.data,288,query.key,44,12);copyBytes(vm.data,304,query.key,56,12)
  else
    count=n.readI32(query.key,4);maxPoints=n.readI32(query.key,8);maxFragments=n.readI32(query.key,12);if count>1024 or maxPoints>2048 or maxFragments>2048 then return queryProbeFail("diagnostic replay capacity exceeded") end if
    n.writeU32(vm.data,base+4,count);n.writeU32(vm.data,base+8,256);n.writeU32(vm.data,base+12,16384);n.writeU32(vm.data,base+16,maxPoints);n.writeU32(vm.data,base+20,32768);n.writeU32(vm.data,base+24,maxFragments);n.writeU32(vm.data,base+28,65536)
    copyBytes(vm.data,256,query.key,28,count*12);copyBytes(vm.data,16384,query.key,16,12)
  end if;return vm
end function
function queryProbeReplay(context,query,vm)
  if query.op==25 then return match.cgameBoxTraceReference(context,vm,64,false,false) end if
  return match.cgameMarkFragmentsReference(context,vm,64)
end function
function queryProbeCachedReplay(context,query,vm)
  if query.op==25 then return match.cgameBoxTraceCached(context,vm,64,false,false) end if
  return match.cgameMarkFragmentsCached(context,vm,64)
end function
function queryProbePublish(query,vm)
  if query.op==25 then copyBytes(vm.data,128,query.output,0,56)
  else
    points=n.readI32(query.output,0);if points>0 then copyBytes(vm.data,32768,query.output,4,points*12) end if
    if query.result>0 then copyBytes(vm.data,65536,query.output,4+points*12,query.result*8) end if
  end if;return query.result
end function
function queryProbeHit(query,vm)
  if queryProbeKey(vm,64,query.op)!=query.key then return queryProbeFail("memo replay key differs") end if;return queryProbePublish(query,vm)
end function
function queryProbeBenchmark(context,query,clock,repeats)
  vm=queryProbePrepareMemory(query);if vm is error then return vm end if
  actual=queryProbeReplay(context,query,vm);if actual!=query.result or queryProbeOutput(vm,64,query.op,actual)!=query.output then return queryProbeFail("captured replay changed output") end if
  started=queryProbeTick(clock);for index=1 to repeats actual=queryProbeReplay(context,query,vm);if actual is error then return actual end if end for;fullTicks=queryProbeTick(clock)-started
  started=queryProbeTick(clock);for index=1 to repeats actual=queryProbeCachedReplay(context,query,vm);if actual is error then return actual end if end for;cachedTicks=queryProbeTick(clock)-started
  started=queryProbeTick(clock);for index=1 to repeats actual=queryProbeHit(query,vm);if actual is error then return actual end if end for;hitTicks=queryProbeTick(clock)-started
  started=queryProbeTick(clock);for index=1 to repeats actual=queryProbePublish(query,vm) end for;copyTicks=queryProbeTick(clock)-started
  coreTicks=0;serializeTicks=0;value=void
  if query.op==25 then
    start=match.cgameVector(vm,64,2,"start");finish=match.cgameVector(vm,64,3,"end");mins=match.cgameNullableVector(vm,64,4,"mins");maxs=match.cgameNullableVector(vm,64,5,"maxs");model=common.argument(vm,64,6);mask=common.argument(vm,64,7)
    started=queryProbeTick(clock);for index=1 to repeats value=collision.boxTrace(context.collisionWorld,start,finish,mins,maxs,model,mask,false) end for;coreTicks=queryProbeTick(clock)-started
    trace=match.cgameTraceResult(value);started=queryProbeTick(clock);for index=1 to repeats qworld.writeTrace(vm,128,trace) end for;serializeTicks=queryProbeTick(clock)-started
  end if
  scale=1000000.0/clock.hz/repeats
  print "REPLAY op="+str(query.op)+" repeats="+str(repeats)+" full_us="+str(fullTicks*scale)+" productive_cache_us="+str(cachedTicks*scale)+" exact_key_copy_hit_us="+str(hitTicks*scale)+" output_copy_us="+str(copyTicks*scale)+" collision_core_us="+str(coreTicks*scale)+" trace_serialize_us="+str(serializeTicks*scale)
  return void
end function
function main(args)
  frames=toNumber(args[2]);repeats=toNumber(args[3]);archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if;state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if;initial=match.snapshotProductive(state,0);if initial is error then return initial end if;booted=match.bootCgame(state);if booted is error then return booted end if
  machine=state.cgame.slot.machine;capture=Capture(machine.syscall,state.context,0,lists.List.withCapacity(64),0,0,0,state.context.cgameCollisionQueries);machine.syscall=function(vm,base)=>queryProbeObserve(capture,vm,base)
  for frame=1 to frames
    capture.frame=frame;now=1000+frame*16;submitted=match.submitUsercmd(state,0,qworld.userCommand(now,[0,0,0],0,2,0,0,0));if submitted is error then return submitted end if
    simulated=match.runFrame(state,now);if simulated is error then return simulated end if;snap=match.snapshotProductive(state,0);if snap is error then return snap end if;drawn=match.drawCgameProductive(state,now);if drawn is error then return drawn end if;state.context.soundCommands=[]
  end for
  machine.syscall=capture.callback;clock=Clock(bytes(8,0),0);frequency(nativeBytesPtr(clock.buffer));clock.hz=n.readU32(clock.buffer,0)+n.readU32(clock.buffer,4)*4294967296
  traceCalls=0;markCalls=0;traceUnique=0;markUnique=0;traceTop=void;markTop=void
  for each query in capture.queries.toArray()
    if query.op==25 then traceCalls=traceCalls+query.count;traceUnique=traceUnique+1;if traceTop==void or query.count>traceTop.count then traceTop=query end if
    else markCalls=markCalls+query.count;markUnique=markUnique+1;if markTop==void or query.count>markTop.count then markTop=query end if end if
    print "QUERY op="+str(query.op)+" calls="+str(query.count)+" first="+str(query.first)+" last="+str(query.last)+" late="+str(query.late)+" model="+str(n.readI32(query.key,4))+" key="+str(query.key)
  end for
  if capture.comparisons!=traceCalls+markCalls or state.context.cgameCollisionQueries!=capture.collisionCalls then return queryProbeFail("query counter or comparison coverage mismatch") end if
  print "MEMO comparisons="+str(capture.comparisons)+" collisionCalls="+str(capture.collisionCalls)+" traceHits="+str(state.context.cgameQueryMemo.traces.hits)+" traceMisses="+str(state.context.cgameQueryMemo.traces.misses)+" markHits="+str(state.context.cgameQueryMemo.marks.hits)+" markMisses="+str(state.context.cgameQueryMemo.marks.misses)
  if traceTop!=void then value=queryProbeBenchmark(state.context,traceTop,clock,repeats);if value is error then return value end if end if
  if markTop!=void then value=queryProbeBenchmark(state.context,markTop,clock,repeats);if value is error then return value end if end if
  print "PASS: headless Retail collision queries frames="+str(frames)+" traceCalls="+str(traceCalls)+" traceUnique="+str(traceUnique)+" markCalls="+str(markCalls)+" markUnique="+str(markUnique)+" lateCalls="+str(capture.lateCalls)+" lateHits="+str(capture.lateHits)+" patches="+str(state.context.collisionWorld.patchesReady)+" playerCurveClip="+str(state.context.collisionWorld.playerCurveClip)
  return match.shutdown(state)
end function
