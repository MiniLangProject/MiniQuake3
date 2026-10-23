import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_weapon_weights as weights
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.be_ai_weap as complete
struct Context paths texts end struct
function require(ok,label) if not ok then return error(7901,"be_ai_weap complete: "+label) end if;return 1 end function
function readFile(context,path) for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return void end function
function main(args)
  count=0;weaponText="projectileinfo { name \"bolt\" model \"bolt.md3\" flags 0 gravity 0 damage 100 radius 120 visdamage 100 damagetype 3 healthinc 0 push 5 detonation 0 bounce 0 bouncefric 0 bouncestop 0 } weaponinfo { number 2 name \"Second\" model \"gun.md3\" level 1 weaponindex 8 flags 0 projectile \"bolt\" numprojectiles 1 hspread 0 vspread 0 speed 900 acceleration 0 recoil {0,0,0} offset {0,0,0} angleoffset {0,0,0} extrazvelocity 0 ammoamount 1 ammoindex 21 activate 0.1 reload 0.8 spinup 0 spindown 0 }"
  profileText="weight \"Second\" { return 25; }";context=Context(["botfiles/weapons.c","botfiles/test_w.c"],[weaponText,profileText]);fuzzyRuntime=fuzzy.create(context,readFile);runtime=weights.create(context,readFile,fuzzyRuntime);state=pools.create()
  count=count+require(complete.BotSetupWeaponAI(runtime)==weights.BLERR_NOERROR,"setup")
  count=count+require(complete.BotValidWeaponNumber(runtime,2) and not complete.BotValidWeaponNumber(runtime,0) and complete.BotValidWeaponNumber(runtime,32) and not complete.BotValidWeaponNumber(runtime,33),"released weapon-number boundary")
  parsed=complete.LoadWeaponConfig(runtime,"weapons.c");count=count+require(not (parsed is error) and parsed.weapons[2].projectile.damage==100,"load config")
  count=count+require(len(bytes(complete.DumpWeaponConfig(parsed)))>20,"dump config")
  handle=complete.BotAllocWeaponState(state);count=count+require(handle==1 and complete.BotWeaponStateFromHandle(state,handle)!=void,"alloc and handle")
  count=count+require(complete.BotLoadWeaponWeights(runtime,state,handle,"test_w.c")==weights.BLERR_NOERROR,"load weights")
  mapping=complete.WeaponWeightIndex(pools.weaponState(state,handle).weaponWeightConfig,runtime.config);count=count+require(mapping[2]>=0,"weight index")
  inventory=array(256,0);count=count+require(complete.BotChooseBestFightWeapon(runtime,state,handle,inventory)==2,"best weapon")
  info=complete.BotGetWeaponInfo(runtime,state,handle,2);count=count+require(info!=void and info.name=="Second" and info.projectile.name=="bolt","weapon info")
  bound=pools.weaponState(state,handle).weaponWeightConfig;complete.BotResetWeaponState(state,handle);count=count+require(pools.weaponState(state,handle).weaponWeightConfig==bound,"reset preserves weights")
  complete.BotFreeWeaponWeights(runtime,state,handle);count=count+require(pools.weaponState(state,handle).weaponWeightConfig==void,"free weights")
  complete.BotFreeWeaponState(state,handle);count=count+require(complete.BotWeaponStateFromHandle(state,handle)==void,"free state")
  second=complete.BotAllocWeaponState(state);complete.BotShutdownWeaponAI(runtime,state);count=count+require(runtime.config==void and complete.BotWeaponStateFromHandle(state,second)==void,"shutdown")
  print("PASS: "+str(count)+" complete be_ai_weap contracts");return 0
end function
