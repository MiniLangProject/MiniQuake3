// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_navigation as nav
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
import mq3.compat.numeric as n

struct Context init handle direction speed movetype moves now route predicts model entity bspent activation stackInUse clears going goes enables randomValue travelResult travels routing enters caseId calls camper aggression removals end struct
function require(value,label) if not value then return error(499,"Bot navigation contract: "+label) end if return 1 end function
function initMove(s,h,m) s.context.init=m;s.context.handle=h;return void end function
function move(s,h,d,speed,kind) s.context.handle=h;s.context.direction=d;s.context.speed=speed;s.context.movetype=kind;s.context.moves=s.context.moves+1;return true end function
function randomValue(s) return s.context.randomValue end function
function floatTime(s) return s.context.now end function
function route(s,area,origin,goal,tfl,maxareas,maxtime,events,contents,travel,stoparea) s.context.predicts=s.context.predicts+1;return s.context.route end function
function model(s,modelnum,kind,contents) s.context.model=modelnum;return s.context.entity end function
function activate(s,bot,entity) return [s.context.bspent,s.context.activation] end function
function stack(s,bot) return s.context.stackInUse end function
function clear(s,bot) s.context.clears=s.context.clears+1;return void end function
function going(s,bot,entity) return s.context.going end function
function go(s,bot,goal) s.context.goes=s.context.goes+1;return void end function
function enable(s,goal,value) s.context.enables=s.context.enables+1;return void end function
function travel(s,area,origin,goal,tfl) s.context.travels=s.context.travels+1;return s.context.travelResult end function
function routing(s,area,enable) s.context.routing=s.context.routing+[str(area)+":"+str(enable)];return void end function
function entityInfo(s,entity) if s.context.caseId==0 then return nav.EntityInfo([7.0,8.0,9.0],0) end if return nav.EntityInfo([0.0,0.0,0.0],3) end function
function enterNode(s,bot,label) s.context.enters=s.context.enters+1;return void end function
function nextBsp(s,after) if after<3 then return after+1 end if return 0 end function
function bspString(s,entity,name)
  caseId=s.context.caseId
  if entity==1 and name=="model" then if caseId==1 then return [true,"*4"] end if return [true,"*3"] end if
  if entity==1 and name=="classname" then return [true,"func_door"] end if
  if entity==1 and name=="targetname" then return [true,"A"] end if
  if entity==2 and name=="target" then return [true,"A"] end if
  if entity==2 and name=="classname" then if caseId==6 then return [true,"target_relay"] end if;if caseId==7 then return [true,"func_timer"] end if;return [true,"func_button"] end if
  if entity==2 and name=="targetname" and caseId==6 then return [true,"B"] end if
  if entity==3 and name=="target" and caseId==6 then return [true,"B"] end if
  if entity==3 and name=="classname" and caseId==6 then return [true,"trigger_multiple"] end if
  return [false,""]
