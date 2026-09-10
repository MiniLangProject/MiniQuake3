// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_fight_state as fight
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps

struct Context events observer dead visible chats moveFailure attacks now ent randomValue end struct
function require(v,label) if not v then return error(499,"Fight state contract: "+label) end if return 1 end function
function clock(s) return s.context.now end function
function entity(s,index) return s.context.ent end function
function dead(s,e) return s.context.dead end function
function same(s,b,index) return false end function
function visible(s,v,e,a,f,index) return s.context.visible end function
function characteristic(s,ch,index,lo,hi) if index==combat.CHARACTERISTIC_AIM_ACCURACY then return 1.0 end if;if index==combat.CHARACTERISTIC_FIRETHROTTLE then return 1.0 end if;if index==combat.CHARACTERISTIC_WEAPONJUMPING then return 0.0 end if;if index==combat.CHARACTERISTIC_ATTACK_SKILL then return 0.1 end if;return 0.0 end function
function random(s) return s.context.randomValue end function
function trace(s,a,b,p,k) return combat.Trace(1.0,1,b,false) end function
function weapon(s,ws,num) return combat.WeaponInfo(2,0.0,[0.0,0.0,0.0],0.0,0.0,0,0.0,0.0,0) end function
function attack(s,client) s.context.attacks=s.context.attacks+1;return void end function
function setupMove(s,b) return void end function
function moveGoal(s,ms,g,tfl) return combat.MoveResult(s.context.moveFailure,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
function moveDir(s,ms,d,speed,mt) return false end function
function pointContents(s,p) return 0 end function
function observer(s,b) return s.context.observer end function
function record(s,b,a,c,r) s.context.events=s.context.events+[[1,a,r]];return void end function
function resetLast(s,ms) s.context.events=s.context.events+[[2,ms]];return void end function
function enter(s,b,node,reason) s.context.events=s.context.events+[[3,node,reason]];return void end function
function boolChat(s,b) return s.context.chats end function
function chatVoid(s,b) s.context.events=s.context.events+[[4]];return void end function
function chatTime(s,b) return 2.0 end function
function pointArea(s,p) return 7 end function
function reachable(s,a) return true end function
function updateBattle(s,b,e) s.context.events=s.context.events+[[5,e]];return void end function
function useItems(s,b) s.context.events=s.context.events+[[6]];return void end function
function choose(s,b) s.context.events=s.context.events+[[7]];return void end function
function blocked(s,b,m,a) s.context.events=s.context.events+[[8,m.failure]];return void end function
function resetAvoid(s,ms) s.context.events=s.context.events+[[9,ms]];return void end function
function make()
 ctx=Context([],false,false,1.0,false,false,0,100.0,combat.TargetEntityInfo(1,0,0,true,[100.0,0.0,0.0],[0.0,0.0,0.0],[100.0,0.0,0.0],0.1),0.5)
 cs=combat.create();cs.context=ctx;cs.maxclients=1;cs.floatTimeFn=clock;cs.entityInfoFn=entity;cs.entityDeadFn=dead;cs.sameTeamFn=same;cs.visibleFn=visible;cs.characteristicFloatFn=characteristic;cs.randomFn=random;cs.traceFn=trace;cs.weaponInfoFn=weapon;cs.attackFn=attack;cs.setupMovementFn=setupMove;cs.moveToGoalFn=moveGoal;cs.moveDirectionFn=moveDir;cs.pointContentsFn=pointContents
 s=fight.create(cs);s.context=ctx;s.observerFn=observer;s.recordNodeFn=record;s.resetLastAvoidFn=resetLast;s.enterNodeFn=enter;s.chatEnemySuicideFn=chatVoid;s.chatKillFn=boolChat;s.chatHitNoDeathFn=boolChat;s.chatHitNoKillFn=boolChat;s.chatTimeFn=chatTime;s.pointAreaFn=pointArea;s.areaReachableFn=reachable;s.updateBattleFn=updateBattle;s.battleUseItemsFn=useItems;s.chooseWeaponFn=choose;s.blockedFn=blocked;s.resetAvoidFn=resetAvoid
 b=bots.createBot(0);b.curPs=ps.create();b.enemy=1;b.ms=9;b.ws=4;b.inventory[combat.INVENTORY_HEALTH]=100;b.lastHealth=100;b.lastframeHealth=100;b.origin=[0.0,0.0,0.0];b.eye=[0.0,0.0,0.0];b.aimTarget=[100.0,0.0,0.0];b.viewangles=[0.0,0.0,0.0]
 return [s,b,ctx]
end function
function contracts()
 count=0;x=make();s=x[0];b=x[1];ctx=x[2];fight.enterFight(s,b,"go");count=count+require(b.aiNode==fight.NODE_FIGHT and ctx.events==[[1,"battle fight","go"],[2,9]],"enter fight")
 x=make();s=x[0];b=x[1];fight.enterSuicidalFight(s,b,"rage");count=count+require(b.aiNode==fight.NODE_FIGHT and (b.combatFlags&fight.BFL_FIGHTSUICIDAL)!=0,"enter suicidal fight")
 x=make();s=x[0];b=x[1];ctx=x[2];fight.enterChase(s,b,"lost");count=count+require(b.aiNode==fight.NODE_CHASE and b.chaseTime==100.0,"enter chase")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.observer=true;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_OBSERVER,"observer transition")
 x=make();s=x[0];b=x[1];s.combatServices.intermissiontime=1;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_INTERMISSION,"intermission transition")
 x=make();s=x[0];b=x[1];b.curPs.pm_type=3;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_RESPAWN,"dead transition")
 x=make();s=x[0];b=x[1];b.enemy=-1;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_SEEK,"no enemy transition")
 x=make();s=x[0];b=x[1];ctx=x[2];b.enemyDeathTime=98.0;b.lastKilledPlayer=1;ctx.chats=true;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_STAND and b.standTime==102.0,"enemy death chat stand")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.ent.powerups=1<<4;ctx.randomValue=0.1;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_SEEK,"invisible enemy abandon")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=0.0;b.inventory[combat.INVENTORY_ROCKETLAUNCHER]=1;b.inventory[combat.INVENTORY_ROCKETS]=6;count=count+require(not fight.fightNode(s,b) and b.aiNode==fight.NODE_CHASE,"unseen aggressive enemy chase")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.moveFailure=true;b.attackchaseTime=101.0;count=count+require(fight.fightNode(s,b) and b.lastEnemyAreaNum==7 and b.ltgTime==0.0,"full fight movement failure")
 count=count+require(ctx.attacks==1,"full fight attacks after blocked handling")
 x=make();s=x[0];b=x[1];ctx=x[2];b.inventory[combat.INVENTORY_HEALTH]=20;count=count+require(fight.fightNode(s,b) and b.aiNode==fight.NODE_RETREAT and ctx.events[len(ctx.events)-1]==[1,"battle retreat","battle fight: wants to retreat"],"retreat entry after attack")
 x=make();s=x[0];b=x[1];ctx=x[2];b.inventory[combat.INVENTORY_HEALTH]=20;b.combatFlags=fight.BFL_FIGHTSUICIDAL;count=count+require(fight.fightNode(s,b) and b.aiNode==0,"suicidal fight suppresses retreat")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" battle-fight state contracts\n");return 0 end function
