// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context events side end struct
function require(v,label) if not v then return error(499,"Bot team strategy contract: "+label) end if return 1 end function
function add(s,value) s.context.events=s.context.events+[value];return void end function
function side(s,b) return s.context.side end function
function bothBase(s,b) return add(s,"base") end function
function enemyAway(s,b) return add(s,"enemy") end function
function ownAway(s,b) return add(s,"own") end function
function bothAway(s,b) return add(s,"both") end function
function chat(s,b,name,args) return add(s,[name,args]) end function
function order(s,b,client) return add(s,["order",client]) end function
function fixture() s=team.create();s.context=Context([],1);s.teamFn=side;s.ctfBothAtBaseFn=bothBase;s.ctfEnemyNotAtBaseFn=enemyAway;s.ctfOwnNotAtBaseFn=ownAway;s.ctfBothNotAtBaseFn=bothAway;s.initialChatFn=chat;s.orderAlwaysFn=order;return s end function
function contracts()
 count=0;s=fixture();b=bots.createBot(2);expected=["base","enemy","own","both"];index=0
 for red=0 to 1 for blue=0 to 1 s.context.events=[];team.ctfOrders(s,b,red,blue);count=count+require(s.context.events==[expected[index]],"red flag dispatch "+str(index));index=index+1 end for end for
 s.context.side=2;expected=["base","own","enemy","both"];index=0
 for red=0 to 1 for blue=0 to 1 s.context.events=[];team.ctfOrders(s,b,red,blue);count=count+require(s.context.events==[expected[index]],"blue flag dispatch "+str(index));index=index+1 end for end for
 s.names[2]="Leader";s.names[3]="Three";s.names[4]="Four";s.context.events=[];team.createGroup(s,b,[2,3,4],3)
 count=count+require(s.context.events==[["cmd_accompanyme",["Three"]],["order",3],["cmd_accompanyme",["Four"]],["order",4]],"self-led group")
 s.context.events=[];team.createGroup(s,b,[3,2,4],3);count=count+require(s.context.events==[["cmd_accompany",["Leader","Three"]],["order",2],["cmd_accompany",["Four","Three"]],["order",4]],"other-led group")
 s.context.events=[];team.createGroup(s,b,[2],1);count=count+require(s.context.events==[],"single-member group")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot team strategy contracts\n");return 0 end function
