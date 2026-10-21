import mq3.client.cgame_snapshot as snap
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.compat.numeric as numeric
struct Source serverTime playerState entities end struct
function boolInt(value) if value then return 1 end if;return 0 end function
function row(name,value) print(name+"|"+str(value.currentState.number)+"|"+str(boolInt(value.currentValid))+"|"+str(boolInt(value.interpolate))+"|"+str(value.previousEvent)+"|"+str(value.trailTime)+"|"+str(numeric.trunc32(value.lerpOrigin[0]))+","+str(numeric.trunc32(value.lerpOrigin[1]))+","+str(numeric.trunc32(value.lerpOrigin[2]))+"|"+str(value.playerResets)+"|"+str(value.events));return void end function
function main(args)
 state=snap.create(16);player=ps.create();source=Source(1000,player,[]);state.snap=snap.wrap(1,source,0,0);state.time=1000;value=snap.cent();value.currentState.number=3;value.currentState.eType=snap.ET_PLAYER;value.currentState.origin=[1.0,2.0,3.0];value.previousEvent=9;value.snapShotTime=600;snap.resetEntity(state,value);row("reset-old",value);value.previousEvent=7;value.snapShotTime=900;snap.resetEntity(state,value);row("reset-live",value);value.nextState.number=8;value.nextState.eType=0;value.nextState.origin=[4.0,0.0,0.0];value.interpolate=false;snap.transitionEntity(state,value);row("transition-reset",value);value.nextState.number=9;value.interpolate=true;snap.transitionEntity(state,value);row("transition-interp",value);return 0
end function
