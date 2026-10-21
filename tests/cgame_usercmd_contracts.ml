import mq3.client.cgame_usercmd as state
import mq3.compat.numeric as n

function req(value,label) if not value then return error(7697,"cgame usercmd contract: "+label) end if;return 1 end function

function main(args)
  count=0;s=state.create()
  count=count+req(state.weapon(s)==0,"default weapon")
  count=count+req(n.floatBits(state.sensitivity(s))==n.floatBits(1.0),"default sensitivity")
  state.set(s,5,1.25)
  count=count+req(state.weapon(s)==5,"weapon stored")
  count=count+req(n.floatBits(state.sensitivity(s))==n.floatBits(1.25),"sensitivity stored")
  count=count+req(n.floatBits(state.scaleMouse(s,8.0))==n.floatBits(10.0),"mouse scaling")
  state.set(s,300,0.5)
  count=count+req(state.weapon(s)==300,"host value retained before usercmd byte serialization")
  count=count+req(n.floatBits(state.scaleMouse(s,-3.0))==n.floatBits(-1.5),"negative mouse scaling")
  state.set(s,-1,0.0)
  count=count+req(state.weapon(s)==-1,"signed host value retained")
  count=count+req(n.floatBits(state.scaleMouse(s,100.0))==n.floatBits(0.0),"zero sensitivity")
  count=count+req(state.weapon(void)==0,"missing-state weapon default")
  count=count+req(n.floatBits(state.sensitivity(void))==n.floatBits(1.0),"missing-state sensitivity default")
  count=count+req(try(state.set(void,1,1.0)) is error,"missing state rejected")
  print "PASS: "+str(count)+" cgame usercmd-state contracts";return 0
end function
