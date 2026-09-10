// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context events side end struct
function add(s,value) s.context.events=s.context.events+[value];return void end function
function side(s,b) return s.context.side end function
function bothBase(s,b) return add(s,"both-base") end function
function enemyAway(s,b) return add(s,"enemy-away") end function
function ownAway(s,b) return add(s,"own-away") end function
function bothAway(s,b) return add(s,"both-away") end function
function argsText(args) result="[";for index=0 to len(args)-1 if index>0 then result=result+", " end if;result=result+args[index] end for;return result+"]" end function
function chat(s,b,name,args) return add(s,"chat:"+name+":"+argsText(args)) end function
function order(s,b,client) return add(s,"order:"+str(client)) end function
function dump(s) for each value in s.context.events print value end for;s.context.events=[];return void end function
function fixture()
 s=team.create();s.context=Context([],1);s.teamFn=side;s.ctfBothAtBaseFn=bothBase;s.ctfEnemyNotAtBaseFn=enemyAway;s.ctfOwnNotAtBaseFn=ownAway;s.ctfBothNotAtBaseFn=bothAway;s.initialChatFn=chat;s.orderAlwaysFn=order;return s
end function
function main(args)
 s=fixture();b=bots.createBot(2)
 for red=0 to 1 for blue=0 to 1 team.ctfOrders(s,b,red,blue);dump(s) end for end for
 s.context.side=2;for red=0 to 1 for blue=0 to 1 team.ctfOrders(s,b,red,blue);dump(s) end for end for
 s.names[2]="Leader";s.names[3]="Three";s.names[4]="Four";team.createGroup(s,b,[2,3,4],3);dump(s)
 team.createGroup(s,b,[3,2,4],3);dump(s)
 return 0
end function
