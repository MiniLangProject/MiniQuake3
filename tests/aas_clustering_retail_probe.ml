import mq3.botlib.aas_clustering as c
import mq3.format.aas as aas
import mq3.format.pk3 as pk3

function require(ok,label) if not ok then return error(7984,"retail AAS clustering: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);map=aas.load(pk3.read(archive,"maps/q3dm7.aas"));value=c.fromMap(map,true);checks=0
  checks=checks+require(len(value.settings)==map.counts[aas.LUMP_AREAS] and len(value.portals)==map.counts[aas.LUMP_PORTALS],"full topology loaded")
  checks=checks+require(len(value.clusters)>1 and len(value.portalIndex)>0,"retail cluster tables")
  checks=checks+require(c.AAS_TestPortals(value),"retail portals have both clusters")
  forced=c.AAS_CountForcedClusterPortals(value);checks=checks+require(forced>0,"retail portal contents")
  c.AAS_CreateViewPortals(value);view=0;projected=true;for index=1 to len(value.settings)-1 if (value.settings[index].contents&c.AREACONTENTS_VIEWPORTAL)!=0 then view=view+1 end if;if (value.settings[index].contents&c.AREACONTENTS_CLUSTERPORTAL)!=0 and (value.settings[index].contents&c.AREACONTENTS_VIEWPORTAL)==0 then projected=false end if end for;checks=checks+require(projected and view>=forced,"view portal projection")
  checks=checks+require(len(value.actions)>0 and not value.actions[len(value.actions)-1].dispatched,"retail host suppression")
  print("PASS: "+str(checks)+" retail q3dm7 clustering contracts areas="+str(len(value.settings))+" portals="+str(len(value.portals))+" clusters="+str(len(value.clusters)));return 0
end function
