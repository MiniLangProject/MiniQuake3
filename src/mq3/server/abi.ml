// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical native server.h data contract. MiniLang structs are managed values,
// so the Win32 offsets below are a checked reference ABI rather than an FFI
// promise. Productive adapters project the canonical state into the snapshot
// and game-interface modules that own execution.
package mq3.server.abi
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import mq3.qcommon.message_delta as usercmd
import mq3.server.snapshot_build as snapshotBuild
import mq3.server.snapshot_send as snapshotSend
import mq3.server.game_interface as gameInterface
import std.array as arrays

/// !!! MUST NOT CHANGE, SERVER AND.
const PERS_SCORE=0
/// Maximum number of visibility clusters explicitly recorded for one entity.
const MAX_ENT_CLUSTERS=16
/// Server lifecycle state with no running map.
const SS_DEAD=0
/// Server lifecycle state while a new map and game VM are loading.
const SS_LOADING=1
/// Server lifecycle state for an active game map.
const SS_GAME=2
/// Client-state value identifying an unused entry in the native client-state enumeration.
const CS_FREE=0
/// Client lifecycle state retaining a recently disconnected client for final messages.
const CS_ZOMBIE=1
/// Client lifecycle state after connection but before gamestate priming.
const CS_CONNECTED=2
/// Client lifecycle state after gamestate delivery and before entering active play.
const CS_PRIMED=3
/// Client-state value identifying an active gameplay connection in the native client-state enumeration.
const CS_ACTIVE=4
/// Number of pending connection-challenge entries retained by the server.
const MAX_CHALLENGES=1024
/// Wait limit before the connection policy stops waiting for authorization.
const AUTHORIZE_TIMEOUT=5000
/// Max recipients for heartbeat packets.
const MAX_MASTERS=8
/// Number of configured master-server entries supported by the server.
const MAX_MASTER_SERVERS=5

/// These are sent over the net as 8 bits.
const MAX_MODELS=256
/// Number of indexed configuration-string slots in the game protocol.
const MAX_CONFIGSTRINGS=1024
/// Maximum number of addressable game-entity slots.
const MAX_GENTITIES=1024
/// Bit vector of area visibility.
const MAX_MAP_AREA_BYTES=32
/// Maximum length of a backslash-delimited server or client information string.
const MAX_INFO_STRING=1024
/// Capacity of the reliable-command ring retained until acknowledgment.
const MAX_RELIABLE_COMMANDS=64
/// Max length of a string passed to Cmd_TokenizeString.
const MAX_STRING_CHARS=1024
/// Max length of a client name.
const MAX_NAME_LENGTH=32
/// Maximum character capacity reserved for a Quake asset path.
const MAX_QPATH=64
/// Max of eight download frames.
const MAX_DOWNLOAD_WINDOW=8
/// Maximum byte length of a complete sequenced network message.
const MAX_MSGLEN=16384
/// Number of old messages that must be kept on client and.
const PACKET_BACKUP=32

/// Layout record for server.abi, containing `name`, `size`, `fields`, `offsets`, `arrayFields`, `arrayCounts`.
struct Layout
  /// Native C record name whose byte offsets are described by this ABI layout.
  name
  /// Total byte size of the described server ABI record.
  size
  /// Field names included in the ABI layout descriptor.
  fields
  /// Byte offsets of fields from the beginning of the ABI record.
  offsets
  /// Names of fields represented as fixed-size ABI arrays.
  arrayFields
  /// Element counts corresponding to the fixed-size array fields.
  arrayCounts
