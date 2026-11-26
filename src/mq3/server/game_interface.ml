// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native engine-facing helpers from server/sv_game.c.  VM trap decoding lives
// in vm/syscall_qagame; this module owns the server state and pointer contracts.
package mq3.server.game_interface
import mq3.compat.numeric as n

const SS_DEAD=0
const SS_LOADING=1
const SS_GAME=2
const MAX_GENTITIES=1024

/// SvEntity record for server.game_interface, containing `number`, `areanum`, `areanum2`.
struct SvEntity number areanum areanum2 end struct
/// Create `mq3.server.game_interface.SvEntity` with number=number; areanum=- 1; areanum2=- 1.
/// @param number Initial `number` field stored in the returned or constructed `mq3.server.game_interface.SvEntity` record.
function svEntity(number) return SvEntity(number,-1,-1) end function

/// State record for server.game_interface, containing `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`, `maxClients`, and 4 further fields.
struct State gentities gentitySize numEntities gameClients gameClientSize maxClients serverState serverInfo clients svEntities end struct
/// Compute state in server.game_interface; the normal completion returns `State(0, 0, 0, 0, 0, maxClients, SS_DEAD, "", clients, entities)`.
/// @param maxClients Initial `maxClients` field stored in the returned or constructed `mq3.server.game_interface.State` record.
function state(maxClients)
  entities=[];for number=0 to MAX_GENTITIES-1 entities=entities+[svEntity(number)] end for
  clients=[];for number=0 to maxClients-1 clients=clients+[void] end for
  return State(0,0,0,0,0,maxClients,SS_DEAD,"",clients,entities)
end function

/// Services record for server.game_interface, containing `errorFn`, `printFn`, `sendServerCommandFn`, `dropClientFn`, `pointLeafnumFn`, `leafClusterFn`, and 5 further fields.
struct Services errorFn printFn sendServerCommandFn dropClientFn pointLeafnumFn leafClusterFn leafAreaFn clusterPvsFn adjustAreaPortalFn gameCommandFn context end struct
/// Create `mq3.server.game_interface.Services` with errorFn=void; printFn=void; sendServerCommandFn=void; dropClientFn=void; 7 further fields.
/// @param context Initial `context` field stored in the returned or constructed `mq3.server.game_interface.Services` record.
function services(context) return Services(void,void,void,void,void,void,void,void,void,void,context) end function

/// Return `mq3.compat.numeric.i32(n.floatBits(value))` from `server.game_interface.FloatAsInt`.
/// @param value Floating-point value to narrow and reinterpret.
function FloatAsInt(value) return n.i32(n.floatBits(value)) end function

/// Compute game error in server.game_interface; the normal completion returns `error(7340, text)`.
///
/// Validation failures include `server game interface: missing services`.
/// @param host Record exposing `errorFn`, `context`.
/// @param text Text used in `error(7340, text)` and `host.errorFn(host.context, text)`.
function SV_GameError(host,text)
  if host==void then return error(7340,"server game interface: missing services") end if
  if host.errorFn!=void then return host.errorFn(host.context,text) end if
  return error(7340,text)
end function
/// Compute game print in server.game_interface.
///
/// Validation failures include `server game interface: missing services`.
/// @param host Record exposing `printFn`, `context`.
/// @param text Text used in `host.printFn(host.context, text)`.
function SV_GamePrint(host,text)
  if host==void then return error(7340,"server game interface: missing services") end if
  if host.printFn!=void then host.printFn(host.context,text) end if
  return void
end function

/// Compute require layout in server.game_interface; the normal completion returns `value`.
///
/// Validation failures include `server game interface: game data is not located`.
/// @param value Record exposing `gentitySize`, `gameClientSize`.
function requireLayout(value)
  if value==void or value.gentitySize<=0 or value.gameClientSize<=0 then return error(7341,"server game interface: game data is not located") end if
  return value
end function
/// Compute num for gentity in server.game_interface; the normal completion returns `((address - value.gentities) / value.gentitySize)`.
/// @param value Record exposing `gentities`, `gentitySize`.
/// @param address Address used in `(address - value.gentities)` and `((address - value.gentities) / value.gentitySize)`.
function SV_NumForGentity(value,address)
  checked=requireLayout(value);if checked is error then return checked end if;return (address-value.gentities)/value.gentitySize
