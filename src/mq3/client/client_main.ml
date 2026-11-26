// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native ownership/adapter for the client/cl_main.c outer client runtime.
package mq3.client.client_main

import std.string as strings
import mq3.client.demo as demo
import mq3.client.frame as clientFrame
import mq3.client.connectionless as connectionless
import mq3.client.network_ingress as networkIngress
import mq3.client.client_abi as clientAbi

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
/// Connection-state value for a completed handshake before game-state loading, defined for coordinating
/// connection, demo, and client lifecycle transitions.
const CA_CONNECTED=5
/// Client connection state while level media and game state are being loaded.
const CA_LOADING=6
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Connection-state value for normal gameplay after game-state loading, defined for coordinating
/// connection, demo, and client lifecycle transitions.
const CA_ACTIVE=8
/// Capacity limit for the reliable commands collection or bounded storage used by this client module.
const MAX_RELIABLE_COMMANDS=64
/// Capacity limit for the pingrequests collection or bounded storage used by this client module.
const MAX_PINGREQUESTS=32
/// Capacity limit for the serverstatusrequests collection or bounded storage used by this client
/// module.
const MAX_SERVERSTATUSREQUESTS=16
/// Maximum length of a protocol, command, or configuration string.
const MAX_STRING_CHARS=1024
/// Default UDP port used by a Quake game server.
const PORT_SERVER=27960
/// Connection-handshake retransmission interval in milliseconds.
const RETRANSMIT_TIMEOUT=clientAbi.RETRANSMIT_TIMEOUT
/// Required number of characters in the native product key.
const CDKEY_LEN=16
/// Number of characters in the product-key checksum suffix.
const CDCHKSUM_LEN=2

/// Stores client main queued engine action, including `kind`, `text`, `address`, `dispatched`.
struct Action
  /// Operation selector telling the host how to interpret a request emitted while processing client
  /// lifecycle, connection, demo, and console commands.
  kind
  /// Client host-operation text, including diagnostic messages, demo names, or outgoing connection
  /// command payloads.
  text
  /// When constructing this record, `emit` supplies `address` for this member.
  address
  /// True when this request is marked for native dispatch while processing client lifecycle,
  /// connection, demo, and console commands; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client main reliable record, including `sequence`, `acknowledge`, `commands`.
struct Reliable
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `CL_AddReliableCommand` and `CL_ChangeReliableCommand` during subsequent processing.
  sequence
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `CL_AddReliableCommand` during subsequent processing.
  acknowledge
  /// When constructing this record, `create` supplies `array(MAX_RELIABLE_COMMANDS,"")` for this
  /// member. Used by `CL_AddReliableCommand` and `CL_ChangeReliableCommand` during subsequent
  /// processing.
  commands
end struct
/// Stores client main ping record, including `address`, `start`, `time`, `info`.
struct Ping
  /// When constructing this record, `CL_GetFreePing` supplies an empty string for this member.
  address
  /// When constructing this record, `CL_GetFreePing` supplies `0` for this member.
  start
  /// Ping timing value used to record latency or completion of the browser request.
  time
  /// When constructing this record, `CL_GetFreePing` supplies an empty string for this member.
  info
end struct
/// Stores client main server info record, including `address`, `clients`, `hostName`, `mapName`, `maxClients`, `maxPing` and additional values.
struct ServerInfo
  /// When constructing this record, `CL_InitServerInfo` supplies `address` for this member.
  address
  /// Connected-client count parsed from the server information response.
  clients
  /// When constructing this record, `CL_InitServerInfo` supplies an empty string for this member.
  hostName
  /// Map name parsed from the server's information response for browser display.
  mapName
  /// Maximum player slots advertised or supported by the connected server.
  maxClients
  /// Maximum acceptable server-browser latency in milliseconds.
  maxPing
  /// When constructing this record, `CL_InitServerInfo` supplies `0` for this member.
  minPing
  /// Server latency in milliseconds recorded by the client server-list machinery.
  ping
  /// When constructing this record, `CL_InitServerInfo` supplies an empty string for this member.
  game
  /// When constructing this record, `CL_InitServerInfo` supplies `0` for this member.
  gameType
  /// When constructing this record, `CL_InitServerInfo` supplies `0` for this member.
  netType
  /// True when the record is eligible for the current drawing or browser-display pass.
  visible
end struct
/// Stores client main server status record, including `address`, `text`, `start`, `pending`, `retrieved`.
struct ServerStatus
  /// When constructing this record, `CL_ServerStatus` supplies `address` for this member.
  address
  /// Cached server-status reply returned to the browser after the status request completes.
  text
  /// When constructing this record, `CL_ServerStatus` supplies `state.lifecycle.realtime` for this
  /// member.
  start
  /// When constructing this record, `CL_ServerStatus` supplies `true` for this member.
  pending
  /// When constructing this record, `CL_ServerStatus` supplies `false` for this member.
  retrieved
