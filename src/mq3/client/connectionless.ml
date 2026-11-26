// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Incoming client OOB response dispatcher from client/cl_main.c.
package mq3.client.connectionless
import mq3.qcommon.message as message
import mq3.qcommon.command_buffer as commandBuffer
import mq3.qcommon.netchan as netchan
import mq3.compat.textnumbers as textnumbers
import mq3.shared.info as info

/// Client connection state before the client subsystem has been initialized.
const CA_UNINITIALIZED=0
/// Client connection state with no active server connection.
const CA_DISCONNECTED=1
/// Client connection state while waiting for authorization to contact the server.
const CA_AUTHORIZING=2
/// Client connection state while requesting a challenge from the server.
const CA_CONNECTING=3
/// Client connection state while replying to the server challenge and requesting connection.
const CA_CHALLENGING=4
/// Connection-state value for a completed handshake before game-state loading, defined for
/// connectionless handshake and server-reply handling.
const CA_CONNECTED=5
/// Client connection state while level media and game state are being loaded.
const CA_LOADING=6
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Native connection-state value for normal gameplay, retained in the connectionless reply handler's
/// state vocabulary.
const CA_ACTIVE=8
/// Client connection state used for fullscreen cinematic playback.
const CA_CINEMATIC=9
/// Maximum number of tokens or token-storage units used by the native command interface.
const MAX_STRING_TOKENS=1024
/// Connection-handshake retransmission interval in milliseconds.
const RETRANSMIT_TIMEOUT=3000
/// Quake network protocol version required by this client implementation.
const PROTOCOL_VERSION=68

/// Stores connectionless state, including `connectionState`, `realtime`, `serverAddress`, `channel`, `challenge`, `connectPacketCount` and additional values.
struct State
  /// Client connection-state identifier controlling handshake, loading, and active-play behavior.
  connectionState
  /// Current local client time in milliseconds used to schedule connection attempts and retransmission.
  realtime
  /// Network endpoint of the server selected for this connection.
  serverAddress
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `disconnectPacket` and `dispatch` during subsequent processing.
  channel
  /// Server-issued challenge token used to validate the connection handshake.
  challenge
  /// Number of connection-handshake packets sent, also used by progress displays.
  connectPacketCount
  /// Timestamp of the most recent connection attempt or handshake retransmission.
  connectTime
  /// Client timestamp of the latest outgoing packet, used to schedule retransmission.
  lastPacketSentTime
  /// Client timestamp of the latest received server packet, used to detect timeouts.
  lastPacketTime
  /// Status or error text received during the server connection handshake.
  serverMessage
  /// When constructing this record, `create` supplies `0` for this member. Used by `checkForResend` and
  /// `dispatch` during subsequent processing.
  qport
  /// When constructing this record, `create` supplies `false` for this member. Used by `checkForResend`
  /// during subsequent processing.
  demoplaying
end struct
/// Stores connectionless host-service callbacks, including `infoFn`, `statusFn`, `disconnectFn`, `printFn`, `outOfBandFn`, `motdFn` and additional values.
struct Services
  /// Host callback for the info operation; an unset callback leaves that host operation unavailable.
  infoFn
  /// Host callback for the status operation; an unset callback leaves that host operation unavailable.
  statusFn
  /// Host callback for the disconnect operation; an unset callback leaves that host operation
  /// unavailable.
  disconnectFn
  /// Host callback for the print operation; an unset callback leaves that host operation unavailable.
  printFn
  /// Host callback for the out of band operation; an unset callback leaves that host operation
  /// unavailable.
  outOfBandFn
  /// Host callback for the motd operation; an unset callback leaves that host operation unavailable.
  motdFn
  /// Host callback for the servers operation; an unset callback leaves that host operation unavailable.
  serversFn
  /// Host callback for the diagnostic operation; an unset callback leaves that host operation
  /// unavailable.
  diagnosticFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for connectionless server
  /// replies.
  context
  /// Host callback for the lan operation; an unset callback leaves that host operation unavailable.
  lanFn
  /// Host callback for the authorization operation; an unset callback leaves that host operation
  /// unavailable.
  authorizationFn
  /// Host callback for the userinfo operation; an unset callback leaves that host operation
  /// unavailable.
  userinfoFn
  /// Host callback for the out of band data operation; an unset callback leaves that host operation
  /// unavailable.
  outOfBandDataFn
  /// Host callback for the clear userinfo modified operation; an unset callback leaves that host
  /// operation unavailable.
  clearUserinfoModifiedFn
