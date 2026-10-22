import mq3.botlib.aas_debug as debug

function require(ok,label) if not ok then return error(7991,"aas debug contract: "+label) end if;return 1 end function
function sampleWorld(retail)
  vertices=[[0.0,0.0,0.0],[16.0,0.0,0.0],[16.0,16.0,0.0],[0.0,16.0,0.0],[32.0,0.0,0.0],[32.0,16.0,0.0]]
  edges=[debug.edge(0,0),debug.edge(0,1),debug.edge(1,2),debug.edge(2,3),debug.edge(3,0),debug.edge(1,4),debug.edge(4,5),debug.edge(5,2)]
  faces=[debug.face(0,0,0,0,0,0),debug.face(0,debug.FACE_GROUND,4,0,1,0),debug.face(0,debug.FACE_GROUND,4,4,2,0)]
  return debug.world(vertices,edges,[1,2,3,4,2,5,6,7],faces,[1,2],[debug.plane([0.0,0.0,1.0],0.0)],[debug.area(0,0),debug.area(1,0),debug.area(1,1)],[debug.areaSettings(0,0,0,0),debug.areaSettings(0,1,1,0),debug.areaSettings(0,1,0,0)],[debug.reachability(2,0,0,[8.0,8.0,0.0],[24.0,8.0,0.0],debug.TRAVEL_WALK,10)],1,retail)
end function

function main(args)
  count=0;state=debug.create(false)
  count=count+require(debug.AAS_DebugLine(state,[0,0,0],[1,2,3],debug.LINECOLOR_RED)==1,"first pooled line id")
  count=count+require(state.numDebugLines==1 and state.visible[0] and len(state.actions)==2,"pooled line create and show")
  debug.AAS_ClearShownDebugLines(state);count=count+require(state.lines[0]==0 and not state.visible[0] and state.numDebugLines==1,"clear deletes without resetting historical count")
  debug.AAS_DrawCross(state,[10,20,30],2,debug.LINECOLOR_GREEN);count=count+require(state.numDebugLines==4,"cross consumes three new pooled handles")
  prior=len(state.actions);debug.AAS_DrawPermanentCross(state,[0,0,0],1,debug.LINECOLOR_BLUE);count=count+require(len(state.actions)-prior==12,"permanent cross emits pooled and untracked line pairs")
  points=debug.AAS_DrawPlaneCross(state,[0,0,0],[1,0,0],5,0,debug.LINECOLOR_YELLOW);count=count+require(points[0][0]==5 and points[0][1]==-6 and points[1][2]==6,"plane cross solves dominant axis")
  prior=state.numDebugLines;corners=debug.AAS_ShowBoundingBox(state,[1,2,3],[-1,-2,-3],[4,5,6]);count=count+require(corners[0][0]==5 and corners[4][2]==0 and state.numDebugLines==prior+12,"bounding box emits twelve edges")
  arrow=debug.AAS_DrawArrow(state,[0,0,0],[12,0,0],debug.LINECOLOR_BLUE,debug.LINECOLOR_YELLOW);count=count+require(arrow[0][0]==6 and arrow[0][1]==-6 and arrow[1][1]==6,"arrowhead geometry matches cross product")
  count=count+require(debug.AAS_PrintTravelType(debug.TRAVEL_JUMPPAD)=="TRAVEL_JUMPPAD" and debug.AAS_PrintTravelType(99)=="UNKNOWN TRAVEL TYPE","travel names")
  polygon=[[0,0,0],[1,0,0],[0,1,0]];id=debug.AAS_ShowPolygon(state,7,3,polygon);count=count+require(id==1 and state.polygons[0]==1,"polygon uses first free slot")
  debug.AAS_ClearShownPolygons(state);count=count+require(state.polygons[0]==0 and state.actions[len(state.actions)-1].kind=="polygon-delete","polygon clear deletes live handles")

  value=sampleWorld(false);state=debug.create(false);count=count+require(debug.AAS_ShowFace(state,value,1),"face visualization")
  count=count+require(state.numDebugLines==5,"face edges plus normal")
  state=debug.create(false);debug.AAS_ShowFacePolygon(state,value,1,5,false);first=state.actions[len(state.actions)-1];count=count+require(first.kind=="polygon-create" and len(first.points)==4 and first.points[0][0]==0,"face polygon preserves signed-edge order")
  state=debug.create(false);count=count+require(debug.AAS_ShowArea(state,value,1,true) and state.numDebugLines==4,"area unique edges")
  state=debug.create(false);count=count+require(debug.AAS_ShowAreaPolygons(state,value,1,5,true) and state.polygons[0]!=0,"area polygon emission")
  state=debug.create(false);debug.AAS_ShowReachability(state,value,value.reachabilities[0]);count=count+require(state.polygons[0]!=0 and state.numDebugLines==3,"reachability polygon and arrow")
  state=debug.create(false);count=count+require(debug.AAS_ShowReachableAreas(state,value,1,2.0) and state.reachIndex==1 and state.reach!=void,"reachable-area cycling")
  state=debug.create(false);done=debug.AAS_FloodAreas(state,value,[1,1,1]);count=count+require(done[1] and done[2],"flood follows in-cluster reachability")
  mirror=sampleWorld(true);state=debug.create(true);debug.AAS_ShowAreaPolygons(state,mirror,1,2,true);count=count+require(len(state.actions)>0 and not state.actions[0].dispatched,"Retail observer suppresses duplicate debug host calls")
  full=debug.create(false);for index=0 to debug.MAX_DEBUGLINES-1 debug.AAS_DebugLine(full,[0,0,0],[1,1,1],1) end for;count=count+require(debug.AAS_DebugLine(full,[0,0,0],[1,1,1],1)==0 and full.numDebugLines==debug.MAX_DEBUGLINES,"line pool cap")
  print("PASS: "+str(count)+" AAS debug contracts / 19 symbols");return 0
end function
