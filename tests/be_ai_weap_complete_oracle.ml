import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_weapon_weights as weights
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.be_ai_weap as complete
function constantWeight(name,value) return fuzzy.Weight(name,[fuzzy.Separator(0,fuzzy.MAX_INVENTORYVALUE,0,value,value,value,void)]) end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  runtime=weights.create(void,void,void);config=weights.WeaponConfig(array(32,void),[]);for index=0 to 31 config.weapons[index]=weights.emptyWeapon() end for
  config.weapons[1].valid=true;config.weapons[1].number=1;config.weapons[1].name="First";config.weapons[2].valid=true;config.weapons[2].number=2;config.weapons[2].name="Second";runtime.config=config
  print("valid="+str(bit(complete.BotValidWeaponNumber(runtime,1)))+","+str(bit(complete.BotValidWeaponNumber(runtime,32)))+","+str(bit(complete.BotValidWeaponNumber(runtime,33))))
  state=pools.create();handle=complete.BotAllocWeaponState(state);print("state="+str(handle)+","+str(bit(complete.BotWeaponStateFromHandle(state,handle)!=void)))
  profile=fuzzy.WeightConfig("fixture",[constantWeight("x0",0.0),constantWeight("x1",0.0),constantWeight("x2",0.0),constantWeight("Second",20.0),constantWeight("x4",0.0),constantWeight("x5",0.0),constantWeight("x6",0.0),constantWeight("First",10.0)]);weaponState=complete.BotWeaponStateFromHandle(state,handle);weaponState.weaponWeightConfig=profile;weaponState.weaponWeightIndex=complete.WeaponWeightIndex(profile,config);print("load=0");print("map="+str(weaponState.weaponWeightIndex[1])+","+str(weaponState.weaponWeightIndex[2]))
  inventory=array(256,0);print("choose="+str(complete.BotChooseBestFightWeapon(runtime,state,handle,inventory))+",1,0")
  info=complete.BotGetWeaponInfo(runtime,state,handle,2);print("info="+str(info.number)+","+info.name);complete.BotResetWeaponState(state,handle);print("reset="+str(bit(weaponState.weaponWeightConfig!=void)));complete.BotFreeWeaponState(state,handle);print("free="+str(bit(complete.BotWeaponStateFromHandle(state,handle)==void)));runtime.config=void;print("shutdown=0");return 0
end function
