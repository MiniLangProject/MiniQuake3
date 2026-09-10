import mq3.server.user_move as move
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as delta

struct Context events thoughts enterCommand dropText end struct
function require(condition,label) if not condition then print "FAIL: "+label;return error(6991,label) end if;return void end function
function add(host,text) if host.context.events!="" then host.context.events=host.context.events+"," end if;host.context.events=host.context.events+text;return void end function
function game(host,clientState) add(host,"game");return void end function
function enter(host,clientState,command) add(host,"enter");host.context.enterCommand=command.serverTime;clientState.state=move.CS_ACTIVE;return void end function
function drop(host,clientState,text) add(host,"drop");host.context.dropText=text;clientState.state=1;return void end function
function think(host,clientState,command) add(host,"think");host.context.thoughts=host.context.thoughts+[command.serverTime,command.buttons];return void end function
function kickThink(host,clientState,command) think(host,clientState,command);clientState.state=2;return void end function
function diagnostic(host,clientState,text) add(host,text);return void end function
function host() h=move.services();h.context=Context("",[],0,"");h.sendGamestateFn=game;h.enterWorldFn=enter;h.dropFn=drop;h.thinkFn=think;h.diagnosticFn=diagnostic;return h end function
function command(time,angle,buttons,forward) return delta.userCommand(time,angle,angle+1,angle+2,buttons,angle&255,forward,0,0) end function
function writeFullCommand(m,key,old,current)
 message.writeBits(m,0,1);message.writeBits(m,current.serverTime,32)
 if delta.samePayload(old,current) then message.writeBits(m,0,1);return void end if
 keyed=key^current.serverTime;message.writeBits(m,1,1)
 delta.writeDeltaKey(m,keyed,old.angles[0],current.angles[0],16);delta.writeDeltaKey(m,keyed,old.angles[1],current.angles[1],16);delta.writeDeltaKey(m,keyed,old.angles[2],current.angles[2],16)
 delta.writeDeltaKey(m,keyed,old.forwardmove,current.forwardmove,8);delta.writeDeltaKey(m,keyed,old.rightmove,current.rightmove,8);delta.writeDeltaKey(m,keyed,old.upmove,current.upmove,8)
 delta.writeDeltaKey(m,keyed,old.buttons,current.buttons,16);delta.writeDeltaKey(m,keyed,old.weapon,current.weapon,8);return void
end function
function packet(count,commands,key)
 m=message.init(4096);message.writeByte(m,count);old=move.zeroCommand()
 for each current in commands writeFullCommand(m,key,old,current);old=current end for
 message.beginReading(m);return m
end function
function setup(state,ma,ra,last,reliable)
 c=move.createClient();c.state=state;c.messageAcknowledge=ma;c.reliableAcknowledge=ra;c.lastUsercmd=command(last,0,0,0);c.reliableCommands[ra&63]=reliable;return c
