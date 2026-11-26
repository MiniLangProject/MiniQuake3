// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_UserMove and SV_ClientThink from server/sv_client.c.
package mq3.server.user_move
import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as userCommandDelta

/// Max number of usercmd_t in a packet.
const MAX_PACKET_USERCMDS=32
/// Capacity of the reliable-command ring retained until acknowledgment.
const MAX_RELIABLE_COMMANDS=64
/// Mask converting a network sequence number into a circular packet-history slot.
const PACKET_MASK=31
/// Client lifecycle state after gamestate delivery and before entering active play.
const CS_PRIMED=3
/// Client-state value identifying a client whose user commands advance its in-game entity.
const CS_ACTIVE=4

/// ClientFrame record for server.user_move, containing `messageAcked`.
struct ClientFrame
  /// Server timestamp when this snapshot message was acknowledged, in milliseconds.
  messageAcked
end struct
/// Client record for server.user_move, containing `state`, `messageAcknowledge`, `reliableAcknowledge`, `reliableCommands`, `deltaMessage`, `pureAuthentic`, and 3 further fields.
struct Client
  /// Connection lifecycle value that distinguishes entering the world from advancing an already active
  /// player.
  state
  /// Sequence number of the newest server message acknowledged by the client.
  messageAcknowledge
  /// Reliable command acknowledgment used while validating movement-message state.
  reliableAcknowledge
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
/// Server record for server.user_move, containing `checksumFeed`, `time`, `pure`.
struct Server
  /// Server-supplied feed value used to calculate pure-package checksums.
  checksumFeed
  /// Current simulation time used while validating and executing client user commands, in milliseconds.
  time
  /// True when clients must use the server-approved package checksums.
  pure
end struct
/// Services record for server.user_move, containing `sendGamestateFn`, `enterWorldFn`, `dropFn`, `thinkFn`, `diagnosticFn`, `context`.
struct Services
  /// Host callback that transmits the current gamestate to a client.
  sendGamestateFn
  /// Host callback that transitions a connected client into active world simulation.
  enterWorldFn
  /// Host callback that disconnects a client and reports the supplied reason.
  dropFn
  /// Host callback that passes a validated user command to game simulation.
  thinkFn
  /// Host callback that reports subsystem diagnostics to the host.
  diagnosticFn
  /// Caller-supplied data associated with entry into the game world and execution of client movement
  /// commands.
  context
end struct

/// Return `mq3.qcommon.message_delta.userCommand(0, 0, 0, 0, 0, 0, 0, 0, 0)` from `server.user_move.zeroCommand`.
function zeroCommand() return userCommandDelta.userCommand(0,0,0,0,0,0,0,0,0) end function
/// Create frames in server.user_move; the normal completion returns `result`.
function createFrames() result=[];for index=0 to PACKET_MASK result=result+[ClientFrame(0)] end for;return result end function
/// Create reliable commands in server.user_move; the normal completion returns `result`.
function createReliableCommands() result=[];for index=0 to MAX_RELIABLE_COMMANDS-1 result=result+[""] end for;return result end function
/// Create `mq3.server.user_move.Client` with state=0; messageAcknowledge=0; reliableAcknowledge=0; reliableCommands=createReliableCommands(); deltaMessage=- 1; pureAuthentic=0; gotCP=false; frames=createFrames(); lastUsercmd=zeroCommand().
function createClient()
  return Client(0,0,0,createReliableCommands(),-1,0,false,createFrames(),zeroCommand())
end function
/// Create `mq3.server.user_move.Server` with checksumFeed=checksumFeed; time=time; pure=pure.
/// @param checksumFeed Initial `checksumFeed` field stored in the returned or constructed `mq3.server.user_move.Server` record.
/// @param time Initial `time` field stored in the returned or constructed `mq3.server.user_move.Server` record.
/// @param pure Initial `pure` field stored in the returned or constructed `mq3.server.user_move.Server` record.
function createServer(checksumFeed,time,pure) return Server(checksumFeed,time,pure) end function
/// Create `mq3.server.user_move.Services` with sendGamestateFn=void; enterWorldFn=void; dropFn=void; thinkFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void,void,void,void) end function

// Com_HashKey uses signed char values on the pinned MSVC reference build.
/// @param text Text used in `bytes(text)` and `(text == void)`.
/// @param maxLength Max length used in `(limit > maxLength)`.
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

/// Return `mq3.qcommon.message_delta.userCommand(command.serverTime, command.angles[0], command.angles[1], command.angles[2], command.buttons, command.weapon, command.forwardmove, command.rightmove, command.upmove)` from `server.user_move.copyCommand`.
/// @param command Record exposing `serverTime`, `angles`, `buttons`, `weapon`, `forwardmove`, `rightmove`, `upmove`.
function copyCommand(command)
  return userCommandDelta.userCommand(command.serverTime,command.angles[0],command.angles[1],command.angles[2],command.buttons,command.weapon,command.forwardmove,command.rightmove,command.upmove)
end function

/// Compute diagnose in server.user_move.
/// @param host Record exposing `diagnosticFn`.
/// @param clientState Client state used in `host.diagnosticFn(host, clientState, text)`.
/// @param text Text used in `host.diagnosticFn(host, clientState, text)`.
function diagnose(host,clientState,text)
  if host.diagnosticFn!=void then host.diagnosticFn(host,clientState,text) end if
  return void
end function

/// Update `clientState.lastUsercmd` in server.user_move.
///
/// Direct state writes: `clientState.lastUsercmd`.
/// @param host Record exposing `thinkFn`.
/// @param clientState Record exposing `state`. Updated in place: `lastUsercmd`.
/// @param command Command passed as `command` to `mq3.server.user_move.copyCommand`.
function clientThink(host,clientState,command)
  clientState.lastUsercmd=copyCommand(command)
  if clientState.state!=CS_ACTIVE then return void end if
  if host.thinkFn!=void then host.thinkFn(host,clientState,command) end if
  return void
end function

/// Execute user move in server.user_move; the normal completion returns `executed`.
///
/// Validation failures include `user move: missing state`.
/// Direct state writes: `clientState.deltaMessage`.
/// @param serverState Record exposing `checksumFeed`, `time`, `pure`.
/// @param clientState Record exposing `messageAcknowledge`, `reliableCommands`, `reliableAcknowledge`, `frames`, `pureAuthentic`, `gotCP`, `state` and further fields. Updated in place: `deltaMessage`.
/// @param host Record exposing `sendGamestateFn`, `enterWorldFn`, `dropFn`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readU8`.
/// @param isDelta Is delta operand used by `execute`; its reads are shown in the implementation.
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
