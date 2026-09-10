// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps

struct Context entities dead teams visibility traces traceIndex randoms randomIndex attacks battle now characteristics events weapon end struct
function require(v,label) if not v then return error(499,"Bot targeting contract: "+label) end if return 1 end function
function time(s) return s.context.now end function
function characteristic(s,ch,index,low,high) s.context.events=s.context.events+[10,index];return s.context.characteristics[index] end function
function entity(s,index) s.context.events=s.context.events+[20,index];return s.context.entities[index] end function
function dead(s,e) return s.context.dead[e.number] end function
function same(s,b,index) return s.context.teams[index] end function
function visible(s,viewer,eye,angles,fov,index) s.context.events=s.context.events+[30,index];return s.context.visibility[index] end function
function battle(s,b,index) s.context.battle=s.context.battle+[index];return void end function
function random(s) v=s.context.randoms[s.context.randomIndex];s.context.randomIndex=s.context.randomIndex+1;return v end function
function trace(s,start,finish,pass,kind) value=s.context.traces[s.context.traceIndex];s.context.traceIndex=s.context.traceIndex+1;s.context.events=s.context.events+[40,kind];return value end function
function weapon(s,ws,num) return s.context.weapon end function
function attack(s,client) s.context.attacks=s.context.attacks+[client];return void end function
function target(number,x,y,z) return combat.TargetEntityInfo(number,0,0,true,[x,y,z],[0.0,0.0,0.0],[x,y,z],0.1) end function
function context()
  entities=[];for i=0 to 69 entities=entities+[target(i,100.0+i,0.0,0.0)] end for
  values=array(64,0.0);values[combat.CHARACTERISTIC_ALERTNESS]=0.5;values[combat.CHARACTERISTIC_EASY_FRAGGER]=1.0;values[combat.CHARACTERISTIC_AIM_SKILL]=0.5;values[combat.CHARACTERISTIC_AIM_ACCURACY]=1.0;values[combat.CHARACTERISTIC_REACTIONTIME]=0.0;values[combat.CHARACTERISTIC_FIRETHROTTLE]=1.0
  return Context(entities,array(70,false),array(70,false),array(70,1.0),[],0,[0.0],0,[],[],100.0,values,[],combat.WeaponInfo(2,0.0,[0.0,0.0,0.0],0.0,0.0,0,0.0,0.0,0))
