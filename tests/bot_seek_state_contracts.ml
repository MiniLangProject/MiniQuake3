// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_seek_state as seek
import mq3.game.bot_fight_state as fight
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_navigation as nav
import mq3.game.bot_lifecycle as bots
import mq3.game.bot_ai_frame as frame
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.collision.world as cm
import mq3.qcommon.cvar as cv
import std.fs as fs

struct Context events now enemy nearby predict moveFailure flags randomValue end struct
function require(v,label) if not v then return error(499,"Seek state contract: "+label) end if return 1 end function
function event(s,x) s.context.events=s.context.events+[x];return void end function
function clock(s) return s.context.now end function
function random(s) return s.context.randomValue end function
function targetEntity(s,index) if index==1 and s.context.enemy then return combat.TargetEntityInfo(1,0,0,true,[100.0,0.0,0.0],[0.0,0.0,0.0],[100.0,0.0,0.0],0.1) end if return combat.TargetEntityInfo(0,0,0,false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0.0) end function
function neverDead(s,e) return false end function
function same(s,b,index) return false end function
function visible(s,v,e,a,f,index) return 1.0 end function
function characteristic(s,ch,index,lo,hi) if index==combat.CHARACTERISTIC_ALERTNESS then return 1.0 end if;if index==combat.CHARACTERISTIC_EASY_FRAGGER then return 0.5 end if;return 0.0 end function
function combatContents(s,p) return 0 end function
function observer(s,b) return false end function
function yesObserver(s,b) return true end function
function fightObserver(s,b) return b.aiNode==fight.NODE_FIGHT end function
function record(s,b,node,goal,reason) event(s,"record:"+node+":"+goal);return void end function
function enter(s,b,node,reason) event(s,"enter:"+str(node));if node==fight.NODE_OBSERVER then b.inuse=false end if;return void end function
function resetLast(s,ms) return event(s,"reset-last") end function
function top(s,gs) return [true,nav.Goal(9,0,[20.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,17,0)] end function
function noTop(s,gs) return [false,nav.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)] end function
function goalName(s,num) return "rocket" end function
function noChat(s,b) return false end function
function yesChat(s,b) return true end function
function chatTime(s,b) return 2.0 end function
function mapScripts(s,b) return event(s,"map") end function
function gesture(s,client) return event(s,"gesture") end function
function empty(s,gs) return event(s,"empty") end function
function teamGoals(s,b,retreat) return event(s,"team") end function
function ltg(s,b,tfl,retreat,g) g.areanum=9;g.origin=[20.0,0.0,0.0];return true end function
function noLtg(s,b,tfl,retreat,g) return false end function
function camp(s,b) return event(s,"camp") end function
function nearby(s,b,tfl,g,range) s.context.events=s.context.events+["range:"+str(range)];return s.context.nearby end function
function seekNbg(s,b,reason) b.aiNode=seek.NODE_SEEK_NBG;return event(s,"nbg") end function
function noReached(s,b,g) return false end function
function yesReached(s,b,g) return true end function
function second(s,gs) return [false,nav.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)] end function
function pop(s,gs) return event(s,"pop") end function
function choose(s,b) b.weaponnum=7;return event(s,"choose") end function
function resetState(s,b) return event(s,"reset-state") end function
function yesChatEvent(s,b) return true end function
function noChatEvent(s,b) return false end function
function enterChat(s,b,target) return event(s,"chat:"+str(target)) end function
function talk(s,client) return event(s,"talk") end function
function respawn(s,client) return event(s,"respawn") end function
function resetMove(s,handle) return event(s,"reset-move") end function
function resetGoal(s,handle) return event(s,"reset-goal") end function
function resetAvoidGoals(s,handle) return event(s,"reset-avoid-goals") end function
function enableRoute(s,area,enable) return event(s,"route:"+str(enable)) end function
function noActivateTrace(s,b,a) return false end function
function yesActivateTrace(s,b,a) return true end function
function noActivateTouch(s,p,g) return false end function
function yesActivateTouch(s,p,g) return true end function
function activateOrigin(s,entitynum) return [0.0,0.0,0.0] end function
function attack(s,client) return event(s,"attack") end function
function selectActivate(s,b) return 6 end function
function predict(s,b,g) event(s,"predict");return s.context.predict end function
function setup(s,b) return event(s,"setup") end function
function move(s,ms,g,tfl) event(s,"move");return combat.MoveResult(s.context.moveFailure,s.context.flags,6,[2.0,0.0,0.0],[10.0,20.0,30.0]) end function
function resetAvoid(s,ms) return event(s,"reset-avoid") end function
function blocked(s,b,m,activate) return event(s,"blocked:"+str(activate)) end function
function clear(s,b,m) return event(s,"clear") end function
function moveTarget(s,ms,g,tfl,distance) return [11.0,3.0,1.0] end function
function roam(s,b) event(s,"roam");return [5.0,4.0,3.0] end function
function make()
 ctx=Context([],100.0,false,false,false,false,0,0.5);cs=combat.create();cs.context=ctx;cs.maxclients=2;cs.floatTimeFn=clock;cs.randomFn=random;cs.entityInfoFn=targetEntity;cs.entityDeadFn=neverDead;cs.sameTeamFn=same;cs.visibleFn=visible;cs.characteristicFloatFn=characteristic;cs.pointContentsFn=combatContents
 fs=fight.create(cs);fs.context=ctx;fs.observerFn=fightObserver;fs.recordNodeFn=record;fs.resetLastAvoidFn=resetLast;fs.enterNodeFn=enter
 ns=nav.create();ns.context=ctx;ns.floatTimeFn=clock;ns.enableRoutingAreaFn=enableRoute;s=seek.create(fs,ns);s.context=ctx;s.observerFn=observer;s.recordNodeFn=record;s.enterNodeFn=enter;s.topGoalFn=top;s.goalNameFn=goalName;s.randomChatFn=noChat;s.chatTimeFn=chatTime;s.mapScriptsFn=mapScripts;s.gestureFn=gesture;s.emptyGoalStackFn=empty;s.teamGoalsFn=teamGoals;s.longTermGoalFn=ltg;s.wantsCampFn=camp;s.nearbyGoalFn=nearby;s.resetLastAvoidFn=resetLast;s.enterSeekNbgFn=seekNbg;s.predictObstaclesFn=predict;s.setupMovementFn=setup;s.moveToGoalFn=move;s.resetAvoidFn=resetAvoid;s.blockedFn=blocked;s.clearPathFn=clear;s.movementViewTargetFn=moveTarget;s.roamGoalFn=roam
 s.reachedGoalFn=noReached;s.secondGoalFn=second;s.popGoalFn=pop;s.chooseWeaponFn=choose;s.resetStateFn=resetState;s.endLevelChatFn=noChatEvent;s.startLevelChatFn=noChatEvent;s.hitTalkingChatFn=noChatEvent;s.deathChatFn=noChatEvent;s.enterChatFn=enterChat;s.talkFn=talk;s.respawnFn=respawn;s.resetMoveStateFn=resetMove;s.resetGoalStateFn=resetGoal;s.resetAvoidGoalsFn=resetAvoidGoals;s.activateTraceFn=noActivateTrace;s.activateTouchFn=noActivateTouch;s.activateOriginFn=activateOrigin;s.attackFn=attack;s.selectActivateWeaponFn=selectActivate
 b=bots.createBot(0);b.curPs=ps.create();b.ms=4;b.gs=3;b.thinktime=0.1;b.origin=[1.0,0.0,0.0];b.inventory[combat.INVENTORY_HEALTH]=100;b.inventory[combat.INVENTORY_ROCKETLAUNCHER]=1;b.inventory[combat.INVENTORY_ROCKETS]=6
 return [s,b,ctx]
