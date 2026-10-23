// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic MiniLang model of code/win32/win_input.c.
package mq3.platform.win_input_runtime
import mq3.compat.numeric as numeric

const SE_KEY=1
const SE_MOUSE=3
const K_LEFTARROW=134
const K_RIGHTARROW=135
const K_UPARROW=132
const K_DOWNARROW=133
const K_MOUSE1=178
const K_JOY1=185
const K_JOY16=200
const K_AUX1=217

struct InputEvent time type value value2 end struct
struct Mouse initialized active directInput startupDelayed oldButtonState dx dy end struct
struct Joystick enabled available buttonCount axisCount hasPov oldButtons oldDirections threshold ballScale end struct
struct Midi enabled active device channel deviceCount end struct
struct Runtime appActive mouse joystick midi events end struct

function create()
  return Runtime(false,Mouse(false,false,false,false,0,0,0),Joystick(false,false,0,0,false,0,0,0.15,0.02),Midi(false,false,0,1,0),[])
end function
function queue(runtime,time,type,value,value2) runtime.events=runtime.events+[InputEvent(time,type,value,value2)];return void end function
function IN_InitWin32Mouse(runtime) runtime.mouse.directInput=false;runtime.mouse.initialized=true;return true end function
function IN_ShutdownWin32Mouse(runtime) runtime.mouse.active=false;runtime.mouse.initialized=false;return void end function
function IN_ActivateWin32Mouse(runtime) if runtime.appActive and runtime.mouse.initialized then runtime.mouse.active=true end if;return runtime.mouse.active end function
function IN_DeactivateWin32Mouse(runtime) runtime.mouse.active=false;return void end function
function IN_InitDIMouse(runtime,available) runtime.mouse.directInput=available;runtime.mouse.initialized=available;return available end function
function IN_ShutdownDIMouse(runtime) runtime.mouse.directInput=false;return void end function
function IN_ActivateDIMouse(runtime) if runtime.appActive and runtime.mouse.initialized and runtime.mouse.directInput then runtime.mouse.active=true end if;return runtime.mouse.active end function
function IN_DeactivateDIMouse(runtime) runtime.mouse.active=false;return void end function
function IN_ActivateMouse(runtime) if runtime.mouse.directInput then return IN_ActivateDIMouse(runtime) end if;return IN_ActivateWin32Mouse(runtime) end function
function IN_DeactivateMouse(runtime) if runtime.mouse.directInput then IN_DeactivateDIMouse(runtime) else IN_DeactivateWin32Mouse(runtime) end if;return void end function
function IN_StartupMouse(runtime,directInputAvailable,windowAvailable)
  runtime.mouse.initialized=false;runtime.mouse.startupDelayed=false
  if not windowAvailable then runtime.mouse.startupDelayed=true;return false end if
  if directInputAvailable then return IN_InitDIMouse(runtime,true) end if
  return IN_InitWin32Mouse(runtime)
end function
function IN_MouseEvent(runtime,mstate,time)
  if not runtime.mouse.initialized then return 0 end if
  count=0
  for i=0 to 2
    mask=1<<i
    if (mstate&mask)!=0 and (runtime.mouse.oldButtonState&mask)==0 then queue(runtime,time,SE_KEY,K_MOUSE1+i,1);count=count+1 end if
    if (mstate&mask)==0 and (runtime.mouse.oldButtonState&mask)!=0 then queue(runtime,time,SE_KEY,K_MOUSE1+i,0);count=count+1 end if
  end for
  runtime.mouse.oldButtonState=mstate;return count
end function
function IN_DIMouse(runtime,dx,dy) if not runtime.mouse.active or not runtime.mouse.directInput then return [0,0] end if;return [dx,dy] end function
function IN_Win32Mouse(runtime,dx,dy) if not runtime.mouse.active or runtime.mouse.directInput then return [0,0] end if;return [dx,dy] end function
function IN_MouseMove(runtime,dx,dy,time)
  movement=IN_Win32Mouse(runtime,dx,dy);if runtime.mouse.directInput then movement=IN_DIMouse(runtime,dx,dy) end if
  if movement[0]==0 and movement[1]==0 then return false end if
  queue(runtime,time,SE_MOUSE,movement[0],movement[1]);return true
end function
function JoyToF(value) result=(value-32768)/32768.0;if result<0.0-1.0 then return 0.0-1.0 end if;if result>1.0 then return 1.0 end if;return result end function
function JoyToI(value) return value-32768 end function
function IN_StartupJoystick(runtime,enabled,available,buttonCount,axisCount,hasPov)
  runtime.joystick.enabled=enabled;runtime.joystick.available=enabled and available
  runtime.joystick.buttonCount=buttonCount;runtime.joystick.axisCount=axisCount;runtime.joystick.hasPov=hasPov
  runtime.joystick.oldButtons=0;runtime.joystick.oldDirections=0;return runtime.joystick.available
