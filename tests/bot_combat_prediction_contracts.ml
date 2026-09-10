// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps

struct Context now predicted visible traces traceIndex events end struct
function require(v,label) if not v then return error(499,"Bot prediction contract: "+label) end if return 1 end function
function clock(s) return s.context.now end function
function predictMove(s,enemy,origin,velocity,frames,step) s.context.events=s.context.events+[[enemy,origin,velocity,frames,step]];return s.context.predicted end function
function predictVisible(s,origin,area,eye) s.context.events=s.context.events+[[origin,area,eye]];return s.context.visible end function
function trace(s,start,finish,pass,kind) value=s.context.traces[s.context.traceIndex];s.context.traceIndex=s.context.traceIndex+1;return value end function
function services(ctx) s=combat.create();s.context=ctx;s.floatTimeFn=clock;s.predictMovementFn=predictMove;s.predictVisibleFn=predictVisible;s.traceFn=trace;return s end function
function bot() b=bots.createBot(1);b.curPs=ps.create();b.enemy=2;b.origin=[0.0,0.0,0.0];b.eye=[0.0,0.0,26.0];return b end function
function info(origin,last,dt) return combat.TargetEntityInfo(2,0,0,true,origin,[0.0,0.0,0.0],last,dt) end function
function weapon(speed,damageType,number) return combat.WeaponInfo(number,speed,[0.0,0.0,0.0],0.0,0.0,damageType,120.0,100.0,0) end function
function close(a,b) d=a-b;if d<0 then d=0-d end if;return d<0.01 end function
function contracts()
 count=0;ctx=Context(10.0,[130.0,0.0,1.0],void,[],0,[]);s=services(ctx);b=bot();b.enemyPositionTime=20.0;e=info([100.0,0.0,0.0],[90.0,0.0,0.0],0.1)
 result=combat.projectileAim(s,b,e,weapon(1000.0,0,5),0.9,[100.0,0.0,8.0])
 count=count+require(result==[130.0,0.0,1.0] and len(ctx.events)==1,"exact movement prediction result")
 count=count+require(close(ctx.events[0][3],1.003) and ctx.events[0][0]==2,"prediction frames and enemy")
 cached=bot();cached.enemyPositionTime=0.0;combat.projectileAim(s,cached,e,weapon(1000.0,0,5),0.3,[100.0,0.0,8.0]);count=count+require(cached.enemyOrigin==[100.0,0.0,0.0] and cached.enemyVelocity==[100.0,0.0,0.0] and cached.enemyPositionTime==10.5,"enemy motion cache")
 ctx=Context(10.0,void,void,[],0,[]);s=services(ctx);b=bot();b.enemyPositionTime=20.0;b.enemyOrigin=[0.0,0.0,0.0]
 result=combat.projectileAim(s,b,e,weapon(100.0,0,5),0.6,[100.0,0.0,0.0])
 count=count+require(result[0]>199.9 and result[0]<200.1,"linear projectile lead")
 count=count+require(ctx.events==[],"linear lead avoids AAS prediction")
 b.enemyOrigin=[99.0,0.0,0.0];result=combat.projectileAim(s,b,e,weapon(100.0,0,5),0.9,[101.0,0.0,0.0]);count=count+require(result==[101.0,0.0,0.0],"small strafe suppresses prediction")
 ctx=Context(10.0,void,void,[combat.Trace(0.5,0,[100.0,0.0,-32.0],false),combat.Trace(1.0,0,[100.0,0.0,-40.0],false),combat.Trace(1.0,2,[100.0,0.0,0.0],false)],0,[]);s=services(ctx);b=bot();e=info([100.0,0.0,0.0],[100.0,0.0,0.0],0.1)
 result=combat.splashGroundAim(s,b,e,[0.0,0.0,26.0],[100.0,0.0,8.0]);count=count+require(result==[100.0,0.0,-40.0],"clear splash ground target")
 count=count+require(ctx.traceIndex==3,"splash uses floor shot and enemy traces")
 ctx=Context(10.0,void,void,[combat.Trace(0.0,0,[0.0,0.0,0.0],true),combat.Trace(1.0,0,[10.0,0.0,-16.0],false)],0,[]);s=services(ctx);b=bot();e=info([10.0,0.0,0.0],[10.0,0.0,0.0],0.1)
 count=count+require(combat.splashGroundAim(s,b,e,[0.0,0.0,26.0],[10.0,0.0,8.0])==[10.0,0.0,8.0],"near splash protects bot")
 ctx=Context(10.0,void,[200.0,0.0,40.0],[],0,[]);s=services(ctx);b=bot();b.lastEnemyOrigin=[100.0,0.0,0.0];b.lastEnemyAreaNum=7
 count=count+require(combat.cornerAim(s,b,weapon(900.0,0,5),0.8,[100.0,0.0,8.0])==[200.0,0.0,20.0],"corner prediction target")
 count=count+require(len(ctx.events)==1 and ctx.events[0][1]==7,"corner prediction area service")
 ctx.visible=[20.0,0.0,26.0];ctx.events=[];count=count+require(combat.cornerAim(s,b,weapon(900.0,0,5),0.8,[100.0,0.0,8.0])==[100.0,0.0,8.0],"near corner target rejected")
 ctx.visible=[200.0,0.0,40.0];count=count+require(combat.cornerAim(s,b,weapon(900.0,0,2),0.8,[100.0,0.0,8.0])==[100.0,0.0,8.0],"hitscan corner shot rejected")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot projectile/splash/corner contracts\n");return 0 end function
