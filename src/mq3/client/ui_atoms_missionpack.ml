// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/ui/ui_atoms.c (Team Arena / Missionpack UI).
package mq3.client.ui_atoms_missionpack

import mq3.client.ui_syscalls_missionpack as traps
import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.shared.info as info
import std.string as strings

/// Console execution mode that appends text to the pending command buffer.
const EXEC_APPEND=2
/// Virtual-filesystem open mode requesting read access.
const FS_READ=0
/// Virtual-filesystem open mode requesting write access.
const FS_WRITE=1
/// Server configuration-string index for serverinfo; shared by the client and game protocol.
const CS_SERVERINFO=0
/// Size in bytes of the native postgame-information record used by the compatibility ABI.
const POSTGAME_INFO_SIZE=64
/// Bigchar font metric controlling width in virtual UI coordinates.
const BIGCHAR_WIDTH=16
/// Bigchar font metric controlling height in virtual UI coordinates.
const BIGCHAR_HEIGHT=16
/// Maximum length of a protocol, command, or configuration string.
const MAX_STRING_CHARS=1024

/// Stores UI atoms missionpack post game info record, including `score`, `redScore`, `blueScore`, `perfects`, `accuracy`, `impressives` and additional values.
struct PostGameInfo
  /// Final postgame score: base score plus shutout and time bonuses, multiplied by the skill bonus.
  score
  /// Red team's final score used in the postgame result text and victory or shutout checks.
  redScore
  /// Blue team's final score used in the postgame result text and victory or shutout checks.
  blueScore
  /// Perfect-game result count published to the postgame score cvars.
  perfects
  /// Percentage of successful weapon hits reported in the scoreboard data.
  accuracy
  /// Impressive-award count stored in the postgame score record and published to UI cvars.
  impressives
  /// Excellent-award count stored in the postgame score record and published to UI cvars.
  excellents
  /// Defense-award count stored in the postgame score record and published to UI cvars.
  defends
  /// Assist-award count stored in the postgame score record and published to UI cvars.
  assists
  /// Gauntlet-award count stored in the postgame score record and published to UI cvars.
  gauntlets
  /// Number of flag captures credited to this player.
  captures
  /// Completed match duration in seconds, computed from the match end time and ui_matchStartTime.
  time
  /// Bonus points for finishing before the map's target completion time, at ten points per remaining
  /// second.
  timeBonus
  /// Bonus points granted when the red team wins while the blue team has no positive score.
  shutoutBonus
  /// Positive difficulty multiplier derived from the single-player skill setting and applied to the
  /// postgame subtotal.
  skillBonus
  /// Unmodified match score parsed from the postgame command before time, shutout, and skill bonuses
  /// are applied.
  baseScore
end struct
/// Stores UI atoms missionpack queued engine action, including `kind`, `arguments`, `dispatched`.
struct Action
  /// Operation selector telling the host how to interpret a request emitted while updating postgame
  /// cvars, cached score files, and Missionpack UI state.
  kind
  /// When constructing this record, `internal` supplies `arguments` for this member.
  arguments
  /// True when this request is marked for native dispatch while updating postgame cvars, cached score
  /// files, and Missionpack UI state; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI atoms missionpack state, including `syscalls`, `xscale`, `yscale`, `realtime`, `frametime`, `cursorx` and additional values.
struct State
  /// When constructing this record, `create` supplies `syscalls` for this member. Used by `cvarSet` and
  /// `Com_Error` during subsequent processing.
  syscalls
  /// When constructing this record, `create` supplies `1.0` for this member. Used by
  /// `setDisplayContext` and `UI_AdjustFrom640` during subsequent processing.
  xscale
  /// When constructing this record, `create` supplies `1.0` for this member. Used by
  /// `setDisplayContext` and `UI_AdjustFrom640` during subsequent processing.
  yscale
  /// Current mission-pack UI clock in milliseconds used for postgame feedback and display deadlines.
  realtime
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// Horizontal position of the UI pointer in the menu coordinate system.
  cursorx
  /// Vertical position of the UI pointer in the menu coordinate system.
  cursory
  /// Shader resource selected for white rendering.
  whiteShader
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `UI_LoadBestScores` during subsequent processing.
  demoAvailable
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_CalcPostGameStats` during subsequent processing.
  newHighScoreTime
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_CalcPostGameStats` during subsequent processing.
  newBestTime
  /// When constructing this record, `create` supplies `array(16,0)` for this member. Used by
  /// `UI_CalcPostGameStats` during subsequent processing.
  timeToBeat
  /// Host requests queued while updating postgame cvars, cached score files, and Missionpack UI state,
  /// retained in request order.
  actions
  /// Host callback for the internal operation; an unset callback leaves that host operation
  /// unavailable.
  internalFn
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `setInternalHandler` and `internal` during subsequent processing.
  internalContext
  /// Compatibility UI-mode flag initialized to false; the present helper paths do not branch on this
  /// field.
  newUI
