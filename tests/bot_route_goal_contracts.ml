// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_navigation as nav
import mq3.game.bot_lifecycle as bots

struct Context now traces traceIndex area pushes nbgLeft nbgStep topOk topGoal topCalls pops resets carrying travel touching invisible swimming avoids weapons chooseLtg resetReach range calls end struct
function require(value,label) if not value then return error(499,"Bot route-goal contract: "+label) end if return 1 end function
function trace(s,start,mins,maxs,finish,entity,mask) value=s.context.traces[s.context.traceIndex];s.context.traceIndex=s.context.traceIndex+1;s.context.calls=s.context.calls+["trace"];return value end function
function pointArea(s,point) s.context.calls=s.context.calls+["area"];return s.context.area end function
function now(s) s.context.calls=s.context.calls+["time"];return s.context.now end function
function push(s,gs,goal) s.context.pushes=s.context.pushes+1;s.context.topGoal=goal;s.context.calls=s.context.calls+["push"];return void end function
function chooseNbg(s,gs,origin,inventory,tfl,ltg,range) s.context.calls=s.context.calls+["nbg"];s.context.range=range;if s.context.nbgLeft<=0 then return false end if;s.context.nbgLeft=s.context.nbgLeft-1;s.context.nbgStep=s.context.nbgStep+1;s.context.topOk=true;s.context.topGoal=nav.Goal(10+s.context.nbgStep,0,[s.context.nbgStep*1.0,0.0,0.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,100+s.context.nbgStep,0);return true end function
function top(s,gs) s.context.topCalls=s.context.topCalls+1;s.context.calls=s.context.calls+["top"];return [s.context.topOk,s.context.topGoal] end function
function contents(s,point) if point[0]==1.0 then return nav.CONTENTS_WATER end if return 0 end function
function pop(s,gs) s.context.pops=s.context.pops+1;s.context.topOk=false;s.context.calls=s.context.calls+["pop"];return void end function
function resetAvoid(s,gs) s.context.resets=s.context.resets+1;s.context.calls=s.context.calls+["reset"];return void end function
function hasFlag(s,bot) s.context.calls=s.context.calls+["flag"];return s.context.carrying end function
function travel(s,area,origin,goal,tfl) s.context.calls=s.context.calls+["travel"];return s.context.travel end function
function touch(s,origin,goal) s.context.calls=s.context.calls+["touch"];return s.context.touching end function
function invisible(s,entity,eye,angles,goal) s.context.calls=s.context.calls+["invisible"];return s.context.invisible end function
function swimming(s,origin) s.context.calls=s.context.calls+["swim"];return s.context.swimming end function
function avoid(s,gs,number,time) s.context.avoids=s.context.avoids+1;s.context.calls=s.context.calls+["avoid"];return void end function
function weapon(s,bot) s.context.weapons=s.context.weapons+1;s.context.calls=s.context.calls+["weapon"];return void end function
function chooseLtg(s,gs,origin,inventory,tfl) s.context.calls=s.context.calls+["ltg"];if s.context.chooseLtg then s.context.topOk=true;s.context.topGoal=nav.Goal(77,0,[7.0,7.0,7.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,707,0) end if;return s.context.chooseLtg end function
function resetReach(s,ms) s.context.resetReach=s.context.resetReach+1;s.context.calls=s.context.calls+["reach"];return void end function
function services()
  s=nav.create();empty=nav.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)
  s.context=Context(20.0,[nav.NavTrace(1.0,[0.0,0.0,100.0],false),nav.NavTrace(0.0,[0.0,0.0,20.0],false)],0,0,0,0,0,false,empty,0,0,0,false,0,false,false,false,0,0,false,0,0.0,[])
  s.traceFn=trace;s.pointAreaFn=pointArea;s.floatTimeFn=now;s.pushGoalFn=push;s.chooseNbgFn=chooseNbg;s.topGoalFn=top;s.pointContentsFn=contents;s.popGoalFn=pop;s.resetAvoidGoalsFn=resetAvoid;s.carryingFlagFn=hasFlag;s.areaTravelTimeFn=travel;s.touchingGoalFn=touch;s.itemNotVisibleFn=invisible;s.swimmingFn=swimming;s.setAvoidGoalTimeFn=avoid;s.chooseWeaponFn=weapon;s.chooseLtgFn=chooseLtg;s.resetAvoidReachFn=resetReach;return s
end function
function bot()
  b=bots.createBot(8);b.entitynum=9;b.gs=4;b.ms=5;b.origin=[1.0,2.0,3.0];b.eye=[1.0,2.0,27.0];b.areanum=7;b.lastairTime=20.0;b.ltgTime=30.0;b.teamGoal=nav.Goal(99,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0);return b
end function
function goal(flags) return nav.Goal(7,0,[1.0,2.0,0.0],[-2.0,-2.0,-2.0],[2.0,2.0,2.0],0,42,flags) end function
function contracts()
  count=0;s=services();b=bot();g=goal(0);count=count+require(not nav.getAirGoal(s,b,g) and s.context.traceIndex==2,"air trace rejects missing surface")
  s=services();b=bot();g=goal(0);s.context.traces[1]=nav.NavTrace(0.5,[4.0,5.0,80.0],false);count=count+require(not nav.getAirGoal(s,b,g) and s.context.calls==["trace","trace","area"],"air trace rejects area zero")
  s.context.area=12;s.context.traceIndex=0;s.context.calls=[];count=count+require(nav.getAirGoal(s,b,g) and g.areanum==12 and g.flags==nav.GFL_AIR,"air goal area and flag")
  count=count+require(g.origin==[4.0,5.0,78.0] and g.mins==[-15.0,-15.0,-1.0] and g.maxs==[15.0,15.0,1.0],"air goal projection and bounds")
  s=services();b=bot();b.lastairTime=14.0;count=count+require(not nav.goForAir(s,b,3,g,100.0) and s.context.traceIndex==0,"recent air gate")
  s=services();b=bot();b.lastairTime=13.0;s.context.traces[1]=nav.NavTrace(0.5,[4.0,5.0,80.0],false);s.context.area=12;count=count+require(nav.goForAir(s,b,3,g,100.0) and s.context.pushes==1,"direct air goal pushed")
  s=services();b=bot();b.lastairTime=0.0;s.context.nbgLeft=2;count=count+require(nav.goForAir(s,b,3,g,100.0) and s.context.pops==1 and s.context.resets==0,"water NBG popped before dry goal")
  count=count+require(s.context.topGoal.areanum==12 and s.context.calls==["time","trace","trace","nbg","top","pop","nbg","top"],"air fallback call order")
  s=services();b=bot();b.lastairTime=0.0;s.context.nbgLeft=1;count=count+require(not nav.goForAir(s,b,3,g,100.0) and s.context.pops==1 and s.context.resets==1,"air fallback exhaustion reset")
  s=services();b=bot();s.context.nbgLeft=1;count=count+require(nav.nearbyGoal(s,b,3,g,100.0) and s.context.calls==["time","flag","nbg"],"nearby goal ordinary order")
  s=services();b=bot();s.context.carrying=true;s.context.travel=299;s.context.nbgLeft=1;count=count+require(nav.nearbyGoal(s,b,3,g,100.0) and s.context.range==50.0,"flag carrier nearby range clamp")
  s=services();b=bot();g=goal(nav.GFL_ITEM);s.context.touching=true;count=count+require(nav.reachedGoal(s,b,g) and s.context.avoids==1 and s.context.calls==["touch","avoid"],"item touch sets avoid")
  s=services();b=bot();g=goal(nav.GFL_ITEM|nav.GFL_DROPPED);s.context.touching=true;count=count+require(nav.reachedGoal(s,b,g) and s.context.avoids==0,"dropped item keeps avoid")
  s=services();b=bot();g=goal(nav.GFL_ITEM);s.context.invisible=true;count=count+require(nav.reachedGoal(s,b,g) and s.context.calls==["touch","invisible"],"missing visible item reached")
  s=services();b=bot();g=goal(nav.GFL_ITEM);count=count+require(nav.reachedGoal(s,b,g) and s.context.calls==["touch","invisible","swim"],"XY item goal reached on land")
  s=services();b=bot();g=goal(nav.GFL_ITEM);s.context.swimming=true;count=count+require(not nav.reachedGoal(s,b,g),"XY item goal rejected while swimming")
  s=services();b=bot();g=goal(nav.GFL_AIR);b.lastairTime=19.5;count=count+require(nav.reachedGoal(s,b,g) and s.context.calls==["touch","time"],"recent breath reaches air goal")
  s=services();b=bot();g=goal(0);s.context.touching=true;count=count+require(nav.reachedGoal(s,b,g) and s.context.calls==["touch"],"ordinary goal touch")
  s=services();b=bot();g=goal(0);s.context.chooseLtg=true;count=count+require(nav.getItemLongTermGoal(s,b,3,g) and g.areanum==77 and g.number==707 and b.ltgTime==40.0,"empty stack chooses LTG")
  count=count+require(s.context.calls==["top","time","pop","ltg","time","top"],"empty LTG call order")
  s=services();b=bot();g=goal(0);s.context.topOk=true;s.context.topGoal=goal(nav.GFL_ITEM);s.context.touching=true;count=count+require(not nav.getItemLongTermGoal(s,b,3,g) and s.context.weapons==1 and s.context.resets==1 and s.context.resetReach==1,"reached LTG failure recovery")
  count=count+require(s.context.calls==["top","touch","avoid","weapon","time","pop","ltg","reset","reach","top"],"reached LTG recovery order")
  s=services();b=bot();g=goal(0);s.context.topOk=true;s.context.topGoal=goal(0);count=count+require(nav.getItemLongTermGoal(s,b,3,g) and b.ltgTime==30.0 and s.context.pops==0,"live LTG retained")
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot route-goal contracts\n");return 0 end function
