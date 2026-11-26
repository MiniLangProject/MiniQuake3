// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic MiniLang model of code/win32/win_input.c.
package mq3.platform.win_input_runtime
import mq3.compat.numeric as numeric

/// System-event type carrying a key code and its press or release state.
const SE_KEY=1
/// System-event type carrying relative horizontal and vertical mouse movement.
const SE_MOUSE=3
/// Engine input key code for the left arrow.
const K_LEFTARROW=134
/// Engine input key code for the right arrow.
const K_RIGHTARROW=135
/// Engine input key code for the up arrow.
const K_UPARROW=132
/// Engine input key code for the down arrow.
const K_DOWNARROW=133
/// Engine input key code for mouse button 1.
const K_MOUSE1=178
/// Engine input key code for joystick button 1.
const K_JOY1=185
/// Engine input key code for joystick button 16.
const K_JOY16=200
/// Engine input key code for auxiliary input button 1.
const K_AUX1=217

/// Data record for `mq3.platform.win_input_runtime.InputEvent`; groups `time`, `type`, `value`, `value2`.
struct InputEvent
  /// Millisecond timestamp attached to translated mouse, joystick, or MIDI input.
  time
  /// System-event category selecting how the accompanying values are interpreted.
  type
  /// Primary event value: a key or character code, horizontal motion, or joystick-axis selector.
  value
  /// Secondary event value: key press state, vertical motion, or joystick-axis magnitude.
  value2
end struct
/// Data record for `mq3.platform.win_input_runtime.Mouse`; groups `initialized`, `active`, `directInput`, `startupDelayed`, `oldButtonState`, `dx`, and 1 further field.
struct Mouse
  /// Whether initialization completed successfully.
  initialized
  /// Whether this object is currently active and accepts processing.
  active
  /// Whether mouse input uses the DirectInput path.
  directInput
  /// Whether mouse startup is postponed until the window can acquire input.
  startupDelayed
  /// Mouse-button bit mask retained from the preceding input sample.
  oldButtonState
  /// Relative horizontal mouse movement accumulated for the current sample.
  dx
  /// Relative vertical mouse movement accumulated for the current sample.
  dy
end struct
/// Data record for `mq3.platform.win_input_runtime.Joystick`; groups `enabled`, `available`, `buttonCount`, `axisCount`, `hasPov`, `oldButtons`, and 3 further fields.
struct Joystick
  /// Whether this feature is enabled by the current configuration.
  enabled
  /// Whether the requested input device is present and usable.
  available
  /// Number of buttons reported by the input device.
  buttonCount
  /// Number of axes reported by the joystick.
  axisCount
  /// Whether the joystick provides a point-of-view hat control.
  hasPov
  /// Joystick button mask retained from the preceding sample.
  oldButtons
  /// Joystick or hat directions retained from the preceding sample.
  oldDirections
  /// Dead-zone threshold used when translating joystick axes into directions.
  threshold
  /// Scale applied to joystick trackball movement.
  ballScale
end struct
/// Data record for `mq3.platform.win_input_runtime.Midi`; groups `enabled`, `active`, `device`, `channel`, `deviceCount`.
struct Midi
  /// Whether this feature is enabled by the current configuration.
  enabled
  /// Whether this object is currently active and accepts processing.
  active
  /// Selected MIDI or native input-device identifier.
  device
  /// Selected sound or MIDI channel associated with the operation.
  channel
  /// Number of available MIDI devices.
  deviceCount
end struct
/// Data record for `mq3.platform.win_input_runtime.Runtime`; groups `appActive`, `mouse`, `joystick`, `midi`, `events`.
struct Runtime
  /// Whether the application has focus and may acquire input devices.
  appActive
  /// Mouse device state and pending relative input.
  mouse
  /// Joystick device state and previous input samples.
  joystick
  /// MIDI device selection and input state.
  midi
  /// Pending input or system events awaiting delivery.
  events
end struct

