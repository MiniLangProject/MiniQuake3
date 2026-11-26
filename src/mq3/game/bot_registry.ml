// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Bot and arena info-file registry from the Baseq3 g_bot.c loading block.
package mq3.game.bot_registry
import mq3.shared.parser as parser
import mq3.shared.info as infoStrings
import std.string as strings

/// Upper bound on infos represented by mq3.game.bot_registry.
const MAX_INFOS = 1024
/// Upper bound on info text represented by mq3.game.bot_registry.
const MAX_INFO_TEXT = 8192

/// `Registry` record for bot registry, containing `botInfos`, `arenaInfos`, `readFileFn`, `listFilesFn` and `printFn` and related fields.
struct Registry
  /// Parsed bot definitions available for bot creation.
  botInfos
  /// Parsed arena/map definitions used by game selection and bot setup.
  arenaInfos
  /// Injected callback for read file; invoked through the Registry service/state record.
  readFileFn
  /// Injected callback for list files; invoked through the Registry service/state record.
  listFilesFn
  /// Injected callback for print; invoked through the Registry service/state record.
  printFn
  /// Opaque caller-supplied context available to bot and arena definition file-loading, file-listing,
  /// and print callbacks.
  context
end struct

/// Create a `mq3.game.bot_registry.Registry` record, initializing `readFileFn` from `readFileFn`, `listFilesFn` from `listFilesFn` and `printFn` from `printFn`.
/// @param readFileFn Initial value stored in `mq3.game.bot_registry.Registry.readFileFn`.
/// @param listFilesFn Initial value stored in `mq3.game.bot_registry.Registry.listFilesFn`.
/// @param printFn Initial value stored in `mq3.game.bot_registry.Registry.printFn`.
/// @param context Context forwarded to the configured host callbacks.
function create(readFileFn,listFilesFn,printFn,context)
  return Registry([],[],readFileFn,listFilesFn,printFn,context)
end function

/// Use `state.printFn` to perform `output`.
/// @param state Bot registry state; accesses `printFn` and `context`.
/// @param text Text to parse, format or deliver.
function output(state,text)
  if state.printFn != void then state.printFn(state.context,text) end if
  return void
end function

/// Record or dispatch `"Missing { in info file\n"`, `"Max infos exceeded\n"` and `"Unexpected end of info file\n"` actions in `parseInfos`.
/// @param state Bot registry state; accesses `context` and `printFn`.
/// @param text Text to parse, format or deliver.
/// @param max Value used by `parseInfos` in `if max < 0 then return error(490,"Negative info capacity") end if`.
function parseInfos(state,text,max)
  if max < 0 then return error(490,"Negative info capacity") end if
  source = text
  if typeof(source) == "string" then source = bytes(source) end if
  scan = parser.create(source); result = []
  while true
    token = parser.parseExt(scan,true)
    if token == "" then break end if
    if token != "{" then output(state,"Missing { in info file\n"); break end if
    if len(result) == max then output(state,"Max infos exceeded\n"); break end if
    value = ""
    while true
      token = parser.parseExt(scan,true)
      if token == "" then output(state,"Unexpected end of info file\n"); break end if
      if token == "}" then break end if
      key = infoStrings.copy(token,1024)
      token = parser.parseExt(scan,false)
      if token == "" then token = "<NULL>" end if
      value = infoStrings.setValue(value,key,token,state.context,state.printFn)
    end while
    result = result + [value]
  end while
  return result
end function

/// Use `state.readFileFn` to perform `fileData`. Return paths include `state.readFileFn(state.context,filename)`.
/// @param state Bot registry state; accesses `readFileFn` and `context`.
/// @param filename Filename supplied to the configured loader or file service.
function fileData(state,filename)
  if state.readFileFn == void then return void end if
  return state.readFileFn(state.context,filename)
end function

/// Apply `mq3.game.bot_registry.fileData`, `mq3.game.bot_registry.output` and `mq3.game.bot_registry.parseInfos` while evaluating `loadFromFile`. Return paths include `destination+parseInfos(state,data,available)`.
/// @param state Bot registry state; accesses `readFileFn` and `context`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param destination Sequence whose length bounds the iteration or lookup in `loadFromFile`.
function loadFromFile(state,filename,destination)
  data = fileData(state,filename)
  if data == void then output(state,"^1file not found: "+filename+"\n"); return destination end if
  if typeof(data) == "string" then data = bytes(data) end if
  length = len(data)
  if length >= MAX_INFO_TEXT then
    output(state,"^1file too large: "+filename+" is "+str(length)+", max allowed is "+str(MAX_INFO_TEXT))
    return destination
  end if
  available = MAX_INFOS-len(destination)
  return destination+parseInfos(state,data,available)
end function

