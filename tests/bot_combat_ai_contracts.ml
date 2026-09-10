// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
import mq3.compat.numeric as n

struct Context contents weaponjump enemy flags calls end struct
function require(value,label) if not value then return error(499,"Bot combat contract: "+label) end if return 1 end function
function floatTime(s) s.context.calls=s.context.calls+[1];return 12.5 end function
function pointContents(s,point) s.context.flags=point;s.context.calls=s.context.calls+[2];return s.context.contents end function
function characteristic(s,character,index,low,high) s.context.calls=s.context.calls+[3,character,index];return s.context.weaponjump end function
function entityInfo(s,number) s.context.calls=s.context.calls+[4,number];return s.context.enemy end function
function services() s=combat.create();s.context=Context(0,0.0,combat.EntityInfo(2,0,0),void,[]);s.floatTimeFn=floatTime;s.pointContentsFn=pointContents;s.characteristicFloatFn=characteristic;s.entityInfoFn=entityInfo;return s end function
function bot() b=bots.createBot(1);b.curPs=ps.create();b.inventory[combat.INVENTORY_HEALTH]=100;return b end function
function contracts()
  count=0;e=combat.EntityInfo(2,0,0)
  count=count+require(not combat.entityCarriesFlag(e) and not combat.entityIsInvisible(e) and not combat.entityIsShooting(e) and not combat.entityIsChatting(e) and not combat.entityHasQuad(e),"empty entity predicates")
  e.powerups=(1<<7)|(1<<4)|(1<<1);e.flags=combat.EF_FIRING|combat.EF_TALK
  count=count+require(combat.entityCarriesFlag(e),"red flag predicate")
  count=count+require(not combat.entityIsInvisible(e),"flag overrides invisibility")
  count=count+require(combat.entityIsShooting(e) and combat.entityIsChatting(e) and combat.entityHasQuad(e),"flag and powerup predicates")
  e.powerups=1<<4;count=count+require(combat.entityIsInvisible(e),"plain invisibility")
  s=services();b=bot();b.inventory[combat.INVENTORY_REDFLAG]=1
  count=count+require(combat.ctfCarryingFlag(s,b)==0,"flag ignored outside CTF")
  s.gametype=combat.GT_CTF;count=count+require(combat.ctfCarryingFlag(s,b)==1,"red flag inventory")
  b.inventory[combat.INVENTORY_REDFLAG]=0;b.inventory[combat.INVENTORY_BLUEFLAG]=1;count=count+require(combat.ctfCarryingFlag(s,b)==2,"blue flag inventory")
  s.gametype=2;count=count+require(not combat.teamPlayIsOn(s),"non-team mode");s.gametype=3;count=count+require(combat.teamPlayIsOn(s),"team mode")
  b=bot();s=services();b.curPs.eFlags=4;combat.setTeleportTime(s,b)
  count=count+require(b.teleportTime==12.5 and b.lastEFlags==4 and s.context.calls==[1],"teleport toggle timestamp")
  combat.setTeleportTime(s,b);count=count+require(b.teleportTime==12.5 and s.context.calls==[1],"stable teleport bit")
  b.curPs.pm_type=3;count=count+require(combat.isDead(b),"dead player state")
  b.curPs.pm_type=4;count=count+require(combat.intermission(s,b),"freeze intermission")
  b.curPs.pm_type=0;s.intermissiontime=1;count=count+require(combat.intermission(s,b),"level intermission")
  s.intermissiontime=0;s.context.contents=combat.CONTENTS_LAVA;b.origin=[1.0,2.0,30.0]
  count=count+require(combat.inLavaOrSlime(s,b) and s.context.flags==[1.0,2.0,7.0],"feet contents query")
  b=bot();b.inventory[combat.INVENTORY_QUAD]=1;b.weaponnum=combat.WP_GAUNTLET;b.inventory[combat.ENEMY_HORIZONTAL_DIST]=80
  count=count+require(combat.aggression(b)==0.0,"quad gauntlet distance boundary")
  b.inventory[combat.ENEMY_HORIZONTAL_DIST]=79;count=count+require(combat.aggression(b)==70.0,"nearby quad aggression")
  b.inventory[combat.INVENTORY_QUAD]=0;b.inventory[combat.INVENTORY_BFG10K]=1;b.inventory[combat.INVENTORY_BFGAMMO]=8
  count=count+require(combat.aggression(b)==100.0,"BFG aggression")
  b.inventory[combat.ENEMY_HEIGHT]=201;count=count+require(combat.aggression(b)==0.0,"enemy height veto")
  b.inventory[combat.ENEMY_HEIGHT]=0;b.inventory[combat.INVENTORY_HEALTH]=79;b.inventory[combat.INVENTORY_ARMOR]=39
  count=count+require(combat.aggression(b)==0.0,"low armor veto")
  b.inventory[combat.INVENTORY_ARMOR]=40;count=count+require(combat.aggression(b)==100.0,"armor threshold inclusive")
  b=bot();b.weaponnum=combat.WP_GAUNTLET;count=count+require(combat.feelingBad(b)==100.0,"gauntlet feeling")
  b.weaponnum=combat.WP_MACHINEGUN;count=count+require(combat.feelingBad(b)==90.0,"machinegun feeling")
  b.weaponnum=0;b.inventory[combat.INVENTORY_HEALTH]=59;count=count+require(combat.feelingBad(b)==80.0,"health feeling")
  s=services();s.gametype=combat.GT_CTF;b=bot();b.inventory[combat.INVENTORY_REDFLAG]=1
  count=count+require(combat.wantsToRetreat(s,b),"flag carrier retreats")
  b.inventory[combat.INVENTORY_REDFLAG]=0;b.enemy=2;s.context.enemy.powerups=1<<8
  count=count+require(not combat.wantsToRetreat(s,b) and s.context.calls==[4,2],"enemy flag carrier blocks retreat")
  s.context.calls=[];count=count+require(combat.wantsToChase(s,b) and s.context.calls==[4,2],"enemy flag carrier forces chase")
  b.ltgtype=combat.LTG_GETFLAG;s.context.enemy.powerups=0;count=count+require(combat.wantsToRetreat(s,b) and not combat.wantsToChase(s,b),"get-flag tactical override")
  s=services();b=bot();s.rocketjump=true;b.character=7;b.inventory[combat.INVENTORY_ROCKETLAUNCHER]=1;b.inventory[combat.INVENTORY_ROCKETS]=3;b.inventory[combat.INVENTORY_HEALTH]=89;b.inventory[combat.INVENTORY_ARMOR]=40;s.context.weaponjump=0.5
  count=count+require(combat.canAndWantsToRocketJump(s,b),"rocket jump threshold")
  count=count+require(s.context.calls==[3,7,combat.CHARACTERISTIC_WEAPONJUMPING],"rocket jump characteristic service")
  b.inventory[combat.INVENTORY_QUAD]=1;count=count+require(not combat.canAndWantsToRocketJump(s,b),"quad rocket jump veto")
  angles=[10.0,350.0,0.0];count=count+require(combat.inFieldOfVision([350.0,10.0,0.0],45.0,angles),"wrapped field of vision")
  angles=[40.0,10.0,0.0];count=count+require(not combat.inFieldOfVision([350.0,10.0,0.0],45.0,angles),"outside field of vision")
  angles=[-10.0,370.0,0.0];count=count+require(combat.inFieldOfVision([350.0,10.0,0.0],1.0,angles) and angles[0]>=349.99 and angles[1]>=9.99,"AngleMod mutates tested angles")
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot combat AI contracts\n");return 0 end function
