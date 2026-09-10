// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete SV_ExecuteClientMessage payload wiring.
package mq3.server.client_input
import mq3.server.client_command as clientCommand
import mq3.server.client_command_dispatch as commandDispatch
import mq3.server.user_move as userMove

struct Client
  state name
  messageAcknowledge reliableAcknowledge reliableSequence
  gamestateMessageNum downloadName lastClientCommandString
  lastClientCommand nextReliableTime reliableCommands
  deltaMessage pureAuthentic gotCP frames lastUsercmd
end struct

struct Runtime commandHost dispatchHost moveServer moveHost serverState end struct

function createClient()
  moveClient=userMove.createClient()
  return Client(0,"",0,0,0,0,"","",0,0,moveClient.reliableCommands,
    moveClient.deltaMessage,moveClient.pureAuthentic,moveClient.gotCP,
    moveClient.frames,moveClient.lastUsercmd)
end function

function executeText(commandHost,clientState,text,clientOk)
  runtime=commandHost.context
  return commandDispatch.execute(runtime.dispatchHost,clientState,text,clientOk,runtime.serverState)
end function

function create(commandHost,dispatchHost,moveServer,moveHost,serverState)
  if commandHost==void or dispatchHost==void or moveServer==void or moveHost==void then return error(6994,"client input: missing service") end if
  runtime=Runtime(commandHost,dispatchHost,moveServer,moveHost,serverState)
  commandHost.context=runtime;commandHost.executeFn=executeText
  return runtime
end function

function setTime(runtime,time)
  if runtime==void then return error(6994,"client input: missing runtime") end if
  runtime.commandHost.time=time;runtime.moveServer.time=time;return void
end function

// These signatures match client_message.Services and can be installed directly
// in network_ingress.Services.
function clientCommandFn(messageHost,clientState,msg)
  if messageHost==void or messageHost.context==void then return error(6994,"client input: missing runtime") end if
  return clientCommand.execute(messageHost.context.commandHost,clientState,msg)
end function

function userMoveFn(messageHost,clientState,msg,isDelta)
  if messageHost==void or messageHost.context==void then return error(6994,"client input: missing runtime") end if
  runtime=messageHost.context
  return userMove.execute(runtime.moveServer,clientState,runtime.moveHost,msg,isDelta)
end function
