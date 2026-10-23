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

const PERS_SCORE=0
const MAX_ENT_CLUSTERS=16
const SS_DEAD=0
const SS_LOADING=1
const SS_GAME=2
const CS_FREE=0
const CS_ZOMBIE=1
const CS_CONNECTED=2
const CS_PRIMED=3
const CS_ACTIVE=4
const MAX_CHALLENGES=1024
const AUTHORIZE_TIMEOUT=5000
const MAX_MASTERS=8
const MAX_MASTER_SERVERS=5

const MAX_MODELS=256
const MAX_CONFIGSTRINGS=1024
const MAX_GENTITIES=1024
const MAX_MAP_AREA_BYTES=32
const MAX_INFO_STRING=1024
const MAX_RELIABLE_COMMANDS=64
const MAX_STRING_CHARS=1024
const MAX_NAME_LENGTH=32
const MAX_QPATH=64
const MAX_DOWNLOAD_WINDOW=8
const MAX_MSGLEN=16384
const PACKET_BACKUP=32

struct Layout name size fields offsets arrayFields arrayCounts end struct
function layout(name,size,fields,offsets,arrayFields,arrayCounts) return Layout(name,size,fields,offsets,arrayFields,arrayCounts) end function
function svEntityLayout() return layout("svEntity_t",300,["worldSector","nextEntityInWorldSector","baseline","numClusters","clusternums","lastCluster","areanum","areanum2","snapshotCounter"],[0,4,8,216,220,284,288,292,296],["clusternums"],[16]) end function
function serverLayout() return layout("server_t",312384,["state","restarting","serverId","restartedServerId","checksumFeed","checksumFeedServerId","snapshotCounter","timeResidual","nextFrameTime","models","configstrings","svEntities","entityParsePoint","gentities","gentitySize","num_entities","gameClients","gameClientSize","restartTime"],[0,4,8,12,16,20,24,28,32,36,1060,5156,312356,312360,312364,312368,312372,312376,312380],["models","configstrings","svEntities"],[256,1024,1024]) end function
function clientSnapshotLayout() return layout("clientSnapshot_t",524,["areabytes","areabits","ps","num_entities","first_entity","messageSent","messageAcked","messageSize"],[0,4,36,504,508,512,516,520],["areabits"],[32]) end function
function netchanBufferLayout() return layout("netchan_buffer_t",16420,["msg","msgBuffer","next"],[0,32,16416],["msgBuffer"],[16384]) end function
function clientLayout() return layout("client_t",117492,["state","userinfo","reliableCommands","reliableSequence","reliableAcknowledge","reliableSent","messageAcknowledge","gamestateMessageNum","challenge","lastUsercmd","lastMessageNum","lastClientCommand","lastClientCommandString","gentity","name","downloadName","download","downloadSize","downloadCount","downloadClientBlock","downloadCurrentBlock","downloadXmitBlock","downloadBlocks","downloadBlockSize","downloadEOF","downloadSendTime","deltaMessage","nextReliableTime","lastPacketTime","lastConnectTime","nextSnapshotTime","rateDelayed","timeoutCount","frames","ping","rate","snapshotMsec","pureAuthentic","gotCP","netchan","netchan_start_queue","netchan_end_queue"],[0,4,1028,66564,66568,66572,66576,66580,66584,66588,66612,66616,66620,67644,67648,67680,67744,67748,67752,67756,67760,67764,67768,67800,67832,67836,67840,67844,67848,67852,67856,67860,67864,67868,84636,84640,84644,84648,84652,84656,117484,117488],["reliableCommands","downloadBlocks","downloadBlockSize","frames"],[64,8,8,32]) end function
function challengeLayout() return layout("challenge_t",40,["adr","challenge","time","pingTime","firstTime","connected"],[0,20,24,28,32,36],[],[]) end function
function serverStaticLayout() return layout("serverStatic_t",41032,["initialized","time","snapFlagServerBit","clients","numSnapshotEntities","nextSnapshotEntities","snapshotEntities","nextHeartbeatTime","challenges","redirectAddress","authorizeAddress"],[0,4,8,12,16,20,24,28,32,40992,41012],["challenges"],[1024]) end function
function layouts() return [svEntityLayout(),serverLayout(),clientSnapshotLayout(),netchanBufferLayout(),clientLayout(),challengeLayout(),serverStaticLayout()] end function