end struct
/// Stores client main downloads record, including `queue`, `index`, `name`, `tempName`, `restarted`, `completed`.
struct Downloads
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `CL_NextDownload` and `CL_InitDownloads` during subsequent processing.
  queue
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_NextDownload`
  /// and `CL_InitDownloads` during subsequent processing.
  index
  /// Virtual filename of the package or file currently being downloaded.
  name
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `CL_BeginDownload` and `CL_DownloadsComplete` during subsequent processing.
  tempName
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `CL_DownloadsComplete` during subsequent processing.
  restarted
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `CL_BeginDownload` and `CL_InitDownloads` during subsequent processing.
  completed
end struct
/// Stores client main demo state record, including `recording`, `playing`, `file`, `name`, `nextDemo`, `serverMessageSequence` and additional values.
struct DemoState
  /// True while outgoing demo records are being written to the open recording file.
  recording
  /// True while the client is consuming a recorded demo instead of a live server connection.
  playing
  /// Open demo-recording handle passed to the host's write and close callbacks; absent before recording
  /// starts.
  file
  /// Virtual filename identifying the current demo recording or playback stream.
  name
  /// When constructing this record, `create` supplies an empty string for this member.
  nextDemo
  /// Highest server network-message sequence observed by the client.
  serverMessageSequence
  /// Current byte position retained for demo playback and reset when playback starts or completes.
  offset
end struct
/// Stores client main lifecycle record, including `initialized`, `state`, `renderer`, `sound`, `hunk`, `realtime` and additional values.
struct Lifecycle
  /// True between client startup and shutdown; guards duplicate lifecycle initialization and teardown.
  initialized
  /// When constructing this record, `create` supplies `CA_UNINITIALIZED` for this member. Used by
  /// `CL_Record_f` and `CL_PlayDemo_f` during subsequent processing.
  state
  /// Renderer implementation name reported by the graphics driver.
  renderer
  /// True while the client sound subsystem is initialized; cleared during sound shutdown or restart.
  sound
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `CL_StartHunkUsers` and `CL_Vid_Restart_f` during subsequent processing.
  hunk
  /// Local client lifecycle clock in milliseconds used by networking, demo playback, and fallback time
  /// queries.
  realtime
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_Frame` and
  /// `packets` during subsequent processing.
  framecount
  /// Client timestamp of the latest received server packet, used to detect timeouts.
  lastPacketTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_ClearState` and
  /// `CL_CheckTimeout` during subsequent processing.
  timeoutCount
  /// When constructing this record, `create` supplies `30` for this member. Used by `CL_CheckTimeout`
  /// during subsequent processing.
  timeoutSeconds
  /// True when a local game server is running in the same engine instance.
  serverRunning
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `CL_Vid_Restart_f` and `CL_ShutdownAll` during subsequent processing.
  uiStarted
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `CL_Vid_Restart_f` and `CL_ShutdownAll` during subsequent processing.
  cgameStarted
  /// Timestamp of the most recent connection attempt or handshake retransmission.
  connectTime
  /// Number of connection-handshake packets sent, also used by progress displays.
  connectPacketCount
end struct

// Platform-specific I/O remains explicit. The native state changes are always
// performed; actionFn is skipped when a retail QVM already owns the operation.
struct Host
  /// Host callback for the action operation; an unset callback leaves that host operation unavailable.
  actionFn
  /// Host callback for the milliseconds operation; an unset callback leaves that host operation
  /// unavailable.
  millisecondsFn
  /// Host callback for the alloc operation; an unset callback leaves that host operation unavailable.
  allocFn
  /// Host callback for the free operation; an unset callback leaves that host operation unavailable.
  freeFn
  /// Host callback for the read operation; an unset callback leaves that host operation unavailable.
  readFn
  /// Host callback for the write operation; an unset callback leaves that host operation unavailable.
  writeFn
  /// Host callback for the close operation; an unset callback leaves that host operation unavailable.
  closeFn
  /// Host callback for the exists operation; an unset callback leaves that host operation unavailable.
  existsFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for client connection and
  /// lifecycle commands.
  context
end struct
/// Creates a `mq3.client.client_main.Host` record. Initializes the record with the defaults written in this constructor.
function host() return Host(void,void,void,void,void,void,void,void,void) end function

/// Stores client main state, including `lifecycle`, `reliable`, `pings`, `servers`, `statuses`, `downloads` and additional values.
struct State
  /// When constructing this record, `create` supplies `life` for this member. Used by `now` and
  /// `CL_PacketEventLive` during subsequent processing.
  lifecycle
  /// When constructing this record, `create` supplies `reliable` for this member. Used by
  /// `CL_AddReliableCommand` and `CL_ChangeReliableCommand` during subsequent processing.
  reliable
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `CL_UpdateServerInfo` and `CL_GetPingQueueCount` during subsequent processing.
  pings
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `findServer` and `CL_SetServerInfoByAddress` during subsequent processing.
  servers
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `findStatus` and `CL_ServerStatus` during subsequent processing.
  statuses
  /// When constructing this record, `create` supplies `downloads` for this member. Used by
  /// `CL_BeginDownload` and `CL_NextDownload` during subsequent processing.
  downloads
  /// When constructing this record, `create` supplies `demos` for this member. Used by
  /// `CL_WriteDemoMessage` and `CL_StopRecord_f` during subsequent processing.
  demo
  /// Configuration-variable values exposed to the native UI implementation.
  cvars
  /// Server configuration strings indexed by the native protocol's configuration-string identifiers.
  configstrings
  /// Host requests queued while processing client lifecycle, connection, demo, and console commands,
  /// retained in request order.
  actions
  /// Display or connection name of the selected game server.
  serverName
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `CL_Reconnect_f` and `CL_Connect_f` during subsequent processing.
  reconnectName
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `CL_CheckForResend` and `CL_MapLoading` during subsequent processing.
  userinfo
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `CL_SendPureChecksums` during subsequent processing.
  pureChecksums
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `CL_OpenedPK3List_f` during subsequent processing.
  openedPaks
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `CL_ReferencedPK3List_f` during subsequent processing.
  referencedPaks
  /// True when the retail QVM owns client connection and lifecycle commands, so the native observer
  /// records requests without emitting duplicate host effects.
  retailActive
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `attachFrame` and `CL_CheckUserinfo` during subsequent processing.
  frameRuntime
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `attachFrame` and `CL_CheckUserinfo` during subsequent processing.
  frameHost
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `attachConnection` and `CL_CheckForResend` during subsequent processing.
  connectionRuntime
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `attachConnection` and `CL_CheckForResend` during subsequent processing.
  connectionHost
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `attachNetworkIngress` and `CL_PacketEventLive` during subsequent processing.
  packetRuntime
  /// Optional host attachment reserved for client packet handling; the client factory leaves it absent.
  packetHost
  /// Optional LAN-browser runtime attachment retained by the client state; the client factory leaves it
  /// absent.
  lanRuntime
end struct

/// Initializes the outer client lifecycle, reliable-command ring, server-browser collections, downloads and demo state.
function create()
  life=Lifecycle(false,CA_UNINITIALIZED,false,false,false,0,0,0,0,30,false,false,false,0,0)
  reliable=Reliable(0,0,array(MAX_RELIABLE_COMMANDS,""))
  downloads=Downloads([],0,"","",false,false)
  demos=DemoState(false,false,void,"","",0,0)
  return State(life,reliable,[],[],[],downloads,demos,[],array(1024,""),[],"","","","","","",false,void,void,void,void,void,void,void)
end function

/// Records a client action and invokes the host action callback only when the retail QVM does not own its dispatch.
/// @param state Mutable client main record/storage; this routine assigns `state.actions`.
/// @param services Record read through `services.actionFn`, `services.context`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param text Text consumed or emitted by `emit` in the client main path.
/// @param address Value used by `action=Action(kind,text,address,dispatched)`.
function emit(state,services,kind,text,address)
  dispatched=not state.retailActive;action=Action(kind,text,address,dispatched);state.actions=state.actions+[action]
  if dispatched and services!=void and services.actionFn!=void then services.actionFn(services.context,state,action) end if
  return action
end function
/// Reads the host millisecond clock when available, otherwise returns the lifecycle real-time clock.
/// @param state Record read through `state.lifecycle.realtime`.
/// @param services Record read through `services.millisecondsFn`, `services.context`.
function now(state,services) if services!=void and services.millisecondsFn!=void then return services.millisecondsFn(services.context) end if;return state.lifecycle.realtime end function
/// Truncates text to at most limit minus one bytes, preserving shorter strings.
/// @param text Text consumed or emitted by `clampText` in the client main path.
/// @param limit Upper limit applied while collecting or rendering the result.
function clampText(text,limit)
  raw=bytes(text);if len(raw)<limit then return text end if;result=bytes(limit-1,0);for i=0 to limit-2 result[i]=raw[i] end for;return decode(result)
end function
/// Converts ASCII uppercase bytes to lowercase while preserving all other text bytes.
/// @param text Text consumed or emitted by `lower` in the client main path.
function lower(text) r="";for each value in bytes(text) if value>=65 and value<=90 then value=value+32 end if;r=r+decode(bytes([value])) end for;return r end function
/// Compares endpoint strings after ASCII case folding.
/// @param a Value used by `return lower(a)==lower(b)`.
/// @param b Value used by `return lower(a)==lower(b)`.
function addressEqual(a,b) return lower(a)==lower(b) end function
/// Finds a key case-insensitively in a backslash-delimited Quake info string, returning an empty string when absent.
/// @param text Text consumed or emitted by `infoValue` in the client main path.
/// @param key Key or control identifier used to select the corresponding client main entry.
function infoValue(text,key)
  values=strings.split(text,"\\");i=1
  while i<len(values)-1 if lower(values[i])==lower(key) then return values[i+1] end if;i=i+2 end while
  return ""
end function
/// Parses an optional minus sign followed by decimal digits; empty or nonnumeric text yields zero.
/// @param text Text consumed or emitted by `toInt` in the client main path.
function toInt(text) raw=bytes(text);if len(raw)==0 then return 0 end if;sign=1;i=0;if raw[0]==45 then sign=-1;i=1 end if;value=0;while i<len(raw) if raw[i]<48 or raw[i]>57 then return 0 end if;value=value*10+raw[i]-48;i=i+1 end while;return value*sign end function
/// Converts a hexadecimal nibble to its lowercase ASCII digit code.
/// @param value Value tested by `value<10` before the calculation continues.
function hexDigit(value) if value<10 then return 48+value end if;return 87+value end function

/// Connects the outer client lifecycle to the client-frame runtime and its host callbacks.
/// @param state Mutable client main record/storage; this routine assigns `state.frameRuntime`, `state.frameHost`.
/// @param runtime Value assigned to `state.frameRuntime`.
/// @param services Value assigned to `state.frameHost`.
function attachFrame(state,runtime,services) state.frameRuntime=runtime;state.frameHost=services;return state end function
/// Installs the connectionless handshake state and host services used for retries and incoming handshakes.
/// @param state Mutable client main record/storage; this routine assigns `state.connectionRuntime`, `state.connectionHost`.
/// @param runtime Value assigned to `state.connectionRuntime`.
/// @param services Value assigned to `state.connectionHost`.
function attachConnection(state,runtime,services) state.connectionRuntime=runtime;state.connectionHost=services;return state end function
/// Installs the UDP packet-ingress runtime used by the live client packet entry point.
/// @param state Mutable client main record/storage; this routine assigns `state.packetRuntime`.
/// @param runtime Value assigned to `state.packetRuntime`.
function attachNetworkIngress(state,runtime) state.packetRuntime=runtime;return state end function
/// Synchronizes the incoming-packet clock and passes the datagram to live client ingress; rejects a missing ingress runtime.
/// @param state Record read through `state.packetRuntime`, `state.lifecycle.realtime`.
/// @param address Value used by `return networkIngress.clientPacket(state.packetRuntime,address,data)`.
/// @param data Value used by `return networkIngress.clientPacket(state.packetRuntime,address,data)`.
function CL_PacketEventLive(state,address,data)
  if state.packetRuntime==void then return error(7301,"client main: missing live network ingress") end if
  networkIngress.setRealtime(state.packetRuntime,state.lifecycle.realtime);return networkIngress.clientPacket(state.packetRuntime,address,data)
end function

/// Advances the reliable-command sequence and stores a bounded command in the 64-entry ring, rejecting an overflowed acknowledgement window.
/// @param state Mutable client main record/storage; this routine assigns `state.reliable.sequence`, `state.reliable.commands[index]`.
/// @param cmd Command text placed in the reliable ring; it is limited to MAX_STRING_CHARS minus one bytes.
function CL_AddReliableCommand(state,cmd)
  if state.reliable.sequence-state.reliable.acknowledge>MAX_RELIABLE_COMMANDS then return error(7300,"Client command overflow") end if
  state.reliable.sequence=state.reliable.sequence+1;index=state.reliable.sequence&(MAX_RELIABLE_COMMANDS-1);state.reliable.commands[index]=clampText(cmd,MAX_STRING_CHARS);return state.reliable.sequence
end function
/// Appends a newline to the most recent reliable command, shortening its text if necessary to retain the size bound.
/// @param state Mutable client main record/storage; this routine assigns `state.reliable.commands[index]`.
function CL_ChangeReliableCommand(state)
  index=state.reliable.sequence&(MAX_RELIABLE_COMMANDS-1);text=state.reliable.commands[index];if len(bytes(text))>=MAX_STRING_CHARS-1 then text=clampText(text,MAX_STRING_CHARS-1) end if;state.reliable.commands[index]=text+"\n";return state.reliable.commands[index]
end function

/// Encodes a demo record using the current server-message sequence and excludes the specified transport-header bytes.
/// @param state Record read through `state.demo.serverMessageSequence`.
/// @param messageData Argument 2 of `mq3.client.demo.encodeMessage`.
/// @param headerBytes Number of transport/header bytes preceding the recorded message payload. Forwarded to `mq3.client.demo.encodeMessage`.
function CL_WriteDemoMessage(state,messageData,headerBytes)
  return demo.encodeMessage(state.demo.serverMessageSequence,messageData,headerBytes)
end function
/// Writes the demo end marker and closes the host file when available, then clears recording state.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.file`, `state.demo.recording`.
/// @param services Record read through `services.writeFn`, `services.context`, `services.closeFn`.
function CL_StopRecord_f(state,services)
  if not state.demo.recording then emit(state,services,"print","Not recording a demo.\n","");return false end if
  if services!=void and services.writeFn!=void then services.writeFn(services.context,state.demo.file,demo.encodeEnd()) end if
  if services!=void and services.closeFn!=void then services.closeFn(services.context,state.demo.file) end if
  state.demo.file=void;state.demo.recording=false;emit(state,services,"print","Stopped demo.\n","");return true
