// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_fight_state as fight
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps

struct Context events observer dead visible moveFailure attacks now ent topExists reached nearby longterm movementFlags movementWeapon skill nearbyRange end struct
function require(v,label) if not v then return error(499,"Battle states contract: "+label) end if return 1 end function
function clock(s) return s.context.now end function
function entity(s,index) return s.context.ent end function
function dead(s,e) return s.context.dead end function
function same(s,b,index) return false end function
function visible(s,v,e,a,f,index) return s.context.visible end function
function characteristic(s,ch,index,lo,hi) if index==combat.CHARACTERISTIC_ATTACK_SKILL then return s.context.skill end if;if index==combat.CHARACTERISTIC_AIM_ACCURACY or index==combat.CHARACTERISTIC_FIRETHROTTLE then return 1.0 end if;return 0.0 end function
function random(s) return 0.5 end function
function trace(s,a,b,p,k) return combat.Trace(1.0,s.context.ent.number,b,false) end function
function weapon(s,ws,num) return combat.WeaponInfo(2,0.0,[0.0,0.0,0.0],0.0,0.0,0,0.0,0.0,0) end function
function attack(s,client) s.context.attacks=s.context.attacks+1;return void end function
function setupMove(s,b) s.context.events=s.context.events+["setup"];return void end function
function moveGoal(s,ms,g,tfl) s.context.events=s.context.events+["move"];return combat.MoveResult(s.context.moveFailure,s.context.movementFlags,s.context.movementWeapon,[1.0,0.0,0.0],[10.0,20.0,30.0]) end function
function moveDir(s,ms,d,speed,mt) return false end function
function pointContents(s,p) return 0 end function
function observer(s,b) return s.context.observer end function
function record(s,b,a,c,r) s.context.events=s.context.events+[a+":"+r];return void end function
function resetLast(s,ms) s.context.events=s.context.events+["reset-last"];return void end function
function enter(s,b,node,reason) s.context.events=s.context.events+["enter:"+str(node)+":"+reason];return void end function
function voidBot(s,b) return void end function
function boolBot(s,b) return false end function
function pointArea(s,p) return 7 end function
function reachable(s,a) return true end function
function updateBattle(s,b,e) s.context.events=s.context.events+["update"];return void end function
function choose(s,b) s.context.events=s.context.events+["choose"];return void end function
function blocked(s,b,m,a) s.context.events=s.context.events+["blocked"];return void end function
function resetAvoid(s,ms) s.context.events=s.context.events+["reset-avoid"];return void end function
function mapScripts(s,b) s.context.events=s.context.events+["map"];return void end function
function touching(s,origin,goal) return false end function
function nearby(s,b,tfl,goal,range) s.context.nearbyRange=range;return s.context.nearby end function
function topGoal(s,gs) return [s.context.topExists,combat.CombatGoal(0,9,[9.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0])] end function
function popGoal(s,gs) s.context.events=s.context.events+["pop"];s.context.topExists=false;return void end function
function reachedGoal(s,b,g) return s.context.reached end function
function emptyGoals(s,gs) s.context.events=s.context.events+["empty"];return void end function
function teamGoals(s,b,retreat) s.context.events=s.context.events+["team"];return void end function
function longTerm(s,b,tfl,retreat,goal) goal.areanum=12;goal.origin=[12.0,0.0,0.0];return s.context.longterm end function
function movementView(s,ms,goal,tfl,distance) return [20.0,0.0,0.0] end function
function make()
 ctx=Context([],false,false,0.0,false,0,100.0,combat.TargetEntityInfo(1,0,0,true,[100.0,0.0,0.0],[0.0,0.0,0.0],[100.0,0.0,0.0],0.1),true,false,false,true,0,0,0.8,0.0)
 cs=combat.create();cs.context=ctx;cs.maxclients=1;cs.floatTimeFn=clock;cs.entityInfoFn=entity;cs.entityDeadFn=dead;cs.sameTeamFn=same;cs.visibleFn=visible;cs.characteristicFloatFn=characteristic;cs.randomFn=random;cs.traceFn=trace;cs.weaponInfoFn=weapon;cs.attackFn=attack;cs.setupMovementFn=setupMove;cs.moveToGoalFn=moveGoal;cs.moveDirectionFn=moveDir;cs.pointContentsFn=pointContents
 s=fight.create(cs);s.context=ctx;s.observerFn=observer;s.recordNodeFn=record;s.resetLastAvoidFn=resetLast;s.enterNodeFn=enter;s.chatEnemySuicideFn=voidBot;s.chatKillFn=boolBot;s.chatHitNoDeathFn=boolBot;s.chatHitNoKillFn=boolBot;s.chatTimeFn=clock;s.pointAreaFn=pointArea;s.areaReachableFn=reachable;s.updateBattleFn=updateBattle;s.battleUseItemsFn=voidBot;s.chooseWeaponFn=choose;s.blockedFn=blocked;s.resetAvoidFn=resetAvoid;s.mapScriptsFn=mapScripts;s.touchingGoalFn=touching;s.nearbyGoalFn=nearby;s.topGoalFn=topGoal;s.popGoalFn=popGoal;s.reachedGoalFn=reachedGoal;s.emptyGoalStackFn=emptyGoals;s.teamGoalsFn=teamGoals;s.longTermGoalFn=longTerm;s.movementViewTargetFn=movementView
 b=bots.createBot(0);b.curPs=ps.create();b.enemy=1;b.ms=9;b.gs=10;b.ws=4;b.inventory[combat.INVENTORY_HEALTH]=20;b.lastHealth=20;b.lastframeHealth=20;b.origin=[0.0,0.0,0.0];b.eye=[0.0,0.0,0.0];b.aimTarget=[100.0,0.0,0.0];b.viewangles=[0.0,0.0,0.0];b.lastEnemyAreaNum=7;b.lastEnemyOrigin=[100.0,0.0,0.0];b.chaseTime=100.0;b.enemyVisibleTime=100.0;b.nbgTime=110.0
 return [s,b,ctx]