end struct

/// Creates a `mq3.client.ui_atoms_missionpack.PostGameInfo` record. Initializes the record with the defaults written in this constructor.
function postGameInfo() return PostGameInfo(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) end function
/// Calls `mq3.client.ui_atoms_missionpack.State` from UI atoms missionpack `create`. The final path returns `State(syscalls,1.0,1.0,0,0,320,240,0,false,0,0,array(16,0),[],void,void,false)`.
/// @param syscalls Value used by `if syscalls==void then return error(7830,"Missionpack UI atoms: syscall state is required") end if`.
function create(syscalls)
  if syscalls==void then return error(7830,"Missionpack UI atoms: syscall state is required") end if
  return State(syscalls,1.0,1.0,0,0,320,240,0,false,0,0,array(16,0),[],void,void,false)
end function
/// Updates `state.xscale`, `state.yscale`, `state.cursorx`, `state.cursory` and additional values during UI atoms missionpack `setDisplayContext`.
/// @param state Mutable UI atoms missionpack record/storage; this routine assigns `state.xscale`, `state.yscale`, `state.cursorx`, `state.cursory` and additional values.
/// @param xscale Value assigned to `state.xscale`.
/// @param yscale Value assigned to `state.yscale`.
/// @param cursorx Value assigned to `state.cursorx`.
/// @param cursory Value assigned to `state.cursory`.
/// @param whiteShader Value assigned to `state.whiteShader`.
function setDisplayContext(state,xscale,yscale,cursorx,cursory,whiteShader) state.xscale=xscale;state.yscale=yscale;state.cursorx=cursorx;state.cursory=cursory;state.whiteShader=whiteShader;return state end function
/// Updates `state.internalContext`, `state.internalFn` during UI atoms missionpack `setInternalHandler`.
/// @param state Mutable UI atoms missionpack record/storage; this routine assigns `state.internalContext`, `state.internalFn`.
/// @param context Value assigned to `state.internalContext`.
/// @param callback Value assigned to `state.internalFn`.
function setInternalHandler(state,context,callback) state.internalContext=context;state.internalFn=callback;return state end function
/// Updates `state.actions` during UI atoms missionpack `internal`.
/// @param state Mutable UI atoms missionpack record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param arguments Value used by `action=Action(kind,arguments,state.internalFn!=void)`.
function internal(state,kind,arguments) action=Action(kind,arguments,state.internalFn!=void);state.actions=state.actions+[action];if state.internalFn!=void then return state.internalFn(state.internalContext,kind,arguments) end if;return action end function
/// Evaluates UI atoms missionpack `two` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.
/// @param value Value tested by `value<10 and value>=0` before the calculation continues.
function two(value) if value<10 and value>=0 then return "0"+str(value) end if;return str(value) end function
/// Converts to text `value` for UI atoms missionpack `scoreValue`.
/// @param value Argument 1 of `str`.
function scoreValue(value) return str(value) end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_Cvar_Set` from UI atoms missionpack `cvarSet`.
/// @param state Record read through `state.syscalls`.
/// @param name Name used to select or register the corresponding UI atoms missionpack resource.
/// @param value Value used by `traps.trap_Cvar_Set(state.syscalls,name,value)`.
function cvarSet(state,name,value) traps.trap_Cvar_Set(state.syscalls,name,value);return void end function

/// Calls `mq3.client.ui_syscalls_missionpack.trap_Error` from UI atoms missionpack `Com_Error`.
/// @param state Record read through `state.syscalls`.
/// @param level Accepted for compatibility with `Com_Error`; the current implementation does not read it.
/// @param message Value used by `traps.trap_Error(state.syscalls,message)`.
function Com_Error(state,level,message) traps.trap_Error(state.syscalls,message);return void end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_Print` from UI atoms missionpack `Com_Printf`.
/// @param state Record read through `state.syscalls`.
/// @param message Value used by `traps.trap_Print(state.syscalls,message)`.
function Com_Printf(state,message) traps.trap_Print(state.syscalls,message);return void end function
/// Evaluates UI atoms missionpack `UI_ClampCvar` and returns `minimum`, `maximum`, `value` according to its guard/selection conditions.
/// @param minimum Value used by `if value<minimum then return minimum end if`.
/// @param maximum Value used by `if value>maximum then return maximum end if`.
/// @param value Value tested by `value<minimum`, `value>maximum` before the calculation continues.
function UI_ClampCvar(minimum,maximum,value) if value<minimum then return minimum end if;if value>maximum then return maximum end if;return value end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_Cmd_ExecuteText` from UI atoms missionpack `UI_StartDemoLoop`.
/// @param state Record read through `state.syscalls`.
function UI_StartDemoLoop(state) traps.trap_Cmd_ExecuteText(state.syscalls,EXEC_APPEND,"d1\n");return void end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_Cmd_ExecuteText` from UI atoms missionpack `NeedCDAction`.
/// @param state Record read through `state.syscalls`.
/// @param result Value used by `if not result then traps.trap_Cmd_ExecuteText(state.syscalls,EXEC_APPEND,"quit\n") end if`.
function NeedCDAction(state,result) if not result then traps.trap_Cmd_ExecuteText(state.syscalls,EXEC_APPEND,"quit\n") end if;return void end function
/// Adapts `mq3.client.ui_atoms_missionpack.NeedCDAction` to UI atoms missionpack `NeedCDKeyAction`, returning its result for `state, result`.
/// @param state Argument 1 of `mq3.client.ui_atoms_missionpack.NeedCDAction`.
/// @param result Argument 2 of `mq3.client.ui_atoms_missionpack.NeedCDAction`.
function NeedCDKeyAction(state,result) return NeedCDAction(state,result) end function

