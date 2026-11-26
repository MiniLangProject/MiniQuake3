// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Checked AAS4/AAS5 reader matching code/botlib/aasfile.h and be_aas_file.c.
package mq3.format.aas

import mq3.compat.numeric as n

const AAS_ID=0x53414145
const AAS_VERSION_OLD=4
const AAS_VERSION=5
const HEADER_SIZE=124
const LUMP_COUNT=14
const LUMP_BBOXES=0
const LUMP_VERTEXES=1
const LUMP_PLANES=2
const LUMP_EDGES=3
const LUMP_EDGEINDEX=4
const LUMP_FACES=5
const LUMP_FACEINDEX=6
const LUMP_AREAS=7
const LUMP_AREASETTINGS=8
const LUMP_REACHABILITY=9
const LUMP_NODES=10
const LUMP_PORTALS=11
const LUMP_PORTALINDEX=12
const LUMP_CLUSTERS=13
const AASID=AAS_ID
const AASVERSION_OLD=AAS_VERSION_OLD
const AASVERSION=AAS_VERSION
const AAS_LUMPS=LUMP_COUNT
const AASLUMP_BBOXES=LUMP_BBOXES
const AASLUMP_VERTEXES=LUMP_VERTEXES
const AASLUMP_PLANES=LUMP_PLANES
const AASLUMP_EDGES=LUMP_EDGES
const AASLUMP_EDGEINDEX=LUMP_EDGEINDEX
const AASLUMP_FACES=LUMP_FACES
const AASLUMP_FACEINDEX=LUMP_FACEINDEX
const AASLUMP_AREAS=LUMP_AREAS
const AASLUMP_AREASETTINGS=LUMP_AREASETTINGS
const AASLUMP_REACHABILITY=LUMP_REACHABILITY
const AASLUMP_NODES=LUMP_NODES
const AASLUMP_PORTALS=LUMP_PORTALS
const AASLUMP_PORTALINDEX=LUMP_PORTALINDEX
const AASLUMP_CLUSTERS=LUMP_CLUSTERS

// Complete code/botlib/aasfile.h public ABI.
const PRESENCE_NONE=1
const PRESENCE_NORMAL=2
const PRESENCE_CROUCH=4
const MAX_TRAVELTYPES=32
const TRAVEL_INVALID=1
const TRAVEL_WALK=2
const TRAVEL_CROUCH=3
const TRAVEL_BARRIERJUMP=4
const TRAVEL_JUMP=5
const TRAVEL_LADDER=6
const TRAVEL_WALKOFFLEDGE=7
const TRAVEL_SWIM=8
const TRAVEL_WATERJUMP=9
const TRAVEL_TELEPORT=10
const TRAVEL_ELEVATOR=11
const TRAVEL_ROCKETJUMP=12
const TRAVEL_BFGJUMP=13
const TRAVEL_GRAPPLEHOOK=14
const TRAVEL_DOUBLEJUMP=15
const TRAVEL_RAMPJUMP=16
const TRAVEL_STRAFEJUMP=17
const TRAVEL_JUMPPAD=18
const TRAVEL_FUNCBOB=19
const TRAVELTYPE_MASK=0xffffff
const TRAVELFLAG_NOTTEAM1=0x01000000
const TRAVELFLAG_NOTTEAM2=0x02000000
const FACE_SOLID=1
const FACE_LADDER=2
const FACE_GROUND=4
const FACE_GAP=8
const FACE_LIQUID=16
const FACE_LIQUIDSURFACE=32
const FACE_BRIDGE=64
const AREACONTENTS_WATER=1
const AREACONTENTS_LAVA=2
const AREACONTENTS_SLIME=4
const AREACONTENTS_CLUSTERPORTAL=8
const AREACONTENTS_TELEPORTAL=16
const AREACONTENTS_ROUTEPORTAL=32
const AREACONTENTS_TELEPORTER=64
const AREACONTENTS_JUMPPAD=128
const AREACONTENTS_DONOTENTER=256
const AREACONTENTS_VIEWPORTAL=512
const AREACONTENTS_MOVER=1024
const AREACONTENTS_NOTTEAM1=2048
const AREACONTENTS_NOTTEAM2=4096
const AREACONTENTS_MODELNUMSHIFT=24
const AREACONTENTS_MAXMODELNUM=0xff
const AREACONTENTS_MODELNUM=0xff000000
const AREA_GROUNDED=1
const AREA_LADDER=2
const AREA_LIQUID=4
const AREA_DISABLED=8
const AREA_BRIDGE=16

