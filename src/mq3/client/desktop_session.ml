// SPDX-License-Identifier: GPL-2.0-or-later
// Commands and durable user settings shared by the disconnected and local match hosts.
package mq3.client.desktop_session

import std.fs as fs
import std.string as strings
import mq3.client.key_bindings_config as bindings
import mq3.client.ui_lan_cache as lanCache
import mq3.engine.local_qvm_match as match
import mq3.format.pk3 as pk3
import mq3.qcommon.command_buffer as commands
import mq3.qcommon.config_persistence as config
import mq3.qcommon.cvar as cvar

/// Moves or replaces a file through the Unicode Windows API for desktop-session persistence. This binding is used by desktop session.
/// @param existingPath NUL-terminated UTF-16 path of the existing temporary file to move.
/// @param newPath NUL-terminated UTF-16 destination path for the persisted file.
/// @param flags Win32 MOVEFILE_* bit flags; the session writer passes replacement and write-through flags.
/// @returns True when the requested move succeeds; false when Windows reports failure.
extern function MoveFileExW(existingPath as wstr,newPath as wstr,flags as u32) from "kernel32.dll" returns bool
/// Reads the current Windows process identifier used to distinguish desktop-session temporary files. This binding is used by desktop session.
/// @returns The unsigned identifier of the current process.
extern function GetCurrentProcessId() from "kernel32.dll" returns u32

/// Stores desktop session config host record, including `dataRoot`, `context`, `bindingState`.
struct ConfigHost dataRoot context bindingState end struct
/// Stores desktop session session record, including `dataRoot`, `action`, `mapName`, `singlePlayer`, `settings`, `persistence` and additional values.
struct Session
  dataRoot
  action
  mapName
  singlePlayer
  settings
  persistence
  savedBindings
  configLoaded
  videoRestart
  restartCommands
  activeGame
  requestedGame
  target
  notice
  transitionCommands
  cinematicNext
  videoWidth
  videoHeight
end struct

/// Creates a `mq3.client.desktop_session.Session` record. Assigns `dataRoot` from `dataRoot`.
/// @param dataRoot Value used to initialize `Session.dataRoot`.
function create(dataRoot)
  return Session(dataRoot,"","",false,void,void,0,false,false,[],"","","","","","",1280,720)
end function

/// Adapts `mq3.client.key_bindings_config.bindingText` to desktop session `bindingText`, returning its result for `host.bindingState`.
/// @param host Record read through `host.bindingState`.
function bindingText(host) return bindings.bindingText(host.bindingState) end function
/// Adapts `mq3.engine.local_qvm_match.emitPrint` to desktop session `configPrint`, returning its result for `host.context, text`.
/// @param host Record read through `host.context`.
/// @param text Argument 2 of `mq3.engine.local_qvm_match.emitPrint`.
function configPrint(host,text) return match.emitPrint(host.context,text) end function
/// Adapts `mq3.engine.local_qvm_match.emitPrint` to desktop session `commandPrint`, returning its result for `commandState.context.context, text`.
/// @param commandState Record read through `commandState.context.context`.
/// @param text Argument 2 of `mq3.engine.local_qvm_match.emitPrint`.
function commandPrint(commandState,text) return match.emitPrint(commandState.context.context,text) end function
/// Adapts `mq3.qcommon.cvar.variableString` to desktop session `commandCvar`, returning its result for `commandState.context.context.cvars, name`.
/// @param commandState Record read through `commandState.context.context.cvars`.
/// @param name Argument 2 of `mq3.qcommon.cvar.variableString`.
function commandCvar(commandState,name) return cvar.variableString(commandState.context.context.cvars,name) end function

/// Calls `mq3.engine.local_qvm_match.desktopFilePath`, `std.string.endsWith`, `std.string.toLowerAscii` and additional helpers from desktop session `writeConfig`. The final path returns `replaced`.
/// @param host Record read through `host.dataRoot`.
/// @param name Name used to select or register the corresponding desktop session resource.
/// @param contents Value used by `written=try(fs.writeAllText(temporary,contents))`.
function writeConfig(host,name,contents)
  path=match.desktopFilePath(host.dataRoot,name)
  if path=="" or not strings.endsWith(strings.toLowerAscii(path),".cfg") then return false end if
  // Write the new contents before replacing the existing configuration.
  temporary=path+"."+str(GetCurrentProcessId())+".tmp"
  written=try(fs.writeAllText(temporary,contents))
  if written is error or not written then try(fs.delete(temporary));return false end if
  replaced=MoveFileExW(temporary,path,9)
  if not replaced then try(fs.delete(temporary)) end if
  return replaced
end function

