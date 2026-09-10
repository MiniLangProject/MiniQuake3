import mq3.server.client_command as cc
import mq3.qcommon.message as message
struct Context events end struct
function add(h,text) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+text;return void end function
function executeCommand(h,c,text,ok) flag="0";if ok then flag="1" end if;add(h,"exec:"+flag+":"+text);return void end function
function drop(h,c,text) add(h,"drop:"+text);return void end function
function packet(sequence,text) m=message.init(2048);message.writeLong(m,sequence);message.writeString(m,text);message.beginReading(m);return m end function
function run(tag,prior,sequence,text,state,now,next,flood,local)
 c=cc.createClient();c.name="Player";c.lastClientCommand=prior;c.lastClientCommandString="prior";c.state=state;c.nextReliableTime=next
 h=cc.runtime();h.time=now;h.floodProtect=flood;h.clientRunning=local;h.context=Context("");h.executeFn=executeCommand;h.dropFn=drop
 result=cc.execute(h,c,packet(sequence,text));flag="0";if result then flag="1" end if
 print tag+"|"+flag+"|"+str(c.lastClientCommand)+"|"+str(c.nextReliableTime)+"|"+c.lastClientCommandString+"|"+h.context.events;return void
end function
function main(args)
 run("next",4,5,"say hi",cc.CS_ACTIVE,100,0,true,false)
 run("duplicate",5,5,"ignored",cc.CS_ACTIVE,100,50,true,false)
 run("old",5,3,"ignored",cc.CS_ACTIVE,100,50,true,false)
 run("gap",4,7,"lost",cc.CS_ACTIVE,100,50,true,false)
 run("flood",4,5,"say flood",cc.CS_ACTIVE,100,500,true,false)
 run("boundary",4,5,"say edge",cc.CS_ACTIVE,500,500,true,false)
 run("primed",4,5,"nextdl 1",3,100,500,true,false)
 run("noflood",4,5,"say free",cc.CS_ACTIVE,100,500,false,false)
 run("listen",4,5,"say local",cc.CS_ACTIVE,100,500,true,true)
 run("zombie",4,5,"disconnect",1,100,500,true,false)
 run("negative",-2,-1,"neg",cc.CS_ACTIVE,-20,0,true,false)
 return 0
end function