end struct
/// Create `mq3.server.abi.Layout` with name=name; size=size; fields=fields; offsets=offsets; arrayFields=arrayFields; arrayCounts=arrayCounts.
/// @param name Initial `name` field stored in the returned or constructed `mq3.server.abi.Layout` record.
/// @param size Initial `size` field stored in the returned or constructed `mq3.server.abi.Layout` record.
/// @param fields Initial `fields` field stored in the returned or constructed `mq3.server.abi.Layout` record.
/// @param offsets Initial `offsets` field stored in the returned or constructed `mq3.server.abi.Layout` record.
/// @param arrayFields Initial `arrayFields` field stored in the returned or constructed `mq3.server.abi.Layout` record.
/// @param arrayCounts Initial `arrayCounts` field stored in the returned or constructed `mq3.server.abi.Layout` record.
function layout(name,size,fields,offsets,arrayFields,arrayCounts) return Layout(name,size,fields,offsets,arrayFields,arrayCounts) end function
/// Delegate `svEntityLayout` to `mq3.server.abi.layout` and return its result.
function svEntityLayout() return layout("svEntity_t",300,["worldSector","nextEntityInWorldSector","baseline","numClusters","clusternums","lastCluster","areanum","areanum2","snapshotCounter"],[0,4,8,216,220,284,288,292,296],["clusternums"],[16]) end function
/// Delegate `serverLayout` to `mq3.server.abi.layout` and return its result.
function serverLayout() return layout("server_t",312384,["state","restarting","serverId","restartedServerId","checksumFeed","checksumFeedServerId","snapshotCounter","timeResidual","nextFrameTime","models","configstrings","svEntities","entityParsePoint","gentities","gentitySize","num_entities","gameClients","gameClientSize","restartTime"],[0,4,8,12,16,20,24,28,32,36,1060,5156,312356,312360,312364,312368,312372,312376,312380],["models","configstrings","svEntities"],[256,1024,1024]) end function
/// Return `mq3.server.abi.layout("clientSnapshot_t", 524, ["areabytes", "areabits", "ps", "num_entities", "first_entity", "messageSent", "messageAcked", "messageSize"], [0, 4, 36, 504, 508, 512, 516, 520], ["areabits"], [32])` from `server.abi.clientSnapshotLayout`.
function clientSnapshotLayout() return layout("clientSnapshot_t",524,["areabytes","areabits","ps","num_entities","first_entity","messageSent","messageAcked","messageSize"],[0,4,36,504,508,512,516,520],["areabits"],[32]) end function
/// Return `mq3.server.abi.layout("netchan_buffer_t", 16420, ["msg", "msgBuffer", "next"], [0, 32, 16416], ["msgBuffer"], [16384])` from `server.abi.netchanBufferLayout`.
function netchanBufferLayout() return layout("netchan_buffer_t",16420,["msg","msgBuffer","next"],[0,32,16416],["msgBuffer"],[16384]) end function
/// Delegate `clientLayout` to `mq3.server.abi.layout` and return its result.
function clientLayout() return layout("client_t",117492,["state","userinfo","reliableCommands","reliableSequence","reliableAcknowledge","reliableSent","messageAcknowledge","gamestateMessageNum","challenge","lastUsercmd","lastMessageNum","lastClientCommand","lastClientCommandString","gentity","name","downloadName","download","downloadSize","downloadCount","downloadClientBlock","downloadCurrentBlock","downloadXmitBlock","downloadBlocks","downloadBlockSize","downloadEOF","downloadSendTime","deltaMessage","nextReliableTime","lastPacketTime","lastConnectTime","nextSnapshotTime","rateDelayed","timeoutCount","frames","ping","rate","snapshotMsec","pureAuthentic","gotCP","netchan","netchan_start_queue","netchan_end_queue"],[0,4,1028,66564,66568,66572,66576,66580,66584,66588,66612,66616,66620,67644,67648,67680,67744,67748,67752,67756,67760,67764,67768,67800,67832,67836,67840,67844,67848,67852,67856,67860,67864,67868,84636,84640,84644,84648,84652,84656,117484,117488],["reliableCommands","downloadBlocks","downloadBlockSize","frames"],[64,8,8,32]) end function
/// Return `mq3.server.abi.layout("challenge_t", 40, ["adr", "challenge", "time", "pingTime", "firstTime", "connected"], [0, 20, 24, 28, 32, 36], [], [])` from `server.abi.challengeLayout`.
function challengeLayout() return layout("challenge_t",40,["adr","challenge","time","pingTime","firstTime","connected"],[0,20,24,28,32,36],[],[]) end function
/// Delegate `serverStaticLayout` to `mq3.server.abi.layout` and return its result.
function serverStaticLayout() return layout("serverStatic_t",41032,["initialized","time","snapFlagServerBit","clients","numSnapshotEntities","nextSnapshotEntities","snapshotEntities","nextHeartbeatTime","challenges","redirectAddress","authorizeAddress"],[0,4,8,12,16,20,24,28,32,40992,41012],["challenges"],[1024]) end function
/// Compute server.abi.layouts as `[svEntityLayout(), serverLayout(), clientSnapshotLayout(), netchanBufferLayout(), clientLayout(), challengeLayout(), serverStaticLayout()]`.
function layouts() return [svEntityLayout(),serverLayout(),clientSnapshotLayout(),netchanBufferLayout(),clientLayout(),challengeLayout(),serverStaticLayout()] end function