end function
function has(a,x) for each y in a if y==x then return true end if end for return false end function

function noop(s) return void end function
function noopName(s,x) return void end function
function usercmd(s,c,u) return event(s,"usercmd") end function
function aas(s) return true end function
function aasTime(s) return 100.0 end function
function libstart(s,t) return void end function
function updateEntity(s,i,e) return void end function
function nextCommand(s,c) return void end function
function snapshot(s,c,q) return -1 end function
function resetInput(s,c) return event(s,"reset-input") end function
function setupDm(s) return event(s,"deathmatch") end function
function input(s,b,u,t,e) return void end function
function frameFixture(world,seekServices,b)
 level=game.create(world);state=bots.create(cv.create());f=frame.create(state);f.context=seekServices.context;f.checkSpawnFn=noop;f.updateCvarFn=noopName;f.userCommandFn=usercmd;f.interbreedFn=noop;f.scheduleThinkFn=noop;f.botLibStartFrameFn=libstart;f.aasInitializedFn=aas;f.updateEntityFn=updateEntity;f.floatTimeFn=clock;f.updateEntityItemsFn=noop;f.aasTimeFn=aasTime;f.updateInputFn=input;f.snapshotEntityFn=snapshot;f.seekServices=seekServices
 c=f.commandServices;c.context=seekServices.context;c.resetInputFn=resetInput;c.nextServerCommandFn=nextCommand;c.queueMessageFn=void;c.deathmatchSetupFn=setupDm
 state.botstates[0]=b;level.entities[0].inuse=true;level.entities[0].client=level.clients[0];level.clients[0].connected=2;state.thinktime.integer=100;return [level,f]