/// Calls `mq3.client.ui_syscalls_missionpack.trap_Argv` from UI atoms missionpack `UI_Argv`. The final path returns `buffer[0]`.
/// @param state Record read through `state.syscalls`.
/// @param arg Value used by `traps.trap_Argv(state.syscalls,arg,buffer,MAX_STRING_CHARS)`.
function UI_Argv(state,arg) buffer=[""];traps.trap_Argv(state.syscalls,arg,buffer,MAX_STRING_CHARS);return buffer[0] end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_Cvar_VariableStringBuffer` from UI atoms missionpack `UI_Cvar_VariableString`. The final path returns `buffer[0]`.
/// @param state Record read through `state.syscalls`.
/// @param name Name used to select or register the corresponding UI atoms missionpack resource.
function UI_Cvar_VariableString(state,name) buffer=[""];traps.trap_Cvar_VariableStringBuffer(state.syscalls,name,buffer,MAX_STRING_CHARS);return buffer[0] end function

/// Calls `mq3.client.ui_atoms_missionpack.cvarSet`, `mq3.client.ui_atoms_missionpack.scoreValue`, `mq3.client.ui_atoms_missionpack.two` and additional helpers from UI atoms missionpack `UI_SetBestScores`. The final path returns `value`.
/// @param state Shared UI atoms missionpack state passed to the helper calls in `UI_SetBestScores`.
/// @param value Record read through `value.accuracy`, `value.impressives`, `value.excellents`, `value.defends` and additional values.
/// @param postGame Value used by `if postGame then`.
function UI_SetBestScores(state,value,postGame)
  cvarSet(state,"ui_scoreAccuracy",scoreValue(value.accuracy)+"%");cvarSet(state,"ui_scoreImpressives",scoreValue(value.impressives));cvarSet(state,"ui_scoreExcellents",scoreValue(value.excellents));cvarSet(state,"ui_scoreDefends",scoreValue(value.defends));cvarSet(state,"ui_scoreAssists",scoreValue(value.assists));cvarSet(state,"ui_scoreGauntlets",scoreValue(value.gauntlets));cvarSet(state,"ui_scoreScore",scoreValue(value.score));cvarSet(state,"ui_scorePerfect",scoreValue(value.perfects));cvarSet(state,"ui_scoreTeam",scoreValue(value.redScore)+" to "+scoreValue(value.blueScore));cvarSet(state,"ui_scoreBase",scoreValue(value.baseScore));cvarSet(state,"ui_scoreTimeBonus",scoreValue(value.timeBonus));cvarSet(state,"ui_scoreSkillBonus",scoreValue(value.skillBonus));cvarSet(state,"ui_scoreShutoutBonus",scoreValue(value.shutoutBonus));cvarSet(state,"ui_scoreTime",two(n.trunc32(value.time/60))+":"+two(value.time%60));cvarSet(state,"ui_scoreCaptures",scoreValue(value.captures))
  if postGame then
    cvarSet(state,"ui_scoreAccuracy2",scoreValue(value.accuracy)+"%");cvarSet(state,"ui_scoreImpressives2",scoreValue(value.impressives));cvarSet(state,"ui_scoreExcellents2",scoreValue(value.excellents));cvarSet(state,"ui_scoreDefends2",scoreValue(value.defends));cvarSet(state,"ui_scoreAssists2",scoreValue(value.assists));cvarSet(state,"ui_scoreGauntlets2",scoreValue(value.gauntlets));cvarSet(state,"ui_scoreScore2",scoreValue(value.score));cvarSet(state,"ui_scorePerfect2",scoreValue(value.perfects));cvarSet(state,"ui_scoreTeam2",scoreValue(value.redScore)+" to "+scoreValue(value.blueScore));cvarSet(state,"ui_scoreBase2",scoreValue(value.baseScore));cvarSet(state,"ui_scoreTimeBonus2",scoreValue(value.timeBonus));cvarSet(state,"ui_scoreSkillBonus2",scoreValue(value.skillBonus));cvarSet(state,"ui_scoreShutoutBonus2",scoreValue(value.shutoutBonus));cvarSet(state,"ui_scoreTime2",two(n.trunc32(value.time/60))+":"+two(value.time%60));cvarSet(state,"ui_scoreCaptures2",scoreValue(value.captures))
  end if
  return value
end function

/// Calls `mq3.client.ui_atoms_missionpack.postGameInfo`, `mq3.client.ui_syscalls_missionpack.trap_FS_FOpenFile`, `mq3.client.ui_syscalls_missionpack.trap_FS_Read` and additional helpers from UI atoms missionpack `readScoreFile`. The final path returns `value`.
/// @param state Record read through `state.syscalls`.
/// @param filename File name passed to the corresponding file/asset operation.
function readScoreFile(state,filename)
  handle=[0];value=postGameInfo();if traps.trap_FS_FOpenFile(state.syscalls,filename,handle,FS_READ)>=0 then size=[0];traps.trap_FS_Read(state.syscalls,size,4,handle[0]);if size[0]==POSTGAME_INFO_SIZE then box=[value];traps.trap_FS_Read(state.syscalls,box,POSTGAME_INFO_SIZE,handle[0]);value=box[0] end if;traps.trap_FS_FCloseFile(state.syscalls,handle[0]) end if;return value
end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_FS_FOpenFile`, `mq3.client.ui_syscalls_missionpack.trap_FS_Write`, `mq3.client.ui_syscalls_missionpack.trap_FS_FCloseFile` from UI atoms missionpack `writeScoreFile`.
/// @param state Record read through `state.syscalls`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param value Value used by `traps.trap_FS_Write(state.syscalls,[value],POSTGAME_INFO_SIZE,handle[0])`.
function writeScoreFile(state,filename,value)
  handle=[0];if traps.trap_FS_FOpenFile(state.syscalls,filename,handle,FS_WRITE)>=0 then size=[POSTGAME_INFO_SIZE];traps.trap_FS_Write(state.syscalls,size,4,handle[0]);traps.trap_FS_Write(state.syscalls,[value],POSTGAME_INFO_SIZE,handle[0]);traps.trap_FS_FCloseFile(state.syscalls,handle[0]);return true end if;return false
