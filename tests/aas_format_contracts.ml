import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.fs as fs

function req(ok,message) if not ok then return error(7512,message) end if;return 1 end function
function clone(data) return slice(data,0,len(data)) end function

function main(args)
  if len(args)!=2 then return 2 end if
  count=0;v4data=fs.readAllBytes(args[0]);v5data=fs.readAllBytes(args[1]);v4=aas.load(v4data);if v4 is error then return v4 end if;v5=aas.load(v5data);if v5 is error then return v5 end if
  count=count+req(aas.HEADER_SIZE==124 and aas.LUMP_COUNT==14 and aas.REACHABILITY_SIZE==44,"published ABI sizes")
  count=count+req(v4.version==aas.AAS_VERSION_OLD and v5.version==aas.AAS_VERSION,"AAS4 and AAS5 accepted")
  count=count+req(v4.bspChecksum==0x12345678 and v5.bspChecksum==0x12345678,"AAS5 header deobfuscation")
  count=count+req(v4.sequential and v5.sequential,"writer-order lumps detected")
  count=count+req(v5.counts==[1,2,1,2,1,2,1,2,2,2,2,1,0,1],"all fourteen record counts")
  count=count+req(aas.vertex(v5,1)==[4.0,5.0,6.0],"vertex record")
  box=aas.bbox(v5,0);count=count+req(box.presenceType==2 and box.mins==[-16.0,-16.0,-24.0] and box.maxs==[16.0,16.0,32.0],"bbox record")
  plane=aas.plane(v5,0);count=count+req(plane.normal==[0.0,0.0,1.0] and plane.dist==64.0 and plane.type==2,"plane record")
  count=count+req(aas.edge(v5,1)==[0,1] and aas.edgeIndex(v5,0)==1,"edge and signed index records")
  face=aas.face(v5,1);count=count+req(face.planeNum==0 and face.numEdges==1 and face.backArea==1,"face record")
  area=aas.area(v5,1);count=count+req(area.areaNum==1 and area.numFaces==1 and area.center==[0.0,0.0,4.0],"area record")
  settings=aas.areaSettings(v5,1);count=count+req(settings.presenceType==2 and settings.numReachableAreas==1 and settings.firstReachableArea==1,"area settings record")
  reach=aas.reachability(v5,1);count=count+req(reach.areaNum==1 and reach.travelType==2 and reach.travelTime==5 and reach.finish==[4.0,5.0,6.0],"44-byte reachability record and padding")
  node=aas.node(v5,1);count=count+req(node.planeNum==0 and node.children==[-1,0],"node record")
  portal=aas.portal(v5,0);cluster=aas.cluster(v5,0);count=count+req(portal.areaNum==0 and cluster.numPortals==0,"portal and cluster dummy records")
  count=count+req(aas.checkBspChecksum(v5,0x12345678)==true and (try(aas.checkBspChecksum(v5,1))) is error,"optional BSP checksum contract")
  count=count+req((try(aas.vertex(v5,2))) is error and (try(aas.recordOffset(v5,14,0))) is error,"record bounds")

  bad=clone(v4data);n.writeU32(bad,0,0);count=count+req((try(aas.load(bad))) is error,"identity rejected")
  bad=clone(v4data);n.writeU32(bad,4,3);count=count+req((try(aas.load(bad))) is error,"version rejected")
  count=count+req((try(aas.load(slice(v4data,0,123)))) is error,"truncated header rejected")
  bad=clone(v4data);n.writeU32(bad,12,0xffffff00);count=count+req((try(aas.load(bad))) is error,"lump offset outside file rejected")
  bad=clone(v4data);n.writeU32(bad,16,31);count=count+req((try(aas.load(bad))) is error,"record-size mismatch rejected")
  bad=clone(v4data);n.writeU32(bad,12,100);count=count+req((try(aas.load(bad))) is error,"header overlap rejected")
  bad=clone(v4data);n.writeU32(bad,20,v4.offsets[aas.LUMP_BBOXES]);count=count+req((try(aas.load(bad))) is error,"lump overlap rejected")
  bad=clone(v4data);n.writeU32(bad,12+aas.LUMP_PORTALINDEX*8,len(bad));loose=aas.load(bad);count=count+req(not (loose is error) and not loose.sequential,"non-sequential layout accepted and reported")
  bad=clone(v4data);n.writeU32(bad,16+aas.LUMP_AREASETTINGS*8,28);count=count+req((try(aas.load(bad))) is error,"area/settings mismatch rejected")
  bad=clone(v4data);n.writeU32(bad,v4.offsets[aas.LUMP_EDGES]+aas.EDGE_SIZE,99);count=count+req((try(aas.load(bad))) is error,"edge vertex reference rejected")
  bad=clone(v4data);n.writeU32(bad,v4.offsets[aas.LUMP_NODES]+aas.NODE_SIZE+4,99);count=count+req((try(aas.load(bad))) is error,"node child reference rejected")
  print("PASS: "+str(count)+" AAS format contracts");return 0
end function
