// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.qvm_frame_input as frame
import mq3.client.input_command as input
import mq3.client.command_ring as ring
import mq3.client.cgame_clock as clock
import mq3.game.pmove as pmove
import mq3.game.playerstate as playerstate
import mq3.compat.numeric as n
import mq3.qcommon.cvar as frameCvars
import mq3.vm.syscall_qagame_world as qworld
struct ClientFrameAbiVm data mask end struct
function frameCheck(value,label) if not value then return error(7697,label) end if;return 1 end function
function main(args)
  checked=0;state=frame.create([0.0,90.0,0.0],[0,16384,0],1000,1000);number=0;previous=0;commands=ring.create();plan=void;value=void
  checked=checked+frameCheck(state.input.viewangles==[0.0,0.0,0.0],"initial server delta subtracted exactly once")
  for index=1 to 12
    now=1000+index*4;plan=frame.prepare(state,now,number,7,true,false,false)
    frame.applyBound(state,plan,now,3,1,0,"",0);value=frame.finish(state,plan,1000+(index-1)*4,2,1.0,0,false)
    checked=checked+frameCheck(n.i16(value.angles[1])<previous and plan.commandNumber==number+1 and plan.rawMsec==4,"fresh4ms mouse command before50ms tick")
    number=number+1;ring.store(commands,number,value);previous=n.i16(value.angles[1])
  end for
  checked=checked+frameCheck(state.produced==12 and n.i16(ring.get(commands,number,number).angles[1])==previous,"one stored command per client frame")
  checked=checked+frameCheck(try(frame.finish(state,plan,1044,2,1.0,0,false)) is error,"duplicate frame cannot emit second command")
  plan=frame.prepare(state,1048,number,7,true,false,false);frame.applyBound(state,plan,1048,3,1,0,"",0);value=frame.finish(state,plan,1044,2,1.0,0,false)
  checked=checked+frameCheck(plan.rawMsec==0 and plan.integrationMsec==1 and value.serverTime==1044 and n.i16(value.angles[1])<previous,"same-ms frame consumes mouse without inventing command time")
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1004,0,7,true,false,false)
  frame.applyBound(state,plan,1001,1,178,1,"+attack",0);frame.applyBound(state,plan,1003,1,178,0,"+attack",0)
  value=frame.finish(state,plan,1000,2,1.0,0,false);checked=checked+frameCheck((value.buttons&1)!=0 and not state.input.buttons[0].active,"short attack tap retained before server tick")
  plan=frame.prepare(state,1008,1,7,true,false,false);value=frame.finish(state,plan,1004,2,1.0,0,false);checked=checked+frameCheck((value.buttons&1)==0,"tap consumed exactly once")
  plan=frame.prepare(state,1012,2,7,true,false,false);frame.applyBound(state,plan,1009,1,119,1,"+forward",0);frame.applyBound(state,plan,1011,1,119,0,"+forward",0)
  value=frame.finish(state,plan,1008,2,1.0,0,false);checked=checked+frameCheck(value.forwardmove==63,"timestamped2ms movement tap receives half4ms frame")
  for each catcher in [1,2,4,8]
    state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1004,0,7,true,false,false)
    frame.applyBound(state,plan,1001,1,91,1,"+button14",0);frame.applyBound(state,plan,1003,1,91,0,"+button14",catcher)
    checked=checked+frameCheck(not state.input.buttons[14].active,"custom binding keyup survives catcher")
    frame.applyBound(state,plan,1004,1,119,1,"+forward",catcher);checked=checked+frameCheck(not state.input.forward.active,"catcher blocks new gameplay keydown")
  end for
  for each catcher in [1,2,8]
    state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1004,0,7,true,false,false);frame.applyBound(state,plan,1004,3,20,10,"",catcher)
    value=frame.finish(state,plan,1000,2,1.0,catcher,false);checked=checked+frameCheck(value.angles==[0,0,0],"UI/cgame/console mouse never leaks into game")
  end for
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1005,0,7,true,false,false)
  frame.applyBound(state,plan,1001,1,119,1,"+forward",0);frame.applyBound(state,plan,0,1,119,0,"+forward",0)
  checked=checked+frameCheck(state.input.forward.msec==2,"zero-time keyup uses original integer half of5ms frame")
  value=frame.finish(state,plan,1000,2,1.0,0,false);checked=checked+frameCheck(value.forwardmove==50,"odd frame sentinel duration follows C integer division")
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1000,0,7,true,false,false)
  frame.applyBound(state,plan,0,1,119,1,"+forward",0);frame.applyBound(state,plan,0,1,119,0,"+forward",0)
  checked=checked+frameCheck(state.input.forward.msec==0.0,"zero-time release in same-ms frame does not invent held duration")
  plan=frame.prepare(state,1004,0,7,true,false,false);frame.applyBound(state,plan,1001,1,91,1,"+button14",0);frame.applyBound(state,plan,1001,1,92,1,"+lookup",0);frame.applyBound(state,plan,1001,3,5,8,"",0)
  frame.releaseAll(state,plan,0);checked=checked+frameCheck(not state.input.buttons[14].active and not state.input.lookup.active and state.input.mouseDx==[0,0] and state.input.mouseDy==[0,0],"clear releases all actual bindings and mouse, not a six-key list")
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,2000,0,7,true,false,false)
  checked=checked+frameCheck(plan.rawMsec==200 and plan.integrationMsec==200,"hitch clamps200ms via original command ring policy")
  value=frame.finish(state,plan,1000,2,1.0,0,false);checked=checked+frameCheck(value.serverTime==1000,"frame clamp does not advance frozen game time")
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1004,0,7,true,true,true)
  value=frame.finish(state,plan,1000,2,1.0,0,false);checked=checked+frameCheck(value==void and state.produced==0 and state.oldFrameTime==1000,"only fully paused local session suppresses command creation")
  plan=frame.prepare(state,1008,0,7,false,true,true);value=frame.finish(state,plan,1000,2,1.0,0,false);checked=checked+frameCheck(value!=void,"remote paused flags do not suppress commands")
  checked=checked+frameCheck(try(frame.prepare(state,1007,1,7,true,false,false)) is error,"backwards realtime rejected")
  plan=frame.prepare(state,1012,1,7,true,false,false);value=frame.finish(state,plan,999,2,1.0,0,false);checked=checked+frameCheck(value.serverTime==999 and state.epochs==1,"CG clock reset starts a new command epoch")
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1004,0,6,true,false,false);checked=checked+frameCheck(frame.finish(state,plan,1000,2,1.0,0,false)==void,"pre-primed connection does not generate")
  state=frame.create([15.0,90.0,0.0],[2730,16384,0],1000,1000);plan=frame.prepare(state,1004,0,7,true,false,false);value=frame.finish(state,plan,1000,2,1.0,0,false);before=value.angles
  plan=frame.prepare(state,1008,1,7,true,false,false);value=frame.finish(state,plan,1004,2,1.0,0,false);checked=checked+frameCheck(value.angles==before,"local angle basis stays stable")
  ps=playerstate.create();ps.stats[0]=100;ps.delta_angles=[0,16384,0];value.angles=[0,0,0];pmove.updateViewAngles(ps,value);checked=checked+frameCheck(ps.viewangles[1]==90.0,"server yaw delta applied by original movement")
  ps.delta_angles[1]=32768;pmove.updateViewAngles(ps,value);checked=checked+frameCheck(ps.viewangles[1]==-180.0 and value.angles[1]==0,"teleport rotates world view while local command remains unchanged")
  bad=qworld.userCommand(1004,[0,-32768,0],0,2,0,0,0);pmove.updateViewAngles(ps,bad);checked=checked+frameCheck(ps.viewangles[1]==0.0,"negative control: subtracting current teleport delta cancels server rotation")
  cg=clock.create(1000,1,1000);clock.frame(cg,1000);clock.frame(cg,1600);state=frame.create([0.0,0.0,0.0],[0,0,0],1600,1600)
  clock.publishSnapshot(cg,2,1050,0);draw=clock.frame(cg,1610);plan=frame.prepare(state,1610,1,7,true,false,false);value=frame.finish(state,plan,frame.commandTime(state,cg.state.serverTime,true),2,1.0,0,false)
  checked=checked+frameCheck(draw.serverTime==1050 and value.serverTime==1050 and state.epochs==1,"legitimate CL_AdjustTimeDelta reset cannot crash frame input")
  checked=checked+frameCheck(frame.commandTime(state,0,true)==0 and frame.commandTime(state,0,false)==1050,"active reset zero distinguished from unprimed zero")
  state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);for index=1 to 40 plan=frame.prepare(state,1000+index*4,index-1,7,true,false,false);value=frame.finish(state,plan,1000+(index-1)*4,2,1.0,0,false);checked=checked+frameCheck(value.angles==[0,0,0] and value.buttons==0,"bounded no-input smoke remains neutral") end for
  checked=checked+frameCheck(input.angleShort(-45.0)==57344,"ANGLE2SHORT preserves unsigned16 int ABI")
  state=frame.create([0.0,-45.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(state,1004,0,7,true,false,false);value=frame.finish(state,plan,1000,2,1.0,0,false)
  checked=checked+frameCheck(value.angles[1]==57344,"negative yaw packs0x0000e000 in usercmd_t int")
  abiVm=ClientFrameAbiVm(bytes(128,0),127);qworld.writeUsercmd(abiVm,32,value);checked=checked+frameCheck(n.readI32(abiVm.data,40)==57344 and abiVm.data[42]==0 and abiVm.data[43]==0,"negative yaw has unsigned16 value in full32-bit usercmd VM bytes")
  registry=frameCvars.create();state=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);frame.bindConfig(state,registry)
  checked=checked+frameCheck(len(state.variables)==12 and state.config.sensitivity==5.0 and state.config.run,"original input cvar defaults bound once")
  frameCvars.set2(registry,"sensitivity","10",true);frameCvars.set2(registry,"m_pitch","-0.022",true);plan=frame.prepare(state,1004,0,7,true,false,false);frame.applyBound(state,plan,1004,3,1,1,"",0);value=frame.finish(state,plan,1000,2,1.0,0,false)
  checked=checked+frameCheck(state.input.viewangles[0]< -0.219 and state.input.viewangles[1]< -0.219,"menu sensitivity and inverted pitch affect next command")
  frameCvars.set2(registry,"cl_run","0",true);frameCvars.set2(registry,"m_filter","1",true);frameCvars.set2(registry,"cl_freelook","0",true);frameCvars.set2(registry,"cl_mouseAccel","2",true);frameCvars.set2(registry,"m_yaw","0.04",true);frameCvars.set2(registry,"m_forward","0.5",true);frameCvars.set2(registry,"m_side","0.75",true);frameCvars.set2(registry,"cl_yawspeed","150",true);frameCvars.set2(registry,"cl_pitchspeed","160",true);frameCvars.set2(registry,"cl_anglespeedkey","2",true);frame.syncConfig(state)
  checked=checked+frameCheck(not state.config.run and state.config.filter and not state.config.freelook and state.config.mouseAccel==2.0,"menu walk/filter/freelook/accel are live")
  checked=checked+frameCheck(state.config.yawSpeed==150.0 and state.config.pitchSpeed==160.0 and state.config.angleSpeedKey==2.0 and state.config.mouseForward==0.5 and state.config.mouseSide==0.75,"remaining original input cvars are live")
  oldVariables=state.variables;frame.syncConfig(state);checked=checked+frameCheck(state.variables==oldVariables and len(state.variables)==12,"config sync retains bounded cvar references")
  print "PASS: "+str(checked)+" client-frame input contracts";return 0
end function
