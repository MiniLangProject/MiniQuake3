// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/botlib/be_aas_optimize.c.
package mq3.botlib.aas_optimizer

import mq3.format.aas as aas

const FACE_LADDER=2
const TRAVEL_ELEVATOR=11
const TRAVEL_JUMPPAD=18
const TRAVEL_FUNCBOB=19
const TRAVELTYPE_MASK=0xffffff

/// `Edge` record for aas optimizer, containing `vertices`.
struct Edge vertices end struct
/// `Face` record for aas optimizer, containing `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields.
struct Face planeNum flags numEdges firstEdge frontArea backArea end struct
/// `Area` record for aas optimizer, containing `areaNum`, `numFaces`, `firstFace`, `mins` and `maxs` and related fields.
struct Area areaNum numFaces firstFace mins maxs center end struct
/// `Reachability` record for aas optimizer, containing `areaNum`, `faceNum`, `edgeNum`, `start` and `finish` and related fields.
struct Reachability areaNum faceNum edgeNum start finish travelType travelTime end struct
/// `Action` record for aas optimizer, containing `boundary`, `kind`, `text` and `dispatched`.
struct Action boundary kind text dispatched end struct
/// `World` record for aas optimizer, containing `mapName`, `loaded`, `time`, `vertexes` and `edges` and related fields.
struct World mapName loaded time vertexes edges edgeIndex faces faceIndex areas reachability actions retailActive end struct
/// `Optimized` record for aas optimizer, containing `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields.
struct Optimized vertexes edges edgeIndex faces faceIndex areas vertexOptimizeIndex edgeOptimizeIndex faceOptimizeIndex end struct

