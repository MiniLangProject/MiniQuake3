// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete host-neutral facade for code/botlib/be_aas_file.c.
package mq3.botlib.be_aas_file

import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.fs as fs

const BLERR_NOERROR=0
const BLERR_CANNOTOPENAASFILE=4
const BLERR_WRONGAASFILEID=5
const BLERR_WRONGAASFILEVERSION=6
const BLERR_CANNOTREADAASLUMP=7

/// `Services` record for be aas file, containing `context`, `readFileFn`, `writeFileFn` and `printFn`.
struct Services context readFileFn writeFileFn printFn end struct
/// `State` record for be aas file, containing `services`, `map`, `loaded`, `initialized` and `saveFile` and related fields.
struct State services map loaded initialized saveFile bspChecksum lastError end struct
/// `LumpLoad` record for be aas file, containing `data`, `nextOffset` and `sequential`.
struct LumpLoad data nextOffset sequential end struct
/// `Writer` record for be aas file, containing `header`, `chunks` and `offset`.
struct Writer header chunks offset end struct
/// `FileInfo` record for be aas file, containing `version`, `numVertexes`, `numPlanes`, `numEdges` and `edgeIndexSize` and related fields.
struct FileInfo version numVertexes numPlanes numEdges edgeIndexSize numFaces faceIndexSize numAreas numAreaSettings reachabilitySize numNodes numPortals portalIndexSize numClusters groundedAreas end struct

/// Create a `mq3.botlib.be_aas_file.Services` record, initializing `context` from `context`.
/// @param context Context forwarded to the configured host callbacks.
function services(context) return Services(context,void,void,void) end function
/// Build the `mq3.botlib.be_aas_file.State` result for `create`. Return paths include `State(host,void,false,false,false,0,BLERR_NOERROR)`.
/// @param host Initial value stored in `mq3.botlib.be_aas_file.State.services`.
function create(host) if host==void then host=services(void) end if;return State(host,void,false,false,false,0,BLERR_NOERROR) end function
/// Use `state.services.printFn` to perform `emit`.
/// @param state Be AAS file state; accesses `services`.
/// @param kind Value passed as argument 2 to `state.services.printFn`.
/// @param text Text to parse, format or deliver.
function emit(state,kind,text) if state!=void and state.services!=void and state.services.printFn!=void then state.services.printFn(state.services.context,kind,text) end if;return void end function

/// Set `data[index]` to `data[index]^((index*119)&255)` in `mq3.botlib.be_aas_file.AAS_DData`.
/// @param data Array or byte sequence accessed at `index`. Entries are written in place.
/// @param size Size or capacity supplied to the buffer operation.
function AAS_DData(data,size)
  if data==void or typeof(data)!="bytes" or size<0 or size>len(data) then return error(7892,"AAS_DData invalid range") end if
  if size>0 then for index=0 to size-1 data[index]=data[index]^((index*119)&255) end for end if;return void
end function
/// Report whether an AAS map is available; parsed MiniLang map records require no in-place byte swapping.
/// @param state Be AAS file state; accesses `map`.
function AAS_SwapAASData(state)
  // MiniLang accessors decode and encode little-endian records explicitly, so
  // the in-memory map remains canonical on every host and needs no mutation.
  if state==void or state.map==void then return false end if;return true
end function
/// Update `state.map`, `state.loaded`, `state.initialized` and `state.saveFile` and related state during `AAS_DumpAASData`.
/// @param state Be AAS file state; accesses `map`, `loaded`, `initialized`, `saveFile` and `bspChecksum` and related fields. May update `state.map`, `state.loaded` and `state.initialized` and additional fields in place.
function AAS_DumpAASData(state)
  if state==void then return void end if;state.map=void;state.loaded=false;state.initialized=false;state.saveFile=false;state.bspChecksum=0;state.lastError=BLERR_NOERROR;return void