end function
function bspFloat(s,entity,name) if s.context.caseId==2 and name=="health" then return [true,10.0] end if return [false,0.0] end function
function bspInt(s,entity,name) if s.context.caseId==3 then return [true,1] end if return [true,0] end function
function bspVector(s,entity,name) if s.context.caseId==4 then return [true,[1.0,0.0,0.0]] end if return [true,[0.0,0.0,0.0]] end function
function doorGoal(s,bot,entity,goal) s.context.calls=s.context.calls+["door"];goal.goal.entitynum=70;return true end function
function buttonGoal(s,bot,entity,goal) s.context.calls=s.context.calls+["button"];goal.goal.areanum=20;goal.goal.entitynum=80;return true end function
function triggerGoal(s,bot,entity,goal) s.context.calls=s.context.calls+["trigger"];goal.goal.areanum=30;goal.goal.entitynum=90;return true end function
function modelBounds(s,model,kind,contents) return [71,[-10.0,-10.0,-10.0],[10.0,10.0,10.0]] end function
function bboxAreas(s,mins,maxs,limit) return [10,11,12] end function
function reachable(s,area) if area==11 then return false end if return true end function
function areaContents(s,area) if area==12 then return 0 end if return nav.AREACONTENTS_MOVER end function
function diagnostic(s,kind,value) s.context.calls=s.context.calls+[kind];return void end function
function characteristic(s,ch,index,low,high) return s.context.camper end function
function aggression(s,bot) return s.context.aggression end function
function nextCamp(s,cursor) if cursor==0 then return [1,nav.Goal(10,0,[10.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,1,0)] end if return [0,nav.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)] end function
function levelItem(s,number,name) if number<0 then return [0,nav.Goal(1,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,100,0)] end if return [-1,nav.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)] end function
function removeAvoid(s,handle,number) s.context.removals=s.context.removals+[number];return void end function
function services()
  activation=nav.ActivateGoal(false,0.0,0.0,0.0,[0.0,0.0,0.0],nav.Goal(0,88,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0),0,[],false,-1,false,0,[0.0,0.0,0.0])
  s=nav.create();s.context=Context(void,0,void,0.0,0,0,20.0,nav.Route(0,0),0,0,0,0,activation,true,0,false,0,0,0.25,0,0,[],0,0,[],0.5,60.0,[])
  s.initMoveStateFn=initMove;s.moveInDirectionFn=move;s.randomFn=randomValue;s.floatTimeFn=floatTime;s.predictRouteFn=route;s.modelEntityFn=model;s.getActivateGoalFn=activate;s.activationStackInUseFn=stack;s.clearActivationStackFn=clear;s.isGoingToActivateFn=going;s.goForActivateGoalFn=go;s.enableActivateGoalAreasFn=enable;s.areaTravelTimeFn=travel;s.enableRoutingAreaFn=routing;s.entityInfoFn=entityInfo;s.enterActivateNodeFn=enterNode;s.nextBspEntityFn=nextBsp;s.stringKeyFn=bspString;s.floatKeyFn=bspFloat;s.intKeyFn=bspInt;s.vectorKeyFn=bspVector;s.doorActivateGoalFn=doorGoal;s.buttonActivateGoalFn=buttonGoal;s.triggerActivateGoalFn=triggerGoal;s.modelBoundsFn=modelBounds;s.bboxAreasFn=bboxAreas;s.areaReachabilityFn=reachable;s.areaContentsFn=areaContents;s.diagnosticFn=diagnostic;s.characteristicFn=characteristic;s.aggressionFn=aggression;s.nextCampSpotFn=nextCamp;s.levelItemGoalFn=levelItem;s.removeAvoidGoalFn=removeAvoid;return s
end function
function bot()
  b=bots.createBot(8);b.entitynum=9;b.ms=44;b.curPs=ps.create();b.curPs.origin=[1.0,2.0,3.0];b.curPs.velocity=[4.0,5.0,6.0];b.curPs.viewheight=26;b.viewangles=[10.0,20.0,30.0];b.thinktime=0.125;return b