// The declarations below are part of server.h's public surface even though
// MiniLang stores cvars in the managed Cvars value and dispatches functions
// from their owning modules.  Keeping the original spelling/order here gives
// ABI tooling a single canonical manifest without introducing duplicate stubs.
function cvarNames()
  return ["sv_fps","sv_timeout","sv_zombietime","sv_rconPassword","sv_privatePassword","sv_allowDownload","sv_maxclients","sv_privateClients","sv_hostname","sv_master","sv_reconnectlimit","sv_showloss","sv_padPackets","sv_killserver","sv_mapname","sv_mapChecksum","sv_serverid","sv_maxRate","sv_minPing","sv_maxPing","sv_gametype","sv_pure","sv_floodProtect","sv_lanForceRate","sv_strictAuth"]
end function
/// List the 60 names in server.abi.prototypeNames, beginning with `SV_FinalMessage`, `SV_SendServerCommand`, `SV_AddOperatorCommands`, `SV_RemoveOperatorCommands`.
function prototypeNames()
  return ["SV_FinalMessage","SV_SendServerCommand","SV_AddOperatorCommands","SV_RemoveOperatorCommands","SV_MasterHeartbeat","SV_MasterShutdown","SV_SetConfigstring","SV_GetConfigstring","SV_SetUserinfo","SV_GetUserinfo","SV_ChangeMaxClients","SV_SpawnServer","SV_GetChallenge","SV_DirectConnect","SV_AuthorizeIpPacket","SV_ExecuteClientMessage","SV_UserinfoChanged","SV_ClientEnterWorld","SV_DropClient","SV_ExecuteClientCommand","SV_ClientThink","SV_WriteDownloadToClient","SV_Heartbeat_f","SV_AddServerCommand","SV_UpdateServerCommandsToClient","SV_WriteFrameToClient","SV_SendMessageToClient","SV_SendClientMessages","SV_SendClientSnapshot","SV_NumForGentity","SV_GentityNum","SV_GameClientNum","SV_SvEntityForGentity","SV_GEntityForSvEntity","SV_InitGameProgs","SV_ShutdownGameProgs","SV_RestartGameProgs","SV_inPVS","SV_BotFrame","SV_BotAllocateClient","SV_BotFreeClient","SV_BotInitCvars","SV_BotLibSetup","SV_BotLibShutdown","SV_BotGetSnapshotEntity","SV_BotGetConsoleMessage","BotImport_DebugPolygonCreate","BotImport_DebugPolygonDelete","SV_ClearWorld","SV_UnlinkEntity","SV_LinkEntity","SV_ClipHandleForEntity","SV_SectorList_f","SV_AreaEntities","SV_PointContents","SV_Trace","SV_ClipToEntity","SV_Netchan_Transmit","SV_Netchan_TransmitNextFragment","SV_Netchan_Process"]
end function

/// SvEntity record for server.abi, containing `worldSector`, `nextEntityInWorldSector`, `baseline`, `numClusters`, `clusternums`, `lastCluster`, and 3 further fields.
struct SvEntity
  /// Spatial world-sector record containing this linked entity.
  worldSector
  /// Next entity in the sector's linked list.
  nextEntityInWorldSector
  /// For delta compression of initial sighting.
  baseline
  /// Number of visibility clusters associated with this entity or map.
  numClusters
  /// Visibility-cluster indexes intersected by the entity's bounds.
  clusternums
  /// Final visibility cluster used when the explicit cluster list overflows.
  lastCluster
  /// Primary collision area recorded in the native server-entity visibility bookkeeping.
  areanum
  /// Second AAS area number used by the operation.
  areanum2
  /// Generation marker used to avoid adding an entity twice to one snapshot.
  snapshotCounter
