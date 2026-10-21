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
  return State(0,false,0,0,TEAMTASK_OFFENSE,false,0,0,0,0,0,0,false,true,0,false,false,false,"ui/hud.txt",100,0.0)
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
