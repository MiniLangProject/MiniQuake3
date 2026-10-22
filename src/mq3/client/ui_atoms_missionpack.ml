// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/ui/ui_atoms.c (Team Arena / Missionpack UI).
package mq3.client.ui_atoms_missionpack

import mq3.client.ui_syscalls_missionpack as traps
import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.shared.info as info
import std.string as strings

const EXEC_APPEND=2
const FS_READ=0
const FS_WRITE=1
const CS_SERVERINFO=0
const POSTGAME_INFO_SIZE=64
const BIGCHAR_WIDTH=16
const BIGCHAR_HEIGHT=16
const MAX_STRING_CHARS=1024

struct PostGameInfo score redScore blueScore perfects accuracy impressives excellents defends assists gauntlets captures time timeBonus shutoutBonus skillBonus baseScore end struct
struct Action kind arguments dispatched end struct
struct State syscalls xscale yscale realtime frametime cursorx cursory whiteShader demoAvailable newHighScoreTime newBestTime timeToBeat actions internalFn internalContext newUI end struct

function postGameInfo() return PostGameInfo(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) end function
function create(syscalls)
  if syscalls==void then return error(7830,"Missionpack UI atoms: syscall state is required") end if
  return State(syscalls,1.0,1.0,0,0,320,240,0,false,0,0,array(16,0),[],void,void,false)
end function
function setDisplayContext(state,xscale,yscale,cursorx,cursory,whiteShader) state.xscale=xscale;state.yscale=yscale;state.cursorx=cursorx;state.cursory=cursory;state.whiteShader=whiteShader;return state end function
function setInternalHandler(state,context,callback) state.internalContext=context;state.internalFn=callback;return state end function
function internal(state,kind,arguments) action=Action(kind,arguments,state.internalFn!=void);state.actions=state.actions+[action];if state.internalFn!=void then return state.internalFn(state.internalContext,kind,arguments) end if;return action end function
function two(value) if value<10 and value>=0 then return "0"+str(value) end if;return str(value) end function
function scoreValue(value) return str(value) end function
function cvarSet(state,name,value) traps.trap_Cvar_Set(state.syscalls,name,value);return void end function

function Com_Error(state,level,message) traps.trap_Error(state.syscalls,message);return void end function
function Com_Printf(state,message) traps.trap_Print(state.syscalls,message);return void end function
function UI_ClampCvar(minimum,maximum,value) if value<minimum then return minimum end if;if value>maximum then return maximum end if;return value end function
function UI_StartDemoLoop(state) traps.trap_Cmd_ExecuteText(state.syscalls,EXEC_APPEND,"d1\n");return void end function
function NeedCDAction(state,result) if not result then traps.trap_Cmd_ExecuteText(state.syscalls,EXEC_APPEND,"quit\n") end if;return void end function
function NeedCDKeyAction(state,result) return NeedCDAction(state,result) end function

function UI_Argv(state,arg) buffer=[""];traps.trap_Argv(state.syscalls,arg,buffer,MAX_STRING_CHARS);return buffer[0] end function
function UI_Cvar_VariableString(state,name) buffer=[""];traps.trap_Cvar_VariableStringBuffer(state.syscalls,name,buffer,MAX_STRING_CHARS);return buffer[0] end function

function UI_SetBestScores(state,value,postGame)
  cvarSet(state,"ui_scoreAccuracy",scoreValue(value.accuracy)+"%");cvarSet(state,"ui_scoreImpressives",scoreValue(value.impressives));cvarSet(state,"ui_scoreExcellents",scoreValue(value.excellents));cvarSet(state,"ui_scoreDefends",scoreValue(value.defends));cvarSet(state,"ui_scoreAssists",scoreValue(value.assists));cvarSet(state,"ui_scoreGauntlets",scoreValue(value.gauntlets));cvarSet(state,"ui_scoreScore",scoreValue(value.score));cvarSet(state,"ui_scorePerfect",scoreValue(value.perfects));cvarSet(state,"ui_scoreTeam",scoreValue(value.redScore)+" to "+scoreValue(value.blueScore));cvarSet(state,"ui_scoreBase",scoreValue(value.baseScore));cvarSet(state,"ui_scoreTimeBonus",scoreValue(value.timeBonus));cvarSet(state,"ui_scoreSkillBonus",scoreValue(value.skillBonus));cvarSet(state,"ui_scoreShutoutBonus",scoreValue(value.shutoutBonus));cvarSet(state,"ui_scoreTime",two(n.trunc32(value.time/60))+":"+two(value.time%60));cvarSet(state,"ui_scoreCaptures",scoreValue(value.captures))
  if postGame then
    cvarSet(state,"ui_scoreAccuracy2",scoreValue(value.accuracy)+"%");cvarSet(state,"ui_scoreImpressives2",scoreValue(value.impressives));cvarSet(state,"ui_scoreExcellents2",scoreValue(value.excellents));cvarSet(state,"ui_scoreDefends2",scoreValue(value.defends));cvarSet(state,"ui_scoreAssists2",scoreValue(value.assists));cvarSet(state,"ui_scoreGauntlets2",scoreValue(value.gauntlets));cvarSet(state,"ui_scoreScore2",scoreValue(value.score));cvarSet(state,"ui_scorePerfect2",scoreValue(value.perfects));cvarSet(state,"ui_scoreTeam2",scoreValue(value.redScore)+" to "+scoreValue(value.blueScore));cvarSet(state,"ui_scoreBase2",scoreValue(value.baseScore));cvarSet(state,"ui_scoreTimeBonus2",scoreValue(value.timeBonus));cvarSet(state,"ui_scoreSkillBonus2",scoreValue(value.skillBonus));cvarSet(state,"ui_scoreShutoutBonus2",scoreValue(value.shutoutBonus));cvarSet(state,"ui_scoreTime2",two(n.trunc32(value.time/60))+":"+two(value.time%60));cvarSet(state,"ui_scoreCaptures2",scoreValue(value.captures))
  end if
  return value
