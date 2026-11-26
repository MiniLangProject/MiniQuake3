// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang counterparts of code/cgame/cg_consolecmds.c command bodies.
package mq3.client.cgame_console_commands

import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as cvar
import mq3.compat.numeric as n
import std.string as strings

/// Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game console commands.
/// @param text NUL-terminated C string containing the decimal numeric text.
/// @returns The converted integer; a string with no initial numeric conversion yields zero.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

/// Team-order identifier assigning the player the offense tactical role.
const TEAMTASK_OFFENSE=1
/// Team-order identifier assigning the player the defense tactical role.
const TEAMTASK_DEFENSE=2
/// Team-order identifier assigning the player the patrol tactical role.
const TEAMTASK_PATROL=3
/// Team-order identifier assigning the player the follow tactical role.
const TEAMTASK_FOLLOW=4
/// Team-order identifier assigning the player the retrieve tactical role.
const TEAMTASK_RETRIEVE=5
/// Team-order identifier assigning the player the escort tactical role.
const TEAMTASK_ESCORT=6
/// Team-order identifier assigning the player the camp tactical role.
const TEAMTASK_CAMP=7
/// Native game-type value for capture the flag, used when determining which team and flag commands are
/// available.
const GT_CTF=4
/// Native game-type identifier selecting one-flag capture the flag.
const GT_1FCTF=5

/// Stores client game console commands state, including `scoresRequestTime`, `showScores`, `numScores`, `scoreFadeTime`, `currentOrder`, `orderPending` and additional values.
struct State
  /// Timestamp of the most recent request for updated server scores.
  scoresRequestTime
  /// True while the player explicitly requests the scoreboard overlay.
  showScores
  /// Number of valid scoreboard entries received from the server.
  numScores
  /// Timestamp used to fade the scoreboard after its display request ends.
  scoreFadeTime
  /// Team-order identifier currently selected for issuing to a teammate.
  currentOrder
  /// When constructing this record, `create` supplies `false` for this member. Used by `nextOrder`
  /// during subsequent processing.
  orderPending
  /// When constructing this record, `create` supplies `0` for this member. Used by `nextOrder` during
  /// subsequent processing.
  orderTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `confirmOrder` and
  /// `denyOrder` during subsequent processing.
  acceptLeader
  /// When constructing this record, `create` supplies `0` for this member. Used by `confirmOrder`
  /// during subsequent processing.
  acceptTask
  /// When constructing this record, `create` supplies `0` for this member. Used by `confirmOrder` and
  /// `denyOrder` during subsequent processing.
  acceptOrderTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `nextTeamMember` and
  /// `prevTeamMember` during subsequent processing.
  selectedPlayer
  /// When constructing this record, `create` supplies `0` for this member. Used by `nextTeamMember` and
  /// `prevTeamMember` during subsequent processing.
  teamPlayerCount
  /// True when this client is the designated leader of its team.
  teamLeader
  /// When constructing this record, `create` supplies `true` for this member. Used by `nextOrder`
  /// during subsequent processing.
  selectedIsSelf
  /// Active game-rule identifier used to choose the meaning of team offense commands.
  gametype
  /// When constructing this record, `create` supplies `false` for this member. Used by `nextOrder`
  /// during subsequent processing.
  otherTeamHasFlag
  /// When constructing this record, `create` supplies `false` for this member. Used by `nextOrder`
  /// during subsequent processing.
  yourTeamHasFlag
  /// When constructing this record, `create` supplies `false` for this member. Used by `scrollScores`
  /// during subsequent processing.
  scoreboardShowing
  /// When constructing this record, `create` supplies `"ui/hud.txt"` for this member. Used by `loadHud`
  /// during subsequent processing.
  hudFile
  /// When constructing this record, `create` supplies `100` for this member. Used by `sizeUpState` and
  /// `sizeDownState` during subsequent processing.
  viewsize
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `startOrbitState`
  /// and `syncVmCvars` during subsequent processing.
  cameraOrbit
end struct
/// Stores client game console commands operation result, including `handled`, `cvarSets`, `consoleCommands`, `clientCommands`, `prints`, `sounds` and additional values.
struct Result
  /// When constructing this record, `result` supplies `handled` for this member.
  handled
  /// When constructing this record, `result` supplies an empty list for this member.
  cvarSets
  /// When constructing this record, `result` supplies an empty list for this member.
  consoleCommands
  /// When constructing this record, `result` supplies an empty list for this member.
  clientCommands
  /// When constructing this record, `result` supplies an empty list for this member.
  prints
  /// Registered sound resources associated with the player model or media group.
  sounds
  /// Text of the current centered announcement.
  centerPrint
  /// When constructing this record, `result` supplies an empty list for this member.
  menuActions
end struct

/// Creates a `mq3.client.cgame_console_commands.State` record. Initializes the record with the defaults written in this constructor.
function create()
  return State(0,false,0,0,0,false,0,0,0,0,0,0,false,true,0,false,false,false,"ui/hud.txt",100,0.0)
end function
/// Creates a `mq3.client.cgame_console_commands.Result` record. Assigns `handled` from `handled`.
/// @param handled Value used to initialize `Result.handled`.
function result(handled) return Result(handled,[],[],[],[],[],[],[]) end function
/// Updates `effect.cvarSets` during client game console commands `cvarSet`.
/// @param effect Mutable client game console commands record/storage; this routine assigns `effect.cvarSets`.
/// @param name Name used to select or register the corresponding client game console commands resource.
/// @param value Value used by `effect.cvarSets=effect.cvarSets+[[name,value]]`.
function cvarSet(effect,name,value) effect.cvarSets=effect.cvarSets+[[name,value]];return effect end function
/// Updates `effect.consoleCommands` during client game console commands `console`.
/// @param effect Mutable client game console commands record/storage; this routine assigns `effect.consoleCommands`.
/// @param text Text consumed or emitted by `console` in the client game console commands path.
function console(effect,text) effect.consoleCommands=effect.consoleCommands+[text];return effect end function
/// Updates `effect.clientCommands` during client game console commands `client`.
/// @param effect Mutable client game console commands record/storage; this routine assigns `effect.clientCommands`.
/// @param text Text consumed or emitted by `client` in the client game console commands path.
function client(effect,text) effect.clientCommands=effect.clientCommands+[commands.copyString(text,128)];return effect end function