/// Calls `mq3.engine.local_qvm_match.desktopFilePath`, `std.string.endsWith`, `std.string.toLowerAscii` and additional helpers from desktop session `readConfig`. The final path returns `decode(data)`.
/// @param context Record read through `context.archive`.
/// @param root Value used by `path=match.desktopFilePath(root,name)`.
/// @param name Name used to select or register the corresponding desktop session resource.
function readConfig(context,root,name)
  path=match.desktopFilePath(root,name)
  if path=="" or not strings.endsWith(strings.toLowerAscii(path),".cfg") then return void end if
  if fs.isFile(path) then
    size=try(fs.fileSize(path));if size is error or size>=commands.MAX_CMD_BUFFER then return void end if
    contents=try(fs.readAllText(path));if not (contents is error) then return contents end if
    return void
  end if
  data=try(pk3.read(context.archive,name))
  if data is error or len(data)>=commands.MAX_CMD_BUFFER then return void end if
  return decode(data)
end function

/// Calls `mq3.client.desktop_session.readConfig` from desktop session `readCommandFile`. The final path returns `readConfig(context,context.uiLanCacheHost.context.root,name)`.
/// @param commandState Record read through `commandState.context.context`.
/// @param name Name used to select or register the corresponding desktop session resource.
function readCommandFile(commandState,name)
  context=commandState.context.context
  return readConfig(context,context.uiLanCacheHost.context.root,name)
end function

/// Updates `session.savedBindings` during desktop session `save`.
/// @param state Record read through `state.context`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.savedBindings`.
function save(state,session)
  context=state.context
  if context.cgameKeys.bindingSerial!=session.savedBindings then context.cvars.modifiedFlags=context.cvars.modifiedFlags|cvar.ARCHIVE end if
  if (context.cvars.modifiedFlags&cvar.ARCHIVE)==0 then return false end if
  if config.writeConfiguration(session.persistence) then session.savedBindings=context.cgameKeys.bindingSerial;return true end if
  context.cvars.modifiedFlags=context.cvars.modifiedFlags|cvar.ARCHIVE
  return false
end function

/// Updates `session.settings`, `session.settings.userinfos`, `session.settings.userinfos[0]`, `session.restartCommands` and additional values during desktop session `capture`.
/// @param state Record read through `state.context.userinfos`, `state.context.cvars`, `state.context.commandState.buffer`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.settings`, `session.settings.userinfos`, `session.settings.userinfos[0]`, `session.restartCommands` and additional values.
function capture(state,session)
  saved=save(state,session)
  session.settings=match.captureUserSettings(state)
  // Bot slots are allocated afresh by qagame on the next map. Only carry
  // client zero, including values edited in a disconnected Player menu.
  session.settings.userinfos=[state.context.userinfos[0]]
  fields=cvar.infoString(state.context.cvars,cvar.USERINFO)
  if fields!="" then session.settings.userinfos[0]=fields end if
  if session.action=="map" then
    session.restartCommands=[]
    // Keep the ordered tail, including wait/addbot/team emitted by Start Server.
    if state.context.commandState.buffer!="" then session.restartCommands=[state.context.commandState.buffer] end if
  end if
  if session.action=="mod" then session.transitionCommands=state.context.commandState.buffer end if
  if session.action=="map" or session.action=="restart" then
    session.settings.pendingBotCommands=session.restartCommands
  end if
  return saved
end function

/// Updates `commandState.wait` during desktop session `deferCommandTail`.
/// @param commandState Mutable desktop session record/storage; this routine assigns `commandState.wait`.
function deferCommandTail(commandState)
  if commandState.buffer!="" then commandState.wait=1 end if
  return void
end function

/// Updates `session.singlePlayer`, `session.action`, `session.mapName` during desktop session `mapCommand`.
/// @param commandState Record read through `commandState.context.context.archive`, `commandState.context.context.cvars`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.singlePlayer`, `session.action`, `session.mapName`.
function mapCommand(commandState,session)
  if commands.argc(commandState)!=2 then commands.emit(commandState,"usage: "+commands.argv(commandState,0)+" <map>\n");return false end if
  name=strings.toLowerAscii(commands.argv(commandState,1))
  relative="maps/"+name+".bsp"
  if match.desktopFilePath(session.dataRoot,relative)=="" then commands.emit(commandState,"Invalid map name: "+name+"\n");return false end if
  if not pk3.has(commandState.context.context.archive,relative) then commands.emit(commandState,"Can't find "+relative+"\n");return false end if
  verb=strings.toLowerAscii(commands.argv(commandState,0))
  session.singlePlayer=verb=="spmap" or verb=="spdevmap"
  registry=commandState.context.context.cvars
  if session.singlePlayer then
    gameType=cvar.find(registry,"g_gametype");gameType.latchedString=void
    maxClients=cvar.find(registry,"sv_maxclients");maxClients.latchedString=void
    cvar.set(registry,"g_gametype","2")
    cvar.set(registry,"sv_maxclients","8")
  else
    pending=cvar.find(registry,"g_gametype")
    if pending!=void and pending.latchedString!=void then cvar.set(registry,"g_gametype",pending.latchedString) end if
    if cvar.variableIntegerValue(registry,"g_gametype")==2 then cvar.set(registry,"g_gametype","0") end if
  end if
  cvar.set(registry,"sv_cheats","0")
  if verb=="devmap" or verb=="spdevmap" then cvar.set(registry,"sv_cheats","1") end if
  session.action="map";session.mapName=name
  deferCommandTail(commandState)
  return true
