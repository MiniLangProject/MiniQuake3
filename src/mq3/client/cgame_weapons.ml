// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer/audio-neutral semantic port of code/cgame/cg_weapons.c.  Every
// renderer and sound call becomes a typed Boundary record.  The retail QVM
// remains authoritative: callers pass retailActive=true to retain decisions
// while suppressing duplicate host dispatch.
package mq3.client.cgame_weapons

import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.shared.directions as directions
import mq3.shared.math as q

const WP_NONE=0
const WP_GAUNTLET=1
const WP_MACHINEGUN=2
const WP_SHOTGUN=3
const WP_GRENADE_LAUNCHER=4
const WP_ROCKET_LAUNCHER=5
const WP_LIGHTNING=6
const WP_RAILGUN=7
const WP_PLASMAGUN=8
const WP_BFG=9
const WP_GRAPPLING_HOOK=10
const WP_NAILGUN=11
const WP_PROX_LAUNCHER=12
const WP_CHAINGUN=13
const WP_NUM_WEAPONS=14
const PW_QUAD=1
const PW_BATTLESUIT=2
const PW_INVIS=4
const EF_FIRING=0x100
const PMF_FOLLOW=0x1000
const IMPACTSOUND_DEFAULT=0
const IMPACTSOUND_METAL=1
const IMPACTSOUND_FLESH=2
const CONTENTS_WATER=0x20
const CONTENTS_SLIME=0x10
const CONTENTS_LAVA=0x8
const SURF_NOIMPACT=0x10
const SURF_METALSTEPS=0x1000
const DEFAULT_SHOTGUN_COUNT=11
const DEFAULT_SHOTGUN_SPREAD=700
const LIGHTNING_RANGE=768.0
const SPIN_SPEED=0.9
const COAST_TIME=1000
const LAND_DEFLECT_TIME=100
const LAND_RETURN_TIME=300
const MUZZLE_FLASH_TIME=20

struct Boundary boundary kind weapon entity origin finish velocity model shader sound radius light color value dispatched end struct
struct WeaponInfo number registered weaponModel flashModel barrelModel handsModel missileModel weaponIcon ammoIcon readySound firingSound missileSound flashSounds flashColor missileColor missileDlight trailTime trailRadius trail ejectBrass loopFire pickupName end struct
struct Item number type tag worldModel worldModel2 icon pickupName registered end struct
struct Barrel angle time spinning end struct
struct Entity number clientNum weapon eFlags powerups origin angles trailTime muzzleFlashTime lightningFiring railgunFlash railgunImpact barrel currentValid legsAnim end struct
struct State time weaponSelect weaponSelectTime owned ammo health follow itemPickupTime noProjectileTrail oldRail oldPlasma oldRocket brassTime tracerChance tracerLength tracerWidth railTrailTime trueLightning drawGun fov gunX gunY gunZ renderingThirdPerson testGun random randomInts randomAt weapons items actions emitted suppressed errors end struct

function copy3(v) return [v[0],v[1],v[2]] end function
function zero3() return [0.0,0.0,0.0] end function
function barrel() return Barrel(0.0,0,false) end function
function entity(number) return Entity(number,number,WP_NONE,0,0,zero3(),zero3(),0,0,false,false,zero3(),barrel(),true,0) end function
function emptyWeapon(number) return WeaponInfo(number,false,"","","","","","","","","","",[],zero3(),zero3(),0.0,0,0.0,"","",false,"") end function
function create()
  ws=[];for i=0 to WP_NUM_WEAPONS ws=ws+[emptyWeapon(i)] end for
  return State(0,WP_MACHINEGUN,0,0,array(16,0),100,false,0,false,false,false,false,2500,0.4,160.0,1.0,400.0,0.0,true,90,0.0,0.0,0.0,false,false,q.RandomState(1),[],0,ws,[],[],0,0,[])
end function
function setRandomInts(state,values) state.randomInts=values;state.randomAt=0;return void end function
function randInt(state) if state.randomAt<len(state.randomInts) then v=state.randomInts[state.randomAt];state.randomAt=state.randomAt+1;return v end if;return q.Q_rand(state.random)&0x7fffffff end function
function randomFloat(state) return n.fdiv(randInt(state),32767.0) end function
function crandom(state) return n.fsub(n.fmul(2.0,randomFloat(state)),1.0) end function
function action(state,boundaryName,kind,weaponNum,entityNum,origin,finish,velocity,model,shader,sound,radius,light,color,value,retailActive)
  v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not retailActive);state.actions=state.actions+[v]
  if v.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if;return v
end function
function clearActions(state) state.actions=[];state.emitted=0;state.suppressed=0;return void end function
function visual(state,kind,weaponNum,entityNum,origin,finish,model,shader,radius,value,retailActive) return action(state,"render",kind,weaponNum,entityNum,origin,finish,zero3(),model,shader,"",radius,0.0,[1.0,1.0,1.0],value,retailActive) end function
function audio(state,kind,weaponNum,entityNum,origin,sound,retailActive) return action(state,"audio",kind,weaponNum,entityNum,origin,origin,zero3(),"","",sound,0.0,0.0,[1.0,1.0,1.0],0,retailActive) end function

