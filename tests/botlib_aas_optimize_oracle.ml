import mq3.botlib.aas_optimizer as opt

function fixture(retailActive)
  vertices=[[1,2,3],[11,12,13],[21,22,23],[31,32,33],[41,42,43]]
  edges=[opt.edge(0,0),opt.edge(1,2),opt.edge(2,3),opt.edge(3,4)]
  faces=[opt.face(0,0,0,0,0,0),opt.face(7,opt.FACE_LADDER,2,0,1,2),opt.face(8,0,1,2,1,0),opt.face(9,opt.FACE_LADDER,1,3,2,0)]
  areas=[opt.area(0,0,0,[0,0,0],[0,0,0],[0,0,0]),opt.area(1,2,0,[0,0,0],[0,0,0],[0,0,0]),opt.area(2,1,2,[0,0,0],[0,0,0],[0,0,0])]
  reaches=[opt.reachability(2,1,-2,[0,0,0],[1,2,3],1,17),opt.reachability(2,-3,-3,[0,0,0],[0,0,0],opt.TRAVEL_ELEVATOR,18),opt.reachability(2,333,444,[0,0,0],[0,0,0],opt.TRAVEL_JUMPPAD,19),opt.reachability(2,-222,-111,[0,0,0],[0,0,0],opt.TRAVEL_FUNCBOB,20)]
  return opt.world("fixture",true,125,vertices,edges,[1,2,-1,3],faces,[1,2,-3],areas,reaches,retailActive)
end function
function csv(values) text="";for index=0 to len(values)-1 if index>0 then text=text+"," end if;text=text+str(values[index]) end for;return text end function
function edgesText(values) text="";for index=1 to len(values)-1 if index>1 then text=text+";" end if;text=text+str(values[index].vertices[0])+","+str(values[index].vertices[1]) end for;return text end function
function facesText(values) text="";for index=1 to len(values)-1 if index>1 then text=text+";" end if;v=values[index];text=text+str(v.planeNum)+","+str(v.flags)+","+str(v.numEdges)+","+str(v.firstEdge)+","+str(v.frontArea)+","+str(v.backArea) end for;return text end function
function verticesText(values) text="";for index=0 to len(values)-1 if index>0 then text=text+";" end if;text=text+csv(values[index]) end for;return text end function
function line(value) data=bytes(value);if len(data)>0 and data[len(data)-1]==10 then return decode(slice(data,0,len(data)-1)) end if;return value end function
function main(args)
  print("keep|"+str(opt.keepEdge(opt.edge(1,2)))+"|"+str(opt.keepFace(opt.face(0,2,0,0,0,0)))+"|"+str(opt.keepFace(opt.face(0,0,0,0,0,0))))
  world=opt.optimize(fixture(false));print("counts|"+str(len(world.vertexes))+"|"+str(len(world.edges))+"|"+str(len(world.edgeIndex))+"|"+str(len(world.faces))+"|"+str(len(world.faceIndex))+"|"+str(len(world.areas)))
  print("areas|"+str(world.areas[1].areaNum)+","+str(world.areas[1].numFaces)+","+str(world.areas[1].firstFace)+"|"+str(world.areas[2].areaNum)+","+str(world.areas[2].numFaces)+","+str(world.areas[2].firstFace))
  print("indexes|"+csv(world.edgeIndex)+"|"+csv(world.faceIndex));print("edges|"+edgesText(world.edges));print("faces|"+facesText(world.faces));print("vertices|"+verticesText(world.vertexes))
  for index=0 to len(world.reachability)-1 value=world.reachability[index];print("reach"+str(index)+"|"+str(value.faceNum)+"|"+str(value.edgeNum)+"|"+str(value.travelType)+"|"+str(value.travelTime)) end for
  print("print|"+str(len(world.actions))+"|2|"+line(world.actions[0].text));return 0
end function