const BBOX_SIZE=32
const VERTEX_SIZE=12
const PLANE_SIZE=20
const EDGE_SIZE=8
const INDEX_SIZE=4
const FACE_SIZE=24
const AREA_SIZE=48
const AREA_SETTINGS_SIZE=28
const REACHABILITY_SIZE=44
const NODE_SIZE=12
const PORTAL_SIZE=20
const CLUSTER_SIZE=16

/// AAS record for format.aas, containing `data`, `version`, `bspChecksum`, `offsets`, `lengths`, `counts`, and 1 further fields.
struct AAS data version bspChecksum offsets lengths counts sequential end struct
/// BBox record for format.aas, containing `presenceType`, `flags`, `mins`, `maxs`.
struct BBox presenceType flags mins maxs end struct
/// Plane record for format.aas, containing `normal`, `dist`, `type`.
struct Plane normal dist type end struct
/// Face record for format.aas, containing `planeNum`, `flags`, `numEdges`, `firstEdge`, `frontArea`, `backArea`.
struct Face planeNum flags numEdges firstEdge frontArea backArea end struct
/// Area record for format.aas, containing `areaNum`, `numFaces`, `firstFace`, `mins`, `maxs`, `center`.
struct Area areaNum numFaces firstFace mins maxs center end struct
/// AreaSettings record for format.aas, containing `contents`, `flags`, `presenceType`, `cluster`, `clusterAreaNum`, `numReachableAreas`, and 1 further fields.
struct AreaSettings contents flags presenceType cluster clusterAreaNum numReachableAreas firstReachableArea end struct
/// Reachability record for format.aas, containing `areaNum`, `faceNum`, `edgeNum`, `start`, `finish`, `travelType`, and 1 further fields.
struct Reachability areaNum faceNum edgeNum start finish travelType travelTime end struct
/// Node record for format.aas, containing `planeNum`, `children`.
struct Node planeNum children end struct
/// Portal record for format.aas, containing `areaNum`, `frontCluster`, `backCluster`, `clusterAreaNums`.
struct Portal areaNum frontCluster backCluster clusterAreaNums end struct
/// Cluster record for format.aas, containing `numAreas`, `numReachabilityAreas`, `numPortals`, `firstPortal`.
struct Cluster numAreas numReachabilityAreas numPortals firstPortal end struct
/// Lump record for format.aas, containing `fileOffset`, `fileLength`.
struct Lump fileOffset fileLength end struct
/// Header record for format.aas, containing `ident`, `version`, `bspChecksum`, `lumps`.
struct Header ident version bspChecksum lumps end struct