end struct

/// Creates a disconnected client handshake state for the supplied network address.
/// @param address Value used to initialize `State.serverAddress`.
function create(address)
  return State(CA_DISCONNECTED,0,address,void,0,0,0,0,0,"",0,false)
end function
/// Creates a `mq3.client.connectionless.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function

/// Converts only ASCII A-Z bytes to lowercase for case-insensitive connectionless command dispatch.
/// @param text Text consumed or emitted by `lowerAscii` in the connectionless path.
function lowerAscii(text)
  result="";raw=bytes(text)
  if len(raw)>0 then for each value in raw if value>=65 and value<=90 then value=value+32 end if;result=result+decode(bytes([value])) end for end if
  return result
end function
/// Tests a byte-for-byte text prefix, accepting an empty prefix.
/// @param text Text consumed or emitted by `startsWith` in the connectionless path.
/// @param prefix Value used by `b=bytes(prefix)`.
function startsWith(text,prefix)
  a=bytes(text);b=bytes(prefix);if len(a)<len(b) then return false end if
  if len(b)>0 then for i=0 to len(b)-1 if a[i]!=b[i] then return false end if end for end if
  return true
end function

/// Compares network-address type and IP bytes and optionally requires the UDP ports to match.
/// @param a Record read through `a.type`, `a.ip`, `a.port`.
/// @param b Record read through `b.type`, `b.ip`, `b.port`.
/// @param includePort Value used by `if includePort and a.port!=b.port then return false end if`.
function addressEqual(a,b,includePort)
  if a==void or b==void or a.type!=b.type or len(a.ip)!=len(b.ip) then return false end if
  if len(a.ip)>0 then for i=0 to len(a.ip)-1 if a.ip[i]!=b.ip[i] then return false end if end for end if
  if includePort and a.port!=b.port then return false end if
  return true
end function

/// Accepts disconnects only from the connected remote endpoint after three quiet seconds and invokes the host print/disconnect callbacks.
/// @param state Record read through `state.connectionState`, `state.channel.remoteAddress`, `state.realtime`, `state.lastPacketTime`.
/// @param host Record read through `host.printFn`, `host.disconnectFn`.
/// @param source Value used by `if not addressEqual(source,state.channel.remoteAddress,true) then return false end if`.
function disconnectPacket(state,host,source)
  if state.connectionState<CA_AUTHORIZING then return false end if
  if not addressEqual(source,state.channel.remoteAddress,true) then return false end if
  if state.realtime-state.lastPacketTime<3000 then return false end if
  text="Server disconnected for unknown reason\n"
  if host.printFn!=void then host.printFn(host,state,text) end if
  if host.disconnectFn!=void then host.disconnectFn(host,state,true,text) end if
  return true
end function