end function

function contracts(world)
 count=0;x=make();s=x[0];b=x[1];ctx=x[2];seek.enterSeek(s,b,"go");count=count+require(b.aiNode==seek.NODE_SEEK and ctx.events==["record:seek LTG:rocket"],"entry names top goal")
 x=make();s=x[0];b=x[1];s.topGoalFn=noTop;seek.enterSeek(s,b,"go");count=count+require(x[2].events==["record:seek LTG:no goal"],"entry reports empty goal stack")
 x=make();s=x[0];b=x[1];s.randomChatFn=yesChat;count=count+require(not seek.seekNode(s,b) and b.aiNode==seek.NODE_STAND and b.standTime==102.0,"random chat enters stand")
 x=make();s=x[0];b=x[1];ctx=x[2];b.killedEnemyTime=99.0;ctx.randomValue=0.01;count=count+require(seek.seekNode(s,b) and has(ctx.events,"gesture"),"recent kill gesture")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.enemy=true;b.inventory[combat.INVENTORY_HEALTH]=20;count=count+require(not seek.seekNode(s,b) and b.aiNode==fight.NODE_RETREAT,"enemy acquisition enters retreat")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.enemy=true;count=count+require(not seek.seekNode(s,b) and b.aiNode==fight.NODE_FIGHT and has(ctx.events,"empty") and has(ctx.events,"reset-last"),"enemy acquisition enters fight")
 x=make();s=x[0];b=x[1];s.longTermGoalFn=noLtg;count=count+require(seek.seekNode(s,b) and has(x[2].events,"team"),"missing LTG keeps node")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.nearby=true;b.ltgtype=seek.LTG_DEFENDKEYAREA;count=count+require(not seek.seekNode(s,b) and b.aiNode==seek.NODE_SEEK_NBG and b.nbgTime==108.0,"defense nearby range")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.nearby=true;s.fightServices.combatServices.gametype=combat.GT_CTF;b.inventory[combat.INVENTORY_REDFLAG]=1;count=count+require(not seek.seekNode(s,b) and b.nbgTime==104.5,"flag carrier nearby range")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.predict=true;count=count+require(not seek.seekNode(s,b) and not has(ctx.events,"move"),"predicted obstacle changes node")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.moveFailure=true;count=count+require(seek.seekNode(s,b) and b.ltgTime==0.0 and has(ctx.events,"reset-avoid") and has(ctx.events,"blocked:true") and has(ctx.events,"clear"),"movement failure and path handling")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.flags=seek.MOVERESULT_WAITING;ctx.randomValue=0.01;count=count+require(seek.seekNode(s,b) and has(ctx.events,"roam") and b.idealViewangles!=[10.0,20.0,30.0],"bit 4 is waiting, not movement-view-set")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.flags=seek.MOVERESULT_MOVEMENTVIEWSET;count=count+require(seek.seekNode(s,b) and b.idealViewangles==[10.0,20.0,30.0],"bit 8 copies movement-set view")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.flags=seek.MOVERESULT_MOVEMENTWEAPON;count=count+require(seek.seekNode(s,b) and b.weaponnum==6,"bit 16 selects movement weapon")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.flags=seek.MOVERESULT_MOVEMENTVIEW|seek.MOVERESULT_MOVEMENTWEAPON;count=count+require(seek.seekNode(s,b) and b.idealViewangles==[10.0,20.0,30.0] and b.weaponnum==6,"movement view and weapon")
 x=make();s=x[0];b=x[1];ctx=x[2];b.aiNode=seek.NODE_SEEK;count=count+require(seek.runNode(s,b) and has(ctx.events,"move"),"dispatcher executes seek")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.enemy=true;b.aiNode=seek.NODE_SEEK;pair=frameFixture(world,s,b);count=count+require(frame.startFrame(pair[0],pair[1],100),"startFrame completes seek dispatch");count=count+require(has(ctx.events,"record:battle fight:") and has(ctx.events,"enter:5"),"startFrame dispatches enemy seek through Battle_Fight")
 x=make();s=x[0];b=x[1];ctx=x[2];seek.enterSeekNbg(s,b,"near");count=count+require(b.aiNode==seek.NODE_SEEK_NBG and has(ctx.events,"record:seek NBG:rocket"),"seek NBG entry names goal")
 x=make();s=x[0];b=x[1];ctx=x[2];b.aiNode=seek.NODE_SEEK_NBG;b.nbgTime=99.0;count=count+require(not seek.runNode(s,b) and b.aiNode==seek.NODE_SEEK and b.checkTime>100.0 and has(ctx.events,"pop"),"seek NBG timeout returns LTG")
 x=make();s=x[0];b=x[1];ctx=x[2];s.reachedGoalFn=yesReached;b.nbgTime=110.0;count=count+require(not seek.seekNbgNode(s,b) and b.weaponnum==7 and has(ctx.events,"choose"),"reached NBG chooses weapon then expires")
 x=make();s=x[0];b=x[1];ctx=x[2];b.nbgTime=110.0;ctx.moveFailure=true;count=count+require(seek.seekNbgNode(s,b) and b.nbgTime==0.0 and has(ctx.events,"reset-avoid"),"seek NBG movement failure")
 x=make();s=x[0];b=x[1];ctx=x[2];b.nbgTime=110.0;ctx.enemy=true;b.inventory[combat.INVENTORY_HEALTH]=20;count=count+require(seek.seekNbgNode(s,b) and b.aiNode==fight.NODE_NBG,"seek NBG enemy retreat enters battle NBG")
 x=make();s=x[0];b=x[1];ctx=x[2];seek.enterStand(s,b,"chat");count=count+require(b.standFindEnemyTime==101.0 and b.aiNode==seek.NODE_STAND,"stand entry deadline")
 x=make();s=x[0];b=x[1];ctx=x[2];b.standFindEnemyTime=99.0;b.standTime=110.0;ctx.enemy=true;count=count+require(not seek.standNode(s,b) and b.aiNode==fight.NODE_FIGHT,"stand finds enemy")
 x=make();s=x[0];b=x[1];ctx=x[2];b.standFindEnemyTime=110.0;b.standTime=99.0;count=count+require(not seek.standNode(s,b) and b.aiNode==seek.NODE_SEEK and has(ctx.events,"talk") and has(ctx.events,"chat:0"),"stand talks then times out")
 x=make();s=x[0];b=x[1];ctx=x[2];s.observerFn=yesObserver;seek.enterObserver(s,b,"obs");count=count+require(b.aiNode==seek.NODE_OBSERVER and has(ctx.events,"reset-state"),"observer entry resets state")
 x=make();s=x[0];b=x[1];ctx=x[2];b.aiNode=seek.NODE_OBSERVER;count=count+require(seek.observerNode(s,b) and b.aiNode==seek.NODE_STAND,"observer exit enters stand")
 x=make();s=x[0];b=x[1];ctx=x[2];seek.enterIntermission(s,b,"end");count=count+require(b.aiNode==seek.NODE_INTERMISSION and has(ctx.events,"reset-state"),"intermission entry resets state")
 x=make();s=x[0];b=x[1];ctx=x[2];b.aiNode=seek.NODE_INTERMISSION;count=count+require(seek.intermissionNode(s,b) and b.aiNode==seek.NODE_STAND and b.standTime==102.0,"intermission exit waits two seconds")
 x=make();s=x[0];b=x[1];ctx=x[2];seek.enterRespawn(s,b,"dead");count=count+require(b.aiNode==seek.NODE_RESPAWN and b.respawnTime==101.5 and not b.respawnWait and has(ctx.events,"reset-move") and has(ctx.events,"reset-goal"),"respawn entry resets and delays")
 x=make();s=x[0];b=x[1];ctx=x[2];b.curPs.pm_type=3;b.respawnTime=99.0;count=count+require(seek.respawnNode(s,b) and b.respawnWait and has(ctx.events,"respawn"),"respawn action after deadline")
 x=make();s=x[0];b=x[1];ctx=x[2];seek.enterActivate(s,b,"door");count=count+require(b.aiNode==seek.NODE_ACTIVATE and has(ctx.events,"record:activate entity:"),"activate entry")
 x=make();s=x[0];b=x[1];ctx=x[2];b.aiNode=seek.NODE_ACTIVATE;count=count+require(not seek.runNode(s,b) and b.aiNode==seek.NODE_SEEK_NBG,"activate without stack returns NBG")
 x=make();s=x[0];b=x[1];ctx=x[2];heap=nav.ensureActivateHeap(b);a=nav.emptyActivateGoal();a.inuse=true;a.time=110.0;a.goal.entitynum=8;heap[0]=a;b.activateStackIndex=0;count=count+require(seek.activateNode(s,b) and has(ctx.events,"move") and has(ctx.events,"blocked:true") and has(ctx.events,"clear"),"activate moves to touch goal")
 x=make();s=x[0];b=x[1];ctx=x[2];s.activateTouchFn=yesActivateTouch;heap=nav.ensureActivateHeap(b);a=nav.emptyActivateGoal();a.inuse=true;a.time=110.0;heap[0]=a;b.activateStackIndex=0;count=count+require(not seek.activateNode(s,b) and b.activateStackIndex==-1 and b.aiNode==seek.NODE_SEEK_NBG,"touch activates and pops goal")
 x=make();s=x[0];b=x[1];ctx=x[2];s.activateTraceFn=yesActivateTrace;heap=nav.ensureActivateHeap(b);a=nav.emptyActivateGoal();a.inuse=true;a.time=110.0;a.shoot=true;a.weapon=6;a.target=[100.0,0.0,0.0];heap[0]=a;b.activateStackIndex=0;b.curPs.weapon=6;count=count+require(seek.activateNode(s,b) and has(ctx.events,"attack") and b.weaponnum==6,"visible shoot activation attacks and selects weapon")
 x=make();s=x[0];b=x[1];ctx=x[2];ctx.enemy=true;heap=nav.ensureActivateHeap(b);a=nav.emptyActivateGoal();a.inuse=true;a.time=110.0;heap[0]=a;b.activateStackIndex=0;count=count+require(seek.activateNode(s,b) and b.aiNode==fight.NODE_FIGHT and b.activateStackIndex==-1,"activate enemy transition clears stack")
 return count
end function
function main(args) world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world);print("PASS: "+str(count)+" seek-LTG state contracts\n");return 0 end function
