// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native server lifetime and map-spawn orchestration from server/sv_init.c.
package mq3.server.init_runtime
import mq3.game.entitystate as entitystate
import mq3.shared.info as info
import mq3.qcommon.cvar as cvar
import std.string as strings

/// Number of indexed configuration-string slots in the game protocol.
const MAX_CONFIGSTRINGS=1024
/// Maximum number of client slots supported by these interfaces.
const MAX_CLIENTS=64
/// Maximum length of a backslash-delimited server or client information string.
const MAX_INFO_STRING=1024
/// Max length of a client name.
const MAX_NAME_LENGTH=32
/// Max length of a string passed to Cmd_TokenizeString.
const MAX_STRING_CHARS=1024
/// Character capacity used when splitting a configuration string into reliable commands.
const CONFIG_CHUNK=1000
/// Maximum configuration-string text carried by one split command.
const CONFIG_PAYLOAD=999
/// Number of old messages that must be kept on client and.
const PACKET_BACKUP=32
/// Maximum number of entity states associated with a protocol packet.
const MAX_PACKET_ENTITIES=64
/// Toggled every map_restart so transitions can be detected.
const SNAPFLAG_SERVERCOUNT=4
/// An info string with all the serverinfo cvars.
const CS_SERVERINFO=0
/// An info string for server system to client system configuration (timescale, etc).
const CS_SYSTEMINFO=1
/// Client-state value identifying a vacant connection slot created during server allocation.
const CS_FREE=0
/// Client lifecycle state after connection but before gamestate priming.
const CS_CONNECTED=2
/// Client lifecycle state after gamestate delivery and before entering active play.
const CS_PRIMED=3
/// Client-state value identifying a client already playing when the server initializes or restarts a
/// map.
const CS_ACTIVE=4
/// Server lifecycle state with no running map.
const SS_DEAD=0
/// Server lifecycle state while a new map and game VM are loading.
const SS_LOADING=1
/// Server lifecycle state for an active game map.
const SS_GAME=2

/// Client record for server.init_runtime, containing `state`, `userinfo`, `name`, `noServerInfo`, `bot`, `loopback`, and 5 further fields.
struct Client
  /// Connection lifecycle value that preserves the client connection stage across map startup and
  /// restart.
  state
  /// Backslash-delimited client information string, including name and connection settings.
  userinfo
  /// Extracted from userinfo, high bits masked.
  name
  /// True when server-info updates should be withheld from this client.
  noServerInfo
  /// True when the client slot is controlled by an in-process bot.
  bot
  /// True when the connection uses the local loopback transport.
  loopback
  /// Index of the client's entity in the game VM entity array.
  gentityNumber
  /// Acknowledged snapshot message selected as the base for delta compression.
  deltaMessage
  /// Earliest server timestamp for sending the next snapshot, in milliseconds.
  nextSnapshotTime
  /// Client identifier retained while preserving slots across a map transition.
  tag
  /// Reliable or pending commands collected for the associated client.
  commands
end struct
/// Create `mq3.server.init_runtime.Client` with state=CS_FREE; userinfo=""; name=""; noServerInfo=false; bot=false; loopback=false; gentityNumber=- 1; deltaMessage=0; nextSnapshotTime=0; tag=tag; commands=[].
/// @param tag Initial `tag` field stored in the returned or constructed `mq3.server.init_runtime.Client` record.
function client(tag)
  return Client(CS_FREE,"","",false,false,false,-1,0,0,tag,[])
end function

/// SharedEntity record for server.init_runtime, containing `linked`, `state`.
struct SharedEntity
  /// True when this entity or resource is linked into the world.
  linked
  /// Network-visible entity state shared with the game VM.
  state
end struct
/// Create `mq3.server.init_runtime.SharedEntity` with linked=false; state=entitystate.create().
function sharedEntity() return SharedEntity(false,entitystate.create()) end function