end function
/// Compute gentity num in server.game_interface; the normal completion returns `(value.gentities + (value.gentitySize * number))`.
/// @param value Record exposing `gentities`, `gentitySize`.
/// @param number Number used in `(value.gentitySize * number)` and `(value.gentities + (value.gentitySize * number))`.
function SV_GentityNum(value,number)
  checked=requireLayout(value);if checked is error then return checked end if;return value.gentities+value.gentitySize*number
end function
/// Compute game client num in server.game_interface; the normal completion returns `(value.gameClients + (value.gameClientSize * number))`.
/// @param value Record exposing `gameClients`, `gameClientSize`.
/// @param number Number used in `(value.gameClientSize * number)` and `(value.gameClients + (value.gameClientSize * number))`.
function SV_GameClientNum(value,number)
  checked=requireLayout(value);if checked is error then return checked end if;return value.gameClients+value.gameClientSize*number
end function
/// Compute sv entity for gentity in server.game_interface; the normal completion returns `value.svEntities[entityNumber]`.
///
/// Validation failures include `SV_SvEntityForGentity: bad gEnt`.
/// @param value Record exposing `svEntities`.
/// @param entityNumber Zero-based index into `value.svEntities`.
function SV_SvEntityForGentity(value,entityNumber)
  if value==void or entityNumber<0 or entityNumber>=MAX_GENTITIES then return error(7342,"SV_SvEntityForGentity: bad gEnt") end if
  return value.svEntities[entityNumber]
end function
/// Compute g entity for sv entity in server.game_interface; the normal completion returns `SV_GentityNum(value, serverEntity.number)`.
///
/// Validation failures include `SV_GEntityForSvEntity: missing svEnt`.
/// @param value Value passed as `value` to `mq3.server.game_interface.SV_GentityNum`.
/// @param serverEntity Record exposing `number`.
function SV_GEntityForSvEntity(value,serverEntity)
  if serverEntity==void then return error(7342,"SV_GEntityForSvEntity: missing svEnt") end if
  return SV_GentityNum(value,serverEntity.number)
end function

/// Test game send server command in server.game_interface; the normal completion returns `true`.
///
/// Validation failures include `server game interface: missing send service`.
/// @param value Record exposing `maxClients`.
/// @param clientNum Client num used in `(clientNum < 0)` and `(clientNum != - 1)`.
/// @param text Text used in `host.sendServerCommandFn(host.context, clientNum, text)`.
/// @param host Record exposing `sendServerCommandFn`, `context`.
function SV_GameSendServerCommand(value,clientNum,text,host)
  if value==void or host==void or host.sendServerCommandFn==void then return error(7343,"server game interface: missing send service") end if
  if clientNum!=-1 and (clientNum<0 or clientNum>=value.maxClients) then return false end if
  host.sendServerCommandFn(host.context,clientNum,text);return true
end function
/// Test game drop client in server.game_interface; the normal completion returns `true`.
///
/// Validation failures include `server game interface: missing drop service`.
/// @param value Record exposing `maxClients`.
/// @param clientNum Client num used in `(clientNum < 0)` and `(clientNum >= value.maxClients)`.
/// @param reason Reason used in `host.dropClientFn(host.context, clientNum, reason)`.
/// @param host Record exposing `dropClientFn`, `context`.
function SV_GameDropClient(value,clientNum,reason,host)
  if value==void or host==void or host.dropClientFn==void then return error(7343,"server game interface: missing drop service") end if
  if clientNum<0 or clientNum>=value.maxClients then return false end if
  host.dropClientFn(host.context,clientNum,reason);return true
end function

/// Get serverinfo in server.game_interface; the normal completion returns `decode(slice(encoded, 0, count))`.
///
/// Validation failures include `SV_GetServerinfo: bufferSize < 1`.
/// @param value Record exposing `serverInfo`.
/// @param bufferSize Buffer size used in `(bufferSize < 1)` and `(bufferSize - 1)`.
function SV_GetServerinfo(value,bufferSize)
  if value==void or bufferSize<1 then return error(7344,"SV_GetServerinfo: bufferSize < 1") end if
  encoded=bytes(value.serverInfo);count=len(encoded);if count>=bufferSize then count=bufferSize-1 end if
  if count<=0 then return "" end if
  return decode(slice(encoded,0,count))
