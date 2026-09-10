// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_UserMove and SV_ClientThink from server/sv_client.c.
package mq3.server.user_move
import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as userCommandDelta

const MAX_PACKET_USERCMDS=32
const MAX_RELIABLE_COMMANDS=64
const PACKET_MASK=31
const CS_PRIMED=3
const CS_ACTIVE=4

struct ClientFrame messageAcked end struct
struct Client
  state
  messageAcknowledge
  reliableAcknowledge
  reliableCommands
  deltaMessage
  pureAuthentic
  gotCP
  frames
  lastUsercmd
end struct
struct Server checksumFeed time pure end struct
struct Services sendGamestateFn enterWorldFn dropFn thinkFn diagnosticFn context end struct

function zeroCommand() return userCommandDelta.userCommand(0,0,0,0,0,0,0,0,0) end function
function createFrames() result=[];for index=0 to PACKET_MASK result=result+[ClientFrame(0)] end for;return result end function
function createReliableCommands() result=[];for index=0 to MAX_RELIABLE_COMMANDS-1 result=result+[""] end for;return result end function
function createClient()
  return Client(0,0,0,createReliableCommands(),-1,0,false,createFrames(),zeroCommand())
end function
function createServer(checksumFeed,time,pure) return Server(checksumFeed,time,pure) end function
function services() return Services(void,void,void,void,void,void) end function

// Com_HashKey uses signed char values on the pinned MSVC reference build.
function hashKey(text,maxLength)
  if text==void then return 0 end if
  raw=bytes(text);hash=0;limit=len(raw);if limit>maxLength then limit=maxLength end if
  if limit>0 then
    for index=0 to limit-1
      value=raw[index];if value>127 then value=value-256 end if
      hash=n.i32(hash+value*(119+index))
    end for
  end if
  return n.i32(hash^(hash>>10)^(hash>>20))
end function

function copyCommand(command)
  return userCommandDelta.userCommand(command.serverTime,command.angles[0],command.angles[1],command.angles[2],command.buttons,command.weapon,command.forwardmove,command.rightmove,command.upmove)
end function

function diagnose(host,clientState,text)
  if host.diagnosticFn!=void then host.diagnosticFn(host,clientState,text) end if
  return void
end function

function clientThink(host,clientState,command)
  clientState.lastUsercmd=copyCommand(command)
  if clientState.state!=CS_ACTIVE then return void end if
  if host.thinkFn!=void then host.thinkFn(host,clientState,command) end if
  return void
end function

function execute(serverState,clientState,host,msg,isDelta)
  if serverState==void or clientState==void or host==void or msg==void then return error(6990,"user move: missing state") end if
  if isDelta then clientState.deltaMessage=clientState.messageAcknowledge else clientState.deltaMessage=-1 end if

  commandCount=message.readU8(msg)
  if commandCount<1 then diagnose(host,clientState,"cmdCount < 1");return "empty" end if
  if commandCount>MAX_PACKET_USERCMDS then diagnose(host,clientState,"cmdCount > MAX_PACKET_USERCMDS");return "tooMany" end if

  commandText=clientState.reliableCommands[clientState.reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]
  key=n.i32(serverState.checksumFeed^clientState.messageAcknowledge^hashKey(commandText,32))
  commands=[];oldCommand=zeroCommand()
  for index=0 to commandCount-1
    command=userCommandDelta.readDeltaUsercmdKey(msg,key,oldCommand)
    commands=commands+[command];oldCommand=command
  end for

  clientState.frames[clientState.messageAcknowledge&PACKET_MASK].messageAcked=serverState.time

  if serverState.pure!=0 and clientState.pureAuthentic==0 and not clientState.gotCP then
    if clientState.state==CS_ACTIVE and host.sendGamestateFn!=void then host.sendGamestateFn(host,clientState) end if
    return "awaitingPure"
  end if

  if clientState.state==CS_PRIMED then
    if host.enterWorldFn!=void then host.enterWorldFn(host,clientState,commands[0]) end if
  end if

  if serverState.pure!=0 and clientState.pureAuthentic==0 then
    if host.dropFn!=void then host.dropFn(host,clientState,"Cannot validate pure client!") end if
    return "invalidPure"
  end if

  if clientState.state!=CS_ACTIVE then clientState.deltaMessage=-1;return "inactive" end if

  newestTime=commands[commandCount-1].serverTime;executed=0
  for each command in commands
    if command.serverTime<=newestTime and command.serverTime>clientState.lastUsercmd.serverTime then
      clientThink(host,clientState,command);executed=executed+1
    end if
  end for
  return executed
end function
