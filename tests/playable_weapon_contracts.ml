import mq3.client.playable_weapon as weapon
import mq3.client.playable_viewer as viewer

struct MockPlane fraction normal end struct
struct MockResult trace endpos end struct

function rayTrace(state,startPoint,endPoint)
  fraction=state.context
  endpos=[]
  for axis=0 to 2 endpos=endpos+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return MockResult(MockPlane(fraction,[-1.0,0.0,0.0]),endpos)
end function

function failTrace(state,startPoint,endPoint) return error(7510,"mock trace failed") end function
function require(ok,message) if not ok then return error(7511,message) end if;return 1 end function
function close(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function

function main(args)
  count=0
  count=count+require(weapon.SHOT_MASK==0x6000001,"Quake shot contents mask")
  count=count+require(weapon.DEFAULT_AMMO==10 and weapon.DEFAULT_COOLDOWN_MILLISECONDS==900,"rail preview defaults")
  count=count+require(close(weapon.DEFAULT_RANGE,8192.0,0.0),"rail preview range")
  count=count+require(try(weapon.createWithTrace(void,0,1,10,1.0,false)) is error,"missing trace rejected")
  count=count+require(try(weapon.createWithTrace(rayTrace,0,-1,10,1.0,false)) is error,"negative ammo rejected")
  count=count+require(try(weapon.createWithTrace(rayTrace,0,1,-1,1.0,false)) is error,"negative cooldown rejected")
  count=count+require(try(weapon.createWithTrace(rayTrace,0,1,1,0.0,false)) is error,"zero range rejected")
  state=weapon.createWithTrace(rayTrace,0.25,3,100,1000.0,false)
  count=count+require(state.ammo==3 and state.capacity==3 and state.cooldownRemaining==0,"initial state")
  shot=weapon.stepRay(state,[1.0,2.0,3.0],[4.0,0.0,0.0],true,0)
  count=count+require(shot!=void and shot.hit,"first trigger edge fires and hits")
  count=count+require(close(shot.start[0],1.0,0.0) and close(shot.endPoint[0],251.0,0.01),"normalized ray and hit endpoint")
  count=count+require(close(shot.distance,250.0,0.01) and close(shot.fraction,0.25,0.0),"hit distance and fraction")
  count=count+require(shot.normal[0]==-1.0 and shot.normal[1]==0.0,"hit normal")
  count=count+require(state.ammo==2 and state.shotsFired==1 and state.cooldownRemaining==100,"shot consumes ammo and starts cooldown")
  held=weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],true,100)
  count=count+require(held==void and state.ammo==2,"held semi-auto trigger does not repeat")
  weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],false,0)
  second=weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],true,0)
  count=count+require(second!=void and state.ammo==1,"released trigger creates next edge")
  earlyRelease=weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],false,10)
  early=weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],true,10)
  count=count+require(earlyRelease==void and early==void and state.ammo==1,"cooldown blocks an early edge")
  weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],false,80)
  third=weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],true,0)
  count=count+require(third!=void and state.ammo==0,"cooldown expiry permits shot")
  weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],false,100)
  dry=weapon.stepRay(state,[0.0,0.0,0.0],[1.0,0.0,0.0],true,0)
  count=count+require(dry==void and state.shotsFired==3 and state.noAmmoEvent and state.cooldownRemaining==500,"empty attack emits Baseq3 no-ammo event and delay")
  count=count+require(weapon.reload(state,2)==2 and state.ammo==2,"partial reload")
  count=count+require(weapon.reload(state,99)==3 and state.ammo==3,"reload clamps to capacity")
  count=count+require(try(weapon.reload(state,-1)) is error,"negative reload rejected")
  missState=weapon.createWithTrace(rayTrace,1.0,1,0,50.0,false)
  miss=weapon.stepRay(missState,[0.0,0.0,0.0],[0.0,1.0,0.0],true,0)
  count=count+require(not miss.hit and close(miss.endPoint[1],50.0,0.01),"miss reaches maximum range")
  count=count+require(miss.normal==[0.0,0.0,0.0] and close(miss.distance,50.0,0.01),"miss result has zero normal and full distance")
  automatic=weapon.createWithTrace(rayTrace,1.0,3,50,10.0,true)
  a=weapon.stepRay(automatic,[0.0,0.0,0.0],[1.0,0.0,0.0],true,0)
  b=weapon.stepRay(automatic,[0.0,0.0,0.0],[1.0,0.0,0.0],true,49)
  c=weapon.stepRay(automatic,[0.0,0.0,0.0],[1.0,0.0,0.0],true,1)
  count=count+require(a!=void and b==void and c!=void and automatic.ammo==1,"automatic fire repeats at fire rate")
  camera=viewer.camera([10.0,20.0,30.0],90.0,0.0,320.0,0.1)
  aimedState=weapon.createWithTrace(rayTrace,1.0,1,0,100.0,false)
  aimed=weapon.step(aimedState,camera,true,0)
  count=count+require(aimed.start[0]>=9 and aimed.start[0]<=10 and aimed.start[1]==34 and aimed.start[2]==30 and aimed.endPoint[1]>133.9,"Baseq3 muzzle offset and camera forward basis aim hitscan")
  angledCamera=viewer.camera([10.9,20.9,30.9],0.0,0.0,320.0,0.1);angledState=weapon.createWithTrace(rayTrace,1.0,1,0,100.0,false);angled=weapon.step(angledState,angledCamera,true,0)
  count=count+require(angled.start==[24,20,30],"muzzle position snaps to integer coordinates")
  broken=weapon.createWithTrace(failTrace,0,1,0,10.0,false)
  count=count+require(try(weapon.stepRay(broken,[0.0,0.0,0.0],[1.0,0.0,0.0],true,0)) is error,"trace failure propagated")
  count=count+require(broken.ammo==1 and broken.shotsFired==0,"failed trace does not consume ammo")
  count=count+require(try(weapon.shootRay(state,[0.0,0.0,0.0],[0.0,0.0,0.0])) is error,"zero direction rejected")
  count=count+require(try(weapon.step(void,camera,true,0)) is error,"missing weapon rejected")
  count=count+require(try(weapon.step(state,void,true,0)) is error,"missing camera rejected")
  profile=weapon.createWithTrace(rayTrace,1.0,10,900,8192.0,false)
  weapon.configure(profile,"weapon_machinegun")
  count=count+require(profile.classname=="weapon_machinegun" and profile.cooldownMilliseconds==100 and profile.automatic and profile.damage==7,"stock machinegun profile")
  weapon.configure(profile,"weapon_gauntlet");profile.ammo=-1
  count=count+require(profile.classname=="weapon_gauntlet" and profile.cooldownMilliseconds==400 and profile.automatic and profile.damage==50 and close(profile.range,32.0,0.0),"stock gauntlet profile")
  gauntlet=weapon.stepRay(profile,[0.0,0.0,0.0],[1.0,0.0,0.0],true,0)
  count=count+require(gauntlet!=void and profile.ammo==-1 and profile.shotsFired==1 and not profile.noAmmoEvent,"unlimited gauntlet fires without consuming ammo")
  weapon.configure(profile,"weapon_railgun")
  count=count+require(profile.cooldownMilliseconds==1500 and not profile.automatic and profile.damage==100,"stock railgun profile")
  weapon.configure(profile,"weapon_plasmagun")
  count=count+require(profile.cooldownMilliseconds==100 and profile.automatic and profile.damage==20,"stock plasma profile")
  count=count+require(try(weapon.configure(profile,"weapon_unknown")) is error and profile.classname=="weapon_plasmagun","unsupported profile rejected atomically")
  print("PASS: "+str(count)+" playable-weapon contracts");return 0
end function
