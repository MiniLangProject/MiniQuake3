// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native debug geometry and area visualization from code/botlib/be_aas_debug.c.
package mq3.botlib.aas_debug

import mq3.shared.math as q

const MAX_DEBUGLINES=1024
const MAX_DEBUGPOLYGONS=8192
const LINECOLOR_NONE=-1
const LINECOLOR_RED=1
const LINECOLOR_GREEN=2
const LINECOLOR_BLUE=3
const LINECOLOR_YELLOW=4
const FACE_GROUND=4
const FACE_LADDER=2
const AREACONTENTS_VIEWPORTAL=512
const TRAVELTYPE_MASK=16777215
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

struct Action boundary kind id color points values dispatched end struct
struct Edge vertices end struct
struct Face planeNum flags numEdges firstEdge frontArea backArea end struct
struct Plane normal dist end struct
struct Area numFaces firstFace end struct
struct AreaSettings contents cluster numReachableAreas firstReachableArea end struct
struct Reachability areaNum faceNum edgeNum start finish travelType travelTime end struct
struct World vertexes edges edgeIndex faces faceIndex planes areas areaSettings reachabilities pointArea loaded actions retailActive end struct
struct State lines visible polygons numDebugLines nextLine nextPolygon reachIndex lastAreaNum lastTime reach actions retailActive end struct