/// Level record for server.init_runtime, containing `state`, `restarting`, `configstrings`, `entities`, `baselines`, `numEntities`, and 6 further fields.
struct Level
  /// Server lifecycle state selecting dead, loading, or active gameplay.
  state
  /// True while the server performs an in-place map restart.
  restarting
  /// Server configuration strings indexed by their protocol slot.
  configstrings
  /// Game or BSP entity records tracked by this subsystem.
  entities
  /// Baseline entity states used as initial references for delta compression.
  baselines
  /// Number of entity records currently represented by this state or snapshot.
  numEntities
  /// Server-supplied feed value used to calculate pure-package checksums.
  checksumFeed
  /// Identifier distinguishing the current server or map session.
  serverId
  /// Server identifier retained from before the latest map restart.
  restartedServerId
  /// Server identifier associated with the current checksum feed.
  checksumFeedServerId
  /// Checksum of the currently loaded BSP map.
  mapChecksum
  /// Name of the current game map.
  mapname
end struct
/// Compute level in server.init_runtime; the normal completion returns `Level(SS_DEAD, false, array(MAX_CONFIGSTRINGS, ""), entities, baselines, 0, 0, 0, 0, 0, 0, "")`.
function level()
  entities=array(1024,void);baselines=array(1024,void)
  for index=0 to 1023 entities[index]=sharedEntity();baselines[index]=entitystate.create() end for
  return Level(SS_DEAD,false,array(MAX_CONFIGSTRINGS,""),entities,baselines,0,0,0,0,0,0,"")
end function

/// Static record for server.init_runtime, containing `initialized`, `clients`, `numSnapshotEntities`, `snapshotEntities`, `nextSnapshotEntities`, `snapFlagServerBit`, and 1 further fields.
struct Static
  /// True after persistent server client and snapshot storage has been allocated.
  initialized
  /// Persistent client records allocated at server startup and retained across map changes.
  clients
  /// Number of entity-state slots reserved in the snapshot ring.
  numSnapshotEntities
  /// Entity states retained in the server snapshot ring.
  snapshotEntities
  /// Next absolute insertion position in the circular snapshot-entity buffer.
  nextSnapshotEntities
  /// Snapshot server-count bit toggled when a new server level is spawned.
  snapFlagServerBit
  /// Persistent server clock retained across level startup and restart, in milliseconds.
  time
end struct
/// Create `mq3.server.init_runtime.Static` with initialized=false; clients=[]; numSnapshotEntities=0; snapshotEntities=[]; nextSnapshotEntities=0; snapFlagServerBit=0; time=0.
function staticState() return Static(false,[],0,[],0,0,0) end function

/// Runtime record for server.init_runtime, containing `sv`, `svs`, `registry`, `maxClients`, `dedicated`, `pure`, and 8 further fields.
struct Runtime
  /// Current map-level server state.
  sv
  /// Persistent server state retained across map changes.
  svs
  /// Registry used to resolve registered names, handles, or runtime definitions.
  registry
  /// Requested client capacity bounded and allocated during server startup.
  maxClients
  /// True when the server runs without a local graphical client.
  dedicated
  /// True when clients must use the server-approved package checksums.
  pure
  /// True while the server or represented subsystem is running.
  running
  /// True while an error is being handled, preventing recursive error handling.
  errorEntered
  /// Host frame timestamp used while initializing or restarting the server.
  frameTime
  /// True when a changed game mode requires server reinitialization.
  gametypeModified
  /// Bit mask of configuration-variable categories modified since the last clear.
  modifiedFlags
  /// Registry of server operator-console commands.
  operatorCommands
  /// True after bot-library initialization has completed.
  botInitialized
  /// True after shutdown has been requested or completed.
  shutdown
end struct
/// Create `mq3.server.init_runtime.Runtime` with sv=level(); svs=staticState(); registry=cvar.create(); maxClients=8; 10 further fields.
function runtime()
  return Runtime(level(),staticState(),cvar.create(),8,0,1,false,false,0,false,0,false,false,false)
end function

/// Services record for server.init_runtime, containing `context`, `actionFn`, `randomFn`, `millisecondsFn`.
struct Services
  /// Caller-supplied data associated with server startup actions, random values, and initialization
  /// timing.
  context
  /// Host callback that dispatches a recorded subsystem action to the host.
  actionFn
  /// Host callback that supplies the random values used by bot selection and fuzzy logic.
  randomFn
  /// Host callback that supplies the current host clock in milliseconds.
  millisecondsFn