/// Retries the protocol-68 handshake every three seconds, sending getchallenge or connect with protocol, qport and challenge userinfo.
/// @param state Mutable connectionless record/storage; this routine assigns `state.connectTime`, `state.connectPacketCount`.
/// @param host Record read through `host.lanFn`, `host.authorizationFn`, `host.outOfBandFn`, `host.userinfoFn` and additional values.
function checkForResend(state,host)
  if state==void or host==void then return error(6942,"client resend: missing state") end if
  if state.demoplaying then return false end if
  if state.connectionState!=CA_CONNECTING and state.connectionState!=CA_CHALLENGING then return false end if
  if state.realtime-state.connectTime<RETRANSMIT_TIMEOUT then return false end if
  state.connectTime=state.realtime;state.connectPacketCount=state.connectPacketCount+1
  if state.connectionState==CA_CONNECTING then
    lan=false;if host.lanFn!=void then lan=host.lanFn(host,state,state.serverAddress) end if
    if not lan and host.authorizationFn!=void then host.authorizationFn(host,state) end if
    if host.outOfBandFn!=void then host.outOfBandFn(host,state,state.serverAddress,"getchallenge") end if
    return true
  end if
  userinfo="";if host.userinfoFn!=void then userinfo=host.userinfoFn(host,state) end if
  userinfo=info.setValue(userinfo,"protocol",str(PROTOCOL_VERSION),void,void)
  userinfo=info.setValue(userinfo,"qport",str(state.qport),void,void)
  userinfo=info.setValue(userinfo,"challenge",str(state.challenge),void,void)
  data=bytes("connect \"")+bytes(userinfo)+bytes("\"")
  if host.outOfBandDataFn!=void then host.outOfBandDataFn(host,state,state.serverAddress,data) end if
  if host.clearUserinfoModifiedFn!=void then host.clearUserinfoModifiedFn(host,state) end if
  return true
end function

/// Reads and tokenizes an out-of-band packet, advances challenge/connect state and dispatches server-browser, status, print, MOTD and echo responses.
/// @param state Mutable connectionless record/storage; this routine assigns `state.challenge`, `state.connectionState`, `state.connectPacketCount`, `state.connectTime` and additional values.
/// @param host Record read through `host.infoFn`, `host.statusFn`, `host.outOfBandFn`, `host.motdFn` and additional values.
/// @param source Value assigned to `state.serverAddress`.
/// @param msg Value used by `if state==void or host==void or source==void or msg==void then return error(6940,"client connectionless: missing state") end if`.
function dispatch(state,host,source,msg)
  if state==void or host==void or source==void or msg==void then return error(6940,"client connectionless: missing state") end if
  message.beginReadingOob(msg);message.readI32(msg);line=message.readCStringLine(msg)
  cmd=commandBuffer.create();commandBuffer.tokenizeString(cmd,line);name=commandBuffer.argv(cmd,0);lower=lowerAscii(name)
  if lower=="challengeresponse" then
    if state.connectionState==CA_CONNECTING then
      state.challenge=textnumbers.atoi(commandBuffer.argv(cmd,1));state.connectionState=CA_CHALLENGING
      state.connectPacketCount=0;state.connectTime=-99999;state.serverAddress=source
      return "challengeResponse"
    end if
    return "ignored"
  end if
  if lower=="connectresponse" then
    if state.connectionState>=CA_CONNECTED or state.connectionState!=CA_CHALLENGING or not addressEqual(source,state.serverAddress,false) then return "ignored" end if
    state.channel=netchan.setup(netchan.NS_CLIENT,source,state.qport);state.connectionState=CA_CONNECTED;state.lastPacketSentTime=-9999
    return "connectResponse"
  else if lower=="inforesponse" then
    if host.infoFn!=void then host.infoFn(host,state,source,msg) end if;return "infoResponse"
  else if lower=="statusresponse" then
    if host.statusFn!=void then host.statusFn(host,state,source,msg) end if;return "statusResponse"
  else if lower=="disconnect" then
    disconnectPacket(state,host,source);return "disconnect"
  else if lower=="echo" then
    if host.outOfBandFn!=void then host.outOfBandFn(host,state,source,commandBuffer.argv(cmd,1)) end if;return "echo"
  else if lower=="keyauthorize" then return "keyAuthorize"
  else if lower=="motd" then
    if host.motdFn!=void then host.motdFn(host,state,source,commandBuffer.argv(cmd,1)) end if;return "motd"
  else if lower=="print" then
    state.serverMessage=message.readCString(msg)
    if host.printFn!=void then host.printFn(host,state,state.serverMessage) end if;return "print"
  else if startsWith(lower,"getserversresponse") then
    if host.serversFn!=void then host.serversFn(host,state,source,msg) end if;return "getserversResponse"
  end if
  if host.diagnosticFn!=void then host.diagnosticFn(host,state,line) end if
  return "unknown"
end function
