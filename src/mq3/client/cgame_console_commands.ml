// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang counterparts of code/cgame/cg_consolecmds.c command bodies.
package mq3.client.cgame_console_commands

import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as cvar
import mq3.compat.numeric as n
import std.string as strings

extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

const TEAMTASK_OFFENSE=1
const TEAMTASK_DEFENSE=2
const TEAMTASK_PATROL=3
const TEAMTASK_FOLLOW=4
const TEAMTASK_RETRIEVE=5
const TEAMTASK_ESCORT=6
const TEAMTASK_CAMP=7
const GT_CTF=4
const GT_1FCTF=5

struct State scoresRequestTime showScores numScores scoreFadeTime currentOrder orderPending orderTime acceptLeader acceptTask acceptOrderTime selectedPlayer teamPlayerCount teamLeader selectedIsSelf gametype otherTeamHasFlag yourTeamHasFlag scoreboardShowing hudFile viewsize cameraOrbit end struct
struct Result handled cvarSets consoleCommands clientCommands prints sounds centerPrint menuActions end struct

function create()
  return State(0,false,0,0,0,false,0,0,0,0,0,0,false,true,0,false,false,false,"ui/hud.txt",100,0.0)
end function
function result(handled) return Result(handled,[],[],[],[],[],[],[]) end function
function cvarSet(effect,name,value) effect.cvarSets=effect.cvarSets+[[name,value]];return effect end function
function console(effect,text) effect.consoleCommands=effect.consoleCommands+[text];return effect end function
function client(effect,text) effect.clientCommands=effect.clientCommands+[commands.copyString(text,128)];return effect end function

// CG_TargetCommand_f deliberately preserves the original !targetNum test:
// player zero is ignored while -1 is passed through to the generated command.
function targetCommand(commandState,targetNum)
  effect=result(true);if targetNum==0 then return effect end if
  test=commands.argvBuffer(commandState,1,4)
  return console(effect,"gc "+str(targetNum)+" "+str(atoi(test)))
end function
function sizeUp(registry)
  effect=result(true);value=cvar.get(registry,"cg_viewsize","100",0).integer
  return cvarSet(effect,"cg_viewsize",str(value+10))
end function
function sizeDown(registry)
  effect=result(true);value=cvar.get(registry,"cg_viewsize","100",0).integer
  return cvarSet(effect,"cg_viewsize",str(value-10))
end function
function sizeUpState(state) effect=result(true);return cvarSet(effect,"cg_viewsize",str(state.viewsize+10)) end function
function sizeDownState(state) effect=result(true);return cvarSet(effect,"cg_viewsize",str(state.viewsize-10)) end function
function viewpos(origin,yaw)
  effect=result(true);effect.prints=effect.prints+["("+str(n.trunc32(origin[0]))+" "+str(n.trunc32(origin[1]))+" "+str(n.trunc32(origin[2]))+") : "+str(n.trunc32(yaw))+"\n"];return effect
end function
function scoresDown(state,time)
  effect=result(true)
  if state.scoresRequestTime+2000<time then
    state.scoresRequestTime=time;effect.clientCommands=effect.clientCommands+["score"]
    if not state.showScores then state.showScores=true;state.numScores=0 end if
  else state.showScores=true end if
  return effect
end function
function scoresUp(state,time)
  effect=result(true);if state.showScores then state.showScores=false;state.scoreFadeTime=time end if;return effect
end function
function tell(commandState,clientNum,voice)
  effect=result(true);if clientNum==-1 then return effect end if
  prefix="tell ";if voice then prefix="vtell " end if
  return client(effect,prefix+str(clientNum)+" "+commands.argsBuffer(commandState,128))
end function
function tellTarget(commandState,targetNum) return tell(commandState,targetNum,false) end function
function tellAttacker(commandState,attackerNum) return tell(commandState,attackerNum,false) end function
function voiceTellTarget(commandState,targetNum) return tell(commandState,targetNum,true) end function
function voiceTellAttacker(commandState,attackerNum) return tell(commandState,attackerNum,true) end function