// The declarations below are part of server.h's public surface even though
// MiniLang stores cvars in the managed Cvars value and dispatches functions
// from their owning modules.  Keeping the original spelling/order here gives
// ABI tooling a single canonical manifest without introducing duplicate stubs.
function cvarNames()
  return ["sv_fps","sv_timeout","sv_zombietime","sv_rconPassword","sv_privatePassword","sv_allowDownload","sv_maxclients","sv_privateClients","sv_hostname","sv_master","sv_reconnectlimit","sv_showloss","sv_padPackets","sv_killserver","sv_mapname","sv_mapChecksum","sv_serverid","sv_maxRate","sv_minPing","sv_maxPing","sv_gametype","sv_pure","sv_floodProtect","sv_lanForceRate","sv_strictAuth"]
end function
function prototypeNames()
  return ["SV_FinalMessage","SV_SendServerCommand","SV_AddOperatorCommands","SV_RemoveOperatorCommands","SV_MasterHeartbeat","SV_MasterShutdown","SV_SetConfigstring","SV_GetConfigstring","SV_SetUserinfo","SV_GetUserinfo","SV_ChangeMaxClients","SV_SpawnServer","SV_GetChallenge","SV_DirectConnect","SV_AuthorizeIpPacket","SV_ExecuteClientMessage","SV_UserinfoChanged","SV_ClientEnterWorld","SV_DropClient","SV_ExecuteClientCommand","SV_ClientThink","SV_WriteDownloadToClient","SV_Heartbeat_f","SV_AddServerCommand","SV_UpdateServerCommandsToClient","SV_WriteFrameToClient","SV_SendMessageToClient","SV_SendClientMessages","SV_SendClientSnapshot","SV_NumForGentity","SV_GentityNum","SV_GameClientNum","SV_SvEntityForGentity","SV_GEntityForSvEntity","SV_InitGameProgs","SV_ShutdownGameProgs","SV_RestartGameProgs","SV_inPVS","SV_BotFrame","SV_BotAllocateClient","SV_BotFreeClient","SV_BotInitCvars","SV_BotLibSetup","SV_BotLibShutdown","SV_BotGetSnapshotEntity","SV_BotGetConsoleMessage","BotImport_DebugPolygonCreate","BotImport_DebugPolygonDelete","SV_ClearWorld","SV_UnlinkEntity","SV_LinkEntity","SV_ClipHandleForEntity","SV_SectorList_f","SV_AreaEntities","SV_PointContents","SV_Trace","SV_ClipToEntity","SV_Netchan_Transmit","SV_Netchan_TransmitNextFragment","SV_Netchan_Process"]
end function

struct SvEntity worldSector nextEntityInWorldSector baseline numClusters clusternums lastCluster areanum areanum2 snapshotCounter end struct
function svEntity()
  return SvEntity(void,void,entitystate.create(),0,array(MAX_ENT_CLUSTERS,0),0,0,0,0)
end function
function setClusters(value,clusters,lastCluster)
  if value==void or clusters==void or len(clusters)>MAX_ENT_CLUSTERS then return error(7360,"server ABI: invalid cluster set") end if
  value.numClusters=len(clusters);value.clusternums=array(MAX_ENT_CLUSTERS,0)
  if len(clusters)>0 then for index=0 to len(clusters)-1 value.clusternums[index]=clusters[index] end for end if
  value.lastCluster=lastCluster;return value
end function
function clusters(value)
  if value==void or value.numClusters<=0 then return [] end if
  count=value.numClusters;if count>MAX_ENT_CLUSTERS then count=MAX_ENT_CLUSTERS end if
  return arrays.slice(value.clusternums,0,count)
end function

struct Server state restarting serverId restartedServerId checksumFeed checksumFeedServerId snapshotCounter timeResidual nextFrameTime models configstrings svEntities entityParsePoint gentities gentitySize numEntities gameClients gameClientSize restartTime end struct
function server()
  entities=[];for index=0 to MAX_GENTITIES-1 entities=entities+[svEntity()] end for
  return Server(SS_DEAD,false,0,0,0,0,0,0,0,array(MAX_MODELS,void),array(MAX_CONFIGSTRINGS,""),entities,void,void,0,0,void,0,0)
end function

struct ClientSnapshot areabytes areabits ps numEntities firstEntity messageSent messageAcked messageSize end struct
function clientSnapshot() return ClientSnapshot(0,bytes(MAX_MAP_AREA_BYTES,0),playerstate.create(),0,0,0,0,0) end function

struct NetchanBuffer msg msgBuffer next end struct
function netchanBuffer(msg) return NetchanBuffer(msg,bytes(MAX_MSGLEN,0),void) end function

