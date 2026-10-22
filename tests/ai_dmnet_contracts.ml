import mq3.game.ai_dmnet as dm
import mq3.game.bot_navigation as nav
import mq3.compat.numeric as n

struct Context now random touch carryFlag carryCubes bad harvest attacks routes prints events end struct
struct Bot client inventory origin eye viewangles entitynum curPs kamikazeBody blockedByAvoidSpotTime proxMines teammessageTime teamgoalTime attackawayTime harvestawayTime ltgtype leadTime leadTeammate leadmessageTime leadvisibleTime leadbackupTime leadTeamGoal idealViewangles gs ms ltgTime lastairTime areanum teamGoal enemy end struct
struct Ps weapon end struct
struct Entity origin number end struct
struct Trace fraction ent end struct
struct Move flags idealViewangles weapon end struct
struct NodeServices dmnetServices end struct
function require(value,label) if not value then return error(499,"ai_dmnet contract: "+label) end if;return 1 end function
function goal(number,x) return nav.Goal(number,number,[x,0.0,0.0],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,number,0) end function
function clock(s) return s.context.now end function
function random(s) return s.context.random end function
function touch(s,origin,g) return s.context.touch end function
function notify(s,b,event,target) s.context.events=s.context.events+[event];return void end function
function team(ms,b) return 1 end function
function neutralFlag(ms,b) return goal(101,100.0) end function
function redFlag(ms,b) return goal(102,-100.0) end function
function blueFlag(ms,b) return goal(103,100.0) end function
function redObelisk(ms,b) return goal(104,-200.0) end function
function blueObelisk(ms,b) return goal(105,200.0) end function
function neutralObelisk(ms,b) return goal(106,0.0) end function
function carryingFlag(ms,b) return ms.context.carryFlag end function
function carryingCubes(ms,b) return ms.context.carryCubes end function
function feelingBad(ms,b) return ms.context.bad end function
function alternate(ms,b,g) ms.context.routes=ms.context.routes+1;return void end function
function harvest(ms,b) ms.context.harvest=ms.context.harvest+1;b.ltgtype=dm.LTG_HARVEST;return void end function
function name(s,client) return "Sarge" end function
function printAction(s,kind,text) s.context.prints=s.context.prints+1;return void end function
function entityState(s,number) return Entity([n.f32(number*10),0.0,0.0],number) end function
function trace(s,start,finish,passent) return Trace(1.0,-1) end function
function attack(s,client) s.context.attacks=s.context.attacks+1;return void end function
function fov(s,current,field,target) return true end function
function makeBot()
 inv=array(64,0);return Bot(2,inv,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],2,Ps(0),0,0.0,[],1.0,100.0,0.0,0.0,0,0.0,3,0.0,0.0,0.0,goal(7,20.0),[0.0,0.0,0.0],1,2,50.0,20.0,1,goal(8,30.0),-1)
end function
function make()
 ctx=Context(20.0,0.5,false,true,true,0,0,0,0,0,[]);ns=nav.create();ns.context=ctx;ns.floatTimeFn=clock;ns.randomFn=random;ns.touchingGoalFn=touch;ns.notifyFn=notify
 s=dm.create(void,void,ns);s.context=ctx;s.nameFn=name;s.timeFn=clock;s.printFn=printAction;s.entityStateFn=entityState;s.traceFn=trace;s.attackFn=attack;s.inFovFn=fov;s.mission.context=ctx;s.mission.missionpack=true;s.mission.teamFn=team;s.mission.neutralFlagGoalFn=neutralFlag;s.mission.redFlagGoalFn=redFlag;s.mission.blueFlagGoalFn=blueFlag;s.mission.redObeliskGoalFn=redObelisk;s.mission.blueObeliskGoalFn=blueObelisk;s.mission.neutralObeliskGoalFn=neutralObelisk;s.mission.carryingNeutralFn=carryingFlag;s.mission.carryingCubesFn=carryingCubes;s.mission.feelingBadFn=feelingBad;s.mission.alternateRouteFn=alternate;s.mission.goHarvestFn=harvest;return [s,makeBot(),ctx]