function startOrbit(registry)
  effect=result(true);developer=cvar.get(registry,"developer","0",0).integer
  if developer==0 then return effect end if
  orbit=cvar.get(registry,"cg_cameraOrbit","0",0).value
  if orbit!=0.0 then
    cvarSet(effect,"cg_cameraOrbit","0");return cvarSet(effect,"cg_thirdPerson","0")
  end if
  cvarSet(effect,"cg_cameraOrbit","5");cvarSet(effect,"cg_thirdPerson","1");cvarSet(effect,"cg_thirdPersonAngle","0");return cvarSet(effect,"cg_thirdPersonRange","100")
end function
function startOrbitState(registry,state)
  effect=result(true);developer=cvar.get(registry,"developer","0",0).integer;if developer==0 then return effect end if
  if state.cameraOrbit!=0.0 then cvarSet(effect,"cg_cameraOrbit","0");return cvarSet(effect,"cg_thirdPerson","0") end if
  cvarSet(effect,"cg_cameraOrbit","5");cvarSet(effect,"cg_thirdPerson","1");cvarSet(effect,"cg_thirdPersonAngle","0");return cvarSet(effect,"cg_thirdPersonRange","100")
end function
function syncVmCvars(state,registry)
  state.viewsize=cvar.get(registry,"cg_viewsize","100",0).integer;state.cameraOrbit=cvar.get(registry,"cg_cameraOrbit","0",0).value;return void
end function

// Team Arena (MISSIONPACK) bodies.  Baseq3 does not register these commands,
// but keeping their state transitions here makes the native port complete and
// lets a future missionpack host enable the same implementation unchanged.
function loadHud(state,hudFile)
  effect=result(true);state.hudFile=hudFile;if hudFile=="" then state.hudFile="ui/hud.txt" end if
  effect.menuActions=effect.menuActions+[["load",state.hudFile]];return effect
end function
function scrollScores(state,down)
  effect=result(true);if state.scoreboardShowing then direction="up";if down then direction="down" end if;for each feeder in ["scoreboard","redteam","blueteam"] effect.menuActions=effect.menuActions+[["scroll",feeder,direction]] end for end if;return effect
end function
function singlePlayerResult(won)
  effect=result(true);for each pair in [["cg_cameraOrbit","2"],["cg_cameraOrbitDelay","35"],["cg_thirdPerson","1"],["cg_thirdPersonAngle","0"],["cg_thirdPersonRange","100"]] effect.cvarSets=effect.cvarSets+[pair] end for
  if won then effect.sounds=effect.sounds+["winner"];effect.centerPrint=effect.centerPrint+[["YOU WIN!",144,0]] else effect.sounds=effect.sounds+["loser"];effect.centerPrint=effect.centerPrint+[["YOU LOSE...",144,0]] end if;return effect
end function
function nextTeamMember(state)
  effect=result(true);if state.teamPlayerCount>0 then state.selectedPlayer=(state.selectedPlayer+1)%state.teamPlayerCount end if;return effect
end function
function prevTeamMember(state)
  effect=result(true);if state.teamPlayerCount>0 then state.selectedPlayer=state.selectedPlayer-1;if state.selectedPlayer<0 then state.selectedPlayer=state.teamPlayerCount-1 end if end if;return effect
end function
function nextOrder(state,time)
  effect=result(true);if not state.teamLeader and not state.selectedIsSelf then return effect end if
  if state.currentOrder<TEAMTASK_CAMP then
    state.currentOrder=state.currentOrder+1
    if state.currentOrder==TEAMTASK_RETRIEVE and not state.otherTeamHasFlag then state.currentOrder=state.currentOrder+1 end if
    if state.currentOrder==TEAMTASK_ESCORT and not state.yourTeamHasFlag then state.currentOrder=state.currentOrder+1 end if
  else state.currentOrder=TEAMTASK_OFFENSE end if
  state.orderPending=true;state.orderTime=time+3000;return effect