function edge(a,b) return Edge([a,b]) end function
function face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) return Face(planeNum,flags,numEdges,firstEdge,frontArea,backArea) end function
function plane(normal,dist) return Plane(normal,dist) end function
function area(numFaces,firstFace) return Area(numFaces,firstFace) end function
function areaSettings(contents,cluster,numReachableAreas,firstReachableArea) return AreaSettings(contents,cluster,numReachableAreas,firstReachableArea) end function
function reachability(areaNum,faceNum,edgeNum,start,finish,travelType,travelTime) return Reachability(areaNum,faceNum,edgeNum,start,finish,travelType,travelTime) end function
function world(vertexes,edges,edgeIndex,faces,faceIndex,planes,areas,settings,reaches,pointArea,retailActive) return World(vertexes,edges,edgeIndex,faces,faceIndex,planes,areas,settings,reaches,pointArea,true,[],retailActive) end function
function create(retailActive) return State(array(MAX_DEBUGLINES,0),array(MAX_DEBUGLINES,false),array(MAX_DEBUGPOLYGONS,0),0,1,1,0,0,0,void,[],retailActive) end function
function copy3(value) return [value[0],value[1],value[2]] end function
function subtract3(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
function absIndex(value) if value<0 then return 0-value end if;return value end function
function emit(state,boundary,kind,id,color,points,values) action=Action(boundary,kind,id,color,points,values,not state.retailActive);state.actions=state.actions+[action];return action end function
function createLine(state) id=state.nextLine;state.nextLine=id+1;emit(state,"botimport","line-create",id,0,[],[]);return id end function
function showLine(state,id,start,finish,color) emit(state,"botimport","line-show",id,color,[copy3(start),copy3(finish)],[]);return id end function

// AAS_ClearShownPolygons
function AAS_ClearShownPolygons(state) for index=0 to MAX_DEBUGPOLYGONS-1 if state.polygons[index]!=0 then emit(state,"botimport","polygon-delete",state.polygons[index],0,[],[]) end if;state.polygons[index]=0 end for;return void end function
// AAS_ShowPolygon
function AAS_ShowPolygon(state,color,numPoints,points) for index=0 to MAX_DEBUGPOLYGONS-1 if state.polygons[index]==0 then id=state.nextPolygon;state.nextPolygon=id+1;state.polygons[index]=id;emit(state,"botimport","polygon-create",id,color,points, [numPoints]);return id end if end for;return 0 end function
// AAS_ClearShownDebugLines
function AAS_ClearShownDebugLines(state) for index=0 to MAX_DEBUGLINES-1 if state.lines[index]!=0 then emit(state,"botimport","line-delete",state.lines[index],0,[],[]);state.lines[index]=0;state.visible[index]=false end if end for;return void end function
// AAS_DebugLine
function AAS_DebugLine(state,start,finish,color)
  for index=0 to MAX_DEBUGLINES-1
    if state.lines[index]==0 then state.lines[index]=createLine(state);state.visible[index]=false;state.numDebugLines=state.numDebugLines+1 end if
    if not state.visible[index] then showLine(state,state.lines[index],start,finish,color);state.visible[index]=true;return state.lines[index] end if
  end for;return 0
end function
// AAS_PermanentLine
function AAS_PermanentLine(state,start,finish,color) id=createLine(state);showLine(state,id,start,finish,color);return id end function
// AAS_DrawPermanentCross
function AAS_DrawPermanentCross(state,origin,size,color) for axis=0 to 2 start=copy3(origin);finish=copy3(origin);start[axis]=start[axis]+size;finish[axis]=finish[axis]-size;AAS_DebugLine(state,start,finish,color);AAS_PermanentLine(state,start,finish,color) end for;return void end function

function claimLine(state) for index=0 to MAX_DEBUGLINES-1 if state.lines[index]==0 then state.lines[index]=createLine(state);state.visible[index]=true;state.numDebugLines=state.numDebugLines+1;return state.lines[index] else if not state.visible[index] then state.visible[index]=true;return state.lines[index] end if end for;return 0 end function
// AAS_DrawPlaneCross
function AAS_DrawPlaneCross(state,point,normal,dist,typeValue,color)
  start1=copy3(point);finish1=copy3(point);start2=copy3(point);finish2=copy3(point);n0=typeValue%3;n1=(typeValue+1)%3;n2=(typeValue+2)%3
  start1[n1]=start1[n1]-6.0;start1[n2]=start1[n2]-6.0;finish1[n1]=finish1[n1]+6.0;finish1[n2]=finish1[n2]+6.0;start2[n1]=start2[n1]+6.0;start2[n2]=start2[n2]-6.0;finish2[n1]=finish2[n1]-6.0;finish2[n2]=finish2[n2]+6.0
  start1[n0]=(dist-(start1[n1]*normal[n1]+start1[n2]*normal[n2]))/normal[n0];finish1[n0]=(dist-(finish1[n1]*normal[n1]+finish1[n2]*normal[n2]))/normal[n0];start2[n0]=(dist-(start2[n1]*normal[n1]+start2[n2]*normal[n2]))/normal[n0];finish2[n0]=(dist-(finish2[n1]*normal[n1]+finish2[n2]*normal[n2]))/normal[n0]
  first=claimLine(state);second=claimLine(state);if first!=0 then showLine(state,first,start1,finish1,color) end if;if second!=0 then showLine(state,second,start2,finish2,color) end if;return [start1,finish1,start2,finish2]
end function
// AAS_ShowBoundingBox
function AAS_ShowBoundingBox(state,origin,mins,maxs)
  corners=[[origin[0]+maxs[0],origin[1]+maxs[1],origin[2]+maxs[2]],[origin[0]+mins[0],origin[1]+maxs[1],origin[2]+maxs[2]],[origin[0]+mins[0],origin[1]+mins[1],origin[2]+maxs[2]],[origin[0]+maxs[0],origin[1]+mins[1],origin[2]+maxs[2]]]
  for index=0 to 3 corners=corners+[[corners[index][0],corners[index][1],origin[2]+mins[2]]] end for
  for index=0 to 3 AAS_DebugLine(state,corners[index],corners[(index+1)&3],LINECOLOR_RED);AAS_DebugLine(state,corners[4+index],corners[4+((index+1)&3)],LINECOLOR_RED);AAS_DebugLine(state,corners[index],corners[4+index],LINECOLOR_RED) end for;return corners
end function

// AAS_ShowFace
function AAS_ShowFace(state,value,faceNum)
  if faceNum<0 or faceNum>=len(value.faces) then emit(state,"botimport","error",faceNum,0,[],[]);return false end if;item=value.faces[faceNum];color=LINECOLOR_YELLOW
  for offset=0 to item.numEdges-1
    edgeNum=absIndex(value.edgeIndex[item.firstEdge+offset])
    if edgeNum>=len(value.edges) then emit(state,"botimport","error",edgeNum,0,[],[])
    else
      edgeValue=value.edges[edgeNum]
      if color==LINECOLOR_RED then color=LINECOLOR_GREEN else if color==LINECOLOR_GREEN then color=LINECOLOR_BLUE else if color==LINECOLOR_BLUE then color=LINECOLOR_YELLOW else color=LINECOLOR_RED end if
      AAS_DebugLine(state,value.vertexes[edgeValue.vertices[0]],value.vertexes[edgeValue.vertices[1]],color)
    end if
  end for
  edgeNum=absIndex(value.edgeIndex[item.firstEdge]);edgeValue=value.edges[edgeNum];start=copy3(value.vertexes[edgeValue.vertices[0]]);finish=q.VectorMA(start,20.0,value.planes[item.planeNum].normal);AAS_DebugLine(state,start,finish,LINECOLOR_RED);return true
end function
// AAS_ShowFacePolygon
function AAS_ShowFacePolygon(state,value,faceNum,color,flip)
  if faceNum<0 or faceNum>=len(value.faces) then emit(state,"botimport","error",faceNum,0,[],[]);return 0 end if;item=value.faces[faceNum];points=[]
  if flip then offset=item.numEdges-1;while offset>=0 signedEdge=value.edgeIndex[item.firstEdge+offset];edgeValue=value.edges[absIndex(signedEdge)];side=0;if signedEdge<0 then side=1 end if;points=points+[copy3(value.vertexes[edgeValue.vertices[side]])];offset=offset-1 end while else for offset=0 to item.numEdges-1 signedEdge=value.edgeIndex[item.firstEdge+offset];edgeValue=value.edges[absIndex(signedEdge)];side=0;if signedEdge<0 then side=1 end if;points=points+[copy3(value.vertexes[edgeValue.vertices[side]])] end for end if
  return AAS_ShowPolygon(state,color,len(points),points)
end function
// AAS_ShowArea
function AAS_ShowArea(state,value,areaNum,groundFacesOnly)
  if areaNum<0 or areaNum>=len(value.areas) then emit(state,"botimport","error",areaNum,0,[],[]);return false end if;item=value.areas[areaNum];areaEdges=[]
  for areaOffset=0 to item.numFaces-1 faceNum=absIndex(value.faceIndex[item.firstFace+areaOffset]);faceValue=value.faces[faceNum];if not groundFacesOnly or (faceValue.flags&(FACE_GROUND|FACE_LADDER))!=0 then for offset=0 to faceValue.numEdges-1 edgeNum=absIndex(value.edgeIndex[faceValue.firstEdge+offset]);found=false;for each prior in areaEdges if prior==edgeNum then found=true end if end for;if not found and len(areaEdges)<MAX_DEBUGLINES then areaEdges=areaEdges+[edgeNum] end if end for end if end for
  color=0;for each edgeNum in areaEdges edgeValue=value.edges[edgeNum];if color==LINECOLOR_RED then color=LINECOLOR_BLUE else if color==LINECOLOR_BLUE then color=LINECOLOR_GREEN else if color==LINECOLOR_GREEN then color=LINECOLOR_YELLOW else color=LINECOLOR_RED end if;AAS_DebugLine(state,value.vertexes[edgeValue.vertices[0]],value.vertexes[edgeValue.vertices[1]],color) end for;return true
end function
// AAS_ShowAreaPolygons
function AAS_ShowAreaPolygons(state,value,areaNum,color,groundFacesOnly)
  if areaNum<0 or areaNum>=len(value.areas) then emit(state,"botimport","error",areaNum,0,[],[]);return false end if;item=value.areas[areaNum];for offset=0 to item.numFaces-1 faceNum=absIndex(value.faceIndex[item.firstFace+offset]);faceValue=value.faces[faceNum];if not groundFacesOnly or (faceValue.flags&(FACE_GROUND|FACE_LADDER))!=0 then AAS_ShowFacePolygon(state,value,faceNum,color,faceValue.frontArea!=areaNum) end if end for;return true
end function
// AAS_DrawCross
function AAS_DrawCross(state,origin,size,color) for axis=0 to 2 start=copy3(origin);finish=copy3(origin);start[axis]=start[axis]+size;finish[axis]=finish[axis]-size;AAS_DebugLine(state,start,finish,color) end for;return void end function
// AAS_PrintTravelType
function AAS_PrintTravelType(travelType)
  names=["UNKNOWN TRAVEL TYPE","TRAVEL_INVALID","TRAVEL_WALK","TRAVEL_CROUCH","TRAVEL_BARRIERJUMP","TRAVEL_JUMP","TRAVEL_LADDER","TRAVEL_WALKOFFLEDGE","TRAVEL_SWIM","TRAVEL_WATERJUMP","TRAVEL_TELEPORT","TRAVEL_ELEVATOR","TRAVEL_ROCKETJUMP","TRAVEL_BFGJUMP","TRAVEL_GRAPPLEHOOK","TRAVEL_DOUBLEJUMP","TRAVEL_RAMPJUMP","TRAVEL_STRAFEJUMP","TRAVEL_JUMPPAD","TRAVEL_FUNCBOB"];kind=travelType&TRAVELTYPE_MASK;if kind>0 and kind<len(names) then return names[kind] end if;return "UNKNOWN TRAVEL TYPE"
end function
// AAS_DrawArrow
function AAS_DrawArrow(state,start,finish,lineColor,arrowColor)
  direction=q.VectorNormalize2(subtract3(finish,start));up=[0.0,0.0,1.0];dot=q.DotProduct(direction,up);cross=[0.0,0.0,0.0];if dot>0.99 or dot<(-0.99) then cross=[1.0,0.0,0.0] else cross=q.CrossProduct(direction,up) end if;base=q.VectorMA(finish,-6.0,direction);p1=q.VectorMA(base,6.0,cross);p2=q.VectorMA(base,-6.0,cross);AAS_DebugLine(state,start,finish,lineColor);AAS_DebugLine(state,p1,finish,arrowColor);AAS_DebugLine(state,p2,finish,arrowColor);return [p1,p2]
end function

// AAS_ShowReachability
function AAS_ShowReachability(state,value,reach)
  AAS_ShowAreaPolygons(state,value,reach.areaNum,5,true);AAS_DrawArrow(state,reach.start,reach.finish,LINECOLOR_BLUE,LINECOLOR_YELLOW);kind=reach.travelType&TRAVELTYPE_MASK
  if kind==TRAVEL_JUMP or kind==TRAVEL_WALKOFFLEDGE then emit(state,"aas","predict-jump",reach.areaNum,kind,[reach.start,reach.finish],[]) else if kind==TRAVEL_ROCKETJUMP then emit(state,"aas","predict-rocketjump",reach.areaNum,kind,[reach.start,reach.finish],[]) else if kind==TRAVEL_JUMPPAD then emit(state,"aas","predict-jumppad",reach.areaNum,kind,[reach.start,reach.finish],[reach.edgeNum,reach.faceNum]) end if;return void
end function
// AAS_ShowReachableAreas
function AAS_ShowReachableAreas(state,value,areaNum,time)
  if areaNum<0 or areaNum>=len(value.areaSettings) then return false end if;if areaNum!=state.lastAreaNum then state.reachIndex=0;state.lastAreaNum=areaNum end if;settings=value.areaSettings[areaNum];if settings.numReachableAreas==0 then return false end if;if state.reachIndex>=settings.numReachableAreas then state.reachIndex=0 end if
  if time-state.lastTime>1.5 then state.reach=value.reachabilities[settings.firstReachableArea+state.reachIndex];state.reachIndex=state.reachIndex+1;state.lastTime=time;emit(state,"botimport","print-travel",0,0,[],[state.reach.travelType&TRAVELTYPE_MASK]) end if;if state.reach!=void then AAS_ShowReachability(state,value,state.reach) end if;return true
end function

// AAS_FloodAreas_r
function AAS_FloodAreas_r(state,value,areaNum,cluster,done)
  AAS_ShowAreaPolygons(state,value,areaNum,1,true);item=value.areas[areaNum];settings=value.areaSettings[areaNum]
  for offset=0 to item.numFaces-1 faceNum=absIndex(value.faceIndex[item.firstFace+offset]);faceValue=value.faces[faceNum];next=faceValue.frontArea;if next==areaNum then next=faceValue.backArea end if;if next!=0 and not done[next] then done[next]=true;if (value.areaSettings[next].contents&AREACONTENTS_VIEWPORTAL)==0 and value.areaSettings[next].cluster==cluster then AAS_FloodAreas_r(state,value,next,cluster,done) end if end if end for
  for offset=0 to settings.numReachableAreas-1 reach=value.reachabilities[settings.firstReachableArea+offset];next=reach.areaNum;if next!=0 and not done[next] then done[next]=true;if (value.areaSettings[next].contents&AREACONTENTS_VIEWPORTAL)==0 and value.areaSettings[next].cluster==cluster then AAS_FloodAreas_r(state,value,next,cluster,done) end if end if end for;return done
end function
// AAS_FloodAreas
function AAS_FloodAreas(state,value,origin)
  if not value.loaded then return error(7990,"AAS debug requires loaded world") end if;areaNum=value.pointArea;if areaNum<0 or areaNum>=len(value.areas) then return error(7990,"AAS point area outside world") end if;done=array(len(value.areas),false);done[areaNum]=true;return AAS_FloodAreas_r(state,value,areaNum,value.areaSettings[areaNum].cluster,done)
end function
