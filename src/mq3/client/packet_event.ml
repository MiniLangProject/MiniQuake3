// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Incoming packet routing from CL_PacketEvent in client/cl_main.c.
package mq3.client.packet_event
import mq3.client.connectionless as clientConnectionless
import mq3.compat.numeric as numeric

const CA_CONNECTED=5

/// Stores packet event state, including `connection`, `realtime`, `serverMessageSequence`, `demoRecording`, `demoWaiting`.
struct State
  connection
  realtime
  serverMessageSequence
  demoRecording
  demoWaiting
end struct

/// Calls `mq3.client.packet_event.State` from packet event `create`. The final path returns `State(connectionState,0,0,false,false)`.
/// @param connectionState Value used by `if connectionState==void then return error(6980,"packet event: missing connection state") end if`.
function create(connectionState)
  if connectionState==void then return error(6980,"packet event: missing connection state") end if
  return State(connectionState,0,0,false,false)
end function

/// Stores packet event host-service callbacks, including `connectionlessHost`, `processFn`, `parseFn`, `demoFn`, `context`.
struct Services connectionlessHost processFn parseFn demoFn context end struct
/// Creates a `mq3.client.packet_event.Services` record. Assigns `connectionlessHost` from `connectionlessHost`.
/// @param connectionlessHost Value used to initialize `Services.connectionlessHost`.
function services(connectionlessHost) return Services(connectionlessHost,void,void,void,void) end function

/// Computes `msg.cursize>=4 and numeric.readI32(msg.data,0)==-1` for packet event `isOob`.
/// @param msg Record read through `msg.cursize`, `msg.data`.
function isOob(msg)
  return msg.cursize>=4 and numeric.readI32(msg.data,0)==-1
end function

// processFn(host,state,msg) owns CL_Netchan_Process. parseFn is normally bound
// to protocol_runtime.parse; demoFn owns the filesystem recording boundary.
/// @param state Mutable packet event record/storage; this routine assigns `state.connection.realtime`, `state.connection.lastPacketTime`, `state.serverMessageSequence`.
/// @param host Record read through `host.connectionlessHost`, `host.processFn`, `host.parseFn`, `host.demoFn`.
/// @param source Value used by `if state==void or state.connection==void or host==void or source==void or msg==void then return error(6981,"packet event: missing input") end if`.
/// @param msg Record read through `msg.cursize`, `msg.readcount`, `msg.data`.
function packetEvent(state,host,source,msg)
  if state==void or state.connection==void or host==void or source==void or msg==void then return error(6981,"packet event: missing input") end if
  state.connection.realtime=state.realtime
  state.connection.lastPacketTime=state.realtime
  if isOob(msg) then
    if host.connectionlessHost==void then return error(6982,"packet event: missing connectionless host") end if
    clientConnectionless.dispatch(state.connection,host.connectionlessHost,source,msg)
    return "oob"
  end if
  if state.connection.connectionState<CA_CONNECTED then return "disconnected" end if
  if msg.cursize<4 then return "runt" end if
  if state.connection.channel==void or not clientConnectionless.addressEqual(source,state.connection.channel.remoteAddress,true) then return "wrongAddress" end if
  if host.processFn==void then return error(6983,"packet event: missing netchan process") end if
  if not host.processFn(host,state,msg) then return "rejected" end if
  headerBytes=msg.readcount
  state.serverMessageSequence=numeric.readI32(msg.data,0)
  state.connection.lastPacketTime=state.realtime
  if host.parseFn==void then return error(6984,"packet event: missing server-message parser") end if
  host.parseFn(host,state,msg)
  if state.demoRecording and not state.demoWaiting then
    if host.demoFn==void then return error(6985,"packet event: missing demo recorder") end if
    host.demoFn(host,state,msg,headerBytes)
  end if
  return "sequenced"
end function