end function
function confirmOrder(state,time)
  effect=result(true);console(effect,"cmd vtell "+str(state.acceptLeader)+" yes\n");console(effect,"+button5; wait; -button5")
  if time<state.acceptOrderTime then effect.clientCommands=effect.clientCommands+["teamtask "+str(state.acceptTask)+"\n"];state.acceptOrderTime=0 end if;return effect
end function
function denyOrder(state,time)
  effect=result(true);console(effect,"cmd vtell "+str(state.acceptLeader)+" no\n");console(effect,"+button6; wait; -button6")
  if time<state.acceptOrderTime then state.acceptOrderTime=0 end if;return effect
end function
function task(order,voice)
  effect=result(true);console(effect,"cmd vsay_team "+voice+"\n");effect.clientCommands=effect.clientCommands+["teamtask "+str(order)+"\n"];return effect
end function
function taskOffense(gametype) if gametype==GT_CTF or gametype==GT_1FCTF then return task(TEAMTASK_OFFENSE,"ongetflag") end if;return task(TEAMTASK_OFFENSE,"onoffense") end function
function taskDefense() return task(TEAMTASK_DEFENSE,"ondefense") end function
function taskPatrol() return task(TEAMTASK_PATROL,"onpatrol") end function
function taskCamp() return task(TEAMTASK_CAMP,"oncamp") end function
function taskFollow() return task(TEAMTASK_FOLLOW,"onfollow") end function
function taskRetrieve() return task(TEAMTASK_RETRIEVE,"onreturnflag") end function
function taskEscort() return task(TEAMTASK_ESCORT,"onfollowcarrier") end function
function taskOwnFlag() effect=result(true);return console(effect,"cmd vsay_team ihaveflag\n") end function
function taskSuicide(targetNum) effect=result(true);if targetNum!=-1 then effect.clientCommands=effect.clientCommands+["tell "+str(targetNum)+" suicide"] end if;return effect end function
function taunt(text) effect=result(true);return console(effect,text) end function
function tauntKillInsult() return taunt("cmd vsay kill_insult\n") end function
function tauntPraise() return taunt("cmd vsay praise\n") end function
function tauntTaunt() return taunt("cmd vtaunt\n") end function
function tauntDeathInsult() return taunt("cmd vsay death_insult\n") end function
function tauntGauntlet() return taunt("cmd vsay kill_guantlet\n") end function

function isNativeBaseCommand(name)
  key=strings.toLowerAscii(name);return key=="tcmd" or key=="sizeup" or key=="sizedown" or key=="tell_target" or key=="tell_attacker" or key=="vtell_target" or key=="vtell_attacker" or key=="startorbit"
end function
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
struct Action boundary kind name text text2 number dispatched end struct
struct Runtime commandState registry state targetNum attackerNum time missionpack retailActive registeredCommands actions viewOrigin viewYaw keyCatcher eventHandling cameraLoadSucceeded cameraMode cameraStartTime end struct

function createRuntime(registry,missionpack,retailActive)
  return Runtime(commands.create(),registry,create(),-1,-1,0,missionpack,retailActive,[],[],[0.0,0.0,0.0],0.0,0,0,false,false,0)
end function
function emit(runtime,boundary,kind,name,text,text2,number)
  action=Action(boundary,kind,name,text,text2,number,not runtime.retailActive);runtime.actions=runtime.actions+[action];return action
end function
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
function Cmd_Argv(runtime,index) return commands.argv(runtime.commandState,index) end function