/// Create the format.aas error for `fail` with 7510 and the supplied diagnostic text.
/// @param message Message used in `("AAS: " + message)` and `error(7510, ("AAS: " + message))`.
function fail(message) return error(7510,"AAS: "+message) end function
/// Compute format.aas.strides as `[BBOX_SIZE, VERTEX_SIZE, PLANE_SIZE, EDGE_SIZE, INDEX_SIZE, FACE_SIZE, INDEX_SIZE, AREA_SIZE, AREA_SETTINGS_SIZE, REACHABILITY_SIZE, NODE_SIZE, PORTAL_SIZE, INDEX_SIZE, CLUSTER_SIZE]`.
function strides() return [BBOX_SIZE,VERTEX_SIZE,PLANE_SIZE,EDGE_SIZE,INDEX_SIZE,FACE_SIZE,INDEX_SIZE,AREA_SIZE,AREA_SETTINGS_SIZE,REACHABILITY_SIZE,NODE_SIZE,PORTAL_SIZE,INDEX_SIZE,CLUSTER_SIZE] end function
/// List the 14 names in format.aas.lumpNames, beginning with `bboxes`, `vertexes`, `planes`, `edges`.
function lumpNames() return ["bboxes","vertexes","planes","edges","edgeindex","faces","faceindex","areas","areasettings","reachability","nodes","portals","portalindex","clusters"] end function
/// Test span in format.aas; the normal completion returns `true`.
/// @param offset Offset used in `(offset < 0)` and `(offset > limit)`.
/// @param size Size used in `(size < 0)` and `(size > (limit - offset))`.
/// @param limit Limit used in `(offset > limit)` and `(limit - offset)`.
/// @param label Label used in `(label + " outside file")` and `fail((label + " outside file"))`.
function span(offset,size,limit,label)
  if offset<0 or size<0 or offset>limit or size>limit-offset then return fail(label+" outside file") end if;return true
end function
/// Compute i 32 in format.aas; the normal completion returns `value`.
/// @param data Data passed as `data` to `mq3.compat.numeric.readI32`.
/// @param offset Offset passed as `offset` to `mq3.compat.numeric.readI32`.
/// @param label Label used in `("truncated " + label)` and `fail(("truncated " + label))`.
function i32(data,offset,label) value=n.readI32(data,offset);if value is error then return fail("truncated "+label) end if;return value end function
/// Compute u 16 in format.aas; the normal completion returns `(data[offset] | (data[(offset + 1)] << 8))`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
/// @param label Label used in `("truncated " + label)` and `fail(("truncated " + label))`.
function u16(data,offset,label) if offset<0 or offset+2>len(data) then return fail("truncated "+label) end if;return data[offset]|(data[offset+1]<<8) end function
/// Compute f 32 in format.aas; the normal completion returns `n.bitsFloat(value)`.
/// @param data Data passed as `data` to `mq3.compat.numeric.readU32`.
/// @param offset Offset passed as `offset` to `mq3.compat.numeric.readU32`.
/// @param label Label used in `("truncated " + label)` and `fail(("truncated " + label))`.
function f32(data,offset,label) value=n.readU32(data,offset);if value is error then return fail("truncated "+label) end if;return n.bitsFloat(value) end function
/// Compute format.aas.vec3 as `[f32(data, offset, label), f32(data, (offset + 4), label), f32(data, (offset + 8), label)]`.
/// @param data Data passed as `data` to `mq3.format.aas.f32`.
/// @param offset Offset passed as `offset` to `mq3.format.aas.f32`.
/// @param label Label passed as `label` to `mq3.format.aas.f32`.
function vec3(data,offset,label) return [f32(data,offset,label),f32(data,offset+4,label),f32(data,offset+8,label)] end function
/// Compute record offset in format.aas; the normal completion returns `(map.offsets[lump] + (index * strides()[lump]))`.
/// @param map Record exposing `counts`, `offsets`.
/// @param lump Zero-based index into `map.counts`, `lumpNames()`, `map.offsets`.
/// @param index Index used in `(index < 0)` and `(index * strides()[lump])`.
function recordOffset(map,lump,index)
  if map==void then return fail("AAS map is void") end if
  if lump<0 or lump>=LUMP_COUNT then return fail("AAS lump index outside header") end if
  if index<0 or index>=map.counts[lump] then return fail("record index outside "+lumpNames()[lump]) end if
  return map.offsets[lump]+index*strides()[lump]