/// Set `state.arenaInfos` to `loadFromFile(state,filename,state.arenaInfos)` in `mq3.game.bot_registry.loadArenasFromFile`.
/// @param state Bot registry state; accesses `arenaInfos`. May update `state.arenaInfos` in place.
/// @param filename Filename supplied to the configured loader or file service.
function loadArenasFromFile(state,filename)
  state.arenaInfos = loadFromFile(state,filename,state.arenaInfos); return void
end function

/// Set `state.botInfos` to `loadFromFile(state,filename,state.botInfos)` in `mq3.game.bot_registry.loadBotsFromFile`.
/// @param state Bot registry state; accesses `botInfos`. May update `state.botInfos` in place.
/// @param filename Filename supplied to the configured loader or file service.
function loadBotsFromFile(state,filename)
  state.botInfos = loadFromFile(state,filename,state.botInfos); return void
end function

/// Use `state.listFilesFn` to perform `listedFiles`. Return paths include `files`.
/// @param state Bot registry state; accesses `listFilesFn` and `context`.
/// @param extension Value passed as argument 3 to `state.listFilesFn`.
function listedFiles(state,extension)
  if state.listFilesFn == void then return [] end if
  files = state.listFilesFn(state.context,"scripts",extension,1024)
  if files == void then return [] end if
  return files
end function

/// Prefix a bot registry filename with scripts/ and reject paths exceeding the native path buffer.
/// @param name Name used to identify the requested entry.
function scriptPath(name)
  path = "scripts/"+name
  // Baseq3 assembles this path in filename[128]. A longer name has undefined
  // native behaviour, so keep it outside the portable contract.
  if len(bytes(path)) >= 128 then return error(490,"Bot registry script path exceeds native buffer") end if
  return path
end function

/// Set `state.arenaInfos` to `[]` and `state.arenaInfos` to `numbered` in `mq3.game.bot_registry.loadArenas`.
/// @param state Bot registry state; accesses `arenaInfos`, `context` and `printFn`. May update `state.arenaInfos` in place.
/// @param arenasFile Filename supplied to the configured loader or file service.
function loadArenas(state,arenasFile)
  state.arenaInfos = []
  if arenasFile == "" then loadArenasFromFile(state,"scripts/arenas.txt") else loadArenasFromFile(state,arenasFile) end if
  for each filename in listedFiles(state,".arena")
    loadArenasFromFile(state,scriptPath(filename))
  end for
  output(state,str(len(state.arenaInfos))+" arenas parsed\n")
  numbered = []; index = 0
  for each arena in state.arenaInfos
    numbered = numbered+[infoStrings.setValue(arena,"num",str(index),state.context,state.printFn)]
    index = index+1
  end for
  state.arenaInfos = numbered; return void
end function

/// Load bot definitions into the registry using the configured file and diagnostic services.
/// @param state Bot registry state; accesses `botInfos`. May update `state.botInfos` in place.
/// @param botEnable Value used by `loadBots` in `if not botEnable then return void end if`.
/// @param botsFile Filename supplied to the configured loader or file service.
function loadBots(state,botEnable,botsFile)
  // The original returns before clearing the previous registry.
  if not botEnable then return void end if
  state.botInfos = []
  if botsFile == "" then loadBotsFromFile(state,"scripts/bots.txt") else loadBotsFromFile(state,botsFile) end if
  for each filename in listedFiles(state,".bot")
    loadBotsFromFile(state,scriptPath(filename))
  end for
  output(state,str(len(state.botInfos))+" bots parsed\n"); return void
end function

/// Apply `mq3.shared.info.value` while evaluating `getArenaInfoByMap`.
/// @param state Bot registry state; accesses `arenaInfos`.
/// @param map Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`.
function getArenaInfoByMap(state,map)
  for each arena in state.arenaInfos
    if strings.equalsIgnoreCaseAscii(infoStrings.value(arena,"map"),map) then return arena end if
  end for
  return void
end function

/// Apply `mq3.game.bot_registry.output` while evaluating `getBotInfoByNumber`. Return paths include `state.botInfos[num]`.
/// @param state Bot registry state; accesses `botInfos`.
/// @param num Value passed as argument 1 to `str`.
function getBotInfoByNumber(state,num)
  if num < 0 or num >= len(state.botInfos) then
    output(state,"^1Invalid bot number: "+str(num)+"\n"); return void
  end if
  return state.botInfos[num]
end function

/// Apply `mq3.shared.info.value` while evaluating `getBotInfoByName`.
/// @param state Bot registry state; accesses `botInfos`.
/// @param name Name used to identify the requested entry.
function getBotInfoByName(state,name)
  for each bot in state.botInfos
    if strings.equalsIgnoreCaseAscii(infoStrings.value(bot,"name"),name) then return bot end if
  end for
  return void
end function