// CG_TargetCommand_f
function CG_TargetCommand_f(runtime) return absorb(runtime,targetCommand(runtime.commandState,runtime.targetNum)) end function
// CG_SizeUp_f
function CG_SizeUp_f(runtime) return absorb(runtime,sizeUpState(runtime.state)) end function
// CG_SizeDown_f
function CG_SizeDown_f(runtime) return absorb(runtime,sizeDownState(runtime.state)) end function
// CG_Viewpos_f
function CG_Viewpos_f(runtime) return absorb(runtime,viewpos(runtime.viewOrigin,runtime.viewYaw)) end function
// CG_ScoresDown_f
function CG_ScoresDown_f(runtime) return absorb(runtime,scoresDown(runtime.state,runtime.time)) end function
// CG_ScoresUp_f
function CG_ScoresUp_f(runtime) return absorb(runtime,scoresUp(runtime.state,runtime.time)) end function
// CG_TellTarget_f
function CG_TellTarget_f(runtime) return absorb(runtime,tellTarget(runtime.commandState,runtime.targetNum)) end function
// CG_TellAttacker_f
function CG_TellAttacker_f(runtime) return absorb(runtime,tellAttacker(runtime.commandState,runtime.attackerNum)) end function
// CG_VoiceTellTarget_f
function CG_VoiceTellTarget_f(runtime) return absorb(runtime,voiceTellTarget(runtime.commandState,runtime.targetNum)) end function
// CG_VoiceTellAttacker_f
function CG_VoiceTellAttacker_f(runtime) return absorb(runtime,voiceTellAttacker(runtime.commandState,runtime.attackerNum)) end function

// CG_LoadHud_f
function CG_LoadHud_f(runtime) hud=cvar.get(runtime.registry,"cg_hudFiles","",0).string;return absorb(runtime,loadHud(runtime.state,hud)) end function
// CG_scrollScoresDown_f
function CG_scrollScoresDown_f(runtime) return absorb(runtime,scrollScores(runtime.state,true)) end function
// CG_scrollScoresUp_f
function CG_scrollScoresUp_f(runtime) return absorb(runtime,scrollScores(runtime.state,false)) end function
// CG_spWin_f
function CG_spWin_f(runtime) return absorb(runtime,singlePlayerResult(true)) end function
// CG_spLose_f
function CG_spLose_f(runtime) return absorb(runtime,singlePlayerResult(false)) end function
// CG_NextTeamMember_f
function CG_NextTeamMember_f(runtime) return absorb(runtime,nextTeamMember(runtime.state)) end function
// CG_PrevTeamMember_f
function CG_PrevTeamMember_f(runtime) return absorb(runtime,prevTeamMember(runtime.state)) end function
// CG_NextOrder_f
function CG_NextOrder_f(runtime) return absorb(runtime,nextOrder(runtime.state,runtime.time)) end function
// CG_ConfirmOrder_f
function CG_ConfirmOrder_f(runtime) return absorb(runtime,confirmOrder(runtime.state,runtime.time)) end function
// CG_DenyOrder_f
function CG_DenyOrder_f(runtime) return absorb(runtime,denyOrder(runtime.state,runtime.time)) end function
// CG_TaskOffense_f
function CG_TaskOffense_f(runtime) return absorb(runtime,taskOffense(runtime.state.gametype)) end function
// CG_TaskDefense_f
function CG_TaskDefense_f(runtime) return absorb(runtime,taskDefense()) end function
// CG_TaskPatrol_f
function CG_TaskPatrol_f(runtime) return absorb(runtime,taskPatrol()) end function
// CG_TaskCamp_f
function CG_TaskCamp_f(runtime) return absorb(runtime,taskCamp()) end function
// CG_TaskFollow_f
function CG_TaskFollow_f(runtime) return absorb(runtime,taskFollow()) end function
// CG_TaskRetrieve_f
function CG_TaskRetrieve_f(runtime) return absorb(runtime,taskRetrieve()) end function
// CG_TaskEscort_f
function CG_TaskEscort_f(runtime) return absorb(runtime,taskEscort()) end function
// CG_TaskOwnFlag_f
function CG_TaskOwnFlag_f(runtime) return absorb(runtime,taskOwnFlag()) end function
// CG_TaskSuicide_f
function CG_TaskSuicide_f(runtime) return absorb(runtime,taskSuicide(runtime.targetNum)) end function
// CG_TauntKillInsult_f
function CG_TauntKillInsult_f(runtime) return absorb(runtime,tauntKillInsult()) end function
// CG_TauntPraise_f
function CG_TauntPraise_f(runtime) return absorb(runtime,tauntPraise()) end function
// CG_TauntTaunt_f
function CG_TauntTaunt_f(runtime) return absorb(runtime,tauntTaunt()) end function
// CG_TauntDeathInsult_f
function CG_TauntDeathInsult_f(runtime) return absorb(runtime,tauntDeathInsult()) end function
// CG_TauntGauntlet_f
function CG_TauntGauntlet_f(runtime) return absorb(runtime,tauntGauntlet()) end function
// CG_StartOrbit_f
function CG_StartOrbit_f(runtime) return absorb(runtime,startOrbitState(runtime.registry,runtime.state)) end function