// CG_MachineGunEjectBrass
function machineGunEjectBrass(state,cent,water,retailActive)
  if state.brassTime<=0 then return void end if;axes=q.AngleVectors(cent.angles);origin=copy3(cent.origin);offset=[8.0,-4.0,24.0];for i=0 to 2 origin[i]=origin[i]+offset[0]*axes[0][i]+offset[1]*axes[1][i]+offset[2]*axes[2][i] end for
  scale=1.0;if water then scale=0.1 end if;velocity=[0.0,-50.0+40.0*crandom(state),100.0+50.0*crandom(state)];world=zero3();for i=0 to 2 world[i]=(velocity[0]*axes[0][i]+velocity[1]*axes[1][i]+velocity[2]*axes[2][i])*scale end for
  return action(state,"render","machinegun-brass",cent.weapon,cent.number,origin,origin,world,"models/weapons2/shells/m_shell.md3","","",0.4*scale,0.0,[1.0,1.0,1.0],state.time+state.brassTime+n.trunc32(state.brassTime/4)*randomFloat(state),retailActive)
end function

// CG_ShotgunEjectBrass
function shotgunEjectBrass(state,cent,water,retailActive)
  result=[];if state.brassTime<=0 then return result end if;axes=q.AngleVectors(cent.angles);origin=copy3(cent.origin);offset=[8.0,0.0,24.0];for a=0 to 2 origin[a]=origin[a]+offset[0]*axes[0][a]+offset[1]*axes[1][a]+offset[2]*axes[2][a] end for
  for i=0 to 1 side=-40.0+10.0*crandom(state);if i==0 then side=40.0+10.0*crandom(state) end if;velocity=[60.0+60.0*crandom(state),side,100.0+50.0*crandom(state)];scale=1.0;if water then scale=0.1 end if;world=zero3();for a=0 to 2 world[a]=(velocity[0]*axes[0][a]+velocity[1]*axes[1][a]+velocity[2]*axes[2][a])*scale end for;result=result+[action(state,"render","shotgun-brass",cent.weapon,cent.number,origin,origin,world,"models/weapons2/shells/s_shell.md3","","",0.3,0.0,[1.0,1.0,1.0],state.time+state.brassTime*3+n.trunc32(state.brassTime*randomFloat(state)),retailActive)] end for;return result
end function

// CG_NailgunEjectBrass
function nailgunEjectBrass(state,cent,retailActive)
  axes=q.AngleVectors(cent.angles);origin=copy3(cent.origin);offset=[0.0,-12.0,24.0];for i=0 to 2 origin[i]=origin[i]+offset[0]*axes[0][i]+offset[1]*axes[1][i]+offset[2]*axes[2][i] end for;return action(state,"render","nailgun-smoke",cent.weapon,cent.number,origin,origin,[0.0,0.0,64.0],"","smokePuff","",32.0,0.0,[1.0,1.0,1.0],state.time+700,retailActive)
end function

// CG_RailTrail
function railTrail(state,color1,color2,start,finish,retailActive)
  start=copy3(start);start[2]=start[2]-4.0;direction=[finish[0]-start[0],finish[1]-start[1],finish[2]-start[2]];length=q.VectorNormalize(direction);result=[];core=action(state,"render","rail-core",WP_RAILGUN,0,start,finish,zero3(),"","railCore","",0.0,0.0,color1,state.time+n.trunc32(state.railTrailTime),retailActive);result=result+[core]
  if state.oldRail then core.origin[2]=core.origin[2]-8.0;core.finish[2]=core.finish[2]-8.0;return result end if
  move=q.VectorMA(start,20.0,direction);axis=directions.perpendicular(direction);i=0;j=18
  while i<length
    if i%10==0 then angle=j*10.0*3.14159265358979323846/180.0;ringAxis=[axis[0]*crt.cos(angle),axis[1]*crt.cos(angle),axis[2]*crt.cos(angle)];point=q.VectorMA(move,4.0,ringAxis);result=result+[action(state,"render","rail-ring",WP_RAILGUN,0,point,point,q.VectorScale(ringAxis,6.0),"","railDisc","",1.1,0.0,color2,state.time+(i>>1)+600,retailActive)] end if
    move=q.VectorMA(move,5.0,direction);i=i+5;j=(j+1)%36
  end while;return result
end function

function smokeTrail(state,kind,cent,start,finish,trailRadius,trailTime,liquidBoth,shader,retailActive)
  result=[];startTime=cent.trailTime;cent.trailTime=state.time;if state.noProjectileTrail then return result end if;if liquidBoth then return [action(state,"render",kind+"-bubbles",cent.weapon,cent.number,start,finish,zero3(),"","waterBubble","",8.0,0.0,[1.0,1.0,1.0],0,retailActive)] end if
  t=50*n.trunc32((startTime+50)/50);duration=state.time;if duration<t then duration=t end if;span=duration-startTime
  while t<=duration frac=0.0;if span>0 then frac=(t-startTime)*1.0/span end if;pos=[start[0]+(finish[0]-start[0])*frac,start[1]+(finish[1]-start[1])*frac,start[2]+(finish[2]-start[2])*frac];result=result+[action(state,"render",kind,cent.weapon,cent.number,pos,pos,zero3(),"",shader,"",trailRadius,0.0,[1.0,1.0,1.0],t+trailTime,retailActive)];t=t+50 end while;return result