end function
function services(ctx) s=combat.create();s.context=ctx;s.maxclients=4;s.floatTimeFn=time;s.characteristicFloatFn=characteristic;s.entityInfoFn=entity;s.entityDeadFn=dead;s.sameTeamFn=same;s.visibleFn=visible;s.updateBattleFn=battle;s.randomFn=random;s.traceFn=trace;s.weaponInfoFn=weapon;s.attackFn=attack;return s end function
function bot() b=bots.createBot(0);b.curPs=ps.create();b.curPs.viewheight=26;b.inventory[combat.INVENTORY_HEALTH]=100;b.lastHealth=100;b.entitynum=0;b.enemy=-1;b.origin=[0.0,0.0,0.0];b.eye=[0.0,0.0,26.0];b.viewangles=[0.0,0.0,0.0];return b end function
function contracts()
 count=0;ctx=context();s=services(ctx);b=bot();ctx.entities[1].valid=false;ctx.dead[2]=true;ctx.entities[3].flags=combat.EF_FIRING
 count=count+require(combat.findEnemy(s,b,-1) and b.enemy==3,"enemy scan filters invalid and dead")
 count=count+require(b.enemySightTime==100.0 and b.enemyVisibleTime==100.0 and not b.enemySuicide,"enemy acquisition timestamps")
 ctx=context();s=services(ctx);b=bot();ctx.entities[1].powerups=1<<4;ctx.entities[2].flags=combat.EF_TALK;ctx.characteristics[combat.CHARACTERISTIC_EASY_FRAGGER]=0.4;ctx.teams[3]=true
 count=count+require(not combat.findEnemy(s,b,-1),"invisible chatting and teammate filters")
 ctx=context();s=services(ctx);b=bot();s.lastteleportTime=99.0;s.lastteleportOrigin=[101.0,0.0,0.0];ctx.entities[2].valid=false;ctx.entities[3].valid=false
 count=count+require(not combat.findEnemy(s,b,-1),"recent teleport exclusion")
 ctx=context();s=services(ctx);b=bot();ctx.entities[1].origin=[200.0,0.0,0.0];ctx.entities[2].origin=[50.0,0.0,0.0];ctx.entities[3].valid=false
 count=count+require(combat.findEnemy(s,b,1) and b.enemy==2 and b.enemySightTime==98.0,"closer replacement enemy")
 ctx=context();s=services(ctx);b=bot();ctx.entities[1].powerups=1<<7
 count=count+require(not combat.findEnemy(s,b,1),"current flag carrier retained")
 ctx=context();s=services(ctx);b=bot();ctx.entities[1].origin=[200.0,0.0,0.0];ctx.entities[1].angles=[0.0,0.0,0.0];ctx.entities[2].valid=false;ctx.entities[3].valid=false;b.inventory[combat.INVENTORY_HEALTH]=20
 count=count+require(combat.findEnemy(s,b,-1),"damage widens acquisition field")
 ctx=context();s=services(ctx);b=bot();count=count+require(not combat.aimAtEnemy(s,b),"aim ignores missing enemy")
 b.enemy=65;ctx.entities[65].origin=[100.0,0.0,26.0];count=count+require(combat.aimAtEnemy(s,b) and b.aimTarget==[100.0,0.0,26.0],"non-player direct aim")
 count=count+require(b.idealViewangles[0]==0.0 and b.idealViewangles[1]==0.0,"non-player ideal angle")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;ctx.characteristics[combat.CHARACTERISTIC_AIM_SKILL]=1.0;ctx.characteristics[combat.CHARACTERISTIC_REACTIONTIME]=1.0;b.enemySightTime=99.8
 count=count+require(not combat.aimAtEnemy(s,b),"aim reaction delay")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;ctx.entities[1].origin=[100.0,0.0,26.0];ctx.traces=[combat.Trace(1.0,1,[100.0,0.0,34.0],false),combat.Trace(1.0,1,[100.0,0.0,34.0],false)];ctx.randoms=[0.0,0.0,0.0]
 count=count+require(combat.aimAtEnemy(s,b),"visible aim succeeds")
 count=count+require(b.aimTarget==[100.0,0.0,34.0] and b.idealViewangles[1]==0.0,"visible aim target and yaw")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;ctx.visibility[1]=0.0;b.lastEnemyOrigin=[40.0,10.0,2.0];ctx.randoms=[0.0,0.0,0.0]
 count=count+require(combat.aimAtEnemy(s,b) and b.aimTarget==[40.0,10.0,10.0],"hidden enemy uses last origin")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.aimTarget=[100.0,0.0,26.0];ctx.traces=[combat.Trace(1.0,1,b.aimTarget,false),combat.Trace(1.0,1,[1000.0,0.0,26.0],false)]
 count=count+require(combat.checkAttack(s,b) and ctx.attacks==[0],"clear hitscan attack")
 count=count+require(b.combatFlags==combat.BFL_ATTACKED,"attack flag toggles")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.aimTarget=[100.0,0.0,26.0];b.enemySightTime=99.5;ctx.characteristics[combat.CHARACTERISTIC_REACTIONTIME]=1.0
 count=count+require(not combat.checkAttack(s,b) and ctx.attacks==[],"attack reaction delay")
 b.enemySightTime=0.0;b.weaponchangeTime=99.95;count=count+require(not combat.checkAttack(s,b),"weapon-change delay")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.weaponnum=combat.WP_GAUNTLET;b.aimTarget=[61.0,0.0,26.0]
 count=count+require(not combat.checkAttack(s,b),"gauntlet range limit")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.aimTarget=[0.0,100.0,26.0]
 count=count+require(not combat.checkAttack(s,b),"attack field of vision")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.aimTarget=[100.0,0.0,26.0];ctx.traces=[combat.Trace(0.5,3,[50.0,0.0,26.0],false)]
 count=count+require(not combat.checkAttack(s,b),"blocked aim trace")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.aimTarget=[100.0,0.0,26.0];ctx.traces=[combat.Trace(1.0,1,b.aimTarget,false),combat.Trace(0.1,2,[100.0,0.0,26.0],false)];ctx.teams[2]=true
 count=count+require(not combat.checkAttack(s,b),"teammate fire veto")
 ctx=context();s=services(ctx);b=bot();b.enemy=1;b.aimTarget=[100.0,0.0,26.0];ctx.weapon.flags=combat.WFL_FIRERELEASED;ctx.traces=[combat.Trace(1.0,1,b.aimTarget,false),combat.Trace(1.0,1,[1000.0,0.0,26.0],false)]
 count=count+require(not combat.checkAttack(s,b) and b.combatFlags==combat.BFL_ATTACKED,"fire-release primes without attack")
 ctx.traceIndex=0;count=count+require(combat.checkAttack(s,b) and ctx.attacks==[0] and b.combatFlags==0,"fire-release attacks next frame")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot combat targeting contracts\n");return 0 end function