end function
/// Adapts `mq3.client.demo.demoFilename` to client main `CL_DemoFilename`, returning its result for `number`.
/// @param number Argument 1 of `mq3.client.demo.demoFilename`.
function CL_DemoFilename(number) return demo.demoFilename(number) end function
/// Starts recording to the supplied file only while the client is active and no recording is already running.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.name`, `state.demo.file`, `state.demo.recording`.
/// @param services services record passed to the client main helper calls.
/// @param name Value assigned to `state.demo.name`.
/// @param file Already opened recording file handle passed to host write/close callbacks.
function CL_Record_f(state,services,name,file)
  if state.lifecycle.state!=CA_ACTIVE then emit(state,services,"print","You must be in a level to record.\n","");return false end if
  if state.demo.recording then emit(state,services,"print","Already recording.\n","");return false end if
  state.demo.name=name;state.demo.file=file;state.demo.recording=true;emit(state,services,"record",name,"");return true
end function
/// Ends demo playback, resets the read offset and dispatches the queued next-demo command when present.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.playing`, `state.demo.offset`.
/// @param services services record passed to the client main helper calls.
function CL_DemoCompleted(state,services)
  state.demo.playing=false;state.demo.offset=0;if state.demo.nextDemo!="" then CL_NextDemo(state,services) end if;return true
end function
/// Tries protocol-specific .dm_ file names in order and returns the first file accepted by the host existence callback.
/// @param state Accepted for compatibility with `CL_WalkDemoExt`; the current implementation does not read it.
/// @param services Record read through `services.existsFn`, `services.context`.
/// @param base Demo filename without the protocol-specific .dm_ extension.
/// @param protocols Protocol numbers tried in order when constructing .dm_ file extensions.
function CL_WalkDemoExt(state,services,base,protocols)
  for each protocol in protocols name=base+".dm_"+str(protocol);exists=false;if services!=void and services.existsFn!=void then exists=services.existsFn(services.context,name) end if;if exists then return name end if end for;return ""
end function
/// Marks a demo as playing, resets its offset and places the client in the connected state before emitting the playback action.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.playing`, `state.demo.name`, `state.demo.offset`, `state.lifecycle.state`.
/// @param services services record passed to the client main helper calls.
/// @param name Value assigned to `state.demo.name`.
/// @param data Value used by `return data`.
function CL_PlayDemo_f(state,services,name,data)
  state.demo.playing=true;state.demo.name=name;state.demo.offset=0;state.lifecycle.state=CA_CONNECTED;emit(state,services,"playdemo",name,"");return data
end function
/// Reads the next demo record and carries its offset, server sequence and completion status back into outer-client state.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.offset`, `state.demo.serverMessageSequence`, `state.demo.playing`.
/// @param data Value used by `result=demo.readDemoMessage(playback,data,state.lifecycle.realtime)`.
function CL_ReadDemoMessage(state,data)
  playback=demo.playback();playback.offset=state.demo.offset;playback.serverMessageSequence=state.demo.serverMessageSequence;result=demo.readDemoMessage(playback,data,state.lifecycle.realtime);state.demo.offset=playback.offset;state.demo.serverMessageSequence=playback.serverMessageSequence;if playback.completed then state.demo.playing=false end if;return result