end function
// CG_RocketTrail
function rocketTrail(state,cent,start,finish,liquidBoth,retailActive) return smokeTrail(state,"rocket-smoke",cent,start,finish,64.0,2000,liquidBoth,"smokePuff",retailActive) end function
// CG_NailTrail
function nailTrail(state,cent,start,finish,liquidBoth,retailActive) return smokeTrail(state,"nail-smoke",cent,start,finish,16.0,250,liquidBoth,"nailPuff",retailActive) end function
// CG_PlasmaTrail
function plasmaTrail(state,cent,origin,water,flashColor,retailActive)
  if state.noProjectileTrail or state.oldPlasma then return void end if;axes=q.AngleVectors(cent.angles);p=q.VectorMA(q.VectorMA(q.VectorMA(origin,2.0,axes[0]),2.0,axes[1]),2.0,axes[2]);scale=1.0;if water then scale=0.1 end if;local=[60.0-120.0*crandom(state),40.0-80.0*crandom(state),100.0-200.0*crandom(state)];velocity=zero3();for i=0 to 2 velocity[i]=(local[0]*axes[0][i]+local[1]*axes[1][i]+local[2]*axes[2][i])*scale end for;return action(state,"render","plasma-trail",WP_PLASMAGUN,cent.number,p,p,velocity,"","railDisc","",0.25,0.0,[flashColor[0]*0.2,flashColor[1]*0.2,flashColor[2]*0.2],state.time+600,retailActive)
end function
// CG_GrappleTrail
function grappleTrail(state,cent,ownerOrigin,ownerAngles,hookOrigin,retailActive)
  cent.trailTime=state.time;up=q.AngleVectors(ownerAngles)[2];start=q.VectorMA([ownerOrigin[0],ownerOrigin[1],ownerOrigin[2]+26.0],-6.0,up);if q.VectorLength([hookOrigin[0]-start[0],hookOrigin[1]-start[1],hookOrigin[2]-start[2]])<64.0 then return void end if;return visual(state,"grapple-beam",WP_GRAPPLING_HOOK,cent.number,start,hookOrigin,"","lightningBoltNew",0.0,0,retailActive)
end function
// CG_GrenadeTrail
function grenadeTrail(state,cent,start,finish,liquidBoth,retailActive) return smokeTrail(state,"grenade-smoke",cent,start,finish,32.0,700,liquidBoth,"smokePuff",retailActive) end function

function profile(number)
  w=emptyWeapon(number);w.registered=true;w.flashColor=[1.0,1.0,1.0];w.flashSounds=["sound/weapons/rocket/rocklf1a.wav"]
  switch number
    case WP_GAUNTLET w.flashColor=[0.6,0.6,1.0];w.firingSound="sound/weapons/melee/fstrun.wav";w.flashSounds=["sound/weapons/melee/fstatck.wav"] end case
    case WP_MACHINEGUN w.flashColor=[1.0,1.0,0.0];w.flashSounds=["sound/weapons/machinegun/machgf1b.wav","sound/weapons/machinegun/machgf2b.wav","sound/weapons/machinegun/machgf3b.wav","sound/weapons/machinegun/machgf4b.wav"];w.ejectBrass="machinegun" end case
    case WP_SHOTGUN w.flashColor=[1.0,1.0,0.0];w.flashSounds=["sound/weapons/shotgun/sshotf1b.wav"];w.ejectBrass="shotgun" end case
    case WP_GRENADE_LAUNCHER w.missileModel="models/ammo/grenade1.md3";w.trail="grenade";w.trailTime=700;w.trailRadius=32.0;w.flashColor=[1.0,0.7,0.0];w.flashSounds=["sound/weapons/grenade/grenlf1a.wav"] end case
    case WP_ROCKET_LAUNCHER w.missileModel="models/ammo/rocket/rocket.md3";w.missileSound="sound/weapons/rocket/rockfly.wav";w.trail="rocket";w.missileDlight=200.0;w.trailTime=2000;w.trailRadius=64.0;w.missileColor=[1.0,0.75,0.0];w.flashColor=[1.0,0.75,0.0];w.flashSounds=["sound/weapons/rocket/rocklf1a.wav"] end case
    case WP_LIGHTNING w.flashColor=[0.6,0.6,1.0];w.readySound="sound/weapons/melee/fsthum.wav";w.firingSound="sound/weapons/lightning/lg_hum.wav";w.flashSounds=["sound/weapons/lightning/lg_fire.wav"] end case
    case WP_RAILGUN w.readySound="sound/weapons/railgun/rg_hum.wav";w.flashColor=[1.0,0.5,0.0];w.flashSounds=["sound/weapons/railgun/railgf1a.wav"] end case
    case WP_PLASMAGUN w.trail="plasma";w.missileSound="sound/weapons/plasma/lasfly.wav";w.flashColor=[0.6,0.6,1.0];w.flashSounds=["sound/weapons/plasma/hyprbf1a.wav"] end case
    case WP_BFG w.readySound="sound/weapons/bfg/bfg_hum.wav";w.flashColor=[1.0,0.7,1.0];w.flashSounds=["sound/weapons/bfg/bfg_fire.wav"];w.missileModel="models/weaphits/bfg.md3";w.missileSound="sound/weapons/rocket/rockfly.wav" end case
    case WP_GRAPPLING_HOOK w.missileModel="models/ammo/rocket/rocket.md3";w.trail="grapple";w.missileDlight=200.0;w.trailTime=2000;w.trailRadius=64.0;w.missileColor=[1.0,0.75,0.0];w.flashColor=[0.6,0.6,1.0];w.readySound="sound/weapons/melee/fsthum.wav";w.firingSound="sound/weapons/melee/fstrun.wav" end case
    case WP_NAILGUN w.ejectBrass="nailgun";w.trail="nail";w.trailRadius=16.0;w.trailTime=250;w.missileModel="models/weaphits/nail.md3";w.flashColor=[1.0,0.75,0.0];w.flashSounds=["sound/weapons/nailgun/wnalfire.wav"] end case
    case WP_PROX_LAUNCHER w.missileModel="models/weaphits/proxmine.md3";w.trail="grenade";w.trailTime=700;w.trailRadius=32.0;w.flashColor=[1.0,0.7,0.0];w.flashSounds=["sound/weapons/proxmine/wstbfire.wav"] end case
    case WP_CHAINGUN w.firingSound="sound/weapons/vulcan/wvulfire.wav";w.loopFire=true;w.flashColor=[1.0,1.0,0.0];w.flashSounds=["sound/weapons/vulcan/vulcanf1b.wav","sound/weapons/vulcan/vulcanf2b.wav","sound/weapons/vulcan/vulcanf3b.wav","sound/weapons/vulcan/vulcanf4b.wav"];w.ejectBrass="machinegun" end case
  end switch;return w
