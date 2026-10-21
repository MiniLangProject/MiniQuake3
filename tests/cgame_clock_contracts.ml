// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.cgame_clock as clock
import mq3.client.cgame_time as timing

function req(ok,label) if not ok then return error(7691,"cgame clock contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(try(clock.create(-1,0,0)) is error,"negative realtime rejected")
  count=count+req(try(clock.create(0,-1,0)) is error,"negative sequence rejected")
  count=count+req(try(clock.create(0,0,-1)) is error,"negative snapshot time rejected")
  value=clock.create(1000,7,1000);first=clock.frame(value,1000)
  count=count+req(first.draw and first.serverTime==1000,"primed first snapshot activates")
  count=count+req(value.state.connectionState==timing.CA_ACTIVE and value.state.serverTimeDelta==0,"first snapshot initializes delta")
  count=count+req(not clock.publishSnapshot(value,7,1000,0),"duplicate snapshot ignored")
  count=count+req(try(clock.publishSnapshot(value,7,1001,0)) is error,"duplicate mutation rejected")
  count=count+req(try(clock.publishSnapshot(value,6,1050,0)) is error,"sequence rollback rejected")
  count=count+req(clock.publishSnapshot(value,8,1050,0),"new snapshot published")
  second=clock.frame(value,1030)
  count=count+req(second.draw and second.serverTime>=1000 and second.serverTime<=1050,"new snapshot adjusts monotone clock")
  count=count+req(not value.state.newSnapshots,"new snapshot consumed")
  count=count+req(try(clock.publishSnapshot(value,9,1049,0)) is error,"server-time rollback rejected")
  value=clock.create(1000,1,1000);clock.frame(value,1000);clock.setTimeNudge(value,99);nudged=clock.frame(value,1050)
  count=count+req(nudged.serverTime==1020,"positive time nudge clamps at thirty")
  value=clock.create(1000,1,1000);clock.frame(value,1000);clock.setTimeNudge(value,-99);nudged=clock.frame(value,1050)
  count=count+req(nudged.serverTime==1080,"negative time nudge clamps at thirty")
  value=clock.create(1000,1,1000);clock.frame(value,1000);clock.setPaused(value,true,true,true);paused=clock.frame(value,1100)
  count=count+req(not paused.draw and paused.serverTime==1000,"local pause suppresses draw-time advance")
  clock.setPaused(value,false,false,true);resumed=clock.frame(value,1100)
  count=count+req(resumed.draw and resumed.serverTime>=1000,"resume advances monotonically")
  inactive=clock.create(1000,1,1000);inactive.state.snapFlags=timing.SNAPFLAG_NOT_ACTIVE
  waiting=clock.frame(inactive,1000);count=count+req(not waiting.draw and inactive.state.connectionState==timing.CA_PRIMED,"inactive snapshot remains primed")
  count=count+req(try(clock.frame(void,0)) is error,"missing clock rejected")
  count=count+req(try(clock.frame(value,-1)) is error,"negative frame time rejected")
  print "PASS: "+str(count)+" productive cgame-clock contracts";return 0
end function
