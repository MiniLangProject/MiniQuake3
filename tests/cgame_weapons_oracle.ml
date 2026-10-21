import mq3.client.cgame_weapons as weapons
import mq3.compat.numeric as n
function selection(name,state) print(name+"|"+str(state.weaponSelect)+"|"+str(state.weaponSelectTime));return void end function
function spin(name,state,cent) value=weapons.machinegunSpinAngle(state,cent,true);spinning=0;if cent.barrel.spinning then spinning=1 end if;print(name+"|"+str(n.u32(n.floatBits(value)))+"|"+str(n.u32(n.floatBits(cent.barrel.angle)))+"|"+str(cent.barrel.time)+"|"+str(spinning));return void end function
function main(args)
  print("map|"+str(weapons.mapTorsoToWeaponFrame(100,200,300,100))+"|"+str(weapons.mapTorsoToWeaponFrame(100,200,300,108))+"|"+str(weapons.mapTorsoToWeaponFrame(100,200,300,203))+"|"+str(weapons.mapTorsoToWeaponFrame(100,200,300,305))+"|"+str(weapons.mapTorsoToWeaponFrame(100,200,300,500)))
  s=weapons.create();s.time=1234;s.owned=(1<<1)|(1<<2)|(1<<5)|(1<<9);s.ammo[1]=1;s.ammo[2]=1;s.ammo[5]=4;s.ammo[9]=2;s.weaponSelect=2;weapons.nextWeapon(s);selection("next",s);s.weaponSelect=2;weapons.prevWeapon(s);selection("prev",s);s.weaponSelect=5;weapons.outOfAmmoChange(s);selection("out",s);s.follow=true;s.weaponSelect=5;s.weaponSelectTime=77;weapons.nextWeapon(s);selection("follow",s);s.follow=false;s.ammo=array(16,0);s.weaponSelect=5;weapons.nextWeapon(s);selection("none",s)
  e=weapons.entity(1);e.barrel.angle=10.0;e.barrel.time=100;e.barrel.spinning=true;e.eFlags=weapons.EF_FIRING;s.time=200;spin("spin-a",s,e);s.time=300;e.eFlags=0;spin("spin-b",s,e);s.time=1800;spin("spin-c",s,e);return 0
end function
