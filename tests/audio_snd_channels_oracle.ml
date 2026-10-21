import mq3.audio.snd_channels as channels

function slotFor(state,handle) for slot=0 to channels.MAX_CHANNELS-1 if state.channels[slot].active and state.channels[slot].handle==handle then return slot end if end for;return -1 end function
function start(state,time,entity,channel,handle) channels.setTime(state,time);channels.start(state,entity,handle,channel);return void end function
function show(label,state,handle) print(label+"|"+str(channels.activeCount(state))+"|"+str(slotFor(state,handle)));return void end function
function main(args)
  state=channels.create();start(state,100,1,0,1);show("first",state,1);start(state,120,1,0,1);show("duplicate",state,1);start(state,160,1,0,1);show("after50",state,1)
  state=channels.create();for i=0 to 5 start(state,100+i*60,2,0,2) end for;show("remote-limit",state,2)
  state=channels.create();channels.setListener(state,3);for i=0 to 9 start(state,100+i*60,3,1,3) end for;show("listener-limit",state,3)
  state=channels.create();for i=0 to channels.MAX_CHANNELS-1 channel=0;if i==0 then channel=channels.CHAN_ANNOUNCER end if;start(state,100+i,i%12,channel,10+i) end for;show("full",state,105)
  start(state,500,5,0,200);show("same-entity-replace",state,200);start(state,501,77,0,201);show("global-replace",state,201)
  state=channels.create();for i=0 to channels.MAX_CHANNELS-1 start(state,100,0,channels.CHAN_ANNOUNCER,10+i) end for;start(state,200,8,0,220);show("protected-full",state,220)
  state=channels.create();start(state,10,9,2,9);slot=slotFor(state,9);channels.release(state,slot);start(state,20,10,2,10);show("freed-reused",state,10)
  return 0
end function