end function
/// Queues the d1 command and immediately enters the next-demo path.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.nextDemo`.
/// @param services services record passed to the client main helper calls.
function CL_StartDemoLoop(state,services) state.demo.nextDemo="d1";return CL_NextDemo(state,services) end function
/// Consumes the pending next-demo command and queues it with a newline when nonempty.
/// @param state Mutable client main record/storage; this routine assigns `state.demo.nextDemo`.
/// @param services services record passed to the client main helper calls.
function CL_NextDemo(state,services) command=state.demo.nextDemo;state.demo.nextDemo="";if command!="" then emit(state,services,"command",command+"\n","") end if;return command end function

/// Accepts a disconnect only from the current server after three seconds without packets, then tears down the connection.
/// @param state Record read through `state.lifecycle.state`, `state.serverName`, `state.lifecycle.realtime`, `state.lifecycle.lastPacketTime`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `if state.lifecycle.state<CA_AUTHORIZING or not addressEqual(address,state.serverName) or state.lifecycle.realtime-state.lifecycle.lastPacketTi...`.
function CL_DisconnectPacket(state,services,address)
  if state.lifecycle.state<CA_AUTHORIZING or not addressEqual(address,state.serverName) or state.lifecycle.realtime-state.lifecycle.lastPacketTime<3000 then return false end if
  emit(state,services,"print","Server disconnected for unknown reason\n",address);CL_Disconnect(state,services,true);return true
end function
/// Runs the configured connectionless retry state machine or sends a timed getchallenge/connect retry from outer-client state.
/// @param state Mutable client main record/storage; this routine assigns `state.connectionRuntime.realtime`, `state.lifecycle.state`, `state.lifecycle.connectTime`, `state.lifecycle.connectPacketCount`.
/// @param services services record passed to the client main helper calls.
function CL_CheckForResend(state,services)
  if state.connectionRuntime!=void and state.connectionHost!=void then
    state.connectionRuntime.realtime=state.lifecycle.realtime;result=connectionless.checkForResend(state.connectionRuntime,state.connectionHost);state.lifecycle.state=state.connectionRuntime.connectionState;return result
  end if
  if state.demo.playing or (state.lifecycle.state!=CA_CONNECTING and state.lifecycle.state!=CA_CHALLENGING) then return false end if
  if state.lifecycle.realtime-state.lifecycle.connectTime<RETRANSMIT_TIMEOUT then return false end if
  state.lifecycle.connectTime=state.lifecycle.realtime;state.lifecycle.connectPacketCount=state.lifecycle.connectPacketCount+1
  if state.lifecycle.state==CA_CONNECTING then emit(state,services,"oob","getchallenge",state.serverName) else emit(state,services,"oob","connect \""+state.userinfo+"\"",state.serverName) end if;return true
end function
/// Dispatches connectionless handshake, server-browser, status, MOTD, print and disconnect commands and reports the recognized command name.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.state`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `if name=="disconnect" then CL_DisconnectPacket(state,services,address)`.
/// @param command Value used by `name=lower(command)`.
/// @param payload Value used by `if name=="inforesponse" then CL_ServerInfoPacket(state,services,address,payload)`.
function CL_ConnectionlessPacket(state,services,address,command,payload)
  name=lower(command)
  if name=="disconnect" then CL_DisconnectPacket(state,services,address);return "disconnect" end if
  if name=="inforesponse" then CL_ServerInfoPacket(state,services,address,payload);return "infoResponse" end if
  if name=="statusresponse" then CL_ServerStatusResponse(state,services,address,payload);return "statusResponse" end if
  if name=="getserversresponse" then CL_ServersResponsePacket(state,services,payload);return "getserversResponse" end if
  if name=="motd" then CL_MotdPacket(state,services,address,payload);return "motd" end if
  if name=="challengeresponse" and state.lifecycle.state==CA_CONNECTING then state.lifecycle.state=CA_CHALLENGING;emit(state,services,"challenge",payload,address);return "challengeResponse" end if
  if name=="connectresponse" and state.lifecycle.state==CA_CHALLENGING and addressEqual(address,state.serverName) then state.lifecycle.state=CA_CONNECTED;return "connectResponse" end if
  if name=="print" then emit(state,services,"print",payload,address);return "print" end if
  return "unknown"
end function
/// Refreshes the last-packet timestamp and routes a packet either to connectionless dispatch or the sequenced-message action.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.lastPacketTime`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if`.
/// @param command Value used by `if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if`.
/// @param payload Value used by `if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if`.
function CL_PacketEvent(state,services,address,command,payload)
  state.lifecycle.lastPacketTime=state.lifecycle.realtime;if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if;emit(state,services,"sequenced",payload,address);return "sequenced"
end function

/// Clears configstrings, reliable commands, timeout history and the demo server-message sequence.
/// @param state Mutable client main record/storage; this routine assigns `state.configstrings`, `state.reliable`, `state.lifecycle.timeoutCount`, `state.demo.serverMessageSequence`.
function CL_ClearState(state)
  state.configstrings=array(1024,"");state.reliable=Reliable(0,0,array(MAX_RELIABLE_COMMANDS,""));state.lifecycle.timeoutCount=0;state.demo.serverMessageSequence=0;return state
end function
/// Stops recording, queues a disconnect for a connected server, clears transient state and optionally opens the main menu.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.state`, `state.serverName`.
/// @param services services record passed to the client main helper calls.
/// @param showMainMenu Whether disconnecting also queues the main-menu action.
function CL_Disconnect(state,services,showMainMenu)
  if state.demo.recording then CL_StopRecord_f(state,services) end if
  if state.lifecycle.state>=CA_CONNECTED then CL_AddReliableCommand(state,"disconnect");emit(state,services,"send","disconnect",state.serverName) end if
  CL_ClearState(state);state.lifecycle.state=CA_DISCONNECTED;state.serverName="";if showMainMenu then emit(state,services,"menu","main","") end if;return true
end function
/// Reuses the matching connected map or disconnects and prepares a localhost challenge for the requested map.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.state`, `state.lifecycle.lastPacketTime`, `state.serverName`, `state.userinfo`.
/// @param services services record passed to the client main helper calls.
/// @param mapName Map name used to select the level and its associated assets.
function CL_MapLoading(state,services,mapName)
  if state.lifecycle.state>=CA_CONNECTED and infoValue(state.userinfo,"mapname")==mapName then state.lifecycle.state=CA_CONNECTED;state.lifecycle.lastPacketTime=state.lifecycle.realtime;return "reuse" end if
  CL_Disconnect(state,services,false);state.serverName="localhost";state.lifecycle.state=CA_CHALLENGING;state.userinfo="\\mapname\\"+mapName;return "localhost"
end function
/// Queues and emits a reliable command only while connected, ignoring empty text and key-release commands beginning with a minus sign.
/// @param state Record read through `state.lifecycle.state`, `state.serverName`.
/// @param services services record passed to the client main helper calls.
/// @param command Command text; empty strings and key-release commands beginning with a minus sign are ignored.
function CL_ForwardCommandToServer(state,services,command)
  if state.lifecycle.state<CA_CONNECTED or command=="" or bytes(command)[0]==45 then return false end if;CL_AddReliableCommand(state,command);emit(state,services,"reliable",command,state.serverName);return true