end function
function directionKey(index)
  keys=[K_LEFTARROW,K_RIGHTARROW,K_UPARROW,K_DOWNARROW,K_JOY16,K_JOY16+1,K_JOY16+2,K_JOY16+3,K_JOY16+4,K_JOY16+5,K_JOY16+6,K_JOY16+7,K_JOY16+8,K_JOY16+9,K_JOY16+10,K_JOY16+11]
  return keys[index]
end function
function IN_JoyMove(runtime,buttons,axes,pov,time)
  joy=runtime.joystick;if not joy.available then return 0 end if;count=0
  limit=joy.buttonCount;if limit>32 then limit=32 end if
  for i=0 to limit-1 mask=1<<i;if ((buttons^joy.oldButtons)&mask)!=0 then queue(runtime,time,SE_KEY,K_JOY1+i,(buttons&mask)!=0);count=count+1 end if end for
  joy.oldButtons=buttons;directions=0;limit=joy.axisCount;if limit>4 then limit=4 end if
  for i=0 to limit-1 value=JoyToF(axes[i]);if value<0.0-joy.threshold then directions=directions|(1<<(i*2)) else if value>joy.threshold then directions=directions|(1<<(i*2+1)) end if end for
  if joy.hasPov then if pov==0 then directions=directions|(1<<12) end if;if pov==18000 then directions=directions|(1<<13) end if;if pov==9000 then directions=directions|(1<<14) end if;if pov==27000 then directions=directions|(1<<15) end if end if
  for i=0 to 15 mask=1<<i;if ((directions^joy.oldDirections)&mask)!=0 then queue(runtime,time,SE_KEY,directionKey(i),(directions&mask)!=0);count=count+1 end if end for
  joy.oldDirections=directions
  if joy.axisCount>=6 then x=numeric.trunc32(JoyToI(axes[4])*joy.ballScale);y=numeric.trunc32(JoyToI(axes[5])*joy.ballScale);if x!=0 or y!=0 then queue(runtime,time,SE_MOUSE,x,y);count=count+1 end if end if
  return count
end function
function MIDI_NoteOff(runtime,note,time) key=note-60+K_AUX1;if key< K_AUX1 or key>255 then return false end if;queue(runtime,time,SE_KEY,key,0);return true end function
function MIDI_NoteOn(runtime,note,velocity,time)
  if velocity==0 then MIDI_NoteOff(runtime,note,time) end if
  key=note-60+K_AUX1;if key<K_AUX1 or key>255 then return false end if;queue(runtime,time,SE_KEY,key,1);return true
end function
function MidiInProc(runtime,message,time)
  status=message&255;if (status&15)+1!=runtime.midi.channel then return false end if;note=(message>>8)&255;velocity=(message>>16)&255
  if (status&240)==144 then return MIDI_NoteOn(runtime,note,velocity,time) end if
  if (status&240)==128 then return MIDI_NoteOff(runtime,note,time) end if;return false
end function
function MidiInfo_f(runtime) return [runtime.midi.enabled,runtime.midi.device,runtime.midi.channel,runtime.midi.deviceCount,runtime.midi.active] end function
function IN_StartupMIDI(runtime,enabled,device,channel,deviceCount)
  runtime.midi.enabled=enabled;runtime.midi.device=device;runtime.midi.channel=channel;runtime.midi.deviceCount=deviceCount
  runtime.midi.active=enabled and device>=0 and device<deviceCount and channel>=1 and channel<=16;return runtime.midi.active
end function
function IN_ShutdownMIDI(runtime) runtime.midi.active=false;return void end function
function IN_Startup(runtime,directInputAvailable,windowAvailable) IN_StartupMouse(runtime,directInputAvailable,windowAvailable);return runtime end function
function IN_Init(runtime,directInputAvailable,windowAvailable) IN_Startup(runtime,directInputAvailable,windowAvailable);return runtime end function
function IN_Activate(runtime,active) runtime.appActive=active;if not active then IN_DeactivateMouse(runtime) end if;return void end function
function IN_Frame(runtime,dx,dy,time)
  if not runtime.mouse.initialized or not runtime.appActive then IN_DeactivateMouse(runtime);return false end if
  IN_ActivateMouse(runtime);return IN_MouseMove(runtime,dx,dy,time)
end function
function IN_ClearStates(runtime) runtime.mouse.oldButtonState=0;return void end function
function IN_Shutdown(runtime) IN_DeactivateMouse(runtime);IN_ShutdownDIMouse(runtime);IN_ShutdownMIDI(runtime);runtime.mouse.initialized=false;return void end function
