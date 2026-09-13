import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.playable_dynamic_lights as dynamicLights
import mq3.format.bsp as bsp
import mq3.compat.numeric as numeric

function require(ok,text) if not ok then return error(7661,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.001 end function
function fixture()
  entity=bytes("{ \"classname\" \"worldspawn\" \"gridsize\" \"10 20 30\" }");data=bytes(204,0);for i=0 to len(entity)-1 data[i]=entity[i] end for
  values=[0.0,0.0,0.0,10.0,20.0,30.0];for i=0 to 5 numeric.writeU32(data,100+i*4,numeric.floatBits(values[i])) end for
  for cell=0 to 7 at=140+cell*8;data[at]=10;data[at+1]=20;data[at+2]=30;data[at+3]=40;data[at+4]=50;data[at+5]=60;data[at+6]=0;data[at+7]=0 end for
  offsets=array(17,0);lengths=array(17,0);counts=array(17,0);offsets[0]=0;lengths[0]=len(entity);offsets[7]=100;counts[7]=1;offsets[15]=140;lengths[15]=64;counts[15]=8;return bsp.BSP(data,offsets,lengths,counts)
end function
function main(args)
  count=0;map=fixture();count=count+require(lightGrid.worldGridSize(map)==[10.0,20.0,30.0],"worldspawn gridsize override")
  grid=lightGrid.load(map);count=count+require(grid.valid and grid.origin==[0.0,0.0,0.0] and grid.bounds==[2,2,2],"grid bounds follow world model")
  shifted=lightGrid.shiftColor(200,100,50);count=count+require(shifted==[255,127,63],"Baseq3 overbright normalization")
  sample=lightGrid.sample(grid,[5.0,10.0,15.0]);count=count+require(sample.ambient==[20.0,40.0,60.0] and sample.directed==[80.0,100.0,120.0],"eight equal cells trilinearly interpolate")
  count=count+require(near(sample.direction[0],0.0) and near(sample.direction[1],0.0) and near(sample.direction[2],1.0),"latitude longitude direction decode")
  for channel=0 to 2 grid.data[grid.offset+channel]=0 end for;renormalized=lightGrid.sample(grid,[5.0,10.0,15.0]);count=count+require(near(renormalized.ambient[0],20.0) and near(renormalized.totalFactor,0.875),"wall sample ignored and remaining weights normalized")
  entity=lightGrid.entitySample(grid,[5.0,10.0,15.0]);count=count+require(near(entity.ambient[0],52.0) and near(entity.ambient[2],92.0),"entity minimum light added")
  count=count+require(near(lightGrid.vertexLight(entity,[0.0,0.0,1.0]),(52.0+72.0+92.0+80.0+100.0+120.0)/(255.0*3.0)),"directed vertex light follows surface normal")
  count=count+require(near(lightGrid.vertexLight(entity,[0.0,0.0,-1.0]),(52.0+72.0+92.0)/(255.0*3.0)),"back-facing normal receives ambient only")
  count=count+require(lightGrid.vertexColor(entity,[0.0,0.0,1.0])==[132,172,212,255],"diffuse color preserves RGB channels")
  count=count+require(lightGrid.vertexColor(entity,[0.0,0.0,-1.0])==[52,72,92,255],"back-facing diffuse color uses RGB ambient")
  count=count+require(lightGrid.vertexColor(lightGrid.Sample([250.0,1.0,2.0],[20.0,2.0,3.0],[0.0,0.0,1.0],1.0),[0.0,0.0,1.0])==[255,3,5,255],"diffuse color clamps each channel")
  base=lightGrid.Sample([10.0,20.0,30.0],[3.0,4.0,0.0],[0.0,0.0,1.0],1.0);light=dynamicLights.Light([16.0,0.0,0.0],16.0,[1.0,0.5,0.25],false);dynamic=lightGrid.withDynamicLights(base,[0.0,0.0,0.0],[light])
  count=count+require(dynamic.directed==[19.0,12.0,4.0],"dlight contributes inverse-square RGB at its radius")
  count=count+require(dynamic.direction[0]>0.95 and dynamic.direction[2]>0.29 and dynamic.direction[2]<0.30,"dlight direction combines with static directed magnitude")
  count=count+require(base.directed==[3.0,4.0,0.0] and dynamic.ambient==base.ambient,"dynamic sample preserves its source and ambient")
  nearLight=dynamicLights.Light([0.0,0.0,0.0],100.0,[1.0,0.0,0.0],false);nearDynamic=lightGrid.withDynamicLights(base,[0.0,0.0,0.0],[nearLight]);count=count+require(nearDynamic.directed[0]==628.0,"dlight distance clamps to 16 units")
  staticCenter=lightGrid.entitySample(grid,[5.0,10.0,15.0]);lightGrid.setDynamicLights(grid,[light]);integrated=lightGrid.entitySample(grid,[5.0,10.0,15.0]);count=count+require(integrated.directed[0]>staticCenter.directed[0],"entity sampling consumes current scene dlights")
  invalid=lightGrid.Grid(bytes(1,0),0,1,[0.0,0.0,0.0],[1.0,1.0,1.0],[1.0,1.0,1.0],[1,1,1],false,[]);count=count+require(lightGrid.sample(invalid,[0.0,0.0,0.0]).totalFactor==0.0,"invalid grid returns safe sample")
  print("PASS: "+str(count)+" playable light-grid contracts");return 0
end function