end function
/// Adapts `mq3.client.client_main.CL_ForwardCommandToServer` to client main `CL_ForwardToServer_f`, returning its result for `state, services, args`.
/// @param state Argument 1 of `mq3.client.client_main.CL_ForwardCommandToServer`.
/// @param services Argument 2 of `mq3.client.client_main.CL_ForwardCommandToServer`.
/// @param args Argument 3 of `mq3.client.client_main.CL_ForwardCommandToServer`.
function CL_ForwardToServer_f(state,services,args) return CL_ForwardCommandToServer(state,services,args) end function
/// Emits a host environment-variable assignment as name=value.
/// @param state Shared client main state passed to the helper calls in `CL_Setenv_f`.
/// @param services services record passed to the client main helper calls.
/// @param name Name used to select or register the corresponding client main resource.
/// @param value Value used by `emit(state,services,"setenv",name+"="+value,"")`.
function CL_Setenv_f(state,services,name,value) emit(state,services,"setenv",name+"="+value,"");return true end function
/// Adapts `mq3.client.client_main.CL_Disconnect` to client main `CL_Disconnect_f`, returning its result for `state, services, true`.
/// @param state Argument 1 of `mq3.client.client_main.CL_Disconnect`.
/// @param services Argument 2 of `mq3.client.client_main.CL_Disconnect`.
function CL_Disconnect_f(state,services) return CL_Disconnect(state,services,true) end function
/// Starts a new connection to the stored reconnect address, or returns false if no address was saved.
/// @param state Record read through `state.reconnectName`.
/// @param services services record passed to the client main helper calls.
function CL_Reconnect_f(state,services)
  if state.reconnectName=="" then return false end if;return CL_Connect_f(state,services,state.reconnectName)
end function
/// Disconnects the current session and initializes an immediate challenge retry for the new nonempty server address.
/// @param state Mutable client main record/storage; this routine assigns `state.serverName`, `state.reconnectName`, `state.lifecycle.state`, `state.lifecycle.connectTime` and additional values.
/// @param services services record passed to the client main helper calls.
/// @param address Server endpoint saved as both the current target and the future reconnect address.
function CL_Connect_f(state,services,address)
  if address=="" then return false end if;CL_Disconnect(state,services,false);state.serverName=address;state.reconnectName=address;state.lifecycle.state=CA_CONNECTING;state.lifecycle.connectTime=-99999;state.lifecycle.connectPacketCount=0;emit(state,services,"connect",address,address);return true
end function
/// Emits an out-of-band rcon request to the explicit or current server, requiring both a target and a password.
/// @param state Record read through `state.serverName`.
/// @param services services record passed to the client main helper calls.
/// @param password Server rcon password included in the outgoing command; an empty password cancels the request.
/// @param command Value used by `emit(state,services,"oob","rcon "+password+" "+command,target)`.
/// @param address Explicit rcon target; an empty string selects the current server.
function CL_Rcon_f(state,services,password,command,address)
  target=address;if target=="" then target=state.serverName end if;if target=="" or password=="" then return false end if;emit(state,services,"oob","rcon "+password+" "+command,target);return true
end function
/// Replaces the userinfo model/headmodel entries and emits the resulting userinfo string.
/// @param state Mutable client main record/storage; this routine assigns `state.userinfo`.
/// @param services services record passed to the client main helper calls.
/// @param model Model handle, asset or preview record used by this client main operation.
/// @param headmodel Value used by `state.userinfo="\\model\\"+model+"\\headmodel\\"+headmodel`.
function CL_SetModel_f(state,services,model,headmodel) state.userinfo="\\model\\"+model+"\\headmodel\\"+headmodel;emit(state,services,"userinfo",state.userinfo,"");return true end function

/// Adapts `mq3.client.client_main.emit` to client main `CL_RefPrintf`, returning its result for `state, services, "refprint", str(level)+":"+text, ""`.
/// @param state Argument 1 of `mq3.client.client_main.emit`.
/// @param services Argument 2 of `mq3.client.client_main.emit`.
/// @param level Argument 4 of `mq3.client.client_main.emit`; passed as `str(level)+":"+text`.
/// @param text Argument 4 of `mq3.client.client_main.emit`; passed as `str(level)+":"+text`.
function CL_RefPrintf(state,services,level,text) return emit(state,services,"refprint",str(level)+":"+text,"") end function
/// Allocates renderer storage through the host allocator when supplied, otherwise creates a zero-filled byte buffer.
/// @param state Accepted for compatibility with `CL_RefMalloc`; the current implementation does not read it.
/// @param services Record read through `services.allocFn`, `services.context`.
/// @param size Value used by `if services!=void and services.allocFn!=void then return services.allocFn(services.context,size) end if`.
function CL_RefMalloc(state,services,size) if services!=void and services.allocFn!=void then return services.allocFn(services.context,size) end if;return bytes(size,0) end function
/// Marks the renderer initialized and emits its initialization action.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.renderer`.
/// @param services services record passed to the client main helper calls.
function CL_InitRef(state,services) state.lifecycle.renderer=true;emit(state,services,"renderer-init","","");return true end function
/// Emits renderer shutdown when it was active and clears its initialized flag.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.renderer`.
/// @param services services record passed to the client main helper calls.
function CL_ShutdownRef(state,services) if state.lifecycle.renderer then emit(state,services,"renderer-shutdown","","") end if;state.lifecycle.renderer=false;return true end function
/// Initializes the renderer if necessary and emits the renderer-registration action.
/// @param state Record read through `state.lifecycle.renderer`.
/// @param services services record passed to the client main helper calls.
function CL_InitRenderer(state,services) if not state.lifecycle.renderer then CL_InitRef(state,services) end if;emit(state,services,"renderer-register","","");return true end function
/// Starts renderer and sound users once when the client hunk is not yet active.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.hunk`, `state.lifecycle.sound`.
/// @param services services record passed to the client main helper calls.
function CL_StartHunkUsers(state,services)
  if not state.lifecycle.hunk then state.lifecycle.hunk=true;CL_InitRenderer(state,services);state.lifecycle.sound=true;emit(state,services,"sound-init","","") end if;return true
end function
/// Clears UI/cgame startup flags, shuts down the renderer, clears the hunk and restarts hunk users.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.uiStarted`, `state.lifecycle.cgameStarted`, `state.lifecycle.hunk`.
/// @param services services record passed to the client main helper calls.
function CL_Vid_Restart_f(state,services)
  state.lifecycle.uiStarted=false;state.lifecycle.cgameStarted=false;CL_ShutdownRef(state,services);emit(state,services,"hunk-clear","","");state.lifecycle.hunk=false;return CL_StartHunkUsers(state,services)
end function
/// Emits sound shutdown followed by sound initialization and restores the sound-active flag.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.sound`.
/// @param services services record passed to the client main helper calls.
function CL_Snd_Restart_f(state,services) emit(state,services,"sound-shutdown","","");state.lifecycle.sound=false;emit(state,services,"sound-init","","");state.lifecycle.sound=true;return true end function
/// Clears cgame/UI ownership and shuts down renderer, sound and hunk lifecycle state.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.cgameStarted`, `state.lifecycle.uiStarted`, `state.lifecycle.sound`, `state.lifecycle.hunk`.
/// @param services services record passed to the client main helper calls.
function CL_ShutdownAll(state,services) state.lifecycle.cgameStarted=false;state.lifecycle.uiStarted=false;CL_ShutdownRef(state,services);state.lifecycle.sound=false;state.lifecycle.hunk=false;return true end function
/// Shuts down hunk users, emits the hunk-clear action and restarts the renderer/sound users.
/// @param state Shared client main state passed to the helper calls in `CL_FlushMemory`.
/// @param services services record passed to the client main helper calls.
function CL_FlushMemory(state,services) CL_ShutdownAll(state,services);emit(state,services,"hunk-clear","","");return CL_StartHunkUsers(state,services) end function
/// Initializes the client once, enters the disconnected state and starts its hunk users.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.initialized`, `state.lifecycle.state`.
/// @param services services record passed to the client main helper calls.
function CL_Init(state,services)
  if state.lifecycle.initialized then return false end if;state.lifecycle.initialized=true;state.lifecycle.state=CA_DISCONNECTED;emit(state,services,"client-init","","");CL_StartHunkUsers(state,services);return true
