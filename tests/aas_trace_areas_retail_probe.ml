import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_trace_areas as traceAreas

function require(ok,message) if not ok then return error(9913,message) end if;return 1 end function

function main(args)
  if len(args)!=1 then return error(9913,"usage: aas_trace_areas_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));if map is error then return map end if
  nav=runtime.create(map);if nav is error then return nav end if
  selected=[]
  for areaNum=1 to map.counts[aas.LUMP_AREAS]-1
    area=aas.area(map,areaNum);if area is error then return area end if
    if runtime.pointAreaNum(nav,area.center)==areaNum then selected=selected+[[areaNum,area.center]];if len(selected)==2 then break end if end if
  end for
  count=0;count=count+require(len(selected)==2,"two q3dm1 area centers found")
  first=selected[0];second=selected[1]
  same=traceAreas.trace(nav,first[1],first[1],16);if same is error then return same end if
  count=count+require(same.areas==[first[0]] and same.points==[first[1]],"stationary trace returns containing area")
  forward=traceAreas.trace(nav,first[1],second[1],64);if forward is error then return forward end if
  count=count+require(len(forward.areas)>0 and forward.areas[0]==first[0] and forward.areas[len(forward.areas)-1]==second[0],"forward trace preserves line order")
  count=count+require(len(forward.points)==len(forward.areas) and forward.points[0]==first[1],"entry point emitted for every area")
  limited=traceAreas.trace(nav,first[1],second[1],1);count=count+require(limited.areas==[first[0]],"maxareas truncates traversal")
  reverse=traceAreas.trace(nav,second[1],first[1],64);count=count+require(len(reverse.areas)>0 and reverse.areas[0]==second[0] and reverse.areas[len(reverse.areas)-1]==first[0],"reverse trace preserves reverse order")
  print("PASS: "+str(count)+" q3dm1 AAS TraceAreas contracts areas="+str(len(forward.areas)));return 0
end function
