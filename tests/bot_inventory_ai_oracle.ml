// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_inventory_ai as ai
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
struct Context events best time origin end struct
struct Entity origin end struct
function choose(s,ws,inventory) s.context.events=s.context.events+["choose:"+str(ws)];return s.context.best end function
function select(s,client,weapon) s.context.events=s.context.events+["select:"+str(client)+":"+str(weapon)];return void end function
function clock(s) s.context.events=s.context.events+["time"];return s.context.time end function
function entity(s,enemy) s.context.events=s.context.events+["entity:"+str(enemy)];return Entity(s.context.origin) end function
function dump(s,b) for each e in s.context.events print e end for;print "weapon="+str(b.weaponnum)+":"+str(b.weaponchangeTime);s.context.events=[];return void end function
function main(args)
 s=ai.create();s.context=Context([],7,12.5,[13.9,-0.1,9.9]);s.chooseBestFn=choose;s.selectWeaponFn=select;s.floatTimeFn=clock;s.entityInfoFn=entity;b=bots.createBot(2);b.curPs=ps.create();b.ws=4;b.weaponnum=5
 b.curPs.weaponstate=1;ai.chooseWeapon(s,b);dump(s,b);b.curPs.weaponstate=2;ai.chooseWeapon(s,b);dump(s,b);b.curPs.weaponstate=0;s.context.best=5;ai.chooseWeapon(s,b);dump(s,b);s.context.best=7;ai.chooseWeapon(s,b);dump(s,b)
 b.origin=[1.4,-4.1,2.2];ai.updateBattleInventory(s,b,9);for each e in s.context.events print e end for;print "battle="+str(b.inventory[200])+":"+str(b.inventory[201])
 return 0
end function
