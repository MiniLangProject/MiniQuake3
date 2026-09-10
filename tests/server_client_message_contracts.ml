// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.client_message as cm
import mq3.qcommon.message as msgio
struct Context events end struct
function add(h,text) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+text;return void end function
function command(h,c,m) sequence=msgio.readI32(m);text=msgio.readCString(m);c.lastClientCommandString=text;add(h,"cmd:"+str(sequence)+":"+text);return text!="reject" end function
function move(h,c,m,delta) if delta then add(h,"move:delta") else add(h,"move:nodelta") end if;return void end function
function game(h,c) add(h,"gamestate");return void end function
function drop(h,c,text) add(h,"drop");return void end function
function diagnostic(h,c,op) add(h,"bad:"+str(op));return void end function
function host() h=cm.services();h.context=Context("");h.clientCommandFn=command;h.userMoveFn=move;h.sendGamestateFn=game;h.dropFn=drop;h.diagnosticFn=diagnostic;return h end function
function req(v,label) if not v then return error(499,"server client message: "+label) end if;return 1 end function
function packet(serverId,messageAck,reliableAck,ops) m=msgio.init(1024);msgio.writeLong(m,serverId);msgio.writeLong(m,messageAck);msgio.writeLong(m,reliableAck);for each op in ops msgio.writeByte(m,op) end for;msgio.beginReading(m);return m end function
function commandPacket(serverId,messageAck,reliableAck,sequence,text,tail) m=msgio.init(1024);msgio.writeLong(m,serverId);msgio.writeLong(m,messageAck);msgio.writeLong(m,reliableAck);msgio.writeByte(m,cm.CLC_CLIENT_COMMAND);msgio.writeLong(m,sequence);msgio.writeString(m,text);msgio.writeByte(m,tail);msgio.beginReading(m);return m end function
function main(args)
  n=0;s=cm.createServer(100,90);c=cm.createClient();h=host()
  result=cm.execute(s,c,h,packet(100,7,2,[cm.CLC_EOF]));n=n+req(result=="eof" and c.messageAcknowledge==7 and c.reliableAcknowledge==2,"header and eof")
  c=cm.createClient();h=host();result=cm.execute(s,c,h,packet(100,-1,0,[cm.CLC_EOF]));n=n+req(result=="negativeMessageAck" and h.context.events=="drop","negative message ack")
  c=cm.createClient();c.reliableSequence=100;h=host();result=cm.execute(s,c,h,packet(100,1,35,[cm.CLC_EOF]));n=n+req(result=="staleReliableAck" and c.reliableAcknowledge==100 and h.context.events=="drop","stale reliable repair")
  c=cm.createClient();h=host();result=cm.execute(s,c,h,packet(95,1,0,[cm.CLC_EOF]));n=n+req(result=="oldServerId" and h.context.events=="","restart range ignored")
  c=cm.createClient();c.gamestateMessageNum=2;h=host();result=cm.execute(s,c,h,packet(80,3,0,[cm.CLC_EOF]));n=n+req(result=="resendGamestate" and h.context.events=="gamestate","lost gamestate resend")
  c=cm.createClient();c.gamestateMessageNum=3;h=host();n=n+req(cm.execute(s,c,h,packet(80,3,0,[cm.CLC_EOF]))=="wrongServerId","wrong id ignored")
  c=cm.createClient();c.downloadName="pak.pk3";h=host();n=n+req(cm.execute(s,c,h,packet(80,3,0,[cm.CLC_EOF]))=="eof","download bypass")
  c=cm.createClient();c.lastClientCommandString="nextdl 4";h=host();n=n+req(cm.execute(s,c,h,packet(80,3,0,[cm.CLC_EOF]))=="eof","nextdl bypass")
  c=cm.createClient();h=host();result=cm.execute(s,c,h,commandPacket(100,1,0,9,"say hi",cm.CLC_MOVE));n=n+req(result=="move" and h.context.events=="cmd:9:say hi,move:delta","command then delta move")
  c=cm.createClient();h=host();result=cm.execute(s,c,h,commandPacket(100,1,0,9,"say hi",cm.CLC_MOVE_NO_DELTA));n=n+req(result=="moveNoDelta" and h.context.events=="cmd:9:say hi,move:nodelta","no-delta move")
  c=cm.createClient();h=host();result=cm.execute(s,c,h,commandPacket(100,1,0,9,"reject",cm.CLC_EOF));n=n+req(result=="commandRejected" and h.context.events=="cmd:9:reject","flood rejection")
  c=cm.createClient();c.state=cm.CS_ZOMBIE;h=host();n=n+req(cm.execute(s,c,h,commandPacket(100,1,0,9,"disconnect",cm.CLC_EOF))=="zombie","disconnect zombie")
  c=cm.createClient();h=host();result=cm.execute(s,c,h,packet(100,1,0,[99]));n=n+req(result=="badCommand" and h.context.events=="bad:99","bad opcode")
  c=cm.createClient();h=host();m=msgio.init(1024);msgio.writeLong(m,100);msgio.writeLong(m,1);msgio.writeLong(m,0);msgio.writeByte(m,cm.CLC_CLIENT_COMMAND);msgio.writeLong(m,1);msgio.writeString(m,"one");msgio.writeByte(m,cm.CLC_CLIENT_COMMAND);msgio.writeLong(m,2);msgio.writeString(m,"two");msgio.writeByte(m,cm.CLC_EOF);msgio.beginReading(m);result=cm.execute(s,c,h,m);n=n+req(result=="eof" and h.context.events=="cmd:1:one,cmd:2:two","multiple commands")
  n=n+req(try(cm.execute(void,c,h,m)) is error,"missing state rejected")
  print "PASS: "+str(n)+" server client-message contracts";return 0
end function
