import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_weapon_weights as weapons
import mq3.botlib.ai_weapon_combat as combat
import mq3.botlib.ai_weapon_combat_syscalls as syscalls
import mq3.compat.numeric as n

struct Vm data mask end struct
function require(ok,label) if not ok then return error(7599,"weapon combat contract: "+label) end if;return 1 end function
function constantWeight(name,value) return fuzzy.Weight(name,[fuzzy.Separator(0,fuzzy.MAX_INVENTORYVALUE,0,value,value,value,void)]) end function
function textAt(data,offset,capacity) count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while;return decode(slice(data,offset,count)) end function
function allZero(data) for each value in data if value!=0 then return false end if end for;return true end function
function put(vm,address,value) n.writeU32(vm.data,address,n.i32(value));return void end function
function invoke(runtime,state,vm,base,op,arguments) for index=0 to len(arguments)-1 put(vm,base+(index+1)*4,arguments[index]) end for;return syscalls.dispatch(runtime,state,vm,base,op) end function
function fixture()
  config=weapons.WeaponConfig(array(32,void),[]);for index=0 to 31 config.weapons[index]=weapons.emptyWeapon() end for
  first=config.weapons[1];first.valid=true;first.number=1;first.name="First";first.weaponIndex=4
  second=config.weapons[2];second.valid=true;second.number=2;second.name="Second";second.model="models/weapons2/rocketl/rocketl.md3";second.level=3;second.weaponIndex=8;second.flags=1;second.projectileName="rocket";second.numProjectiles=1;second.horizontalSpread=1.25;second.verticalSpread=2.5;second.speed=900.0;second.acceleration=4.0;second.recoil=[1.0,2.0,3.0];second.offset=[4.0,5.0,6.0];second.angleOffset=[7.0,8.0,9.0];second.extraZVelocity=10.0;second.ammoAmount=1;second.ammoIndex=23;second.activate=0.2;second.reload=0.8;second.spinup=0.1;second.spindown=0.3
  second.projectile=weapons.Projectile("rocket","models/ammo/rocket/rocket.md3",1,0.5,100,120.0,3,3,4,5.0,6.0,0.7,0.8,0.9)
  runtime=weapons.create(void,void,void);runtime.config=config;state=pools.create();handle=pools.allocWeaponState(state);weaponState=pools.weaponState(state,handle)
  weaponState.weaponWeightConfig=fuzzy.WeightConfig("fixture",[constantWeight("First",10.0),constantWeight("Second",20.0)]);weaponState.weaponWeightIndex=array(32,-1);weaponState.weaponWeightIndex[1]=0;weaponState.weaponWeightIndex[2]=1
  return [runtime,state,handle]
end function
function main(args)
  count=0;value=fixture();runtime=value[0];state=value[1];handle=value[2];inventory=array(256,0)
  count=count+require(combat.chooseBestFightWeapon(runtime,state,handle,inventory)==2,"highest positive fuzzy weight wins")
  pools.weaponState(state,handle).weaponWeightConfig.weights[1].separators[0].weight=10.0
  count=count+require(combat.chooseBestFightWeapon(runtime,state,handle,inventory)==1,"strict comparison keeps first weapon on ties")
  pools.weaponState(state,handle).weaponWeightConfig.weights[0].separators[0].weight=0.0;pools.weaponState(state,handle).weaponWeightConfig.weights[1].separators[0].weight=-1.0
  count=count+require(combat.chooseBestFightWeapon(runtime,state,handle,inventory)==0,"non-positive weights select no weapon")
  count=count+require(combat.chooseBestFightWeapon(runtime,state,0,inventory)==0,"invalid weapon-state handle returns zero")
  pools.weaponState(state,handle).weaponWeightConfig.weights[0].separators[0].weight=10.0;pools.weaponState(state,handle).weaponWeightConfig.weights[1].separators[0].weight=20.0
  info=combat.weaponInfo(runtime,state,handle,2);encoded=combat.encodeWeaponInfo(info)
  count=count+require(len(encoded)==552 and n.readI32(encoded,0)==1 and n.readI32(encoded,4)==2,"weaponinfo_t size and leading ints")
  count=count+require(textAt(encoded,8,80)=="Second" and textAt(encoded,88,80)=="models/weapons2/rocketl/rocketl.md3" and textAt(encoded,180,80)=="rocket","weapon fixed strings and offsets")
  count=count+require(n.readI32(encoded,168)==3 and n.readI32(encoded,172)==8 and n.readI32(encoded,260)==1 and n.bitsFloat(n.readU32(encoded,272))==900.0,"weapon scalar offsets")
  count=count+require(n.bitsFloat(n.readU32(encoded,280))==1.0 and n.bitsFloat(n.readU32(encoded,300))==6.0 and n.bitsFloat(n.readU32(encoded,312))==9.0,"weapon vec3 offsets")
  count=count+require(textAt(encoded,344,80)=="rocket" and textAt(encoded,424,80)=="models/ammo/rocket/rocket.md3" and n.readI32(encoded,512)==100 and n.bitsFloat(n.readU32(encoded,548))>0.89,"embedded projectileinfo_t ABI")
  vm=Vm(bytes(4096,0),4095);base=3900;inventoryAt=512;for index=0 to 255 put(vm,inventoryAt+index*4,inventory[index]) end for
  count=count+require(invoke(runtime,state,vm,base,combat.OP_CHOOSE_BEST_FIGHT_WEAPON,[handle,inventoryAt])==2,"op558 reads the 256-int inventory")
  count=count+require(try(invoke(runtime,state,vm,base,combat.OP_CHOOSE_BEST_FIGHT_WEAPON,[handle,3584])) is error,"op558 validates complete inventory span")
  output=1536;for index=0 to 551 vm.data[output+index]=165 end for;count=count+require(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[handle,2,output])==0 and slice(vm.data,output,552)==encoded,"op559 writes exact weaponinfo_t bytes")
  before=slice(vm.data,output,552);count=count+require(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[0,2,0])==0 and slice(vm.data,output,552)==before,"op559 invalid state preserves output")
  count=count+require(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[handle,0,0])==0,"op559 invalid weapon preserves output without dereference")
  count=count+require(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[handle,31,output])==0 and allZero(slice(vm.data,output,552)),"op559 copies the zeroed record for an undefined in-range weapon")
  count=count+require(try(invoke(runtime,state,vm,base,combat.OP_GET_WEAPON_INFO,[handle,2,3800])) is error,"op559 validates complete 552-byte output")
  count=count+require(try(invoke(runtime,state,vm,base,557,[])) is error,"dispatcher rejects unrelated weapon traps")
  print("PASS: "+str(count)+" AI weapon-combat contracts");return 0
end function
