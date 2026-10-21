import mq3.client.cgame_marks as marks
import mq3.client.cgame_particles as particles

struct Entity origin origin2 angles angles2 time time2 frame end struct
struct Trace entityNum startsolid fraction endpos end struct
struct TraceContext calls end struct
function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function approx(a,b) return a>b-0.001 and a<b+0.001 end function
function worldTrace(context,start,finish) context.calls=context.calls+1;return Trace(1023,false,0.5,finish) end function
function activeTime(state,id) return state.marks[id].time end function

function main(args)
  failures=0;s=marks.create(3,true);failures=failures+req(len(s.marks)==3 and s.free==[0,1,2] and len(s.active)==0,"mark pool init")
  a=marks.allocMark(s);a.time=10;b=marks.allocMark(s);b.time=10;c=marks.allocMark(s);c.time=20;failures=failures+req(s.active==[2,1,0] and len(s.free)==0,"allocation prepends active list")
  d=marks.allocMark(s);failures=failures+req(d.id==1 and s.active==[1,2] and s.evicted==2 and s.freed==2,"oldest impact batch eviction")
  marks.freeMarkPoly(s,d);failures=failures+req(s.free[0]==1 and not d.active,"free list reuse")
  marks.initMarkPolys(s);s.time=100;s.energyMarkShader="energy";fragment=marks.Fragment([[-2.0,-1.0,0.0],[2.0,-1.0,0.0],[2.0,1.0,0.0],[-2.0,1.0,0.0]])
  made=marks.impactMark(s,"bullet",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,0.5,0.25,0.75,false,2.0,false,[fragment]);failures=failures+req(len(made)==1 and made[0].active and made[0].time==100,"persistent impact allocation")
  failures=failures+req(len(made[0].verts)==4 and made[0].verts[0].modulate==[255,127,63,191],"impact color bytes");failures=failures+req(approx(made[0].verts[0].st[0],0.25) and approx(made[0].verts[0].st[1],0.0),"projected texture coordinates")
  failures=failures+req(s.actions[0].kind=="mark-fragments" and not s.actions[0].dispatched and s.suppressed==1,"retail collision projection suppression")
  failures=failures+req(s.actions[0].projection==[0.0,0.0,-20.0] and len(s.actions[0].points)==4,"projection boundary payload")
  before=len(s.active);temp=marks.impactMark(s,"shadow",[0.0,0.0,0.0],[0.0,0.0,1.0],90.0,1.0,1.0,1.0,1.0,true,3.0,true,[fragment]);failures=failures+req(len(temp)==0 and len(s.active)==before and s.actions[len(s.actions)-1].temporary,"temporary mark immediate submission")
  fallback=marks.impactMark(s,"fallback",[1.0,2.0,3.0],[0.0,1.0,0.0],15.0,1.0,1.0,1.0,1.0,true,4.0,false,void);failures=failures+req(len(fallback)==1 and len(fallback[0].verts)==4,"unclipped fallback quad")
  s.addMarks=false;before=len(s.active);ignored=marks.impactMark(s,"off",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,1.0,1.0,1.0,false,1.0,false,void);failures=failures+req(len(ignored)==0 and len(s.active)==before,"cg_addMarks gate");s.addMarks=true
  fade=marks.create(4,false);fade.time=0;fade.energyMarkShader="energy";alphaMark=marks.impactMark(fade,"bullet",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,0.5,0.25,0.8,true,2.0,false,[fragment])[0];rgbMark=marks.impactMark(fade,"bullet",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,0.5,0.25,0.8,false,2.0,false,[fragment])[0];energy=marks.impactMark(fade,"energy",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,0.5,0.25,1.0,false,2.0,false,[fragment])[0]
  frame=marks.addMarks(fade,9500);failures=failures+req(len(frame)==3 and frame[0].dispatched and fade.rendered==3,"persistent render boundaries");failures=failures+req(alphaMark.verts[0].modulate[3]==127,"alpha fade");failures=failures+req(rgbMark.verts[0].modulate[0]==127 and rgbMark.verts[0].modulate[1]==63 and rgbMark.verts[0].modulate[2]==31,"rgb fade preserves color");failures=failures+req(energy.verts[0].modulate[0]==127,"terminal fade follows energy fade")
  still=marks.addMarks(fade,10000);failures=failures+req(len(still)==3,"marks live at exact total time");gone=marks.addMarks(fade,10001);failures=failures+req(len(gone)==0 and len(fade.active)==0 and fade.freed==3,"marks expire after total time")
  capped=marks.create(2,false);capped.time=5;many=[];for i=0 to 69 many=many+[[i*1.0,0.0,0.0]] end for;clipped=marks.impactMark(capped,"x",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,1.0,1.0,1.0,false,1.0,false,[marks.Fragment(many)]);failures=failures+req(len(clipped[0].verts)==marks.MAX_VERTS_ON_POLY,"stored polygon vertex cap")
  p=particles.create(8,true);p.time=100;marks.clearParticles(p);failures=failures+req(len(p.free)==8,"CG_ClearParticles wrapper");e=Entity([0.0,0.0,10.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],100,50,0);marks.particleSmoke(p,"smoke",e);failures=failures+req(len(p.active)==1,"CG_ParticleSmoke wrapper");marks.particleSnow(p,"snow",[0.0,0.0,10.0],[0.0,0.0,0.0],0,2.0,9);failures=failures+req(marks.snowLink(p,9,false)==1,"CG_SnowLink wrapper");traceContext=TraceContext(0);failures=failures+req(marks.validBloodPool([0.0,0.0,0.0],worldTrace,traceContext) and traceContext.calls==4,"ValidBloodPool wrapper")
  if failures!=0 then return failures end if;print("PASS: 23 native cg_marks contracts");return 0
end function