end function
function weapon(s,b,index,ammo,expected) b.inventory=array(64,0);b.inventory[index]=1;b.inventory[ammo]=1;return dm.BotSelectActivateWeapon(s,b)==expected end function
function contracts()
 count=0;x=make();s=x[0];b=x[1];ctx=x[2];dm.BotResetNodeSwitches(s);count=count+require(len(s.nodeSwitches)==0,"reset node switches");dm.BotRecordNodeSwitch(s,b,"seek LTG","goal","spawn");count=count+require(len(s.nodeSwitches)==1 and s.nodeSwitches[0].node=="seek LTG","record node switch");count=count+require(ctx.prints==1 and s.actions[0].dispatched,"native node diagnostics");s.retailActive=true;dm.BotRecordNodeSwitch(s,b,"battle fight","","enemy");count=count+require(not s.actions[1].dispatched and ctx.prints==1,"retail suppresses duplicate diagnostics");count=count+require(dm.BotDumpNodeSwitches(s,b)==2,"node dump count")
 count=count+require(dm.BotSelectActivateWeapon(s,b)==-1,"no activation weapon");count=count+require(weapon(s,b,dm.INVENTORY_MACHINEGUN,dm.INVENTORY_BULLETS,dm.WEAPONINDEX_MACHINEGUN),"machinegun precedence");count=count+require(weapon(s,b,dm.INVENTORY_PLASMAGUN,dm.INVENTORY_CELLS,dm.WEAPONINDEX_PLASMAGUN),"plasma");count=count+require(weapon(s,b,dm.INVENTORY_CHAINGUN,dm.INVENTORY_BELT,dm.WEAPONINDEX_CHAINGUN),"mission chaingun");count=count+require(weapon(s,b,dm.INVENTORY_NAILGUN,dm.INVENTORY_NAILS,dm.WEAPONINDEX_NAILGUN),"mission nailgun");count=count+require(weapon(s,b,dm.INVENTORY_RAILGUN,dm.INVENTORY_SLUGS,dm.WEAPONINDEX_RAILGUN),"railgun");count=count+require(weapon(s,b,dm.INVENTORY_ROCKETLAUNCHER,dm.INVENTORY_ROCKETS,dm.WEAPONINDEX_ROCKET_LAUNCHER),"rocket");count=count+require(weapon(s,b,dm.INVENTORY_BFG10K,dm.INVENTORY_BFGAMMO,dm.WEAPONINDEX_BFG),"bfg")
 x=make();s=x[0];b=x[1];ctx=x[2];s.navigationServices.gametype=dm.GT_1FCTF;b.ltgtype=dm.LTG_GETFLAG;g=goal(0,0.0);count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and g.number==101,"1FCTF neutral flag")
 x=make();s=x[0];b=x[1];ctx=x[2];s.navigationServices.gametype=dm.GT_1FCTF;b.ltgtype=dm.LTG_RUSHBASE;g=goal(0,0.0);count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and g.number==103 and ctx.routes==1,"1FCTF rush enemy base")
 ctx.carryFlag=false;count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and b.ltgtype==0,"1FCTF lost neutral flag")
 x=make();s=x[0];b=x[1];ctx=x[2];s.navigationServices.gametype=dm.GT_1FCTF;b.ltgtype=dm.LTG_ATTACKENEMYBASE;ctx.touch=true;g=goal(0,0.0);count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and b.attackawayTime==24.5,"1FCTF attack backs away")
 x=make();s=x[0];b=x[1];ctx=x[2];s.navigationServices.gametype=dm.GT_OBELISK;b.ltgtype=dm.LTG_ATTACKENEMYBASE;b.origin=[150.0,0.0,0.0];g=goal(0,0.0);count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and g.number==105 and b.attackawayTime==25.5 and ctx.routes==1,"obelisk close attack")
 x=make();s=x[0];b=x[1];ctx=x[2];s.navigationServices.gametype=dm.GT_HARVESTER;b.ltgtype=dm.LTG_RUSHBASE;g=goal(0,0.0);count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and g.number==105,"harvester cube rush")
 ctx.carryCubes=false;count=count+require(not dm.BotGetLongTermGoal(s,b,1,false,g) and ctx.harvest==1 and b.ltgtype==dm.LTG_HARVEST,"harvester returns to harvest")
 x=make();s=x[0];b=x[1];ctx=x[2];s.navigationServices.gametype=dm.GT_HARVESTER;b.ltgtype=dm.LTG_HARVEST;ctx.touch=true;g=goal(0,0.0);count=count+require(dm.BotGetLongTermGoal(s,b,1,false,g) and g.number==106 and b.harvestawayTime==25.5,"harvest center cooldown")
 nodes=NodeServices(s);s.navigationServices.gametype=dm.GT_HARVESTER;ctx.carryCubes=true;count=count+require(dm.missionNearbyRange(nodes,b,150.0)==80.0,"harvester nearby range");s.navigationServices.gametype=dm.GT_1FCTF;ctx.carryFlag=true;count=count+require(dm.missionNearbyRange(nodes,b,150.0)==50.0,"1FCTF nearby range");b.enemy=105;count=count+require(dm.missionEnemyTarget(nodes,b,[1.0,2.0,3.0])==[1.0,2.0,19.0],"obelisk aim height")
 x=make();s=x[0];b=x[1];ctx=x[2];b.inventory[dm.INVENTORY_MACHINEGUN]=1;b.inventory[dm.INVENTORY_BULLETS]=20;b.kamikazeBody=9;b.curPs.weapon=dm.WEAPONINDEX_MACHINEGUN;m=Move(0,[0.0,0.0,0.0],0);dm.BotClearPath(s,b,m);count=count+require(m.weapon==dm.WEAPONINDEX_MACHINEGUN and (m.flags&dm.MOVERESULT_MOVEMENTVIEW)!=0 and ctx.attacks==1,"clear kamikaze body")
 x=make();s=x[0];b=x[1];ctx=x[2];b.inventory[dm.INVENTORY_ROCKETLAUNCHER]=1;b.inventory[dm.INVENTORY_ROCKETS]=5;b.proxMines=[4,8];b.curPs.weapon=dm.WEAPONINDEX_ROCKET_LAUNCHER;m=Move(dm.MOVERESULT_BLOCKEDBYAVOIDSPOT,[0.0,0.0,0.0],0);dm.BotClearPath(s,b,m);count=count+require(b.blockedByAvoidSpotTime==25.0 and m.weapon==dm.WEAPONINDEX_ROCKET_LAUNCHER and ctx.attacks==1,"clear nearest proximity mine")
 x=make();s=x[0];b=x[1];ctx=x[2];b.kamikazeBody=9;m=Move(dm.MOVERESULT_MOVEMENTVIEW,[0.0,0.0,0.0],0);dm.BotClearPath(s,b,m);count=count+require(m.weapon==0 and ctx.attacks==0,"movement-owned view suppresses clearing")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" ai_dmnet native contracts\n");return 0 end function