end function
/// Test indexed range in format.aas; the normal completion returns `true`.
/// @param first First used in `(first < 0)` and `(first > limit)`.
/// @param count Count used in `(count < 0)` and `(count > (limit - first))`.
/// @param limit Limit used in `(first > limit)` and `(limit - first)`.
/// @param label Label used in `("invalid " + label)` and `(("invalid " + label) + " range")`.
function indexedRange(first,count,limit,label)
  if first<0 or count<0 or first>limit or count>limit-first then return fail("invalid "+label+" range") end if;return true
end function
/// Test signed reference in format.aas; the normal completion returns `true`.
/// @param value Value used in `(value >= count)` and `(value <= (0 - count))`.
/// @param count Count used in `(0 - count)` and `(value >= count)`.
/// @param label Label used in `("invalid signed " + label)` and `(("invalid signed " + label) + " reference")`.
function signedReference(value,count,label)
  if value<=0-count or value>=count then return fail("invalid signed "+label+" reference") end if;return true
end function
/// Compute decoded header in format.aas; the normal completion returns `header`.
/// @param data Data used in `slice(data, 0, HEADER_SIZE)`.
/// @param version Version used in `(version == AAS_VERSION)`.
function decodedHeader(data,version)
  header=slice(data,0,HEADER_SIZE)
  if version==AAS_VERSION then for index=0 to HEADER_SIZE-9 header[8+index]=header[8+index]^((index*119)&255) end for end if
  return header
end function