end function
/// Update `value.gentities`, `value.gentitySize`, `value.numEntities`, `value.gameClients` in server.game_interface.
///
/// Validation failures include `server game interface: invalid game data layout`.
/// Direct state writes: `value.gentities`, `value.gentitySize`, `value.numEntities`, `value.gameClients`, `value.gameClientSize`.
/// @param value Updated in place: `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`.
/// @param gentities Gentities operand used by `SV_LocateGameData`; its reads are shown in the implementation.
/// @param numGEntities Num g entities used in `(numGEntities < 0)` and `((value == void) or (numGEntities < 0))`.
/// @param sizeofGEntity Sizeof g entity used in `(sizeofGEntity <= 0)` and `(((value == void) or (numGEntities < 0)) or (sizeofGEntity <= 0))`.
/// @param clients Clients operand used by `SV_LocateGameData`; its reads are shown in the implementation.
/// @param sizeofGameClient Sizeof game client used in `(sizeofGameClient <= 0)` and `((((value == void) or (numGEntities < 0)) or (sizeofGEntity <= 0)) or (sizeofGameClient <= 0))`.
function SV_LocateGameData(value,gentities,numGEntities,sizeofGEntity,clients,sizeofGameClient)
  if value==void or numGEntities<0 or sizeofGEntity<=0 or sizeofGameClient<=0 then return error(7341,"server game interface: invalid game data layout") end if
  value.gentities=gentities;value.gentitySize=sizeofGEntity;value.numEntities=numGEntities
  value.gameClients=clients;value.gameClientSize=sizeofGameClient;return void
end function
/// Get usercmd in server.game_interface; the normal completion returns `value.clients[clientNum]`.
/// @param value Record exposing `maxClients`, `clients`.
/// @param clientNum Zero-based index into `value.clients`.
function SV_GetUsercmd(value,clientNum)
  if value==void or clientNum<0 or clientNum>=value.maxClients then return error(7345,"SV_GetUsercmd: bad clientNum:"+str(clientNum)) end if
  return value.clients[clientNum]
end function

/// Test in pvs ignore portals in server.game_interface; the normal completion returns `true`.
///
/// Validation failures include `server game interface: missing PVS service`.
/// @param p1 P 1 used in `host.pointLeafnumFn(host.context, p1)`.
/// @param p2 P 2 used in `host.pointLeafnumFn(host.context, p2)`.
/// @param host Record exposing `pointLeafnumFn`, `leafClusterFn`, `clusterPvsFn`, `context`.
function SV_inPVSIgnorePortals(p1,p2,host)
  if host==void or host.pointLeafnumFn==void or host.leafClusterFn==void or host.clusterPvsFn==void then return error(7346,"server game interface: missing PVS service") end if
  firstLeaf=host.pointLeafnumFn(host.context,p1);firstCluster=host.leafClusterFn(host.context,firstLeaf)
  mask=host.clusterPvsFn(host.context,firstCluster)
  secondLeaf=host.pointLeafnumFn(host.context,p2);secondCluster=host.leafClusterFn(host.context,secondLeaf)
  if mask!=void then
    byteIndex=secondCluster>>3
    if secondCluster<0 or byteIndex<0 or byteIndex>=len(mask) then return false end if
    if (mask[byteIndex]&(1<<(secondCluster&7)))==0 then return false end if
  end if
  return true
end function
/// Test adjust area portal state in server.game_interface; the normal completion returns `true`.
///
/// Validation failures include `server game interface: missing area portal service`.
/// @param value Value passed as `value` to `mq3.server.game_interface.SV_SvEntityForGentity`.
/// @param entityNumber Entity number passed as `entityNumber` to `mq3.server.game_interface.SV_SvEntityForGentity`.
/// @param open Open used in `host.adjustAreaPortalFn(host.context, entity.areanum, entity.areanum2, open)`.
/// @param host Record exposing `adjustAreaPortalFn`, `context`.
function SV_AdjustAreaPortalState(value,entityNumber,open,host)
  entity=SV_SvEntityForGentity(value,entityNumber);if entity is error then return entity end if
  if entity.areanum2==-1 then return false end if
  if host==void or host.adjustAreaPortalFn==void then return error(7347,"server game interface: missing area portal service") end if
  host.adjustAreaPortalFn(host.context,entity.areanum,entity.areanum2,open);return true
end function
/// Compute game command in server.game_interface; the normal completion returns `host.gameCommandFn(host.context)`.
///
/// Validation failures include `server game interface: missing game command service`.
/// @param value Record exposing `serverState`.
/// @param host Record exposing `gameCommandFn`, `context`.
function SV_GameCommand(value,host)
  if value==void or value.serverState!=SS_GAME then return 0 end if
  if host==void or host.gameCommandFn==void then return error(7348,"server game interface: missing game command service") end if
  return host.gameCommandFn(host.context)
end function
