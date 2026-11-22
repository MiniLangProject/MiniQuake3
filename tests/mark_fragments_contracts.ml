import mq3.renderer.mark_fragments as marks
import mq3.format.bsp as bsp
import mq3.collision.world as collision
import mq3.collision.brush as brush
import mq3.compat.numeric as n
import mq3.engine.local_qvm_match as match

struct Vm data mask end struct
struct Host markMap collisionWorld end struct
function require(condition,message) if not condition then return error(7694,message) end if;return 1 end function
function putI32(data,offset,value) n.writeU32(data,offset,n.i32(value));return void end function
function putF32(data,offset,value) n.writeU32(data,offset,n.floatBits(value));return void end function
function fixture()
  data=bytes(376,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[1]=0;lengths[1]=72;counts[1]=1
  offsets[13]=72;lengths[13]=104;counts[13]=1
  offsets[10]=176;lengths[10]=176;counts[10]=4
  offsets[11]=352;lengths[11]=24;counts[11]=6
  putI32(data,72,0);putI32(data,76,-1);putI32(data,80,1);putI32(data,84,0);putI32(data,88,4);putI32(data,92,0);putI32(data,96,6);putI32(data,100,-1)
  putF32(data,72+84,0.0);putF32(data,72+88,0.0);putF32(data,72+92,1.0)
  positions=[[-4.0,-4.0,0.0],[4.0,-4.0,0.0],[4.0,4.0,0.0],[-4.0,4.0,0.0]]
  for index=0 to 3 at=176+index*44;putF32(data,at,positions[index][0]);putF32(data,at+4,positions[index][1]);putF32(data,at+8,positions[index][2]);putF32(data,at+36,1.0) end for
  indexes=[0,1,2,0,2,3];for index=0 to 5 putI32(data,352+index*4,indexes[index]) end for
  map=bsp.BSP(data,offsets,lengths,counts)
  split=brush.Plane([1.0,0.0,0.0],0.0,0);world=collision.World([],[collision.Node(split,0,[-1,-1])],[collision.Leaf([],[0])],[],[],false,true,[],void,void,"",[],0,"")
  return [map,world]
end function
function square() return [[-1.0,-1.0,4.0],[-1.0,1.0,4.0],[1.0,1.0,4.0],[1.0,-1.0,4.0]] end function
function main(args)
  count=0;value=fixture();map=value[0];world=value[1]
  result=marks.project(map,world,square(),[0.0,0.0,-20.0],64,16);if result is error then return result end if
  count=count+require(result.candidateSurfaces==1 and result.testedTriangles==2,"one planar face contributes both triangles")
  count=count+require(len(result.fragments)==2 and len(result.points)>=6,"projected quad produces two clipped fragments")
  valid=true;for each point in result.points if point[0]< -1.01 or point[0]>1.01 or point[1]< -1.01 or point[1]>1.01 or point[2]!=0.0 then valid=false end if end for
  count=count+require(valid,"fragment points lie in projection prism on face")
  count=count+require(result.fragments[0].firstPoint==0 and result.fragments[1].firstPoint==result.fragments[0].numPoints,"fragment point offsets are contiguous")
  cache=marks.geometryCache();first=marks.markTriangles(map,[0],cache);again=marks.markTriangles(map,[0],cache)
  count=count+require(again[0]==first[0],"equal face lists reuse decoded triangle records")
  count=count+require(try(marks.markTriangles(map,[32],cache)) is error,"a colliding cache slot still validates the new face list")
  moved=square();for each point in moved point[0]=point[0]+1.25 end for
  cached=marks.projectWithCache(map,world,moved,[0.0,0.0,-20.0],64,16,cache)
  uncached=marks.project(map,world,moved,[0.0,0.0,-20.0],64,16)
  count=count+require(cached.points==uncached.points and cached.points!=result.points and len(cached.fragments)==len(uncached.fragments),"moving marks clip cached geometry against the new planes")
  map.data=slice(map.data,0,len(map.data));putF32(map.data,176,-6.0)
  fresh=marks.markTriangles(map,[0],cache)
  count=count+require(fresh[0].vertices[0].position[0]==-6.0 and first[0].vertices[0].position[0]==-4.0,"replacing BSP storage invalidates prepared faces")
  putF32(map.data,176,-4.0)
  world.leaves[0].surfaces=[0,0,0]
  duplicate=marks.project(map,world,square(),[0.0,0.0,-20.0],64,16)
  count=count+require(duplicate.candidateSurfaces==1 and duplicate.testedTriangles==2 and duplicate.points==result.points and len(duplicate.fragments)==2,"repeated face references emit fragments only once")
  limited=marks.project(map,world,square(),[0.0,0.0,-20.0],64,1);count=count+require(len(limited.fragments)==1,"fragment capacity stops output")
  cramped=marks.project(map,world,square(),[0.0,0.0,-20.0],2,16);count=count+require(len(cramped.fragments)==0 and len(cramped.points)==0,"point capacity rejects whole polygons")
  putI32(map.data,64,marks.SURF_NOMARKS);blocked=marks.project(map,world,square(),[0.0,0.0,-20.0],64,16);count=count+require(len(blocked.fragments)==0,"nomarks shader surface rejected")
  putI32(map.data,64,marks.SURF_NOIMPACT);blocked=marks.project(map,world,square(),[0.0,0.0,-20.0],64,16);count=count+require(len(blocked.fragments)==0,"noimpact shader surface rejected")
  putI32(map.data,64,0);putI32(map.data,68,marks.CONTENTS_FOG);blocked=marks.project(map,world,square(),[0.0,0.0,-20.0],64,16);count=count+require(len(blocked.fragments)==0,"fog surface rejected")
  putI32(map.data,68,0);putI32(map.data,80,3);blocked=marks.project(map,world,square(),[0.0,0.0,-20.0],64,16);count=count+require(len(blocked.fragments)==0,"triangle soup surface rejected")
  putI32(map.data,80,1);reversed=marks.project(map,world,square(),[0.0,0.0,20.0],64,16);count=count+require(len(reversed.fragments)==0,"back-facing planar surface rejected")
  zero=marks.project(map,world,square(),[0.0,0.0,0.0],64,16);count=count+require(len(zero.fragments)==0,"zero projection is empty")
  count=count+require(try(marks.project(map,world,[[0.0,0.0,0.0],[1.0,0.0,0.0]],[0.0,0.0,-1.0],64,16)) is error,"at least three source points required")
  vm=Vm(bytes(4096,0),4095);sourceAt=128;projectionAt=256;outputAt=512;fragmentsAt=2048;source=square()
  for index=0 to 3 for axis=0 to 2 putF32(vm.data,sourceAt+index*12+axis*4,source[index][axis]) end for end for
  putF32(vm.data,projectionAt,0.0);putF32(vm.data,projectionAt+4,0.0);putF32(vm.data,projectionAt+8,-20.0)
  putI32(vm.data,4,4);putI32(vm.data,8,sourceAt);putI32(vm.data,12,projectionAt);putI32(vm.data,16,64);putI32(vm.data,20,outputAt);putI32(vm.data,24,16);putI32(vm.data,28,fragmentsAt)
  returned=match.extendedCgame(Host(map,world),vm,0,27);if returned is error then return returned end if
  count=count+require(returned==2,"trap 27 returns fragment count")
  count=count+require(n.readI32(vm.data,fragmentsAt)==0 and n.readI32(vm.data,fragmentsAt+4)>=3 and n.readI32(vm.data,fragmentsAt+8)==n.readI32(vm.data,fragmentsAt+4),"markFragment_t ABI is two contiguous i32 fields")
  count=count+require(n.bitsFloat(n.readU32(vm.data,outputAt+8))==0.0,"trap writes vec3_t point output")
  putI32(vm.data,24,0);putI32(vm.data,28,0);count=count+require(match.extendedCgame(Host(map,world),vm,0,27)==0,"zero fragment capacity accepts NULL outputs")
  print("PASS: "+str(count)+" mark-fragment contracts");return 0
end function
