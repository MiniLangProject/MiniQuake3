// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_inventory_ai as ai
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
struct Context events best time origin end struct
struct Entity origin end struct
function require(v,label) if not v then return error(499,"Bot inventory AI contract: "+label) end if return 1 end function
function choose(s,ws,inventory) s.context.events=s.context.events+["choose"];return s.context.best end function
function select(s,client,weapon) s.context.events=s.context.events+[[client,weapon]];return void end function
function clock(s) s.context.events=s.context.events+["time"];return s.context.time end function
function entity(s,enemy) s.context.events=s.context.events+[enemy];return Entity(s.context.origin) end function
function contracts()
 count=0;s=ai.create();s.context=Context([],7,12.5,[13.9,-0.1,9.9]);s.chooseBestFn=choose;s.selectWeaponFn=select;s.floatTimeFn=clock;s.entityInfoFn=entity;b=bots.createBot(2);b.curPs=ps.create();b.ws=4;b.weaponnum=5
 b.curPs.weaponstate=1;ai.chooseWeapon(s,b);count=count+require(s.context.events==[[2,5]] and b.weaponnum==5,"raising keeps weapon")
 s.context.events=[];b.curPs.weaponstate=2;ai.chooseWeapon(s,b);count=count+require(s.context.events==[[2,5]],"dropping keeps weapon")
 s.context.events=[];b.curPs.weaponstate=0;s.context.best=5;ai.chooseWeapon(s,b);count=count+require(s.context.events==["choose",[2,5]] and b.weaponchangeTime==0.0,"same best weapon")
 s.context.events=[];s.context.best=7;ai.chooseWeapon(s,b);count=count+require(s.context.events==["choose","time",[2,7]] and b.weaponnum==7 and b.weaponchangeTime==12.5,"weapon change time and order")
 s.context.events=[];b.origin=[1.4,-4.1,2.2];ai.updateBattleInventory(s,b,9);count=count+require(s.context.events==[9],"entity query")
 count=count+require(b.inventory[ai.ENEMY_HEIGHT]==7,"enemy height truncation")
 count=count+require(b.inventory[ai.ENEMY_HORIZONTAL_DIST]==13,"horizontal distance truncation")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot inventory AI contracts\n");return 0 end function