end function

/// Updates `session.action` during desktop session `restartCommand`.
/// @param commandState Record read through `commandState.context.game`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.action`.
function restartCommand(commandState,session)
  if commandState.context.game==void then return false end if
  session.action="restart";deferCommandTail(commandState);return true
end function

/// Updates `session.action` during desktop session `disconnectCommand`.
/// @param commandState Accepted for compatibility with `disconnectCommand`; the current implementation does not read it.
/// @param session Mutable desktop session record/storage; this routine assigns `session.action`.
function disconnectCommand(commandState,session)
  session.action="menu"
  return true
end function

/// Updates `session.target`, `session.cinematicNext`, `session.action` during desktop session `cinematicCommand`.
/// @param commandState Record read through `commandState.context.context.cvars`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.target`, `session.cinematicNext`, `session.action`.
function cinematicCommand(commandState,session)
  if commands.argc(commandState)<2 or commands.argc(commandState)>3 then commands.emit(commandState,"usage: cinematic <name> [mode]\n");return false end if
  session.target=commands.argv(commandState,1)
  session.cinematicNext=cvar.variableString(commandState.context.context.cvars,"nextmap")
  session.action="cinematic";deferCommandTail(commandState);return true
end function

/// Updates `session.cinematicNext`, `session.action`, `session.transitionCommands` during desktop session `finishCinematic`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.cinematicNext`, `session.action`, `session.transitionCommands`.
function finishCinematic(session)
  next=session.cinematicNext;session.cinematicNext=""
  // CL_HandleCinEnd consumes nextmap. The disconnected host has already
  // captured its Cvars, so clear the saved copy before booting the next UI.
  if session.settings!=void then
    for each saved in session.settings.cvars
      if stringEqualsIgnoreCaseAscii(saved[0],"nextmap") then saved[1]="";saved[3]=void;break end if
    end for
  end if
  if next=="levelselect" then session.action="levelselect"
  else session.action="menu";if next!="" then session.transitionCommands=next+"\n" end if end if
  return session.action
end function

/// Updates `session.action` during desktop session `levelselectCommand`.
/// @param commandState Record read through `commandState.context.game`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.action`.
function levelselectCommand(commandState,session)
  if commandState.context.game==void then return match.uiGameCommand(commandState) end if
  session.action="levelselect"
  return true
end function

/// Updates `session.action` during desktop session `quitCommand`.
/// @param commandState commandState record passed to the desktop session helper calls.
/// @param session Mutable desktop session record/storage; this routine assigns `session.action`.
function quitCommand(commandState,session) session.action="quit";deferCommandTail(commandState);return true end function
/// Calls `mq3.qcommon.cvar.find` from desktop session `requestedGame`. The final path returns `value.string`.
/// @param commandState Record read through `commandState.context.context.cvars`.
function requestedGame(commandState)
  value=cvar.find(commandState.context.context.cvars,"fs_game")
  if value.latchedString!=void then return value.latchedString end if
  return value.string
end function
/// Updates `session.requestedGame`, `session.action` during desktop session `restartFilesystem`.
/// @param commandState commandState record passed to the desktop session helper calls.
/// @param session Mutable desktop session record/storage; this routine assigns `session.requestedGame`, `session.action`.
function restartFilesystem(commandState,session)
  session.requestedGame=requestedGame(commandState)
  session.action="mod";deferCommandTail(commandState)
  return true
end function
/// Updates `session.videoRestart` during desktop session `videoCommand`.
/// @param commandState commandState record passed to the desktop session helper calls.
/// @param session Mutable desktop session record/storage; this routine assigns `session.videoRestart`.
function videoCommand(commandState,session)
  game=requestedGame(commandState)
  if stringEqualsIgnoreCaseAscii(game,session.activeGame) or (game=="baseq3" and session.activeGame=="") then
    session.videoRestart=true;return true
  end if
  return restartFilesystem(commandState,session)
