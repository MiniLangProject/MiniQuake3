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

struct State loaded entDataSize dentData numEntities entities end struct
function create() return State(false,0,"",0,[]) end function

function AAS_Trace(host,start,mins,maxs,finish,passent,contentmask) return imports.BotImport_Trace(start,mins,maxs,finish,passent,contentmask,host) end function
function AAS_PointContents(host,point) return imports.BotImport_PointContents(point,host) end function
function AAS_EntityCollision(host,entnum,start,boxmins,boxmaxs,finish,contentmask,originalTrace)
  enttrace=imports.BotImport_EntityTrace(start,boxmins,boxmaxs,finish,entnum,contentmask,host);if enttrace is error then return enttrace end if
  if enttrace.fraction<originalTrace.fraction then return [true,enttrace] end if;return [false,originalTrace]
end function
function AAS_inPVS(host,p1,p2) return imports.BotImport_inPVS(p1,p2,host) end function
function AAS_inPHS(p1,p2) return true end function
function AAS_BSPModelMinsMaxsOrigin(host,modelnum,angles) return imports.BotImport_BSPModelMinsMaxsOrigin(modelnum,angles,host) end function

// These are intentional empty Q3 implementations, not missing adapters.
function AAS_UnlinkFromBSPLeaves(leaves) return void end function
function AAS_BSPLinkEntity(absmins,absmaxs,entnum,modelnum) return void end function
function AAS_BoxEntities(absmins,absmaxs,list,maxcount) return 0 end function
function AAS_BSPTraceLight(start,finish,endpos,red,green,blue) return 0 end function
// Declared by be_aas_bsp.h but not defined by the released Q3 BSP backend.
// Keep explicit compatibility entry points so callers see the same inert path.
function AAS_PrintFreeBSPLinks(text) return void end function
function AAS_AreasConnected(area1,area2) return false end function

function AAS_NextBSPEntity(state,entity)
  entity=entity+1;if state!=void and entity>=1 and entity<state.numEntities then return entity end if;return 0
end function
function AAS_BSPEntityInRange(state,entity) return state!=void and entity>0 and entity<state.numEntities end function
function AAS_ValueForBSPEpairKey(state,entity,key)
  if not AAS_BSPEntityInRange(state,entity) then return [false,""] end if
  for each pair in state.entities[entity] if pair[0]==key then return [true,pair[1]] end if end for;return [false,""]
end function
function AAS_VectorForBSPEpairKey(state,entity,key)
  pair=AAS_ValueForBSPEpairKey(state,entity,key);if not pair[0] then return [false,[0.0,0.0,0.0]] end if
  parsed=numbers.vector(pair[1],[0.0,0.0,0.0]);return [true,parsed[1]]
end function
function AAS_FloatForBSPEpairKey(state,entity,key)
  pair=AAS_ValueForBSPEpairKey(state,entity,key);if not pair[0] then return [false,0.0] end if;return [true,numbers.atof32(pair[1])]
end function
function AAS_IntForBSPEpairKey(state,entity,key)
  pair=AAS_ValueForBSPEpairKey(state,entity,key);if not pair[0] then return [false,0] end if;return [true,numbers.atoi(pair[1])]
end function

function AAS_FreeBSPEntities(state) if state!=void then state.entities=[];state.numEntities=0 end if;return void end function
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
function AAS_DumpBSPData(state)
  if state==void then return void end if;AAS_FreeBSPEntities(state);state.dentData="";state.entDataSize=0;state.loaded=false;return void
end function
function AAS_LoadBSPFile(state,entityData)
  if state==void then return error(7628,"AAS BSP state missing") end if;AAS_DumpBSPData(state);if entityData==void then entityData="" end if
  raw=bytes(entityData);size=0;while size<len(raw) and raw[size]!=0 size=size+1 end while
  state.dentData=decode(slice(raw,0,size));state.entDataSize=size+1;parsed=AAS_ParseBSPEntities(state);if parsed is error then return parsed end if;state.loaded=true;return BLERR_NOERROR
end function

function PrintContents(contents)
  // Debug-only table in the original.  Return the matching names so a host can
  // print them without making diagnostics part of deterministic gameplay.
  values=[[1,"CONTENTS_SOLID"],[2,"CONTENTS_WINDOW"],[4,"CONTENTS_AUX"],[8,"CONTENTS_LAVA"],[16,"CONTENTS_SLIME"],[32,"CONTENTS_WATER"],[64,"CONTENTS_MIST"],[64,"LAST_VISIBLE_CONTENTS"],[32768,"CONTENTS_AREAPORTAL"],[65536,"CONTENTS_PLAYERCLIP"],[131072,"CONTENTS_MONSTERCLIP"],[262144,"CONTENTS_CURRENT_0"],[524288,"CONTENTS_CURRENT_90"],[1048576,"CONTENTS_CURRENT_180"],[2097152,"CONTENTS_CURRENT_270"],[4194304,"CONTENTS_CURRENT_UP"],[8388608,"CONTENTS_CURRENT_DOWN"],[16777216,"CONTENTS_ORIGIN"],[33554432,"CONTENTS_MONSTER"],[67108864,"CONTENTS_DEADMONSTER"],[134217728,"CONTENTS_DETAIL"],[268435456,"CONTENTS_TRANSLUCENT"],[536870912,"CONTENTS_LADDER"]];result=[]
  for each pair in values if (contents&pair[0])!=0 then result=result+[pair[1]] end if end for;return result
end function