end struct
/// Create `mq3.server.init_runtime.Services` with context=void; actionFn=void; randomFn=void; millisecondsFn=void.
function services() return Services(void,void,void,void) end function
/// Compute action in server.init_runtime.
/// @param host Record exposing `actionFn`.
/// @param kind Kind used in `host.actionFn(host, kind, a, b, c)`.
/// @param a A used in `host.actionFn(host, kind, a, b, c)`.
/// @param b B used in `host.actionFn(host, kind, a, b, c)`.
/// @param c C used in `host.actionFn(host, kind, a, b, c)`.
function action(host,kind,a,b,c)
  if host!=void and host.actionFn!=void then return host.actionFn(host,kind,a,b,c) end if
  return void
end function

/// Compute require config index in server.init_runtime.
/// @param index Index used in `str(index)` and `(index < 0)`.
function requireConfigIndex(index)
  if index<0 or index>=MAX_CONFIGSTRINGS then return error(7380,"SV_SetConfigstring: bad index "+str(index)) end if
  return void
end function
/// Compute bounded in server.init_runtime; the normal completion returns `text`.
///
/// Validation failures include `bufferSize < 1`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
/// @param capacity Capacity used in `(capacity < 1)` and `(capacity - 1)`.
function bounded(text,capacity)
  if capacity<1 then return error(7380,"bufferSize < 1") end if
  if text==void then text="" end if
  data=bytes(text);if len(data)>=capacity then return decode(slice(data,0,capacity-1)) end if;return text
end function
/// Compute server.init_runtime.quoteCommand as `(((((kind + " ") + str(index)) + " \"") + text) + "\"\n")`.
/// @param kind Kind used in `(kind + " ")` and `((kind + " ") + str(index))`.
/// @param index Index used in `str(index)` and `((kind + " ") + str(index))`.
/// @param text Text used in `((((kind + " ") + str(index)) + " \"") + text)` and `(((((kind + " ") + str(index)) + " \"") + text) + "\"\n")`.
function quoteCommand(kind,index,text) return kind+" "+str(index)+" \""+text+"\"\n" end function

/// Send config in server.init_runtime; the normal completion returns `count`.
///
/// Direct state writes: `clientState.commands`.
/// @param clientState Record exposing `commands`. Updated in place: `commands`.
/// @param index Index passed as `index` to `mq3.server.init_runtime.quoteCommand`.
/// @param value Text passed as `text` to `mq3.server.init_runtime.quoteCommand`.
function sendConfig(clientState,index,value)
  size=len(bytes(value))
  if size<CONFIG_CHUNK then clientState.commands=clientState.commands+[quoteCommand("cs",index,value)];return 1 end if
  sent=0;remaining=size;count=0
  while remaining>0
    kind="bcs1";if sent==0 then kind="bcs0" else if remaining<CONFIG_CHUNK then kind="bcs2" end if
    partLength=CONFIG_PAYLOAD;if remaining<partLength then partLength=remaining end if
    part=decode(slice(bytes(value),sent,partLength))
    clientState.commands=clientState.commands+[quoteCommand(kind,index,part)]
    sent=sent+CONFIG_PAYLOAD;remaining=remaining-CONFIG_PAYLOAD;count=count+1
  end while
  return count
end function

/// Set configstring in server.init_runtime; the normal completion returns `delivered`.
/// @param state Record exposing `sv`, `svs`.
/// @param index Index passed as `index` to `mq3.server.init_runtime.requireConfigIndex`.
/// @param value Value passed as `value` to `mq3.server.init_runtime.sendConfig`.
function SV_SetConfigstring(state,index,value)
  requireConfigIndex(index);if value==void then value="" end if
  if state.sv.configstrings[index]==value then return 0 end if
  state.sv.configstrings[index]=value
  delivered=0
  if state.sv.state==SS_GAME or state.sv.restarting then
    for each clientState in state.svs.clients
      if clientState.state>=CS_PRIMED and not (index==CS_SERVERINFO and clientState.noServerInfo) then delivered=delivered+sendConfig(clientState,index,value) end if
    end for
  end if
  return delivered
end function
/// Get configstring in server.init_runtime; the normal completion returns `bounded(state.sv.configstrings[index], bufferSize)`.
/// @param state Record exposing `sv`.
/// @param index Index passed as `index` to `mq3.server.init_runtime.requireConfigIndex`.
/// @param bufferSize Capacity passed as `capacity` to `mq3.server.init_runtime.bounded`.
function SV_GetConfigstring(state,index,bufferSize) requireConfigIndex(index);return bounded(state.sv.configstrings[index],bufferSize) end function

