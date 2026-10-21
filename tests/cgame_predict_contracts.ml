import mq3.client.cgame_predict as predict
import mq3.client.cgame_snapshot as snapshots
import mq3.game.playerstate as playerstate
import mq3.game.entitystate as entitystate
import mq3.game.pmove as pmove
import mq3.game.movement as movement
import mq3.collision.brush as brush
import mq3.game.constants as c

struct Source serverTime playerState entities end struct
struct Host mode traces points end struct
function req(value,message) if not value then return error(7741,message) end if;return 1 end function
function source(time) return Source(time,playerstate.create(),[]) end function
function ent(number,type,solid) value=entitystate.create();value.number=number;value.eType=type;value.solid=solid;return value end function
function collisionResult(fraction,number,startsolid,allsolid,finish) value=brush.emptyTrace();value.fraction=fraction;value.startsolid=startsolid;value.allsolid=allsolid;return movement.Collision(value,finish,number) end function
function worldTrace(service,start,mins,maxs,finish,mask) service.context.traces=service.context.traces+1;return collisionResult(1.0,1023,false,false,finish) end function
function entityTrace(service,value,start,mins,maxs,finish,mask) service.context.traces=service.context.traces+1;if value.state.number==7 then return collisionResult(0.25,7,false,false,[2.5,0.0,0.0]) end if;return collisionResult(1.0,value.state.number,false,false,finish) end function
function worldPoint(service,point) service.context.points=service.context.points+1;return 1 end function
function entityPoint(service,value,point) service.context.points=service.context.points+1;return 8 end function
function triggerTouch(service,value,origin,mins,maxs) return value.state.number==10 or value.state.number==11 end function
function mover(service,origin,ground,fromTime,toTime) return [origin[0]+(toTime-fromTime)*0.01,origin[1],origin[2]] end function
function predictionCommand(time,forward) return pmove.Command(time,[0,0,0],0,c.WP_MACHINEGUN,forward,0,0) end function
function main(args)
 count=0;state=predict.create();hostState=Host(0,0,0);host=predict.services(hostState);host.worldTraceFn=worldTrace;host.entityTraceFn=entityTrace;host.worldPointFn=worldPoint;host.entityPointFn=entityPoint;host.triggerTouchFn=triggerTouch;host.moverAdjustFn=mover
 a=source(1000);a.entities=[ent(1,c.ET_ITEM,0),ent(7,c.ET_MOVER,123),ent(9,c.ET_MOVER,0)];b=source(1100);b.entities=[ent(2,c.ET_ITEM,0),ent(8,c.ET_MOVER,456)]
 count=count+req(predict.buildSolidList(state,a,b,false,false)==1 and len(state.triggerEntities)==1 and state.solidEntities[0].state.number==8,"next snapshot solid selection")
 predict.buildSolidList(state,a,b,true,false);count=count+req(state.solidEntities[0].state.number==7 and state.triggerEntities[0].state.number==1,"teleport uses current snapshot")
 hit=predict.trace(state,host,[0.0,0.0,0.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],[10.0,0.0,0.0],-1,1);count=count+req(hit.entityNum==7 and hit.trace.fraction==0.25,"entity clip replaces world trace")
 state.solidEntities=state.solidEntities+[predict.entity(ent(12,c.ET_MOVER,predict.SOLID_BMODEL))];contents=predict.pointContents(state,host,[0.0,0.0,0.0],-1);count=count+req(contents==9,"bmodel point contents merged")
 a.playerState.origin=[0.0,10.0,20.0];b.playerState.origin=[10.0,30.0,40.0];a.playerState.velocity=[4.0,6.0,8.0];b.playerState.velocity=[8.0,10.0,12.0];a.playerState.viewangles=[350.0,10.0,20.0];b.playerState.viewangles=[10.0,30.0,40.0];a.playerState.bobCycle=250;b.playerState.bobCycle=6
 interpolated=predict.interpolatePlayerState(a,b,1050,false,void,false);count=count+req(interpolated.origin==[5.0,20.0,30.0] and interpolated.velocity==[6.0,8.0,10.0] and interpolated.bobCycle==256 and interpolated.viewangles[0]==360.0,"playerstate interpolation and wrap")
 teleported=predict.interpolatePlayerState(a,b,1050,false,void,true);count=count+req(teleported.origin==a.playerState.origin,"teleport suppresses interpolation")
 a.playerState.commandTime=1000;a.playerState.stats[c.STAT_HEALTH]=100;a.playerState.stats[c.STAT_MAX_HEALTH]=100;a.playerState.weapon=c.WP_MACHINEGUN;a.playerState.ammo[c.WP_MACHINEGUN]=10;a.playerState.speed=320;a.playerState.gravity=800
 demo=predict.predict(state,a,b,1050,1000,[],true,false,false,false,false,0,true,false,8,host);count=count+req(demo.origin==[5.0,20.0,30.0] and state.lastMode=="interpolate","demo prediction is interpolation")
 state.valid=false;frozen=predict.predict(state,a,void,1050,1000,[predictionCommand(1020,1)],false,false,false,false,false,0,true,false,8,host);count=count+req(state.packetBackupExceeded and state.lastMode=="frozen","packet-backup guard")
 state.valid=false;normal=predict.predict(state,a,void,1050,1000,[predictionCommand(1000,0),predictionCommand(1050,20)],false,false,false,false,false,0,false,false,8,host);count=count+req(not (normal is error) and state.moved and state.lastMode=="predicted" and state.transitions>0,"copied pmove prediction path")
 triggerState=predict.create();triggerState.predicted=playerstate.copy(a.playerState);triggerState.predicted.pm_type=c.PM_NORMAL;triggerState.predicted.stats[c.STAT_HEALTH]=100;tele=ent(10,c.ET_TELEPORT_TRIGGER,predict.SOLID_BMODEL);push=ent(11,c.ET_PUSH_TRIGGER,predict.SOLID_BMODEL);push.origin2=[100.0,0.0,300.0];triggerState.triggerEntities=[predict.entity(tele),predict.entity(push)];touched=predict.touchTriggerPrediction(triggerState,host,1050,0,true,[-15.0,-15.0,-24.0],[15.0,15.0,32.0]);count=count+req(touched==2 and triggerState.hyperspace and triggerState.predicted.jumppad_ent==11,"teleport and jump-pad trigger effects")
 itemState=predict.create();itemState.predicted=playerstate.copy(a.playerState);weapon=ent(20,c.ET_ITEM,0);weapon.modelindex=8;weapon.pos.trBase=[itemState.predicted.origin[0],itemState.predicted.origin[1],itemState.predicted.origin[2]];itemValue=predict.entity(weapon);picked=predict.touchItem(itemState,itemValue,1050,0,true);count=count+req(picked and itemState.predicted.ammo[c.WP_GAUNTLET]==1 and (itemState.predicted.stats[c.STAT_WEAPONS]&(1<<c.WP_GAUNTLET))!=0,"predicted weapon pickup")
 print("PASS: "+str(count)+" native cg_predict contracts");return 0
end function