// CG_TargetCommand_f deliberately preserves the original !targetNum test:
// player zero is ignored while -1 is passed through to the generated command.
/// @param commandState commandState record passed to the client game console commands helper calls.
/// @param targetNum Value used by `if targetNum==0 then return effect end if`.
function targetCommand(commandState,targetNum)
  effect=result(true);if targetNum==0 then return effect end if
  test=commands.argvBuffer(commandState,1,4)
  return console(effect,"gc "+str(targetNum)+" "+str(atoi(test)))
end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeUp`. The final path returns `cvarSet(effect,"cg_viewsize",str(value+10))`.
/// @param registry Value used by `value=cvar.get(registry,"cg_viewsize","100",0).integer`.
function sizeUp(registry)
  effect=result(true);value=cvar.get(registry,"cg_viewsize","100",0).integer
  return cvarSet(effect,"cg_viewsize",str(value+10))
end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeDown`. The final path returns `cvarSet(effect,"cg_viewsize",str(value-10))`.
/// @param registry Value used by `value=cvar.get(registry,"cg_viewsize","100",0).integer`.
function sizeDown(registry)
  effect=result(true);value=cvar.get(registry,"cg_viewsize","100",0).integer
  return cvarSet(effect,"cg_viewsize",str(value-10))
end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeUpState`. The final path returns `cvarSet(effect,"cg_viewsize",str(state.viewsize+10))`.
/// @param state Record read through `state.viewsize`.
function sizeUpState(state) effect=result(true);return cvarSet(effect,"cg_viewsize",str(state.viewsize+10)) end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeDownState`. The final path returns `cvarSet(effect,"cg_viewsize",str(state.viewsize-10))`.
/// @param state Record read through `state.viewsize`.
function sizeDownState(state) effect=result(true);return cvarSet(effect,"cg_viewsize",str(state.viewsize-10)) end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.compat.numeric.trunc32` from client game console commands `viewpos`. The final path returns `effect`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param yaw Value used by `effect.prints=effect.prints+["("+str(n.trunc32(origin[0]))+" "+str(n.trunc32(origin[1]))+" "+str(n.trunc32(origin[2]))+") : "+str(n.trunc32(ya...`.
function viewpos(origin,yaw)
  effect=result(true);effect.prints=effect.prints+["("+str(n.trunc32(origin[0]))+" "+str(n.trunc32(origin[1]))+" "+str(n.trunc32(origin[2]))+") : "+str(n.trunc32(yaw))+"\n"];return effect
end function
/// Updates `state.scoresRequestTime`, `state.showScores`, `state.numScores` during client game console commands `scoresDown`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.scoresRequestTime`, `state.showScores`, `state.numScores`.
/// @param time Value assigned to `state.scoresRequestTime`.
function scoresDown(state,time)
  effect=result(true)
  if state.scoresRequestTime+2000<time then
    state.scoresRequestTime=time;effect.clientCommands=effect.clientCommands+["score"]
    if not state.showScores then state.showScores=true;state.numScores=0 end if
  else state.showScores=true end if
  return effect
end function
/// Updates `state.showScores`, `state.scoreFadeTime` during client game console commands `scoresUp`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.showScores`, `state.scoreFadeTime`.
/// @param time Value assigned to `state.scoreFadeTime`.
function scoresUp(state,time)
  effect=result(true);if state.showScores then state.showScores=false;state.scoreFadeTime=time end if;return effect
end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.client`, `mq3.qcommon.command_buffer.argsBuffer` from client game console commands `tell`. The final path returns `client(effect,prefix+str(clientNum)+" "+commands.argsBuffer(commandState,128))`.
/// @param commandState commandState record passed to the client game console commands helper calls.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param voice Value used by `if voice then prefix="vtell " end if`.
function tell(commandState,clientNum,voice)
  effect=result(true);if clientNum==-1 then return effect end if
  prefix="tell ";if voice then prefix="vtell " end if
  return client(effect,prefix+str(clientNum)+" "+commands.argsBuffer(commandState,128))
end function
/// Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `tellTarget`, returning its result for `commandState, targetNum, false`.
/// @param commandState Argument 1 of `mq3.client.cgame_console_commands.tell`.
/// @param targetNum Argument 2 of `mq3.client.cgame_console_commands.tell`.
function tellTarget(commandState,targetNum) return tell(commandState,targetNum,false) end function
/// Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `tellAttacker`, returning its result for `commandState, attackerNum, false`.
/// @param commandState Argument 1 of `mq3.client.cgame_console_commands.tell`.
/// @param attackerNum Argument 2 of `mq3.client.cgame_console_commands.tell`.
function tellAttacker(commandState,attackerNum) return tell(commandState,attackerNum,false) end function
/// Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `voiceTellTarget`, returning its result for `commandState, targetNum, true`.
/// @param commandState Argument 1 of `mq3.client.cgame_console_commands.tell`.
/// @param targetNum Argument 2 of `mq3.client.cgame_console_commands.tell`.
function voiceTellTarget(commandState,targetNum) return tell(commandState,targetNum,true) end function
/// Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `voiceTellAttacker`, returning its result for `commandState, attackerNum, true`.
/// @param commandState Argument 1 of `mq3.client.cgame_console_commands.tell`.
/// @param attackerNum Argument 2 of `mq3.client.cgame_console_commands.tell`.
function voiceTellAttacker(commandState,attackerNum) return tell(commandState,attackerNum,true) end function

/// Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `startOrbit`. The final path returns `cvarSet(effect,"cg_thirdPersonRange","100")`.
/// @param registry Value used by `developer=cvar.get(registry,"developer","0",0).integer`.
function startOrbit(registry)
  effect=result(true);developer=cvar.get(registry,"developer","0",0).integer
  if developer==0 then return effect end if
  orbit=cvar.get(registry,"cg_cameraOrbit","0",0).value
  if orbit!=0.0 then
    cvarSet(effect,"cg_cameraOrbit","0");return cvarSet(effect,"cg_thirdPerson","0")
  end if
  cvarSet(effect,"cg_cameraOrbit","5");cvarSet(effect,"cg_thirdPerson","1");cvarSet(effect,"cg_thirdPersonAngle","0");return cvarSet(effect,"cg_thirdPersonRange","100")
end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `startOrbitState`. The final path returns `cvarSet(effect,"cg_thirdPersonRange","100")`.
/// @param registry Value used by `developer=cvar.get(registry,"developer","0",0).integer`.
/// @param state Record read through `state.cameraOrbit`.
function startOrbitState(registry,state)
  effect=result(true);developer=cvar.get(registry,"developer","0",0).integer;if developer==0 then return effect end if
  if state.cameraOrbit!=0.0 then cvarSet(effect,"cg_cameraOrbit","0");return cvarSet(effect,"cg_thirdPerson","0") end if
  cvarSet(effect,"cg_cameraOrbit","5");cvarSet(effect,"cg_thirdPerson","1");cvarSet(effect,"cg_thirdPersonAngle","0");return cvarSet(effect,"cg_thirdPersonRange","100")
end function
/// Updates `state.viewsize`, `state.cameraOrbit` during client game console commands `syncVmCvars`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.viewsize`, `state.cameraOrbit`.
/// @param registry Value used by `state.viewsize=cvar.get(registry,"cg_viewsize","100",0).integer`.
function syncVmCvars(state,registry)
  state.viewsize=cvar.get(registry,"cg_viewsize","100",0).integer;state.cameraOrbit=cvar.get(registry,"cg_cameraOrbit","0",0).value;return void
end function

// Team Arena (MISSIONPACK) bodies.  Baseq3 does not register these commands,
// but keeping their state transitions here makes the native port complete and
// lets a future missionpack host enable the same implementation unchanged.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.hudFile`.
/// @param hudFile Value assigned to `state.hudFile`.
function loadHud(state,hudFile)
  effect=result(true);state.hudFile=hudFile;if hudFile=="" then state.hudFile="ui/hud.txt" end if
  effect.menuActions=effect.menuActions+[["load",state.hudFile]];return effect
end function
/// Calls `mq3.client.cgame_console_commands.result` from client game console commands `scrollScores`. The final path returns `effect`.
/// @param state Record read through `state.scoreboardShowing`.
/// @param down Whether this event presses the key/button; false represents its release.
function scrollScores(state,down)
  effect=result(true);if state.scoreboardShowing then direction="up";if down then direction="down" end if;for each feeder in ["scoreboard","redteam","blueteam"] effect.menuActions=effect.menuActions+[["scroll",feeder,direction]] end for end if;return effect
end function
/// Calls `mq3.client.cgame_console_commands.result` from client game console commands `singlePlayerResult`. The final path returns `effect`.
/// @param won Value used by `if won then effect.sounds=effect.sounds+["winner"]`.
function singlePlayerResult(won)
  effect=result(true);for each pair in [["cg_cameraOrbit","2"],["cg_cameraOrbitDelay","35"],["cg_thirdPerson","1"],["cg_thirdPersonAngle","0"],["cg_thirdPersonRange","100"]] effect.cvarSets=effect.cvarSets+[pair] end for
  if won then effect.sounds=effect.sounds+["winner"];effect.centerPrint=effect.centerPrint+[["YOU WIN!",144,0]] else effect.sounds=effect.sounds+["loser"];effect.centerPrint=effect.centerPrint+[["YOU LOSE...",144,0]] end if;return effect
end function
/// Updates `state.selectedPlayer` during client game console commands `nextTeamMember`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.selectedPlayer`.
function nextTeamMember(state)
  effect=result(true);if state.teamPlayerCount>0 then state.selectedPlayer=(state.selectedPlayer+1)%state.teamPlayerCount end if;return effect
end function
/// Updates `state.selectedPlayer` during client game console commands `prevTeamMember`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.selectedPlayer`.
function prevTeamMember(state)
  effect=result(true);if state.teamPlayerCount>0 then state.selectedPlayer=state.selectedPlayer-1;if state.selectedPlayer<0 then state.selectedPlayer=state.teamPlayerCount-1 end if end if;return effect
end function
/// Updates `state.currentOrder`, `state.orderPending`, `state.orderTime` during client game console commands `nextOrder`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.currentOrder`, `state.orderPending`, `state.orderTime`.
/// @param time Value assigned to `state.orderTime`.
function nextOrder(state,time)
  effect=result(true);if not state.teamLeader and not state.selectedIsSelf then return effect end if
  if state.currentOrder<TEAMTASK_CAMP then
    state.currentOrder=state.currentOrder+1
    if state.currentOrder==TEAMTASK_RETRIEVE and not state.otherTeamHasFlag then state.currentOrder=state.currentOrder+1 end if
    if state.currentOrder==TEAMTASK_ESCORT and not state.yourTeamHasFlag then state.currentOrder=state.currentOrder+1 end if
  else state.currentOrder=TEAMTASK_OFFENSE end if
  state.orderPending=true;state.orderTime=time+3000;return effect
end function
/// Updates `state.acceptOrderTime` during client game console commands `confirmOrder`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.acceptOrderTime`.
/// @param time Value used by `if time<state.acceptOrderTime then effect.clientCommands=effect.clientCommands+["teamtask "+str(state.acceptTask)+"\n"]`.
function confirmOrder(state,time)
  effect=result(true);console(effect,"cmd vtell "+str(state.acceptLeader)+" yes\n");console(effect,"+button5; wait; -button5")
  if time<state.acceptOrderTime then effect.clientCommands=effect.clientCommands+["teamtask "+str(state.acceptTask)+"\n"];state.acceptOrderTime=0 end if;return effect
end function
/// Updates `state.acceptOrderTime` during client game console commands `denyOrder`.
/// @param state Mutable client game console commands record/storage; this routine assigns `state.acceptOrderTime`.
/// @param time Value used by `if time<state.acceptOrderTime then state.acceptOrderTime=0 end if`.
function denyOrder(state,time)
  effect=result(true);console(effect,"cmd vtell "+str(state.acceptLeader)+" no\n");console(effect,"+button6; wait; -button6")
  if time<state.acceptOrderTime then state.acceptOrderTime=0 end if;return effect
end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.console` from client game console commands `task`. The final path returns `effect`.
/// @param order Value used by `effect.clientCommands=effect.clientCommands+["teamtask "+str(order)+"\n"]`.
/// @param voice Value used by `console(effect,"cmd vsay_team "+voice+"\n")`.
function task(order,voice)
  effect=result(true);console(effect,"cmd vsay_team "+voice+"\n");effect.clientCommands=effect.clientCommands+["teamtask "+str(order)+"\n"];return effect
end function
/// Calls `mq3.client.cgame_console_commands.task` from client game console commands `taskOffense`. The final path returns `task(TEAMTASK_OFFENSE,"onoffense")`.
/// @param gametype Quake III game-type identifier.
function taskOffense(gametype) if gametype==GT_CTF or gametype==GT_1FCTF then return task(TEAMTASK_OFFENSE,"ongetflag") end if;return task(TEAMTASK_OFFENSE,"onoffense") end function
/// Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskDefense`, returning its result for `TEAMTASK_DEFENSE, "ondefense"`.
function taskDefense() return task(TEAMTASK_DEFENSE,"ondefense") end function
/// Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskPatrol`, returning its result for `TEAMTASK_PATROL, "onpatrol"`.
function taskPatrol() return task(TEAMTASK_PATROL,"onpatrol") end function
/// Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskCamp`, returning its result for `TEAMTASK_CAMP, "oncamp"`.
function taskCamp() return task(TEAMTASK_CAMP,"oncamp") end function
/// Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskFollow`, returning its result for `TEAMTASK_FOLLOW, "onfollow"`.
function taskFollow() return task(TEAMTASK_FOLLOW,"onfollow") end function
/// Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskRetrieve`, returning its result for `TEAMTASK_RETRIEVE, "onreturnflag"`.
function taskRetrieve() return task(TEAMTASK_RETRIEVE,"onreturnflag") end function
/// Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskEscort`, returning its result for `TEAMTASK_ESCORT, "onfollowcarrier"`.
function taskEscort() return task(TEAMTASK_ESCORT,"onfollowcarrier") end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.console` from client game console commands `taskOwnFlag`. The final path returns `console(effect,"cmd vsay_team ihaveflag\n")`.
function taskOwnFlag() effect=result(true);return console(effect,"cmd vsay_team ihaveflag\n") end function
/// Calls `mq3.client.cgame_console_commands.result` from client game console commands `taskSuicide`. The final path returns `effect`.
/// @param targetNum Value used by `if targetNum!=-1 then effect.clientCommands=effect.clientCommands+["tell "+str(targetNum)+" suicide"] end if`.
function taskSuicide(targetNum) effect=result(true);if targetNum!=-1 then effect.clientCommands=effect.clientCommands+["tell "+str(targetNum)+" suicide"] end if;return effect end function
/// Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.console` from client game console commands `taunt`. The final path returns `console(effect,text)`.
/// @param text Text consumed or emitted by `taunt` in the client game console commands path.
function taunt(text) effect=result(true);return console(effect,text) end function
/// Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntKillInsult`, returning its result for `"cmd vsay kill_insult\n"`.
function tauntKillInsult() return taunt("cmd vsay kill_insult\n") end function
/// Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntPraise`, returning its result for `"cmd vsay praise\n"`.
function tauntPraise() return taunt("cmd vsay praise\n") end function
/// Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntTaunt`, returning its result for `"cmd vtaunt\n"`.
function tauntTaunt() return taunt("cmd vtaunt\n") end function
/// Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntDeathInsult`, returning its result for `"cmd vsay death_insult\n"`.
function tauntDeathInsult() return taunt("cmd vsay death_insult\n") end function
/// Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntGauntlet`, returning its result for `"cmd vsay kill_guantlet\n"`.
function tauntGauntlet() return taunt("cmd vsay kill_guantlet\n") end function

/// Calls `std.string.toLowerAscii` from client game console commands `isNativeBaseCommand`.
/// @param name Name used to select or register the corresponding client game console commands resource.
function isNativeBaseCommand(name)
  key=strings.toLowerAscii(name);return key=="tcmd" or key=="sizeup" or key=="sizedown" or key=="tell_target" or key=="tell_attacker" or key=="vtell_target" or key=="vtell_attacker" or key=="startorbit"
end function
/// Calls `std.string.toLowerAscii`, `mq3.qcommon.command_buffer.argv`, `mq3.client.cgame_console_commands.targetCommand` and additional helpers from client game console commands `dispatchBase`. The final path returns `result(false)`.
/// @param registry Value used by `if key=="startorbit" then return startOrbitState(registry,state) end if`.
/// @param commandState commandState record passed to the client game console commands helper calls.
/// @param targetNum Value used by `if key=="tcmd" then return targetCommand(commandState,targetNum) end if`.
/// @param attackerNum Value used by `if key=="tell_attacker" then return tellAttacker(commandState,attackerNum) end if`.
/// @param state Shared client game console commands state passed to the helper calls in `dispatchBase`.
function dispatchBase(registry,commandState,targetNum,attackerNum,state)
  key=strings.toLowerAscii(commands.argv(commandState,0))
  if key=="tcmd" then return targetCommand(commandState,targetNum) end if
  if key=="sizeup" then return sizeUpState(state) end if
  if key=="sizedown" then return sizeDownState(state) end if
  if key=="tell_target" then return tellTarget(commandState,targetNum) end if
  if key=="tell_attacker" then return tellAttacker(commandState,attackerNum) end if
  if key=="vtell_target" then return voiceTellTarget(commandState,targetNum) end if
  if key=="vtell_attacker" then return voiceTellAttacker(commandState,attackerNum) end if
  if key=="startorbit" then return startOrbitState(registry,state) end if
  return result(false)
end function

// Typed host boundary used by the fully native command dispatcher.  The
// retail QVM host sets retailActive so the native mirror can still be checked
// without sending a command, changing a Cvar, or drawing the same UI twice.
struct Action
  /// Host service category recorded with a request emitted while executing local CGame commands,
  /// including score, view, and weapon-selection requests.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while executing local CGame
  /// commands, including score, view, and weapon-selection requests.
  kind
  /// Cvar, console command, client command, or sound resource targeted by the client-game command
  /// effect.
  name
  /// Cvar value, executable command text, or console message produced by a client-game console command.
  text
  /// When constructing this record, `emit` supplies `text2` for this member.
  text2
  /// Numeric argument interpreted by the selected host operation while executing local CGame commands,
  /// including score, view, and weapon-selection requests.
  number
  /// True when this request is marked for native dispatch while executing local CGame commands,
  /// including score, view, and weapon-selection requests; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game console commands runtime wiring and state, including `commandState`, `registry`, `state`, `targetNum`, `attackerNum`, `time` and additional values.
struct Runtime
  /// When constructing this record, `createRuntime` supplies `commands.create()` for this member. Used
  /// by `absorb` and `Cmd_Argv` during subsequent processing.
  commandState
  /// When constructing this record, `createRuntime` supplies `registry` for this member. Used by
  /// `absorb` and `CG_LoadHud_f` during subsequent processing.
  registry
  /// When constructing this record, `createRuntime` supplies `create()` for this member. Used by
  /// `CG_SizeUp_f` and `CG_SizeDown_f` during subsequent processing.
  state
  /// When constructing this record, `createRuntime` supplies `-1` for this member. Used by
  /// `CG_TargetCommand_f` and `CG_TellTarget_f` during subsequent processing.
  targetNum
  /// When constructing this record, `createRuntime` supplies `-1` for this member. Used by
  /// `CG_TellAttacker_f` and `CG_VoiceTellAttacker_f` during subsequent processing.
  attackerNum
  /// Client-game time in milliseconds supplied to scoreboard and team-order console-command handlers.
  time
  /// When constructing this record, `createRuntime` supplies `missionpack` for this member. Used by
  /// `CG_InitConsoleCommands` and `CG_ConsoleCommand` during subsequent processing.
  missionpack
  /// True when the retail QVM owns CGame console-command handling, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
  /// When constructing this record, `createRuntime` supplies an empty list for this member. Used by
  /// `CG_InitConsoleCommands` during subsequent processing.
  registeredCommands
  /// Host requests queued while executing local CGame commands, including score, view, and
  /// weapon-selection requests, retained in request order.
  actions
  /// When constructing this record, `createRuntime` supplies `[0.0,0.0,0.0]` for this member. Used by
  /// `CG_Viewpos_f` during subsequent processing.
  viewOrigin
  /// When constructing this record, `createRuntime` supplies `0.0` for this member. Used by
  /// `CG_Viewpos_f` during subsequent processing.
  viewYaw
  /// Input-capture bitmask selecting which client subsystem currently receives key events.
  keyCatcher
  /// When constructing this record, `createRuntime` supplies `0` for this member. Used by
  /// `CG_TeamMenu_f` and `CG_EditHud_f` during subsequent processing.
  eventHandling
  /// When constructing this record, `createRuntime` supplies `false` for this member. Used by
  /// `CG_Camera_f` during subsequent processing.
  cameraLoadSucceeded
  /// When constructing this record, `createRuntime` supplies `false` for this member. Used by
  /// `CG_Camera_f` during subsequent processing.
  cameraMode
  /// Client timestamp at which the scripted camera sequence began.
  cameraStartTime
end struct

/// Creates a `mq3.client.cgame_console_commands.Runtime` record. Assigns `registry` from `registry`, `missionpack` from `missionpack`, `retailActive` from `retailActive`.
/// @param registry Value used to initialize `Runtime.registry`.
/// @param missionpack Value used to initialize `Runtime.missionpack`.
/// @param retailActive Value used to initialize `Runtime.retailActive`.
function createRuntime(registry,missionpack,retailActive)
  return Runtime(commands.create(),registry,create(),-1,-1,0,missionpack,retailActive,[],[],[0.0,0.0,0.0],0.0,0,0,false,false,0)
end function
/// Appends a client game console commands action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param runtime Mutable client game console commands record/storage; this routine assigns `runtime.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding client game console commands resource.
/// @param text Text consumed or emitted by `emit` in the client game console commands path.
/// @param text2 Value used by `action=Action(boundary,kind,name,text,text2,number,not runtime.retailActive)`.
/// @param number Value used by `action=Action(boundary,kind,name,text,text2,number,not runtime.retailActive)`.
function emit(runtime,boundary,kind,name,text,text2,number)
  action=Action(boundary,kind,name,text,text2,number,not runtime.retailActive);runtime.actions=runtime.actions+[action];return action
end function
/// Calls `mq3.client.cgame_console_commands.emit`, `mq3.qcommon.cvar.set2`, `mq3.qcommon.command_buffer.argv` from client game console commands `absorb`. The final path returns `effect`.
/// @param runtime Record read through `runtime.registry`, `runtime.commandState`.
/// @param effect Record read through `effect.cvarSets`, `effect.consoleCommands`, `effect.clientCommands`, `effect.prints` and additional values.
function absorb(runtime,effect)
  for each pair in effect.cvarSets
    action=emit(runtime,"cvar","set",pair[0],pair[1],"",0);if action.dispatched then cvar.set2(runtime.registry,pair[0],pair[1],true) end if
  end for
  for each text in effect.consoleCommands emit(runtime,"command","execute",commands.argv(runtime.commandState,0),text,"",commands.EXEC_APPEND) end for
  for each text in effect.clientCommands emit(runtime,"client","send-command",commands.argv(runtime.commandState,0),text,"",0) end for
  for each text in effect.prints emit(runtime,"console","print",commands.argv(runtime.commandState,0),text,"",0) end for
  for each name in effect.sounds emit(runtime,"audio","buffered-sound",name,"","",0) end for
  for each row in effect.centerPrint emit(runtime,"draw","center-print","",row[0],"",row[1]) end for
  for each row in effect.menuActions
    text="";text2="";if len(row)>1 then text=row[1] end if;if len(row)>2 then text2=row[2] end if;emit(runtime,"menu",row[0],"scoreboard",text,text2,0)
  end for
  return effect
end function

// Cmd_Argv is mentioned by the original command contract and maps directly
// to the qcommon token state shared by every native command body.
/// @param runtime Record read through `runtime.commandState`.
/// @param index Argument 2 of `mq3.qcommon.command_buffer.argv`.
function Cmd_Argv(runtime,index) return commands.argv(runtime.commandState,index) end function

// CG_TargetCommand_f
/// @param runtime Record read through `runtime.commandState`, `runtime.targetNum`.
function CG_TargetCommand_f(runtime) return absorb(runtime,targetCommand(runtime.commandState,runtime.targetNum)) end function
// CG_SizeUp_f
/// @param runtime Record read through `runtime.state`.
function CG_SizeUp_f(runtime) return absorb(runtime,sizeUpState(runtime.state)) end function
// CG_SizeDown_f
/// @param runtime Record read through `runtime.state`.
function CG_SizeDown_f(runtime) return absorb(runtime,sizeDownState(runtime.state)) end function
// CG_Viewpos_f
/// @param runtime Record read through `runtime.viewOrigin`, `runtime.viewYaw`.
function CG_Viewpos_f(runtime) return absorb(runtime,viewpos(runtime.viewOrigin,runtime.viewYaw)) end function
// CG_ScoresDown_f
/// @param runtime Record read through `runtime.state`, `runtime.time`.
function CG_ScoresDown_f(runtime) return absorb(runtime,scoresDown(runtime.state,runtime.time)) end function
// CG_ScoresUp_f
/// @param runtime Record read through `runtime.state`, `runtime.time`.
function CG_ScoresUp_f(runtime) return absorb(runtime,scoresUp(runtime.state,runtime.time)) end function
// CG_TellTarget_f
/// @param runtime Record read through `runtime.commandState`, `runtime.targetNum`.
function CG_TellTarget_f(runtime) return absorb(runtime,tellTarget(runtime.commandState,runtime.targetNum)) end function
// CG_TellAttacker_f
/// @param runtime Record read through `runtime.commandState`, `runtime.attackerNum`.
function CG_TellAttacker_f(runtime) return absorb(runtime,tellAttacker(runtime.commandState,runtime.attackerNum)) end function
// CG_VoiceTellTarget_f
/// @param runtime Record read through `runtime.commandState`, `runtime.targetNum`.
function CG_VoiceTellTarget_f(runtime) return absorb(runtime,voiceTellTarget(runtime.commandState,runtime.targetNum)) end function
// CG_VoiceTellAttacker_f
/// @param runtime Record read through `runtime.commandState`, `runtime.attackerNum`.
function CG_VoiceTellAttacker_f(runtime) return absorb(runtime,voiceTellAttacker(runtime.commandState,runtime.attackerNum)) end function

// CG_LoadHud_f
/// @param runtime Record read through `runtime.registry`, `runtime.state`.
function CG_LoadHud_f(runtime) hud=cvar.get(runtime.registry,"cg_hudFiles","",0).string;return absorb(runtime,loadHud(runtime.state,hud)) end function
// CG_scrollScoresDown_f
/// @param runtime Record read through `runtime.state`.
function CG_scrollScoresDown_f(runtime) return absorb(runtime,scrollScores(runtime.state,true)) end function
// CG_scrollScoresUp_f
/// @param runtime Record read through `runtime.state`.
function CG_scrollScoresUp_f(runtime) return absorb(runtime,scrollScores(runtime.state,false)) end function
// CG_spWin_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_spWin_f(runtime) return absorb(runtime,singlePlayerResult(true)) end function
// CG_spLose_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_spLose_f(runtime) return absorb(runtime,singlePlayerResult(false)) end function
// CG_NextTeamMember_f
/// @param runtime Record read through `runtime.state`.
function CG_NextTeamMember_f(runtime) return absorb(runtime,nextTeamMember(runtime.state)) end function
// CG_PrevTeamMember_f
/// @param runtime Record read through `runtime.state`.
function CG_PrevTeamMember_f(runtime) return absorb(runtime,prevTeamMember(runtime.state)) end function
// CG_NextOrder_f
/// @param runtime Record read through `runtime.state`, `runtime.time`.
function CG_NextOrder_f(runtime) return absorb(runtime,nextOrder(runtime.state,runtime.time)) end function
// CG_ConfirmOrder_f
/// @param runtime Record read through `runtime.state`, `runtime.time`.
function CG_ConfirmOrder_f(runtime) return absorb(runtime,confirmOrder(runtime.state,runtime.time)) end function
// CG_DenyOrder_f
/// @param runtime Record read through `runtime.state`, `runtime.time`.
function CG_DenyOrder_f(runtime) return absorb(runtime,denyOrder(runtime.state,runtime.time)) end function
// CG_TaskOffense_f
/// @param runtime Record read through `runtime.state.gametype`.
function CG_TaskOffense_f(runtime) return absorb(runtime,taskOffense(runtime.state.gametype)) end function
// CG_TaskDefense_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskDefense_f(runtime) return absorb(runtime,taskDefense()) end function
// CG_TaskPatrol_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskPatrol_f(runtime) return absorb(runtime,taskPatrol()) end function
// CG_TaskCamp_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskCamp_f(runtime) return absorb(runtime,taskCamp()) end function
// CG_TaskFollow_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskFollow_f(runtime) return absorb(runtime,taskFollow()) end function
// CG_TaskRetrieve_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskRetrieve_f(runtime) return absorb(runtime,taskRetrieve()) end function
// CG_TaskEscort_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskEscort_f(runtime) return absorb(runtime,taskEscort()) end function
// CG_TaskOwnFlag_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TaskOwnFlag_f(runtime) return absorb(runtime,taskOwnFlag()) end function
// CG_TaskSuicide_f
/// @param runtime Record read through `runtime.targetNum`.
function CG_TaskSuicide_f(runtime) return absorb(runtime,taskSuicide(runtime.targetNum)) end function
// CG_TauntKillInsult_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TauntKillInsult_f(runtime) return absorb(runtime,tauntKillInsult()) end function
// CG_TauntPraise_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TauntPraise_f(runtime) return absorb(runtime,tauntPraise()) end function
// CG_TauntTaunt_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TauntTaunt_f(runtime) return absorb(runtime,tauntTaunt()) end function
// CG_TauntDeathInsult_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TauntDeathInsult_f(runtime) return absorb(runtime,tauntDeathInsult()) end function
// CG_TauntGauntlet_f
/// @param runtime Argument 1 of `mq3.client.cgame_console_commands.absorb`.
function CG_TauntGauntlet_f(runtime) return absorb(runtime,tauntGauntlet()) end function
// CG_StartOrbit_f
/// @param runtime Record read through `runtime.registry`, `runtime.state`.
function CG_StartOrbit_f(runtime) return absorb(runtime,startOrbitState(runtime.registry,runtime.state)) end function

// The next three bodies are disabled in the shipped source, but preserving
// their documented state transitions covers their Ledger symbols without
// registering dormant console commands.
// CG_TeamMenu_f
/// @param runtime Mutable client game console commands record/storage; this routine assigns `runtime.eventHandling`, `runtime.keyCatcher`.
function CG_TeamMenu_f(runtime)
  if (runtime.keyCatcher&1)!=0 then runtime.eventHandling=0;runtime.keyCatcher=0 else runtime.eventHandling=1 end if;emit(runtime,"input","event-handling","team-menu","",str(runtime.eventHandling),runtime.keyCatcher);return result(true)
end function
// CG_EditHud_f
/// @param runtime Mutable client game console commands record/storage; this routine assigns `runtime.eventHandling`.
function CG_EditHud_f(runtime)
  if runtime.eventHandling==2 then runtime.eventHandling=0 else runtime.eventHandling=2 end if;emit(runtime,"input","event-handling","edit-hud","",str(runtime.eventHandling),runtime.keyCatcher);return result(true)
end function
// CG_Camera_f
/// @param runtime Mutable client game console commands record/storage; this routine assigns `runtime.cameraMode`, `runtime.cameraStartTime`.
function CG_Camera_f(runtime)
  name=commands.argvBuffer(runtime.commandState,1,1024);emit(runtime,"camera","load",name,"","",0)
  if runtime.cameraLoadSucceeded then runtime.cameraMode=true;runtime.cameraStartTime=runtime.time;emit(runtime,"camera","start",name,"","",runtime.time) else emit(runtime,"console","print","camera","Unable to load camera "+name+"\n","",0) end if;return result(true)
end function

/// Lists the 23 client game console commands base commands strings in their declared order, beginning with `"testgun"`, `"testmodel"`, `"nextframe"`.
function baseCommands()
  return ["testgun","testmodel","nextframe","prevframe","nextskin","prevskin","viewpos","+scores","-scores","+zoom","-zoom","sizeup","sizedown","weapnext","weapprev","weapon","tell_target","tell_attacker","vtell_target","vtell_attacker","tcmd","startOrbit","loaddeferred"]
end function
/// Lists the 24 client game console commands missionpack commands strings in their declared order, beginning with `"loadhud"`, `"nextTeamMember"`, `"prevTeamMember"`.
function missionpackCommands()
  return ["loadhud","nextTeamMember","prevTeamMember","nextOrder","confirmOrder","denyOrder","taskOffense","taskDefense","taskPatrol","taskCamp","taskFollow","taskRetrieve","taskEscort","taskSuicide","taskOwnFlag","tauntKillInsult","tauntPraise","tauntTaunt","tauntDeathInsult","tauntGauntlet","spWin","spLose","scoresDown","scoresUp"]
end function
/// Lists the 27 client game console commands server commands strings in their declared order, beginning with `"kill"`, `"say"`, `"say_team"`.
function serverCommands()
  return ["kill","say","say_team","tell","vsay","vsay_team","vtell","vtaunt","vosay","vosay_team","votell","give","god","notarget","noclip","team","follow","levelshot","addbot","setviewpos","callvote","vote","callteamvote","teamvote","stats","teamtask","loaddefered"]
end function

// CG_InitConsoleCommands
/// @param runtime Mutable client game console commands record/storage; this routine assigns `runtime.registeredCommands`.
function CG_InitConsoleCommands(runtime)
  names=baseCommands();if runtime.missionpack then names=names+missionpackCommands() end if;names=names+serverCommands()
  for each name in names commands.addCommand(runtime.commandState,name,void);runtime.registeredCommands=runtime.registeredCommands+[name];emit(runtime,"command","register",name,"","",0) end for;return len(names)
end function

/// Calls `mq3.client.cgame_console_commands.emit`, `mq3.qcommon.command_buffer.args`, `mq3.client.cgame_console_commands.result` from client game console commands `delegated`. The final path returns `result(true)`.
/// @param runtime Record read through `runtime.commandState`.
/// @param name Name used to select or register the corresponding client game console commands resource.
function delegated(runtime,name) emit(runtime,"cgame","delegate",name,commands.args(runtime.commandState),"",0);return result(true) end function
// CG_ConsoleCommand
/// @param runtime Record read through `runtime.missionpack`.
function CG_ConsoleCommand(runtime)
  key=strings.toLowerAscii(Cmd_Argv(runtime,0))
  if key=="viewpos" then CG_Viewpos_f(runtime)
  else if key=="+scores" then CG_ScoresDown_f(runtime)
  else if key=="-scores" then CG_ScoresUp_f(runtime)
  else if key=="sizeup" then CG_SizeUp_f(runtime)
  else if key=="sizedown" then CG_SizeDown_f(runtime)
  else if key=="tell_target" then CG_TellTarget_f(runtime)
  else if key=="tell_attacker" then CG_TellAttacker_f(runtime)
  else if key=="vtell_target" then CG_VoiceTellTarget_f(runtime)
  else if key=="vtell_attacker" then CG_VoiceTellAttacker_f(runtime)
  else if key=="tcmd" then CG_TargetCommand_f(runtime)
  else if key=="startorbit" then CG_StartOrbit_f(runtime)
  else if runtime.missionpack and key=="loadhud" then CG_LoadHud_f(runtime)
  else if runtime.missionpack and key=="nextteammember" then CG_NextTeamMember_f(runtime)
  else if runtime.missionpack and key=="prevteammember" then CG_PrevTeamMember_f(runtime)
  else if runtime.missionpack and key=="nextorder" then CG_NextOrder_f(runtime)
  else if runtime.missionpack and key=="confirmorder" then CG_ConfirmOrder_f(runtime)
  else if runtime.missionpack and key=="denyorder" then CG_DenyOrder_f(runtime)
  else if runtime.missionpack and key=="taskoffense" then CG_TaskOffense_f(runtime)
  else if runtime.missionpack and key=="taskdefense" then CG_TaskDefense_f(runtime)
  else if runtime.missionpack and key=="taskpatrol" then CG_TaskPatrol_f(runtime)
  else if runtime.missionpack and key=="taskcamp" then CG_TaskCamp_f(runtime)
  else if runtime.missionpack and key=="taskfollow" then CG_TaskFollow_f(runtime)
  else if runtime.missionpack and key=="taskretrieve" then CG_TaskRetrieve_f(runtime)
  else if runtime.missionpack and key=="taskescort" then CG_TaskEscort_f(runtime)
  else if runtime.missionpack and key=="tasksuicide" then CG_TaskSuicide_f(runtime)
  else if runtime.missionpack and key=="taskownflag" then CG_TaskOwnFlag_f(runtime)
  else if runtime.missionpack and key=="tauntkillinsult" then CG_TauntKillInsult_f(runtime)
  else if runtime.missionpack and key=="tauntpraise" then CG_TauntPraise_f(runtime)
  else if runtime.missionpack and key=="taunttaunt" then CG_TauntTaunt_f(runtime)
  else if runtime.missionpack and key=="tauntdeathinsult" then CG_TauntDeathInsult_f(runtime)
  else if runtime.missionpack and key=="tauntgauntlet" then CG_TauntGauntlet_f(runtime)
  else if runtime.missionpack and key=="spwin" then CG_spWin_f(runtime)
  else if runtime.missionpack and key=="splose" then CG_spLose_f(runtime)
  else if runtime.missionpack and key=="scoresdown" then CG_scrollScoresDown_f(runtime)
  else if runtime.missionpack and key=="scoresup" then CG_scrollScoresUp_f(runtime)
  else
    for each name in ["testgun","testmodel","nextframe","prevframe","nextskin","prevskin","+zoom","-zoom","weapnext","weapprev","weapon","loaddeferred"] if key==name then delegated(runtime,name);return true end if end for;return false
  end if
  return true
end function
