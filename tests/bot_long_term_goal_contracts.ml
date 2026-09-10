// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_navigation as nav
import mq3.game.bot_lifecycle as bots

struct Context now events visible info touch invisible carrying team flagGoal travel random resets topOk topGoal chooseLtg end struct
function require(value,label) if not value then return error(499,"Bot long-term-goal contract: "+label) end if return 1 end function
function emptyGoal() return nav.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0) end function
function time(s) return s.context.now end function
function entity(s,number) return s.context.info end function
function visible(s,entity,eye,angles,target) return s.context.visible end function
function notify(s,b,event,target) s.context.events=s.context.events+[event+":"+str(target)];return void end function
function area(s,origin) return 7 end function
function reachable(s,area) return true end function
function reset(s,ms) s.context.resets=s.context.resets+1;return void end function
function resetLast(s,ms) return void end function
function characteristic(s,character,index,minimum,maximum) return 0.5 end function
function move(s,ms,direction,speed,kind) s.context.events=s.context.events+["move"];return true end function
function gesture(s,client) s.context.events=s.context.events+["gesture"];return void end function
function crouch(s,client) s.context.events=s.context.events+["crouch"];return void end function
function roam(s,b) return [100.0,0.0,0.0] end function
function enterNbg(s,b,reason) s.context.events=s.context.events+["nbg"];return void end function
function travel(s,area,origin,goal,tfl) return s.context.travel end function
function random(s) return s.context.random end function
function touch(s,origin,goal) return s.context.touch end function
function invisible(s,entity,eye,angles,goal) return s.context.invisible end function
function swim(s,origin) return false end function
function contents(s,eye,entity) return 0 end function
function persistent(s,b) return false end function
function carrying(s,b) return s.context.carrying end function
function team(s,b) return s.context.team end function
function flagGoal(s,team,enemy) return [team==nav.TEAM_RED or team==2,s.context.flagGoal] end function
function top(s,gs) return [s.context.topOk,s.context.topGoal] end function
function pop(s,gs) s.context.topOk=false;return void end function
function chooseLtg(s,gs,origin,inventory,tfl) if s.context.chooseLtg then s.context.topOk=true;s.context.topGoal=nav.Goal(77,0,[7.0,0.0,0.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,707,0) end if;return s.context.chooseLtg end function
function noop2(s,value) return void end function
function services()
 s=nav.create();g=emptyGoal();s.context=Context(20.0,[],false,nav.LongTermEntity(false,[0.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,0.0,0.0]),false,false,false,nav.TEAM_RED,nav.Goal(12,0,[100.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,12,0),0,0.5,0,false,g,true)
 s.floatTimeFn=time;s.entityLongTermInfoFn=entity;s.entityVisibleFn=visible;s.notifyFn=notify;s.pointAreaFn=area;s.areaReachabilityFn=reachable;s.resetAvoidReachFn=reset;s.resetLastAvoidReachFn=resetLast;s.areaTravelTimeFn=travel;s.randomFn=random;s.touchingGoalFn=touch;s.itemNotVisibleFn=invisible;s.swimmingFn=swim;s.pointContentsEntityFn=contents;s.persistentPowerupWeaponFn=persistent;s.carryingFlagFn=carrying;s.teamFn=team;s.flagGoalFn=flagGoal;s.topGoalFn=top;s.popGoalFn=pop;s.chooseLtgFn=chooseLtg;s.resetAvoidGoalsFn=noop2;s.chooseWeaponFn=noop2;s.characteristicFn=characteristic;s.moveInDirectionFn=move;s.gestureFn=gesture;s.crouchFn=crouch;s.roamGoalFn=roam;s.enterSeekNbgFn=enterNbg;s.gametype=0;return s
end function
function bot()
 b=bots.createBot(1);b.ms=2;b.gs=3;b.tfl=4;b.origin=[0.0,0.0,0.0];b.eye=[0.0,0.0,24.0];b.lastairTime=20.0;b.teamGoal=nav.Goal(8,0,[200.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,8,0);b.teamgoalTime=100.0;b.teammatevisibleTime=20.0;b.formationDist=100.0;b.lastKilledPlayer=-1;b.ltgTime=30.0;b.leadTeamGoal=nav.Goal(9,0,[200.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,9,0);return b
end function
function contracts()
 count=0;s=services();b=bot();g=emptyGoal();count=count+require(nav.getLongTermGoal(s,b,4,true,g),"retreat falls back to item LTG")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_TEAMHELP;b.teammate=2;s.context.visible=true;s.context.info=nav.LongTermEntity(true,[50.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,0.0,0.0]);count=count+require(not nav.getLongTermGoal(s,b,4,false,g) and s.context.resets==1,"near visible help target stops movement")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_TEAMHELP;b.teammate=2;s.context.info=nav.LongTermEntity(true,[150.0,2.0,3.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,0.0,0.0]);count=count+require(nav.getLongTermGoal(s,b,4,false,g) and g.areanum==7 and g.entitynum==2 and g.origin==[150.0,2.0,3.0],"help target refreshes reachable goal")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_TEAMACCOMPANY;b.teammate=2;s.context.info=nav.LongTermEntity(true,[150.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,0.0,0.0]);count=count+require(nav.getLongTermGoal(s,b,4,false,g) and g.origin==[150.0,0.0,0.0],"distant companion refreshes formation goal")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_TEAMACCOMPANY;b.teammate=2;s.context.visible=true;s.context.info=nav.LongTermEntity(true,[50.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,180.0,0.0]);count=count+require(not nav.getLongTermGoal(s,b,4,false,g) and b.arriveTime==20.0 and s.context.resets==1,"near companion arrives and stops")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_DEFENDKEYAREA;b.defendawayRange=350.0;b.teamGoal.origin=[10.0,0.0,0.0];count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.defendawayTime==24.5 and b.defendawayRange==350.0,"near defense schedules away interval")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_KILL;b.teamGoal.entitynum=6;b.lastKilledPlayer=6;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.ltgtype==0 and b.lastKilledPlayer==-1,"kill completion clears order")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_GETITEM;s.context.invisible=true;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.ltgtype==0 and g.areanum==8,"missing ordered item clears order")
 s=services();b=bot();g=emptyGoal();b.ltgtype=nav.LTG_CAMP;b.teamGoal.origin=[10.0,0.0,0.0];count=count+require(not nav.getLongTermGoal(s,b,4,false,g) and b.arriveTime==20.0 and s.context.resets==1,"camp arrival stops movement")
 s=services();b=bot();g=emptyGoal();a=nav.Waypoint("a",nav.Goal(10,0,[1.0,0.0,0.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,10,0),void,void);z=nav.Waypoint("z",nav.Goal(11,0,[2.0,0.0,0.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,11,0),void,a);a.next=z;b.ltgtype=nav.LTG_PATROL;b.curpatrolpoint=a;s.context.touch=true;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.curpatrolpoint==z and g.areanum==11,"patrol advances forward")
 s=services();b=bot();g=emptyGoal();s.gametype=nav.GT_CTF;b.ltgtype=nav.LTG_GETFLAG;s.context.touch=true;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.blueflagstatus==1 and b.ltgtype==0,"red capture marks blue flag away")
 s=services();b=bot();g=emptyGoal();s.gametype=nav.GT_CTF;b.ltgtype=nav.LTG_RUSHBASE;s.context.carrying=true;s.context.touch=true;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.rushbaseawayTime==30.0 and s.context.resets==1,"blocked flag capture backs away")
 s=services();b=bot();g=emptyGoal();s.gametype=nav.GT_CTF;b.ltgtype=6;s.context.touch=true;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.ltgtype==0,"raw LTG 6 dispatches return-flag")
 s=services();b=bot();g=emptyGoal();b.ltgtype=10;s.context.invisible=true;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.ltgtype==0 and g.areanum==8,"raw LTG 10 dispatches get-item")
 s=services();b=bot();g=emptyGoal();b.ltgtype=11;b.teamGoal.entitynum=6;b.lastKilledPlayer=6;count=count+require(nav.getLongTermGoal(s,b,4,false,g) and b.lastKilledPlayer==-1,"raw LTG 11 dispatches kill")
 s=services();b=bot();g=emptyGoal();b.leadTime=19.0;b.leadTeammate=2;count=count+require(nav.longTermGoal(s,b,4,false,g) and b.leadTime==0.0,"expired lead delegates to LTG")
 s=services();b=bot();g=emptyGoal();b.leadTime=100.0;b.leadTeammate=2;b.leadvisibleTime=0.0;s.context.info=nav.LongTermEntity(true,[200.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,0.0,0.0]);count=count+require(nav.longTermGoal(s,b,4,false,g) and b.leadbackupTime==22.0 and g.areanum==7,"lost follower starts backup goal")
 s=services();b=bot();g=emptyGoal();b.leadTime=100.0;b.leadTeammate=2;b.leadvisibleTime=20.0;b.leadTeamGoal.origin=[600.0,0.0,0.0];s.context.info=nav.LongTermEntity(false,[600.0,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],[0.0,0.0,0.0]);count=count+require(not nav.longTermGoal(s,b,4,false,g),"distant follower makes leader wait")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot long-term-goal contracts\n");return 0 end function
