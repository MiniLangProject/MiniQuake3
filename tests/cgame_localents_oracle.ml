import mq3.client.cgame_localents as localents
import mq3.compat.numeric as n
struct Trace allsolid fraction endpos normal end struct
struct Context end struct
function traceFn(context,start,finish) return Trace(false,1.0,finish,[0.0,0.0,1.0]) end function
function contentsFn(context,point) return 0 end function
function randomFn(context) return 0 end function
function main(args)
 services=localents.Services(traceFn,contentsFn,randomFn,Context());state=localents.initLocalEntities(services,false);a=localents.allocLocalEntity(state);b=localents.allocLocalEntity(state);localents.freeLocalEntity(state,a);again=localents.allocLocalEntity(state);linked=0;if state.active[0]==again.id then linked=1 end if;print("pool|"+str(b.id)+"|"+str(again.id)+"|"+str(linked))
 le=localents.allocLocalEntity(state);le.endTime=1000;le.lifeRate=0.001;le.color=[1.0,0.5,0.25,0.75];state.time=500;localents.addFadeRGB(state,le);print("fade|"+str(n.floatBits(le.refEntity.shaderRGBA[0]))+"|"+str(n.floatBits(le.refEntity.shaderRGBA[1]))+"|"+str(n.floatBits(le.refEntity.shaderRGBA[2]))+"|"+str(n.floatBits(le.refEntity.shaderRGBA[3]))+"|1")
 hit=Trace(false,0.5,[1.0,2.0,0.0],[0.0,0.0,1.0]);le.pos.trType=2;le.pos.trDelta=[10.0,0.0,-100.0];le.bounceFactor=0.5;state.time=1000;state.frametime=100;localents.reflectVelocity(state,le,hit);print("reflect|"+str(n.floatBits(le.pos.trDelta[0]))+"|"+str(n.floatBits(le.pos.trDelta[1]))+"|"+str(n.floatBits(le.pos.trDelta[2]))+"|"+str(le.pos.trTime)+"|"+str(le.pos.trType))
 le=localents.newLocalEntity(7);le.startTime=0;le.endTime=1000;le.light=200.0;le.lightColor=[1.0,0.0,0.0];le.refEntity.origin=[4.0,0.0,0.0];state.time=750;localents.clearBoundaryActions(state);localents.addExplosion(state,le);print("explosion|1|1|"+str(n.floatBits(state.actions[1].scalar)))
 le=localents.newLocalEntity(7);le.startTime=0;le.endTime=1000;le.light=200.0;le.refEntity.origin=[4.0,0.0,0.0];state.time=500;localents.clearBoundaryActions(state);localents.addSpriteExplosion(state,le);print("sprite|1|1|"+str(localents.RT_SPRITE)+"|"+str(n.floatBits(state.actions[0].scalar))+"|"+str(n.trunc32(state.actions[0].color[3]))+"|"+str(n.floatBits(state.actions[1].scalar)))
 le=localents.newLocalEntity(7);le.startTime=0;le.endTime=1000;le.lifeRate=0.001;le.radius=52.0;le.pos.trBase=[100.0,0.0,0.0];state.time=500;state.vieworg=[0.0,-100.0,0.0];localents.clearBoundaryActions(state);localents.addScorePlum(state,le);print("plum|"+str(len(state.actions))+"|"+str(100+state.actions[0].data)+"|"+str(100+state.actions[1].data)+"|"+str(n.trunc32(state.actions[0].color[0]))+"|"+str(n.trunc32(state.actions[0].color[1]))+"|"+str(n.trunc32(state.actions[0].color[2])));return 0
end function
