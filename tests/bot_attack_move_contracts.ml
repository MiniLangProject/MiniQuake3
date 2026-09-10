// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps

struct Context now values randoms randomIndex directions results setup goals end struct
function require(v,label) if not v then return error(499,"BotAttackMove contract: "+label) end if return 1 end function
function clock(s) return s.context.now end function
function characteristic(s,ch,index,low,high) return s.context.values[index] end function
function random(s) v=s.context.randoms[s.context.randomIndex];s.context.randomIndex=s.context.randomIndex+1;return v end function
function entity(s,index) return combat.TargetEntityInfo(index,0,0,true,[200.0,0.0,0.0],[0.0,0.0,0.0],[200.0,0.0,0.0],0.1) end function
function setup(s,b) s.context.setup=s.context.setup+1;return void end function
function moveGoal(s,ms,goal,tfl) s.context.goals=s.context.goals+[[goal.entitynum,goal.areanum,goal.origin,tfl]];return combat.MoveResult(true,7,4,[1.0,2.0,3.0],[4.0,5.0,6.0]) end function
function moveDirection(s,ms,dir,speed,movetype) s.context.directions=s.context.directions+[[dir,speed,movetype]];index=len(s.context.directions)-1;if index<len(s.context.results) then return s.context.results[index] end if;return false end function
function context(skill,jumper,croucher,randoms,results) values=array(64,0.0);values[combat.CHARACTERISTIC_ATTACK_SKILL]=skill;values[combat.CHARACTERISTIC_JUMPER]=jumper;values[combat.CHARACTERISTIC_CROUCHER]=croucher;return Context(10.0,values,randoms+array(16,0.0),0,[],results,0,[]) end function
function services(ctx) s=combat.create();s.context=ctx;s.floatTimeFn=clock;s.characteristicFloatFn=characteristic;s.randomFn=random;s.entityInfoFn=entity;s.setupMovementFn=setup;s.moveToGoalFn=moveGoal;s.moveDirectionFn=moveDirection;return s end function
function bot() b=bots.createBot(1);b.curPs=ps.create();b.enemy=2;b.ms=9;b.origin=[0.0,0.0,0.0];b.lastEnemyOrigin=[20.0,30.0,40.0];b.lastEnemyAreaNum=6;b.attackcrouchTime=0.0;b.attackjumpTime=0.0;b.thinktime=0.1;return b end function
function contracts()
 count=0;ctx=context(0.8,0.0,0.0,[0.0],[true]);s=services(ctx);b=bot();b.attackchaseTime=11.0;r=combat.attackMove(s,b,77)
 count=count+require(r.failure and ctx.setup==1,"chase movement result")
 count=count+require(ctx.goals==[[2,6,[20.0,30.0,40.0],77]],"chase goal fields")
 ctx=context(0.19,0.0,0.0,[0.0],[true]);s=services(ctx);b=bot();combat.attackMove(s,b,0);count=count+require(ctx.setup==0 and ctx.directions==[],"stupid bot stands still")
 ctx=context(0.39,0.0,0.0,[0.5,0.5],[true]);s=services(ctx);b=bot();combat.attackMove(s,b,0);count=count+require(ctx.directions[0][0][0]>0.99 and ctx.directions[0][2]==combat.MOVE_WALK,"low skill advances")
 ctx=context(0.39,0.0,0.0,[0.5,0.5],[true]);s=services(ctx);b=bot();b.origin=[101.0,0.0,0.0];combat.attackMove(s,b,0);count=count+require(ctx.directions[0][0][0]<-0.99,"low skill backs away")
 ctx=context(0.39,0.0,0.0,[0.5,0.5],[]);s=services(ctx);b=bot();b.origin=[60.0,0.0,0.0];combat.attackMove(s,b,0);count=count+require(ctx.directions==[],"low skill ideal band")
 ctx=context(0.39,1.0,0.0,[0.0],[true]);s=services(ctx);b=bot();combat.attackMove(s,b,0);count=count+require(ctx.directions[0][2]==combat.MOVE_JUMP and b.attackjumpTime==11.0,"jump movement and cooldown")
 ctx=context(0.39,1.0,0.0,[0.0],[true]);s=services(ctx);b=bot();b.attackjumpTime=11.0;combat.attackMove(s,b,0);count=count+require(ctx.directions[0][2]==combat.MOVE_WALK,"jump cooldown becomes walk")
 ctx=context(0.39,0.0,1.0,[0.5,0.0],[true]);s=services(ctx);b=bot();combat.attackMove(s,b,0);count=count+require(ctx.directions[0][2]==combat.MOVE_CROUCH and b.attackcrouchTime==15.0,"crouch duration")
 ctx=context(0.6,0.0,0.0,[0.5,0.5,0.0],[true]);s=services(ctx);b=bot();combat.attackMove(s,b,0);count=count+require(ctx.directions[0][0][1]<-0.99,"left strafe")
 count=count+require(ctx.directions[0][0][0]>0.99,"far strafe advances")
 ctx=context(0.6,0.0,0.0,[0.5,0.5,0.0,0.0],[false,false]);s=services(ctx);b=bot();combat.attackMove(s,b,0);count=count+require(len(ctx.directions)==2,"two strafe attempts")
 count=count+require((b.combatFlags&combat.BFL_STRAFERIGHT)==0 and b.attackstrafeTime==0.0,"failed strafes restore direction")
 ctx=context(0.8,0.0,0.0,[0.5,0.5,0.0,1.0,0.0],[true]);s=services(ctx);b=bot();b.attackstrafeTime=1.0;combat.attackMove(s,b,0);count=count+require((b.combatFlags&combat.BFL_STRAFERIGHT)!=0,"timed random strafe flip")
 ctx=context(0.39,0.0,0.0,[0.5,0.5],[true]);s=services(ctx);b=bot();b.curPs.weapon=combat.WP_GAUNTLET;combat.attackMove(s,b,0);count=count+require(ctx.directions[0][0][0]>0.99,"gauntlet always closes distance")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" BotAttackMove contracts\n");return 0 end function