end function
/// Disconnects and releases an initialized client, then returns it to the uninitialized state.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.initialized`, `state.lifecycle.state`.
/// @param services services record passed to the client main helper calls.
function CL_Shutdown(state,services)
  if not state.lifecycle.initialized then return false end if;CL_Disconnect(state,services,false);CL_ShutdownAll(state,services);state.lifecycle.initialized=false;state.lifecycle.state=CA_UNINITIALIZED;emit(state,services,"client-shutdown","","");return true
end function
/// Reports whether the outer client is in the disconnected state.
/// @param state Record read through `state.lifecycle.state`.
function CL_CDDialog(state) return state.lifecycle.state==CA_DISCONNECTED end function
/// Multiplies the selected millisecond clock by the requested time scale.
/// @param state Shared client main state passed to the helper calls in `CL_ScaledMilliseconds`.
/// @param services services record passed to the client main helper calls.
/// @param timeScale Multiplier applied to the selected millisecond clock.
function CL_ScaledMilliseconds(state,services,timeScale) return now(state,services)*timeScale end function
/// Delegates to the attached frame runtime or forwards modified userinfo once the handshake has reached challenging state.
/// @param state Mutable client main record/storage; this routine assigns `state.frameRuntime.state`.
/// @param services services record passed to the client main helper calls.
/// @param modified Value used by `if not modified or state.lifecycle.state<CA_CHALLENGING then return false end if`.
function CL_CheckUserinfo(state,services,modified)
  if state.frameRuntime!=void and state.frameHost!=void then state.frameRuntime.state=state.lifecycle.state;return clientFrame.checkUserinfo(state.frameRuntime,state.frameHost) end if
  if not modified or state.lifecycle.state<CA_CHALLENGING then return false end if;return CL_ForwardCommandToServer(state,services,"userinfo \""+state.userinfo+"\"")
end function
/// Checks the attached frame runtime or counts consecutive server timeouts, disconnecting after more than five overdue checks.
/// @param state Mutable client main record/storage; this routine assigns `state.frameRuntime.state`, `state.frameRuntime.realtime`, `state.frameRuntime.lastPacketTime`, `state.lifecycle.timeoutCount`.
/// @param services services record passed to the client main helper calls.
function CL_CheckTimeout(state,services)
  if state.frameRuntime!=void and state.frameHost!=void then state.frameRuntime.state=state.lifecycle.state;state.frameRuntime.realtime=state.lifecycle.realtime;state.frameRuntime.lastPacketTime=state.lifecycle.lastPacketTime;result=clientFrame.checkTimeout(state.frameRuntime,state.frameHost);state.lifecycle.timeoutCount=state.frameRuntime.timeoutCount;return result end if
  timedOut=state.lifecycle.state>=CA_CONNECTED and state.lifecycle.realtime-state.lifecycle.lastPacketTime>state.lifecycle.timeoutSeconds*1000
  if timedOut then state.lifecycle.timeoutCount=state.lifecycle.timeoutCount+1;if state.lifecycle.timeoutCount>5 then CL_Disconnect(state,services,true);return true end if else state.lifecycle.timeoutCount=0 end if;return false
end function
/// Advances an initialized client frame, synchronizing the attached frame runtime or running timeout, retry and send-command actions.
/// @param state Mutable client main record/storage; this routine assigns `state.lifecycle.realtime`, `state.lifecycle.framecount`, `state.lifecycle.state`.
/// @param services services record passed to the client main helper calls.
/// @param msec Time interval in milliseconds.
function CL_Frame(state,services,msec)
  if not state.lifecycle.initialized then return "not-running" end if
  if state.frameRuntime!=void and state.frameHost!=void then result=clientFrame.run(state.frameRuntime,msec,state.frameHost);state.lifecycle.realtime=state.frameRuntime.realtime;state.lifecycle.framecount=state.frameRuntime.framecount;state.lifecycle.state=state.frameRuntime.state;return result end if
  state.lifecycle.realtime=state.lifecycle.realtime+msec;CL_CheckTimeout(state,services);CL_CheckForResend(state,services);emit(state,services,"send-cmd","",state.serverName);state.lifecycle.framecount=state.lifecycle.framecount+1;return "frame"
end function

/// Sets local and temporary download names, clears completion and emits a remote download command.
/// @param state Mutable client main record/storage; this routine assigns `state.downloads.name`, `state.downloads.tempName`, `state.downloads.completed`.
/// @param services services record passed to the client main helper calls.
/// @param localName Value assigned to `state.downloads.name`, `state.downloads.tempName`.
/// @param remoteName Value used by `emit(state,services,"download","download "+remoteName,state.serverName)`.
function CL_BeginDownload(state,services,localName,remoteName)
  state.downloads.name=localName;state.downloads.tempName=localName+".tmp";state.downloads.completed=false;emit(state,services,"download","download "+remoteName,state.serverName);return state.downloads.tempName
end function
/// Starts the next queued download or finalizes the download session when the queue is exhausted.
/// @param state Mutable client main record/storage; this routine assigns `state.downloads.index`.
/// @param services services record passed to the client main helper calls.
function CL_NextDownload(state,services)
  if state.downloads.index>=len(state.downloads.queue) then return CL_DownloadsComplete(state,services) end if
  remote=state.downloads.queue[state.downloads.index];state.downloads.index=state.downloads.index+1;return CL_BeginDownload(state,services,remote,remote)
end function
/// Replaces and rewinds the download queue, then starts its first item or completes an empty queue.
/// @param state Mutable client main record/storage; this routine assigns `state.downloads.queue`, `state.downloads.index`, `state.downloads.completed`.
/// @param services services record passed to the client main helper calls.
/// @param downloads Mutable client main record/storage; this routine assigns `downloads.queue`, `downloads.index`, `downloads.completed`.
function CL_InitDownloads(state,services,downloads)
  state.downloads.queue=downloads;state.downloads.index=0;state.downloads.completed=false;if len(downloads)==0 then return CL_DownloadsComplete(state,services) end if;return CL_NextDownload(state,services)
end function
/// Clears active download names, marks completion and performs a pending filesystem restart.
/// @param state Mutable client main record/storage; this routine assigns `state.downloads.completed`, `state.downloads.name`, `state.downloads.tempName`, `state.downloads.restarted`.
/// @param services services record passed to the client main helper calls.
function CL_DownloadsComplete(state,services)
  state.downloads.completed=true;state.downloads.name="";state.downloads.tempName="";if state.downloads.restarted then emit(state,services,"filesystem-restart","","");state.downloads.restarted=false end if;return true
end function