end function
/// Build the `mq3.botlib.be_aas_file.FileInfo` result for `AAS_FileInfo`.
/// @param state Be AAS file state; accesses `map`.
function AAS_FileInfo(state)
  if state==void or state.map==void then return void end if;m=state.map;grounded=0
  if m.counts[aas.LUMP_AREASETTINGS]>0 then for index=0 to m.counts[aas.LUMP_AREASETTINGS]-1 value=aas.areaSettings(m,index);if (value.flags&aas.AREA_GROUNDED)!=0 then grounded=grounded+1 end if end for end if
  return FileInfo(m.version,m.counts[aas.LUMP_VERTEXES],m.counts[aas.LUMP_PLANES],m.counts[aas.LUMP_EDGES],m.counts[aas.LUMP_EDGEINDEX],m.counts[aas.LUMP_FACES],m.counts[aas.LUMP_FACEINDEX],m.counts[aas.LUMP_AREAS],m.counts[aas.LUMP_AREASETTINGS],m.counts[aas.LUMP_REACHABILITY],m.counts[aas.LUMP_NODES],m.counts[aas.LUMP_PORTALS],m.counts[aas.LUMP_PORTALINDEX],m.counts[aas.LUMP_CLUSTERS],grounded)
end function
/// Build the `mq3.botlib.be_aas_file.LumpLoad` result for `AAS_LoadAASLump`. Return paths include `LumpLoad(slice(data,offset,length),offset+length,offset==lastOffset)`.
/// @param data Sequence whose length bounds the iteration or lookup in `AAS_LoadAASLump`.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param length Value passed as argument 3 to `slice`.
/// @param lastOffset Operand used to evaluate the returned expression `LumpLoad(slice(data,offset,length),offset+length,offset==lastOffset)`.
/// @param elementSize Value used by `AAS_LoadAASLump` in `if data==void or typeof(data)!="bytes" or offset<0 or length<0 or offset>len(data) or length>len(data)-offset or...`.
function AAS_LoadAASLump(data,offset,length,lastOffset,elementSize)
  if data==void or typeof(data)!="bytes" or offset<0 or length<0 or offset>len(data) or length>len(data)-offset or elementSize<=0 or length%elementSize!=0 then return error(7892,"cannot read AAS lump") end if
  return LumpLoad(slice(data,offset,length),offset+length,offset==lastOffset)
end function
/// Use `state.services.readFileFn` to perform `sourceBytes`. Return paths include `fs.readAllBytes(filename)`.
/// @param state Be AAS file state; accesses `services`.
/// @param filename Filename supplied to the configured loader or file service.
function sourceBytes(state,filename)
  if state.services!=void and state.services.readFileFn!=void then return state.services.readFileFn(state.services.context,filename) end if
  return fs.readAllBytes(filename)
end function
/// Record or dispatch `"message"` actions in `AAS_LoadAASFile`. Return paths include `BLERR_NOERROR`.
/// @param state Be AAS file state; accesses `lastError`, `map`, `bspChecksum` and `loaded`. May update `state.lastError`, `state.map` and `state.bspChecksum` and additional fields in place.
/// @param filename Filename supplied to the configured loader or file service.
/// @param expectedChecksum Value used by `AAS_LoadAASFile` in `if expectedChecksum!=void and map.bspChecksum!=expectedChecksum then state.lastError=BLERR_WRONGAASFILEVERSION`.
function AAS_LoadAASFile(state,filename,expectedChecksum)
  if state==void then return BLERR_CANNOTOPENAASFILE end if;AAS_DumpAASData(state);emit(state,"message","trying to load "+filename)
  data=try(sourceBytes(state,filename));if data is error or data==void or typeof(data)!="bytes" then state.lastError=BLERR_CANNOTOPENAASFILE;return state.lastError end if
  if len(data)<8 then state.lastError=BLERR_CANNOTREADAASLUMP;return state.lastError end if
  if n.readI32(data,0)!=aas.AAS_ID then state.lastError=BLERR_WRONGAASFILEID;return state.lastError end if
  version=n.readI32(data,4);if version!=aas.AAS_VERSION_OLD and version!=aas.AAS_VERSION then state.lastError=BLERR_WRONGAASFILEVERSION;return state.lastError end if
  map=try(aas.load(data));if map is error then state.lastError=BLERR_CANNOTREADAASLUMP;return state.lastError end if
  if expectedChecksum!=void and map.bspChecksum!=expectedChecksum then state.lastError=BLERR_WRONGAASFILEVERSION;return state.lastError end if
  state.map=map;state.bspChecksum=map.bspChecksum;state.loaded=true;state.lastError=BLERR_NOERROR;AAS_SwapAASData(state);return BLERR_NOERROR
