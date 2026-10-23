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

struct SvEntity number areanum areanum2 end struct
function svEntity(number) return SvEntity(number,-1,-1) end function

struct State gentities gentitySize numEntities gameClients gameClientSize maxClients serverState serverInfo clients svEntities end struct
function state(maxClients)
  entities=[];for number=0 to MAX_GENTITIES-1 entities=entities+[svEntity(number)] end for
  clients=[];for number=0 to maxClients-1 clients=clients+[void] end for
  return State(0,0,0,0,0,maxClients,SS_DEAD,"",clients,entities)
end function

struct Services errorFn printFn sendServerCommandFn dropClientFn pointLeafnumFn leafClusterFn leafAreaFn clusterPvsFn adjustAreaPortalFn gameCommandFn context end struct
function services(context) return Services(void,void,void,void,void,void,void,void,void,void,context) end function

function FloatAsInt(value) return n.i32(n.floatBits(value)) end function

function SV_GameError(host,text)
  if host==void then return error(7340,"server game interface: missing services") end if
  if host.errorFn!=void then return host.errorFn(host.context,text) end if
  return error(7340,text)
end function
function SV_GamePrint(host,text)
  if host==void then return error(7340,"server game interface: missing services") end if
  if host.printFn!=void then host.printFn(host.context,text) end if
  return void
end function

function requireLayout(value)
  if value==void or value.gentitySize<=0 or value.gameClientSize<=0 then return error(7341,"server game interface: game data is not located") end if
  return value
end function
function SV_NumForGentity(value,address)
  checked=requireLayout(value);if checked is error then return checked end if;return (address-value.gentities)/value.gentitySize
end function
function SV_GentityNum(value,number)
  checked=requireLayout(value);if checked is error then return checked end if;return value.gentities+value.gentitySize*number
end function
function SV_GameClientNum(value,number)
  checked=requireLayout(value);if checked is error then return checked end if;return value.gameClients+value.gameClientSize*number
end function
function SV_SvEntityForGentity(value,entityNumber)
  if value==void or entityNumber<0 or entityNumber>=MAX_GENTITIES then return error(7342,"SV_SvEntityForGentity: bad gEnt") end if
  return value.svEntities[entityNumber]
end function
function SV_GEntityForSvEntity(value,serverEntity)
  if serverEntity==void then return error(7342,"SV_GEntityForSvEntity: missing svEnt") end if
  return SV_GentityNum(value,serverEntity.number)
end function

function SV_GameSendServerCommand(value,clientNum,text,host)
  if value==void or host==void or host.sendServerCommandFn==void then return error(7343,"server game interface: missing send service") end if
  if clientNum!=-1 and (clientNum<0 or clientNum>=value.maxClients) then return false end if
  host.sendServerCommandFn(host.context,clientNum,text);return true
end function
function SV_GameDropClient(value,clientNum,reason,host)
  if value==void or host==void or host.dropClientFn==void then return error(7343,"server game interface: missing drop service") end if
  if clientNum<0 or clientNum>=value.maxClients then return false end if
  host.dropClientFn(host.context,clientNum,reason);return true
end function

function SV_GetServerinfo(value,bufferSize)
  if value==void or bufferSize<1 then return error(7344,"SV_GetServerinfo: bufferSize < 1") end if
  encoded=bytes(value.serverInfo);count=len(encoded);if count>=bufferSize then count=bufferSize-1 end if
  if count<=0 then return "" end if
  return decode(slice(encoded,0,count))
end function
function SV_LocateGameData(value,gentities,numGEntities,sizeofGEntity,clients,sizeofGameClient)
  if value==void or numGEntities<0 or sizeofGEntity<=0 or sizeofGameClient<=0 then return error(7341,"server game interface: invalid game data layout") end if
  value.gentities=gentities;value.gentitySize=sizeofGEntity;value.numEntities=numGEntities
  value.gameClients=clients;value.gameClientSize=sizeofGameClient;return void
end function
function SV_GetUsercmd(value,clientNum)
  if value==void or clientNum<0 or clientNum>=value.maxClients then return error(7345,"SV_GetUsercmd: bad clientNum:"+str(clientNum)) end if
  return value.clients[clientNum]
end function

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
function SV_AdjustAreaPortalState(value,entityNumber,open,host)
  entity=SV_SvEntityForGentity(value,entityNumber);if entity is error then return entity end if
  if entity.areanum2==-1 then return false end if
  if host==void or host.adjustAreaPortalFn==void then return error(7347,"server game interface: missing area portal service") end if
  host.adjustAreaPortalFn(host.context,entity.areanum,entity.areanum2,open);return true
end function
function SV_GameCommand(value,host)
  if value==void or value.serverState!=SS_GAME then return 0 end if
  if host==void or host.gameCommandFn==void then return error(7348,"server game interface: missing game command service") end if
  return host.gameCommandFn(host.context)
end function