/// Creates a visible server-browser record with unknown ping and empty descriptive fields.
/// @param address Value used to initialize `ServerInfo.address`.
function CL_InitServerInfo(address) return ServerInfo(address,0,"","",0,0,0,-1,"",0,0,true) end function
/// Parses nonempty server info into browser fields and always updates the supplied ping value.
/// @param server Mutable client main record/storage; this routine assigns `server.clients`, `server.hostName`, `server.mapName`, `server.maxClients` and additional values.
/// @param infoText Value used by `if infoText!="" then server.clients=toInt(infoValue(infoText,"clients"))`.
/// @param ping Value assigned to `server.ping`.
function CL_SetServerInfo(server,infoText,ping)
  if infoText!="" then server.clients=toInt(infoValue(infoText,"clients"));server.hostName=infoValue(infoText,"hostname");server.mapName=infoValue(infoText,"mapname");server.maxClients=toInt(infoValue(infoText,"sv_maxclients"));server.game=infoValue(infoText,"game");server.gameType=toInt(infoValue(infoText,"gametype"));server.netType=toInt(infoValue(infoText,"nettype"));server.minPing=toInt(infoValue(infoText,"minping"));server.maxPing=toInt(infoValue(infoText,"maxping")) end if
  server.ping=ping;return server
end function
/// Finds a server-browser entry by case-insensitive endpoint, returning its index or minus one.
/// @param state Record read through `state.servers`.
/// @param address Value used by `if len(state.servers)>0 then for i=0 to len(state.servers)-1 if addressEqual(state.servers[i].address,address) then return i end if end for en...`.
function findServer(state,address) if len(state.servers)>0 then for i=0 to len(state.servers)-1 if addressEqual(state.servers[i].address,address) then return i end if end for end if;return -1 end function
/// Creates a missing server-browser entry and updates its info string and ping.
/// @param state Mutable client main record/storage; this routine assigns `state.servers`.
/// @param address Value used by `index=findServer(state,address)`.
/// @param infoText Value used by `return CL_SetServerInfo(state.servers[index],infoText,ping)`.
/// @param ping Value used by `return CL_SetServerInfo(state.servers[index],infoText,ping)`.
function CL_SetServerInfoByAddress(state,address,infoText,ping)
  index=findServer(state,address);if index<0 then server=CL_InitServerInfo(address);state.servers=state.servers+[server];index=len(state.servers)-1 end if;return CL_SetServerInfo(state.servers[index],infoText,ping)
end function
/// Copies a valid ping slot's address, info and latency into the server browser.
/// @param state Record read through `state.pings`.
/// @param n Value tested by `n<0 or n>=len(state.pings)` before the calculation continues.
function CL_UpdateServerInfo(state,n) if n<0 or n>=len(state.pings) then return false end if;p=state.pings[n];CL_SetServerInfoByAddress(state,p.address,p.info,p.time);return true end function
/// Updates the browser entry for an info response and emits the server-info action.
/// @param state Shared client main state passed to the helper calls in `CL_ServerInfoPacket`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `CL_SetServerInfoByAddress(state,address,infoText,0)`.
/// @param infoText Value used by `CL_SetServerInfoByAddress(state,address,infoText,0)`.
function CL_ServerInfoPacket(state,services,address,infoText) CL_SetServerInfoByAddress(state,address,infoText,0);emit(state,services,"server-info",infoText,address);return true end function
/// Adds previously unseen master-server addresses and reports how many entries were inserted.
/// @param state Mutable client main record/storage; this routine assigns `state.servers`.
/// @param services services record passed to the client main helper calls.
/// @param addresses Value used by `for each address in addresses if findServer(state,address)<0 then state.servers=state.servers+[CL_InitServerInfo(address)]`.
function CL_ServersResponsePacket(state,services,addresses)
  added=0;for each address in addresses if findServer(state,address)<0 then state.servers=state.servers+[CL_InitServerInfo(address)];added=added+1 end if end for;emit(state,services,"servers-response",str(added),"");return added
end function
/// Clears the browser and sends two getinfo broadcasts to each of four consecutive default server ports.
/// @param state Mutable client main record/storage; this routine assigns `state.servers`.
/// @param services services record passed to the client main helper calls.
function CL_LocalServers_f(state,services) state.servers=[];for port=PORT_SERVER to PORT_SERVER+3 emit(state,services,"broadcast","getinfo xxx","255.255.255.255:"+str(port));emit(state,services,"broadcast","getinfo xxx","255.255.255.255:"+str(port)) end for;return 8 end function
/// Clears the browser and emits a protocol/keyword getservers query to the selected master server.
/// @param state Mutable client main record/storage; this routine assigns `state.servers`.
/// @param services services record passed to the client main helper calls.
/// @param master Value used by `emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master)`.
/// @param protocol Value used by `emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master)`.
/// @param keywords Value used by `emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master)`.
function CL_GlobalServers_f(state,services,master,protocol,keywords) state.servers=[];emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master);return true end function

/// Counts ping slots whose address has not been cleared.
/// @param state Record read through `state.pings`.
function CL_GetPingQueueCount(state) count=0;for each ping in state.pings if ping.address!="" then count=count+1 end if end for;return count end function
/// Allocates a ping slot up to MAX_PINGREQUESTS, then reuses an empty, expired or oldest slot.
/// @param state Mutable client main record/storage; this routine assigns `state.pings`.
function CL_GetFreePing(state)
  if len(state.pings)<MAX_PINGREQUESTS then state.pings=state.pings+[Ping("",0,0,"")];return len(state.pings)-1 end if
  best=0;oldest=-2147483648;for i=0 to len(state.pings)-1 p=state.pings[i];if p.address=="" or (p.time==0 and state.lifecycle.realtime-p.start>=500) or p.time>=500 then p.address="";return i end if;age=state.lifecycle.realtime-p.start;if age>oldest then oldest=age;best=i end if end for;return best
end function
/// Clears the address of a valid ping slot and returns whether that slot existed.
/// @param state Mutable client main record/storage; this routine assigns `state.pings[n].address`.
/// @param n Value tested by `n>=0 and n<len(state.pings)` before the calculation continues.
function CL_ClearPing(state,n) if n>=0 and n<len(state.pings) then state.pings[n].address="";return true end if;return false end function
/// Returns a ping slot's address/latency pair, treating overdue unanswered requests as elapsed-time pings.
/// @param state Record read through `state.pings`, `state.lifecycle.realtime`.
/// @param n Zero-based ping slot; invalid or cleared slots return an empty address and zero time.
/// @param maxPing Unanswered-request timeout in milliseconds, clamped to at least 100.
function CL_GetPing(state,n,maxPing)
  if n<0 or n>=len(state.pings) or state.pings[n].address=="" then return ["",0] end if;p=state.pings[n];time=p.time;if time==0 then elapsed=state.lifecycle.realtime-p.start;if maxPing<100 then maxPing=100 end if;if elapsed>=maxPing then time=elapsed end if end if;CL_SetServerInfoByAddress(state,p.address,p.info,p.time);return [p.address,time]
end function
/// Returns a valid active ping slot's info string, or an empty string for an invalid/cleared slot.
/// @param state Record read through `state.pings`.
/// @param n Value tested by `n<0 or n>=len(state.pings) or state.pings[n].address==""` before the calculation continues.
function CL_GetPingInfo(state,n) if n<0 or n>=len(state.pings) or state.pings[n].address=="" then return "" end if;return state.pings[n].info end function
/// Initializes a ping slot at the current time and emits a getinfo request to its address.
/// @param state Mutable client main record/storage; this routine assigns `state.pings[index]`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `state.pings[index]=Ping(address,state.lifecycle.realtime,0,"")`.
function CL_Ping_f(state,services,address)
  index=CL_GetFreePing(state);state.pings[index]=Ping(address,state.lifecycle.realtime,0,"");emit(state,services,"oob","getinfo xxx",address);return index