end struct
/// Create `mq3.server.abi.SvEntity` with worldSector=void; nextEntityInWorldSector=void; baseline=entitystate.create(); numClusters=0; clusternums=array(MAX_ENT_CLUSTERS, 0); lastCluster=0; areanum=0; areanum2=0; snapshotCounter=0.
function svEntity()
  return SvEntity(void,void,entitystate.create(),0,array(MAX_ENT_CLUSTERS,0),0,0,0,0)
end function
/// Set clusters in server.abi; the normal completion returns `value`.
///
/// Validation failures include `server ABI: invalid cluster set`.
/// Direct state writes: `value.numClusters`, `value.clusternums`, `value.lastCluster`.
/// @param value Record exposing `clusternums`. Updated in place: `numClusters`, `clusternums`, `lastCluster`.
/// @param clusters Clusters used in `len(clusters)` and `clusters[index]`.
/// @param lastCluster Last cluster operand used by `setClusters`; its reads are shown in the implementation.
function setClusters(value,clusters,lastCluster)
  if value==void or clusters==void or len(clusters)>MAX_ENT_CLUSTERS then return error(7360,"server ABI: invalid cluster set") end if
  value.numClusters=len(clusters);value.clusternums=array(MAX_ENT_CLUSTERS,0)
  if len(clusters)>0 then for index=0 to len(clusters)-1 value.clusternums[index]=clusters[index] end for end if
  value.lastCluster=lastCluster;return value
end function
/// Compute clusters in server.abi; the normal completion returns `arrays.slice(value.clusternums, 0, count)`.
/// @param value Record exposing `numClusters`, `clusternums`.
function clusters(value)
  if value==void or value.numClusters<=0 then return [] end if
  count=value.numClusters;if count>MAX_ENT_CLUSTERS then count=MAX_ENT_CLUSTERS end if
  return arrays.slice(value.clusternums,0,count)
end function

/// Server record for server.abi, containing `state`, `restarting`, `serverId`, `restartedServerId`, `checksumFeed`, `checksumFeedServerId`, and 13 further fields.
struct Server
  /// Server lifecycle state selecting dead, loading, or active gameplay.
  state
  /// True while the server performs an in-place map restart.
  restarting
  /// Identifier distinguishing the current server or map session.
  serverId
  /// Server identifier retained from before the latest map restart.
  restartedServerId
  /// Server-supplied feed value used to calculate pure-package checksums.
  checksumFeed
  /// Server identifier associated with the current checksum feed.
  checksumFeedServerId
  /// Generation marker used to avoid adding an entity twice to one snapshot.
  snapshotCounter
  /// Unconsumed elapsed milliseconds carried into the next server simulation frame.
  timeResidual
  /// When time > nextFrameTime, process world.
  nextFrameTime
  /// Submodel records associated with the loaded map.
  models
  /// Server configuration strings indexed by their protocol slot.
  configstrings
  /// Server-owned visibility and collision bookkeeping for game entities.
  svEntities
  /// Current position in the map entity text supplied to the game VM.
  entityParsePoint
  /// Game-VM entity array exposed to server-side collision and snapshot code.
  gentities
  /// Byte stride between game-VM entity records.
  gentitySize
  /// Number of entity records currently represented by this state or snapshot.
  numEntities
  /// Game-VM client records associated with the server client slots.
  gameClients
  /// Will be > sizeof(playerState_t) due to game private data.
  gameClientSize
  /// Scheduled time for restarting the current map.
  restartTime
end struct
/// Apply `mq3.server.abi.svEntity`, `mq3.server.abi.Server` for server in server.abi.
function server()
  entities=[];for index=0 to MAX_GENTITIES-1 entities=entities+[svEntity()] end for
  return Server(SS_DEAD,false,0,0,0,0,0,0,0,array(MAX_MODELS,void),array(MAX_CONFIGSTRINGS,""),entities,void,void,0,0,void,0,0)