/// Constructs `mq3.platform.win_input_runtime.Runtime` with `appActive` = `false`, `mouse` = `Mouse(false,false,false,false,0,0,0)`, `joystick` = `Joystick(false,false,0,0,false,0,0,0.15,0.02)`, `midi` = `Midi(false,false,0,1,0)` and the supplied remaining values.
function create()
  return Runtime(false,Mouse(false,false,false,false,0,0,0),Joystick(false,false,0,0,false,0,0,0.15,0.02),Midi(false,false,0,1,0),[])
end function
/// Updates `runtime.events` in `mq3.platform.win_input_runtime.queue`.
/// @param runtime Mutable record or buffer; this call updates `runtime.events`.
/// @param time Value used for `mq3.platform.win_input_runtime.InputEvent.time`.
/// @param type Value used for `mq3.platform.win_input_runtime.InputEvent.type`.
/// @param value Value used for `mq3.platform.win_input_runtime.InputEvent.value`.
/// @param value2 Value used for `mq3.platform.win_input_runtime.InputEvent.value2`.
function queue(runtime,time,type,value,value2) runtime.events=runtime.events+[InputEvent(time,type,value,value2)];return void end function
/// Updates `runtime.mouse.directInput`, `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_InitWin32Mouse`; returns `true`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.directInput`, `runtime.mouse.initialized`.
function IN_InitWin32Mouse(runtime) runtime.mouse.directInput=false;runtime.mouse.initialized=true;return true end function
/// Updates `runtime.mouse.active`, `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_ShutdownWin32Mouse`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.active`, `runtime.mouse.initialized`.
function IN_ShutdownWin32Mouse(runtime) runtime.mouse.active=false;runtime.mouse.initialized=false;return void end function
/// Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_ActivateWin32Mouse`; returns `runtime.mouse.active`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.active`.
function IN_ActivateWin32Mouse(runtime) if runtime.appActive and runtime.mouse.initialized then runtime.mouse.active=true end if;return runtime.mouse.active end function
/// Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_DeactivateWin32Mouse`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.active`.
function IN_DeactivateWin32Mouse(runtime) runtime.mouse.active=false;return void end function
/// Updates `runtime.mouse.directInput`, `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_InitDIMouse`; returns `available`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.directInput`, `runtime.mouse.initialized`.
/// @param available Value assigned to `runtime.mouse.directInput`, `runtime.mouse.initialized`.
function IN_InitDIMouse(runtime,available) runtime.mouse.directInput=available;runtime.mouse.initialized=available;return available end function
/// Updates `runtime.mouse.directInput` in `mq3.platform.win_input_runtime.IN_ShutdownDIMouse`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.directInput`.
function IN_ShutdownDIMouse(runtime) runtime.mouse.directInput=false;return void end function
/// Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_ActivateDIMouse`; returns `runtime.mouse.active`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.active`.
function IN_ActivateDIMouse(runtime) if runtime.appActive and runtime.mouse.initialized and runtime.mouse.directInput then runtime.mouse.active=true end if;return runtime.mouse.active end function
/// Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_DeactivateDIMouse`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.active`.
function IN_DeactivateDIMouse(runtime) runtime.mouse.active=false;return void end function
/// Returns `IN_ActivateWin32Mouse(runtime)` from `mq3.platform.win_input_runtime.IN_ActivateMouse`; earlier branches return `IN_ActivateDIMouse(runtime)`.
/// @param runtime Record providing `runtime.mouse`.
function IN_ActivateMouse(runtime) if runtime.mouse.directInput then return IN_ActivateDIMouse(runtime) end if;return IN_ActivateWin32Mouse(runtime) end function
/// Returns `void` from `mq3.platform.win_input_runtime.IN_DeactivateMouse`.
/// @param runtime Record providing `runtime.mouse`.
function IN_DeactivateMouse(runtime) if runtime.mouse.directInput then IN_DeactivateDIMouse(runtime) else IN_DeactivateWin32Mouse(runtime) end if;return void end function
/// Updates `runtime.mouse.initialized`, `runtime.mouse.startupDelayed` in `mq3.platform.win_input_runtime.IN_StartupMouse`; returns `IN_InitWin32Mouse(runtime)`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.initialized`, `runtime.mouse.startupDelayed`.
/// @param directInputAvailable Input tested by `directInputAvailable`.
/// @param windowAvailable Input tested by `not windowAvailable`.
function IN_StartupMouse(runtime,directInputAvailable,windowAvailable)
  runtime.mouse.initialized=false;runtime.mouse.startupDelayed=false
  if not windowAvailable then runtime.mouse.startupDelayed=true;return false end if
  if directInputAvailable then return IN_InitDIMouse(runtime,true) end if
  return IN_InitWin32Mouse(runtime)
