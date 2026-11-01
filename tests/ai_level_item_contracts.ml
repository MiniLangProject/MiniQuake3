import mq3.botlib.ai_level_items as levelItems
import mq3.botlib.ai_item_weights as itemWeights
import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.aas_runtime as aasRuntime

struct LevelItemTestContext area calls end struct

function require(condition,message) if not condition then return error(7581,message) end if;return 1 end function
function place(context,origin,mins,maxs,floating)
  return [7,[origin[0],origin[1],origin[2]-8.0]]
end function
// Avoid a whole-program short-name collision with aas_entities.info in the
// frozen object emitter; this helper constructs fixture data only.
function makeEntityInfo(number,model,origin,lastOrigin)
  return aasEntities.EntityInfo(true,levelItems.ET_ITEM,0,5.0,0.1,number,origin,[0.0,0.0,0.0],origin,lastOrigin,[0.0,0.0,0.0],[0.0,0.0,0.0],1022,0,model,0,0,0,0,0,0,0,0)
end function
function main(args)
  checks=0
  items=[itemWeights.ItemInfo("item_health","25 Health","models/powerups/health/medium_cross.md3",5,0,1,35.0,[-15.0,-15.0,-15.0],[15.0,15.0,15.0],0),itemWeights.ItemInfo("item_botroam","Bot Roam","",0,0,0,0.0,[-8.0,-8.0,-8.0],[8.0,8.0,8.0],1)]
  itemRuntime=itemWeights.create(void,void);itemRuntime.items=items
  aas=aasRuntime.Runtime(void,true,[],5.0,0);entities=aasEntities.create(8)
  bsp=[[ ["classname","worldspawn"] ],[["classname","item_health"],["origin","10 20 30"],["notfree","1"],["notbot","1"]],[["classname","item_botroam"],["origin","40 50 60"],["weight","2.5"]],[["classname","unknown"],["origin","0 0 0"]],[["classname","item_health"]]]
  context=LevelItemTestContext(7,0);state=levelItems.create(itemRuntime);levelItems.bind(state,entities,aas,bsp,0,context,place)
  checks=checks+require(levelItems.initialize(state)==2 and state.numLevelItems==2 and len(state.levelItems)==2,"initial BSP items")
  checks=checks+require(state.levelItems[0].itemInfo==1 and state.levelItems[0].number==2 and state.levelItems[0].weight==2.5 and (state.levelItems[0].flags&levelItems.IFL_ROAM)!=0,"bot roam fields and head insertion")
  checks=checks+require(state.levelItems[1].goalAreaNum==7 and state.levelItems[1].goalOrigin[2]==22.0 and (state.levelItems[1].flags&(levelItems.IFL_NOTFREE|levelItems.IFL_NOTBOT))==(levelItems.IFL_NOTFREE|levelItems.IFL_NOTBOT),"static item placement and flags")
  state.maxLevelItems=2;entities.entities[1]=makeEntityInfo(1,5,[11.0,20.0,30.0],[11.0,20.0,30.0]);levelItems.update(state)
  checks=checks+require(state.levelItems[1].entityNum==0,"notfree blocks free-for-all linking")
  state.maxLevelItems=levelItems.MAX_LEVEL_ITEMS;levelItems.setGameType(state,levelItems.GT_TEAM);levelItems.update(state)
  checks=checks+require(state.levelItems[1].entityNum==1 and state.levelItems[1].origin[0]==11.0,"near stationary entity links and relocates")
  entities.entities[1]=makeEntityInfo(1,6,[11.0,20.0,30.0],[11.0,20.0,30.0]);levelItems.update(state)
  checks=checks+require(len(state.levelItems)==1,"reused entity with another model removes link")
  entities.entities[2]=makeEntityInfo(2,5,[100.0,120.0,140.0],[99.0,120.0,140.0]);levelItems.update(state)
  checks=checks+require(len(state.levelItems)==1,"moving item ignored")
  entities.entities[2]=makeEntityInfo(2,5,[100.0,120.0,140.0],[100.0,120.0,140.0]);levelItems.update(state)
  checks=checks+require(len(state.levelItems)==2 and state.levelItems[0].number==4 and state.levelItems[0].entityNum==2 and state.levelItems[0].timeout==35.0,"dropped item allocation and timeout")
  aas.time=35.0;levelItems.update(state);checks=checks+require(len(state.levelItems)==2,"timeout equality survives")
  aas.time=35.1;entities.entities[2].valid=false;levelItems.update(state);checks=checks+require(len(state.levelItems)==1,"expired dropped item removed")
  state.maxLevelItems=1;entities.entities[3]=makeEntityInfo(3,5,[200.0,0.0,0.0],[200.0,0.0,0.0]);levelItems.update(state);checks=checks+require(len(state.levelItems)==1,"fixed item heap capacity")
  levelItems.shutdown(state);checks=checks+require(not state.initialized and len(state.levelItems)==0 and state.aas==void,"shutdown clears runtime")
  print("PASS: "+str(checks)+" AI level-item contracts")
  return 0
end function
