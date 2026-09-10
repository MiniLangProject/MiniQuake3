// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_inventory_ai as ai
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
function pickup(s,b,old) print "pickup-old="+str(old[1]) return void end function
function csv(b)
 indices=[1,4,5,6,7,8,9,10,11,13,14,18,19,20,21,22,23,24,25,29,30,31,35,36,37,38,39,40,45,46];result=""
 for index=0 to len(indices)-1 if index>0 then result=result+"," end if;result=result+str(b.inventory[indices[index]]) end for;return result
end function
function main(args)
 s=ai.create();s.checkItemPickupFn=pickup;b=bots.createBot(0);b.curPs=ps.create();b.inventory[1]=77;b.curPs.stats[0]=91;b.curPs.stats[3]=42;b.curPs.stats[2]=(1<<1)|(1<<3)|(1<<5)|(1<<9);b.curPs.stats[1]=26
 for i=0 to 15 b.curPs.ammo[i]=i*3 end for;b.curPs.powerups[1]=100;b.curPs.powerups[4]=200;b.curPs.powerups[7]=300;ai.updateInventory(s,b);print csv(b)
 b.curPs.stats[1]=27;b.curPs.powerups[1]=0;b.curPs.powerups[8]=1;ai.updateInventory(s,b);print csv(b);return 0
end function
