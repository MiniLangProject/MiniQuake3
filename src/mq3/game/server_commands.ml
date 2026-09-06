// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_svcmds.c server console dispatch and administrative client lookup.
package mq3.game.server_commands
import mq3.game.command_args as commandArgs
import mq3.game.team_changes as teamChanges
import mq3.game.session as sessions
import mq3.game.memory as gameMemory
import mq3.game.ip_filters as ipFilters
import mq3.shared.info as infoStrings
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings

struct State
  addBotFn
  botListFn
  abortPodiumFn
end struct
function get(level)
  if level.serverCommands == void then level.serverCommands = State(void,void,void) end if
  return level.serverCommands
end function
function attach(level,addBotFn,botListFn,abortPodiumFn)
  state = get(level); state.addBotFn = addBotFn; state.botListFn = botListFn; state.abortPodiumFn = abortPodiumFn
  return state
end function
function serverPrint(level,text)
  if len(infoStrings.textBytes(text)) >= 1024 then return error(488,"Server output exceeds native G_Printf storage") end if
  if level.gamePrintFn == void then return error(488,"Server command requires game-print delivery") end if
  level.gamePrintFn(level,text); return void
end function
function slotText(value)
  text = str(n.i32(value))
  while len(text) < 3
    text = " "+text
  end while
  return text
end function
function entityList(level)
  if level.num_entities < 0 or level.num_entities > 1024 then return error(488,"Entity list exceeds native entity storage") end if
  types = ["ET_GENERAL          ","ET_PLAYER           ","ET_ITEM             ","ET_MISSILE          ",
    "ET_MOVER            ","ET_BEAM             ","ET_PORTAL           ","ET_SPEAKER          ",
    "ET_PUSH_TRIGGER     ","ET_TELEPORT_TRIGGER ","ET_INVISIBLE        ","ET_GRAPPLE          "]
  index = 1
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    if not ent.inuse then continue end if
    serverPrint(level,slotText(ent.slot)+":")
    kind = n.i32(ent.s.eType)
    if kind >= 0 and kind < len(types) then serverPrint(level,types[kind])
    else serverPrint(level,slotText(kind)+"                 ") end if
    if ent.classname != void then serverPrint(level,ent.classname) end if
    serverPrint(level,"\n")
  end while
  return void
end function
function clientForString(level,text)
  data = infoStrings.textBytes(text)
  if level.maxclients < 0 or level.maxclients > 64 then return error(488,"Server client lookup exceeds native client storage") end if
  if len(data) != 0 and data[0] >= 48 and data[0] <= 57 then
    slot = textnum.atoi(text)
    if slot < 0 or slot >= level.maxclients then
      serverPrint(level,"Bad client slot: "+str(slot)+"\n"); return void
    end if
    client = level.clients[slot]
    if client.connected == 0 then
      serverPrint(level,"Client "+str(slot)+" is not connected\n"); return void
    end if
    return client
  end if
  index = 0
  while index < level.maxclients
    client = level.clients[index]; index = index+1
    if client.connected == 0 then continue end if
    if strings.equalsIgnoreCaseAscii(client.netname,text) then return client end if
  end while
  serverPrint(level,"User "+text+" is not on the server\n"); return void
end function
function forceTeam(level,argv)
  client = clientForString(level,commandArgs.argument(argv,1,1024))
  if client == void then return void end if
  slot = sessions.sessionSlot(level,client)
  return teamChanges.setTeam(level,level.entities[slot],commandArgs.argument(argv,2,1024))
end function
function botBoundary(level,argv,callback,label)
  if callback == void then return error(488,"Server command requires "+label+" implementation") end if
  callback(level,argv); return void
end function
function command(level,argv)
  cmd = commandArgs.argument(argv,0,1024)
  if strings.equalsIgnoreCaseAscii(cmd,"entitylist") then entityList(level); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"forceteam") then forceTeam(level,argv); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"game_memory") then gameMemory.status(level); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"addbot") then botBoundary(level,argv,get(level).addBotFn,"bot creation"); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"botlist") then botBoundary(level,argv,get(level).botListFn,"bot listing"); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"abort_podium") then botBoundary(level,argv,get(level).abortPodiumFn,"podium abort"); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"addip") then ipFilters.addCommand(level,argv); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"removeip") then ipFilters.removeCommand(level,argv); return true end if
  if strings.equalsIgnoreCaseAscii(cmd,"listip") then
    if level.consoleCommandFn == void then return error(488,"IP list requires console-command delivery") end if
    level.consoleCommandFn(level,0,"g_banIPs\n"); return true
  end if
  if level.dedicated != 0 then
    start = 0
    if strings.equalsIgnoreCaseAscii(cmd,"say") then start = 1 end if
    if level.serverCommandFn == void then return error(488,"Dedicated console chat requires server-command delivery") end if
    level.serverCommandFn(level,-1,"print \"server: "+commandArgs.concat(argv,start)+"\""); return true
  end if
  return false
end function