/// Compute vertex in format.aas; the normal completion returns `vec3(map.data, at, "vertex")`.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function vertex(map,index) at=recordOffset(map,LUMP_VERTEXES,index);if at is error then return at end if;return vec3(map.data,at,"vertex") end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.BBox`, `mq3.format.aas.i32` for bbox in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function bbox(map,index) at=recordOffset(map,LUMP_BBOXES,index);if at is error then return at end if;return BBox(i32(map.data,at,"bbox presence"),i32(map.data,at+4,"bbox flags"),vec3(map.data,at+8,"bbox mins"),vec3(map.data,at+20,"bbox maxs")) end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Plane`, `mq3.format.aas.vec3` for plane in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function plane(map,index) at=recordOffset(map,LUMP_PLANES,index);if at is error then return at end if;return Plane(vec3(map.data,at,"plane normal"),f32(map.data,at+12,"plane distance"),i32(map.data,at+16,"plane type")) end function
/// Compute edge in format.aas; the normal completion returns `[i32(map.data, at, "edge vertex 0"), i32(map.data, (at + 4), "edge vertex 1")]`.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function edge(map,index) at=recordOffset(map,LUMP_EDGES,index);if at is error then return at end if;return [i32(map.data,at,"edge vertex 0"),i32(map.data,at+4,"edge vertex 1")] end function
/// Compute edge index in format.aas; the normal completion returns `i32(map.data, at, "edge index")`.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function edgeIndex(map,index) at=recordOffset(map,LUMP_EDGEINDEX,index);if at is error then return at end if;return i32(map.data,at,"edge index") end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Face`, `mq3.format.aas.i32` for face in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function face(map,index) at=recordOffset(map,LUMP_FACES,index);if at is error then return at end if;return Face(i32(map.data,at,"face plane"),i32(map.data,at+4,"face flags"),i32(map.data,at+8,"face edge count"),i32(map.data,at+12,"face first edge"),i32(map.data,at+16,"face front area"),i32(map.data,at+20,"face back area")) end function
/// Compute face index in format.aas; the normal completion returns `i32(map.data, at, "face index")`.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function faceIndex(map,index) at=recordOffset(map,LUMP_FACEINDEX,index);if at is error then return at end if;return i32(map.data,at,"face index") end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Area`, `mq3.format.aas.i32` for area in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function area(map,index) at=recordOffset(map,LUMP_AREAS,index);if at is error then return at end if;return Area(i32(map.data,at,"area number"),i32(map.data,at+4,"area face count"),i32(map.data,at+8,"area first face"),vec3(map.data,at+12,"area mins"),vec3(map.data,at+24,"area maxs"),vec3(map.data,at+36,"area center")) end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.AreaSettings`, `mq3.format.aas.i32` for area settings in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function areaSettings(map,index) at=recordOffset(map,LUMP_AREASETTINGS,index);if at is error then return at end if;return AreaSettings(i32(map.data,at,"area contents"),i32(map.data,at+4,"area flags"),i32(map.data,at+8,"area presence"),i32(map.data,at+12,"area cluster"),i32(map.data,at+16,"cluster area"),i32(map.data,at+20,"reachable count"),i32(map.data,at+24,"first reachable")) end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Reachability`, `mq3.format.aas.i32` for reachability in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function reachability(map,index) at=recordOffset(map,LUMP_REACHABILITY,index);if at is error then return at end if;return Reachability(i32(map.data,at,"reachable area"),i32(map.data,at+4,"reachable face"),i32(map.data,at+8,"reachable edge"),vec3(map.data,at+12,"reach start"),vec3(map.data,at+24,"reach end"),i32(map.data,at+36,"travel type"),u16(map.data,at+40,"travel time")) end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Node`, `mq3.format.aas.i32` for node in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function node(map,index) at=recordOffset(map,LUMP_NODES,index);if at is error then return at end if;return Node(i32(map.data,at,"node plane"),[i32(map.data,at+4,"node child 0"),i32(map.data,at+8,"node child 1")]) end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Portal`, `mq3.format.aas.i32` for portal in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function portal(map,index) at=recordOffset(map,LUMP_PORTALS,index);if at is error then return at end if;return Portal(i32(map.data,at,"portal area"),i32(map.data,at+4,"front cluster"),i32(map.data,at+8,"back cluster"),[i32(map.data,at+12,"front cluster area"),i32(map.data,at+16,"back cluster area")]) end function
/// Compute portal index in format.aas; the normal completion returns `i32(map.data, at, "portal index")`.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function portalIndex(map,index) at=recordOffset(map,LUMP_PORTALINDEX,index);if at is error then return at end if;return i32(map.data,at,"portal index") end function
/// Apply `mq3.format.aas.recordOffset`, `mq3.format.aas.Cluster`, `mq3.format.aas.i32` for cluster in format.aas.
/// @param map Record exposing `data`.
/// @param index Index passed as `index` to `mq3.format.aas.recordOffset`.
function cluster(map,index) at=recordOffset(map,LUMP_CLUSTERS,index);if at is error then return at end if;return Cluster(i32(map.data,at,"cluster area count"),i32(map.data,at+4,"cluster reachability count"),i32(map.data,at+8,"cluster portal count"),i32(map.data,at+12,"cluster first portal")) end function

