import mq3.botlib.ai_weapon_weights as weapons
import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_resource_pools as pools
import mq3.format.pk3 as pk3
struct Context archive end struct
function require(ok,label) if not ok then return error(7588,"retail weapon weights: "+label) end if;return 1 end function
function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.01 end function
function readFile(context,path) data=try(pk3.read(context.archive,path));if data is error then return void end if;return data end function
function main(args)
  if len(args)!=1 then return error(7588,"usage: ai_weapon_weight_retail_probe <pak0.pk3>") end if
  count=0;archive=pk3.open(args[0]);context=Context(archive);fuzzyRuntime=fuzzy.create(context,readFile);runtime=weapons.create(context,readFile,fuzzyRuntime)
  config=weapons.parseWeaponConfig(runtime,"weapons.c");count=count+require(not (config is error) and len(config.weapons)==32 and len(config.projectiles)==9,"retail fixed weapon table and projectiles")
  valid=0;for each weapon in config.weapons if weapon.valid then valid=valid+1 end if end for;count=count+require(valid==9,"nine retail weapon definitions")
  rocket=config.weapons[5];count=count+require(rocket.valid and rocket.name=="Rocket Launcher" and rocket.speed==900.0 and rocket.numProjectiles==1,"retail rocket weapon fields")
  count=count+require(rocket.projectile.name=="rocket" and rocket.projectile.damage==100 and rocket.projectile.radius==120.0 and rocket.projectile.damageType==3,"retail rocket projectile fixup")
  profile=fuzzy.parseWeightConfig(fuzzyRuntime,"bots/sarge_w.c");count=count+require(not (profile is error) and len(profile.weights)==10,"Sarge includes complete fw_weap profile")
  mapping=weapons.weaponWeightIndex(profile,config);mapped=0;for each index in mapping if index>=0 then mapped=mapped+1 end if end for;count=count+require(len(mapping)==32 and mapped==9 and mapping[5]==fuzzy.findWeight(profile,"Rocket Launcher"),"retail weapon weight index")
  inventory=array(256,0);inventory[8]=1;inventory[21]=5;weight=fuzzy.fuzzyWeight(inventory,profile,mapping[5]);count=count+require(near(weight,100.0),"Sarge rocket fuzzy runtime")
  state=pools.create();handle=pools.allocWeaponState(state);count=count+require(weapons.loadWeaponWeights(runtime,state,handle,"bots/sarge_w.c")==0,"retail profile binds")
  bound=pools.weaponState(state,handle);count=count+require(bound.weaponWeightConfig!=void and len(bound.weaponWeightIndex)==32 and bound.weaponWeightIndex[5]>=0,"bound profile and mapping")
  before=bound.weaponWeightConfig;pools.resetWeaponState(state,handle);count=count+require(bound.weaponWeightConfig==before,"reset preserves retail profile")
  print("PASS: retail Sarge weapon weights checks="+str(count)+" valid="+str(valid)+" projectiles="+str(len(config.projectiles))+" mapped="+str(mapped));return 0
end function