end function

function readScoreFile(state,filename)
  handle=[0];value=postGameInfo();if traps.trap_FS_FOpenFile(state.syscalls,filename,handle,FS_READ)>=0 then size=[0];traps.trap_FS_Read(state.syscalls,size,4,handle[0]);if size[0]==POSTGAME_INFO_SIZE then box=[value];traps.trap_FS_Read(state.syscalls,box,POSTGAME_INFO_SIZE,handle[0]);value=box[0] end if;traps.trap_FS_FCloseFile(state.syscalls,handle[0]) end if;return value
end function
function writeScoreFile(state,filename,value)
  handle=[0];if traps.trap_FS_FOpenFile(state.syscalls,filename,handle,FS_WRITE)>=0 then size=[POSTGAME_INFO_SIZE];traps.trap_FS_Write(state.syscalls,size,4,handle[0]);traps.trap_FS_Write(state.syscalls,[value],POSTGAME_INFO_SIZE,handle[0]);traps.trap_FS_FCloseFile(state.syscalls,handle[0]);return true end if;return false
end function

function UI_LoadBestScores(state,map,game)
  value=readScoreFile(state,"games/"+map+"_"+str(game)+".game");UI_SetBestScores(state,value,false)
  protocol=n.trunc32(traps.trap_Cvar_VariableValue(state.syscalls,"protocol"));handle=[0];state.demoAvailable=false;if traps.trap_FS_FOpenFile(state.syscalls,"demos/"+map+"_"+str(game)+".dm_"+str(protocol),handle,FS_READ)>=0 then state.demoAvailable=true;traps.trap_FS_FCloseFile(state.syscalls,handle[0]) end if;return value
end function

function UI_ClearScores(state)
  list=[[]];count=traps.trap_FS_GetFileList(state.syscalls,"games","game",list,4096);value=postGameInfo();if count>0 then for index=0 to count-1 if index<len(list[0]) then writeScoreFile(state,"games/"+list[0][index],value) end if end for end if;UI_SetBestScores(state,value,false);return count
end function

function UI_Cache_f(state) return internal(state,"display-cache-all",[]) end function

function UI_CalcPostGameStats(state)
  server=[""];traps.trap_GetConfigString(state.syscalls,CS_SERVERINFO,server,1024);map=info.value(server[0],"mapname");game=numbers.atoi(info.value(server[0],"g_gametype"));filename="games/"+map+"_"+str(game)+".game";oldInfo=readScoreFile(state,filename);value=postGameInfo()
  value.accuracy=numbers.atoi(UI_Argv(state,3));value.impressives=numbers.atoi(UI_Argv(state,4));value.excellents=numbers.atoi(UI_Argv(state,5));value.defends=numbers.atoi(UI_Argv(state,6));value.assists=numbers.atoi(UI_Argv(state,7));value.gauntlets=numbers.atoi(UI_Argv(state,8));value.baseScore=numbers.atoi(UI_Argv(state,9));value.perfects=numbers.atoi(UI_Argv(state,10));value.redScore=numbers.atoi(UI_Argv(state,11));value.blueScore=numbers.atoi(UI_Argv(state,12));time=numbers.atoi(UI_Argv(state,13));value.captures=numbers.atoi(UI_Argv(state,14))
  value.time=n.trunc32((time-traps.trap_Cvar_VariableValue(state.syscalls,"ui_matchStartTime"))/1000.0);adjusted=0;if game>=0 and game<len(state.timeToBeat) then adjusted=state.timeToBeat[game] end if;if value.time<adjusted then value.timeBonus=(adjusted-value.time)*10 end if;if value.redScore>value.blueScore and value.blueScore<=0 then value.shutoutBonus=100 end if;value.skillBonus=n.trunc32(traps.trap_Cvar_VariableValue(state.syscalls,"g_spSkill"));if value.skillBonus<=0 then value.skillBonus=1 end if;value.score=(value.baseScore+value.shutoutBonus+value.timeBonus)*value.skillBonus
  newHigh=value.redScore>value.blueScore and value.score>oldInfo.score;if newHigh then state.newHighScoreTime=state.realtime+20000;writeScoreFile(state,filename,value) end if;if value.time<oldInfo.time then state.newBestTime=state.realtime+20000 end if
  restores=[["capturelimit","ui_saveCaptureLimit"],["fraglimit","ui_saveFragLimit"],["cg_drawTimer","ui_drawTimer"],["g_doWarmup","ui_doWarmup"],["g_Warmup","ui_Warmup"],["sv_pure","ui_pure"],["g_friendlyFire","ui_friendlyFire"]];for each pair in restores cvarSet(state,pair[0],UI_Cvar_VariableString(state,pair[1])) end for;UI_SetBestScores(state,value,true);internal(state,"show-postgame",[newHigh]);return value
