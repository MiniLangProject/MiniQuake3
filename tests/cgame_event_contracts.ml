import mq3.client.cgame_event as events
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
struct Snapshot serverTime playerState entities end struct
function require(value,message) if not value then return error(7711,message) end if;return 1 end function
function ent(number,event) value=entitystate.create();value.number=number;value.event=event;value.pos.trBase=[number*1.0,2.0,3.0];return value end function
function main(args)
  count=0;value=events.create(64);value.predictedClient=0;value.time=1000
  count=count+require(events.placeString(1)=="^41st^7" and events.placeString(12)=="12th" and events.placeString(23)=="23rd","place strings")
  count=count+require(events.placeString(events.RANK_TIED_FLAG|2)=="Tied for ^12nd^7","tied place")
  count=count+require(events.eventName(0)=="EV_NONE" and events.eventName(82)=="EV_TAUNT_PATROL" and events.eventName(83)=="UNKNOWN","event names")
  first=ent(1,events.EV_EVENT_BITS|14);record=events.checkEvent(value,first,1000,true);count=count+require(record.event==14 and record.suppressed and len(record.actions)==1,"riding event decode")
  count=count+require(record.position==[1.0,2.0,3.0] and record.actions[0].kind=="custom:*jump1.wav","position and jump action")
  count=count+require(events.checkEvent(value,first,1000,true)==void,"riding event dedupe")
  first.event=0x100|14;count=count+require(events.checkEvent(value,first,1000,true).event==14,"event sequence bits retrigger")
  only=ent(9,0);only.eType=events.ET_EVENTS+42;only.eFlags=events.EF_PLAYER_EVENT;only.otherEntityNum=3;record=events.checkEvent(value,only,1000,true);count=count+require(record.sourceEntity==9 and record.effectiveEntity==3 and len(record.actions)==2,"event-only player redirect")
  count=count+require(events.checkEvent(value,only,1000,true)==void,"event-only dedupe")
  count=count+require(events.checkEvent(value,only,1301,true).event==42,"stale event-only slot reset")
  step=ent(2,6);step.clientNum=0;record=events.checkEvent(value,step,1000,true);count=count+require(value.stepChange==4.0 and value.stepTime==1000,"step smoothing")
  step.event=0x100|9;value.time=1100;events.checkEvent(value,step,1100,true);count=count+require(value.stepChange==18.0,"overlapping step smoothing")
  far=ent(3,12);far.clientNum=0;record=events.checkEvent(value,far,1200,true);count=count+require(value.landChange==-24 and value.landTime==1100,"fall smoothing")
  pain=ent(4,56);pain.clientNum=4;pain.eventParm=20;value.time=2000;record=events.checkEvent(value,pain,2000,false);count=count+require(record.actions[0].kind=="custom:*pain25_1.wav" and record.actions[0].dispatched,"pain routing")
  pain.event=0x100|56;value.time=2200;record=events.checkEvent(value,pain,2200,false);count=count+require(len(record.actions)==0,"pain throttle")
  rail=ent(5,53);rail.eventParm=1;record=events.checkEvent(value,rail,2200,true);count=count+require(len(record.actions)==2 and record.actions[1].kind=="rail-impact","rail effects")
  rail.event=0x100|53;rail.eventParm=255;record=events.checkEvent(value,rail,2200,true);count=count+require(len(record.actions)==1,"rail no-mark sentinel")
  stop=ent(6,75);stop.loopSound=17;events.checkEvent(value,stop,2200,true);count=count+require(stop.loopSound==0,"stop loop state")
  ps=playerstate.create();ps.clientNum=0;snap=Snapshot(3000,ps,[ent(10,23),ent(11,44)]);before=value.suppressed;count=count+require(events.observeSnapshot(value,snap,true)==2,"snapshot observation");count=count+require(value.suppressed>before and value.dispatched==1,"retail suppression")
  count=count+require(len(value.audio)>0 and len(value.render)>0 and len(value.hud)==0 and len(value.stateActions)>0,"typed boundaries")
  events.clearBoundaryQueues(value);count=count+require(len(value.audio)==0 and len(value.render)==0,"queue clear")
  for event=1 to 82 sample=ent(20,event);sample.clientNum=1;sample.eventParm=10;value.previousEvents[20]=0;value.eventOnly[20]=false;decoded=events.checkEvent(value,sample,4000+event,true);count=count+require(not (decoded is error),"complete event table") end for
  count=count+require(try(events.checkEvent(value,ent(99,1),0,true)) is error,"entity bounds")
  print("PASS: "+str(count)+" native cg_event contracts");return 0
end function
