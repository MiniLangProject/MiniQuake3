// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.cgame_collision_cache as memo
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
struct CacheWorld checksum name patchesReady playerCurveClip end struct
struct CacheMap data end struct
struct CacheContext collisionWorld markMap traces marks end struct
struct CacheVm data mask end struct
function cacheRequire(ok,text) if not ok then return error(7688,"query memo: "+text) end if;return 1 end function
function cacheContext() return CacheContext(CacheWorld(17,"first",true,true),CacheMap(bytes(8,0)),0,0) end function
function cacheMemory()
  vm=CacheVm(bytes(131072,170),131071);for slot=0 to 9 n.writeU32(vm.data,64+slot*4,0) end for
  n.writeU32(vm.data,68,128);n.writeU32(vm.data,72,256);n.writeU32(vm.data,76,272);n.writeU32(vm.data,80,288);n.writeU32(vm.data,84,304);n.writeU32(vm.data,88,0);n.writeU32(vm.data,92,1)
  for slot=0 to 11 n.writeU32(vm.data,256+slot*4,0) end for;return vm
end function
function cacheTraceReference(context,vm,base,capsule,transformed)
  context.traces=context.traces+1;if not context.collisionWorld.patchesReady then return error(7688,"patch geometry has not been loaded") end if
  source=common.pointer(vm,common.argument(vm,base,2),12,"start");at=common.pointer(vm,common.argument(vm,base,1),56,"trace_t output")
  seed=n.readI32(vm.data,source)+common.argument(vm,base,7)+context.collisionWorld.checksum;if capsule then seed=seed+19 end if;if transformed then seed=seed+31 end if;if context.collisionWorld.playerCurveClip then seed=seed+23 end if
  for index=0 to 55 vm.data[at+index]=(seed+index*3)&255 end for;return 0
end function
function cacheMarkMemory()
  vm=cacheMemory();n.writeU32(vm.data,64,27);n.writeU32(vm.data,68,4);n.writeU32(vm.data,72,256);n.writeU32(vm.data,76,320);n.writeU32(vm.data,80,8);n.writeU32(vm.data,84,4096);n.writeU32(vm.data,88,4);n.writeU32(vm.data,92,8192)
  for index=0 to 14 n.writeU32(vm.data,256+index*4,index) end for;return vm
end function
function cacheMarkReference(context,vm,base)
  context.marks=context.marks+1;count=common.argument(vm,base,1);maxPoints=common.argument(vm,base,4);maxFragments=common.argument(vm,base,6)
  if count<3 or count>1024 or maxPoints<0 or maxPoints>131072 or maxFragments<0 or maxFragments>131072 then return error(7688,"invalid mark counts") end if
  common.pointer(vm,common.argument(vm,base,2),count*12,"mark inputs");common.pointer(vm,common.argument(vm,base,3),12,"projection")
  if maxPoints<4 or maxFragments<2 then return 0 end if
  points=common.pointer(vm,common.argument(vm,base,5),maxPoints*12,"mark point output");fragments=common.pointer(vm,common.argument(vm,base,7),maxFragments*8,"mark fragment output")
  for index=0 to 47 vm.data[points+index]=(context.collisionWorld.checksum+index*7)&255 end for
  n.writeU32(vm.data,fragments,0);n.writeU32(vm.data,fragments+4,3);n.writeU32(vm.data,fragments+8,3);n.writeU32(vm.data,fragments+12,1);return 2
end function
function cacheLargeMarkReference(context,vm,base)
  context.marks=context.marks+1;at=common.pointer(vm,common.argument(vm,base,7),8,"large mark");n.writeU32(vm.data,at,0);n.writeU32(vm.data,at+4,6000);return 1