/// Compute require client in server.init_runtime; the normal completion returns `state.svs.clients[index]`.
/// @param state Record exposing `maxClients`, `svs`.
/// @param index Zero-based index into `state.svs.clients`.
function requireClient(state,index)
  if index<0 or index>=state.maxClients or index>=len(state.svs.clients) then return error(7380,"bad client index "+str(index)) end if
  return state.svs.clients[index]
end function
/// Set userinfo in server.init_runtime.
/// @param state State passed as `state` to `mq3.server.init_runtime.requireClient`.
/// @param index Index passed as `index` to `mq3.server.init_runtime.requireClient`.
/// @param value Text passed as `text` to `mq3.server.init_runtime.bounded`.
function SV_SetUserinfo(state,index,value)
  target=requireClient(state,index);if value==void then value="" end if
  target.userinfo=bounded(value,MAX_INFO_STRING);target.name=bounded(info.value(value,"name"),MAX_NAME_LENGTH);return void
end function
/// Return `mq3.server.init_runtime.bounded(requireClient(state, index).userinfo, bufferSize)` from `server.init_runtime.SV_GetUserinfo`.
/// @param state State passed as `state` to `mq3.server.init_runtime.requireClient`.
/// @param index Index passed as `index` to `mq3.server.init_runtime.requireClient`.
/// @param bufferSize Capacity passed as `capacity` to `mq3.server.init_runtime.bounded`.
function SV_GetUserinfo(state,index,bufferSize) return bounded(requireClient(state,index).userinfo,bufferSize) end function

/// Create baseline in server.init_runtime; the normal completion returns `count`.
/// @param state Record exposing `sv`.
function SV_CreateBaseline(state)
  count=0
  for index=1 to state.sv.numEntities-1
    source=state.sv.entities[index]
    if source.linked then source.state.number=index;state.sv.baselines[index]=entitystate.copy(source.state);count=count+1 end if
  end for
  return count
end function

/// Compute requested max in server.init_runtime; the normal completion returns `value.integer`.
/// @param state Record exposing `registry`, `maxClients`.
function requestedMax(state)
  value=cvar.find(state.registry,"sv_maxclients");if value==void then return state.maxClients end if;return value.integer
end function
/// Update `state.maxClients` in server.init_runtime; the normal completion returns `wanted`.
///
/// Direct state writes: `state.maxClients`.
/// @param state Record exposing `registry`. Updated in place: `maxClients`.
/// @param minimum Minimum used in `(wanted < minimum)`.
function SV_BoundMaxClients(state,minimum)
  value=cvar.get(state.registry,"sv_maxclients","8",cvar.SERVERINFO|cvar.LATCH);value.modified=false
  wanted=value.integer;if wanted<minimum then wanted=minimum else if wanted>MAX_CLIENTS then wanted=MAX_CLIENTS end if
  if wanted!=value.integer then cvar.set2(state.registry,"sv_maxclients",str(wanted),true) end if
  state.maxClients=wanted;return wanted
end function
/// Compute snapshot count in server.init_runtime; the normal completion returns `((state.maxClients * 4) * MAX_PACKET_ENTITIES)`.
/// @param state Record exposing `dedicated`, `maxClients`.
function snapshotCount(state)
  if state.dedicated!=0 then return state.maxClients*PACKET_BACKUP*MAX_PACKET_ENTITIES end if
  return state.maxClients*4*MAX_PACKET_ENTITIES
end function
/// Compute fresh clients in server.init_runtime; the normal completion returns `result`.
/// @param count Count used in `(count - 1)`.
function freshClients(count)
  result=[];for index=0 to count-1 result=result+[client(index)] end for;return result
end function
/// Update `state.running` in server.init_runtime; the normal completion returns `state.maxClients`.
///
/// Validation failures include `SV_Startup: svs.initialized`.
/// Direct state writes: `state.running`.
/// @param state Record exposing `svs`, `maxClients`, `registry`. Updated in place: `running`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
function SV_Startup(state,host)
  if state.svs.initialized then return error(7381,"SV_Startup: svs.initialized") end if
  SV_BoundMaxClients(state,1);state.svs.clients=freshClients(state.maxClients);state.svs.numSnapshotEntities=snapshotCount(state);state.svs.initialized=true;state.running=true
  cvar.set2(state.registry,"sv_running","1",true);action(host,"cvar","sv_running","1",void);return state.maxClients