end function
function key(c,feed) return feed^c.messageAcknowledge^move.hashKey(c.reliableCommands[c.reliableAcknowledge&63],32) end function
function run(server,c,h,isDelta,commands) return move.execute(server,c,h,packet(len(commands),commands,key(c,server.checksumFeed)),isDelta) end function
function main(args)
  require(move.hashKey("",32)==0,"empty hash")
  require(move.hashKey("a",32)==11548,"one-byte hash")
  require(move.hashKey("alpha beta",32)==118685,"command hash")
  require(move.hashKey("abcdefghijklmnopqrstuvwxyz0123456789",32)==420691,"hash 32-byte cap")

  server=move.createServer(0x13572468,9000,0);c=setup(move.CS_ACTIVE,7,0,0,"");h=host()
  result=move.execute(server,c,h,packet(0,[],key(c,server.checksumFeed)),true)
  require(result=="empty" and c.deltaMessage==7,"empty count keeps delta selection")
  require(c.frames[7&31].messageAcked==0 and h.context.events=="cmdCount < 1","empty count exits before ack")

  c=setup(move.CS_ACTIVE,8,0,0,"");h=host();result=move.execute(server,c,h,packet(33,[],key(c,server.checksumFeed)),false)
  require(result=="tooMany" and c.deltaMessage==-1,"oversize count")
  require(c.frames[8&31].messageAcked==0 and h.context.events=="cmdCount > MAX_PACKET_USERCMDS","oversize exits before decode")

  c=setup(move.CS_ACTIVE,9,0,95,"");h=host();commands=[command(100,1,10,-128),command(110,2,20,127),command(120,3,30,-1)]
  result=run(server,c,h,true,commands)
  require(result==3 and c.deltaMessage==9,"delta burst result")
  require(c.frames[9].messageAcked==9000,"frame acknowledgement time")
  // Baseq3 indexes kbitmask with bits, preserving its one-extra-bit key quirk.
  require(len(h.context.thoughts)==6 and h.context.thoughts[0]==100 and h.context.thoughts[1]==65546 and h.context.thoughts[5]==65566,"decoded think fields")
  require(c.lastUsercmd.serverTime==120 and c.lastUsercmd.forwardmove==-1,"last command copied")

  c=setup(move.CS_ACTIVE,10,0,100,"");h=host();result=run(server,c,h,true,[command(90,0,1,0),command(105,0,2,0),command(104,0,3,0),command(120,0,4,0)])
  require(result==2,"duplicate and newly stale command count")
  require(h.context.thoughts[0]==105 and h.context.thoughts[2]==120,"duplicate timing order")

  c=setup(move.CS_ACTIVE,11,0,0,"");h=host();result=run(server,c,h,true,[command(300,0,1,0),command(200,0,2,0),command(250,0,3,0)])
  require(result==2 and h.context.thoughts[0]==200 and h.context.thoughts[2]==250,"map-restart future command ignored")

  c=setup(move.CS_ACTIVE,12,0,0,"");h=host();result=run(server,c,h,false,[command(100,0,1,0)])
  require(result==1 and c.deltaMessage==-1,"no-delta selection remains minus one")

  pureServer=move.createServer(17,12345,1);c=setup(move.CS_ACTIVE,13,0,0,"");c.pureAuthentic=0;c.gotCP=false;h=host();result=run(pureServer,c,h,true,[command(100,0,1,0)])
  require(result=="awaitingPure" and h.context.events=="game","active missing cp resends gamestate")
  require(c.frames[13].messageAcked==12345 and c.lastUsercmd.serverTime==0,"pure wait records ack but does not think")

  c=setup(move.CS_PRIMED,14,0,0,"");c.pureAuthentic=0;c.gotCP=false;h=host();result=run(pureServer,c,h,true,[command(100,0,1,0)])
  require(result=="awaitingPure" and h.context.events=="" and c.state==move.CS_PRIMED,"primed missing cp ignored")

  c=setup(move.CS_PRIMED,15,0,0,"");c.pureAuthentic=1;c.gotCP=true;h=host();result=run(pureServer,c,h,true,[command(100,0,1,0),command(110,0,2,0)])
  require(result==2 and h.context.events=="enter,think,think","primed enters before movement")
  require(h.context.enterCommand==100 and c.state==move.CS_ACTIVE,"enter uses first command")

  c=setup(move.CS_PRIMED,16,0,0,"");c.pureAuthentic=0;c.gotCP=true;h=host();result=run(pureServer,c,h,true,[command(100,0,1,0)])
  require(result=="invalidPure" and h.context.events=="enter,drop","bad pure enters then drops")
  require(h.context.dropText=="Cannot validate pure client!" and c.lastUsercmd.serverTime==0,"pure drop reason and no think")

  c=setup(2,17,0,0,"");h=host();result=run(server,c,h,true,[command(100,0,1,0)])
  require(result=="inactive" and c.deltaMessage==-1,"inactive client forces full snapshots")
  require(c.frames[17].messageAcked==9000 and h.context.events=="","inactive still acknowledges frame")

  c=setup(move.CS_ACTIVE,18,0,0,"");h=host();h.thinkFn=kickThink;result=run(server,c,h,true,[command(100,0,1,0),command(110,0,2,0)])
  require(result==2 and h.context.events=="think","loop continues after kick without VM call")
  require(c.lastUsercmd.serverTime==110 and c.state==2,"post-kick command still updates lastUsercmd")

  c=setup(move.CS_ACTIVE,19,5,0,"alpha beta");h=host();expectedKey=key(c,server.checksumFeed);commands=[command(700,321,0xabcd,-77)];result=run(server,c,h,true,commands)
  require(expectedKey==(0x13572468^19^118685),"checksum/message/reliable key")
  require(result==1 and c.lastUsercmd.angles[0]==321 and c.lastUsercmd.buttons==0xabcd and c.lastUsercmd.forwardmove==-77,"keyed usercmd payload")

  c=setup(move.CS_ACTIVE,51,0,0,"");h=host();run(server,c,h,true,[command(100,0,1,0)])
  require(c.frames[19].messageAcked==9000,"packet frame ring mask")
  print "PASS: 30 server user-move contracts";return 0
end function