end function
/// Updates `runtime.mouse.oldButtonState` in `mq3.platform.win_input_runtime.IN_MouseEvent`; returns `count`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.oldButtonState`.
/// @param mstate Value assigned to `runtime.mouse.oldButtonState`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`.
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
/// Returns `[dx,dy]` from `mq3.platform.win_input_runtime.IN_DIMouse`; earlier branches return `[0,0]`.
/// @param runtime Record providing `runtime.mouse`.
/// @param dx Input used in the result expression `[dx,dy]`.
/// @param dy Input used in the result expression `[dx,dy]`.
function IN_DIMouse(runtime,dx,dy) if not runtime.mouse.active or not runtime.mouse.directInput then return [0,0] end if;return [dx,dy] end function
/// Returns `[dx,dy]` from `mq3.platform.win_input_runtime.IN_Win32Mouse`; earlier branches return `[0,0]`.
/// @param runtime Record providing `runtime.mouse`.
/// @param dx Input used in the result expression `[dx,dy]`.
/// @param dy Input used in the result expression `[dx,dy]`.
function IN_Win32Mouse(runtime,dx,dy) if not runtime.mouse.active or runtime.mouse.directInput then return [0,0] end if;return [dx,dy] end function
/// Routes movement through the configured mouse path and queues a mouse event only for nonzero motion.
/// @param runtime Record providing `runtime.mouse`.
/// @param dx Value forwarded as `dx` to `mq3.platform.win_input_runtime.IN_Win32Mouse`.
/// @param dy Value forwarded as `dy` to `mq3.platform.win_input_runtime.IN_Win32Mouse`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`.
function IN_MouseMove(runtime,dx,dy,time)
  movement=IN_Win32Mouse(runtime,dx,dy);if runtime.mouse.directInput then movement=IN_DIMouse(runtime,dx,dy) end if
  if movement[0]==0 and movement[1]==0 then return false end if
  queue(runtime,time,SE_MOUSE,movement[0],movement[1]);return true
end function
/// Returns `result` from `mq3.platform.win_input_runtime.JoyToF`; earlier branches return `0.0-1.0`, `1.0`.
/// @param value Input used by `result=(value-32768)/32768.0`.
function JoyToF(value) result=(value-32768)/32768.0;if result<0.0-1.0 then return 0.0-1.0 end if;if result>1.0 then return 1.0 end if;return result end function
/// Computes `value-32768` for `mq3.platform.win_input_runtime.JoyToI`.
/// @param value Input used in the result expression `value-32768`.
function JoyToI(value) return value-32768 end function
/// Updates `runtime.joystick.enabled`, `runtime.joystick.available`, `runtime.joystick.buttonCount`, `runtime.joystick.axisCount`, `runtime.joystick.hasPov` in `mq3.platform.win_input_runtime.IN_StartupJoystick`; returns `runtime.joystick.available`.
/// @param runtime Mutable record or buffer; this call updates `runtime.joystick.enabled`, `runtime.joystick.available`, `runtime.joystick.buttonCount`, `runtime.joystick.axisCount`, `runtime.joystick.hasPov`.
/// @param enabled Value assigned to `runtime.joystick.enabled`.
/// @param available Input used by `runtime.joystick.available=enabled and available`.
/// @param buttonCount Value assigned to `runtime.joystick.buttonCount`.
/// @param axisCount Value assigned to `runtime.joystick.axisCount`.
/// @param hasPov Value assigned to `runtime.joystick.hasPov`.
function IN_StartupJoystick(runtime,enabled,available,buttonCount,axisCount,hasPov)
  runtime.joystick.enabled=enabled;runtime.joystick.available=enabled and available
  runtime.joystick.buttonCount=buttonCount;runtime.joystick.axisCount=axisCount;runtime.joystick.hasPov=hasPov
  runtime.joystick.oldButtons=0;runtime.joystick.oldDirections=0;return runtime.joystick.available
