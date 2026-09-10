// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Bot and arena info-file registry from the Baseq3 g_bot.c loading block.
package mq3.game.bot_registry
import mq3.shared.parser as parser
import mq3.shared.info as infoStrings
import std.string as strings

const MAX_INFOS = 1024
const MAX_INFO_TEXT = 8192

struct Registry
  botInfos
  arenaInfos
  readFileFn
  listFilesFn
  printFn
  context
end struct

function create(readFileFn,listFilesFn,printFn,context)
  return Registry([],[],readFileFn,listFilesFn,printFn,context)
end function

function output(state,text)
  if state.printFn != void then state.printFn(state.context,text) end if
  return void
end function

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

function fileData(state,filename)
  if state.readFileFn == void then return void end if
  return state.readFileFn(state.context,filename)
end function

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

function loadArenasFromFile(state,filename)
  state.arenaInfos = loadFromFile(state,filename,state.arenaInfos); return void
end function

function loadBotsFromFile(state,filename)
  state.botInfos = loadFromFile(state,filename,state.botInfos); return void
end function

function listedFiles(state,extension)
  if state.listFilesFn == void then return [] end if
  files = state.listFilesFn(state.context,"scripts",extension,1024)
  if files == void then return [] end if
  return files
end function

function scriptPath(name)
  path = "scripts/"+name
  // Baseq3 assembles this path in filename[128]. A longer name has undefined
  // native behaviour, so keep it outside the portable contract.
  if len(bytes(path)) >= 128 then return error(490,"Bot registry script path exceeds native buffer") end if
  return path
end function

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

function getArenaInfoByMap(state,map)
  for each arena in state.arenaInfos
    if strings.equalsIgnoreCaseAscii(infoStrings.value(arena,"map"),map) then return arena end if
  end for
  return void
end function

function getBotInfoByNumber(state,num)
  if num < 0 or num >= len(state.botInfos) then
    output(state,"^1Invalid bot number: "+str(num)+"\n"); return void
  end if
  return state.botInfos[num]
end function

function getBotInfoByName(state,name)
  for each bot in state.botInfos
    if strings.equalsIgnoreCaseAscii(infoStrings.value(bot,"name"),name) then return bot end if
  end for
  return void
end function
