import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime

function require(ok,label) if not ok then return error(7529,"AAS node cache: "+label) end if;return 1 end function
function referencePointAreaNum(map,point)
  nodeNum=1;steps=0;limit=map.counts[aas.LUMP_NODES]+1
  while nodeNum>0
    if nodeNum>=map.counts[aas.LUMP_NODES] or steps>=limit then return 0 end if
    node=aas.node(map,nodeNum);if node is error then return 0 end if
    plane=aas.plane(map,node.planeNum);if plane is error then return 0 end if
    side=point[0]*plane.normal[0]+point[1]*plane.normal[1]+point[2]*plane.normal[2]-plane.dist
    if side>0.0 then nodeNum=node.children[0] else nodeNum=node.children[1] end if
    steps=steps+1
  end while
  if nodeNum==0 then return 0 end if
  areaNum=0-nodeNum;if areaNum<=0 or areaNum>=map.counts[aas.LUMP_AREAS] then return 0 end if;return areaNum
end function
function main(args)
  if len(args)!=1 then return error(7528,"usage: aas_runtime_cache_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  checks=0
  for each name in ["q3dm0","q3dm1"]
    map=aas.load(pk3.read(archive,"maps/"+name+".aas"));if map is error then return map end if
    cached=runtime.create(map);if cached is error then return cached end if
    sampled=0
    for areaNum=1 to map.counts[aas.LUMP_AREAS]-1
      if sampled>=256 then break end if
      area=aas.area(map,areaNum)
      for each point in [area.center,[area.center[0]+4.0,area.center[1]-4.0,area.center[2]+4.0],[area.center[0]-8.0,area.center[1]+8.0,area.center[2]-8.0]]
        expected=referencePointAreaNum(map,point)
        checks=checks+require(runtime.pointAreaNum(cached,point)==expected,name+" first traversal")
        checks=checks+require(runtime.pointAreaNum(cached,point)==expected,name+" cached traversal")
      end for
      sampled=sampled+1
    end for
  end for
  print "PASS: Retail AAS node/plane cache differential checks="+str(checks)
  return 0
end function