end function

/// Updates `state.demoAvailable` during UI atoms missionpack `UI_LoadBestScores`.
/// @param state Mutable UI atoms missionpack record/storage; this routine assigns `state.demoAvailable`.
/// @param map map record passed to the UI atoms missionpack helper calls.
/// @param game Value used by `value=readScoreFile(state,"games/"+map+"_"+str(game)+".game")`.
function UI_LoadBestScores(state,map,game)
  value=readScoreFile(state,"games/"+map+"_"+str(game)+".game");UI_SetBestScores(state,value,false)
  protocol=n.trunc32(traps.trap_Cvar_VariableValue(state.syscalls,"protocol"));handle=[0];state.demoAvailable=false;if traps.trap_FS_FOpenFile(state.syscalls,"demos/"+map+"_"+str(game)+".dm_"+str(protocol),handle,FS_READ)>=0 then state.demoAvailable=true;traps.trap_FS_FCloseFile(state.syscalls,handle[0]) end if;return value
end function

/// Calls `mq3.client.ui_syscalls_missionpack.trap_FS_GetFileList`, `mq3.client.ui_atoms_missionpack.postGameInfo`, `mq3.client.ui_atoms_missionpack.writeScoreFile` and additional helpers from UI atoms missionpack `UI_ClearScores`. The final path returns `count`.
/// @param state Record read through `state.syscalls`.
function UI_ClearScores(state)
  list=[[]];count=traps.trap_FS_GetFileList(state.syscalls,"games","game",list,4096);value=postGameInfo();if count>0 then for index=0 to count-1 if index<len(list[0]) then writeScoreFile(state,"games/"+list[0][index],value) end if end for end if;UI_SetBestScores(state,value,false);return count
