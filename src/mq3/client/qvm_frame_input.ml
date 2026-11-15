// SPDX-License-Identifier: GPL-2.0-or-later
// Original client-frame command ordering over the shared input and usercmd qvmFrameRing.
package mq3.client.qvm_frame_input
import mq3.client.input_command as qvmFrameCommands
import mq3.client.input_command_events as qvmFrameEvents
import mq3.client.key_binding_dispatch as qvmFrameBindings
import mq3.client.command_ring as qvmFrameRing
import mq3.vm.syscall_qagame_world as qvmFrameWorld
import mq3.compat.numeric as qvmFrameNumeric
import mq3.qcommon.cvar as qvmFrameCvars

const KEYCATCH_CONSOLE=1
const KEYCATCH_UI=2
const KEYCATCH_CGAME=8
struct State input config oldFrameTime lastCommandTime sequence produced epochs variables end struct
struct Plan realtime rawMsec integrationMsec commandNumber send sequence used end struct
function fail(text) return error(7696,"client frame input: "+text) end function
function create(worldAngles,deltaAngles,realtime,commandTime)
  if len(worldAngles)!=3 or len(deltaAngles)!=3 or realtime<0 or commandTime<0 then return fail("invalid initial view/time") end if
  localAngles=array(3,0.0)
  // cl.viewangles is the local command basis. PM_UpdateViewAngles adds the
  // server delta later; subtract it once, never again after teleports/spawns.
  for axis=0 to 2 localAngles[axis]=qvmFrameNumeric.f32(worldAngles[axis]-qvmFrameNumeric.i16(deltaAngles[axis])*(360.0/65536.0)) end for
  return State(qvmFrameCommands.create(localAngles[0],localAngles[1],localAngles[2]),qvmFrameCommands.defaults(),realtime,commandTime,0,0,0,void)
end function
// Original CL_Init cvars are retained as objects. UI writes become visible
// on the next command without per-frame registry lookups or allocations.
function registerConfig(registry)
  return [qvmFrameCvars.get(registry,"cl_yawspeed","140",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"cl_pitchspeed","140",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"cl_anglespeedkey","1.5",0),qvmFrameCvars.get(registry,"cl_run","1",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"sensitivity","5",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"cl_mouseAccel","0",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"cl_freelook","1",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"m_pitch","-0.022",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"m_yaw","0.022",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"m_forward","0.25",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"m_side","0.25",qvmFrameCvars.ARCHIVE),qvmFrameCvars.get(registry,"m_filter","0",qvmFrameCvars.ARCHIVE)]
end function
function bindConfig(state,registry) state.variables=registerConfig(registry);return syncConfig(state) end function
function handlesAction(state,action) return action=="mlook" or qvmFrameEvents.actionButton(state.input,action)!=void end function
function syncConfig(state)
  values=state.variables;if values==void then return false end if;config=state.config
  config.yawSpeed=values[0].value;config.pitchSpeed=values[1].value;config.angleSpeedKey=values[2].value;config.run=values[3].integer!=0;config.sensitivity=values[4].value;config.mouseAccel=values[5].value;config.freelook=values[6].integer!=0;config.mousePitch=values[7].value;config.mouseYaw=values[8].value;config.mouseForward=values[9].value;config.mouseSide=values[10].value;config.filter=values[11].integer!=0;return true
end function
function prepare(state,realtime,commandNumber,connectionState,serverRunning,serverPaused,clientPaused)
  if realtime<state.oldFrameTime then return fail("frame realtime went backwards") end if
  state.sequence=state.sequence+1
  if serverRunning and serverPaused and clientPaused then return Plan(realtime,0,1,commandNumber,false,state.sequence,false) end if
  advanced=qvmFrameRing.advance(connectionState,realtime,state.oldFrameTime,commandNumber);msec=advanced.frameMsec;safeMsec=msec;if safeMsec<1 then safeMsec=1 end if
  return Plan(realtime,msec,safeMsec,advanced.commandNumber,advanced.created,state.sequence,false)
end function
function keyUp(button,key,time,frameMsec)
  if key==0 then button.down0=0;button.down1=0;button.active=false;return true end if
  if button.down0==key then button.down0=0 else if button.down1==key then button.down1=0 else return false end if
  if button.down0!=0 or button.down1!=0 then return false end if
  button.active=false
  if time!=0 then button.msec=button.msec+time-button.downtime else button.msec=button.msec+(frameMsec>>1) end if
  return true
end function
function applyBound(state,plan,time,type,value,value2,binding,catchers)
  if time<0 then return fail("negative event time") end if
  if type==qvmFrameEvents.INPUT_MOUSE then
    // UI owns its existing frame delta; cgame events are routed by the host.
    // Console capture is inactive in the original windowed Win32 path.
    if (catchers&(KEYCATCH_CONSOLE|KEYCATCH_UI|KEYCATCH_CGAME))!=0 then return [] end if
    accumulated=qvmFrameCommands.accumulateMouse(state.input,value,value2);if accumulated is error then return accumulated end if;return []
  end if
  if type!=qvmFrameEvents.INPUT_KEY then return [] end if
  down=value2!=0;if down and catchers!=0 then return [] end if
  expanded=qvmFrameBindings.commands(binding,value,down,time);if expanded is error then return expanded end if
  for each command in expanded
    if not command.button then continue end if
    if command.action=="mlook" then state.input.mlooking=command.down;continue end if
    target=qvmFrameEvents.actionButton(state.input,command.action);if target==void then continue end if
    if command.down then qvmFrameCommands.keyDown(target,command.key,command.time) else keyUp(target,command.key,command.time,plan.rawMsec) end if
  end for
  return expanded
end function
function releaseAll(state,plan,time)
  for each button in [state.input.left,state.input.right,state.input.forward,state.input.back,state.input.lookup,state.input.lookdown,state.input.moveleft,state.input.moveright,state.input.strafe,state.input.speed,state.input.up,state.input.down]
    if button.down0!=0 then keyUp(button,button.down0,time,plan.rawMsec) end if;if button.down1!=0 then keyUp(button,button.down1,time,plan.rawMsec) end if
  end for
  for each button in state.input.buttons
    if button.down0!=0 then keyUp(button,button.down0,time,plan.rawMsec) end if;if button.down1!=0 then keyUp(button,button.down1,time,plan.rawMsec) end if
  end for
  state.input.mlooking=false;return qvmFrameCommands.clearMouse(state.input)
end function
function commandTime(state,clockServerTime,clockActive)
  if not clockActive then return state.lastCommandTime end if
  if clockServerTime<0 then return fail("negative command server time") end if;return clockServerTime
end function
function finish(state,plan,serverTime,weapon,sensitivity,catchers,anyKeyDown)
  if plan.used or plan.sequence!=state.sequence then return fail("stale or already consumed client frame") end if;plan.used=true
  if not plan.send then return void end if
  if serverTime<0 then return fail("negative command server time") end if
  syncConfig(state)
  created=qvmFrameCommands.createCommand(state.input,state.config,plan.realtime,plan.integrationMsec,serverTime,weapon,sensitivity,catchers,anyKeyDown);if created is error then return created end if
  // CL_AdjustTimeDelta/map_restart may legitimately reset CG command time.
  // Keep older ring entries: original CG prediction skips future-epoch cmds.
  if serverTime<state.lastCommandTime then state.epochs=state.epochs+1 end if
  state.oldFrameTime=plan.realtime;state.lastCommandTime=serverTime;state.produced=state.produced+1
  return qvmFrameWorld.userCommand(serverTime,created.angles,created.buttons,created.weapon,created.forwardmove,created.rightmove,created.upmove)
end function
