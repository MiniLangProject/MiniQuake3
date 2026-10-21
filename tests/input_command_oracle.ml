import mq3.client.input_command as input
import mq3.compat.numeric as n

function hexDigit(value) return ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"][value&15] end function
function hex32(value) result="";shift=28;while shift>=0 result=result+hexDigit((value>>shift)&15);shift=shift-4 end while;return result end function
function main(args)
  b=input.button();b.active=true;b.downtime=125;value=input.keyState(b,150,50);print "key|"+hex32(n.floatBits(value))+"|"+str(b.downtime)+"|"+str(b.msec)
  state=input.create(0.0,0.0,0.0);config=input.defaults();config.run=false;state.forward.active=true;state.moveright.active=true;state.up.active=true;state.forward.downtime=100;state.moveright.downtime=100;state.up.downtime=100;cmd=input.createCommand(state,config,150,50,1,0,1.0,0,false);print "move|"+str(cmd.forwardmove)+"|"+str(cmd.rightmove)+"|"+str(cmd.upmove)+"|"+str(cmd.buttons)
  state=input.create(0.0,0.0,0.0);config=input.defaults();config.sensitivity=2.0;input.accumulateMouse(state,10,-5);cmd=input.createCommand(state,config,150,50,1,0,0.5,0,false);print "mouse|"+hex32(n.floatBits(cmd.viewangles[1]))+"|"+hex32(n.floatBits(cmd.viewangles[0]))+"|"+str(state.mouseIndex)+"|"+str(state.mouseDx[1])+"|"+str(state.mouseDy[1])
  state=input.create(0.0,0.0,0.0);config=input.defaults();input.keyDown(state.strafe,1,100);input.accumulateMouse(state,40,0);cmd=input.createCommand(state,config,150,50,1,0,1.0,0,false);print "strafe|"+str(cmd.rightmove)+"|"+hex32(n.floatBits(cmd.viewangles[1]))
  state=input.create(0.0,0.0,0.0);input.joystickEvent(state,0,10);input.joystickEvent(state,1,-20);input.joystickEvent(state,2,30);cmd=input.createCommand(state,input.defaults(),150,50,1,0,1.0,0,false);print "joy|"+hex32(n.floatBits(cmd.viewangles[1]))+"|"+str(cmd.forwardmove)+"|"+str(cmd.upmove)+"|"+str(cmd.buttons);return 0
end function