end function
/// Starts requests for visible servers with unknown ping until the ping queue is full.
/// @param state Record read through `state.servers`.
/// @param services services record passed to the client main helper calls.
/// @param maxPing Accepted for compatibility with `CL_UpdateVisiblePings_f`; the current implementation does not read it.
function CL_UpdateVisiblePings_f(state,services,maxPing)
  active=false;for each server in state.servers if server.visible and server.ping==-1 then CL_Ping_f(state,services,server.address);active=true;if CL_GetPingQueueCount(state)>=MAX_PINGREQUESTS then break end if end if end for;return active
end function

/// Finds a cached server-status request by case-insensitive endpoint, returning its index or minus one.
/// @param state Record read through `state.statuses`.
/// @param address Value used by `if len(state.statuses)>0 then for i=0 to len(state.statuses)-1 if addressEqual(state.statuses[i].address,address) then return i end if end for...`.
function findStatus(state,address) if len(state.statuses)>0 then for i=0 to len(state.statuses)-1 if addressEqual(state.statuses[i].address,address) then return i end if end for end if;return -1 end function
/// Returns cached status text when available, otherwise starts or retransmits a timed getstatus request.
/// @param state Mutable client main record/storage; this routine assigns `state.statuses`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `index=findStatus(state,address)`.
/// @param resendTime Minimum interval in milliseconds before retransmitting an unanswered status request.
function CL_ServerStatus(state,services,address,resendTime)
  index=findStatus(state,address);if index<0 then state.statuses=state.statuses+[ServerStatus(address,"",state.lifecycle.realtime,true,false)];emit(state,services,"oob","getstatus",address);return "" end if;s=state.statuses[index];if s.text!="" then s.retrieved=true;return s.text end if;if s.start<state.lifecycle.realtime-resendTime then s.start=state.lifecycle.realtime;emit(state,services,"oob","getstatus",address) end if;return ""
end function
/// Returns cached status text for the address, or an empty string when no request entry exists.
/// @param state Record read through `state.statuses`.
/// @param address Value used by `index=findStatus(state,address)`.
function CL_GetServerStatus(state,address) index=findStatus(state,address);if index<0 then return "" end if;return state.statuses[index].text end function
/// Creates or updates a status response, clears its pending flag and emits a server-status action.
/// @param state Mutable client main record/storage; this routine assigns `state.statuses`, `state.statuses[index].text`, `state.statuses[index].pending`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `index=findStatus(state,address)`.
/// @param text Text consumed or emitted by `CL_ServerStatusResponse` in the client main path.
function CL_ServerStatusResponse(state,services,address,text)
  index=findStatus(state,address);if index<0 then state.statuses=state.statuses+[ServerStatus(address,text,state.lifecycle.realtime,false,false)] else state.statuses[index].text=text;state.statuses[index].pending=false end if;emit(state,services,"server-status",text,address);return true
end function
/// Queries server status with a 750-millisecond retransmission interval.
/// @param state Argument 1 of `mq3.client.client_main.CL_ServerStatus`.
/// @param services Argument 2 of `mq3.client.client_main.CL_ServerStatus`.
/// @param address Argument 3 of `mq3.client.client_main.CL_ServerStatus`.
function CL_ServerStatus_f(state,services,address) return CL_ServerStatus(state,services,address,750) end function
/// Records the received message-of-the-day text as an action and returns that text.
/// @param state Shared client main state passed to the helper calls in `CL_MotdPacket`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `emit(state,services,"motd",text,address)`.
/// @param text Text consumed or emitted by `CL_MotdPacket` in the client main path.
function CL_MotdPacket(state,services,address,text) emit(state,services,"motd",text,address);return text end function

/// Forwards the current package checksums in a reliable cp command.
/// @param state Record read through `state.pureChecksums`.
/// @param services Argument 2 of `mq3.client.client_main.CL_ForwardCommandToServer`.
function CL_SendPureChecksums(state,services) return CL_ForwardCommandToServer(state,services,"cp "+state.pureChecksums) end function
/// Forwards the reliable vdr command to reset server-side pure-client verification.
/// @param state Argument 1 of `mq3.client.client_main.CL_ForwardCommandToServer`.
/// @param services Argument 2 of `mq3.client.client_main.CL_ForwardCommandToServer`.
function CL_ResetPureClientAtServer(state,services) return CL_ForwardCommandToServer(state,services,"vdr") end function
/// Emits the opened-package list with a trailing newline and returns the list text.
/// @param state Record read through `state.openedPaks`.
/// @param services services record passed to the client main helper calls.
function CL_OpenedPK3List_f(state,services) emit(state,services,"print",state.openedPaks+"\n","");return state.openedPaks end function
/// Emits the referenced-package list with a trailing newline and returns the list text.
/// @param state Record read through `state.referencedPaks`.
/// @param services services record passed to the client main helper calls.
function CL_ReferencedPK3List_f(state,services) emit(state,services,"print",state.referencedPaks+"\n","");return state.referencedPaks end function
/// Sends an out-of-band getmotd request carrying the supplied challenge.
/// @param state Shared client main state passed to the helper calls in `CL_RequestMotd`.
/// @param services services record passed to the client main helper calls.
/// @param address Value used by `emit(state,services,"oob","getmotd "+challenge,address)`.
/// @param challenge Value used by `emit(state,services,"oob","getmotd "+challenge,address)`.
function CL_RequestMotd(state,services,address,challenge) emit(state,services,"oob","getmotd "+challenge,address);return true end function
/// Returns the number of supplied local addresses; this adapter does not itself print them.
/// @param state Accepted for compatibility with `CL_ShowIP_f`; the current implementation does not read it.
/// @param services Accepted for compatibility with `CL_ShowIP_f`; the current implementation does not read it.
/// @param addresses Argument 1 of `len`.
function CL_ShowIP_f(state,services,addresses)
  return len(addresses)
end function
/// Returns the current server name from client lifecycle state.
/// @param state Record read through `state.serverName`.
/// @param services Accepted for compatibility with `CL_Clientinfo_f`; the current implementation does not read it.
function CL_Clientinfo_f(state,services)
  return state.serverName
end function
/// Counts nonempty client configstrings.
/// @param state Record read through `state.configstrings`.
/// @param services Accepted for compatibility with `CL_Configstrings_f`; the current implementation does not read it.
function CL_Configstrings_f(state,services)
  values=state.configstrings;count=0
  for each value in values if len(bytes(value))>0 then count=count+1 end if end for
  return count
end function

/// Validates the 16-character CD-key alphabet and, when supplied, its two-character lowercase-compatible checksum.
/// @param key Candidate CD key, exactly 16 characters from the supported case-insensitive alphabet.
/// @param checksum Optional two-character hexadecimal checksum; void skips checksum verification.
function CL_CDKeyValidate(key,checksum)
  if len(bytes(key))!=CDKEY_LEN then return false end if;if checksum!=void and len(bytes(checksum))!=CDCHKSUM_LEN then return false end if
  chars=bytes([50,51,55,65,66,67,68,71,72,74,76,80,82,83,84,87])
  sum=0
  for each ch in bytes(key)
    if ch>=97 and ch<=122 then ch=ch-32 end if
    found=false
    for each allowed in chars
      if ch==allowed then found=true end if
    end for
    if not found then return false end if
    sum=(sum+ch)&255
  end for
  high=(sum>>4)&15;low=sum&15
  wanted=decode(bytes([hexDigit(high),hexDigit(low)]))
  return checksum==void or lower(checksum)==wanted
end function

// Static storage marker from the C file. Kept explicit for source/ledger parity.
/// @param state Record read through `state.lifecycle.framecount`.
function packets(state) return state.lifecycle.framecount end function
