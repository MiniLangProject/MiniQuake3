// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete be_aas_bspq3.c ownership.  The Q3 BSP build deliberately leaves
// BSP-leaf entity linking and trace-light sampling as stubs; those behaviours
// are preserved while collision and entity text use the engine import path.
package mq3.botlib.aas_bspq3

import mq3.botlib.server_imports as imports
import mq3.shared.parser as parser
import mq3.compat.textnumbers as numbers

const MAX_BSPENTITIES=2048
const BLERR_NOERROR=0

/// `State` record for aas bspq3, containing `loaded`, `entDataSize`, `dentData`, `numEntities` and `entities`.
struct State loaded entDataSize dentData numEntities entities end struct
/// Create a `mq3.botlib.aas_bspq3.State` record with the declared empty defaults.
function create() return State(false,0,"",0,[]) end function

/// Forward `AAS_Trace` to `mq3.botlib.server_imports.BotImport_Trace` and return the delegated result.
/// @param host Host service configuration; accesses `traceFn` and `context`.
/// @param start Value passed as argument 2 to `host.traceFn`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param finish Value passed as argument 5 to `host.traceFn`.
/// @param passent Value passed as argument 6 to `host.traceFn`.
/// @param contentmask Value passed as argument 7 to `host.traceFn`.
function AAS_Trace(host,start,mins,maxs,finish,passent,contentmask) return imports.BotImport_Trace(start,mins,maxs,finish,passent,contentmask,host) end function
/// Forward `AAS_PointContents` to `mq3.botlib.server_imports.BotImport_PointContents` and return the delegated result.
/// @param host Host service configuration; accesses `pointContentsFn` and `context`.
/// @param point Three-component point used by the geometric query.
function AAS_PointContents(host,point) return imports.BotImport_PointContents(point,host) end function
/// Apply `mq3.botlib.server_imports.BotImport_EntityTrace` while evaluating `AAS_EntityCollision`. Return paths include `[false,originalTrace]`.
/// @param host Host service configuration; accesses `entityTraceFn` and `context`.
/// @param entnum Entity number in the game or AAS entity table.
/// @param start Value passed as argument 2 to `host.entityTraceFn`.
/// @param boxmins Minimum coordinates of the axis-aligned bounds.
/// @param boxmaxs Maximum coordinates of the axis-aligned bounds.
/// @param finish Value passed as argument 5 to `host.entityTraceFn`.
/// @param contentmask Value passed as argument 7 to `host.entityTraceFn`.
/// @param originalTrace Original trace record; accesses `fraction`.
function AAS_EntityCollision(host,entnum,start,boxmins,boxmaxs,finish,contentmask,originalTrace)
  enttrace=imports.BotImport_EntityTrace(start,boxmins,boxmaxs,finish,entnum,contentmask,host);if enttrace is error then return enttrace end if
  if enttrace.fraction<originalTrace.fraction then return [true,enttrace] end if;return [false,originalTrace]
end function
/// Forward `AAS_inPVS` to `mq3.botlib.server_imports.BotImport_inPVS` and return the delegated result.
/// @param host Host service configuration; accesses `inPvsFn` and `context`.
/// @param p1 Value passed as argument 2 to `host.inPvsFn`.
/// @param p2 Value passed as argument 3 to `host.inPvsFn`.
function AAS_inPVS(host,p1,p2) return imports.BotImport_inPVS(p1,p2,host) end function
/// Return `true` for `AAS_inPHS`.
/// @param p1 Not read by this implementation; retained in the `AAS_inPHS` signature.
/// @param p2 Not read by this implementation; retained in the `AAS_inPHS` signature.
function AAS_inPHS(p1,p2) return true end function
/// Forward `AAS_BSPModelMinsMaxsOrigin` to `mq3.botlib.server_imports.BotImport_BSPModelMinsMaxsOrigin` and return the delegated result.
/// @param host Host service configuration; accesses `modelBoundsFn` and `context`.
/// @param modelnum Value passed as argument 2 to `host.modelBoundsFn`.
/// @param angles Pitch, yaw and roll angles in degrees.
function AAS_BSPModelMinsMaxsOrigin(host,modelnum,angles) return imports.BotImport_BSPModelMinsMaxsOrigin(modelnum,angles,host) end function