/// Create a `mq3.botlib.aas_optimizer.Edge` record, initializing `vertices` as `[a,b]`.
/// @param a Operand used to evaluate the returned expression `Edge([a,b])`.
/// @param b Operand used to evaluate the returned expression `Edge([a,b])`.
function edge(a,b) return Edge([a,b]) end function
/// Create a `mq3.botlib.aas_optimizer.Face` record, initializing `planeNum` from `planeNum`, `flags` from `flags` and `numEdges` from `numEdges`.
/// @param planeNum Initial value stored in `mq3.botlib.aas_optimizer.Face.planeNum`.
/// @param flags Initial value stored in `mq3.botlib.aas_optimizer.Face.flags`.
/// @param numEdges Initial value stored in `mq3.botlib.aas_optimizer.Face.numEdges`.
/// @param firstEdge Initial value stored in `mq3.botlib.aas_optimizer.Face.firstEdge`.
/// @param frontArea Initial value stored in `mq3.botlib.aas_optimizer.Face.frontArea`.
/// @param backArea Initial value stored in `mq3.botlib.aas_optimizer.Face.backArea`.
function face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) return Face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) end function
/// Create a `mq3.botlib.aas_optimizer.Area` record, initializing `areaNum` from `areaNum`, `numFaces` from `numFaces` and `firstFace` from `firstFace`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param numFaces Initial value stored in `mq3.botlib.aas_optimizer.Area.numFaces`.
/// @param firstFace Initial value stored in `mq3.botlib.aas_optimizer.Area.firstFace`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param center Initial value stored in `mq3.botlib.aas_optimizer.Area.center`.
function area(areaNum,numFaces,firstFace,mins,maxs,center) return Area(areaNum,numFaces,firstFace,mins,maxs,center) end function
/// Create a `mq3.botlib.aas_optimizer.Reachability` record, initializing `areaNum` from `areaNum`, `faceNum` from `faceNum` and `edgeNum` from `edgeNum`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param faceNum AAS face index.
/// @param edgeNum Initial value stored in `mq3.botlib.aas_optimizer.Reachability.edgeNum`.
/// @param start Initial value stored in `mq3.botlib.aas_optimizer.Reachability.start`.
/// @param finish Initial value stored in `mq3.botlib.aas_optimizer.Reachability.finish`.
/// @param travelType AAS reachability travel-type code.
/// @param travelTime AAS travel-time value.
function reachability(areaNum,faceNum,edgeNum,start,finish,travelType,travelTime) return Reachability(areaNum,faceNum,edgeNum,start,finish,travelType,travelTime) end function
/// Create a `mq3.botlib.aas_optimizer.World` record, initializing `mapName` from `mapName`, `loaded` from `loaded` and `time` from `time`.
/// @param mapName Initial value stored in `mq3.botlib.aas_optimizer.World.mapName`.
/// @param loaded Initial value stored in `mq3.botlib.aas_optimizer.World.loaded`.
/// @param time Time value in the units expected by this module.
/// @param vertexes Initial value stored in `mq3.botlib.aas_optimizer.World.vertexes`.
/// @param edges Initial value stored in `mq3.botlib.aas_optimizer.World.edges`.
/// @param edgeIndex Initial value stored in `mq3.botlib.aas_optimizer.World.edgeIndex`.
/// @param faces Initial value stored in `mq3.botlib.aas_optimizer.World.faces`.
/// @param faceIndex Initial value stored in `mq3.botlib.aas_optimizer.World.faceIndex`.
/// @param areas Initial value stored in `mq3.botlib.aas_optimizer.World.areas`.
/// @param reachabilities Initial value stored in `mq3.botlib.aas_optimizer.World.reachability`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function world(mapName,loaded,time,vertexes,edges,edgeIndex,faces,faceIndex,areas,reachabilities,retailActive) return World(mapName,loaded,time,vertexes,edges,edgeIndex,faces,faceIndex,areas,reachabilities,[],retailActive) end function
/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas optimizer.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copy3(value) return [value[0],value[1],value[2]] end function
/// Create a `mq3.botlib.aas_optimizer.Face` record, initializing `planeNum` as `value.planeNum`, `flags` as `value.flags` and `numEdges` as `value.numEdges`.
/// @param value Value record; accesses `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields.
function copyFace(value) return Face(value.planeNum,value.flags,value.numEdges,value.firstEdge,value.frontArea,value.backArea) end function
/// Create a `mq3.botlib.aas_optimizer.Area` record, initializing `areaNum` as `value.areaNum`, `numFaces` as `value.numFaces` and `firstFace` as `value.firstFace`.
/// @param value Value record; accesses `areaNum`, `numFaces`, `firstFace`, `mins` and `maxs` and related fields.
function copyArea(value) return Area(value.areaNum,value.numFaces,value.firstFace,copy3(value.mins),copy3(value.maxs),copy3(value.center)) end function
/// Return the absolute value of the numeric argument for aas optimizer.
/// @param value Operand used to evaluate the returned expression `0-value`.
function absIndex(value) if value<0 then return 0-value end if;return value end function
/// Apply the original oriented index sign to a replacement index.
/// @param index Index of the entry to access.
/// @param source Value used by `signed` in `if source<0 then return 0-index end if`.
function signed(index,source) if source<0 then return 0-index end if;return index end function

// AAS_KeepEdge
/// @param value Not read by this implementation; retained in the `keepEdge` signature.
function keepEdge(value) return 1 end function
// AAS_KeepFace
/// @param value Value record; accesses `flags`.
function keepFace(value) if value==void or (value.flags&FACE_LADDER)==0 then return 0 end if;return 1 end function

// AAS_OptimizeAlloc
/// @param source Parser source state; accesses `areas`, `vertexes`, `edges` and `faces`.
function optimizeAlloc(source)
  if source==void then return error(7850,"AAS optimize world is missing") end if;areas=[];if len(source.areas)>0 then for index=0 to len(source.areas)-1 areas=areas+[area(0,0,0,[0,0,0],[0,0,0],[0,0,0])] end for end if;return Optimized([], [edge(0,0)], [], [face(0,0,0,0,0,0)], [], areas, array(len(source.vertexes),0), array(len(source.edges),0), array(len(source.faces),0))
end function

