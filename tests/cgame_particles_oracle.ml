import mq3.client.cgame_particles as particles
import mq3.compat.numeric as n
struct Entity origin origin2 angles angles2 time time2 frame end struct
function bits(value) return n.u32(n.floatBits(value)) end function
function row(name,p)
  print(name+"|"+str(p.type)+"|"+str(bits(p.org[0]))+"|"+str(bits(p.org[1]))+"|"+str(bits(p.org[2]))+"|"+str(bits(p.vel[0]))+"|"+str(bits(p.vel[1]))+"|"+str(bits(p.vel[2]))+"|"+str(bits(p.width))+"|"+str(bits(p.height))+"|"+str(bits(p.endwidth))+"|"+str(p.endtime)+"|"+str(p.startfade)+"|"+str(p.color));return void
end function
function state(values) s=particles.create(4,true);s.time=1000;particles.clearParticles(s);s.time=1000;particles.setRandomInts(s,values);return s end function
function main(args)
  a=[10.0,20.0,100.0];b=[0.0,0.0,0.0];v=[4.0,5.0,6.0];cent=Entity([10.0,20.0,30.0],[0.0,0.0,-10.0],[0.0,0.0,0.0],[0.0,0.0,0.0],1000,500,0)
  s=state([16384,8192,24576]);row("snow",particles.particleSnow(s,11,a,b,0,8.0,7))
  s=state([16384,8192,24576,4096,28672,100,200,300]);row("bubble",particles.particleBubble(s,12,b,a,1,8.0,9))
  s=state([24576]);row("smoke",particles.particleSmoke(s,13,cent))
  s=state([1]);row("debris",particles.particleBulletDebris(s,a,v,600,77))
  s=state([2,17,2]);row("impact",particles.particleImpactSmokePuff(s,14,a))
  s=state([2,17]);row("bleed",particles.particleBleed(s,15,a,v,1,700))
  s=state([16384,23]);row("misc",particles.particleMisc(s,16,a,8,-1,0.2))
  s=state([1]);row("explosion",particles.particleExplosion(s,"explode1",a,v,-1000,20,40));return 0
end function