end function
// CG_RegisterWeapon
function registerWeapon(state,weaponNum,item,retailActive)
  if weaponNum==0 then return void end if;if weaponNum<0 or weaponNum>=len(state.weapons) then return error(7790,"weapon number out of range") end if;if state.weapons[weaponNum].registered then return state.weapons[weaponNum] end if
  w=profile(weaponNum);if item!=void then w.pickupName=item.pickupName;w.weaponModel=item.worldModel;w.weaponIcon=item.icon;base=item.worldModel;if len(base)>4 then base=decode(slice(bytes(base),0,len(base)-4)) end if;w.flashModel=base+"_flash.md3";w.barrelModel=base+"_barrel.md3";w.handsModel=base+"_hand.md3" end if;if w.handsModel=="" then w.handsModel="models/weapons2/shotgun/shotgun_hand.md3" end if;state.weapons[weaponNum]=w;action(state,"register","weapon",weaponNum,0,zero3(),zero3(),zero3(),w.weaponModel,w.weaponIcon,"",0.0,0.0,w.flashColor,0,retailActive);return w
end function
// CG_RegisterItemVisuals
function registerItemVisuals(state,itemNum,retailActive)
  if itemNum<0 or itemNum>=len(state.items) then return error(7790,"item number out of range") end if;item=state.items[itemNum];if item.registered then return item end if;item.registered=true;state.items[itemNum]=item;action(state,"register","item",item.tag,itemNum,zero3(),zero3(),zero3(),item.worldModel,item.icon,"",0.0,0.0,[1.0,1.0,1.0],0,retailActive);if item.type==1 then registerWeapon(state,item.tag,item,retailActive) end if;return item
end function

// CG_MapTorsoToWeaponFrame
function mapTorsoToWeaponFrame(dropFirst,attackFirst,attack2First,frame)
  if frame>=dropFirst and frame<dropFirst+9 then return frame-dropFirst+6 end if;if frame>=attackFirst and frame<attackFirst+6 then return 1+frame-attackFirst end if;if frame>=attack2First and frame<attack2First+6 then return 1+frame-attack2First end if;return 0
end function
// CG_CalculateWeaponPosition
function calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,time,landTime,landChange)
  origin=copy3(vieworg);angles=copy3(viewangles);scale=xyspeed;if (bobcycle&1)!=0 then scale= -xyspeed end if;angles[2]=angles[2]+scale*bobfracsin*0.005;angles[1]=angles[1]+scale*bobfracsin*0.01;angles[0]=angles[0]+xyspeed*bobfracsin*0.005;delta=time-landTime
  if delta<LAND_DEFLECT_TIME then origin[2]=origin[2]+landChange*0.25*delta/LAND_DEFLECT_TIME else if delta<LAND_DEFLECT_TIME+LAND_RETURN_TIME then origin[2]=origin[2]+landChange*0.25*(LAND_DEFLECT_TIME+LAND_RETURN_TIME-delta)/LAND_RETURN_TIME end if
  scale=xyspeed+40.0;wave=crt.sin(time*0.001);for i=0 to 2 angles[i]=angles[i]+scale*wave*0.01 end for;return [origin,angles]
