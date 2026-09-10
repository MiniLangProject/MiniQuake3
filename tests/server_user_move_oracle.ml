import mq3.server.user_move as move
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as delta

struct Context events enterActivates kickAfterThink end struct
function add(host,text) if host.context.events!="" then host.context.events=host.context.events+"," end if;host.context.events=host.context.events+text;return void end function
function game(host,clientState) add(host,"gamestate");return void end function
function enter(host,clientState,command) add(host,"enter");if host.context.enterActivates then clientState.state=move.CS_ACTIVE end if;return void end function
function drop(host,clientState,text) add(host,"drop");clientState.state=1;return void end function
function think(host,clientState,command) add(host,"think");if host.context.kickAfterThink then clientState.state=2 end if;return void end function
function diagnostic(host,clientState,text) add(host,"diagnostic");return void end function
function host(kick) h=move.services();h.context=Context("",true,kick);h.sendGamestateFn=game;h.enterWorldFn=enter;h.dropFn=drop;h.thinkFn=think;h.diagnosticFn=diagnostic;return h end function
function command(time,button) return delta.userCommand(time,0,0,0,button,0,0,0,0) end function
function writeFullCommand(m,key,old,current)
 message.writeBits(m,0,1);message.writeBits(m,current.serverTime,32)
 if delta.samePayload(old,current) then message.writeBits(m,0,1);return void end if
 keyed=key^current.serverTime;message.writeBits(m,1,1)
 delta.writeDeltaKey(m,keyed,old.angles[0],current.angles[0],16);delta.writeDeltaKey(m,keyed,old.angles[1],current.angles[1],16);delta.writeDeltaKey(m,keyed,old.angles[2],current.angles[2],16)
 delta.writeDeltaKey(m,keyed,old.forwardmove,current.forwardmove,8);delta.writeDeltaKey(m,keyed,old.rightmove,current.rightmove,8);delta.writeDeltaKey(m,keyed,old.upmove,current.upmove,8)
 delta.writeDeltaKey(m,keyed,old.buttons,current.buttons,16);delta.writeDeltaKey(m,keyed,old.weapon,current.weapon,8);return void
end function
function packet(count,commands,key)
 m=message.init(2048);message.writeByte(m,count)
 old=move.zeroCommand();for each current in commands writeFullCommand(m,key,old,current);old=current end for
 message.beginReading(m);return m
end function
function run(tag,state,isDelta,pure,auth,cp,ma,ra,last,reliable,count,times,kick)
 c=move.createClient();c.state=state;c.messageAcknowledge=ma;c.reliableAcknowledge=ra;c.deltaMessage=77;c.pureAuthentic=auth;c.gotCP=cp;c.lastUsercmd=command(last,0);c.reliableCommands[ra&63]=reliable
 commands=[];if count>0 and count<=move.MAX_PACKET_USERCMDS then index=0;for each time in times commands=commands+[command(time,index+1)];index=index+1 end for end if
 key=0x13572468^ma^move.hashKey(reliable,32);h=host(kick);move.execute(move.createServer(0x13572468,9000,pure),c,h,packet(count,commands,key),isDelta)
 observedKey=0;if count>0 and count<=move.MAX_PACKET_USERCMDS then observedKey=key end if
 print tag+"|"+str(c.state)+"|"+str(c.deltaMessage)+"|"+str(c.frames[ma&31].messageAcked)+"|"+str(c.lastUsercmd.serverTime)+"|"+str(observedKey)+"|"+h.context.events;return void
end function
function main(args)
 run("empty",move.CS_ACTIVE,true,0,1,true,7,0,0,"",0,[],false)
 run("too_many",move.CS_ACTIVE,false,0,1,true,7,0,0,"",33,[],false)
 run("active",move.CS_ACTIVE,true,0,1,true,7,0,95,"",3,[100,110,120],false)
 run("duplicates",move.CS_ACTIVE,true,0,1,true,8,0,100,"",4,[90,105,104,120],false)
 run("map_restart_order",move.CS_ACTIVE,true,0,1,true,9,0,0,"",3,[300,200,250],false)
 run("no_delta",move.CS_ACTIVE,false,0,1,true,10,0,0,"",1,[100],false)
 run("pure_wait_active",move.CS_ACTIVE,true,1,0,false,11,0,0,"",1,[100],false)
 run("pure_wait_primed",move.CS_PRIMED,true,1,0,false,12,0,0,"",1,[100],false)
 run("primed",move.CS_PRIMED,true,1,1,true,13,0,0,"",1,[100],false)
 run("pure_bad",move.CS_PRIMED,true,1,0,true,14,0,0,"",1,[100],false)
 run("inactive",2,true,0,1,true,15,0,0,"",1,[100],false)
 run("kick_mid_burst",move.CS_ACTIVE,true,0,1,true,16,3,0,"alpha beta",2,[100,110],true)
 return 0
end function
