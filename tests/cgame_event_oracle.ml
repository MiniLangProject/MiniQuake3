import mq3.client.cgame_event as events
import mq3.game.entitystate as entitystate
function place(rank) print("place|"+str(rank)+"|"+events.placeString(rank)) end function
function row(name,es,previous,position,calls,sounds) print("check|"+name+"|"+str(es.number)+"|"+str(es.event)+"|"+str(previous)+"|"+str(position[0])+","+str(position[1])+","+str(position[2])+"|"+str(calls)+"|"+str(sounds)) end function
function main(args)
  for each rank in [1,2,3,11,12,13,21,22,23,events.RANK_TIED_FLAG|2] place(rank) end for
  value=events.create(32);calls=0;sounds=0;es=entitystate.create();es.number=5;es.pos.trBase=[1.0,2.0,3.0]
  record=events.checkEvent(value,es,1234,true);position=[0.0,0.0,0.0];if record!=void then position=record.position;calls=calls+1;sounds=sounds+1 end if;row("zero",es,value.previousEvents[5],position,calls,sounds)
  es.event=14;record=events.checkEvent(value,es,1234,true);if record!=void then position=record.position;calls=calls+1;sounds=sounds+1 end if;row("riding",es,value.previousEvents[5],position,calls,sounds)
  record=events.checkEvent(value,es,1234,true);if record!=void then calls=calls+1;sounds=sounds+1 end if;row("repeat",es,value.previousEvents[5],position,calls,sounds)
  es.event=0x100|14;record=events.checkEvent(value,es,1234,true);if record!=void then position=record.position;calls=calls+1;sounds=sounds+1 end if;row("sequence",es,value.previousEvents[5],position,calls,sounds)
  es=entitystate.create();es.number=9;es.otherEntityNum=3;es.eType=events.ET_EVENTS+42;es.eFlags=events.EF_PLAYER_EVENT;es.pos.trBase=[9.0,0.0,0.0];record=events.checkEvent(value,es,1234,true);if record!=void then position=record.position;calls=calls+1;sounds=sounds+1 end if;effective=es.number;if record!=void then effective=record.effectiveEntity end if;shown=entitystate.copy(es);shown.number=effective;shown.event=42;row("event-only",shown,1,position,calls,sounds)
  record=events.checkEvent(value,es,1234,true);if record!=void then calls=calls+1;sounds=sounds+1 end if;row("event-repeat",shown,1,position,calls,sounds);return 0
end function
