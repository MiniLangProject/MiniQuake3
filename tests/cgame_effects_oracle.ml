import mq3.client.cgame_effects as effects
import mq3.compat.numeric as n
function handle(value)
  if value=="" then return 0 end if
  if value==effects.TELEPORT_MODEL then return 12 end if
  if value==effects.BLOOD_EXPLOSION_SHADER then return 13 end if
  if value==effects.SMOKE_RAGEPRO_SHADER then return 99 end if
  return value
end function
function row(name,value)
  print(name+"|"+str(value.leType)+"|"+str(value.startTime)+"|"+str(value.endTime)+"|"+str(n.u32(n.floatBits(value.lifeRate)))+"|"+str(n.u32(n.floatBits(value.rotation)))+"|"+str(n.u32(n.floatBits(value.position[0])))+"|"+str(n.u32(n.floatBits(value.position[2])))+"|"+str(handle(value.model))+"|"+str(handle(value.shader))+"|"+str(value.renderfx)+"|"+str(n.u32(n.floatBits(value.bounceFactor)))+"|"+str(n.u32(n.floatBits(value.velocity[0])))+"|"+str(n.u32(n.floatBits(value.velocity[2])))+"|"+str(n.u32(n.floatBits(value.radius))));return void
end function
function main(args)
  s=effects.create();s.time=1000;s.predictedClient=2
  row("puff",effects.smokePuff(s,[1.0,2.0,3.0],[4.0,5.0,6.0],12.0,0.1,0.2,0.3,0.4,800.0,900,1100,7,21,true))
  s.ragePro=true;row("puff-rage",effects.smokePuff(s,[1.0,2.0,3.0],[4.0,5.0,6.0],2.0,0.0,0.0,0.0,0.0,100.0,1000,1000,0,22,true));s.ragePro=false
  spawn=effects.spawnEffect(s,[1.0,2.0,3.0],true);spawn.shader=11;row("spawn",spawn)
  effects.setRandomInts(s,[5,42]);row("explosion-sprite",effects.makeExplosion(s,[1.0,2.0,3.0],[0.0,0.0,1.0],31,32,600,true,true))
  effects.setRandomInts(s,[8,91]);modelExplosion=effects.makeExplosion(s,[1.0,2.0,3.0],[0.0,0.0,1.0],33,34,500,false,true);modelExplosion.rotation=0.0;row("explosion-model",modelExplosion)
  effects.setRandomInts(s,[77]);row("bleed",effects.bleed(s,[1.0,2.0,3.0],2,true))
  effects.setRandomInts(s,[0]);row("gib",effects.launchGib(s,[1.0,2.0,3.0],[4.0,5.0,6.0],41,true))
  effects.setRandomInts(s,[32767]);row("fragment",effects.launchExplode(s,[1.0,2.0,3.0],[4.0,5.0,6.0],42,true));return 0
end function