end function

/// ClientSnapshot record for server.abi, containing `areabytes`, `areabits`, `ps`, `numEntities`, `firstEntity`, `messageSent`, and 2 further fields.
struct ClientSnapshot
  /// Number of valid bytes in the snapshot's area-visibility mask.
  areabytes
  /// Bitset of map areas visible in this snapshot.
  areabits
  /// Player-state payload stored in a client snapshot.
  ps
  /// Number of entity records currently represented by this state or snapshot.
  numEntities
  /// First entity-state position for this snapshot in the shared circular snapshot buffer.
  firstEntity
  /// Server timestamp when this snapshot message was transmitted, in milliseconds.
  messageSent
  /// Server timestamp when this snapshot message was acknowledged, in milliseconds.
  messageAcked
  /// Transmitted snapshot-message size in bytes, used for rate limiting.
  messageSize
end struct
/// Create `mq3.server.abi.ClientSnapshot` with areabytes=0; areabits=bytes(MAX_MAP_AREA_BYTES, 0); ps=playerstate.create(); numEntities=0; firstEntity=0; messageSent=0; messageAcked=0; messageSize=0.
function clientSnapshot() return ClientSnapshot(0,bytes(MAX_MAP_AREA_BYTES,0),playerstate.create(),0,0,0,0,0) end function

/// NetchanBuffer record for server.abi, containing `msg`, `msgBuffer`, `next`.
struct NetchanBuffer
  /// Message descriptor for this queued network payload.
  msg
  /// Backing byte buffer containing the queued message.
  msgBuffer
  /// Next queued message waiting for network-channel transmission.
  next
end struct
/// Create `mq3.server.abi.NetchanBuffer` with msg=msg; msgBuffer=bytes(MAX_MSGLEN, 0); next=void.
/// @param msg Initial `msg` field stored in the returned or constructed `mq3.server.abi.NetchanBuffer` record.
function netchanBuffer(msg) return NetchanBuffer(msg,bytes(MAX_MSGLEN,0),void) end function

/// Client record for server.abi, containing `state`, `userinfo`, `reliableCommands`, `reliableSequence`, `reliableAcknowledge`, `reliableSent`, and 36 further fields.
struct Client
  /// Connection lifecycle value that mirrors the native client connection-state field across the server
  /// ABI.
  state
  /// Backslash-delimited client information string, including name and connection settings.
  userinfo
  /// Reliable command entries retained until the peer acknowledges them.
  reliableCommands
  /// Sequence number of the newest queued reliable command.
  reliableSequence
  /// Native client-record cursor for reliable server commands acknowledged by the client.
  reliableAcknowledge
  /// Sequence number of the newest reliable command transmitted to the peer.
  reliableSent
  /// Sequence number of the newest server message acknowledged by the client.
  messageAcknowledge
  /// Outgoing network sequence number of the client gamestate message.
  gamestateMessageNum
  /// Challenge value used to authenticate a connection attempt.
  challenge
  /// Most recent user-command record received or processed for this client.
  lastUsercmd
  /// Sequence number of the last client message retained for delta handling.
  lastMessageNum
  /// Sequence number of the last processed reliable client command.
  lastClientCommand
  /// Text of the last processed reliable client command.
  lastClientCommandString
  /// Game-VM entity associated with this client.
  gentity
  /// Extracted from userinfo, high bits masked.
  name
  /// Requested asset download path, or an empty string when no download is active.
  downloadName
  /// Open file handle used by the active asset download.
  download
  /// Total byte length of the requested download.
  downloadSize
  /// Number of download recorded by this state.
  downloadCount
  /// First download block still awaiting client acknowledgment.
  downloadClientBlock
  /// Index of the next download block to load from the file.
  downloadCurrentBlock
  /// Index of the next buffered block to transmit.
  downloadXmitBlock
  /// Ring buffer of payload data for outstanding download blocks.
  downloadBlocks
  /// Valid byte lengths of blocks retained in the download window.
  downloadBlockSize
  /// True after the end-of-file marker has been queued for the download.
  downloadEOF
  /// Server timestamp used to schedule download retransmissions.
  downloadSendTime
  /// Acknowledged snapshot message selected as the base for delta compression.
  deltaMessage
  /// Millisecond deadline used by active-client command flood protection. Commands received before
  /// it can still advance reliable sequencing while game-command dispatch is denied.
  nextReliableTime
  /// Server timestamp of the most recently received client packet, in milliseconds.
  lastPacketTime
  /// Server timestamp when this client connection began, in milliseconds.
  lastConnectTime
  /// Earliest server timestamp for sending the next snapshot, in milliseconds.
  nextSnapshotTime
  /// True when rate limiting postponed the next snapshot beyond its normal interval.
  rateDelayed
  /// Consecutive timeout checks exceeded before disconnecting the client.
  timeoutCount
  /// Updates can be delta'd from here.
  frames
  /// Estimated round-trip client latency in milliseconds.
  ping
  /// Maximum client download and snapshot transfer rate, in bytes per second.
  rate
  /// Requested interval between snapshots, in milliseconds.
  snapshotMsec
  /// True after the client has passed the pure-package authentication check.
  pureAuthentic
  /// True after the client has sent its pure-server checksum verification command.
  gotCP
  /// Sequenced network channel used to exchange this client's packets.
  netchan
  /// First queued message waiting for outstanding fragments to finish.
  netchanStartQueue
  /// Last queued message waiting for outstanding fragments to finish.
  netchanEndQueue