struct Client state userinfo reliableCommands reliableSequence reliableAcknowledge reliableSent messageAcknowledge gamestateMessageNum challenge lastUsercmd lastMessageNum lastClientCommand lastClientCommandString gentity name downloadName download downloadSize downloadCount downloadClientBlock downloadCurrentBlock downloadXmitBlock downloadBlocks downloadBlockSize downloadEOF downloadSendTime deltaMessage nextReliableTime lastPacketTime lastConnectTime nextSnapshotTime rateDelayed timeoutCount frames ping rate snapshotMsec pureAuthentic gotCP netchan netchanStartQueue netchanEndQueue end struct
function client()
  frames=[];for index=0 to PACKET_BACKUP-1 frames=frames+[clientSnapshot()] end for
  return Client(CS_FREE,"",array(MAX_RELIABLE_COMMANDS,""),0,0,0,0,-1,0,usercmd.userCommand(0,0,0,0,0,0,0,0,0),-1,0,"",void,"","",void,0,0,0,0,0,array(MAX_DOWNLOAD_WINDOW,void),array(MAX_DOWNLOAD_WINDOW,0),false,0,-1,0,0,0,0,false,0,frames,0,3000,50,0,false,void,[],void)
end function

struct Challenge address challenge time pingTime firstTime connected end struct
function challenge() return Challenge(void,0,0,0,0,false) end function

struct ServerStatic initialized time snapFlagServerBit clients numSnapshotEntities nextSnapshotEntities snapshotEntities nextHeartbeatTime challenges redirectAddress authorizeAddress end struct
function serverStatic(maxClients,numSnapshotEntities)
  if maxClients<0 or numSnapshotEntities<0 then return error(7361,"server ABI: invalid persistent sizes") end if
  clients=[];for index=0 to maxClients-1 clients=clients+[client()] end for
  challengeRing=[];for index=0 to MAX_CHALLENGES-1 challengeRing=challengeRing+[challenge()] end for
  return ServerStatic(false,0,0,clients,numSnapshotEntities,0,array(numSnapshotEntities,void),0,challengeRing,void,void)
end function

struct Cvars fps timeout zombietime rconPassword privatePassword allowDownload maxclients privateClients hostname masters reconnectlimit showloss padPackets killserver mapname mapChecksum serverid maxRate minPing maxPing gametype pure floodProtect lanForceRate strictAuth end struct
function cvars() return Cvars(void,void,void,void,void,void,void,void,void,array(MAX_MASTER_SERVERS,void),void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
struct Globals svs sv gvm cvars end struct
function globals(maxClients,numSnapshotEntities) return Globals(serverStatic(maxClients,numSnapshotEntities),server(),void,cvars()) end function

// Productive projections. They deliberately preserve the canonical fixed-size
// rings while adapting the managed representation used by execution modules.
function toSnapshotEntity(value,linked,svFlags,singleClient)
  if value==void then return error(7362,"server ABI: missing svEntity") end if
  return snapshotBuild.snapshotEntity(value.baseline,linked,svFlags,singleClient,clusters(value),value.lastCluster,value.areanum,value.areanum2)
end function
function toSnapshotFrame(value)
  if value==void then return error(7362,"server ABI: missing clientSnapshot") end if
  result=snapshotBuild.frame();result.areaBytes=value.areabytes;result.areaBits=value.areabits;result.playerState=value.ps;result.numEntities=value.numEntities;result.firstEntity=value.firstEntity;return result
end function
function toSnapshotServer(mapState,persistentState,padPackets,maxRate,lanForceRate)
  if mapState==void or persistentState==void or persistentState.numSnapshotEntities<=0 then return error(7363,"server ABI: invalid snapshot server") end if
  baselines=[];for each item in mapState.svEntities baselines=baselines+[item.baseline] end for
  result=snapshotSend.server(persistentState.time,persistentState.snapshotEntities,persistentState.numSnapshotEntities,baselines)
  result.snapFlagServerBit=persistentState.snapFlagServerBit;result.nextSnapshotEntities=persistentState.nextSnapshotEntities;result.padPackets=padPackets;result.maxRate=maxRate;result.lanForceRate=lanForceRate;return result
end function
function bindGameInterface(mapState,persistentState,target)
  if mapState==void or persistentState==void or target==void then return error(7364,"server ABI: missing game binding") end if
  target.gentities=mapState.gentities;target.gentitySize=mapState.gentitySize;target.numEntities=mapState.numEntities;target.gameClients=mapState.gameClients;target.gameClientSize=mapState.gameClientSize;target.maxClients=len(persistentState.clients);target.serverState=mapState.state
  target.clients=[];for each item in persistentState.clients target.clients=target.clients+[item.lastUsercmd] end for
  target.svEntities=[];for index=0 to len(mapState.svEntities)-1 item=mapState.svEntities[index];target.svEntities=target.svEntities+[gameInterface.SvEntity(index,item.areanum,item.areanum2)] end for
  return target
end function
