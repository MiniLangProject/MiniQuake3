import mq3.botlib.aas_bspq3 as bsp
import mq3.botlib.server_imports as imports

struct Host point end struct
struct EngineTrace allsolid startsolid fraction endpos planeDist planeNormal planeSignbits planeType surfaceFlags entityNum end struct
function worldTrace(context,start,mins,maxs,finish,passent,mask) return EngineTrace(0,0,0.75,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],0,0,0,passent) end function
function point(context,value,passent) return value[0]+17 end function
function entityTrace(context,start,mins,maxs,finish,ent,mask) return EngineTrace(0,0,0.25,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],0,0,32,ent) end function
function pvs(context,a,b) return a[0]<b[0] end function
function bounds(context,model) return [[0.0-model,-2.0,-3.0],[0.0+model,2.0,3.0]] end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
 host=imports.services(Host(0));host.traceFn=worldTrace;host.pointContentsFn=point;host.entityTraceFn=entityTrace;host.inPvsFn=pvs;host.modelBoundsFn=bounds;a=[2.0,0.0,0.0];b=[5.0,0.0,0.0];zero=[0.0,0.0,0.0]
 tr=bsp.AAS_Trace(host,a,zero,zero,b,-1,1);print("imports="+str(tr.fraction)+","+str(bsp.AAS_PointContents(host,a))+","+str(flag(bsp.AAS_inPVS(host,a,b)))+","+str(flag(bsp.AAS_inPHS(a,b))))
 base=imports.BspTrace(0,0,0.5,zero,0.0,zero,0,0,0,0,0,0,0);hit=bsp.AAS_EntityCollision(host,3,a,zero,zero,b,1,base);print("collision="+str(flag(hit[0]))+","+str(hit[1].fraction)+","+str(hit[1].contents))
 model=bsp.AAS_BSPModelMinsMaxsOrigin(host,7,zero);print("bounds="+str(model[0][0])+","+str(model[0][2])+","+str(model[1][0])+","+str(model[2][0]))
 print("stubs=1,"+str(bsp.AAS_BoxEntities(zero,zero,[],1))+","+str(bsp.AAS_BSPTraceLight(a,b,zero,0,0,0)));bsp.AAS_UnlinkFromBSPLeaves(void);bsp.AAS_BSPLinkEntity(zero,zero,1,2)
 state=bsp.create();state.entities=[[],[],[]];state.numEntities=3;print("next="+str(bsp.AAS_NextBSPEntity(state,0))+","+str(bsp.AAS_NextBSPEntity(state,1))+","+str(bsp.AAS_NextBSPEntity(state,2))+","+str(flag(bsp.AAS_BSPEntityInRange(state,3))))
 state.entities[1]=[["count","-42"],["origin","1.5 -2 3"]];value=bsp.AAS_ValueForBSPEpairKey(state,1,"count");print("value="+str(flag(value[0]))+","+value[1]+",missing="+str(flag(bsp.AAS_ValueForBSPEpairKey(state,1,"none")[0])))
 vector=bsp.AAS_VectorForBSPEpairKey(state,1,"origin");floatValue=bsp.AAS_FloatForBSPEpairKey(state,1,"origin");intValue=bsp.AAS_IntForBSPEpairKey(state,1,"count");print("typed="+str(flag(vector[0]))+","+str(vector[1][0])+","+str(vector[1][1])+","+str(vector[1][2])+","+str(flag(floatValue[0]))+","+str(floatValue[1])+","+str(flag(intValue[0]))+","+str(intValue[1]));return 0
end function