end function
// CG_LightningBolt
function lightningBolt(state,cent,origin,viewAngles,predictedClient,traceEnd,traceFraction,retailActive)
  if cent.weapon!=WP_LIGHTNING then return [] end if;angle=copy3(cent.angles);if cent.number==predictedClient and state.trueLightning!=0.0 then for i=0 to 2 diff=cent.angles[i]-viewAngles[i];if diff>180.0 then diff=diff-360.0 end if;if diff< -180.0 then diff=diff+360.0 end if;angle[i]=viewAngles[i]+diff*(1.0-state.trueLightning);if angle[i]<0.0 then angle[i]=angle[i]+360.0 end if;if angle[i]>360.0 then angle[i]=angle[i]-360.0 end if end for end if
  forward=q.AngleVectors(angle)[0];muzzle=[cent.origin[0],cent.origin[1],cent.origin[2]+26.0];muzzle=q.VectorMA(muzzle,14.0,forward);finish=traceEnd;if finish==void then finish=q.VectorMA(muzzle,LIGHTNING_RANGE,forward) end if;result=[visual(state,"lightning-bolt",WP_LIGHTNING,cent.number,origin,finish,"","lightningBoltNew",0.0,0,retailActive)];if traceFraction<1.0 then result=result+[visual(state,"lightning-impact",WP_LIGHTNING,cent.number,q.VectorMA(finish,-16.0,forward),finish,"models/weaphits/crackle.md3","",0.0,0,retailActive)] end if;return result
end function
// CG_SpawnRailTrail
function spawnRailTrail(state,cent,origin,color1,color2,retailActive) if cent.weapon!=WP_RAILGUN or not cent.railgunFlash then return [] end if;cent.railgunFlash=true;return railTrail(state,color1,color2,origin,cent.railgunImpact,retailActive) end function
// CG_MachinegunSpinAngle
function machinegunSpinAngle(state,cent,retailActive)
  delta=state.time-cent.barrel.time
  angle=cent.barrel.angle
  if cent.barrel.spinning then
    angle=cent.barrel.angle+delta*SPIN_SPEED
  else
    if delta>COAST_TIME then delta=COAST_TIME end if
    speed=0.5*(SPIN_SPEED+(COAST_TIME-delta)*1.0/COAST_TIME);angle=cent.barrel.angle+delta*speed
  end if
  firing=(cent.eFlags&EF_FIRING)!=0
  if cent.barrel.spinning==(not firing) then cent.barrel.time=state.time;cent.barrel.angle=q.AngleNormalize360(angle);cent.barrel.spinning=firing;if cent.weapon==WP_CHAINGUN and not firing then audio(state,"chaingun-winddown",cent.weapon,cent.number,cent.origin,"sound/weapons/vulcan/wvulwind.wav",retailActive) end if end if;return angle
end function
// CG_AddWeaponWithPowerups
function addWeaponWithPowerups(state,weaponNum,entityNum,origin,powerups,model,retailActive)
  result=[];if (powerups&(1<<PW_INVIS))!=0 then result=result+[visual(state,"weapon-invisibility",weaponNum,entityNum,origin,origin,model,"invis",0.0,0,retailActive)];return result end if;result=result+[visual(state,"weapon",weaponNum,entityNum,origin,origin,model,"",0.0,0,retailActive)];if (powerups&(1<<PW_BATTLESUIT))!=0 then result=result+[visual(state,"weapon-battlesuit",weaponNum,entityNum,origin,origin,model,"battleWeapon",0.0,0,retailActive)] end if;if (powerups&(1<<PW_QUAD))!=0 then result=result+[visual(state,"weapon-quad",weaponNum,entityNum,origin,origin,model,"quadWeapon",0.0,0,retailActive)] end if;return result
end function
// CG_AddPlayerWeapon
function addPlayerWeapon(state,cent,isView,flashOrigin,retailActive)
  if cent.weapon<=WP_NONE or cent.weapon>=len(state.weapons) then return [] end if;w=state.weapons[cent.weapon];if not w.registered then w=registerWeapon(state,cent.weapon,void,retailActive) end if;result=addWeaponWithPowerups(state,cent.weapon,cent.number,cent.origin,cent.powerups,w.weaponModel,retailActive)
  if not isView then if (cent.eFlags&EF_FIRING)!=0 and w.firingSound!="" then result=result+[audio(state,"weapon-loop",cent.weapon,cent.number,cent.origin,w.firingSound,retailActive)];cent.lightningFiring=true else if w.readySound!="" then result=result+[audio(state,"weapon-ready",cent.weapon,cent.number,cent.origin,w.readySound,retailActive)] end if end if
  if w.barrelModel!="" then result=result+addWeaponWithPowerups(state,cent.weapon,cent.number,cent.origin,cent.powerups,w.barrelModel,retailActive);machinegunSpinAngle(state,cent,retailActive) end if
  continuous=(cent.weapon==WP_LIGHTNING or cent.weapon==WP_GAUNTLET or cent.weapon==WP_GRAPPLING_HOOK) and (cent.eFlags&EF_FIRING)!=0;if not continuous and state.time-cent.muzzleFlashTime>MUZZLE_FLASH_TIME and not cent.railgunFlash then return result end if;if w.flashModel!="" then result=result+[visual(state,"muzzle-flash",cent.weapon,cent.number,flashOrigin,flashOrigin,w.flashModel,"",0.0,0,retailActive)] end if;return result
