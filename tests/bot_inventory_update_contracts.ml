// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_inventory_ai as ai
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
struct Context oldArmor calls end struct
function require(v,label) if not v then return error(499,"Bot inventory update contract: "+label) end if return 1 end function
function pickup(s,b,old) s.context.oldArmor=old[ai.INVENTORY_ARMOR];s.context.calls=s.context.calls+1;return void end function
function contracts()
 count=0;s=ai.create();s.context=Context(0,0);s.checkItemPickupFn=pickup;b=bots.createBot(0);b.curPs=ps.create();b.inventory[ai.INVENTORY_ARMOR]=77
 b.curPs.stats[0]=91;b.curPs.stats[3]=42;b.curPs.stats[2]=(1<<1)|(1<<3)|(1<<5)|(1<<9);b.curPs.stats[1]=26
 for i=0 to 15 b.curPs.ammo[i]=i*3 end for;b.curPs.powerups[1]=100;b.curPs.powerups[4]=200;b.curPs.powerups[7]=300
 ai.updateInventory(s,b)
 count=count+require(s.context.calls==1 and s.context.oldArmor==77,"old inventory callback")
 count=count+require(b.inventory[ai.INVENTORY_HEALTH]==91 and b.inventory[ai.INVENTORY_ARMOR]==42,"health armor")
 count=count+require(b.inventory[ai.INVENTORY_GAUNTLET]==1 and b.inventory[ai.INVENTORY_SHOTGUN]==1 and b.inventory[ai.INVENTORY_ROCKETLAUNCHER]==1 and b.inventory[ai.INVENTORY_BFG10K]==1,"weapon bits")
 count=count+require(b.inventory[ai.INVENTORY_MACHINEGUN]==0 and b.inventory[ai.INVENTORY_GRAPPLINGHOOK]==0,"absent weapons")
 count=count+require(b.inventory[ai.INVENTORY_SHELLS]==9 and b.inventory[ai.INVENTORY_ROCKETS]==15 and b.inventory[ai.INVENTORY_BFGAMMO]==27,"ammo mapping")
 count=count+require(b.inventory[ai.INVENTORY_TELEPORTER]==1 and b.inventory[ai.INVENTORY_MEDKIT]==0,"teleporter")
 count=count+require(b.inventory[ai.INVENTORY_QUAD]==1 and b.inventory[ai.INVENTORY_INVISIBILITY]==1 and b.inventory[ai.INVENTORY_REDFLAG]==1,"powerups")
 count=count+require(b.inventory[ai.INVENTORY_HASTE]==0 and b.inventory[ai.INVENTORY_BLUEFLAG]==0,"absent powerups")
 b.curPs.stats[1]=27;b.curPs.powerups[1]=0;b.curPs.powerups[8]=1;ai.updateInventory(s,b)
 count=count+require(b.inventory[ai.INVENTORY_TELEPORTER]==0 and b.inventory[ai.INVENTORY_MEDKIT]==1,"medkit replacement")
 count=count+require(b.inventory[ai.INVENTORY_QUAD]==0 and b.inventory[ai.INVENTORY_BLUEFLAG]==1,"powerup replacement")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot inventory update contracts\n");return 0 end function
