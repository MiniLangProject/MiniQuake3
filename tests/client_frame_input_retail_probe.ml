// SPDX-License-Identifier: GPL-2.0-or-later
// Productive original-QVM client-frame integration regression.
import mq3.engine.local_qvm_match as match
import mq3.tests.client_frame_routing as frameRoute
import mq3.client.ui_vm as uiVm
import mq3.client.original_ui_session as uiSession
import mq3.platform.playable_window as window
import mq3.client.qvm_frame_input as frame
import mq3.client.cgame_clock as clock
import mq3.client.command_ring as ring
import mq3.client.input_command_events as events
import mq3.server.game_vm as gameVm
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame_world as qworld
import mq3.game.playerstate as playerstate
import mq3.botlib.server_bridge as bots
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commands
import mq3.shared.math as math
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

struct ThinkCounts callback local bot context expectedHost observedHost end struct
struct Host match client clock realTime serverTime clientFrames ticks previousCmd previousDraw view lastCommand counts end struct
struct FollowPs clientNum end struct
struct FollowSnapshot playerState end struct
struct HistoryContext usercmds commandNumber usercmdHistory latestSnapshot end struct
function draftRequire(ok,text) if not ok then return error(7698,"client frame Retail: "+text) end if;return 1 end function
function draftTrap(counts,vm,base)
  if common.argument(vm,base,0)==36 then client=common.argument(vm,base,1);if client==0 then counts.local=counts.local+1;counts.observedHost=match.milliseconds(counts.context);if counts.expectedHost>=0 and counts.observedHost!=counts.expectedHost then return error(7698,"ClientThink saw command time instead of current host milliseconds") end if else counts.bot=counts.bot+1 end if end if
  return counts.callback(vm,base)
end function
function draftView(state)
  result=void;area=0
  for each view in state.context.renderViews nextArea=view.refdef.width*view.refdef.height;if nextArea>area then result=view;area=nextArea end if end for;return result
end function
function draftSnapshot(host)
  snapshot=match.snapshotProductive(host.match,0);if snapshot is error then return snapshot end if
  return clock.publishSnapshot(host.clock,host.match.context.snapshotNumber,snapshot.serverTime,0)
end function
function draftServerTick(host)
  host.serverTime=host.serverTime+50;before=host.match.context.commandNumber;beforeThink=host.counts.local
  advanced=match.runFrame(host.match,host.serverTime);if advanced is error then return advanced end if
  if host.match.context.commandNumber!=before or host.counts.local!=beforeThink then return error(7698,"server tick duplicated local command or Think") end if
  host.ticks=host.ticks+1;return draftSnapshot(host)
end function
function draftClientFrame(host,mouse,tap)
  host.realTime=host.realTime+4
  while host.serverTime+50<=host.realTime value=draftServerTick(host);if value is error then return value end if end while
  state=host.match;before=state.context.commandNumber;beforeThink=host.counts.local
  plan=frame.prepare(host.client,host.realTime,before,7,true,false,false)
  if mouse!=false then dx=1;dy=0;if typeof(mouse)=="array" then dx=mouse[0];dy=mouse[1] end if;frame.applyBound(host.client,plan,host.realTime,3,dx,dy,"",0) end if
  if tap then frame.applyBound(host.client,plan,host.realTime-3,1,178,1,"+attack",0);frame.applyBound(host.client,plan,host.realTime-1,1,178,0,"+attack",0) end if
  cmdTime=frame.commandTime(host.client,host.clock.state.serverTime,host.clock.state.connectionState==8)
  command=frame.finish(host.client,plan,cmdTime,match.cgameUserCmdValue(state),match.cgameSensitivity(state),match.keyCatcher(state),events.anyDown(host.client.input))
  if command is error then return command end if
  host.counts.expectedHost=host.realTime;submitted=match.submitUsercmdAtHostTime(state,0,command,host.realTime);host.counts.expectedHost=-1;if submitted is error then return submitted end if
  if state.context.commandNumber!=before+1 or host.counts.local!=beforeThink+1 then return error(7698,"client frame must publish exactly one command and Think") end if
  if command.serverTime<host.previousCmd then return error(7698,"ordinary command time regressed") end if;host.previousCmd=command.serverTime
  timed=clock.frame(host.clock,host.realTime);if timed is error then return timed end if
  if timed.serverTime<host.previousDraw then return error(7698,"ordinary draw time regressed") end if;host.previousDraw=timed.serverTime
  drawn=match.drawCgameProductive(state,timed.serverTime);if drawn is error then return drawn end if
  host.view=draftView(state);host.lastCommand=command;host.clientFrames=host.clientFrames+1;state.context.soundCommands=[];return true