end function
/// Returns `keys[index]` from `mq3.platform.win_input_runtime.directionKey`.
/// @param index Input used in the result expression `keys[index]`.
function directionKey(index)
  keys=[K_LEFTARROW,K_RIGHTARROW,K_UPARROW,K_DOWNARROW,K_JOY16,K_JOY16+1,K_JOY16+2,K_JOY16+3,K_JOY16+4,K_JOY16+5,K_JOY16+6,K_JOY16+7,K_JOY16+8,K_JOY16+9,K_JOY16+10,K_JOY16+11]
  return keys[index]
end function
/// Builds `joy.oldButtons`, `joy.oldDirections` in `mq3.platform.win_input_runtime.IN_JoyMove`; returns `count`.
/// @param runtime Record providing `runtime.joystick`.
/// @param buttons Value assigned to `joy.oldButtons`.
/// @param axes Indexed input read at `i`, `4`, `5`.
/// @param pov Input tested by `joy.hasPov`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`.
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
/// Returns `true` from `mq3.platform.win_input_runtime.MIDI_NoteOff`; earlier branches return `false`.
/// @param runtime Value forwarded as `runtime` to `mq3.platform.win_input_runtime.queue`.
/// @param note Input used by `key=note-60+K_AUX1`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`.
function MIDI_NoteOff(runtime,note,time) key=note-60+K_AUX1;if key< K_AUX1 or key>255 then return false end if;queue(runtime,time,SE_KEY,key,0);return true end function
/// Returns `true` from `mq3.platform.win_input_runtime.MIDI_NoteOn`; earlier branches return `false`.
/// @param runtime Value forwarded as `runtime` to `mq3.platform.win_input_runtime.MIDI_NoteOff`.
/// @param note Value forwarded as `note` to `mq3.platform.win_input_runtime.MIDI_NoteOff`.
/// @param velocity Input tested by `velocity==0`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.MIDI_NoteOff`.
function MIDI_NoteOn(runtime,note,velocity,time)
  if velocity==0 then MIDI_NoteOff(runtime,note,time) end if
  key=note-60+K_AUX1;if key<K_AUX1 or key>255 then return false end if;queue(runtime,time,SE_KEY,key,1);return true
end function
/// Filters a packed MIDI message by configured channel and dispatches note-on or note-off events.
/// @param runtime Record providing `runtime.midi`.
/// @param message Input used by `status=message&255`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.MIDI_NoteOn`.
function MidiInProc(runtime,message,time)
  status=message&255;if (status&15)+1!=runtime.midi.channel then return false end if;note=(message>>8)&255;velocity=(message>>16)&255
  if (status&240)==144 then return MIDI_NoteOn(runtime,note,velocity,time) end if
  if (status&240)==128 then return MIDI_NoteOff(runtime,note,time) end if;return false
end function
/// Returns `[runtime.midi.enabled,runtime.midi.device,runtime.midi.channel,runtime.midi.deviceCount,runtime.midi.active]` for `mq3.platform.win_input_runtime.MidiInfo_f`.
/// @param runtime Record providing `runtime.midi`.
function MidiInfo_f(runtime) return [runtime.midi.enabled,runtime.midi.device,runtime.midi.channel,runtime.midi.deviceCount,runtime.midi.active] end function
/// Updates `runtime.midi.enabled`, `runtime.midi.device`, `runtime.midi.channel`, `runtime.midi.deviceCount`, `runtime.midi.active` in `mq3.platform.win_input_runtime.IN_StartupMIDI`; returns `runtime.midi.active`.
/// @param runtime Mutable record or buffer; this call updates `runtime.midi.enabled`, `runtime.midi.device`, `runtime.midi.channel`, `runtime.midi.deviceCount`, `runtime.midi.active`.
/// @param enabled Value assigned to `runtime.midi.enabled`.
/// @param device Value assigned to `runtime.midi.device`.
/// @param channel Value assigned to `runtime.midi.channel`.
/// @param deviceCount Value assigned to `runtime.midi.deviceCount`.
function IN_StartupMIDI(runtime,enabled,device,channel,deviceCount)
  runtime.midi.enabled=enabled;runtime.midi.device=device;runtime.midi.channel=channel;runtime.midi.deviceCount=deviceCount
  runtime.midi.active=enabled and device>=0 and device<deviceCount and channel>=1 and channel<=16;return runtime.midi.active
