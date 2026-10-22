// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.aas_sample as sample
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_trace_areas as traceAreas
import mq3.botlib.aas_client_trace as clientTrace
import mq3.format.aas as aas
import mq3.format.pk3 as pk3
function req(ok,label) if not ok then return error(7961,"AAS sample contract: "+label) end if;return 1 end function
function entityTrace(context,ent,start,mins,maxs,finish,mask) result=clientTrace.empty();result.fraction=0.25;result.endpos=[start[0]+(finish[0]-start[0])*0.25,start[1]+(finish[1]-start[1])*0.25,start[2]+(finish[2]-start[2])*0.25];result.ent=ent;return result end function
function contents(context,point) return context end function
function contains(values,value) for each item in values if item==value then return true end if end for;return false end function
function main(args)
  archive=pk3.open(args[0]);map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));rt=runtime.create(map);world=sample.create(rt);checks=0
  checks=checks+req(sample.AAS_PresenceTypeBoundingBox(sample.PRESENCE_NORMAL)==[[-15.0,-15.0,-24.0],[15.0,15.0,32.0]],"normal bounds")
  checks=checks+req(sample.AAS_PresenceTypeBoundingBox(sample.PRESENCE_CROUCH)==[[-15.0,-15.0,-24.0],[15.0,15.0,8.0]] and sample.AAS_PresenceTypeBoundingBox(99)[1][2]==8.0,"crouch and fallback bounds")
  checks=checks+req(sample.AAS_BoxOriginDistanceFromPlane([1.0,0.0,0.0],[-2.0,-2.0,-2.0],[2.0,2.0,2.0],0)==2.0 and sample.AAS_BoxOriginDistanceFromPlane([1.0,0.0,0.0],[-2.0,-2.0,-2.0],[2.0,2.0,2.0],1)==-2.0,"box origin plane distance")
  plane=aas.Plane([1.0,0.0,0.0],0.0,0);checks=checks+req(sample.AAS_BoxOnPlaneSide2([-2.0,-2.0,-2.0],[2.0,2.0,2.0],plane)==3,"box straddles plane")
  count=sample.AAS_InitAASLinkHeap(world,4);checks=checks+req(count==4 and world.numFree==4,"link heap init")
  one=sample.AAS_AllocAASLink(world);two=sample.AAS_AllocAASLink(world);checks=checks+req(one.id==0 and two.id==1 and world.numFree==2,"link allocation order")
  checks=checks+req(sample.AAS_DeAllocAASLink(world,one) and world.numFree==3 and not sample.AAS_DeAllocAASLink(world,one),"link free ownership")
  sample.AAS_InitAASLinkedEntities(world);chosen=1;area=aas.area(map,chosen);links=sample.AAS_AASLinkEntity(world,area.mins,area.maxs,77);checks=checks+req(len(links)>0 and world.heap[links[0]].entNum==77,"bbox entity linking")
  duplicate=sample.AAS_AASLinkEntity(world,area.mins,area.maxs,77);checks=checks+req(len(duplicate)==0,"duplicate entity-area links suppressed")
  areas=sample.AAS_BBoxAreas(world,area.mins,area.maxs,128);checks=checks+req(contains(areas,chosen),"bbox area traversal")
  checks=checks+req(sample.AAS_UnlinkFromAreas(world,links)>0,"area unlink and heap return")
  sample.AAS_FreeAASLinkedEntities(world);checks=checks+req(len(world.areaLinked)==0,"linked entity shutdown")
  sample.AAS_FreeAASLinkHeap(world);checks=checks+req(len(world.heap)==0 and world.numFree==0,"link heap shutdown")
  center=area.center;checks=checks+req(sample.AAS_PointAreaNum(world,center)==chosen,"point area")
  settings=aas.areaSettings(map,chosen);checks=checks+req(sample.AAS_AreaCluster(world,chosen)==settings.cluster and sample.AAS_AreaPresenceType(world,chosen)==settings.presenceType,"cluster and presence")
  checks=checks+req(sample.AAS_PointPresenceType(world,center)==settings.presenceType,"point presence")
  info=sample.AAS_AreaInfo(world,chosen);checks=checks+req(info.contents==settings.contents and info.center==center,"area info")
  checks=checks+req(sample.AAS_PlaneFromNum(world,1)!=void and sample.AAS_PlaneFromNum(world,map.counts[aas.LUMP_PLANES])==void,"plane lookup")
  nullIndex=sample.AAS_PointReachabilityAreaIndex(world,void);checks=checks+req(nullIndex>0,"null reachability index totals clusters")
  endArea=2;finish=aas.area(map,endArea).center;adapterTrace=sample.AAS_TraceAreas(world,center,finish,20);directTrace=traceAreas.trace(rt,center,finish,20);checks=checks+req(adapterTrace.areas==directTrace.areas and len(adapterTrace.areas)>0,"TraceAreas delegate")
  adapterClient=sample.AAS_TraceClientBBox(world,center,finish,sample.PRESENCE_NORMAL,-1);directClient=clientTrace.trace(rt,center,finish,sample.PRESENCE_NORMAL);checks=checks+req(adapterClient.fraction==directClient.fraction and adapterClient.area==directClient.area,"static client trace delegate")
  sample.AAS_InitAASLinkHeap(world,32);sample.AAS_InitAASLinkedEntities(world);links=sample.AAS_AASLinkEntity(world,area.mins,area.maxs,99);world.services.entityCollisionFn=entityTrace;collision=sample.AAS_AreaEntityCollision(world,chosen,center,finish,sample.PRESENCE_NORMAL,-1);checks=checks+req(collision.ent==99 and collision.fraction==0.25,"linked entity collision")
  world.services.pointContentsFn=contents;world.services.context=sample.CONTENTS_WATER;checks=checks+req(sample.AAS_SwimLevel(world,center)==1,"water swim level");world.services.context=sample.CONTENTS_SLIME;checks=checks+req(sample.AAS_SwimLevel(world,center)==2,"slime swim level");world.services.context=sample.CONTENTS_LAVA;checks=checks+req(sample.AAS_SwimLevel(world,center)==3,"lava swim level")
  print("PASS: "+str(checks)+" AAS sample native contracts\n");return 0
end function