end struct
/// Apply `mq3.server.abi.clientSnapshot`, `mq3.server.abi.Client`, `mq3.qcommon.message_delta.userCommand` for client in server.abi.
function client()
  frames=[];for index=0 to PACKET_BACKUP-1 frames=frames+[clientSnapshot()] end for
  return Client(CS_FREE,"",array(MAX_RELIABLE_COMMANDS,""),0,0,0,0,-1,0,usercmd.userCommand(0,0,0,0,0,0,0,0,0),-1,0,"",void,"","",void,0,0,0,0,0,array(MAX_DOWNLOAD_WINDOW,void),array(MAX_DOWNLOAD_WINDOW,0),false,0,-1,0,0,0,0,false,0,frames,0,3000,50,0,false,void,[],void)
end function

/// Challenge record for server.abi, containing `address`, `challenge`, `time`, `pingTime`, `firstTime`, `connected`.
struct Challenge
  /// Network address associated with the client or packet.
  address
  /// Challenge value used to authenticate a connection attempt.
  challenge
  /// Challenge creation timestamp in the native record, used for replacement ordering.
  time
  /// Server timestamp of the challenge response used to measure connection latency.
  pingTime
  /// Server timestamp when this challenge address was first registered.
  firstTime
  /// True after the connection challenge has been accepted by a client.
  connected
end struct
/// Create `mq3.server.abi.Challenge` with address=void; challenge=0; time=0; pingTime=0; firstTime=0; connected=false.
function challenge() return Challenge(void,0,0,0,0,false) end function

/// ServerStatic record for server.abi, containing `initialized`, `time`, `snapFlagServerBit`, `clients`, `numSnapshotEntities`, `nextSnapshotEntities`, and 5 further fields.
struct ServerStatic
  /// Native server-static flag indicating that persistent server storage is available.
  initialized
  /// Persistent server clock represented in the native server-static ABI, in milliseconds.
  time
  /// Snapshot server-count bit toggled when a new server level is spawned.
  snapFlagServerBit
  /// Native-compatible client array referenced by the persistent server-static state.
  clients
  /// Number of entity-state slots reserved in the snapshot ring.
  numSnapshotEntities
  /// Next absolute insertion position in the circular snapshot-entity buffer.
  nextSnapshotEntities
  /// Entity states retained in the server snapshot ring.
  snapshotEntities
  /// Server time at which the next master heartbeat should be sent.
  nextHeartbeatTime
  /// Pending connection challenges used to validate connecting client addresses.
  challenges
  /// For rcon return messages.
  redirectAddress
  /// Network address of the external client-authorization server.
  authorizeAddress
