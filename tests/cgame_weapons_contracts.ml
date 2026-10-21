import mq3.client.cgame_weapons as w
function require(value,message) if not value then return error(7791,message) end if;return 1 end function
function main(args)
  checks=0;s=w.create();s.time=1000;e=w.entity(3);e.weapon=w.WP_MACHINEGUN;e.origin=[10.0,20.0,30.0]
  checks=checks+require(len(s.weapons)==w.WP_NUM_WEAPONS+1 and s.weaponSelect==w.WP_MACHINEGUN,"state defaults")
  checks=checks+require(w.weapon(s,w.WP_MACHINEGUN).number==w.WP_MACHINEGUN and w.weapon(s,99)==void,"weapon lookup")
  checks=checks+require(w.mapTorsoToWeaponFrame(10,30,50,12)==8 and w.mapTorsoToWeaponFrame(10,30,50,34)==5 and w.mapTorsoToWeaponFrame(10,30,50,99)==0,"torso mapping")
  pos=w.calculateWeaponPosition([1.0,2.0,3.0],[0.0,0.0,0.0],0,100.0,0.5,50,0,20.0);checks=checks+require(pos[0][2]>3.0 and pos[1][0]!=0.0,"weapon bob and land")
  item=w.Item(0,1,w.WP_ROCKET_LAUNCHER,"models/weapons2/rocketl/rocketl.md3","","icons/iconw_rocket","Rocket Launcher",false);s.items=[item];registered=w.registerItemVisuals(s,0,true);rocket=s.weapons[w.WP_ROCKET_LAUNCHER]
  checks=checks+require(registered.registered and rocket.registered and rocket.weaponModel==item.worldModel,"item registers weapon")
  checks=checks+require(rocket.flashModel=="models/weapons2/rocketl/rocketl_flash.md3" and rocket.trail=="rocket" and rocket.trailTime==2000,"weapon derived assets")
  checks=checks+require(w.profile(w.WP_LIGHTNING).firingSound=="sound/weapons/lightning/lg_hum.wav" and w.profile(w.WP_CHAINGUN).loopFire,"weapon profiles")
  checks=checks+require(try(w.registerWeapon(s,99,void,true)) is error and try(w.registerItemVisuals(s,2,true)) is error,"registration bounds")

  w.setRandomInts(s,[16384,16384,16384,16384,16384]);brass=w.machineGunEjectBrass(s,e,false,true);checks=checks+require(brass.kind=="machinegun-brass" and brass.value>=s.time+s.brassTime and not brass.dispatched,"machinegun brass")
  w.setRandomInts(s,array(16,16384));shells=w.shotgunEjectBrass(s,e,true,true);checks=checks+require(len(shells)==2 and shells[0].kind=="shotgun-brass" and shells[0].velocity[0]!=0.0,"shotgun brass")
  nail=w.nailgunEjectBrass(s,e,true);checks=checks+require(nail.kind=="nailgun-smoke" and nail.radius==32.0,"nail smoke")
  s.brassTime=0;checks=checks+require(w.machineGunEjectBrass(s,e,false,true)==void and len(w.shotgunEjectBrass(s,e,false,true))==0,"brass cvar");s.brassTime=2500

  s.oldRail=true;rail=w.railTrail(s,[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,10.0],[0.0,0.0,110.0],true);checks=checks+require(len(rail)==1 and rail[0].origin[2]== -2.0 and rail[0].finish[2]==102.0,"old rail trail")
  s.oldRail=false;rail=w.railTrail(s,[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,10.0],[0.0,0.0,110.0],true);checks=checks+require(len(rail)>1 and rail[1].kind=="rail-ring","rail rings")
  e.trailTime=0;s.noProjectileTrail=false;trail=w.rocketTrail(s,e,[0.0,0.0,0.0],[0.0,0.0,100.0],false,true);checks=checks+require(len(trail)>0 and trail[0].kind=="rocket-smoke" and e.trailTime==s.time,"rocket trail")
  trail=w.nailTrail(s,e,[0.0,0.0,0.0],[0.0,0.0,100.0],true,true);checks=checks+require(len(trail)==1 and trail[0].kind=="nail-smoke-bubbles","nail bubble trail")
  trail=w.grenadeTrail(s,e,[0.0,0.0,0.0],[0.0,0.0,100.0],false,true);checks=checks+require(trail[0].kind=="grenade-smoke","grenade delegates")
  w.setRandomInts(s,[16384,16384,16384]);plasma=w.plasmaTrail(s,e,[0.0,0.0,0.0],true,[0.6,0.6,1.0],true);checks=checks+require(plasma.kind=="plasma-trail" and plasma.radius==0.25,"plasma trail")
  hook=w.grappleTrail(s,e,[0.0,0.0,0.0],[0.0,0.0,0.0],[100.0,0.0,0.0],true);checks=checks+require(hook.kind=="grapple-beam","grapple beam")
  checks=checks+require(w.grappleTrail(s,e,[0.0,0.0,0.0],[0.0,0.0,0.0],[10.0,0.0,0.0],true)==void,"short grapple hidden")
  s.noProjectileTrail=true;checks=checks+require(len(w.rocketTrail(s,e,[0.0,0.0,0.0],[1.0,0.0,0.0],false,true))==0,"trail cvar");s.noProjectileTrail=false

  e.weapon=w.WP_RAILGUN;e.railgunFlash=true;e.railgunImpact=[100.0,0.0,0.0];checks=checks+require(len(w.spawnRailTrail(s,e,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],true))>0,"spawn rail")
  e.weapon=w.WP_LIGHTNING;e.origin=[0.0,0.0,0.0];bolt=w.lightningBolt(s,e,[0.0,0.0,26.0],[0.0,0.0,0.0],e.number,[200.0,0.0,26.0],0.5,true);checks=checks+require(len(bolt)==2 and bolt[0].kind=="lightning-bolt" and bolt[1].kind=="lightning-impact","lightning impact")
  e.weapon=w.WP_MACHINEGUN;checks=checks+require(len(w.lightningBolt(s,e,[0.0,0.0,0.0],[0.0,0.0,0.0],0,void,1.0,true))==0,"lightning weapon filter")
  e.barrel=w.barrel();e.eFlags=w.EF_FIRING;s.time=100;angle=w.machinegunSpinAngle(s,e,true);checks=checks+require(angle==90.0 and e.barrel.spinning,"barrel starts")
  powered=w.addWeaponWithPowerups(s,e.weapon,e.number,e.origin,(1<<w.PW_BATTLESUIT)|(1<<w.PW_QUAD),"gun.md3",true);checks=checks+require(len(powered)==3 and powered[2].kind=="weapon-quad","powerup passes")
  invisible=w.addWeaponWithPowerups(s,e.weapon,e.number,e.origin,1<<w.PW_INVIS,"gun.md3",true);checks=checks+require(len(invisible)==1 and invisible[0].kind=="weapon-invisibility","invisibility replaces")
  s.weapons[w.WP_MACHINEGUN]=w.profile(w.WP_MACHINEGUN);s.weapons[w.WP_MACHINEGUN].weaponModel="gun.md3";s.weapons[w.WP_MACHINEGUN].flashModel="flash.md3";e.muzzleFlashTime=s.time;player=w.addPlayerWeapon(s,e,false,e.origin,true);checks=checks+require(len(player)>=2 and player[0].kind=="weapon","player weapon")
  view=w.addViewWeapon(s,e,0,false,[0.0,0.0,30.0],[0.0,0.0,0.0],0,100.0,0.5,0,0.0,true);checks=checks+require(len(view)>0,"view weapon")
  s.renderingThirdPerson=true;checks=checks+require(len(w.addViewWeapon(s,e,0,false,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0.0,0.0,0,0.0,true))==0,"third person hides view");s.renderingThirdPerson=false

  s.owned=(1<<w.WP_MACHINEGUN)|(1<<w.WP_ROCKET_LAUNCHER)|(1<<w.WP_RAILGUN);s.ammo[w.WP_MACHINEGUN]=10;s.ammo[w.WP_ROCKET_LAUNCHER]=2;s.ammo[w.WP_RAILGUN]=1;s.weaponSelect=w.WP_MACHINEGUN;s.time=2000
  checks=checks+require(w.weaponSelectable(s,w.WP_ROCKET_LAUNCHER) and not w.weaponSelectable(s,w.WP_SHOTGUN),"selectable")
  checks=checks+require(w.nextWeapon(s)==w.WP_ROCKET_LAUNCHER and w.prevWeapon(s)==w.WP_MACHINEGUN,"cycle weapons")
  checks=checks+require(w.selectWeapon(s,w.WP_RAILGUN)==w.WP_RAILGUN and w.selectWeapon(s,w.WP_SHOTGUN)==w.WP_RAILGUN,"direct selection ownership")
  checks=checks+require(w.outOfAmmoChange(s)==w.WP_RAILGUN,"out of ammo picks highest")
  names=array(16,"");names[w.WP_RAILGUN]="Railgun";icons=w.drawWeaponSelect(s,names,true);checks=checks+require(len(icons)==4 and icons[2].kind=="weapon-icon-selected" and icons[3].kind=="weapon-name","weapon select HUD")
  s.health=0;checks=checks+require(len(w.drawWeaponSelect(s,names,true))==0,"dead HUD hidden");s.health=100

  e.weapon=w.WP_MACHINEGUN;e.powerups=1<<w.PW_QUAD;w.setRandomInts(s,[1,16384,16384,16384,16384]);fire=w.fireWeapon(s,e,true);checks=checks+require(len(fire)>=3 and fire[0].kind=="quad-fire" and e.muzzleFlashTime==s.time,"fire event")
  e.weapon=w.WP_LIGHTNING;e.lightningFiring=true;checks=checks+require(len(w.fireWeapon(s,e,true))==0,"held lightning suppresses repeat");e.lightningFiring=false
  w.setRandomInts(s,[0,16384]);hit=w.missileHitWall(s,w.WP_ROCKET_LAUNCHER,0,[1.0,2.0,3.0],[0.0,0.0,1.0],w.IMPACTSOUND_DEFAULT,[1.0,0.0,0.0],[0.0,1.0,0.0],true);checks=checks+require(len(hit)==3 and hit[1].kind=="impact-explosion" and hit[1].light==300.0,"rocket impact")
  playerHit=w.missileHitPlayer(s,w.WP_ROCKET_LAUNCHER,[0.0,0.0,0.0],[0.0,0.0,1.0],4,true);checks=checks+require(playerHit[0].kind=="bleed" and len(playerHit)>1,"player splash")
  pellet=w.shotgunPellet(s,[0.0,0.0,0.0],[100.0,0.0,0.0],2,w.CONTENTS_WATER,w.CONTENTS_WATER,[80.0,0.0,0.0],[0.0,0.0,1.0],0,true,3,true);checks=checks+require(pellet[0].kind=="pellet-bubbles" and pellet[1].kind=="bleed","pellet water player")
  pattern=w.shotgunPattern(s,[0.0,0.0,0.0],[1.0,0.0,0.0],7,2,true);checks=checks+require(len(pattern)==w.DEFAULT_SHOTGUN_COUNT and pattern[0].kind=="shotgun-pellet","shotgun deterministic pattern")
  shot=w.shotgunFire(s,[0.0,0.0,0.0],[1.0,0.0,0.0],7,2,false,false,true);checks=checks+require(len(shot)==w.DEFAULT_SHOTGUN_COUNT+1 and shot[0].kind=="shotgun-smoke","shotgun fire smoke")
  w.setRandomInts(s,[0]);trace=w.tracer(s,[0.0,0.0,0.0],[200.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],true);checks=checks+require(len(trace)==2 and trace[0].kind=="tracer" and trace[1].boundary=="audio","tracer render and sound")
  checks=checks+require(len(w.tracer(s,[0.0,0.0,0.0],[50.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],true))==0,"short tracer")
  muzzle=w.calcMuzzlePoint(1,1,[0.0,0.0,0.0],26.0,[0.0,0.0,0.0],void);checks=checks+require(muzzle==[14.0,0.0,26.0],"local muzzle")
  remote=w.entity(2);remote.origin=[10.0,0.0,0.0];remote.angles=[0.0,90.0,0.0];muzzle=w.calcMuzzlePoint(2,1,[0.0,0.0,0.0],26.0,[0.0,0.0,0.0],remote);checks=checks+require(muzzle[2]==26.0 and muzzle[1]>13.0,"remote muzzle")
  w.setRandomInts(s,[0,0,0]);bullet=w.bullet(s,[200.0,0.0,0.0],1,[0.0,0.0,1.0],false,0,[0.0,0.0,26.0],0,0,[0.0,1.0,0.0],[0.0,0.0,1.0],true);checks=checks+require(len(bullet)>=3 and bullet[0].kind=="tracer","bullet tracer and impact")
  alias=w.strike(s,w.WP_PLASMAGUN,[0.0,0.0,0.0],[0.0,0.0,1.0],true);checks=checks+require(len(alias)>0,"strike alias")
  checks=checks+require(s.suppressed>0 and s.emitted==0,"retail suppression accounting");w.clearActions(s);checks=checks+require(len(s.actions)==0,"boundary clear")
  print("PASS: "+str(checks)+" native cg_weapons contracts");return 0
end function
