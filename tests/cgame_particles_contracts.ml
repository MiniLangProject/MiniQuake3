import mq3.client.cgame_particles as particles

struct Entity origin origin2 angles angles2 time time2 frame end struct
struct Trace entityNum startsolid fraction endpos end struct
struct TraceContext values cursor end struct

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function approx(a,b) return a>b-0.001 and a<b+0.001 end function
function entity()
  return Entity([10.0,20.0,30.0],[1.0,2.0,-10.0],[0.5,-0.25,1.0],[0.0,0.0,0.0],1000,500,0)
end function
function worldTrace(context,start,finish) context.cursor=context.cursor+1;return Trace(1023,false,0.5,finish) end function
function entityTrace(context,start,finish) return Trace(3,false,0.5,finish) end function
function actionKind(state,kind) count=0;for each value in state.actions if value.kind==kind then count=count+1 end if end for;return count end function

function main(args)
  failures=0;s=particles.create(8,true);s.time=100;particles.clearParticles(s);failures=failures+req(len(s.particles)==8 and len(s.free)==8 and len(s.registrations)==146,"pool and shader animations initialized")
  a=particles.allocParticle(s);b=particles.allocParticle(s);failures=failures+req(a.id==0 and b.id==1 and s.active==[1,0],"particle allocation prepends active list");particles.freeParticle(s,a);again=particles.allocParticle(s);failures=failures+req(again.id==0 and again.type==particles.P_NONE,"free slot resets and reuses")
  full=particles.create(1,false);particles.clearParticles(full);particles.allocParticle(full);failures=failures+req(particles.allocParticle(full)==void and full.dropped==1,"full pool drops particle")
  s=particles.create(32,true);s.time=1000;particles.clearParticles(s);particles.setRandomInts(s,[16384,8192,24576,4096,28672,100,200,300,400,500,600,700,800,900,1000])
  snow=particles.particleSnow(s,"snow",[0.0,0.0,100.0],[0.0,0.0,0.0],0,32.0,7);failures=failures+req(snow.type==particles.P_WEATHER and snow.link and snow.snum==7 and snow.vel[2]==-50.0,"snow spawn")
  bubble=particles.particleBubble(s,"bubble",[0.0,0.0,0.0],[0.0,0.0,100.0],1,8.0,8);failures=failures+req(bubble.type==particles.P_BUBBLE_TURBULENT and bubble.vel[2]==65.0 and bubble.link,"turbulent bubble spawn")
  cent=entity();smoke=particles.particleSmoke(s,"smoke",cent);failures=failures+req(smoke.type==particles.P_SMOKE and smoke.endtime==2000 and smoke.startfade==1500 and smoke.width==8.0 and smoke.endwidth==32.0,"smoke lifecycle")
  debris=particles.particleBulletDebris(s,[1.0,2.0,3.0],[4.0,5.0,6.0],600,"tracer");failures=failures+req(debris.color==particles.EMISIVEFADE and debris.vel[2]==-14.0 and debris.accel[2]==-60.0,"bullet debris gravity")
  explosion=particles.particleExplosion(s,"explode1",[100.0,0.0,0.0],[1.0,2.0,3.0],1000,20,40);failures=failures+req(explosion.type==particles.P_ANIM and explosion.shaderAnim==0 and approx(explosion.height,28.1) and explosion.endtime==2000,"animated explosion")
  bad=particles.particleExplosion(s,"missing",[0.0,0.0,0.0],[0.0,0.0,0.0],100,1,2);failures=failures+req(bad==void and len(s.errors)==1,"unknown animation rejected")
  bleed=particles.particleBleed(s,"blood",[1.0,2.0,3.0],[0.0,0.0,1.0],1,700);failures=failures+req(bleed.color==particles.BLOODRED and bleed.startfade==1000 and bleed.endtime==1700,"bleed immediate fade")
  impact=particles.particleImpactSmokePuff(s,"impact",[1.0,2.0,3.0]);failures=failures+req(impact.type==particles.P_SMOKE_IMPACT and impact.rotate and impact.endtime==1500 and impact.accel[2]==20.0,"impact smoke")
  oil=particles.particleOilParticle(s,"oil",cent);failures=failures+req(oil.type==particles.P_SMOKE and oil.endtime==2500 and oil.accel[2]==-20.0,"oil droplet")
  slick=particles.particleOilSlick(s,"slick",cent);failures=failures+req(slick.type==particles.P_FLAT_SCALEUP and slick.width==8.0 and slick.endwidth==16.0,"oil slick defaults");failures=failures+req(particles.oilSlickRemove(s,cent)==1 and slick.type==particles.P_FLAT_SCALEUP_FADE and slick.endtime==1100,"oil slick removal transition")
  spark=particles.particleSparks(s,[0.0,0.0,0.0],[1.0,2.0,3.0],500,4.0,5.0,2.0,"tracer");failures=failures+req(spark.type==particles.P_SMOKE and spark.endtime==1500 and spark.color==particles.EMISIVEFADE,"spark spawn")
  dust=particles.particleDust(s,cent,[0.0,0.0,0.0],[0.0,0.0,0.0],"smoke");failures=failures+req(len(dust)==1 and dust[0].accel==[0.0,0.0,0.0] and approx(dust[0].width,6.4),"dust preserves cleared acceleration")
  cloud=particles.particleBloodCloud(s,cent,[5.0,6.0,7.0],[64.0,0.0,0.0],"smoke");failures=failures+req(len(cloud)==2 and cloud[0].org==[5.0,6.0,7.0] and cloud[0].color==particles.BLOODRED,"blood cloud subdivision and original origin behavior")
  area=particles.create(16,true);area.time=100;particles.clearParticles(area);particles.setRandomInts(area,[1,2,3,4,5,6,7,8,9,10,11,12]);failures=failures+req(particles.newParticleArea(area,"4 0 0 0 0 0 64 2 0 9","bubble")==1 and len(area.active)==2 and area.particles[area.active[0]].type==particles.P_BUBBLE,"particle area bubble parsing")
  failures=failures+req(particles.snowLink(area,9,false)==0,"snow link excludes bubbles");snow2=particles.particleSnow(area,"snow",[0.0,0.0,10.0],[0.0,0.0,0.0],1,2.0,9);failures=failures+req(particles.snowLink(area,9,false)==1 and not snow2.link,"snow PVS linking")
  one=particles.create(8,true);one.time=0;particles.clearParticles(one);misc=particles.particleMisc(one,"sprite",[100.0,0.0,0.0],8,-1,0.1);rendered=particles.addParticles(one,10,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]);failures=failures+req(len(rendered)==1 and len(one.active)==0 and rendered[0].kind=="sprite" and not rendered[0].dispatched,"temporary sprite draws once and retail suppresses dispatch")
  persistent=particles.particleMisc(one,"sprite",[100.0,0.0,0.0],4,5,0.2);particles.addParticles(one,1000,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]);failures=failures+req(persistent.active,"positive-duration sprite preserves original persistent behavior")
  life=particles.create(8,false);life.time=0;particles.clearParticles(life);p=particles.particleBulletDebris(life,[100.0,0.0,0.0],[10.0,0.0,20.0],100,"tracer");draw=particles.addParticles(life,50,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]);failures=failures+req(len(draw)==1 and draw[0].dispatched and draw[0].kind=="smoke" and draw[0].origin[0]>100.0,"movement and native render dispatch");particles.addParticles(life,101,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]);failures=failures+req(not p.active and life.freed==1,"timed smoke expiry")
  flat=particles.create(4,false);flat.time=0;particles.clearParticles(flat);e=entity();slick2=particles.particleOilSlick(flat,"slick",e);flat.time=500;flat.vieworg=[100.0,100.0,100.0];a2=particles.addParticleToScene(flat,slick2,slick2.org,1.0);failures=failures+req(a2.kind=="flat-scaleup" and a2.vertexCount==4 and approx(a2.width,8.066666),"flat scale-up geometry")
  traceContext=TraceContext([],0);failures=failures+req(particles.validBloodPool([0.0,0.0,0.0],worldTrace,traceContext) and traceContext.cursor==4,"blood pool four-corner world trace");failures=failures+req(not particles.validBloodPool([0.0,0.0,0.0],entityTrace,traceContext),"blood pool rejects entities")
  poolState=particles.create(4,true);poolState.time=50;particles.clearParticles(poolState);trace=Trace(1023,false,0.5,[1.0,2.0,3.0]);particles.setRandomInts(poolState,[16384,9]);pool=particles.bloodPool(poolState,"bloodpool",trace,worldTrace,traceContext);failures=failures+req(pool!=void and pool.color==particles.BLOODRED and pool.type==particles.P_FLAT_SCALEUP,"blood pool spawn")
  if failures!=0 then return failures end if;print("PASS: 29 cgame particle contracts");return 0
end function
