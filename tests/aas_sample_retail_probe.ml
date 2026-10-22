// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.aas_sample as sample
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_trace_areas as traceAreas
import mq3.botlib.aas_client_trace as clientTrace
import mq3.format.aas as aas
import mq3.format.pk3 as pk3
function req(ok,label) if not ok then return error(7962,"AAS sample retail: "+label) end if;return 1 end function
function contains(values,value) for each item in values if item==value then return true end if end for;return false end function
function main(args)
  archive=pk3.open(args[0]);map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));rt=runtime.create(map);world=sample.create(rt);checks=0;matched=0;boxed=0
  for areaNum=1 to 256 area=aas.area(map,areaNum);if sample.AAS_PointAreaNum(world,area.center)==areaNum then matched=matched+1 end if;areas=sample.AAS_BBoxAreas(world,area.mins,area.maxs,128);if contains(areas,areaNum) then boxed=boxed+1 end if end for
  checks=checks+req(matched==256 and boxed==256,"retail centers and bounds")
  first=aas.area(map,1).center;last=aas.area(map,256).center;a=sample.AAS_TraceAreas(world,first,last,64);b=traceAreas.trace(rt,first,last,64);checks=checks+req(a.areas==b.areas and a.points==b.points,"retail TraceAreas parity")
  c=sample.AAS_TraceClientBBox(world,first,last,sample.PRESENCE_NORMAL,-1);d=clientTrace.trace(rt,first,last,sample.PRESENCE_NORMAL);checks=checks+req(c.startsolid==d.startsolid and c.fraction==d.fraction and c.area==d.area and c.lastarea==d.lastarea,"retail client trace parity")
  chosen=0;for areaNum=1 to map.counts[aas.LUMP_AREAS]-1 if chosen==0 and aas.areaSettings(map,areaNum).numReachableAreas>0 then chosen=areaNum end if end for;info=sample.AAS_AreaInfo(world,chosen);checks=checks+req(info.numReachableAreas>0 and info.presenceType!=0,"retail area info")
  checks=checks+req(sample.AAS_PointReachabilityAreaIndex(world,void)>0,"cluster reachability total")
  checks=checks+req(sample.AAS_PlaneFromNum(world,1).normal!=void,"retail plane")
  print("PASS: "+str(checks)+" q3dm1 AAS sample contracts areas="+str(map.counts[aas.LUMP_AREAS])+" centers="+str(matched)+" bounds="+str(boxed)+"\n");return 0
end function