end function

function UI_ConsoleCommand(state,realTime)
  state.frametime=realTime-state.realtime;state.realtime=realTime;command=strings.toLowerAscii(UI_Argv(state,0))
  if command=="ui_test" then internal(state,"show-postgame",[true]) end if
  if command=="ui_report" then internal(state,"report",[]);return true end if
  if command=="ui_load" then internal(state,"load",[]);return true end if
  if command=="remapshader" then if traps.trap_Argc(state.syscalls)==4 then traps.trap_R_RemapShader(state.syscalls,UI_Argv(state,1),UI_Argv(state,2),UI_Argv(state,3));return true end if
  else if command=="postgame" then UI_CalcPostGameStats(state);return true
  else if command=="ui_cache" then UI_Cache_f(state);return true
  else if command=="ui_teamorders" or command=="ui_cdkey" then return true end if
  return false
end function

function UI_Shutdown(state) return void end function
function UI_AdjustFrom640(state,x,y,w,h) return [x*state.xscale,y*state.yscale,w*state.xscale,h*state.yscale] end function
function UI_DrawNamedPic(state,x,y,width,height,picname) shader=traps.trap_R_RegisterShaderNoMip(state.syscalls,picname);value=UI_AdjustFrom640(state,x,y,width,height);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],value[3],0.0,0.0,1.0,1.0,shader);return shader end function
function UI_DrawHandlePic(state,x,y,w,h,shader) s0=0.0;s1=1.0;t0=0.0;t1=1.0;if w<0 then w=0-w;s0=1.0;s1=0.0 end if;if h<0 then h=0-h;t0=1.0;t1=0.0 end if;value=UI_AdjustFrom640(state,x,y,w,h);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],value[3],s0,t0,s1,t1,shader);return value+[s0,t0,s1,t1] end function
function UI_FillRect(state,x,y,width,height,color) traps.trap_R_SetColor(state.syscalls,color);value=UI_AdjustFrom640(state,x,y,width,height);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],value[3],0.0,0.0,0.0,0.0,state.whiteShader);traps.trap_R_SetColor(state.syscalls,void);return value end function
function UI_DrawSides(state,x,y,w,h) value=UI_AdjustFrom640(state,x,y,w,h);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],1.0,value[3],0.0,0.0,0.0,0.0,state.whiteShader);traps.trap_R_DrawStretchPic(state.syscalls,value[0]+value[2]-1.0,value[1],1.0,value[3],0.0,0.0,0.0,0.0,state.whiteShader);return value end function
function UI_DrawTopBottom(state,x,y,w,h) value=UI_AdjustFrom640(state,x,y,w,h);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],1.0,0.0,0.0,0.0,0.0,state.whiteShader);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1]+value[3]-1.0,value[2],1.0,0.0,0.0,0.0,0.0,state.whiteShader);return value end function
function UI_DrawRect(state,x,y,width,height,color) traps.trap_R_SetColor(state.syscalls,color);UI_DrawTopBottom(state,x,y,width,height);UI_DrawSides(state,x,y,width,height);traps.trap_R_SetColor(state.syscalls,void);return void end function
function UI_SetColor(state,rgba) traps.trap_R_SetColor(state.syscalls,rgba);return void end function
function UI_UpdateScreen(state) traps.trap_UpdateScreen(state.syscalls);return void end function
function UI_DrawTextBox(state,x,y,width,lines) UI_FillRect(state,x+BIGCHAR_WIDTH/2,y+BIGCHAR_HEIGHT/2,(width+1)*BIGCHAR_WIDTH,(lines+1)*BIGCHAR_HEIGHT,[0.0,0.0,0.0,1.0]);UI_DrawRect(state,x+BIGCHAR_WIDTH/2,y+BIGCHAR_HEIGHT/2,(width+1)*BIGCHAR_WIDTH,(lines+1)*BIGCHAR_HEIGHT,[1.0,1.0,1.0,1.0]);return void end function
function UI_CursorInRect(state,x,y,width,height) return state.cursorx>=x and state.cursory>=y and state.cursorx<=x+width and state.cursory<=y+height end function