// The next three bodies are disabled in the shipped source, but preserving
// their documented state transitions covers their Ledger symbols without
// registering dormant console commands.
// CG_TeamMenu_f
function CG_TeamMenu_f(runtime)
  if (runtime.keyCatcher&1)!=0 then runtime.eventHandling=0;runtime.keyCatcher=0 else runtime.eventHandling=1 end if;emit(runtime,"input","event-handling","team-menu","",str(runtime.eventHandling),runtime.keyCatcher);return result(true)
end function
// CG_EditHud_f
function CG_EditHud_f(runtime)
  if runtime.eventHandling==2 then runtime.eventHandling=0 else runtime.eventHandling=2 end if;emit(runtime,"input","event-handling","edit-hud","",str(runtime.eventHandling),runtime.keyCatcher);return result(true)
end function
// CG_Camera_f
function CG_Camera_f(runtime)
  name=commands.argvBuffer(runtime.commandState,1,1024);emit(runtime,"camera","load",name,"","",0)
  if runtime.cameraLoadSucceeded then runtime.cameraMode=true;runtime.cameraStartTime=runtime.time;emit(runtime,"camera","start",name,"","",runtime.time) else emit(runtime,"console","print","camera","Unable to load camera "+name+"\n","",0) end if;return result(true)
end function

function baseCommands()
  return ["testgun","testmodel","nextframe","prevframe","nextskin","prevskin","viewpos","+scores","-scores","+zoom","-zoom","sizeup","sizedown","weapnext","weapprev","weapon","tell_target","tell_attacker","vtell_target","vtell_attacker","tcmd","startOrbit","loaddeferred"]
end function
function missionpackCommands()
  return ["loadhud","nextTeamMember","prevTeamMember","nextOrder","confirmOrder","denyOrder","taskOffense","taskDefense","taskPatrol","taskCamp","taskFollow","taskRetrieve","taskEscort","taskSuicide","taskOwnFlag","tauntKillInsult","tauntPraise","tauntTaunt","tauntDeathInsult","tauntGauntlet","spWin","spLose","scoresDown","scoresUp"]
end function
function serverCommands()
  return ["kill","say","say_team","tell","vsay","vsay_team","vtell","vtaunt","vosay","vosay_team","votell","give","god","notarget","noclip","team","follow","levelshot","addbot","setviewpos","callvote","vote","callteamvote","teamvote","stats","teamtask","loaddefered"]
end function

// CG_InitConsoleCommands
function CG_InitConsoleCommands(runtime)
  names=baseCommands();if runtime.missionpack then names=names+missionpackCommands() end if;names=names+serverCommands()
  for each name in names commands.addCommand(runtime.commandState,name,void);runtime.registeredCommands=runtime.registeredCommands+[name];emit(runtime,"command","register",name,"","",0) end for;return len(names)
end function

function delegated(runtime,name) emit(runtime,"cgame","delegate",name,commands.args(runtime.commandState),"",0);return result(true) end function
// CG_ConsoleCommand
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
