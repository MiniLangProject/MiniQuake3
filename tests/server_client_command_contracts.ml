// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.client_command as cc
import mq3.qcommon.message as message
struct Context events oks diagnostics end struct
function add(h,text) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+text;return void end function
function invoke(h,c,text,ok) add(h,"exec:"+text);h.context.oks=h.context.oks+[ok];return void end function
function drop(h,c,text) add(h,"drop:"+text);c.state=1;return void end function
function diagnostic(h,c,seq,text) h.context.diagnostics=h.context.diagnostics+1;return void end function
function host(now) h=cc.runtime();h.time=now;h.context=Context("",[],0);h.executeFn=invoke;h.dropFn=drop;h.diagnosticFn=diagnostic;return h end function
function packet(seq,text) m=message.init(2048);message.writeLong(m,seq);message.writeString(m,text);message.beginReading(m);return m end function
function req(value,label) if not value then return error(499,"server client command: "+label) end if;return 1 end function
function main(args)
 n=0
 c=cc.createClient();c.lastClientCommand=7;c.lastClientCommandString="old";c.nextReliableTime=22;h=host(100);n=n+req(cc.execute(h,c,packet(7,"dup")) and c.lastClientCommand==7 and c.lastClientCommandString=="old" and c.nextReliableTime==22 and h.context.events=="" and h.context.diagnostics==0,"duplicate no-op")
 n=n+req(cc.execute(h,c,packet(6,"older")) and h.context.events=="","old no-op")
 c=cc.createClient();c.lastClientCommand=3;h=host(100);n=n+req(not cc.execute(h,c,packet(5,"gap")) and c.lastClientCommand==3 and c.lastClientCommandString=="" and c.nextReliableTime==0,"gap rejected")
 n=n+req(h.context.events=="drop:Lost reliable commands" and h.context.diagnostics==1 and c.state==1,"gap drop boundary")
 c=cc.createClient();c.state=cc.CS_ACTIVE;c.lastClientCommand=3;h=host(100);n=n+req(cc.execute(h,c,packet(4,"say hi")) and c.lastClientCommand==4 and c.lastClientCommandString=="say hi","sequential state")
 n=n+req(c.nextReliableTime==1100 and h.context.events=="exec:say hi" and h.context.oks==[true],"sequential execute")
 c=cc.createClient();c.state=cc.CS_ACTIVE;c.nextReliableTime=101;c.lastClientCommand=8;h=host(100);h.floodProtect=true;n=n+req(cc.execute(h,c,packet(9,"flood")) and h.context.oks==[false],"active flood")
 n=n+req(c.lastClientCommand==9 and c.lastClientCommandString=="flood" and c.nextReliableTime==1100,"flood advances")
 c=cc.createClient();c.state=cc.CS_ACTIVE;c.nextReliableTime=100;c.lastClientCommand=0;h=host(100);n=n+req(cc.execute(h,c,packet(1,"edge")) and h.context.oks==[true],"time boundary")
 c=cc.createClient();c.state=3;c.nextReliableTime=999;c.lastClientCommand=0;h=host(1);n=n+req(cc.execute(h,c,packet(1,"primed")) and h.context.oks==[true],"primed exempt")
 c=cc.createClient();c.state=cc.CS_ACTIVE;c.nextReliableTime=999;c.lastClientCommand=0;h=host(1);h.floodProtect=false;n=n+req(cc.execute(h,c,packet(1,"free")) and h.context.oks==[true],"protection disabled")
 c=cc.createClient();c.state=cc.CS_ACTIVE;c.nextReliableTime=999;c.lastClientCommand=0;h=host(1);h.clientRunning=true;n=n+req(cc.execute(h,c,packet(1,"listen")) and h.context.oks==[true],"listen server exempt")
 c=cc.createClient();c.state=1;c.nextReliableTime=999;c.lastClientCommand=0;h=host(1);n=n+req(cc.execute(h,c,packet(1,"disconnect")) and h.context.oks==[true] and c.state==1,"zombie boundary")
 c=cc.createClient();c.state=cc.CS_ACTIVE;c.lastClientCommand=-2;h=host(-20);n=n+req(cc.execute(h,c,packet(-1,"negative")) and c.lastClientCommand==-1 and c.nextReliableTime==980,"signed sequence and time")
 c=cc.createClient();c.lastClientCommand=0;h=host(9);n=n+req(cc.execute(h,c,packet(1,"")) and c.lastClientCommandString=="","empty command")
 c=cc.createClient();h=host(0);n=n+req(try(cc.execute(void,c,packet(1,"x"))) is error,"missing host")
 n=n+req(try(cc.execute(h,void,packet(1,"x"))) is error,"missing client")
 n=n+req(try(cc.execute(h,c,void)) is error,"missing message")
 c=cc.createClient();c.lastClientCommand=0;h=host(5);h.executeFn=void;h.dropFn=void;h.diagnosticFn=void;n=n+req(cc.execute(h,c,packet(1,"callbacks optional")) and c.lastClientCommand==1,"optional callbacks")
 longText="";i=0;while i<1023 longText=longText+"x";i=i+1 end while;c=cc.createClient();h=host(0);n=n+req(cc.execute(h,c,packet(1,longText)) and len(c.lastClientCommandString)==1023,"maximum command string")
 print "PASS: "+str(n)+" server client-command contracts";return 0
end function
