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

struct Edge vertices end struct
struct Face planeNum flags numEdges firstEdge frontArea backArea end struct
struct Area areaNum numFaces firstFace mins maxs center end struct
struct Reachability areaNum faceNum edgeNum start finish travelType travelTime end struct
struct Action boundary kind text dispatched end struct
struct World mapName loaded time vertexes edges edgeIndex faces faceIndex areas reachability actions retailActive end struct
struct Optimized vertexes edges edgeIndex faces faceIndex areas vertexOptimizeIndex edgeOptimizeIndex faceOptimizeIndex end struct

function edge(a,b) return Edge([a,b]) end function
function face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) return Face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) end function
function area(areaNum,numFaces,firstFace,mins,maxs,center) return Area(areaNum,numFaces,firstFace,mins,maxs,center) end function
function reachability(areaNum,faceNum,edgeNum,start,finish,travelType,travelTime) return Reachability(areaNum,faceNum,edgeNum,start,finish,travelType,travelTime) end function
function world(mapName,loaded,time,vertexes,edges,edgeIndex,faces,faceIndex,areas,reachabilities,retailActive) return World(mapName,loaded,time,vertexes,edges,edgeIndex,faces,faceIndex,areas,reachabilities,[],retailActive) end function
function copy3(value) return [value[0],value[1],value[2]] end function
function copyFace(value) return Face(value.planeNum,value.flags,value.numEdges,value.firstEdge,value.frontArea,value.backArea) end function
function copyArea(value) return Area(value.areaNum,value.numFaces,value.firstFace,copy3(value.mins),copy3(value.maxs),copy3(value.center)) end function
function absIndex(value) if value<0 then return 0-value end if;return value end function
function signed(index,source) if source<0 then return 0-index end if;return index end function

// AAS_KeepEdge
function keepEdge(value) return 1 end function
// AAS_KeepFace
function keepFace(value) if value==void or (value.flags&FACE_LADDER)==0 then return 0 end if;return 1 end function

// AAS_OptimizeAlloc
function optimizeAlloc(source)
  if source==void then return error(7850,"AAS optimize world is missing") end if;areas=[];if len(source.areas)>0 then for index=0 to len(source.areas)-1 areas=areas+[area(0,0,0,[0,0,0],[0,0,0],[0,0,0])] end for end if;return Optimized([], [edge(0,0)], [], [face(0,0,0,0,0,0)], [], areas, array(len(source.vertexes),0), array(len(source.edges),0), array(len(source.faces),0))
end function

// AAS_OptimizeEdge
function optimizeEdge(source,optimized,edgeNum)
  index=absIndex(edgeNum);if index<0 or index>=len(source.edges) then return error(7850,"AAS optimize edge reference outside world") end if;sourceEdge=source.edges[index];if keepEdge(sourceEdge)==0 then return 0 end if;optimizedIndex=optimized.edgeOptimizeIndex[index];if optimizedIndex!=0 then return signed(optimizedIndex,edgeNum) end if;vertices=[0,0];for side=0 to 1 vertex=sourceEdge.vertices[side];if vertex<0 or vertex>=len(source.vertexes) then return error(7850,"AAS optimize vertex reference outside world") end if;mapped=optimized.vertexOptimizeIndex[vertex];if mapped!=0 then vertices[side]=mapped else mapped=len(optimized.vertexes);optimized.vertexes=optimized.vertexes+[copy3(source.vertexes[vertex])];vertices[side]=mapped;optimized.vertexOptimizeIndex[vertex]=mapped end if end for;optimizedIndex=len(optimized.edges);optimized.edges=optimized.edges+[Edge(vertices)];optimized.edgeOptimizeIndex[index]=optimizedIndex;return signed(optimizedIndex,edgeNum)
end function

// AAS_OptimizeFace
function optimizeFace(source,optimized,faceNum)
  index=absIndex(faceNum);if index<0 or index>=len(source.faces) then return error(7850,"AAS optimize face reference outside world") end if;sourceFace=source.faces[index];if keepFace(sourceFace)==0 then return 0 end if;optimizedIndex=optimized.faceOptimizeIndex[index];if optimizedIndex!=0 then return signed(optimizedIndex,faceNum) end if;target=copyFace(sourceFace);target.numEdges=0;target.firstEdge=len(optimized.edgeIndex);if sourceFace.numEdges>0 then for offset=0 to sourceFace.numEdges-1 at=sourceFace.firstEdge+offset;if at<0 or at>=len(source.edgeIndex) then return error(7850,"AAS optimize face edge range outside world") end if;mapped=optimizeEdge(source,optimized,source.edgeIndex[at]);if mapped is error then return mapped end if;if mapped!=0 then optimized.edgeIndex=optimized.edgeIndex+[mapped];target.numEdges=target.numEdges+1 end if end for end if;optimizedIndex=len(optimized.faces);optimized.faces=optimized.faces+[target];optimized.faceOptimizeIndex[index]=optimizedIndex;return signed(optimizedIndex,faceNum)