end function
/// Test change max clients in server.init_runtime; the normal completion returns `true`.
/// @param state Record exposing `maxClients`, `svs`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
function SV_ChangeMaxClients(state,host)
  count=0
  for index=0 to state.maxClients-1 if state.svs.clients[index].state>=CS_CONNECTED and index>count then count=index end if end for
  count=count+1;oldMax=state.maxClients;oldClients=state.svs.clients;SV_BoundMaxClients(state,count)
  if state.maxClients==oldMax then return false end if
  state.svs.clients=freshClients(state.maxClients)
  for index=0 to count-1 if oldClients[index].state>=CS_CONNECTED then state.svs.clients[index]=oldClients[index] end if end for
  state.svs.numSnapshotEntities=snapshotCount(state);action(host,"resize",oldMax,state.maxClients,count);return true
end function

/// Clear server in server.init_runtime.
/// @param state Record exposing `sv`.
function SV_ClearServer(state)
  state.sv.state=SS_DEAD;state.sv.restarting=false;state.sv.configstrings=array(MAX_CONFIGSTRINGS,"");state.sv.numEntities=0
  state.sv.checksumFeed=0;state.sv.serverId=0;state.sv.restartedServerId=0;state.sv.checksumFeedServerId=0;state.sv.mapChecksum=0;state.sv.mapname=""
  for index=0 to 1023 state.sv.entities[index]=sharedEntity();state.sv.baselines[index]=entitystate.create() end for
  return void
end function
/// Test touch c game in server.init_runtime; the normal completion returns `false`.
/// @param state Reserved argument; this implementation does not read its value.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
function SV_TouchCGame(state,host)
  handle=action(host,"open","vm/cgame.qvm",false,void)
  if handle!=void and handle!=0 then action(host,"close",handle,void,void);return true end if
  return false
end function

/// Compute seed in server.init_runtime; the normal completion returns `((((first & 32767) << 16) ^ (second & 32767)) ^ extra)`.
/// @param state Record exposing `frameTime`.
/// @param host Record exposing `millisecondsFn`, `randomFn`.
function seed(state,host)
  now=state.frameTime;if host!=void and host.millisecondsFn!=void then now=host.millisecondsFn(host) end if
  first=1103515245*now+12345;second=1103515245*first+12345;extra=now
  if host!=void and host.randomFn!=void then first=host.randomFn(host);second=host.randomFn(host) end if
  return ((first&32767)<<16)^(second&32767)^extra
end function
/// Compute reconnect clients in server.init_runtime; the normal completion returns `kept`.
/// @param state Record exposing `maxClients`, `svs`, `sv`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
/// @param killBots Kill bots used in `(current.bot and killBots)`.
function reconnectClients(state,host,killBots)
  kept=0
  for index=0 to state.maxClients-1
    current=state.svs.clients[index]
    if current.state>=CS_CONNECTED then
      if current.bot and killBots then action(host,"drop",index,"",void);current.state=CS_FREE
      else
        denied=action(host,"client-connect",index,false,current.bot)
        if denied!=void and denied!="" then action(host,"drop",index,denied,void);current.state=CS_FREE
        else if current.bot then current.state=CS_ACTIVE;current.gentityNumber=index;state.sv.entities[index].state.number=index;current.deltaMessage=-1;current.nextSnapshotTime=state.svs.time;action(host,"client-begin",index,void,void)
          else current.state=CS_CONNECTED end if
          kept=kept+1
      end if
    end if
  end for
  return kept
end function