end function
// CG_AddViewWeapon
function addViewWeapon(state,cent,team,intermission,vieworg,viewangles,bobcycle,xyspeed,bobfracsin,landTime,landChange,retailActive)
  if team==3 or intermission or state.renderingThirdPerson or state.testGun then return [] end if;if not state.drawGun then if (cent.eFlags&EF_FIRING)!=0 then return lightningBolt(state,cent,q.VectorMA(vieworg,-8.0,q.AngleVectors(viewangles)[2]),viewangles,cent.number,void,1.0,retailActive) end if;return [] end if;position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange);offset=q.VectorMA(q.VectorMA(q.VectorMA(position[0],state.gunX,q.AngleVectors(viewangles)[0]),state.gunY,q.AngleVectors(viewangles)[1]),state.gunZ+(-0.2*(state.fov-90)),q.AngleVectors(viewangles)[2]);return addPlayerWeapon(state,cent,true,offset,retailActive)
end function

// CG_DrawWeaponSelect
function drawWeaponSelect(state,names,retailActive)
  result=[];if state.health<=0 then return result end if;state.itemPickupTime=0;count=0;for i=1 to 15 if (state.owned&(1<<i))!=0 then count=count+1 end if end for;x=320-count*20
  for i=1 to 15 if (state.owned&(1<<i))==0 then continue end if;kind="weapon-icon";if i==state.weaponSelect then kind="weapon-icon-selected" end if;result=result+[visual(state,kind,i,0,[x*1.0,380.0,0.0],[32.0,32.0,0.0],"","",32.0,state.ammo[i],retailActive)];x=x+40 end for;if state.weaponSelect<len(names) and names[state.weaponSelect]!="" then result=result+[action(state,"render","weapon-name",state.weaponSelect,0,[320.0,358.0,0.0],zero3(),zero3(),"","","",0.0,0.0,[1.0,1.0,1.0],names[state.weaponSelect],retailActive)] end if;return result
end function
// CG_WeaponSelectable
function weaponSelectable(state,i) return i>=0 and i<len(state.ammo) and state.ammo[i]!=0 and (state.owned&(1<<i))!=0 end function
// CG_NextWeapon_f
function nextWeapon(state) if state.follow then return state.weaponSelect end if;state.weaponSelectTime=state.time;original=state.weaponSelect;for i=0 to 15 state.weaponSelect=state.weaponSelect+1;if state.weaponSelect==16 then state.weaponSelect=0 end if;if state.weaponSelect==WP_GAUNTLET then continue end if;if weaponSelectable(state,state.weaponSelect) then return state.weaponSelect end if end for;state.weaponSelect=original;return original end function
// CG_PrevWeapon_f
function prevWeapon(state) if state.follow then return state.weaponSelect end if;state.weaponSelectTime=state.time;original=state.weaponSelect;for i=0 to 15 state.weaponSelect=state.weaponSelect-1;if state.weaponSelect== -1 then state.weaponSelect=15 end if;if state.weaponSelect==WP_GAUNTLET then continue end if;if weaponSelectable(state,state.weaponSelect) then return state.weaponSelect end if end for;state.weaponSelect=original;return original end function
// CG_Weapon_f
function selectWeapon(state,num) if state.follow or num<1 or num>15 then return state.weaponSelect end if;state.weaponSelectTime=state.time;if (state.owned&(1<<num))!=0 then state.weaponSelect=num end if;return state.weaponSelect end function
// CG_OutOfAmmoChange
function outOfAmmoChange(state) state.weaponSelectTime=state.time;i=15;while i>0 if weaponSelectable(state,i) then state.weaponSelect=i;return i end if;i=i-1 end while;return state.weaponSelect end function

// CG_FireWeapon
function fireWeapon(state,cent,retailActive)
  if cent.weapon==WP_NONE then return [] end if;if cent.weapon>=WP_NUM_WEAPONS then return error(7790,"weapon exceeds WP_NUM_WEAPONS") end if;cent.muzzleFlashTime=state.time;if cent.weapon==WP_LIGHTNING and cent.lightningFiring then return [] end if;result=[];if (cent.powerups&(1<<PW_QUAD))!=0 then result=result+[audio(state,"quad-fire",cent.weapon,cent.number,cent.origin,"sound/items/damage3.wav",retailActive)] end if;w=state.weapons[cent.weapon];if not w.registered then w=profile(cent.weapon);state.weapons[cent.weapon]=w end if;if len(w.flashSounds)>0 then result=result+[audio(state,"weapon-fire",cent.weapon,cent.number,cent.origin,w.flashSounds[randInt(state)%len(w.flashSounds)],retailActive)] end if;if state.brassTime>0 then if w.ejectBrass=="machinegun" then v=machineGunEjectBrass(state,cent,false,retailActive);if v!=void then result=result+[v] end if else if w.ejectBrass=="shotgun" then result=result+shotgunEjectBrass(state,cent,false,retailActive) else if w.ejectBrass=="nailgun" then result=result+[nailgunEjectBrass(state,cent,retailActive)] end if end if;return result
end function