/// Validate topology in format.aas; the normal completion returns `true`.
/// @param map Record exposing `counts`.
function validateTopology(map)
  if map.counts[LUMP_AREAS]!=map.counts[LUMP_AREASETTINGS] then return fail("area/settings count mismatch") end if
  if map.counts[LUMP_EDGES]>0 then for index=0 to map.counts[LUMP_EDGES]-1 value=edge(map,index);if value[0]<0 or value[0]>=map.counts[LUMP_VERTEXES] or value[1]<0 or value[1]>=map.counts[LUMP_VERTEXES] then return fail("edge vertex outside vertex lump") end if end for end if
  if map.counts[LUMP_EDGEINDEX]>0 then for index=0 to map.counts[LUMP_EDGEINDEX]-1 check=signedReference(edgeIndex(map,index),map.counts[LUMP_EDGES],"edge");if check is error then return check end if end for end if
  if map.counts[LUMP_FACES]>0 then for index=0 to map.counts[LUMP_FACES]-1 value=face(map,index);if value.planeNum<0 or value.planeNum>=map.counts[LUMP_PLANES] then return fail("face plane outside plane lump") end if;check=indexedRange(value.firstEdge,value.numEdges,map.counts[LUMP_EDGEINDEX],"face edge");if check is error then return check end if;if value.frontArea<0 or value.frontArea>=map.counts[LUMP_AREAS] or value.backArea<0 or value.backArea>=map.counts[LUMP_AREAS] then return fail("face area outside area lump") end if end for end if
  if map.counts[LUMP_FACEINDEX]>0 then for index=0 to map.counts[LUMP_FACEINDEX]-1 check=signedReference(faceIndex(map,index),map.counts[LUMP_FACES],"face");if check is error then return check end if end for end if
  if map.counts[LUMP_AREAS]>0 then for index=0 to map.counts[LUMP_AREAS]-1 value=area(map,index);if value.areaNum!=index then return fail("area number/index mismatch") end if;check=indexedRange(value.firstFace,value.numFaces,map.counts[LUMP_FACEINDEX],"area face");if check is error then return check end if;settings=areaSettings(map,index);check=indexedRange(settings.firstReachableArea,settings.numReachableAreas,map.counts[LUMP_REACHABILITY],"area reachability");if check is error then return check end if end for end if
  // facenum/edgenum are deliberately not range checked: special travel types
  // reuse these fields for mover, jump-pad and teleport metadata in Baseq3.
  if map.counts[LUMP_REACHABILITY]>0 then for index=0 to map.counts[LUMP_REACHABILITY]-1 value=reachability(map,index);if value.areaNum<0 or value.areaNum>=map.counts[LUMP_AREAS] then return fail("reachability area outside area lump") end if end for end if
  if map.counts[LUMP_NODES]>0 then for index=0 to map.counts[LUMP_NODES]-1 value=node(map,index);if value.planeNum<0 or value.planeNum>=map.counts[LUMP_PLANES] then return fail("node plane outside plane lump") end if;for side=0 to 1 child=value.children[side];if child>0 and child>=map.counts[LUMP_NODES] then return fail("node child outside node lump") else if child<0 and 0-child>=map.counts[LUMP_AREAS] then return fail("node area outside area lump") end if end for end for end if
  if map.counts[LUMP_PORTALS]>0 then for index=0 to map.counts[LUMP_PORTALS]-1 value=portal(map,index);if value.areaNum<0 or value.areaNum>=map.counts[LUMP_AREAS] then return fail("portal area outside area lump") end if;if value.frontCluster<0 or value.frontCluster>=map.counts[LUMP_CLUSTERS] or value.backCluster<0 or value.backCluster>=map.counts[LUMP_CLUSTERS] then return fail("portal cluster outside cluster lump") end if end for end if
  if map.counts[LUMP_PORTALINDEX]>0 then for index=0 to map.counts[LUMP_PORTALINDEX]-1 value=portalIndex(map,index);if value<0 or value>=map.counts[LUMP_PORTALS] then return fail("portal index outside portal lump") end if end for end if
  if map.counts[LUMP_CLUSTERS]>0 then for index=0 to map.counts[LUMP_CLUSTERS]-1 value=cluster(map,index);check=indexedRange(value.firstPortal,value.numPortals,map.counts[LUMP_PORTALINDEX],"cluster portal");if check is error then return check end if end for end if
  return true
end function