// AAS_OptimizeEdge
/// @param source Parser source state; accesses `edges` and `vertexes`.
/// @param optimized Optimized record; accesses `edgeOptimizeIndex`, `vertexOptimizeIndex`, `vertexes` and `edges`. May update `optimized.vertexes`, `optimized.vertexOptimizeIndex[vertex]` and `optimized.edges` and additional fields in place.
/// @param edgeNum Operand used to evaluate the returned expression `0-value`.
function optimizeEdge(source,optimized,edgeNum)
  index=absIndex(edgeNum);if index<0 or index>=len(source.edges) then return error(7850,"AAS optimize edge reference outside world") end if;sourceEdge=source.edges[index];if keepEdge(sourceEdge)==0 then return 0 end if;optimizedIndex=optimized.edgeOptimizeIndex[index];if optimizedIndex!=0 then return signed(optimizedIndex,edgeNum) end if;vertices=[0,0];for side=0 to 1 vertex=sourceEdge.vertices[side];if vertex<0 or vertex>=len(source.vertexes) then return error(7850,"AAS optimize vertex reference outside world") end if;mapped=optimized.vertexOptimizeIndex[vertex];if mapped!=0 then vertices[side]=mapped else mapped=len(optimized.vertexes);optimized.vertexes=optimized.vertexes+[copy3(source.vertexes[vertex])];vertices[side]=mapped;optimized.vertexOptimizeIndex[vertex]=mapped end if end for;optimizedIndex=len(optimized.edges);optimized.edges=optimized.edges+[Edge(vertices)];optimized.edgeOptimizeIndex[index]=optimizedIndex;return signed(optimizedIndex,edgeNum)
end function

// AAS_OptimizeFace
/// @param source Parser source state; accesses `faces` and `edgeIndex`.
/// @param optimized Optimized record; accesses `faceOptimizeIndex`, `edgeIndex` and `faces`. May update `optimized.edgeIndex`, `optimized.faces` and `optimized.faceOptimizeIndex[index]` in place.
/// @param faceNum AAS face index.
function optimizeFace(source,optimized,faceNum)
  index=absIndex(faceNum);if index<0 or index>=len(source.faces) then return error(7850,"AAS optimize face reference outside world") end if;sourceFace=source.faces[index];if keepFace(sourceFace)==0 then return 0 end if;optimizedIndex=optimized.faceOptimizeIndex[index];if optimizedIndex!=0 then return signed(optimizedIndex,faceNum) end if;target=copyFace(sourceFace);target.numEdges=0;target.firstEdge=len(optimized.edgeIndex);if sourceFace.numEdges>0 then for offset=0 to sourceFace.numEdges-1 at=sourceFace.firstEdge+offset;if at<0 or at>=len(source.edgeIndex) then return error(7850,"AAS optimize face edge range outside world") end if;mapped=optimizeEdge(source,optimized,source.edgeIndex[at]);if mapped is error then return mapped end if;if mapped!=0 then optimized.edgeIndex=optimized.edgeIndex+[mapped];target.numEdges=target.numEdges+1 end if end for end if;optimizedIndex=len(optimized.faces);optimized.faces=optimized.faces+[target];optimized.faceOptimizeIndex[index]=optimizedIndex;return signed(optimizedIndex,faceNum)
end function

// AAS_OptimizeArea
/// @param source Parser source state; accesses `areas` and `faceIndex`.
/// @param optimized Optimized record; accesses `faceIndex` and `areas`. May update `optimized.faceIndex` and `optimized.areas[areaNum]` in place.
/// @param areaNum AAS area number; zero denotes no area.
function optimizeArea(source,optimized,areaNum)
  if areaNum<0 or areaNum>=len(source.areas) then return error(7850,"AAS optimize area outside world") end if;sourceArea=source.areas[areaNum];target=copyArea(sourceArea);target.numFaces=0;target.firstFace=len(optimized.faceIndex);if sourceArea.numFaces>0 then for offset=0 to sourceArea.numFaces-1 at=sourceArea.firstFace+offset;if at<0 or at>=len(source.faceIndex) then return error(7850,"AAS optimize area face range outside world") end if;mapped=optimizeFace(source,optimized,source.faceIndex[at]);if mapped is error then return mapped end if;if mapped!=0 then optimized.faceIndex=optimized.faceIndex+[mapped];target.numFaces=target.numFaces+1 end if end for end if;optimized.areas[areaNum]=target;return target
end function