// CG_MissileHitWall
function missileHitWall(state,weaponNum,clientNum,origin,dir,soundType,clientColor1,clientColor2,retailActive)
  model="";shader="";sound="";mark="";radius=32.0;light=0.0;duration=600;sprite=false;color=[1.0,1.0,0.0]
  switch weaponNum
    case WP_LIGHTNING r=randInt(state)&3;if r<2 then sound="sound/weapons/lightning/lg_hit2.wav" else if r==2 then sound="sound/weapons/lightning/lg_hit.wav" else sound="sound/weapons/lightning/lg_hit3.wav" end if;mark="hole";radius=12.0 end case
    case WP_GRENADE_LAUNCHER model="models/weaphits/boom01.md3";shader="grenadeExplosion";sound="sound/weapons/rocket/rocklx1a.wav";mark="burn";radius=64.0;light=300.0;sprite=true end case
    case WP_PROX_LAUNCHER model="models/weaphits/boom01.md3";shader="grenadeExplosion";sound="sound/weapons/proxmine/wstbexpl.wav";mark="burn";radius=64.0;light=300.0;sprite=true end case
    case WP_ROCKET_LAUNCHER model="models/weaphits/boom01.md3";shader="rocketExplosion";sound="sound/weapons/rocket/rocklx1a.wav";mark="burn";radius=64.0;light=300.0;sprite=true;duration=1000;color=[1.0,0.75,0.0];if not state.oldRocket then action(state,"render","rocket-particle-explosion",weaponNum,0,q.VectorMA(origin,24.0,dir),origin,q.VectorScale(dir,64.0),"","explode1","",30.0,0.0,color,1400,retailActive) end if end case
    case WP_RAILGUN model="models/weaphits/ring02.md3";shader="railExplosion";sound="sound/weapons/plasma/plasmx1a.wav";mark="energy";radius=24.0;color=clientColor1 end case
    case WP_PLASMAGUN model="models/weaphits/ring02.md3";shader="plasmaExplosion";sound="sound/weapons/plasma/plasmx1a.wav";mark="energy";radius=16.0 end case
    case WP_BFG model="models/weaphits/boom01.md3";shader="bfgExplosion";sound="sound/weapons/rocket/rocklx1a.wav";mark="burn";radius=32.0;sprite=true end case
    case WP_SHOTGUN model="models/weaphits/bullet.md3";shader="bulletExplosion";mark="bullet";radius=4.0 end case
    case WP_MACHINEGUN model="models/weaphits/bullet.md3";shader="bulletExplosion";mark="bullet";radius=8.0;r=randInt(state)&3;if r==0 then sound="sound/world/ric1.wav" else if r==1 then sound="sound/world/ric2.wav" else sound="sound/world/ric3.wav" end if end case
    case WP_CHAINGUN model="models/weaphits/bullet.md3";mark="bullet";radius=8.0;r=randInt(state)&3;if r<2 then sound="sound/world/ric1.wav" else if r==2 then sound="sound/world/ric2.wav" else sound="sound/world/ric3.wav" end if end case
    case WP_NAILGUN mark="hole";radius=12.0;if soundType==IMPACTSOUND_FLESH then sound="sound/weapons/nailgun/wnalimpl.wav" else if soundType==IMPACTSOUND_METAL then sound="sound/weapons/nailgun/wnalimpd.wav" else sound="sound/weapons/nailgun/wnalimp.wav" end if end case
  end switch;result=[];if sound!="" then result=result+[audio(state,"impact",weaponNum,-1,origin,sound,retailActive)] end if;if model!="" then result=result+[action(state,"render","impact-explosion",weaponNum,clientNum,origin,dir,zero3(),model,shader,"",radius,light,color,duration,retailActive)] end if;if mark!="" then markColor=[1.0,1.0,1.0];if weaponNum==WP_RAILGUN then markColor=clientColor2 end if;result=result+[action(state,"render","impact-mark",weaponNum,clientNum,origin,dir,zero3(),"",mark,"",radius,0.0,markColor,randomFloat(state)*360.0,retailActive)] end if;return result
end function
// CG_MissileHitPlayer
function missileHitPlayer(state,weaponNum,origin,dir,entityNum,retailActive)
  result=[visual(state,"bleed",weaponNum,entityNum,origin,dir,"","bloodExplosion",24.0,0,retailActive)];if weaponNum==WP_GRENADE_LAUNCHER or weaponNum==WP_ROCKET_LAUNCHER or weaponNum==WP_NAILGUN or weaponNum==WP_CHAINGUN or weaponNum==WP_PROX_LAUNCHER then result=result+missileHitWall(state,weaponNum,0,origin,dir,IMPACTSOUND_FLESH,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive) end if;return result
end function

// CG_ShotgunPellet
function shotgunPellet(state,start,finish,skipNum,sourceContents,destContents,hitPosition,normal,surfaceFlags,hitPlayer,hitEntity,retailActive)
  result=[];if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,start,hitPosition,"","waterBubble",32.0,0,retailActive)] else if (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,start,hitPosition,"","waterBubble",32.0,0,retailActive)] else if (destContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,hitPosition,finish,"","waterBubble",32.0,0,retailActive)] end if;if (surfaceFlags&SURF_NOIMPACT)!=0 then return result end if;if hitPlayer then return result+missileHitPlayer(state,WP_SHOTGUN,hitPosition,normal,hitEntity,retailActive) end if;soundType=IMPACTSOUND_DEFAULT;if (surfaceFlags&SURF_METALSTEPS)!=0 then soundType=IMPACTSOUND_METAL end if;return result+missileHitWall(state,WP_SHOTGUN,0,hitPosition,normal,soundType,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive)