end function
function contracts()
 count=0;x=make();s=x[0];b=x[1];fight.enterRetreat(s,b,"r");count=count+require(b.aiNode==fight.NODE_RETREAT,"enter retreat")
 x=make();s=x[0];b=x[1];fight.enterNbg(s,b,"n");count=count+require(b.aiNode==fight.NODE_NBG,"enter NBG")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.observer=true;count=count+require(not fight.chaseNode(s,b) and b.aiNode==fight.NODE_OBSERVER,"chase observer")
 x=make();s=x[0];b=x[1];b.enemy=-1;count=count+require(not fight.chaseNode(s,b) and b.aiNode==fight.NODE_SEEK,"chase no enemy")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;count=count+require(not fight.chaseNode(s,b) and b.aiNode==fight.NODE_FIGHT,"chase sees enemy")
 x=make();s=x[0];b=x[1];b.lastEnemyAreaNum=0;count=count+require(not fight.chaseNode(s,b) and b.aiNode==fight.NODE_SEEK,"chase no enemy area")
 x=make();s=x[0];b=x[1];b.chaseTime=89.0;count=count+require(not fight.chaseNode(s,b) and b.aiNode==fight.NODE_SEEK,"chase timeout")
 x=make();s=x[0];b=x[1];ctx=x[2];b.checkTime=99.0;ctx.nearby=true;count=count+require(not fight.chaseNode(s,b) and b.aiNode==fight.NODE_NBG and b.nbgTime==116.0,"chase nearby goal")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.movementFlags=fight.MOVERESULT_MOVEMENTWEAPON;ctx.movementWeapon=7;count=count+require(fight.chaseNode(s,b) and b.weaponnum==7,"chase movement weapon")
 x=make();s=x[0];b=x[1];ctx=x[2];m=combat.MoveResult(false,4,0,[1.0,0.0,0.0],[10.0,20.0,30.0]);fight.setMovementView(s,b,m,combat.CombatGoal(0,12,[12.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]),false,true,false);count=count+require(b.idealViewangles!=[10.0,20.0,30.0],"bit 4 is not movement-view-set")
 x=make();s=x[0];b=x[1];ctx=x[2];m=combat.MoveResult(false,8,0,[1.0,0.0,0.0],[10.0,20.0,30.0]);fight.setMovementView(s,b,m,combat.CombatGoal(0,12,[12.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]),false,true,false);count=count+require(b.idealViewangles==[10.0,20.0,30.0],"bit 8 is movement-view-set")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.dead=true;count=count+require(not fight.retreatNode(s,b) and b.aiNode==fight.NODE_SEEK,"retreat dead enemy")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;b.inventory[combat.INVENTORY_HEALTH]=100;b.inventory[combat.INVENTORY_ROCKETLAUNCHER]=1;b.inventory[combat.INVENTORY_ROCKETS]=6;count=count+require(not fight.retreatNode(s,b) and b.aiNode==fight.NODE_CHASE,"retreat wants chase")
 x=make();s=x[0];b=x[1];b.enemyVisibleTime=90.0;count=count+require(not fight.retreatNode(s,b) and b.aiNode==fight.NODE_SEEK,"retreat lost enemy")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;ctx.longterm=false;count=count+require(not fight.retreatNode(s,b) and b.aiNode==fight.NODE_FIGHT and (b.combatFlags&fight.BFL_FIGHTSUICIDAL)!=0,"retreat no way out")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;b.checkTime=99.0;ctx.nearby=true;count=count+require(not fight.retreatNode(s,b) and b.aiNode==fight.NODE_NBG and b.nbgTime==102.5,"retreat nearby goal")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;b.checkTime=99.0;ctx.nearby=true;s.combatServices.gametype=combat.GT_CTF;b.inventory[combat.INVENTORY_REDFLAG]=1;count=count+require(not fight.retreatNode(s,b) and ctx.nearbyRange==50.0 and b.nbgTime==101.5,"flag carrier retreat NBG range")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;count=count+require(fight.retreatNode(s,b) and ctx.attacks==1,"retreat full move and attack")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;ctx.ent.origin=[100.0,0.0,100.0];ok=fight.retreatNode(s,b);pitch=b.idealViewangles[0];if pitch<0.0 then pitch=0.0-pitch end if;count=count+require(ok and pitch>40.0 and pitch<60.0,"skilled retreat aim keeps pitch")
 x=make();s=x[0];b=x[1];b.enemy=-1;count=count+require(not fight.nbgNode(s,b) and b.aiNode==fight.NODE_SEEK_NBG,"NBG no enemy")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.dead=true;count=count+require(not fight.nbgNode(s,b) and b.aiNode==fight.NODE_SEEK_NBG,"NBG dead enemy")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.topExists=false;count=count+require(not fight.nbgNode(s,b) and b.aiNode==fight.NODE_FIGHT,"NBG empty goal timeout")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.movementFlags=fight.MOVERESULT_MOVEMENTVIEW;count=count+require(fight.nbgNode(s,b) and b.idealViewangles==[10.0,20.0,30.0] and ctx.attacks==1,"NBG full move view attack")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.visible=1.0;ctx.ent.origin=[100.0,0.0,100.0];ok=fight.nbgNode(s,b);pitch=b.idealViewangles[0];if pitch<0.0 then pitch=0.0-pitch end if;count=count+require(ok and pitch>40.0 and pitch<60.0,"skilled NBG aim keeps pitch")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" battle chase/retreat/NBG contracts\n");return 0 end function