end function
/// Build the `mq3.botlib.be_aas_file.Writer` result for `writer`. Return paths include `Writer(header,[],aas.HEADER_SIZE)`.
/// @param checksum Value passed as argument 3 to `mq3.compat.numeric.writeU32`.
function writer(checksum) header=bytes(aas.HEADER_SIZE,0);n.writeU32(header,0,aas.AAS_ID);n.writeU32(header,4,aas.AAS_VERSION);n.writeU32(header,8,checksum);return Writer(header,[],aas.HEADER_SIZE) end function
/// Set `output.chunks` to `output.chunks+[slice(data,0,length)]` and `output.offset` to `output.offset+length` in `mq3.botlib.be_aas_file.AAS_WriteAASLump`.
/// @param output Output record; accesses `header`, `offset` and `chunks`. May update `output.chunks` and `output.offset` in place.
/// @param lumpNum Value used by `AAS_WriteAASLump` in `if output==void or lumpNum<0 or lumpNum>=aas.LUMP_COUNT or data==void or typeof(data)!="bytes" or length<0 or le...`.
/// @param data Sequence whose length bounds the iteration or lookup in `AAS_WriteAASLump`.
/// @param length Value passed as argument 3 to `mq3.compat.numeric.writeU32`.
function AAS_WriteAASLump(output,lumpNum,data,length)
  if output==void or lumpNum<0 or lumpNum>=aas.LUMP_COUNT or data==void or typeof(data)!="bytes" or length<0 or length>len(data) then return false end if
  n.writeU32(output.header,12+lumpNum*8,output.offset);n.writeU32(output.header,16+lumpNum*8,length);output.chunks=output.chunks+[slice(data,0,length)];output.offset=output.offset+length;return true
end function
/// Use `state.services.writeFileFn` to perform `destinationWrite`. Return paths include `fs.writeAllBytes(filename,data)`.
/// @param state Be AAS file state; accesses `services`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param data Value passed as argument 3 to `state.services.writeFileFn`.
function destinationWrite(state,filename,data)
  if state.services!=void and state.services.writeFileFn!=void then return state.services.writeFileFn(state.services.context,filename,data) end if
  return fs.writeAllBytes(filename,data)
end function
/// Record or dispatch `"message"` actions in `AAS_WriteAASFile`.
/// @param state Be AAS file state; accesses `map`.
/// @param filename Filename supplied to the configured loader or file service.
function AAS_WriteAASFile(state,filename)
  if state==void or state.map==void then return false end if;emit(state,"message","writing "+filename);output=writer(state.map.bspChecksum)
  for lump=0 to aas.LUMP_COUNT-1 chunk=aas.lumpData(state.map,lump);if chunk is error or not AAS_WriteAASLump(output,lump,chunk,len(chunk)) then return false end if end for
  coded=slice(output.header,8,aas.HEADER_SIZE-8);AAS_DData(coded,len(coded));copyBytes(output.header,8,coded,0,len(coded));data=output.header;for each chunk in output.chunks data=data+chunk end for
  written=try(destinationWrite(state,filename,data));if written is error or written==false then return false end if;return true
end function