end function
function contracts()
  count=0;s=services();b=bot();b.curPs.groundEntityNum=7;b.curPs.pm_flags=nav.PMF_DUCKED|nav.PMF_TIME_KNOCKBACK|nav.PMF_TIME_WATERJUMP;b.curPs.pm_time=1;b.walker=0.75;m=nav.setupForMovement(s,b)
  count=count+require(s.context.handle==44 and m.entitynum==9 and m.client==8,"movement state identity")
  count=count+require(m.origin==[1.0,2.0,3.0] and m.velocity==[4.0,5.0,6.0],"movement vectors copied")
  count=count+require(m.viewoffset==[0.0,0.0,26.0] and m.viewangles==[10.0,20.0,30.0],"view state copied")
  count=count+require(m.orMoveflags==(nav.MFL_ONGROUND|nav.MFL_TELEPORTED|nav.MFL_WATERJUMP|nav.MFL_WALK),"all movement flags")
  count=count+require(m.presencetype==nav.PRESENCE_CROUCH and m.thinktime==0.125,"crouch and think time")
  s=services();b=bot();b.curPs.groundEntityNum=nav.ENTITYNUM_NONE;b.curPs.pm_flags=nav.PMF_TIME_KNOCKBACK;b.curPs.pm_time=0;b.walker=0.5;m=nav.setupForMovement(s,b)
  count=count+require(m.orMoveflags==0 and m.presencetype==nav.PRESENCE_NORMAL,"air normal threshold")
  count=count+require(nav.setMovedir([0.0,-1.0,0.0])==[0.0,0.0,1.0],"special up direction")
  count=count+require(nav.setMovedir([0.0,-2.0,0.0])==[0.0,0.0,-1.0],"special down direction")
  d=nav.setMovedir([0.0,90.0,0.0]);count=count+require(n.floatBits(d[0])==0xb33bbd2e and n.floatBits(d[1])==0x3f800000,"yaw direction binary32")
  s=services();b=bot();r=nav.MoveResult(true,false,0,0,0,[0.0,0.0,0.0]);nav.randomMove(s,b,r)
  count=count+require(s.context.moves==1 and s.context.handle==44 and s.context.speed==400.0 and s.context.movetype==nav.MOVE_WALK,"random move service call")
  count=count+require(not r.failure and n.floatBits(r.movedir[1])==0x3f800000,"random move result")
  s=services();b=bot();g=nav.Goal(5,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0);count=count+require(not nav.predictObstacles(s,b,g,false) and s.context.predicts==0,"prediction cvar gate")
  s=services();b=bot();b.predictobstaclesGoalareanum=5;b.predictobstaclesTime=15.0;count=count+require(not nav.predictObstacles(s,b,g,true) and s.context.predicts==0 and b.predictobstaclesTime==15.0,"prediction cache gate")
  s=services();b=bot();s.context.route=nav.Route(nav.RSE_ENTERCONTENTS,3<<nav.AREACONTENTS_MODELNUMSHIFT);count=count+require(not nav.predictObstacles(s,b,g,true) and s.context.predicts==1,"route without mover")
  count=count+require(b.predictobstaclesGoalareanum==5 and b.predictobstaclesTime==20.0,"prediction timestamp update")
  s=services();b=bot();s.context.route=nav.Route(nav.RSE_ENTERCONTENTS,nav.AREACONTENTS_MOVER|(3<<nav.AREACONTENTS_MODELNUMSHIFT));s.context.entity=71;s.context.bspent=4;s.context.going=false
  count=count+require(nav.predictObstacles(s,b,g,true) and s.context.model==3,"mover model extraction")
  count=count+require(s.context.goes==1 and s.context.enables==0,"new activation goal")
  s=services();b=bot();s.context.route=nav.Route(nav.RSE_ENTERCONTENTS,nav.AREACONTENTS_MOVER|(3<<nav.AREACONTENTS_MODELNUMSHIFT));s.context.entity=71;s.context.bspent=4;s.context.going=true;s.context.stackInUse=false
  count=count+require(not nav.predictObstacles(s,b,g,true) and s.context.clears==1 and s.context.enables==1,"existing activation re-enables areas")
  s=services();b=bot();ordinary=nav.Goal(9,7,[9.0,8.0,7.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],2,3,4)
  count=count+require(nav.alternateRoute(s,b,ordinary)==ordinary and s.context.travels==0,"no alternate route preserves goal")
  b.altRouteGoal=nav.Goal(12,0,[1.0,2.0,3.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,0,0);b.reachedAltRouteGoalTime=5.0
  count=count+require(nav.alternateRoute(s,b,ordinary)==ordinary and s.context.travels==0,"reached alternate route preserves goal")
  b.reachedAltRouteGoalTime=0.0;s.context.travelResult=30;selected=nav.alternateRoute(s,b,ordinary)
  count=count+require(selected==b.altRouteGoal and ordinary.areanum==12 and ordinary.origin==[1.0,2.0,3.0],"far alternate route selected and copied")
  count=count+require(b.reachedAltRouteGoalTime==0.0 and s.context.travels==1,"far alternate route remains active")
  s=services();b=bot();b.altRouteGoal=nav.Goal(13,0,[4.0,5.0,6.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,0,0);s.context.travelResult=19;ordinary=nav.Goal(1,1,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0);nav.alternateRoute(s,b,ordinary)
  count=count+require(b.reachedAltRouteGoalTime==20.0 and ordinary.areanum==13,"near alternate route records arrival")
  red=[nav.Goal(21,0,[10.0,11.0,12.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0),nav.Goal(22,0,[20.0,21.0,22.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)];blue=[nav.Goal(31,0,[30.0,31.0,32.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)]
  s=services();b=bot();count=count+require(not nav.getAlternateRouteGoal(s,b,nav.TEAM_RED,[],blue),"empty route set rejected")
  s.context.randomValue=0.75;count=count+require(nav.getAlternateRouteGoal(s,b,nav.TEAM_RED,red,blue) and b.altRouteGoal.areanum==22,"red route random selection")
  count=count+require(b.altRouteGoal.origin==[20.0,21.0,22.0] and b.altRouteGoal.mins==[-8.0,-8.0,-8.0] and b.altRouteGoal.maxs==[8.0,8.0,8.0],"alternate route goal bounds")
  count=count+require(b.altRouteGoal.entitynum==0 and b.altRouteGoal.iteminfo==0 and b.altRouteGoal.number==0 and b.altRouteGoal.flags==0,"alternate route metadata cleared")
  s.context.randomValue=1.0;count=count+require(nav.getAlternateRouteGoal(s,b,2,red,blue) and b.altRouteGoal.areanum==31 and b.reachedAltRouteGoalTime==0.0,"blue route clamp and reset")
  s=services();b=bot();heap=nav.ensureActivateHeap(b);count=count+require(len(heap)==nav.MAX_ACTIVATESTACK and b.activateStackIndex==-1,"activation heap initialized")
  a=nav.emptyActivateGoal();a.numareas=2;a.areas=[3,5];nav.enableActivateGoalAreas(s,a,true);count=count+require(s.context.routing==[] and not a.areasdisabled,"already enabled areas skipped")
  nav.enableActivateGoalAreas(s,a,false);count=count+require(s.context.routing==["3:false","5:false"] and a.areasdisabled,"routing areas disabled in order")
  nav.enableActivateGoalAreas(s,a,true);count=count+require(s.context.routing==["3:false","5:false","3:true","5:true"] and not a.areasdisabled,"routing areas re-enabled in order")
  for index=0 to nav.MAX_ACTIVATESTACK-1 heap[index].justusedTime=9.0 end for;heap[0].justusedTime=5.0;heap[1].justusedTime=1.0;heap[2].justusedTime=3.0;a.goal.entitynum=77;count=count+require(nav.pushActivateGoal(s,b,a) and b.activateStackIndex==1,"oldest free heap entry selected")
  count=count+require(heap[1].inuse and heap[1].goal.entitynum==77 and heap[1].nextIndex==-1,"activation goal copied onto stack")
  second=nav.emptyActivateGoal();second.goal.entitynum=88;count=count+require(nav.pushActivateGoal(s,b,second) and heap[b.activateStackIndex].nextIndex==1,"activation stack is LIFO")
  top=b.activateStackIndex;s.context.now=30.0;count=count+require(nav.popActivateGoal(s,b) and b.activateStackIndex==1 and not heap[top].inuse and heap[top].justusedTime==30.0,"pop retires top goal")
  nav.clearActivateGoalStack(s,b);count=count+require(b.activateStackIndex==-1 and not heap[1].inuse,"clear drains activation stack")
  s=services();b=bot();heap=nav.ensureActivateHeap(b);for index=0 to nav.MAX_ACTIVATESTACK-1 heap[index].inuse=true end for;count=count+require(not nav.pushActivateGoal(s,b,nav.emptyActivateGoal()),"full activation heap rejects push")
  s=services();b=bot();heap=nav.ensureActivateHeap(b);heap[0].inuse=true;heap[0].time=21.0;heap[0].goal.entitynum=55;b.activateStackIndex=0;count=count+require(nav.isGoingToActivateEntity(s,b,55),"live stacked entity detected")
  heap[0].time=19.0;count=count+require(not nav.isGoingToActivateEntity(s,b,55),"expired stacked entity ignored")
  heap[0].inuse=false;b.activateStackIndex=-1;heap[0].justusedTime=19.0;count=count+require(nav.isGoingToActivateEntity(s,b,55),"recent retired entity detected")
  heap[0].justusedTime=18.0;count=count+require(not nav.isGoingToActivateEntity(s,b,55),"two-second boundary is strict")
  s=services();b=bot();a=nav.emptyActivateGoal();a.goal.entitynum=66;count=count+require(nav.goForActivateGoal(s,b,a),"activation goal execution succeeds")
  count=count+require(a.time==30.0 and a.startTime==20.0 and a.origin==[7.0,8.0,9.0] and s.context.enters==1,"activation timing entity origin and node entry")
  count=count+require(b.activateStackIndex>=0 and b.activateGoalHeap[b.activateStackIndex].goal.entitynum==66,"activation execution pushes goal")
  s=services();b=bot();s.context.caseId=1;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==0 and s.context.calls==["missing-model"],"missing mover BSP entity")
  s=services();b=bot();s.context.caseId=2;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==1 and a.goal.entitynum==70 and s.context.calls==["door"],"shootable door activation")
  s=services();b=bot();s.context.caseId=3;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==0,"start-open door waits")
  s=services();b=bot();s.context.caseId=4;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==0,"already moving door waits")
  s=services();b=bot();s.context.caseId=5;s.context.travelResult=30;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==2 and s.context.calls==["button"],"button activator discovered")
  count=count+require(a.areas==[10,11] and a.numareas==2 and a.areasdisabled,"door mover areas ordered and disabled")
  count=count+require(n.floatBits(a.time)==n.floatBits(n.f32(25.3)) and s.context.routing==["10:false","11:false"],"activator travel deadline")
  s=services();b=bot();s.context.caseId=6;s.context.travelResult=10;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==3 and s.context.calls==["trigger"],"relay reaches trigger activator")
  s=services();b=bot();s.context.caseId=7;a=nav.emptyActivateGoal();count=count+require(nav.getActivateGoal(s,b,71,a)==0 and s.context.calls==[],"timer activator ignored")
  s=services();b=bot();g=nav.Goal(10,7,[1.0,2.0,3.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],4,5,6);nav.goCamp(s,b,g)
  count=count+require(b.decisionmaker==8 and b.ltgtype==nav.LTG_CAMP and b.teamGoal.origin==[1.0,2.0,3.0],"camp state and goal")
  count=count+require(n.floatBits(b.teamgoalTime)==n.floatBits(n.f32(233.75)) and b.campTime==20.0 and b.teammate==0 and b.arriveTime==1.0,"camp timing")
  s=services();b=bot();s.context.camper=1.0;nav.goCamp(s,b,g);count=count+require(b.teamgoalTime==100019.0,"dedicated camper duration")
  s=services();b=bot();s.context.camper=0.05;count=count+require(not nav.wantsToCamp(s,b),"low camper rejects camp")
  s=services();b=bot();b.ltgtype=nav.LTG_GETFLAG;count=count+require(not nav.wantsToCamp(s,b),"team goal rejects camp")
  s=services();b=bot();b.campTime=-1000.0;s.context.randomValue=0.75;count=count+require(not nav.wantsToCamp(s,b) and b.campTime==20.0,"random camp refusal updates time")
  s=services();b=bot();b.campTime=-1000.0;s.context.travelResult=100;b.inventory[nav.INVENTORY_RAILGUN]=1;b.inventory[nav.INVENTORY_SLUGS]=10;count=count+require(nav.wantsToCamp(s,b) and b.teamGoal.areanum==10 and not b.ordered,"camp goal selection")
  s=services();b=bot();nav.dontAvoid(s,b,"Quad Damage");count=count+require(s.context.removals==[100],"item avoid entries removed")
  s=services();b=bot();b.ltgTime=99.0;nav.goForPowerups(s,b);count=count+require(s.context.removals==[100,100,100,100,100] and b.ltgTime==0.0,"powerup avoid reset order")
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot navigation contracts\n");return 0 end function