end struct
/// Apply `mq3.server.abi.client`, `mq3.server.abi.challenge`, `mq3.server.abi.ServerStatic` for server static in server.abi.
///
/// Validation failures include `server ABI: invalid persistent sizes`.
/// @param maxClients Max clients used in `(maxClients < 0)` and `(maxClients - 1)`.
/// @param numSnapshotEntities Initial `numSnapshotEntities` field stored in the returned or constructed `mq3.server.abi.ServerStatic` record.
function serverStatic(maxClients,numSnapshotEntities)
  if maxClients<0 or numSnapshotEntities<0 then return error(7361,"server ABI: invalid persistent sizes") end if
  clients=[];for index=0 to maxClients-1 clients=clients+[client()] end for
  challengeRing=[];for index=0 to MAX_CHALLENGES-1 challengeRing=challengeRing+[challenge()] end for
  return ServerStatic(false,0,0,clients,numSnapshotEntities,0,array(numSnapshotEntities,void),0,challengeRing,void,void)
end function

/// Cvars record for server.abi, containing `fps`, `timeout`, `zombietime`, `rconPassword`, `privatePassword`, `allowDownload`, and 19 further fields.
struct Cvars
  /// Requested server simulation frames per second.
  fps
  /// Configuration variable controlling client inactivity timeout.
  timeout
  /// Configuration variable controlling disconnected-client retention.
  zombietime
  /// Password required to accept a remote-console command.
  rconPassword
  /// Password required to use the reserved private client slots.
  privatePassword
  /// True when clients may request files from the server.
  allowDownload
  /// Native-compatible server configuration value controlling the client-slot limit.
  maxclients
  /// Number of client slots reserved for clients with the private password.
  privateClients
  /// Server display name advertised to clients and directory services.
  hostname
  /// Configured master-server addresses receiving heartbeats.
  masters
  /// Minimum interval required before a client may reconnect.
  reconnectlimit
  /// Configuration variable enabling packet-loss diagnostics.
  showloss
  /// Additional padding requested for outgoing snapshot messages.
  padPackets
  /// Configuration variable requesting server shutdown.
  killserver
  /// Name of the current game map.
  mapname
  /// Checksum of the currently loaded BSP map.
  mapChecksum
  /// Identifier distinguishing the current server or map session.
  serverid
  /// Upper bound on the client transmission rate, in bytes per second.
  maxRate
  /// Minimum client latency accepted by the connection policy.
  minPing
  /// Maximum client latency accepted by the connection policy.
  maxPing
  /// Game-mode identifier used when applying mode-specific rules.
  gametype
  /// True when clients must use the server-approved package checksums.
  pure
  /// True when repeated client commands are rate limited.
  floodProtect
  /// True when LAN clients bypass the normal rate limit.
  lanForceRate
  /// True when the server requires successful external authorization.
  strictAuth
