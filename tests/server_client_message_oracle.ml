import mq3.server.client_message as cm
import mq3.qcommon.message as message
struct Context events accept end struct
function add(h,text) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+text;return void end function
function command(h,c,m) add(h,"command");return h.context.accept end function
function move(h,c,m,delta) if delta then add(h,"move:delta") else add(h,"move:nodelta") end if;return void end function
function game(h,c) add(h,"gamestate");return void end function
function drop(h,c,text) add(h,"drop");return void end function
function host(accept) h=cm.services();h.context=Context("",accept);h.clientCommandFn=command;h.userMoveFn=move;h.sendGamestateFn=game;h.dropFn=drop;return h end function
function packet(si,ma,ra,ops) m=message.init(128);message.writeLong(m,si);message.writeLong(m,ma);message.writeLong(m,ra);for each op in ops message.writeByte(m,op) end for;message.beginReading(m);return m end function
function run(tag,si,ma,ra,ops,c,accept) h=host(accept);cm.execute(cm.createServer(100,90),c,h,packet(si,ma,ra,ops));print tag+"|"+str(c.state)+"|"+str(c.messageAcknowledge)+"|"+str(c.reliableAcknowledge)+"|"+h.context.events;return void end function
function main(args)
 c=cm.createClient();run("eof",100,7,2,[cm.CLC_EOF],c,true)
 c=cm.createClient();run("negative",100,-1,0,[cm.CLC_EOF],c,true)
 c=cm.createClient();c.reliableSequence=100;run("stale",100,1,35,[cm.CLC_EOF],c,true)
 c=cm.createClient();run("old",95,1,0,[cm.CLC_EOF],c,true)
 c=cm.createClient();c.gamestateMessageNum=2;run("resend",80,3,0,[cm.CLC_EOF],c,true)
 c=cm.createClient();c.gamestateMessageNum=3;run("wrong",80,3,0,[cm.CLC_EOF],c,true)
 c=cm.createClient();c.downloadName="pak";run("download",80,3,0,[cm.CLC_EOF],c,true)
 c=cm.createClient();c.lastClientCommandString="nextdl 4";run("nextdl",80,3,0,[cm.CLC_EOF],c,true)
 c=cm.createClient();run("move",100,1,0,[cm.CLC_CLIENT_COMMAND,cm.CLC_MOVE],c,true)
 c=cm.createClient();run("nodelta",100,1,0,[cm.CLC_MOVE_NO_DELTA],c,true)
 c=cm.createClient();run("reject",100,1,0,[cm.CLC_CLIENT_COMMAND,cm.CLC_MOVE],c,false)
 c=cm.createClient();c.state=cm.CS_ZOMBIE;run("zombie",100,1,0,[cm.CLC_CLIENT_COMMAND,cm.CLC_MOVE],c,true)
 c=cm.createClient();run("bad",100,1,0,[99],c,true);return 0
end function
