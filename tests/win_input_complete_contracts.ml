import mq3.platform.win_input_runtime as input
import mq3.client.input_command_events as events
function req(value,label) if not value then return error(7950,"win input contract: "+label) end if;return 1 end function
function main(args)
  count=0;r=input.create();count=count+req(not r.appActive and not r.mouse.initialized,"cold lifecycle")
  count=count+req(not input.IN_StartupMouse(r,true,false) and r.mouse.startupDelayed,"delayed startup")
  count=count+req(input.IN_StartupMouse(r,true,true) and r.mouse.directInput,"DirectInput startup")
  input.IN_Activate(r,true);count=count+req(input.IN_ActivateMouse(r) and r.mouse.active,"activation")
  count=count+req(input.IN_MouseMove(r,7,-4,10) and r.events[0].type==3,"buffered movement")
  r.events=[];count=count+req(input.IN_MouseEvent(r,5,11)==2 and r.events[0].value==178 and r.events[1].value==180,"mouse button edges")
  count=count+req(input.IN_MouseEvent(r,4,12)==1 and r.events[2].value2==0,"mouse button release")
  input.IN_ClearStates(r);count=count+req(r.mouse.oldButtonState==0,"clear states")
  count=count+req(input.JoyToI(0)==-32768 and input.JoyToI(65535)==32767 and input.JoyToF(90000)==1.0,"joystick normalization")
  count=count+req(input.IN_StartupJoystick(r,true,true,4,6,true),"joystick discovery")
  r.events=[];axes=[0,65535,32768,32768,33768,31768];count=count+req(input.IN_JoyMove(r,5,axes,9000,20)>=5,"joystick buttons axes pov ball")
  count=count+req(r.events[0].value==185 and r.events[1].value==187,"joystick button ABI")
  r.events=[];count=count+req(input.IN_StartupMIDI(r,true,0,2,1),"MIDI startup")
  count=count+req(not input.MidiInProc(r,144|(60<<8)|(100<<16),30),"MIDI channel filter")
  count=count+req(input.MidiInProc(r,145|(60<<8)|(100<<16),31) and r.events[0].value==217,"MIDI note mapping")
  r.events=[];input.MidiInProc(r,145|(61<<8),32);count=count+req(len(r.events)==2 and not r.events[0].value2 and r.events[1].value2,"MIDI zero velocity quirk")
  input.IN_ShutdownMIDI(r);count=count+req(not r.midi.active,"MIDI shutdown")
  count=count+req(events.quakeKey(1)==178 and events.quakeKey(2)==179 and events.quakeKey(4)==180 and events.quakeKey(5)==181 and events.quakeKey(6)==182,"five mouse keys")
  count=count+req(events.quakeKey(38)==132 and events.quakeKey(40)==133 and events.quakeKey(37)==134 and events.quakeKey(39)==135,"arrow ABI")
  input.IN_Activate(r,false);count=count+req(not r.mouse.active,"focus deactivation")
  input.IN_Shutdown(r);count=count+req(not r.mouse.initialized,"shutdown")
  print "PASS: "+str(count)+" complete win_input contracts";return 0
end function
