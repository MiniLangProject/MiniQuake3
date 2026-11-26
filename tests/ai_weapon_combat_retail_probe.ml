import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_weapon_weights as weapons
import mq3.botlib.ai_weapon_combat as combat
import mq3.botlib.ai_weapon_combat_syscalls as syscalls
import mq3.compat.numeric as n
import mq3.format.pk3 as pk3

struct Context archive end struct
struct Vm data mask end struct
function require(ok,label) if not ok then return error(7600,"retail Sarge weapon combat: "+label) end if;return 1 end function
function readFile(context,path) data=try(pk3.read(context.archive,path));if data is error then return void end if;return data end function
function put(vm,address,value) n.writeU32(vm.data,address,n.i32(value));return void end function
function invoke(runtime,state,vm,base,op,arguments) for index=0 to len(arguments)-1 put(vm,base+(index+1)*4,arguments[index]) end for;return syscalls.dispatch(runtime,state,vm,base,op) end function
function textAt(data,offset,capacity) count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while;return decode(slice(data,offset,count)) end function
function main(args)
  if len(args)!=1 then return error(7600,"usage: ai_weapon_combat_retail_probe <pak0.pk3>") end if
  count=0;archive=pk3.open(args[0]);context=Context(archive);fuzzyRuntime=fuzzy.create(context,readFile);fuzzy.setQvmInventoryLayout(fuzzyRuntime,true);runtime=weapons.create(context,readFile,fuzzyRuntime);state=pools.create();handle=pools.allocWeaponState(state)
  count=count+require(weapons.loadWeaponWeights(runtime,state,handle,"bots/sarge_w.c")==0,"Sarge weapon profile and retail weapons.c load")
  inventory=array(256,0);for each index in [4,5,6,7,8,9,10,11,13,14] inventory[index]=1 end for;for index=18 to 25 inventory[index]=50 end for;inventory[200]=512
  best=combat.chooseBestFightWeapon(runtime,state,handle,inventory);count=count+require(best==3,"Sarge chooses the 250-weight shotgun from a full arsenal, got "+str(best))
  vm=Vm(bytes(8192,0),8191);inventoryAt=512;for index=0 to 255 put(vm,inventoryAt+index*4,inventory[index]) end for;base=7800
  count=count+require(invoke(runtime,state,vm,base,combat.OP_CHOOSE_BEST_FIGHT_WEAPON,[handle,inventoryAt])==3,"retail op558 QVM path chooses shotgun")
  info=combat.weaponInfo(runtime,state,handle,3);count=count+require(info!=void and info.name=="Shotgun" and info.numProjectiles==11 and info.projectile.name=="shotgunbullet","retail weapon lookup resolves projectile")
  output=2048;count=count+require(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[handle,3,output])==0,"retail op559 returns zero")
  data=slice(vm.data,output,combat.WEAPON_INFO_SIZE);count=count+require(len(data)==552 and n.readI32(data,0)==1 and n.readI32(data,4)==3 and textAt(data,8,80)=="Shotgun" and n.readI32(data,260)==11,"retail shotgun weaponinfo_t bytes")
  count=count+require(textAt(data,344,80)=="shotgunbullet" and n.readI32(data,512)==10 and n.readI32(data,524)==1,"retail embedded projectile ABI")
  before=slice(vm.data,output,552);count=count+require(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[handle,0,0])==0 and slice(vm.data,output,552)==before,"out-of-range retail weapon preserves caller buffer")
  count=count+require(weapons.loadWeaponWeights(runtime,state,handle,"bots/crash_w.c")==0,"Crash's retail weapon profile loads")
  starter=array(256,0);starter[4]=1;starter[6]=1;starter[19]=100
  count=count+require(combat.chooseBestFightWeapon(runtime,state,handle,starter)==2,"Crash prefers the loaded machinegun over gauntlet with 100 bullets")
  print("PASS: retail Sarge and Crash weapon combat checks="+str(count)+" best=3 abi="+str(len(data)));return 0
end function
