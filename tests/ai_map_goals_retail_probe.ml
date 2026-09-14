import mq3.botlib.ai_map_goals as mapGoals
import mq3.botlib.aas_runtime as aasRuntime
import mq3.format.aas as aas
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3

function require(ok,label) if not ok then return error(7599,"retail AI map goals: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return error(7599,"usage: ai_map_goals_retail_probe <pak0.pk3>") end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  bspData=pk3.read(archive,"maps/q3dm1.bsp");aasData=pk3.read(archive,"maps/q3dm1.aas");map=bsp.load(bspData);aasMap=aas.load(aasData);runtime=aasRuntime.create(aasMap);entities=bsp.entities(map);state=mapGoals.create();counts=mapGoals.initialize(state,runtime,entities);checks=0
  checks=checks+require(counts==[12,0],"q3dm1 info entity counts")
  courtyard=mapGoals.mapLocationGoal(state,"COURTYARD");checks=checks+require(courtyard!=void and courtyard.origin==[376.0,1792.0,72.0] and courtyard.areaNum>0,"reverse-list Courtyard location")
  mouth=mapGoals.mapLocationGoal(state,"Mouth");checks=checks+require(mouth!=void and mouth.origin==[1088.0,760.0,72.0] and mouth.areaNum>0,"reverse-list Mouth location")
  checks=checks+require(mapGoals.mapLocationGoal(state,"unknown")==void,"unknown retail location")
  checks=checks+require(mapGoals.nextCampSpotGoal(state,0).next==0,"q3dm1 has no info_camp")
  print("PASS: "+str(checks)+" retail q3dm1 map-goal checks locations="+str(counts[0])+" camps="+str(counts[1]));return 0
end function