end function
/// Calls `mq3.qcommon.command_buffer.argc`, `mq3.qcommon.command_buffer.emit`, `mq3.qcommon.command_buffer.argv` and additional helpers from desktop session `musicCommand`.
/// @param commandState Record read through `commandState.context.context`.
/// @param session Accepted for compatibility with `musicCommand`; the current implementation does not read it.
function musicCommand(commandState,session)
  count=commands.argc(commandState)
  if count!=2 and count!=3 then commands.emit(commandState,"usage: music <intro> [loop]\n");return false end if
  intro=commands.argv(commandState,1);trackLoop=intro
  if count==3 then trackLoop=commands.argv(commandState,2) end if
  match.uiStartMusic(commandState.context.context,intro,trackLoop)
  return true
end function
/// Calls `mq3.engine.local_qvm_match.uiStopMusic` from desktop session `stopMusicCommand`.
/// @param commandState Record read through `commandState.context.context`.
/// @param session Accepted for compatibility with `stopMusicCommand`; the current implementation does not read it.
function stopMusicCommand(commandState,session)
  match.uiStopMusic(commandState.context.context)
  return true
end function

/// Updates `session.target`, `session.action` during desktop session `streamCommand`.
/// @param commandState commandState record passed to the desktop session helper calls.
/// @param session Mutable desktop session record/storage; this routine assigns `session.target`, `session.action`.
function streamCommand(commandState,session)
  name=strings.toLowerAscii(commands.argv(commandState,0))
  if commands.argc(commandState)!=2 then commands.emit(commandState,"usage: "+name+" <name>\n");return false end if
  session.target=commands.argv(commandState,1)
  session.action=name;deferCommandTail(commandState)
  return true
end function

/// Updates `session.persistence`, `session.notice`, `session.configLoaded`, `session.transitionCommands` and additional values during desktop session `attach`.
/// @param state Record read through `state.context`.
/// @param session Mutable desktop session record/storage; this routine assigns `session.persistence`, `session.notice`, `session.configLoaded`, `session.transitionCommands` and additional values.
function attach(state,session)
  if session==void then return void end if
  context=state.context;commandState=context.commandState
  context.uiLanCacheHost=lanCache.diskServices(session.dataRoot)
  commandState.context=state;commandState.clientRunning=true;commandState.uiGameCommandFn=match.uiGameCommand
  commandState.printFn=commandPrint;commandState.cvarStringFn=commandCvar;commandState.readFileFn=readCommandFile
  settingsHost=ConfigHost(session.dataRoot,context,bindings.create(context.cgameKeys))
  host=config.services();host.context=settingsHost;host.writeFn=writeConfig;host.bindingTextFn=bindingText;host.printFn=configPrint
  session.persistence=config.create(context.cvars,host)
  installed=config.installCommand(session.persistence,commandState);if installed is error then return installed end if
  cvar.get(context.cvars,"fs_game",session.activeGame,0)
  cvar.set(context.cvars,"fs_game",session.activeGame)
  if session.notice!="" then
    cvar.set(context.cvars,"com_errorMessage",session.notice);session.notice=""
  end if
  handlers=[["map",mapCommand],["spmap",mapCommand],["devmap",mapCommand],["spdevmap",mapCommand],["map_restart",restartCommand],["disconnect",disconnectCommand],["cinematic",cinematicCommand],["levelselect",levelselectCommand],["quit",quitCommand],["vid_restart",videoCommand],["music",musicCommand],["stopmusic",stopMusicCommand],["connect",streamCommand],["demo",streamCommand],["fs_restart",restartFilesystem]]
  for each handler in handlers
    if not commands.addContextCommand(commandState,handler[0],handler[1],session) then return error(7688,"Desktop command already registered: "+handler[0]) end if
  end for
  if not session.configLoaded then
    for each name in ["q3config.cfg","autoexec.cfg"]
      contents=readConfig(context,session.dataRoot,name)
      if contents!=void then commands.insertText(commandState,contents);commands.execute(commandState) end if
    end for
    session.configLoaded=true
  end if
  playerDefaults=[["name","Sarge"],["rate","25000"],["snaps","20"],["model","sarge"],["headmodel","sarge"],["team_model","james"],["team_headmodel","*james"],["color1","4"],["color2","5"],["handicap","100"],["sex","male"],["cl_anonymous","0"],["cg_predictItems","1"]]
  for each option in playerDefaults cvar.get(context.cvars,option[0],option[1],cvar.ARCHIVE|cvar.USERINFO) end for
  cvar.set(context.cvars,"cl_paused","0")
  if session.transitionCommands!="" then
    commands.addText(commandState,session.transitionCommands);session.transitionCommands=""
  end if
  session.savedBindings=context.cgameKeys.bindingSerial
  session.settings=void
  session.persistence.fullyInitialized=true
  return true
end function
