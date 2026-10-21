import mq3.client.cgame_predict as predict
import mq3.game.playerstate as playerstate
import mq3.game.entitystate as entitystate
import mq3.game.pmove as pmove
import mq3.compat.numeric as n
struct Source serverTime playerState entities end struct
function hex32(value) digits="0123456789abcdef";text="";for i=0 to 7 text=digits[(value>>(i*4))&15]+text end for;return text end function
function bits3(value) return hex32(n.floatBits(value[0]))+","+hex32(n.floatBits(value[1]))+","+hex32(n.floatBits(value[2])) end function
function emit(name,value) print(name+"|"+str(value.bobCycle)+"|"+bits3(value.origin)+"|"+bits3(value.velocity)+"|"+bits3(value.viewangles));return void end function
function source(time) return Source(time,playerstate.create(),[]) end function
function ent(number,type,solid) value=entitystate.create();value.number=number;value.eType=type;value.solid=solid;return value end function
function main(args)
 a=source(1000);b=source(1100);a.playerState.stats[0]=100;b.playerState.stats[0]=100;a.playerState.bobCycle=250;b.playerState.bobCycle=6;a.playerState.origin=[0.0,10.0,20.0];b.playerState.origin=[10.0,30.0,50.0];a.playerState.velocity=[4.0,6.0,8.0];b.playerState.velocity=[8.0,10.0,12.0];a.playerState.viewangles=[350.0,10.0,20.0];b.playerState.viewangles=[10.0,30.0,40.0]
 emit("half",predict.interpolatePlayerState(a,b,1050,false,void,false));emit("teleport",predict.interpolatePlayerState(a,b,1050,false,void,true));emit("missing",predict.interpolatePlayerState(a,void,1050,false,void,false))
 command=pmove.Command(1050,[11,22,33],0,0,0,0,0);emit("angles",predict.interpolatePlayerState(a,b,1050,true,command,false))
 a.entities=[ent(1,2,0),ent(2,8,0),ent(3,9,0),ent(4,0,7)];b.entities=[ent(5,2,0),ent(6,0,9)];state=predict.create();predict.buildSolidList(state,a,b,true,false);print("solid-current|"+str(len(state.solidEntities))+"|"+str(len(state.triggerEntities))+"|"+str(state.triggerEntities[0].state.number)+"|"+str(state.triggerEntities[1].state.number)+"|"+str(state.triggerEntities[2].state.number));predict.buildSolidList(state,a,b,false,false);print("solid-next|"+str(len(state.solidEntities))+"|"+str(len(state.triggerEntities))+"|"+str(state.solidEntities[0].state.number)+"|"+str(state.triggerEntities[0].state.number));return 0
end function
