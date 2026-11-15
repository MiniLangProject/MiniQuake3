// Exact productive functions are extracted into ignored build/ by the gate.
import mq3.tests.collision_frontier as frontierProbe
import std.ds.list as frontierLists
struct FrontierPlane normal distance end struct
struct FrontierNode axis plane children end struct
struct FrontierLeaf id end struct
struct FrontierWorld nodes leaves end struct
struct FrontierTrace fraction allsolid end struct
struct FrontierWork world trace start finish mins maxs isPoint visits stopLeaf peakPending peakCapacity end struct
function frontierRequire(ok,text) if not ok then return error(7489,"collision frontier: "+text) end if;return 1 end function
function frontierWork(world,start,finish,stop)
  return FrontierWork(world,FrontierTrace(1.0,false),start,finish,[-1.0,-1.0,-1.0],[1.0,1.0,1.0],true,frontierLists.List.withCapacity(32),stop,0,0)
end function
function frontierTree(depth)
  nodes=array(depth,void);leaves=array(depth+1,void)
  for index=0 to depth leaves[index]=FrontierLeaf(index) end for
  for index=0 to depth-1 next=index+1;if next==depth then next=-1-depth end if;nodes[index]=FrontierNode(0,FrontierPlane([1.0,0.0,0.0],100.0-index),[-1-index,next]) end for
  return FrontierWorld(nodes,leaves)
end function
function frontierCompare(world,start,finish,stop,position)
  actual=frontierWork(world,start,finish,stop);expected=frontierWork(world,start,finish,stop)
  if position then frontierProbe.positionTest(actual);frontierProbe.legacypositionTest(expected) else frontierProbe.throughTree(actual);frontierProbe.legacythroughTree(expected) end if
  if actual.visits.toArray()!=expected.visits.toArray() or actual.trace.fraction!=expected.trace.fraction or actual.trace.allsolid!=expected.trace.allsolid then return error(7489,"legacy leaf order or pruning changed") end if
  return actual
end function
function main(args)
  checked=0;deep=frontierTree(80);value=frontierCompare(deep,[-200.0,0.0,0.0],[200.0,0.0,0.0],-1,false);if value is error then return value end if
  checked=checked+frontierRequire(value.visits.len()==81 and value.visits.get(0)[0]==80 and value.visits.get(80)[0]==0,"all deep near/far leaves visited in original DFS order")
  checked=checked+frontierRequire(value.peakPending>32 and value.peakCapacity==128,"frontier grows beyond initial32 without overflow")
  checked=checked+frontierRequire(value.peakCapacity< len(deep.nodes)+64,"capacity follows pending frontier")
  broad=frontierTree(4096);value=frontierCompare(broad,[500.0,0.0,0.0],[600.0,0.0,0.0],-1,false);if value is error then return value end if
  checked=checked+frontierRequire(value.peakPending==1 and value.peakCapacity==32,"large BSP with narrow frontier uses32slots rather than nodes+1")
  // Fresh allocations before any automatic collection: compare exact calls,
  // excluding world/fixture setup. The legacy node-count array alone is32KiB.
  allocationNew=frontierWork(broad,[500.0,0.0,0.0],[600.0,0.0,0.0],-1);beforeNew=heap_bytes_used();frontierProbe.throughTree(allocationNew);newBytes=heap_bytes_used()-beforeNew
  allocationOld=frontierWork(broad,[500.0,0.0,0.0],[600.0,0.0,0.0],-1);beforeOld=heap_bytes_used();frontierProbe.legacythroughTree(allocationOld);oldBytes=heap_bytes_used()-beforeOld
  checked=checked+frontierRequire(newBytes>0 and newBytes<8192,"productive narrow-frontier trace does not allocate8KiB")
  checked=checked+frontierRequire(oldBytes>=32768 and newBytes<oldBytes/4,"pre-fix trace allocates node-count-sized block; new call allocation underquarter")
  for direction=0 to 1
    start=[-200.0,0.0,0.0];finish=[200.0,0.0,0.0];if direction==1 then swap=start;start=finish;finish=swap end if
    for each stop in [-1,0,20,80] value=frontierCompare(deep,start,finish,stop,false);if value is error then return value end if;checked=checked+1 end for
  end for
  for each x in [-200.0,30.0,60.0,100.0,200.0]
    for each stop in [-1,0,20,80] value=frontierCompare(deep,[x,0.0,0.0],[x,0.0,0.0],stop,true);if value is error then return value end if;checked=checked+1 end for
  end for
  // The std stack owns its frontier per call and clears popped references.
  first=frontierLists.List.withCapacity(32);second=frontierLists.List.withCapacity(32);item=[1,2,3];first.add(item);first.pop()
  checked=checked+frontierRequire(first.buf[0]==0 and second.isEmpty(),"popped roots cleared and independent calls have independent stacks")
  print "PASS: "+str(checked)+" exact collision frontier contracts newTraceBytes="+str(newBytes)+" legacyTraceBytes="+str(oldBytes);return 0
end function