end function
function main(args)
  checked=0;context=cacheContext();vm=cacheMemory();state=memo.create()
  result=memo.trace(state,context,vm,64,false,false,cacheTraceReference);expected=slice(vm.data,128,56);checked=checked+cacheRequire(result==0 and context.traces==1 and state.traces.used==1,"first trace is a miss")
  n.writeU32(vm.data,68,1024);result=memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==1 and slice(vm.data,1024,56)==expected,"new output pointer is copied on hit")
  vm.data[1024]=0;result=memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(slice(vm.data,1024,56)==expected,"caller output mutation cannot corrupt cache")
  copyBytes(vm.data,2048,vm.data,256,12);n.writeU32(vm.data,72,2048);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==1,"new input pointer with identical bits hits")
  n.writeU32(vm.data,68,0);checked=checked+cacheRequire(try(memo.trace(state,context,vm,64,false,false,cacheTraceReference)) is error,"NULL output rejected on hit")
  n.writeU32(vm.data,68,131040);checked=checked+cacheRequire(try(memo.trace(state,context,vm,64,false,false,cacheTraceReference)) is error,"short output range rejected on hit")
  n.writeU32(vm.data,68,128);n.writeU32(vm.data,72,0);checked=checked+cacheRequire(try(memo.trace(state,context,vm,64,false,false,cacheTraceReference)) is error,"NULL input rejected before lookup")
  n.writeU32(vm.data,72,256);n.writeU32(vm.data,80,0);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==2,"NULL bound differs from zero-vector bound")
  n.writeU32(vm.data,256,0x80000000);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==3,"signed zero raw input bits remain distinct")
  n.writeU32(vm.data,92,2);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==4,"mask participates in key")
  memo.trace(state,context,vm,64,true,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==5,"capsule query has its own key")
  memo.trace(state,context,vm,64,false,true,cacheTraceReference);memo.trace(state,context,vm,64,false,true,cacheTraceReference);checked=checked+cacheRequire(context.traces==7,"transformed queries always reference")
  n.writeU32(vm.data,88,1);memo.trace(state,context,vm,64,false,false,cacheTraceReference);n.writeU32(vm.data,88,255);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==9,"inline and temporary models always reference")
  n.writeU32(vm.data,88,0);invalidations=state.invalidations;context.collisionWorld.playerCurveClip=false;memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(state.invalidations==invalidations+1 and context.traces==10,"CM clipping configuration invalidates")
  context.collisionWorld.patchesReady=false;checked=checked+cacheRequire(try(memo.trace(state,context,vm,64,false,false,cacheTraceReference)) is error and state.traces.used==0,"patch configuration invalidates before error")
  context.collisionWorld.patchesReady=true;memo.trace(state,context,vm,64,false,false,cacheTraceReference);before=context.traces;context.collisionWorld=CacheWorld(17,"first",true,false);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==before+1,"replacement World invalidates even with equal fields")
  before=context.traces;context.markMap=CacheMap(bytes(8,0));memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==before+1,"replacement BSP invalidates even with equal bytes")
  before=context.traces;context.markMap.data=bytes(8,0);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==before+1,"replacement BSP storage invalidates")
  before=context.traces;context.collisionWorld.checksum=18;memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==before+1,"changed world checksum invalidates")
  before=context.traces;state.enabled=false;memo.trace(state,context,vm,64,false,false,cacheTraceReference);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==before+2,"disabled service always references")
  state=memo.create();context=cacheContext();vm=cacheMemory();for index=0 to 64 n.writeU32(vm.data,256,index);memo.trace(state,context,vm,64,false,false,cacheTraceReference) end for
  checked=checked+cacheRequire(state.traces.used==64 and state.traces.table.count()==64 and state.traces.evictions==1,"trace FIFO fixed64 capacity")
  n.writeU32(vm.data,256,0);memo.trace(state,context,vm,64,false,false,cacheTraceReference);checked=checked+cacheRequire(context.traces==66 and state.traces.evictions==2,"trace oldest entry evicted")
  context=cacheContext();vm=cacheMarkMemory();state=memo.create();result=memo.markFragments(state,context,vm,64,cacheMarkReference);points=slice(vm.data,4096,48);fragments=slice(vm.data,8192,16)
  checked=checked+cacheRequire(result==2 and context.marks==1,"mark first miss")
  n.writeU32(vm.data,84,12288);n.writeU32(vm.data,92,16384);result=memo.markFragments(state,context,vm,64,cacheMarkReference)
  checked=checked+cacheRequire(result==2 and context.marks==1 and slice(vm.data,12288,48)==points and slice(vm.data,16384,16)==fragments,"mark hit copies both new output pointers")
  checked=checked+cacheRequire(vm.data[12288+48]==170 and vm.data[16384+16]==170,"unused output tails untouched")
  vm.data[12288]=0;vm.data[16384]=0;memo.markFragments(state,context,vm,64,cacheMarkReference);checked=checked+cacheRequire(slice(vm.data,12288,48)==points and slice(vm.data,16384,16)==fragments,"mark cache owns independent output bytes")
  n.writeU32(vm.data,84,0);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"mark NULL point output rejected on hit")
  n.writeU32(vm.data,84,131010);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"mark validates full point capacity on hit")
  n.writeU32(vm.data,84,12288);n.writeU32(vm.data,92,0);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"mark NULL fragment output rejected on hit")
  n.writeU32(vm.data,92,131056);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"mark validates full fragment capacity on hit")
  n.writeU32(vm.data,92,16384);n.writeU32(vm.data,72,0);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"mark source pointer validated on hit")
  n.writeU32(vm.data,72,256);n.writeU32(vm.data,76,0);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"mark projection pointer validated on hit")
  n.writeU32(vm.data,76,320);n.writeU32(vm.data,84,0);n.writeU32(vm.data,92,0);n.writeU32(vm.data,80,0);result=memo.markFragments(state,context,vm,64,cacheMarkReference);before=context.marks;again=memo.markFragments(state,context,vm,64,cacheMarkReference)
  checked=checked+cacheRequire(result==0 and again==0 and context.marks==before,"empty mark zero points retains conditional NULL outputs")
  n.writeU32(vm.data,80,8);n.writeU32(vm.data,88,0);result=memo.markFragments(state,context,vm,64,cacheMarkReference);before=context.marks;again=memo.markFragments(state,context,vm,64,cacheMarkReference)
  checked=checked+cacheRequire(result==0 and again==0 and context.marks==before,"empty mark zero fragments retains conditional NULL outputs")
  n.writeU32(vm.data,80,-1);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"negative mark capacity fails")
  n.writeU32(vm.data,80,131073);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"excessive mark capacity fails")
  n.writeU32(vm.data,80,8);n.writeU32(vm.data,68,2);checked=checked+cacheRequire(try(memo.markFragments(state,context,vm,64,cacheMarkReference)) is error,"too few mark source points fails")
  vm=cacheMarkMemory();state=memo.create();context=cacheContext();for index=0 to 32 n.writeU32(vm.data,320,index);memo.markFragments(state,context,vm,64,cacheMarkReference) end for
  checked=checked+cacheRequire(state.marks.used==32 and state.marks.table.count()==32 and state.marks.evictions==1,"mark FIFO fixed32 capacity")
  n.writeU32(vm.data,320,0);memo.markFragments(state,context,vm,64,cacheMarkReference);checked=checked+cacheRequire(context.marks==34,"mark oldest entry evicted")
  state=memo.create();context=cacheContext();vm=cacheMarkMemory();n.writeU32(vm.data,80,6000);memo.markFragments(state,context,vm,64,cacheLargeMarkReference);memo.markFragments(state,context,vm,64,cacheLargeMarkReference)
  checked=checked+cacheRequire(context.marks==2 and state.marks.used==0,"oversized output bypasses fixed memory bound")
  state=memo.create();context=cacheContext();vm=cacheMemory();n.writeU32(vm.data,68,64);memo.trace(state,context,vm,64,false,false,cacheTraceReference)
  checked=checked+cacheRequire(context.traces==1 and state.traces.used==0,"argument-vector trace output keeps reference order")
  state=memo.create();context=cacheContext();vm=cacheMarkMemory();n.writeU32(vm.data,84,64);memo.markFragments(state,context,vm,64,cacheMarkReference)
  checked=checked+cacheRequire(context.marks==1 and state.marks.used==0,"argument-vector mark output keeps reference order")
  print "PASS: "+str(checked)+" cgame collision-query memo contracts";return 0
end function
