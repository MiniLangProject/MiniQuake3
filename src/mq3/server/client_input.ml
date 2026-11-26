// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete SV_ExecuteClientMessage payload wiring.
package mq3.server.client_input
import mq3.server.client_command as clientCommand
import mq3.server.client_command_dispatch as commandDispatch
import mq3.server.user_move as userMove

/// Client record for server.client_input, containing `state`, `name`, `messageAcknowledge`, `reliableAcknowledge`, `reliableSequence`, `gamestateMessageNum`, and 10 further fields.
struct Client
  /// Connection lifecycle value that tracks connection readiness while handling parsed input messages.
  state
  /// Extracted from userinfo, high bits masked.
  name
  /// Sequence number of the newest server message acknowledged by the client.
  messageAcknowledge
  /// Reliable server-command acknowledgment retained in the client input state.
  reliableAcknowledge
  /// Sequence number of the newest queued reliable command.
  reliableSequence
  /// Outgoing network sequence number of the client gamestate message.
  gamestateMessageNum
  /// Requested asset download path, or an empty string when no download is active.
  downloadName
  /// Text of the last processed reliable client command.
  lastClientCommandString
  /// Sequence number of the last processed reliable client command.
  lastClientCommand
  /// Earliest server timestamp when another reliable client command is accepted.
  nextReliableTime
  /// Reliable command entries retained until the peer acknowledges them.
  reliableCommands
  /// Acknowledged snapshot message selected as the base for delta compression.
  deltaMessage
  /// True after the client has passed the pure-package authentication check.
  pureAuthentic
  /// True after the client has sent its pure-server checksum verification command.
  gotCP
  /// Updates can be delta'd from here.
  frames
  /// Most recent user-command record received or processed for this client.
  lastUsercmd
end struct

/// Runtime record for server.client_input, containing `commandHost`, `dispatchHost`, `moveServer`, `moveHost`, `serverState`.
struct Runtime
  /// Host callbacks used to validate and execute reliable client commands.
  commandHost
  /// Host callbacks routing built-in and game-specific client commands.
  dispatchHost
  /// Server state used while decoding and applying user movement.
  moveServer
  /// Host callbacks that deliver user movement to game simulation.
  moveHost
  /// Current server lifecycle state, including loading and active gameplay.
  serverState
end struct

/// Create client in server.client_input.
function createClient()
  moveClient=userMove.createClient()
  return Client(0,"",0,0,0,0,"","",0,0,moveClient.reliableCommands,
    moveClient.deltaMessage,moveClient.pureAuthentic,moveClient.gotCP,
    moveClient.frames,moveClient.lastUsercmd)
end function

/// Execute text in server.client_input; the normal completion returns `commandDispatch.execute(runtime.dispatchHost, clientState, text, clientOk, runtime.serverState)`.
/// @param commandHost Record exposing `context`.
/// @param clientState Client state passed as `clientState` to `mq3.server.client_command_dispatch.execute`.
/// @param text Text passed as `text` to `mq3.server.client_command_dispatch.execute`.
/// @param clientOk Client ok passed as `clientOk` to `mq3.server.client_command_dispatch.execute`.
function executeText(commandHost,clientState,text,clientOk)
  runtime=commandHost.context
  return commandDispatch.execute(runtime.dispatchHost,clientState,text,clientOk,runtime.serverState)
end function

/// Create client input in server.client_input; the normal completion returns `runtime`.
///
/// Validation failures include `client input: missing service`.
/// Direct state writes: `commandHost.context`, `commandHost.executeFn`.
/// @param commandHost Updated in place: `context`, `executeFn`.
/// @param dispatchHost Initial `dispatchHost` field stored in the returned or constructed `mq3.server.client_input.Runtime` record.
/// @param moveServer Initial `moveServer` field stored in the returned or constructed `mq3.server.client_input.Runtime` record.
/// @param moveHost Initial `moveHost` field stored in the returned or constructed `mq3.server.client_input.Runtime` record.
/// @param serverState Initial `serverState` field stored in the returned or constructed `mq3.server.client_input.Runtime` record.
function create(commandHost,dispatchHost,moveServer,moveHost,serverState)
  if commandHost==void or dispatchHost==void or moveServer==void or moveHost==void then return error(6994,"client input: missing service") end if
  runtime=Runtime(commandHost,dispatchHost,moveServer,moveHost,serverState)
  commandHost.context=runtime;commandHost.executeFn=executeText
  return runtime
end function

/// Set time in server.client_input.
///
/// Validation failures include `client input: missing runtime`.
/// @param runtime Record exposing `commandHost`, `moveServer`.
/// @param time Time operand used by `setTime`; its reads are shown in the implementation.
function setTime(runtime,time)
  if runtime==void then return error(6994,"client input: missing runtime") end if
  runtime.commandHost.time=time;runtime.moveServer.time=time;return void
end function

// These signatures match client_message.Services and can be installed directly
// in network_ingress.Services.
/// @param messageHost Record exposing `context`.
/// @param clientState Mutable client sequencing record; accepted commands update its sequence, text, and next reliable-command time.
/// @param msg Network message read at the current cursor: an int32 sequence followed by a C string.
function clientCommandFn(messageHost,clientState,msg)
  if messageHost==void or messageHost.context==void then return error(6994,"client input: missing runtime") end if
  return clientCommand.execute(messageHost.context.commandHost,clientState,msg)
end function

/// Compute user move fn in server.client_input; the normal completion returns `userMove.execute(runtime.moveServer, clientState, runtime.moveHost, msg, isDelta)`.
///
/// Validation failures include `client input: missing runtime`.
/// @param messageHost Record exposing `context`.
/// @param clientState Client state passed as `clientState` to `mq3.server.user_move.execute`.
/// @param msg Msg passed as `msg` to `mq3.server.user_move.execute`.
/// @param isDelta Is delta passed as `isDelta` to `mq3.server.user_move.execute`.
function userMoveFn(messageHost,clientState,msg,isDelta)
  if messageHost==void or messageHost.context==void then return error(6994,"client input: missing runtime") end if
  runtime=messageHost.context
  return userMove.execute(runtime.moveServer,clientState,runtime.moveHost,msg,isDelta)
end function