/// Update `state.gametypeModified`, `state.modifiedFlags` in server.init_runtime; the normal completion returns `checksum`.
///
/// Direct state writes: `state.gametypeModified`, `state.modifiedFlags`.
/// @param state Record exposing `running`, `registry`, `svs`, `sv`, `frameTime`, `pure`, `dedicated` and further fields. Updated in place: `gametypeModified`, `modifiedFlags`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
/// @param mapName A passed as `a` to `mq3.server.init_runtime.action`.
/// @param killBots Kill bots passed as `killBots` to `mq3.server.init_runtime.reconnectClients`.
function SV_SpawnServer(state,host,mapName,killBots)
  action(host,"shutdown-game",void,void,void);action(host,"map-loading",mapName,void,void);action(host,"shutdown-client",void,void,void);action(host,"clear-hunk",void,void,void);action(host,"clear-cm",void,void,void)
  if not state.running then SV_Startup(state,host) else value=cvar.find(state.registry,"sv_maxclients");if value!=void and value.modified then SV_ChangeMaxClients(state,host) end if end if
  action(host,"clear-pak-references",0,void,void);state.svs.snapshotEntities=array(state.svs.numSnapshotEntities,void);state.svs.nextSnapshotEntities=0;state.svs.snapFlagServerBit=state.svs.snapFlagServerBit^SNAPFLAG_SERVERCOUNT
  cvar.set2(state.registry,"nextmap","map_restart 0",true);SV_ClearServer(state);cvar.set2(state.registry,"cl_paused","0",true)
  state.sv.checksumFeed=seed(state,host);action(host,"fs-restart",state.sv.checksumFeed,void,void)
  checksum=action(host,"load-map","maps/"+mapName+".bsp",false,void);if checksum==void then checksum=0 end if
  state.sv.mapname=mapName;state.sv.mapChecksum=checksum;cvar.set2(state.registry,"mapname",mapName,true);cvar.set2(state.registry,"sv_mapChecksum",str(checksum),true)
  state.sv.serverId=state.frameTime;state.sv.restartedServerId=state.frameTime;state.sv.checksumFeedServerId=state.frameTime;cvar.set2(state.registry,"sv_serverid",str(state.frameTime),true)
  action(host,"clear-world",void,void,void);state.sv.state=SS_LOADING;action(host,"init-game",void,void,void);state.gametypeModified=false
  for frame=0 to 2 action(host,"game-frame",state.svs.time,void,void);action(host,"bot-frame",state.svs.time,void,void);state.svs.time=state.svs.time+100 end for
  SV_CreateBaseline(state);reconnectClients(state,host,killBots)
  action(host,"game-frame",state.svs.time,void,void);action(host,"bot-frame",state.svs.time,void,void);state.svs.time=state.svs.time+100
  if state.pure!=0 then
    loaded=action(host,"loaded-pak-checksums",void,void,void);if loaded==void then loaded="" end if;cvar.set2(state.registry,"sv_paks",loaded,true)
    names=action(host,"loaded-pak-names",void,void,void);if names==void then names="" end if;cvar.set2(state.registry,"sv_pakNames",names,true)
    if state.dedicated!=0 then SV_TouchCGame(state,host) end if
  else cvar.set2(state.registry,"sv_paks","",true);cvar.set2(state.registry,"sv_pakNames","",true) end if
  referenced=action(host,"referenced-pak-checksums",void,void,void);if referenced==void then referenced="" end if;cvar.set2(state.registry,"sv_referencedPaks",referenced,true)
  referencedNames=action(host,"referenced-pak-names",void,void,void);if referencedNames==void then referencedNames="" end if;cvar.set2(state.registry,"sv_referencedPakNames",referencedNames,true)
  systemInfo=action(host,"system-info",void,void,void);if systemInfo==void then systemInfo="" end if;SV_SetConfigstring(state,CS_SYSTEMINFO,systemInfo);state.modifiedFlags=state.modifiedFlags&(~cvar.SYSTEMINFO)
  serverInfo=action(host,"server-info",void,void,void);if serverInfo==void then serverInfo="" end if;SV_SetConfigstring(state,CS_SERVERINFO,serverInfo);state.modifiedFlags=state.modifiedFlags&(~cvar.SERVERINFO)
  state.sv.state=SS_GAME;action(host,"heartbeat",void,void,void);action(host,"hunk-mark",void,void,void);return checksum
end function

