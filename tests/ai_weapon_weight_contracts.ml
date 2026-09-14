import mq3.botlib.ai_weapon_weights as weapons
import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_resource_pools as pools

struct Context paths texts end struct
function require(ok,label) if not ok then return error(7589,"weapon-weight contract: "+label) end if;return 1 end function
function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.0001 end function
function readFile(context,path) for i=0 to len(context.paths)-1 if context.paths[i]==path then return context.texts[i] end if end for;return void end function
function main(args)
  checks=0;defs="#define DAMAGE_A 1\n#define DAMAGE_B 2\n\n";configText="#include \"defs.h\"\n\n\nprojectileinfo { name \"bolt\" model \"bolt.md3\" flags 1 gravity 0.5 damage 100 radius 120 visdamage 3 damagetype $evalint(DAMAGE_A|DAMAGE_B) healthinc 4 push 5 detonation 6 bounce 0.7 bouncefric 0.8 bouncestop 0.9 }\nweaponinfo { number 5 name \"Launcher\" model \"gun.md3\" level 2 weaponindex 8 flags 1 projectile \"bolt\" numprojectiles 1 hspread 2 vspread 3 speed 900 acceleration 4 recoil {1,2,3} offset {4,5,6} angleoffset {7,8,9} extrazvelocity 10 ammoamount 1 ammoindex 21 activate 0.2 reload 0.8 spinup 0.1 spindown 0.3 }\n"
  profile="weight \"Launcher\" { switch(8) { case 1: return 0; default: return 100; } }\n";context=Context(["botfiles/defs.h","botfiles/weapons.c","botfiles/test_w.c"],[defs,configText,profile]);fuzzyRuntime=fuzzy.create(context,readFile);runtime=weapons.create(context,readFile,fuzzyRuntime)
  config=weapons.parseWeaponConfig(runtime,"weapons.c");checks=checks+require(not (config is error) and len(config.weapons)==32 and len(config.projectiles)==1,"fixed weapon table and projectile parse")
  weapon=config.weapons[5];checks=checks+require(weapon.valid and weapon.name=="Launcher" and weapon.speed==900.0 and weapon.recoil==[1.0,2.0,3.0],"weapon scalar and vector fields")
  checks=checks+require(weapon.projectile.name=="bolt" and weapon.projectile.damage==100 and weapon.projectile.damageType==3 and near(weapon.projectile.bounceStop,0.9),"projectile resolution and evalint")
  profileConfig=fuzzy.weightConfig(fuzzyRuntime,"test_w.c");mapping=weapons.weaponWeightIndex(profileConfig,config);checks=checks+require(len(mapping)==32 and mapping[5]==0 and mapping[0]==-1,"weapon name to fuzzy index")
  state=pools.create();handle=pools.allocWeaponState(state);checks=checks+require(weapons.loadWeaponWeights(runtime,state,handle,"test_w.c")==0,"load profile")
  bound=pools.weaponState(state,handle);checks=checks+require(bound.weaponWeightConfig!=void and bound.weaponWeightIndex[5]==0,"weapon state binding")
  configBefore=bound.weaponWeightConfig;indexBefore=bound.weaponWeightIndex;pools.resetWeaponState(state,handle);checks=checks+require(bound.weaponWeightConfig==configBefore and bound.weaponWeightIndex==indexBefore,"released reset preserves bindings")
  checks=checks+require(weapons.loadWeaponWeights(runtime,state,0,"test_w.c")==weapons.BLERR_CANNOTLOADWEAPONWEIGHTS,"invalid handle error")
  weapons.freeWeaponWeights(runtime,state,handle);checks=checks+require(bound.weaponWeightConfig==void and bound.weaponWeightIndex==void,"free releases bindings")
  checks=checks+require((try(weapons.parseWeaponConfig(runtime,"missing.c"))) is error,"missing config rejected")
  weapons.shutdown(runtime);checks=checks+require(runtime.config==void,"shutdown releases config")
  print("PASS: "+str(checks)+" AI weapon-weight contracts");return 0
end function