// These are intentional empty Q3 implementations, not missing adapters.
/// @param leaves Not read by this implementation; retained in the `AAS_UnlinkFromBSPLeaves` signature.
function AAS_UnlinkFromBSPLeaves(leaves) return void end function
/// Return `void` for `AAS_BSPLinkEntity`.
/// @param absmins Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature.
/// @param absmaxs Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature.
/// @param entnum Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature.
/// @param modelnum Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature.
function AAS_BSPLinkEntity(absmins,absmaxs,entnum,modelnum) return void end function
/// Return `0` for `AAS_BoxEntities`.
/// @param absmins Not read by this implementation; retained in the `AAS_BoxEntities` signature.
/// @param absmaxs Not read by this implementation; retained in the `AAS_BoxEntities` signature.
/// @param list Not read by this implementation; retained in the `AAS_BoxEntities` signature.
/// @param maxcount Not read by this implementation; retained in the `AAS_BoxEntities` signature.
function AAS_BoxEntities(absmins,absmaxs,list,maxcount) return 0 end function
/// Return `0` for `AAS_BSPTraceLight`.
/// @param start Not read by this implementation; retained in the `AAS_BSPTraceLight` signature.
/// @param finish Not read by this implementation; retained in the `AAS_BSPTraceLight` signature.
/// @param endpos Not read by this implementation; retained in the `AAS_BSPTraceLight` signature.
/// @param red Not read by this implementation; retained in the `AAS_BSPTraceLight` signature.
/// @param green Not read by this implementation; retained in the `AAS_BSPTraceLight` signature.
/// @param blue Not read by this implementation; retained in the `AAS_BSPTraceLight` signature.
function AAS_BSPTraceLight(start,finish,endpos,red,green,blue) return 0 end function
// Declared by be_aas_bsp.h but not defined by the released Q3 BSP backend.
// Keep explicit compatibility entry points so callers see the same inert path.
/// @param text Not read by this implementation; retained in the `AAS_PrintFreeBSPLinks` signature.
function AAS_PrintFreeBSPLinks(text) return void end function
/// Return `false` for `AAS_AreasConnected`.
/// @param area1 Not read by this implementation; retained in the `AAS_AreasConnected` signature.
/// @param area2 Not read by this implementation; retained in the `AAS_AreasConnected` signature.
function AAS_AreasConnected(area1,area2) return false end function

/// Advance to the next valid BSP entity number, returning zero at the end of the entity table.
/// @param state AAS bspq3 state; accesses `numEntities`.
/// @param entity Operand used to evaluate the returned expression `entity`.
function AAS_NextBSPEntity(state,entity)
  entity=entity+1;if state!=void and entity>=1 and entity<state.numEntities then return entity end if;return 0
end function
/// Test `state!=void and entity>0 and entity<state.numEntities` as the condition for `AAS_BSPEntityInRange`.
/// @param state AAS bspq3 state; accesses `numEntities`.
/// @param entity Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`.
function AAS_BSPEntityInRange(state,entity) return state!=void and entity>0 and entity<state.numEntities end function
/// Apply `mq3.botlib.aas_bspq3.AAS_BSPEntityInRange` while evaluating `AAS_ValueForBSPEpairKey`. Return paths include `[false,""]`.
/// @param state AAS bspq3 state; accesses `entities`.
/// @param entity Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`.
/// @param key Lookup text matched against `pair[0]`.
function AAS_ValueForBSPEpairKey(state,entity,key)
  if not AAS_BSPEntityInRange(state,entity) then return [false,""] end if
  for each pair in state.entities[entity] if pair[0]==key then return [true,pair[1]] end if end for;return [false,""]
end function
/// Apply `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` while evaluating `AAS_VectorForBSPEpairKey`. Return paths include `[true,parsed[1]]`.
/// @param state AAS bspq3 state; accesses `entities`.
/// @param entity Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`.
/// @param key Lookup key or field name used by the operation.
function AAS_VectorForBSPEpairKey(state,entity,key)
  pair=AAS_ValueForBSPEpairKey(state,entity,key);if not pair[0] then return [false,[0.0,0.0,0.0]] end if
  parsed=numbers.vector(pair[1],[0.0,0.0,0.0]);return [true,parsed[1]]
end function
/// Apply `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` while evaluating `AAS_FloatForBSPEpairKey`. Return paths include `[true,numbers.atof32(pair[1])]`.
/// @param state AAS bspq3 state; accesses `entities`.
/// @param entity Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`.
/// @param key Lookup key or field name used by the operation.
function AAS_FloatForBSPEpairKey(state,entity,key)
  pair=AAS_ValueForBSPEpairKey(state,entity,key);if not pair[0] then return [false,0.0] end if;return [true,numbers.atof32(pair[1])]
end function
/// Apply `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` while evaluating `AAS_IntForBSPEpairKey`. Return paths include `[true,numbers.atoi(pair[1])]`.
/// @param state AAS bspq3 state; accesses `entities`.
/// @param entity Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`.
/// @param key Lookup key or field name used by the operation.
function AAS_IntForBSPEpairKey(state,entity,key)
  pair=AAS_ValueForBSPEpairKey(state,entity,key);if not pair[0] then return [false,0] end if;return [true,numbers.atoi(pair[1])]
end function

