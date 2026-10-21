import mq3.audio.snd_channels as channels

function req(ok,message) if not ok then return error(7664,message) end if;return 1 end function
function main(args)
  count=0;state=channels.create()
  count=count+req(len(state.channels)==96 and len(state.freeSlots)==96,"96 Baseq3 channels created")
  first=channels.start(state,1,10,0);count=count+req(first.accepted and first.slot==95 and not first.replaced,"free list begins at slot 95")
  channels.setTime(state,49);duplicate=channels.start(state,1,10,0);count=count+req(duplicate.accepted and duplicate.slot==94,"Baseq3 double-index scan skips odd channel slot")
  channels.setTime(state,50);again=channels.start(state,1,10,0);count=count+req(not again.accepted and again.reason=="duplicate","even channel duplicate suppressed inside 50ms")
  count=count+req(channels.activeCount(state)==2,"active count")
  count=count+req(channels.release(state,95) and not channels.release(state,95),"release is idempotent")
  channels.setTime(state,60);reused=channels.start(state,2,11,2);count=count+req(reused.slot==95,"freed slot returns to free-list head")
  state=channels.create();last=void;for i=0 to 5 channels.setTime(state,i*60);last=channels.start(state,4,12,0) end for
  count=count+req(channels.activeCount(state)==6 and last.accepted,"remote limit follows Baseq3 sparse channel scan")
  state=channels.create();channels.setListener(state,4);last=void;for i=0 to 9 channels.setTime(state,i*60);last=channels.start(state,4,12,0) end for
  count=count+req(channels.activeCount(state)==10 and last.accepted,"listener allowance follows Baseq3 sparse channel scan")
  state=channels.create();for i=0 to 95 channels.setTime(state,100+i);channels.start(state,i%10,20+i,0) end for
  count=count+req(len(state.freeSlots)==0 and channels.activeCount(state)==96,"all channels allocated")
  channels.setTime(state,500);replacement=channels.start(state,5,200,0)
  count=count+req(replacement.accepted and replacement.replaced,"full pool replaces channel")
  count=count+req(state.channels[replacement.slot].entity==5 and state.channels[replacement.slot].handle==200,"replacement metadata installed")
  state=channels.create();for i=0 to 95 channels.setTime(state,100+i);channel=0;if i==0 then channel=channels.CHAN_ANNOUNCER end if;channels.start(state,i%8,20+i,channel) end for
  protectedSlot=95;channels.setTime(state,500);replacement=channels.start(state,0,220,0)
  count=count+req(replacement.slot!=protectedSlot and state.channels[protectedSlot].entchannel==channels.CHAN_ANNOUNCER,"announcer channel protected from replacement")
  state=channels.create();channels.setListener(state,3);for i=0 to 95 channels.setTime(state,100+i);channels.start(state,3,20+i,0) end for;channels.setTime(state,500);full=channels.start(state,7,220,0)
  count=count+req(not full.accepted and full.reason=="full","listener-owned full pool is protected")
  state=channels.create();count=count+req(not channels.start(state,0,0,0).accepted,"invalid sound handle rejected")
  count=count+req(not channels.release(state,-1) and not channels.release(state,96),"invalid release rejected")
  channels.setListener(state,7);count=count+req(state.listener==7,"listener updated")
  channels.setTime(state,100);channels.advance(state,25);count=count+req(state.time==125,"audio clock advances")
  print("PASS: "+str(count)+" snd channel contracts");return 0
end function
