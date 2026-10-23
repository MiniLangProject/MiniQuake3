import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_entities as entities
import mq3.botlib.aas_main as mainAas

function require(ok,label) if not ok then return error(7993,"Retail be_aas entity/main: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then print("usage: be_aas_entity_main_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;data=pk3.read(archive,"maps/q3dm1.aas");if data is error then return data end if;map=aas.load(data);if map is error then return map end if;rt=runtime.create(map);if rt is error then return rt end if;checks=0
  checks=checks+require(map.counts[aas.LUMP_AREAS]>100 and map.counts[aas.LUMP_REACHABILITY]>100,"retail q3dm1 topology")
  selected=0;origin=[0.0,0.0,0.0]
  for areaNum=1 to map.counts[aas.LUMP_AREAS]-1 info=runtime.areaInfo(rt,areaNum);if not (info is error) and info.numReachableAreas>0 then selected=areaNum;origin=info.center;break end if end for
  checks=checks+require(selected>0,"reachable source area")
  state=entities.create(64);entities.bindRuntime(state,rt);value=entities.EntityState(entities.ET_MOVER,0,origin,[0.0,0.0,0.0],origin,[-8.0,-8.0,-8.0],[8.0,8.0,8.0],1022,entities.SOLID_BBOX,17,0,0,0,0,0,0,0,0);entities.AAS_UpdateEntity(state,1,value,void)
  checks=checks+require(len(state.areaLinks[1])>0,"retail AAS area links");checks=checks+require(entities.AAS_BestReachableEntityArea(state,1)>0,"best reachable linked area");checks=checks+require(entities.AAS_OriginOfMoverWithModelNum(state,17)[0],"mover model lookup")
  life=mainAas.create(8,64);checks=checks+require(mainAas.AAS_LoadMap(life,"q3dm1",rt)==0 and life.runtime==rt and life.entities.runtime==rt,"retail map bind");mainAas.AAS_StartFrame(life,1.0);checks=checks+require(mainAas.AAS_Initialized(life) and mainAas.AAS_Time(life)==1.0,"retail lifecycle frame")
  values=array(mainAas.MAX_CONFIGSTRINGS,void);values[mainAas.CS_MODELS+17]="*17";mainAas.AAS_UpdateStringIndexes(life,len(values),values);checks=checks+require(mainAas.AAS_ModelFromIndex(life,17)=="*17" and mainAas.AAS_IndexFromModel(life,"*17")==17,"retail model index table")
  print("PASS: "+str(checks)+" Retail be_aas entity/main checks; areas="+str(map.counts[aas.LUMP_AREAS])+" reaches="+str(map.counts[aas.LUMP_REACHABILITY])+" linked="+str(len(state.areaLinks[1])));return 0
end function