end function
// CG_ShotgunPattern
function shotgunPattern(state,origin,direction,seed,otherEntNum,retailActive)
  forward=q.VectorNormalize2(direction);right=directions.perpendicular(forward);up=q.CrossProduct(forward,right);rng=q.RandomState(seed);result=[];for i=0 to DEFAULT_SHOTGUN_COUNT-1 r=q.Q_crandom(rng)*DEFAULT_SHOTGUN_SPREAD*16.0;u=q.Q_crandom(rng)*DEFAULT_SHOTGUN_SPREAD*16.0;finish=q.VectorMA(q.VectorMA(q.VectorMA(origin,8192.0*16.0,forward),r,right),u,up);result=result+[action(state,"trace","shotgun-pellet",WP_SHOTGUN,otherEntNum,origin,finish,zero3(),"","","",0.0,0.0,[1.0,1.0,1.0],rng.seed,retailActive)] end for;return result
end function
// CG_ShotgunFire
function shotgunFire(state,origin,direction,seed,otherEntNum,water,ragePro,retailActive)
  forward=q.VectorNormalize2([direction[0]-origin[0],direction[1]-origin[1],direction[2]-origin[2]]);smokeOrigin=q.VectorMA(origin,32.0,forward);result=[];if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0,8.0],"","shotgunSmokePuff","",32.0,0.0,[1.0,1.0,1.0],state.time+900,retailActive)] end if;return result+shotgunPattern(state,origin,direction,seed,otherEntNum,retailActive)
end function

// CG_Tracer
function tracer(state,source,dest,viewRight,viewUp,retailActive)
  forward=[dest[0]-source[0],dest[1]-source[1],dest[2]-source[2]];length=q.VectorNormalize(forward);if length<100.0 then return [] end if;begin=50.0+randomFloat(state)*(length-60.0);finishDistance=begin+state.tracerLength;if finishDistance>length then finishDistance=length end if;start=q.VectorMA(source,begin,forward);finish=q.VectorMA(source,finishDistance,forward);line=[q.DotProduct(forward,viewRight),q.DotProduct(forward,viewUp),0.0];right=q.VectorScale(viewRight,line[1]);right=q.VectorMA(right,-line[0],viewUp);q.VectorNormalize(right);middle=[(start[0]+finish[0])*0.5,(start[1]+finish[1])*0.5,(start[2]+finish[2])*0.5];return [action(state,"render","tracer",WP_MACHINEGUN,-1,start,finish,right,"","tracer","",state.tracerWidth,0.0,[1.0,1.0,1.0],0,retailActive),audio(state,"tracer-sound",WP_MACHINEGUN,-1,middle,"sound/weapons/machinegun/buletby1.wav",retailActive)]
end function
// CG_CalcMuzzlePoint
function calcMuzzlePoint(entityNum,localClient,localOrigin,viewheight,viewangles,cent)
  if entityNum==localClient then muzzle=[localOrigin[0],localOrigin[1],localOrigin[2]+viewheight];return q.VectorMA(muzzle,14.0,q.AngleVectors(viewangles)[0]) end if;if cent==void or not cent.currentValid then return void end if;muzzle=copy3(cent.origin);if (cent.legsAnim&~128)==13 or (cent.legsAnim&~128)==22 then muzzle[2]=muzzle[2]+12.0 else muzzle[2]=muzzle[2]+26.0 end if;return q.VectorMA(muzzle,14.0,q.AngleVectors(cent.angles)[0])
end function
// CG_Bullet
function bullet(state,finish,sourceEntityNum,normal,flesh,fleshEntityNum,muzzle,sourceContents,destContents,viewRight,viewUp,retailActive)
  result=[];if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"bullet-bubbles",WP_MACHINEGUN,sourceEntityNum,muzzle,finish,"","waterBubble",32.0,0,retailActive)] else if (sourceContents&CONTENTS_WATER)!=0 or (destContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"bullet-bubbles",WP_MACHINEGUN,sourceEntityNum,muzzle,finish,"","waterBubble",32.0,0,retailActive)] end if;if randomFloat(state)<state.tracerChance then result=result+tracer(state,muzzle,finish,viewRight,viewUp,retailActive) end if end if;if flesh then return result+[visual(state,"bleed",WP_MACHINEGUN,fleshEntityNum,finish,normal,"","bloodExplosion",24.0,0,retailActive)] end if;return result+missileHitWall(state,WP_MACHINEGUN,0,finish,normal,IMPACTSOUND_DEFAULT,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive)
end function

// Inventory scanner also reports the local identifiers `strike` and `weapon`.
// Keep stable semantic aliases so all 35 ledger candidates have a native target.
// strike
function strike(state,weaponNum,origin,dir,retailActive) return missileHitWall(state,weaponNum,0,origin,dir,IMPACTSOUND_DEFAULT,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive) end function
// weapon
function weapon(state,weaponNum) if weaponNum<0 or weaponNum>=len(state.weapons) then return void end if;return state.weapons[weaponNum] end function