end function
function draftGamePs(state,client) return playerstate.load(state.game.slot.machine.data,state.context.gameClients+client*state.context.clientStride) end function
function main(args)
  checked=0
  archive=pk3.open(args[0]);if archive is error then return archive end if;map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if;connected=match.connectLocal(state,0);if connected is error then return connected end if
  initial=match.snapshotProductive(state,0);if initial is error then return initial end if
  for index=1 to 2 now=1000+index*50;submitted=match.submitUsercmd(state,0,qworld.userCommand(now,[0,0,0],0,2,0,0,0));if submitted is error then return submitted end if;match.runFrame(state,now);match.snapshotProductive(state,0) end for
  booted=match.bootCgame(state);if booted is error then return booted end if
  counts=ThinkCounts(state.game.slot.machine.syscall,0,0,state.context,-1,0);state.game.slot.machine.syscall=function(vm,base)=>draftTrap(counts,vm,base)
  clockState=clock.create(1100,state.context.snapshotNumber,state.context.latestSnapshot.serverTime)
  client=frame.create(state.context.latestSnapshot.playerState.viewangles,state.context.latestSnapshot.playerState.delta_angles,1100,1100)
  host=Host(state,client,clockState,1100,1100,0,0,0,0,void,void,counts)
  for index=1 to 6 value=draftClientFrame(host,false,false);if value is error then return value end if end for
  beforeAngles=host.lastCommand.angles;beforeView=math.vectoangles(host.view.refdef.viewaxis[0])
  value=draftClientFrame(host,[20,0],false);if value is error then return value end if;afterView=math.vectoangles(host.view.refdef.viewaxis[0])
  checked=checked+draftRequire(host.lastCommand.angles[0]==beforeAngles[0] and host.lastCommand.angles[1]!=beforeAngles[1] and afterView[1]!=beforeView[1],"native horizontal mouse changes actual original Cgame yaw without pitch")
  beforeAngles=host.lastCommand.angles;beforeView=afterView
  value=draftClientFrame(host,[0,20],false);if value is error then return value end if;afterView=math.vectoangles(host.view.refdef.viewaxis[0])
  checked=checked+draftRequire(host.lastCommand.angles[0]!=beforeAngles[0] and host.lastCommand.angles[1]==beforeAngles[1] and afterView[0]!=beforeView[0],"native vertical mouse changes actual original Cgame pitch without yaw")
  firstNumber=state.context.commandNumber;firstSnapshot=state.context.snapshotNumber;firstTicks=host.ticks;firstThinks=counts.local;changed=0;previous=host.view.refdef.viewaxis
  for index=1 to 250
    value=draftClientFrame(host,true,false);if value is error then return value end if
    if host.view.refdef.viewaxis!=previous then changed=changed+1 end if;previous=host.view.refdef.viewaxis
  end for
  checked=checked+draftRequire(changed==250,"real cgame view changes every4ms client frame, including between server ticks")
  checked=checked+draftRequire(state.context.commandNumber-firstNumber==250 and counts.local-firstThinks==250,"250 commands and250 authoritative Thinks")
  checked=checked+draftRequire(state.context.snapshotNumber-firstSnapshot==20 and host.ticks-firstTicks==20,"authoritative snapshots remain20Hz")
  cvar.set2(state.context.cvars,"cg_nopredict","1",true);directChanged=0;previous=host.view.refdef.viewaxis
  for index=1 to 12 value=draftClientFrame(host,true,false);if value is error then return value end if;if host.view.refdef.viewaxis!=previous then directChanged=directChanged+1 end if;previous=host.view.refdef.viewaxis end for
  checked=checked+draftRequire(directChanged==12,"cg_nopredict uses fresh command view every4ms between server ticks");cvar.set2(state.context.cvars,"cg_nopredict","0",true)
  // A tap in a single4ms frame must fire before the next50ms snapshot.
  for index=1 to 20 if host.realTime-host.serverTime<=30 then break end if;value=draftClientFrame(host,false,false);if value is error then return value end if end for
  beforeTicks=host.ticks;ps=draftGamePs(state,0);beforeAmmo=ps.ammo[2]
  value=draftClientFrame(host,false,true);if value is error then return value end if;ps=draftGamePs(state,0)
  checked=checked+draftRequire(host.ticks==beforeTicks and (host.lastCommand.buttons&1)!=0 and ps.ammo[2]==beforeAmmo-1,"subtick attack tap reaches qagame immediately and consumes one bullet")
  value=draftClientFrame(host,false,false);if value is error then return value end if;ps=draftGamePs(state,0)
  checked=checked+draftRequire(host.ticks==beforeTicks and (host.lastCommand.buttons&1)==0 and ps.ammo[2]==beforeAmmo-1,"attack release is neither lost nor repeated")
  // Exercise original TeleportPlayer/SetClientViewAngle through qagame.
  localAngles=[host.lastCommand.angles[0],host.lastCommand.angles[1],host.lastCommand.angles[2]]
  cvar.set2(state.context.cvars,"sv_cheats","1",true);host.serverTime=host.serverTime+50;host.realTime=host.serverTime;match.runFrame(state,host.serverTime);host.ticks=host.ticks+1
  commands.tokenizeString(state.context.commandState,"setviewpos 216 1328 80 180");teleported=gameVm.clientCommand(state.game,0);if teleported is error then return teleported end if;value=draftSnapshot(host);if value is error then return value end if
  teleportTime=host.serverTime;teleportedPs=draftGamePs(state,0);checked=checked+draftRequire(teleportedPs.viewangles[1]==180.0,"original qagame setviewpos applied before waiting for Cgame snapshot time")
  teleportFrames=0
  while host.previousDraw<teleportTime+16 and teleportFrames<64 value=draftClientFrame(host,false,false);if value is error then return value end if;teleportFrames=teleportFrames+1 end while
  checked=checked+draftRequire(host.previousDraw>=teleportTime+16,"bounded Cgame clock reaches the teleported snapshot")
  yaw=math.vectoangles(host.view.refdef.viewaxis[0])[1];delta=yaw-180.0;if delta<0 then delta=0.0-delta end if
  checked=checked+draftRequire(delta<0.02 and host.lastCommand.angles==localAngles,"real cgame accepts teleport delta without canceling it in the next local command")
  // Real original UI move sounds emitted before CG draw must survive it.
  bootedUi=match.bootUi(state);if bootedUi is error then return bootedUi end if;openedUi=match.setUiMenu(state,uiSession.UIMENU_INGAME);if openedUi is error then return openedUi end if
  refreshedUi=match.refreshUi(state,host.realTime);if refreshedUi is error then return refreshedUi end if;state.context.soundCommands=[]
  sentUi=uiVm.keyEvent(state.ui,uiSession.K_DOWNARROW,true);if sentUi is error then return sentUi end if;sentUi=uiVm.keyEvent(state.ui,uiSession.K_DOWNARROW,false);if sentUi is error then return sentUi end if
  uiSoundCount=len(state.context.soundCommands);checked=checked+draftRequire(uiSoundCount>0,"real UI keyboard navigation emits a local sound before Cgame draw");uiSound=state.context.soundCommands[0]
  afterUiDraw=frameRoute.drawFrame(state,host.clock,host.realTime+4);if afterUiDraw is error then return afterUiDraw end if
  checked=checked+draftRequire(len(state.context.soundCommands)>=uiSoundCount and state.context.soundCommands[0]==uiSound,"real original UI sound survives Cgame render reset")
  closedUi=match.setUiMenu(state,uiSession.UIMENU_NONE);if closedUi is error then return closedUi end if
  zoomPlan=frame.prepare(host.client,host.realTime+4,state.context.commandNumber,8,true,false,false);zoomBridge=frameRoute.ClientInputBridge(host.client,zoomPlan,void,state);match.attachInputClear(state,zoomBridge,frameRoute.clearClientInput);match.setKeyBinding(state,122,"+zoom")
  zoomDown=frameRoute.applyInputEvent(zoomBridge,state,window.InputEvent(host.realTime+4,window.INPUT_KEY,122,1));if zoomDown is error then return zoomDown end if;commands.execute(state.context.commandState)
  zoomDraw=match.drawCgameProductive(state,host.previousDraw+300);if zoomDraw is error then return zoomDraw end if;zoomView=draftView(state);checked=checked+draftRequire(zoomView.refdef.fovX<30.0,"delegated +zoom changes original Cgame field of view")
  // CG_DrawActiveFrame publishes the previous frame's zoomSensitivity before
  // CG_CalcViewValues recalculates it. Observe the next real CG frame too.
  zoomDraw=match.drawCgameProductive(state,host.previousDraw+304);if zoomDraw is error then return zoomDraw end if;checked=checked+draftRequire(match.cgameSensitivity(state)<0.5,"original Cgame publishes zoom sensitivity on the next draw")
  clearedZoom=match.uiClearKeysProductive(state.context);if clearedZoom is error then return clearedZoom end if;commands.execute(state.context.commandState)
  zoomDraw=match.drawCgameProductive(state,host.previousDraw+600);if zoomDraw is error then return zoomDraw end if;zoomView=draftView(state);checked=checked+draftRequire(zoomView.refdef.fovX>89.99,"UI forced key clear restores original Cgame field of view without physical key-up")
  zoomDraw=match.drawCgameProductive(state,host.previousDraw+604);if zoomDraw is error then return zoomDraw end if;checked=checked+draftRequire(match.cgameSensitivity(state)>0.99,"UI forced key clear releases original Cgame zoom sensitivity")
  // Bot histories stay separate even if a follow snapshot names that client.
  history=HistoryContext(array(8,void),0,ring.create(),FollowSnapshot(FollowPs(1)));local=qworld.userCommand(50,[0,100,0],0,2,0,0,0);bot=qworld.userCommand(60,[0,20000,0],0,2,0,0,0)
  match.recordLocalUsercmd(history,0,local);match.recordLocalUsercmd(history,1,bot)
  checked=checked+draftRequire(history.commandNumber==1 and ring.get(history.usercmdHistory,1,1).angles[1]==100 and history.usercmds[1].angles[1]==20000,"follow snapshot never redirects local ring to observed bot")
  connected=match.connectLocal(state,1);if connected is error then return connected end if;before=state.context.commandNumber;beforeBot=counts.bot
  savedClient=state.context.latestSnapshot.playerState.clientNum;state.context.latestSnapshot.playerState.clientNum=1
  bot=qworld.userCommand(host.serverTime+1,[0,20000,0],0,2,0,0,0);submitted=match.submitUsercmd(state,1,bot);if submitted is error then return submitted end if;state.context.latestSnapshot.playerState.clientNum=savedClient
  checked=checked+draftRequire(state.context.commandNumber==before and state.context.usercmds[1].angles[1]==20000 and counts.bot==beforeBot+1,"nonlocal submit updates own command and Think without local ring write")
  queued=bots.submitUserCommand(state.context.botServer,1,bot);if queued is error then return queued end if;beforeBot=counts.bot;advanced=match.runFrame(state,host.serverTime+50);if advanced is error then return advanced end if
  checked=checked+draftRequire(state.context.commandNumber==before and counts.bot==beforeBot+1,"pending bot command also avoids local ring contamination")
  print "PASS: "+str(checked)+" Retail client-frame contracts changedViews="+str(changed)+" clientFrames=250 snapshots=20 localThinks=250 noPredictViews="+str(directChanged)+" subtickShot=1 teleportYaw="+str(yaw)+" botRing=separate"
  state.game.slot.machine.syscall=counts.callback;return match.shutdown(state)
end function