/// Set `state.entities` to `[]` and `state.numEntities` to `0` in `mq3.botlib.aas_bspq3.AAS_FreeBSPEntities`.
/// @param state AAS bspq3 state; accesses `entities` and `numEntities`. May update `state.entities` and `state.numEntities` in place.
function AAS_FreeBSPEntities(state) if state!=void then state.entities=[];state.numEntities=0 end if;return void end function
/// Set `state.entities` to `entities` and `state.numEntities` to `len(entities)` in `mq3.botlib.aas_bspq3.AAS_ParseBSPEntities`. Return paths include `state.numEntities-1`.
/// @param state AAS bspq3 state; accesses `dentData`, `entities` and `numEntities`. May update `state.entities` and `state.numEntities` in place.
function AAS_ParseBSPEntities(state)
  if state==void then return error(7628,"AAS BSP state missing") end if
  reader=parser.create(state.dentData);entities=[[]]
  while true
    token=parser.parseExt(reader,true);if token=="" then break end if;if token!="{" then AAS_FreeBSPEntities(state);return error(7628,"invalid BSP entity opening token "+token) end if
    if len(entities)>=MAX_BSPENTITIES then break end if;fields=[]
    while true
      key=parser.parseExt(reader,true);if key=="}" then break end if;if key=="" then AAS_FreeBSPEntities(state);return error(7628,"missing BSP entity closing brace") end if
      value=parser.parseExt(reader,true);if value=="" or value=="}" then AAS_FreeBSPEntities(state);return error(7628,"missing BSP entity value") end if
      // The C list is prepended, so duplicate keys resolve to the last pair.
      fields=[[key,value]]+fields
    end while
    entities=entities+[fields]
  end while
  state.entities=entities;state.numEntities=len(entities);return state.numEntities-1
end function
/// Update `state.dentData`, `state.entDataSize` and `state.loaded` during `AAS_DumpBSPData`.
/// @param state AAS bspq3 state; accesses `dentData`, `entDataSize` and `loaded`. May update `state.dentData`, `state.entDataSize` and `state.loaded` in place.
function AAS_DumpBSPData(state)
  if state==void then return void end if;AAS_FreeBSPEntities(state);state.dentData="";state.entDataSize=0;state.loaded=false;return void
end function
/// Update `state.dentData`, `state.entDataSize` and `state.loaded` during `AAS_LoadBSPFile`. Return paths include `BLERR_NOERROR`.
/// @param state AAS bspq3 state; accesses `dentData`, `entDataSize` and `loaded`. May update `state.dentData`, `state.entDataSize` and `state.loaded` in place.
/// @param entityData Value passed as argument 1 to `bytes`.
function AAS_LoadBSPFile(state,entityData)
  if state==void then return error(7628,"AAS BSP state missing") end if;AAS_DumpBSPData(state);if entityData==void then entityData="" end if
  raw=bytes(entityData);size=0;while size<len(raw) and raw[size]!=0 size=size+1 end while
  state.dentData=decode(slice(raw,0,size));state.entDataSize=size+1;parsed=AAS_ParseBSPEntities(state);if parsed is error then return parsed end if;state.loaded=true;return BLERR_NOERROR
end function

/// Decode the BSP contents mask into the ordered names of the enabled contents flags.
/// @param contents Value used by `PrintContents` in `for each pair in values if (contents&pair[0])!=0 then result=result+[pair[1]] end if end for`.
function PrintContents(contents)
  // Debug-only table in the original.  Return the matching names so a host can
  // print them without making diagnostics part of deterministic gameplay.
  values=[[1,"CONTENTS_SOLID"],[2,"CONTENTS_WINDOW"],[4,"CONTENTS_AUX"],[8,"CONTENTS_LAVA"],[16,"CONTENTS_SLIME"],[32,"CONTENTS_WATER"],[64,"CONTENTS_MIST"],[64,"LAST_VISIBLE_CONTENTS"],[32768,"CONTENTS_AREAPORTAL"],[65536,"CONTENTS_PLAYERCLIP"],[131072,"CONTENTS_MONSTERCLIP"],[262144,"CONTENTS_CURRENT_0"],[524288,"CONTENTS_CURRENT_90"],[1048576,"CONTENTS_CURRENT_180"],[2097152,"CONTENTS_CURRENT_270"],[4194304,"CONTENTS_CURRENT_UP"],[8388608,"CONTENTS_CURRENT_DOWN"],[16777216,"CONTENTS_ORIGIN"],[33554432,"CONTENTS_MONSTER"],[67108864,"CONTENTS_DEADMONSTER"],[134217728,"CONTENTS_DETAIL"],[268435456,"CONTENTS_TRANSLUCENT"],[536870912,"CONTENTS_LADDER"]];result=[]
  for each pair in values if (contents&pair[0])!=0 then result=result+[pair[1]] end if end for;return result
end function