/// Register cvars in server.init_runtime; the normal completion returns `len(specs)`.
/// @param state Record exposing `registry`.
function registerCvars(state)
  specs=[
    ["dmflags","0",cvar.SERVERINFO],["fraglimit","20",cvar.SERVERINFO],["timelimit","0",cvar.SERVERINFO],["g_gametype","0",cvar.SERVERINFO|cvar.LATCH],["sv_keywords","",cvar.SERVERINFO],["protocol","68",cvar.SERVERINFO|cvar.ROM],["mapname","nomap",cvar.SERVERINFO|cvar.ROM],["sv_privateClients","0",cvar.SERVERINFO],["sv_hostname","noname",cvar.SERVERINFO|cvar.ARCHIVE],["sv_maxclients","8",cvar.SERVERINFO|cvar.LATCH],
    ["sv_maxRate","0",cvar.ARCHIVE|cvar.SERVERINFO],["sv_minPing","0",cvar.ARCHIVE|cvar.SERVERINFO],["sv_maxPing","0",cvar.ARCHIVE|cvar.SERVERINFO],["sv_floodProtect","1",cvar.ARCHIVE|cvar.SERVERINFO],["sv_cheats","1",cvar.SYSTEMINFO|cvar.ROM],["sv_serverid","0",cvar.SYSTEMINFO|cvar.ROM],["sv_pure","1",cvar.SYSTEMINFO],["sv_paks","",cvar.SYSTEMINFO|cvar.ROM],["sv_pakNames","",cvar.SYSTEMINFO|cvar.ROM],["sv_referencedPaks","",cvar.SYSTEMINFO|cvar.ROM],["sv_referencedPakNames","",cvar.SYSTEMINFO|cvar.ROM],
    ["rconPassword","",cvar.TEMP],["sv_privatePassword","",cvar.TEMP],["sv_fps","20",cvar.TEMP],["sv_timeout","200",cvar.TEMP],["sv_zombietime","2",cvar.TEMP],["nextmap","",cvar.TEMP],["sv_allowDownload","0",cvar.SERVERINFO],["sv_master1","master.quake3arena.com",0],["sv_master2","",cvar.ARCHIVE],["sv_master3","",cvar.ARCHIVE],["sv_master4","",cvar.ARCHIVE],["sv_master5","",cvar.ARCHIVE],["sv_reconnectlimit","3",0],["sv_showloss","0",0],["sv_padPackets","0",0],["sv_killserver","0",0],["sv_mapChecksum","",cvar.ROM],["sv_lanForceRate","1",cvar.ARCHIVE],["sv_strictAuth","1",cvar.ARCHIVE]
  ]
  for each spec in specs cvar.get(state.registry,spec[0],spec[1],spec[2]) end for
  return len(specs)
end function
/// Update `state.operatorCommands`, `state.botInitialized` in server.init_runtime; the normal completion returns `count`.
///
/// Direct state writes: `state.operatorCommands`, `state.botInitialized`.
/// @param state Updated in place: `operatorCommands`, `botInitialized`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
function SV_Init(state,host)
  action(host,"add-operator-commands",void,void,void);state.operatorCommands=true;count=registerCvars(state);action(host,"bot-cvars",void,void,void);action(host,"botlib-init",void,void,void);state.botInitialized=true;return count
end function

/// Compute final message in server.init_runtime; the normal completion returns `snapshots`.
/// @param state Record exposing `maxClients`, `svs`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.action`.
/// @param message Message used in `("print \"" + message)` and `(("print \"" + message) + "\"")`.
function SV_FinalMessage(state,host,message)
  snapshots=0
  for pass=0 to 1
    for index=0 to state.maxClients-1
      current=state.svs.clients[index]
      if current.state>=CS_CONNECTED then
        if not current.loopback then current.commands=current.commands+["print \""+message+"\"","disconnect"] end if
        current.nextSnapshotTime=-1;action(host,"snapshot",index,pass,void);snapshots=snapshots+1
      end if
    end for
  end for
  return snapshots
end function
/// Update `state.svs`, `state.running`, `state.operatorCommands`, `state.shutdown` in server.init_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.svs`, `state.running`, `state.operatorCommands`, `state.shutdown`.
/// @param state Record exposing `running`, `svs`, `errorEntered`, `registry`. Updated in place: `svs`, `running`, `operatorCommands`, `shutdown`.
/// @param host Host passed as `host` to `mq3.server.init_runtime.SV_FinalMessage`.
/// @param finalMessage Message passed as `message` to `mq3.server.init_runtime.SV_FinalMessage`.
function SV_Shutdown(state,host,finalMessage)
  if not state.running then return false end if
  if len(state.svs.clients)>0 and not state.errorEntered then SV_FinalMessage(state,host,finalMessage) end if
  action(host,"remove-operator-commands",void,void,void);action(host,"master-shutdown",void,void,void);action(host,"shutdown-game",void,void,void);SV_ClearServer(state)
  state.svs=staticState();state.running=false;state.operatorCommands=false;state.shutdown=true;cvar.set2(state.registry,"sv_running","0",true);cvar.set2(state.registry,"ui_singlePlayerActive","0",true);action(host,"client-disconnect",false,void,void);return true
end function