end function

// AAS_OptimizeArea
function optimizeArea(source,optimized,areaNum)
  if areaNum<0 or areaNum>=len(source.areas) then return error(7850,"AAS optimize area outside world") end if;sourceArea=source.areas[areaNum];target=copyArea(sourceArea);target.numFaces=0;target.firstFace=len(optimized.faceIndex);if sourceArea.numFaces>0 then for offset=0 to sourceArea.numFaces-1 at=sourceArea.firstFace+offset;if at<0 or at>=len(source.faceIndex) then return error(7850,"AAS optimize area face range outside world") end if;mapped=optimizeFace(source,optimized,source.faceIndex[at]);if mapped is error then return mapped end if;if mapped!=0 then optimized.faceIndex=optimized.faceIndex+[mapped];target.numFaces=target.numFaces+1 end if end for end if;optimized.areas[areaNum]=target;return target
end function

// AAS_OptimizeStore
function optimizeStore(source,optimized)
  source.vertexes=optimized.vertexes;source.edges=optimized.edges;source.edgeIndex=optimized.edgeIndex;source.faces=optimized.faces;source.faceIndex=optimized.faceIndex;source.areas=optimized.areas;return source
end function

// AAS_Optimize
function optimize(source)
  if source==void or not source.loaded then return error(7850,"AAS optimize requires a loaded map") end if;optimized=optimizeAlloc(source);if optimized is error then return optimized end if;if len(source.areas)>1 then for areaNum=1 to len(source.areas)-1 result=optimizeArea(source,optimized,areaNum);if result is error then return result end if end for end if;if len(source.reachability)>0 then for index=0 to len(source.reachability)-1 value=source.reachability[index];kind=value.travelType&TRAVELTYPE_MASK;if kind!=TRAVEL_ELEVATOR and kind!=TRAVEL_JUMPPAD and kind!=TRAVEL_FUNCBOB then faceIndex=absIndex(value.faceNum);if faceIndex>=len(optimized.faceOptimizeIndex) then return error(7850,"AAS optimize reachability face outside world") end if;edgeIndex=absIndex(value.edgeNum);if edgeIndex>=len(optimized.edgeOptimizeIndex) then return error(7850,"AAS optimize reachability edge outside world") end if;value.faceNum=signed(optimized.faceOptimizeIndex[faceIndex],value.faceNum);value.edgeNum=signed(optimized.edgeOptimizeIndex[edgeIndex],value.edgeNum) end if end for end if;optimizeStore(source,optimized);action=Action("aas-optimize","print","AAS data optimized.\n",not source.retailActive);source.actions=source.actions+[action];return source
end function

function fromMap(map,mapName,time,retailActive)
  if map==void then return error(7850,"AAS optimize map is missing") end if;vertexes=[];for index=0 to map.counts[aas.LUMP_VERTEXES]-1 value=aas.vertex(map,index);if value is error then return value end if;vertexes=vertexes+[value] end for;edges=[];for index=0 to map.counts[aas.LUMP_EDGES]-1 value=aas.edge(map,index);if value is error then return value end if;edges=edges+[Edge(value)] end for;edgeIndex=[];for index=0 to map.counts[aas.LUMP_EDGEINDEX]-1 value=aas.edgeIndex(map,index);if value is error then return value end if;edgeIndex=edgeIndex+[value] end for;faces=[];for index=0 to map.counts[aas.LUMP_FACES]-1 value=aas.face(map,index);if value is error then return value end if;faces=faces+[face(value.planeNum,value.flags,value.numEdges,value.firstEdge,value.frontArea,value.backArea)] end for;faceIndex=[];for index=0 to map.counts[aas.LUMP_FACEINDEX]-1 value=aas.faceIndex(map,index);if value is error then return value end if;faceIndex=faceIndex+[value] end for;areas=[];for index=0 to map.counts[aas.LUMP_AREAS]-1 value=aas.area(map,index);if value is error then return value end if;areas=areas+[area(value.areaNum,value.numFaces,value.firstFace,value.mins,value.maxs,value.center)] end for;reaches=[];for index=0 to map.counts[aas.LUMP_REACHABILITY]-1 value=aas.reachability(map,index);if value is error then return value end if;reaches=reaches+[reachability(value.areaNum,value.faceNum,value.edgeNum,value.start,value.finish,value.travelType,value.travelTime)] end for;return world(mapName,true,time,vertexes,edges,edgeIndex,faces,faceIndex,areas,reaches,retailActive)
end function