end function
/// Updates `runtime.midi.active` in `mq3.platform.win_input_runtime.IN_ShutdownMIDI`.
/// @param runtime Mutable record or buffer; this call updates `runtime.midi.active`.
function IN_ShutdownMIDI(runtime) runtime.midi.active=false;return void end function
/// Returns `runtime` from `mq3.platform.win_input_runtime.IN_Startup`.
/// @param runtime Value forwarded as `runtime` to `mq3.platform.win_input_runtime.IN_StartupMouse`.
/// @param directInputAvailable Value forwarded as `directInputAvailable` to `mq3.platform.win_input_runtime.IN_StartupMouse`.
/// @param windowAvailable Value forwarded as `windowAvailable` to `mq3.platform.win_input_runtime.IN_StartupMouse`.
function IN_Startup(runtime,directInputAvailable,windowAvailable) IN_StartupMouse(runtime,directInputAvailable,windowAvailable);return runtime end function
/// Returns `runtime` from `mq3.platform.win_input_runtime.IN_Init`.
/// @param runtime Value forwarded as `runtime` to `mq3.platform.win_input_runtime.IN_Startup`.
/// @param directInputAvailable Value forwarded as `directInputAvailable` to `mq3.platform.win_input_runtime.IN_Startup`.
/// @param windowAvailable Value forwarded as `windowAvailable` to `mq3.platform.win_input_runtime.IN_Startup`.
function IN_Init(runtime,directInputAvailable,windowAvailable) IN_Startup(runtime,directInputAvailable,windowAvailable);return runtime end function
/// Updates `runtime.appActive` in `mq3.platform.win_input_runtime.IN_Activate`.
/// @param runtime Mutable record or buffer; this call updates `runtime.appActive`.
/// @param active Value assigned to `runtime.appActive`.
function IN_Activate(runtime,active) runtime.appActive=active;if not active then IN_DeactivateMouse(runtime) end if;return void end function
/// Returns `IN_MouseMove(runtime,dx,dy,time)` from `mq3.platform.win_input_runtime.IN_Frame`; earlier branches return `false`.
/// @param runtime Record providing `runtime.mouse`, `runtime.appActive`.
/// @param dx Value forwarded as `dx` to `mq3.platform.win_input_runtime.IN_MouseMove`.
/// @param dy Value forwarded as `dy` to `mq3.platform.win_input_runtime.IN_MouseMove`.
/// @param time Value forwarded as `time` to `mq3.platform.win_input_runtime.IN_MouseMove`.
function IN_Frame(runtime,dx,dy,time)
  if not runtime.mouse.initialized or not runtime.appActive then IN_DeactivateMouse(runtime);return false end if
  IN_ActivateMouse(runtime);return IN_MouseMove(runtime,dx,dy,time)
end function
/// Updates `runtime.mouse.oldButtonState` in `mq3.platform.win_input_runtime.IN_ClearStates`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.oldButtonState`.
function IN_ClearStates(runtime) runtime.mouse.oldButtonState=0;return void end function
/// Updates `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_Shutdown`.
/// @param runtime Mutable record or buffer; this call updates `runtime.mouse.initialized`.
function IN_Shutdown(runtime) IN_DeactivateMouse(runtime);IN_ShutdownDIMouse(runtime);IN_ShutdownMIDI(runtime);runtime.mouse.initialized=false;return void end function