end function

/// Adapts `mq3.client.ui_atoms_missionpack.internal` to UI atoms missionpack `UI_Cache_f`, returning its result for `state, "display-cache-all", []`.
/// @param state Argument 1 of `mq3.client.ui_atoms_missionpack.internal`.
function UI_Cache_f(state) return internal(state,"display-cache-all",[]) end function

/// Updates `state.newHighScoreTime`, `state.newBestTime` during UI atoms missionpack `UI_CalcPostGameStats`.
/// @param state Mutable UI atoms missionpack record/storage; this routine assigns `state.newHighScoreTime`, `state.newBestTime`.
function UI_CalcPostGameStats(state)
  server=[""];traps.trap_GetConfigString(state.syscalls,CS_SERVERINFO,server,1024);map=info.value(server[0],"mapname");game=numbers.atoi(info.value(server[0],"g_gametype"));filename="games/"+map+"_"+str(game)+".game";oldInfo=readScoreFile(state,filename);value=postGameInfo()
  value.accuracy=numbers.atoi(UI_Argv(state,3));value.impressives=numbers.atoi(UI_Argv(state,4));value.excellents=numbers.atoi(UI_Argv(state,5));value.defends=numbers.atoi(UI_Argv(state,6));value.assists=numbers.atoi(UI_Argv(state,7));value.gauntlets=numbers.atoi(UI_Argv(state,8));value.baseScore=numbers.atoi(UI_Argv(state,9));value.perfects=numbers.atoi(UI_Argv(state,10));value.redScore=numbers.atoi(UI_Argv(state,11));value.blueScore=numbers.atoi(UI_Argv(state,12));time=numbers.atoi(UI_Argv(state,13));value.captures=numbers.atoi(UI_Argv(state,14))
  value.time=n.trunc32((time-traps.trap_Cvar_VariableValue(state.syscalls,"ui_matchStartTime"))/1000.0);adjusted=0;if game>=0 and game<len(state.timeToBeat) then adjusted=state.timeToBeat[game] end if;if value.time<adjusted then value.timeBonus=(adjusted-value.time)*10 end if;if value.redScore>value.blueScore and value.blueScore<=0 then value.shutoutBonus=100 end if;value.skillBonus=n.trunc32(traps.trap_Cvar_VariableValue(state.syscalls,"g_spSkill"));if value.skillBonus<=0 then value.skillBonus=1 end if;value.score=(value.baseScore+value.shutoutBonus+value.timeBonus)*value.skillBonus
  newHigh=value.redScore>value.blueScore and value.score>oldInfo.score;if newHigh then state.newHighScoreTime=state.realtime+20000;writeScoreFile(state,filename,value) end if;if value.time<oldInfo.time then state.newBestTime=state.realtime+20000 end if
  restores=[["capturelimit","ui_saveCaptureLimit"],["fraglimit","ui_saveFragLimit"],["cg_drawTimer","ui_drawTimer"],["g_doWarmup","ui_doWarmup"],["g_Warmup","ui_Warmup"],["sv_pure","ui_pure"],["g_friendlyFire","ui_friendlyFire"]];for each pair in restores cvarSet(state,pair[0],UI_Cvar_VariableString(state,pair[1])) end for;UI_SetBestScores(state,value,true);internal(state,"show-postgame",[newHigh]);return value
end function

