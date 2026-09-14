import mq3.botlib.aas_routing_tables as tables
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import mq3.format.pk3 as pk3

function require(ok,label) if not ok then return error(7538,"q3dm7 routing tables: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);map=aas.load(pk3.read(archive,"maps/q3dm7.aas"));state=runtime.create(map);router=routing.create(state);value=tables.create(router);checks=0
  checks=checks+require(value.totalLinks>1000 and value.totalLinks<=len(router.reaches) and value.truncatedSources==0,"retail reverse-link population")
  sample=router.reaches[1235];found=false;for each link in tables.incoming(value,sample.areaNum) if link.linkNum==1235 then found=true end if end for;checks=checks+require(found,"known retail reachability indexed by destination")
  checks=checks+require(len(value.portalMaxTravelTimes)==map.counts[aas.LUMP_PORTALS],"one maximum per retail portal")
  maximum=0;nonzero=0;consistent=true;for portalNum=0 to len(value.portalMaxTravelTimes)-1 travel=value.portalMaxTravelTimes[portalNum];if travel>0 then nonzero=nonzero+1 end if;if travel>maximum then maximum=travel end if;portal=aas.portal(map,portalNum);expected=0;if not (portal is error) then for each row in value.areaTravelTimes[portal.areaNum] for each candidate in row if candidate>expected then expected=candidate end if end for end for end if;if travel!=expected then consistent=false end if end for;checks=checks+require(consistent,"retail portal maxima equal full area matrices")
  checks=checks+require(nonzero>0 and maximum>0,"real portal map has nonzero traversal maxima")
  print("PASS: "+str(checks)+" retail q3dm7 reverse/portal tables links="+str(value.totalLinks)+" portals="+str(len(value.portalMaxTravelTimes))+" nonzero="+str(nonzero)+" max="+str(maximum));return 0
end function