end struct
/// Create `mq3.server.abi.Cvars` with fps=void; timeout=void; zombietime=void; rconPassword=void; 21 further fields.
function cvars() return Cvars(void,void,void,void,void,void,void,void,void,array(MAX_MASTER_SERVERS,void),void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
/// Globals record for server.abi, containing `svs`, `sv`, `gvm`, `cvars`.
struct Globals
  /// Persistent server state shared across map loads.
  svs
  /// Map-level server state for the current world.
  sv
  /// Loaded game-VM instance providing server game logic.
  gvm
  /// Configuration-variable registry consulted by this subsystem.
  cvars
end struct
/// Create `mq3.server.abi.Globals` with svs=serverStatic(maxClients, numSnapshotEntities); sv=server(); gvm=void; cvars=cvars().
/// @param maxClients Max clients passed as `maxClients` to `mq3.server.abi.serverStatic`.
/// @param numSnapshotEntities Num snapshot entities passed as `numSnapshotEntities` to `mq3.server.abi.serverStatic`.
function globals(maxClients,numSnapshotEntities) return Globals(serverStatic(maxClients,numSnapshotEntities),server(),void,cvars()) end function

// Productive projections. They deliberately preserve the canonical fixed-size
// rings while adapting the managed representation used by execution modules.
/// @param value Record exposing `baseline`, `lastCluster`, `areanum`, `areanum2`.
/// @param linked Linked passed as `linked` to `mq3.server.snapshot_build.snapshotEntity`.
/// @param svFlags Sv flags passed as `svFlags` to `mq3.server.snapshot_build.snapshotEntity`.
/// @param singleClient Single client passed as `singleClient` to `mq3.server.snapshot_build.snapshotEntity`.
function toSnapshotEntity(value,linked,svFlags,singleClient)
  if value==void then return error(7362,"server ABI: missing svEntity") end if
  return snapshotBuild.snapshotEntity(value.baseline,linked,svFlags,singleClient,clusters(value),value.lastCluster,value.areanum,value.areanum2)
end function
/// Compute to snapshot frame in server.abi; the normal completion returns `result`.
///
/// Validation failures include `server ABI: missing clientSnapshot`.
/// @param value Record exposing `areabytes`, `areabits`, `ps`, `numEntities`, `firstEntity`.
function toSnapshotFrame(value)
  if value==void then return error(7362,"server ABI: missing clientSnapshot") end if
  result=snapshotBuild.frame();result.areaBytes=value.areabytes;result.areaBits=value.areabits;result.playerState=value.ps;result.numEntities=value.numEntities;result.firstEntity=value.firstEntity;return result
end function
/// Compute to snapshot server in server.abi; the normal completion returns `result`.
///
/// Validation failures include `server ABI: invalid snapshot server`.
/// @param mapState Record exposing `svEntities`.
/// @param persistentState Record exposing `numSnapshotEntities`, `time`, `snapshotEntities`, `snapFlagServerBit`, `nextSnapshotEntities`.
/// @param padPackets Pad packets operand used by `toSnapshotServer`; its reads are shown in the implementation.
/// @param maxRate Max rate operand used by `toSnapshotServer`; its reads are shown in the implementation.
/// @param lanForceRate Lan force rate operand used by `toSnapshotServer`; its reads are shown in the implementation.
function toSnapshotServer(mapState,persistentState,padPackets,maxRate,lanForceRate)
  if mapState==void or persistentState==void or persistentState.numSnapshotEntities<=0 then return error(7363,"server ABI: invalid snapshot server") end if
  baselines=[];for each item in mapState.svEntities baselines=baselines+[item.baseline] end for
  result=snapshotSend.server(persistentState.time,persistentState.snapshotEntities,persistentState.numSnapshotEntities,baselines)
  result.snapFlagServerBit=persistentState.snapFlagServerBit;result.nextSnapshotEntities=persistentState.nextSnapshotEntities;result.padPackets=padPackets;result.maxRate=maxRate;result.lanForceRate=lanForceRate;return result
end function
/// Update `target.gentities`, `target.gentitySize`, `target.numEntities`, `target.gameClients` in server.abi; the normal completion returns `target`.
///
/// Validation failures include `server ABI: missing game binding`.
/// Direct state writes: `target.gentities`, `target.gentitySize`, `target.numEntities`, `target.gameClients`, `target.gameClientSize`, `target.maxClients`, `target.serverState`, `target.clients` and further fields.
/// @param mapState Record exposing `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`, `state`, `svEntities`.
/// @param persistentState Record exposing `clients`.
/// @param target Record exposing `clients`, `svEntities`. Updated in place: `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`, `maxClients` and further fields.
function bindGameInterface(mapState,persistentState,target)
  if mapState==void or persistentState==void or target==void then return error(7364,"server ABI: missing game binding") end if
  target.gentities=mapState.gentities;target.gentitySize=mapState.gentitySize;target.numEntities=mapState.numEntities;target.gameClients=mapState.gameClients;target.gameClientSize=mapState.gameClientSize;target.maxClients=len(persistentState.clients);target.serverState=mapState.state
  target.clients=[];for each item in persistentState.clients target.clients=target.clients+[item.lastUsercmd] end for
  target.svEntities=[];for index=0 to len(mapState.svEntities)-1 item=mapState.svEntities[index];target.svEntities=target.svEntities+[gameInterface.SvEntity(index,item.areanum,item.areanum2)] end for
  return target
end function