// AAS_OptimizeStore
/// @param source Parser source state; accesses `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields. May update `source.vertexes`, `source.edges` and `source.edgeIndex` and additional fields in place.
/// @param optimized Optimized record; accesses `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields.
function optimizeStore(source,optimized)
  source.vertexes=optimized.vertexes;source.edges=optimized.edges;source.edgeIndex=optimized.edgeIndex;source.faces=optimized.faces;source.faceIndex=optimized.faceIndex;source.areas=optimized.areas;return source
end function

// AAS_Optimize
/// @param source Parser source state; accesses `loaded`, `areas`, `reachability`, `retailActive` and `actions`. May update `source.actions` in place.
function optimize(source)
  if source==void or not source.loaded then return error(7850,"AAS optimize requires a loaded map") end if;optimized=optimizeAlloc(source);if optimized is error then return optimized end if;if len(source.areas)>1 then for areaNum=1 to len(source.areas)-1 result=optimizeArea(source,optimized,areaNum);if result is error then return result end if end for end if;if len(source.reachability)>0 then for index=0 to len(source.reachability)-1 value=source.reachability[index];kind=value.travelType&TRAVELTYPE_MASK;if kind!=TRAVEL_ELEVATOR and kind!=TRAVEL_JUMPPAD and kind!=TRAVEL_FUNCBOB then faceIndex=absIndex(value.faceNum);if faceIndex>=len(optimized.faceOptimizeIndex) then return error(7850,"AAS optimize reachability face outside world") end if;edgeIndex=absIndex(value.edgeNum);if edgeIndex>=len(optimized.edgeOptimizeIndex) then return error(7850,"AAS optimize reachability edge outside world") end if;value.faceNum=signed(optimized.faceOptimizeIndex[faceIndex],value.faceNum);value.edgeNum=signed(optimized.edgeOptimizeIndex[edgeIndex],value.edgeNum) end if end for end if;optimizeStore(source,optimized);action=Action("aas-optimize","print","AAS data optimized.\n",not source.retailActive);source.actions=source.actions+[action];return source
end function

/// Apply `mq3.format.aas.vertex`, `mq3.format.aas.edge` and `mq3.format.aas.edgeIndex` while evaluating `fromMap`.
/// @param map Map record; accesses `counts`.
/// @param mapName Initial value stored in `mq3.botlib.aas_optimizer.World.mapName`.
/// @param time Time value in the units expected by this module.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function fromMap(map,mapName,time,retailActive)
  if map==void then return error(7850,"AAS optimize map is missing") end if;vertexes=[];for index=0 to map.counts[aas.LUMP_VERTEXES]-1 value=aas.vertex(map,index);if value is error then return value end if;vertexes=vertexes+[value] end for;edges=[];for index=0 to map.counts[aas.LUMP_EDGES]-1 value=aas.edge(map,index);if value is error then return value end if;edges=edges+[Edge(value)] end for;edgeIndex=[];for index=0 to map.counts[aas.LUMP_EDGEINDEX]-1 value=aas.edgeIndex(map,index);if value is error then return value end if;edgeIndex=edgeIndex+[value] end for;faces=[];for index=0 to map.counts[aas.LUMP_FACES]-1 value=aas.face(map,index);if value is error then return value end if;faces=faces+[face(value.planeNum,value.flags,value.numEdges,value.firstEdge,value.frontArea,value.backArea)] end for;faceIndex=[];for index=0 to map.counts[aas.LUMP_FACEINDEX]-1 value=aas.faceIndex(map,index);if value is error then return value end if;faceIndex=faceIndex+[value] end for;areas=[];for index=0 to map.counts[aas.LUMP_AREAS]-1 value=aas.area(map,index);if value is error then return value end if;areas=areas+[area(value.areaNum,value.numFaces,value.firstFace,value.mins,value.maxs,value.center)] end for;reaches=[];for index=0 to map.counts[aas.LUMP_REACHABILITY]-1 value=aas.reachability(map,index);if value is error then return value end if;reaches=reaches+[reachability(value.areaNum,value.faceNum,value.edgeNum,value.start,value.finish,value.travelType,value.travelTime)] end for;return world(mapName,true,time,vertexes,edges,edgeIndex,faces,faceIndex,areas,reaches,retailActive)
end function