/// Updates `state.frametime`, `state.realtime` during UI atoms missionpack `UI_ConsoleCommand`.
/// @param state Mutable UI atoms missionpack record/storage; this routine assigns `state.frametime`, `state.realtime`.
/// @param realTime Value assigned to `state.frametime`, `state.realtime`.
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

/// Reads `void` for UI atoms missionpack `UI_Shutdown`.
/// @param state Accepted for compatibility with `UI_Shutdown`; the current implementation does not read it.
function UI_Shutdown(state) return void end function
/// Builds the UI atoms missionpack `UI_AdjustFrom640` sequence from `[x*state.xscale,y*state.yscale,w*state.xscale,h*state.yscale]`.
/// @param state Record read through `state.xscale`, `state.yscale`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_AdjustFrom640`.
/// @param y Vertical coordinate in the coordinate space used by `UI_AdjustFrom640`.
/// @param w Width in the coordinate space used by `UI_AdjustFrom640`.
/// @param h Height in the coordinate space used by `UI_AdjustFrom640`.
function UI_AdjustFrom640(state,x,y,w,h) return [x*state.xscale,y*state.yscale,w*state.xscale,h*state.yscale] end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_R_RegisterShaderNoMip`, `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawNamedPic`. The final path returns `shader`.
/// @param state Record read through `state.syscalls`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_DrawNamedPic`.
/// @param y Vertical coordinate in the coordinate space used by `UI_DrawNamedPic`.
/// @param width Width in the coordinate space used by `UI_DrawNamedPic`.
/// @param height Height in the coordinate space used by `UI_DrawNamedPic`.
/// @param picname Value used by `shader=traps.trap_R_RegisterShaderNoMip(state.syscalls,picname)`.
function UI_DrawNamedPic(state,x,y,width,height,picname) shader=traps.trap_R_RegisterShaderNoMip(state.syscalls,picname);value=UI_AdjustFrom640(state,x,y,width,height);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],value[3],0.0,0.0,1.0,1.0,shader);return shader end function
/// Calls `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawHandlePic`. The final path returns `value+[s0,t0,s1,t1]`.
/// @param state Record read through `state.syscalls`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_DrawHandlePic`.
/// @param y Vertical coordinate in the coordinate space used by `UI_DrawHandlePic`.
/// @param w Width in the coordinate space used by `UI_DrawHandlePic`.
/// @param h Height in the coordinate space used by `UI_DrawHandlePic`.
/// @param shader Shader handle or asset name selected for this draw operation.
function UI_DrawHandlePic(state,x,y,w,h,shader) s0=0.0;s1=1.0;t0=0.0;t1=1.0;if w<0 then w=0-w;s0=1.0;s1=0.0 end if;if h<0 then h=0-h;t0=1.0;t1=0.0 end if;value=UI_AdjustFrom640(state,x,y,w,h);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],value[3],s0,t0,s1,t1,shader);return value+[s0,t0,s1,t1] end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_R_SetColor`, `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_FillRect`. The final path returns `value`.
/// @param state Record read through `state.syscalls`, `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_FillRect`.
/// @param y Vertical coordinate in the coordinate space used by `UI_FillRect`.
/// @param width Width in the coordinate space used by `UI_FillRect`.
/// @param height Height in the coordinate space used by `UI_FillRect`.
/// @param color Color value used by the UI atoms missionpack drawing or interpolation operation.
function UI_FillRect(state,x,y,width,height,color) traps.trap_R_SetColor(state.syscalls,color);value=UI_AdjustFrom640(state,x,y,width,height);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],value[3],0.0,0.0,0.0,0.0,state.whiteShader);traps.trap_R_SetColor(state.syscalls,void);return value end function
/// Calls `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawSides`. The final path returns `value`.
/// @param state Record read through `state.syscalls`, `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_DrawSides`.
/// @param y Vertical coordinate in the coordinate space used by `UI_DrawSides`.
/// @param w Width in the coordinate space used by `UI_DrawSides`.
/// @param h Height in the coordinate space used by `UI_DrawSides`.
function UI_DrawSides(state,x,y,w,h) value=UI_AdjustFrom640(state,x,y,w,h);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],1.0,value[3],0.0,0.0,0.0,0.0,state.whiteShader);traps.trap_R_DrawStretchPic(state.syscalls,value[0]+value[2]-1.0,value[1],1.0,value[3],0.0,0.0,0.0,0.0,state.whiteShader);return value end function
/// Calls `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawTopBottom`. The final path returns `value`.
/// @param state Record read through `state.syscalls`, `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_DrawTopBottom`.
/// @param y Vertical coordinate in the coordinate space used by `UI_DrawTopBottom`.
/// @param w Width in the coordinate space used by `UI_DrawTopBottom`.
/// @param h Height in the coordinate space used by `UI_DrawTopBottom`.
function UI_DrawTopBottom(state,x,y,w,h) value=UI_AdjustFrom640(state,x,y,w,h);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1],value[2],1.0,0.0,0.0,0.0,0.0,state.whiteShader);traps.trap_R_DrawStretchPic(state.syscalls,value[0],value[1]+value[3]-1.0,value[2],1.0,0.0,0.0,0.0,0.0,state.whiteShader);return value end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_R_SetColor`, `mq3.client.ui_atoms_missionpack.UI_DrawTopBottom`, `mq3.client.ui_atoms_missionpack.UI_DrawSides` from UI atoms missionpack `UI_DrawRect`.
/// @param state Record read through `state.syscalls`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_DrawRect`.
/// @param y Vertical coordinate in the coordinate space used by `UI_DrawRect`.
/// @param width Width in the coordinate space used by `UI_DrawRect`.
/// @param height Height in the coordinate space used by `UI_DrawRect`.
/// @param color Color value used by the UI atoms missionpack drawing or interpolation operation.
function UI_DrawRect(state,x,y,width,height,color) traps.trap_R_SetColor(state.syscalls,color);UI_DrawTopBottom(state,x,y,width,height);UI_DrawSides(state,x,y,width,height);traps.trap_R_SetColor(state.syscalls,void);return void end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_R_SetColor` from UI atoms missionpack `UI_SetColor`.
/// @param state Record read through `state.syscalls`.
/// @param rgba Value used by `traps.trap_R_SetColor(state.syscalls,rgba)`.
function UI_SetColor(state,rgba) traps.trap_R_SetColor(state.syscalls,rgba);return void end function
/// Calls `mq3.client.ui_syscalls_missionpack.trap_UpdateScreen` from UI atoms missionpack `UI_UpdateScreen`.
/// @param state Record read through `state.syscalls`.
function UI_UpdateScreen(state) traps.trap_UpdateScreen(state.syscalls);return void end function
/// Calls `mq3.client.ui_atoms_missionpack.UI_FillRect`, `mq3.client.ui_atoms_missionpack.UI_DrawRect` from UI atoms missionpack `UI_DrawTextBox`.
/// @param state Shared UI atoms missionpack state passed to the helper calls in `UI_DrawTextBox`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_DrawTextBox`.
/// @param y Vertical coordinate in the coordinate space used by `UI_DrawTextBox`.
/// @param width Width in the coordinate space used by `UI_DrawTextBox`.
/// @param lines Value used by `UI_FillRect(state,x+BIGCHAR_WIDTH/2,y+BIGCHAR_HEIGHT/2,(width+1)*BIGCHAR_WIDTH,(lines+1)*BIGCHAR_HEIGHT,[0.0,0.0,0.0,1.0])`.
function UI_DrawTextBox(state,x,y,width,lines) UI_FillRect(state,x+BIGCHAR_WIDTH/2,y+BIGCHAR_HEIGHT/2,(width+1)*BIGCHAR_WIDTH,(lines+1)*BIGCHAR_HEIGHT,[0.0,0.0,0.0,1.0]);UI_DrawRect(state,x+BIGCHAR_WIDTH/2,y+BIGCHAR_HEIGHT/2,(width+1)*BIGCHAR_WIDTH,(lines+1)*BIGCHAR_HEIGHT,[1.0,1.0,1.0,1.0]);return void end function
/// Computes `state.cursorx>=x and state.cursory>=y and state.cursorx<=x+width and state.cursory<=y+height` for UI atoms missionpack `UI_CursorInRect`.
/// @param state Record read through `state.cursorx`, `state.cursory`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_CursorInRect`.
/// @param y Vertical coordinate in the coordinate space used by `UI_CursorInRect`.
/// @param width Width in the coordinate space used by `UI_CursorInRect`.
/// @param height Height in the coordinate space used by `UI_CursorInRect`.
function UI_CursorInRect(state,x,y,width,height) return state.cursorx>=x and state.cursory>=y and state.cursorx<=x+width and state.cursory<=y+height end function
