// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.tests.trace_query_storage as queryProbe
import mq3.collision.world as queryCollision
import mq3.server.world as querySpatial
struct QueryShape contents end struct
struct QueryWorld brushes surfaces end struct
struct QueryTrace fraction end struct
struct QueryWork world trace seen seenPatches mask curves end struct
struct QueryLeaf brushes surfaces end struct
struct QueryEntity number absmin absmax nextEntity end struct
struct QueryScene entities sectors end struct
function queryRequire(ok,text) if not ok then return error(7489,"trace query storage: "+text) end if;return 1 end function
function queryScene(count)
  entities=array(count,void)
  if count>0 then for index=0 to count-1 next=index+1;if next==count then next=-1 end if;entities[index]=QueryEntity(index,[-1.0,-1.0,-1.0],[1.0,1.0,1.0],next) end for end if
  head=0;if count==0 then head=-1 end if
  return QueryScene(entities,[querySpatial.Sector(-1,0.0,[-1,-1],head)])
end function
function main(args)
  checked=0;world=QueryWorld(array(987,QueryShape(0)),array(2097,QueryShape(0)));world.surfaces[0]=void
  before=heap_bytes_used();flags=queryProbe.productiveSeenFlags(world);newFlagBytes=heap_bytes_used()-before
  before=heap_bytes_used();oldFlags=queryProbe.legacySeenFlags(world);oldFlagBytes=heap_bytes_used()-before
  checked=checked+queryRequire(typeof(flags[0])=="bytes" and typeof(flags[1])=="bytes" and len(flags[0])==987 and len(flags[1])==2097,"productive Work constructor uses exact-length byte flags")
  checked=checked+queryRequire(newFlagBytes>0 and newFlagBytes<4096 and oldFlagBytes>=24000 and newFlagBytes<oldFlagBytes/4,"per-trace seen allocation shrinks below4KiB and quarter of legacy")
  checked=checked+queryRequire(flags[0][986]==0 and flags[1][2096]==0,"byte flags start clear at boundary indices")
  second=queryProbe.productiveSeenFlags(world);work=QueryWork(world,QueryTrace(1.0),flags[0],flags[1],1,true)
  visited=queryCollision.throughLeaf(work,QueryLeaf([2,2,986],[0,1,1,2096]),false);if visited is error then return visited end if
  checked=checked+queryRequire(flags[0][2]==1 and flags[0][986]==1 and flags[1][1]==1 and flags[1][2096]==1 and flags[1][0]==0,"real throughLeaf suppresses duplicate brush/patch indices and skips null surface")
  checked=checked+queryRequire(second[0][2]==0 and second[1][1]==0,"separate traces own separate seen storage")
  scene=queryScene(80)
  for each capacity in [0,1,2,3,31,32,33,79,80,81,1024]
    actual=querySpatial.areaEntities(scene,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],capacity);reference=queryProbe.legacyAreaEntities(scene,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],capacity)
    checked=checked+queryRequire(actual==reference,"actual area list preserves legacy order/capacity across growth")
  end for
  first=querySpatial.areaEntities(scene,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],1024);second=querySpatial.areaEntities(scene,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],1024);first[0]=999
  checked=checked+queryRequire(second[0]==0 and scene.entities[0].number==0,"returned result arrays and scene state have independent ownership")
  split=queryScene(3);for index=0 to 2 split.entities[index].nextEntity=-1 end for
  split.sectors=[querySpatial.Sector(0,0.0,[1,2],2),querySpatial.Sector(-1,0.0,[-1,-1],0),querySpatial.Sector(-1,0.0,[-1,-1],1)]
  ordered=querySpatial.areaEntities(split,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],3)
  checked=checked+queryRequire(ordered==[2,0,1] and querySpatial.areaEntities(split,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],2)==[2,0],"sector head precedes positive child then negative child with exact capacity cutoff")
  checked=checked+queryRequire(querySpatial.areaEntities(split,[0.0,-2.0,-2.0],[0.0,2.0,2.0],3)==[2],"touching split plane preserves original strict child comparisons")
  // Exact source implementations in one module isolate storage allocation
  // from unrelated imported helper naming or fixture construction costs.
  narrow=queryScene(1);before=heap_bytes_used();small=queryProbe.productiveAreaEntities(narrow,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],1024);newAreaBytes=heap_bytes_used()-before
  before=heap_bytes_used();large=queryProbe.legacyAreaEntities(narrow,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],1024);oldAreaBytes=heap_bytes_used()-before
  checked=checked+queryRequire(small==large and newAreaBytes<4096 and oldAreaBytes>=8192 and newAreaBytes<oldAreaBytes/2,"sparse area query avoids capacity-sized8KiB result allocation")
  outside=querySpatial.areaEntities(scene,[3.0,3.0,3.0],[4.0,4.0,4.0],1024);checked=checked+queryRequire(len(outside)==0,"empty area result remains empty")
  for each capacity in [-1,1025] checked=checked+queryRequire(try(querySpatial.areaEntities(scene,[0.0,0.0,0.0],[1.0,1.0,1.0],capacity)) is error,"invalid area capacity rejected") end for
  print "PASS: "+str(checked)+" trace query storage contracts flagBytes="+str(newFlagBytes)+" legacyFlagBytes="+str(oldFlagBytes)+" areaBytes="+str(newAreaBytes)+" legacyAreaBytes="+str(oldAreaBytes);return 0
end function