/// Load aas in format.aas; the normal completion returns `map`.
/// @param data Data passed as `data` to `mq3.format.aas.i32`.
function load(data)
  if data==void or typeof(data)!="bytes" or len(data)<HEADER_SIZE then return fail("truncated header") end if
  ident=i32(data,0,"identity");if ident!=AAS_ID then return fail("invalid identity") end if
  version=i32(data,4,"version");if version!=AAS_VERSION_OLD and version!=AAS_VERSION then return fail("unsupported version "+str(version)) end if
  header=decodedHeader(data,version);checksum=i32(header,8,"BSP checksum");offsets=array(LUMP_COUNT,0);lengths=array(LUMP_COUNT,0);counts=array(LUMP_COUNT,0);sizes=strides();names=lumpNames();sequential=true;last=HEADER_SIZE
  for lump=0 to LUMP_COUNT-1
    offset=i32(header,12+lump*8,names[lump]+" offset");length=i32(header,16+lump*8,names[lump]+" length")
    check=span(offset,length,len(data),names[lump]);if check is error then return check end if
    if length>0 and offset<HEADER_SIZE then return fail(names[lump]+" overlaps header") end if
    if length%sizes[lump]!=0 then return fail(names[lump]+" record size mismatch") end if
    if offset!=last then sequential=false end if;last=offset+length;offsets[lump]=offset;lengths[lump]=length;counts[lump]=length/sizes[lump]
  end for
  for left=0 to LUMP_COUNT-1 if lengths[left]>0 and left<LUMP_COUNT-1 then for right=left+1 to LUMP_COUNT-1 if lengths[right]>0 and offsets[left]<offsets[right]+lengths[right] and offsets[right]<offsets[left]+lengths[left] then return fail("overlapping lumps") end if end for end if end for
  map=AAS(data,version,checksum,offsets,lengths,counts,sequential);check=validateTopology(map);if check is error then return check end if;return map
end function
/// Check bsp checksum in format.aas; the normal completion returns `true`.
/// @param map Record exposing `bspChecksum`.
/// @param expected Expected used in `(map.bspChecksum != expected)` and `((map == void) or (map.bspChecksum != expected))`.
function checkBspChecksum(map,expected) if map==void or map.bspChecksum!=expected then return fail("BSP checksum mismatch") end if;return true end function

/// Compute header in format.aas; the normal completion returns `Header(AAS_ID, map.version, map.bspChecksum, lumps)`.
/// @param map Record exposing `offsets`, `lengths`, `version`, `bspChecksum`.
function header(map)
  if map==void then return fail("AAS map is void") end if;lumps=[]
  for index=0 to LUMP_COUNT-1 lumps=lumps+[Lump(map.offsets[index],map.lengths[index])] end for
  return Header(AAS_ID,map.version,map.bspChecksum,lumps)
end function
/// Compute lump data in format.aas; the normal completion returns `slice(map.data, map.offsets[lump], map.lengths[lump])`.
/// @param map Record exposing `data`, `offsets`, `lengths`.
/// @param lump Zero-based index into `map.offsets`, `map.lengths`.
function lumpData(map,lump)
  if map==void then return fail("AAS map is void") end if
  if lump<0 or lump>=LUMP_COUNT then return fail("AAS lump index outside header") end if
  return slice(map.data,map.offsets[lump],map.lengths[lump])
end function
/// Compute ddata in format.aas; the normal completion returns `result`.
/// @param data Data used in `len(data)` and `typeof(data)`.
function ddata(data)
  if data==void or typeof(data)!="bytes" then return fail("DData requires bytes") end if;result=slice(data,0,len(data))
  if len(result)>0 then for index=0 to len(result)-1 result[index]=result[index]^((index*119)&255) end for end if
  return result
end function
/// Encode aas in format.aas; the normal completion returns `output`.
/// @param map Record exposing `bspChecksum`.
function encode(map)
  if map==void then return fail("AAS map is void") end if;check=validateTopology(map);if check is error then return check end if
  output=bytes(HEADER_SIZE,0);n.writeU32(output,0,AAS_ID);n.writeU32(output,4,AAS_VERSION);n.writeU32(output,8,map.bspChecksum);offset=HEADER_SIZE
  for lump=0 to LUMP_COUNT-1
    chunk=lumpData(map,lump);if chunk is error then return chunk end if
    n.writeU32(output,12+lump*8,offset);n.writeU32(output,16+lump*8,len(chunk));output=output+chunk;offset=offset+len(chunk)
  end for
  coded=ddata(slice(output,8,HEADER_SIZE-8));copyBytes(output,8,coded,0,len(coded));return output
end function
