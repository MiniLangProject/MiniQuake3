import mq3.client.cgame_effects as effects
import mq3.compat.numeric as n

function require(value,message) if not value then return error(7721,message) end if;return 1 end function
function main(args)
  count=0;s=effects.create();s.time=1000;s.predictedClient=2

  puff=effects.smokePuff(s,[1.0,2.0,3.0],[4.0,5.0,6.0],12.0,0.1,0.2,0.3,0.4,800.0,900,1100,7,"smokePuff",true)
  count=count+require(puff.kind=="smoke-puff" and puff.leType==effects.LE_MOVE_SCALE_FADE and puff.startTime==900 and puff.endTime==1700,"smoke timing")
  count=count+require(puff.position==[1.0,2.0,3.0] and puff.velocity==[4.0,5.0,6.0] and puff.radius==12.0 and puff.flags==7,"smoke trajectory")
  count=count+require(puff.color==[0.1,0.2,0.3,0.4] and puff.shader=="smokePuff" and not puff.dispatched and s.suppressed==1,"smoke media and suppression")
  s.ragePro=true;rage=effects.smokePuff(s,[0.0,0.0,0.0],[0.0,0.0,0.0],1.0,0.0,0.0,0.0,0.0,100.0,0,0,0,"x",false);count=count+require(rage.shader==effects.SMOKE_RAGEPRO_SHADER and rage.shaderColor==[255.0,255.0,255.0,255.0] and rage.dispatched,"ragepro override");s.ragePro=false

  spawn=effects.spawnEffect(s,[10.0,20.0,30.0],true);count=count+require(spawn.position==[10.0,20.0,6.0] and spawn.model==effects.TELEPORT_MODEL and spawn.shader==effects.TELEPORT_SHADER,"base spawn effect")
  s.missionpack=true;spawn=effects.spawnEffect(s,[10.0,20.0,30.0],true);count=count+require(spawn.position==[10.0,20.0,46.0] and spawn.model==effects.TELEPORT_MISSIONPACK_MODEL and spawn.shader=="","missionpack spawn effect");s.missionpack=false
  beam=effects.lightningBoltBeam(s,[1.0,2.0,3.0],[4.0,5.0,6.0],true);count=count+require(beam.leType==effects.LE_SHOWREFENTITY and beam.reType==effects.RT_LIGHTNING and beam.endTime==1050 and beam.oldPosition==[4.0,5.0,6.0],"lightning beam")
  kam=effects.kamikazeEffect(s,[7.0,8.0,9.0],true);count=count+require(kam.leType==effects.LE_KAMIKAZE and kam.endTime==4000 and kam.model==effects.KAMIKAZE_MODEL,"kamikaze")

  effects.setRandomInts(s,[5,42]);boom=effects.makeExplosion(s,[10.0,20.0,30.0],[0.0,0.0,1.0],"model","shader",600,true,true)
  count=count+require(boom.leType==effects.LE_SPRITE_EXPLOSION and boom.startTime==995 and boom.endTime==1595 and boom.rotation==42.0,"sprite explosion timing")
  count=count+require(boom.position==[10.0,20.0,46.0] and boom.oldPosition==boom.position and boom.model=="model" and boom.shader=="shader","sprite explosion placement")
  effects.setRandomInts(s,[8,91]);boom=effects.makeExplosion(s,[1.0,2.0,3.0],[1.0,0.0,0.0],"m","s",500,false,true);count=count+require(boom.leType==effects.LE_EXPLOSION and boom.position==[1.0,2.0,3.0] and boom.rotation==91.0,"model explosion")
  count=count+require(try(effects.makeExplosion(s,[0.0,0.0,0.0],void,"","",0,false,true)) is error,"explosion rejects nonpositive lifetime")

  effects.setRandomInts(s,[3,17]);obelisk=effects.obeliskExplode(s,[1.0,2.0,3.0],27,true);count=count+require(obelisk.kind=="obelisk-explode" and obelisk.position==[1.0,2.0,67.0] and obelisk.entity==27,"obelisk origin")
  count=count+require(obelisk.model==effects.DISH_FLASH_MODEL and obelisk.shader==effects.ROCKET_EXPLOSION_SHADER and obelisk.light==300.0 and obelisk.lightColor==[1.0,0.75,0.0],"obelisk light")
  effects.setRandomInts(s,[0,2,3]);a=effects.obeliskPain(s,[0.0,0.0,0.0],true);b=effects.obeliskPain(s,[0.0,0.0,0.0],true);c=effects.obeliskPain(s,[0.0,0.0,0.0],true);count=count+require(a.shader=="sound/items/obelisk_hit_01.wav" and b.shader=="sound/items/obelisk_hit_02.wav" and c.shader=="sound/items/obelisk_hit_03.wav","obelisk sounds")
  effects.setRandomInts(s,[2]);before=len(s.actions);impact=effects.invulnerabilityImpact(s,[1.0,2.0,3.0],[4.0,5.0,6.0],true);count=count+require(impact.model==effects.INVUL_IMPACT_MODEL and impact.angles==[4.0,5.0,6.0] and len(s.actions)==before+2,"invulnerability impact pair")
  count=count+require(s.actions[len(s.actions)-1].shader=="sound/items/invul_impact_02.wav" and s.actions[len(s.actions)-1].boundary=="audio","invulnerability impact sound")
  before=len(s.actions);juice=effects.invulnerabilityJuiced(s,[9.0,8.0,7.0],true);count=count+require(juice.endTime==11000 and juice.model==effects.INVUL_JUICED_MODEL and len(s.actions)==before+2,"invulnerability juiced pair")

  count=count+require(effects.scorePlum(s,1,[0.0,0.0,50.0],5,true)==void,"score plum client filter");first=effects.scorePlum(s,2,[0.0,0.0,50.0],5,true);second=effects.scorePlum(s,2,[1.0,0.0,55.0],-2,true)
  count=count+require(first.leType==effects.LE_SCOREPLUM and first.endTime==5000 and first.radius==5.0,"score plum fields")
  count=count+require(second.position==[1.0,0.0,35.0] and second.radius==-2.0,"score plum overlap")
  s.scorePlum=false;count=count+require(effects.scorePlum(s,2,[0.0,0.0,0.0],1,true)==void,"score plum cvar");s.scorePlum=true

  effects.setRandomInts(s,[77]);blood=effects.bleed(s,[1.0,2.0,3.0],2,true);count=count+require(blood.leType==effects.LE_EXPLOSION and blood.radius==24.0 and blood.rotation==77.0 and blood.shader==effects.BLOOD_EXPLOSION_SHADER,"bleed sprite")
  count=count+require((blood.renderfx&effects.RF_THIRD_PERSON)!=0,"own blood third person")
  s.blood=false;count=count+require(effects.bleed(s,[0.0,0.0,0.0],3,true)==void,"blood cvar");s.blood=true

  effects.setRandomInts(s,[0,32767]);gib=effects.launchGib(s,[1.0,2.0,3.0],[4.0,5.0,6.0],"gib.md3",true);fragment=effects.launchExplode(s,[1.0,2.0,3.0],[4.0,5.0,6.0],"shell.md3",true)
  count=count+require(gib.endTime==6000 and gib.bounceFactor==0.6 and gib.bounceSound==effects.LEBS_BLOOD and gib.markType==effects.LEMT_BLOOD,"gib fragment")
  count=count+require(fragment.endTime==17000 and fragment.bounceFactor==0.1 and fragment.bounceSound==effects.LEBS_BRASS and fragment.markType==effects.LEMT_NONE,"explode fragment")

  effects.setRandomInts(s,array(80,16384));gibs=effects.gibPlayer(s,[0.0,0.0,0.0],true);count=count+require(len(gibs)==10 and gibs[0].model=="models/gibs/brain.md3" and gibs[9].model=="models/gibs/leg.md3","complete gib set")
  s.gibs=false;effects.setRandomInts(s,array(8,16384));gibs=effects.gibPlayer(s,[0.0,0.0,0.0],true);count=count+require(len(gibs)==1,"gib speed cvar");s.gibs=true
  effects.setRandomInts(s,array(40,16384));parts=effects.bigExplode(s,[0.0,0.0,0.0],true);count=count+require(len(parts)==5 and parts[0].model==effects.SMOKE2_MODEL and parts[4].velocity[0]>parts[0].velocity[0],"big explode fragments")

  effects.setRandomInts(s,[0,0,16384,16384,16384,0,0,16384,16384,16384,0]);bubbles=effects.bubbleTrail(s,[0.0,0.0,0.0],[0.0,0.0,20.0],10.0,true)
  count=count+require(len(bubbles)==2 and bubbles[0].position==[0.0,0.0,0.0] and bubbles[1].position==[0.0,0.0,10.0],"bubble spacing")
  count=count+require(bubbles[0].shader==effects.WATER_BUBBLE_SHADER and bubbles[0].flags==effects.LEF_PUFF_DONT_SCALE and bubbles[0].velocity[2]>5.0,"bubble fields")
  s.noProjectileTrail=true;count=count+require(len(effects.bubbleTrail(s,[0.0,0.0,0.0],[0.0,0.0,20.0],10.0,true))==0,"projectile trail cvar");s.noProjectileTrail=false
  count=count+require(try(effects.bubbleTrail(s,[0.0,0.0,0.0],[1.0,0.0,0.0],0.0,true)) is error,"bubble spacing validation")
  count=count+require(s.suppressed>0 and s.emitted==1,"dispatch accounting");effects.clear(s);count=count+require(len(s.actions)==0,"queue clear")
  print("PASS: "+str(count)+" native cg_effects contracts");return 0
end function
