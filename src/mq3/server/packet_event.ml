// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Incoming sequenced-packet routing from SV_PacketEvent in server/sv_main.c.
package mq3.server.packet_event
import mq3.qcommon.message as message
import mq3.server.connectionless as serverConnectionless
import mq3.server.netchan as serverNetchan
import mq3.qcommon.netchan as netchan
import mq3.compat.numeric as numeric

/// Client-state value identifying an unused slot excluded from sequenced-packet matching.
const CS_FREE=0
/// Client lifecycle state retaining a recently disconnected client for final messages.
const CS_ZOMBIE=1
/// Network-address kind for local loopback delivery.
const NA_LOOPBACK=2
/// Network-address kind for an IPv4 endpoint.
const NA_IP=4

/// Client record for server.packet_event, containing `state`, `netchan`, `lastPacketTime`.
struct Client
  /// Connection lifecycle value that determines whether a sequenced packet may belong to this
  /// connection.
  state
  /// Sequenced network channel used to exchange this client's packets.
  netchan
  /// Server timestamp of the most recently received client packet, in milliseconds.
  lastPacketTime
end struct
/// Create `mq3.server.packet_event.Client` with state=state; netchan=serverNetchanState; lastPacketTime=0.
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.packet_event.Client` record.
/// @param serverNetchanState Initial `netchan` field stored in the returned or constructed `mq3.server.packet_event.Client` record.
function client(state,serverNetchanState) return Client(state,serverNetchanState,0) end function

/// Runtime record for server.packet_event, containing `time`, `clients`.
struct Runtime
  /// Server timestamp attached to accepted client packets for activity tracking, in milliseconds.
  time
  /// Client slots matched against source addresses and packet channel identifiers.
  clients
end struct
/// Create `mq3.server.packet_event.Runtime` with time=0; clients=clients.
/// @param clients Initial `clients` field stored in the returned or constructed `mq3.server.packet_event.Runtime` record.
function runtime(clients) return Runtime(0,clients) end function

/// Services record for server.packet_event, containing `connectionlessRuntime`, `connectionlessHost`, `processFn`, `executeFn`, `disconnectFn`, `diagnosticFn`, and 1 further fields.
struct Services
  /// Runtime used to dispatch out-of-band packets.
  connectionlessRuntime
  /// Host services used by the connectionless packet dispatcher.
  connectionlessHost
  /// Host callback that processes a sequenced incoming client packet.
  processFn
  /// Host callback that executes a routed command or operation on the host.
  executeFn
  /// Host callback that processes a client disconnection through the host network lifecycle.
  disconnectFn
  /// Host callback that reports subsystem diagnostics to the host.
  diagnosticFn
  /// Caller-supplied data associated with sequenced packet processing, message execution, and
  /// disconnect handling.
  context
end struct
/// Create `mq3.server.packet_event.Services` with connectionlessRuntime=connectionlessRuntime; connectionlessHost=connectionlessHost; processFn=processNetchan; executeFn=void; disconnectFn=void; diagnosticFn=void; context=void.
/// @param connectionlessRuntime Initial `connectionlessRuntime` field stored in the returned or constructed `mq3.server.packet_event.Services` record.
/// @param connectionlessHost Initial `connectionlessHost` field stored in the returned or constructed `mq3.server.packet_event.Services` record.
function services(connectionlessRuntime,connectionlessHost)
  return Services(connectionlessRuntime,connectionlessHost,processNetchan,void,void,void,void)
end function

/// Test same base in server.packet_event; the normal completion returns `false`.
/// @param left Record exposing `type`, `ip`.
/// @param right Record exposing `type`, `ip`.
function sameBase(left,right)
  if left==void or right==void or left.type!=right.type then return false end if
  if left.type==NA_LOOPBACK then return true end if
  if left.type==NA_IP then return left.ip==right.ip end if
  return false
end function

/// Compute server.packet_event.isOob as `((msg.cursize >= 4) and (numeric.readI32(msg.data, 0) == - 1))`.
/// @param msg Record exposing `cursize`, `data`.
function isOob(msg)
  return msg.cursize>=4 and numeric.readI32(msg.data,0)==-1
end function

/// Compute message bytes in server.packet_event; the normal completion returns `result`.
/// @param msg Record exposing `cursize`, `data`.
function messageBytes(msg)
  result=bytes(msg.cursize,0)
  if msg.cursize>0 then for index=0 to msg.cursize-1 result[index]=msg.data[index] end for end if
  return result
end function

// Concrete SV_Netchan_Process adapter. Tests can replace processFn with the
// deterministic host callback used by the unchanged-C transition oracle.
/// @param host Reserved argument; this implementation does not read its value.
/// @param clientState Record exposing `netchan`.
/// @param msg Record exposing `maxsize`. Updated in place: `data`, `cursize`, `readcount`, `bit`.
function processNetchan(host,clientState,msg)
  result=serverNetchan.process(clientState.netchan,messageBytes(msg),msg.maxsize)
  if not result.accepted then return false end if
  msg.data=result.data;msg.cursize=result.cursize;msg.readcount=result.readcount;msg.bit=result.bit
  return true
end function

/// Compute packet event in server.packet_event; the normal completion returns `"unknown"`.
///
/// Validation failures include `server packet event: missing input`; `server packet event: missing connectionless service`; `server packet event: missing netchan process`.
/// @param state Record exposing `clients`, `time`.
/// @param host Record exposing `connectionlessRuntime`, `connectionlessHost`, `diagnosticFn`, `processFn`, `executeFn`, `disconnectFn`.
/// @param source Record exposing `port`.
/// @param msg Msg passed as `msg` to `mq3.server.packet_event.isOob`.
function packetEvent(state,host,source,msg)
  if state==void or state.clients==void or host==void or source==void or msg==void then return error(6991,"server packet event: missing input") end if
  if isOob(msg) then
    if host.connectionlessRuntime==void or host.connectionlessHost==void then return error(6992,"server packet event: missing connectionless service") end if
    serverConnectionless.dispatch(host.connectionlessRuntime,host.connectionlessHost,source,msg)
    return "oob"
  end if

  // Baseq3 deliberately performs the OOB reads even for a runt packet. The
  // message API returns -1 on underflow, making its unsigned qport 65535.
  message.beginReadingOob(msg);message.readI32(msg);qport=message.readI16(msg)&0xffff
  for each candidate in state.clients
    if candidate.state!=CS_FREE and candidate.netchan!=void and candidate.netchan.channel!=void and sameBase(source,candidate.netchan.channel.remoteAddress) and candidate.netchan.channel.qport==qport then
      if candidate.netchan.channel.remoteAddress.port!=source.port then
        if host.diagnosticFn!=void then host.diagnosticFn(host,candidate,source) end if
        candidate.netchan.channel.remoteAddress.port=source.port
      end if
      if host.processFn==void then return error(6993,"server packet event: missing netchan process") end if
      if host.processFn(host,candidate,msg) then
        if candidate.state!=CS_ZOMBIE then
          candidate.lastPacketTime=state.time
          if host.executeFn==void then return error(6994,"server packet event: missing client-message executor") end if
          host.executeFn(host,candidate,msg)
        end if
        return "accepted"
      end if
      return "rejected"
    end if
  end for
  if host.disconnectFn==void then return error(6995,"server packet event: missing disconnect sender") end if
  host.disconnectFn(host,source,"disconnect")
  return "unknown"
end function
