// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.send_cmd as send
import mq3.client.netchan as clientNetchan
import mq3.client.frame as outerFrame
import mq3.qcommon.message as msgio
import mq3.qcommon.message_delta as delta
import mq3.qcommon.netchan as netchan

struct Context events packets end struct
function req(value,label) if not value then return error(7711,"client send: "+label) end if;return 1 end function
function event(host,text) host.context.events=host.context.events+[text];return void end function
function createCommand(host,state,msec,time) event(host,"create:"+str(msec));return delta.userCommand(time,1,2,3,4,5,6,-7,8) end function
function cvar(host,name,value) event(host,name+"="+value);return void end function
function diagnostic(host,text) event(host,"diag:"+text);return void end function
function captureTransmit(host,state,msg) host.context.packets=host.context.packets+[slice(msg.data,0,msg.cursize)];return state.outgoingSequence+1 end function
function host() value=send.services();value.context=Context([],[]);value.createCommandFn=createCommand;value.cvarFn=cvar;value.diagnosticFn=diagnostic;value.transmitFn=captureTransmit;return value end function
function active()
  state=send.create();state.connectionState=send.CA_ACTIVE;state.realtime=1000;state.lastPacketSentTime=0;state.remoteAddressType=send.NA_LOOPBACK
  state.serverId=70;state.serverMessageSequence=9;state.serverCommandSequence=2;state.snapValid=true;state.snapMessageNum=9;state.checksumFeed=0x13572468;return state
end function
function command(time,a,buttons,weapon,forward) return delta.userCommand(time,a,a+1,a+2,buttons,weapon,forward,0,0) end function
// Baseq3 indexes kbitmask[bits], so 16-bit keyed reads may preserve key bit 16.
// The protocol payload itself and gameplay button/angle bits remain the low 16.
function same(a,b) return a.serverTime==b.serverTime and (a.angles[0]&65535)==(b.angles[0]&65535) and (a.angles[1]&65535)==(b.angles[1]&65535) and (a.angles[2]&65535)==(b.angles[2]&65535) and (a.buttons&65535)==(b.buttons&65535) and a.weapon==b.weapon and a.forwardmove==b.forwardmove and a.rightmove==b.rightmove and a.upmove==b.upmove end function

function main(args)
  count=0;state=send.create();h=host()
  count=count+req(state.connectionState==1 and state.maxPackets==30 and state.packetDup==1 and state.outgoingSequence==1,"defaults")
  count=count+req(try(send.send(void,0,h)) is error and try(send.send(state,0,void)) is error,"missing inputs")
  count=count+req(send.send(state,10,h)=="disconnected" and state.cmdNumber==0,"disconnected guard")
  state.connectionState=send.CA_CONNECTED;state.serverRunning=true;state.serverPaused=true;state.clientPaused=true
  count=count+req(send.send(state,10,h)=="paused" and state.cmdNumber==0,"pause guard")
  count=count+req(not send.createNewCommand(state,250,h),"connected does not create command")
  state.connectionState=send.CA_PRIMED;count=count+req(send.createNewCommand(state,250,h) and state.frameMsec==200 and state.oldFrameTime==250 and state.cmdNumber==1,"command hitch clamp")
  count=count+req(state.commands[1].serverTime==250 and state.commands[1].forwardmove==6 and h.context.events[0]=="create:200","command callback")

  state=active();state.demoPlaying=true;count=count+req(not send.ready(state,h),"demo choke")
  state.demoPlaying=false;state.connectionState=send.CA_CINEMATIC;count=count+req(not send.ready(state,h),"cinematic choke")
  state.connectionState=send.CA_CONNECTED;state.downloadTempName="x";state.lastPacketSentTime=951;count=count+req(not send.ready(state,h),"download 50ms choke")
  state.realtime=1001;state.lanAddress=true;count=count+req(send.ready(state,h),"download boundary")
  state.downloadTempName="";state.lanAddress=false;state.lastPacketSentTime=2;state.realtime=1001;count=count+req(not send.ready(state,h),"pregame one-second choke")
  state.realtime=1002;state.remoteAddressType=send.NA_LOOPBACK;count=count+req(send.ready(state,h),"pregame boundary loopback")
  state.connectionState=send.CA_ACTIVE;state.remoteAddressType=4;state.lanAddress=true;count=count+req(send.ready(state,h),"LAN bypass")
  state.lanAddress=false;state.maxPackets=2;state.outPackets[0].realtime=990;state.outgoingSequence=1;state.realtime=1000;h=host();count=count+req(not send.ready(state,h) and state.maxPackets==15 and h.context.events==["cl_maxpackets=15"],"maxpackets low clamp")
  state.maxPackets=200;h=host();send.ready(state,h);count=count+req(state.maxPackets==125 and h.context.events==["cl_maxpackets=125"],"maxpackets high clamp")
  state.maxPackets=20;state.outPackets[0].realtime=951;state.realtime=1000;count=count+req(not send.ready(state,h),"rate strict boundary")
  state.realtime=1001;count=count+req(send.ready(state,h),"rate allowed boundary")

  state=active();h=host();state.outgoingSequence=5;state.packetDup=1;state.cmdNumber=2;state.outPackets[3].cmdNumber=0
  first=command(900,10,0x11,2,50);second=command(950,20,0x22,3,-40);state.commands[1]=first;state.commands[2]=second
  state.reliableAcknowledge=0;state.reliableSequence=2;state.reliableCommands[1]="say one";state.reliableCommands[2]="team two";state.serverCommands[2]="print server"
  written=send.writePacket(state,h);count=count+req(written.sent and written.commandCount==2 and written.moveType==send.CLC_MOVE,"write result")
  msg=written.message;msgio.beginReading(msg);count=count+req(msgio.readI32(msg)==70 and msgio.readI32(msg)==9 and msgio.readI32(msg)==2,"packet header")
  count=count+req(msgio.readU8(msg)==send.CLC_CLIENT_COMMAND and msgio.readI32(msg)==1 and msgio.readCString(msg)=="say one","reliable one")
  count=count+req(msgio.readU8(msg)==send.CLC_CLIENT_COMMAND and msgio.readI32(msg)==2 and msgio.readCString(msg)=="team two","reliable two")
  count=count+req(msgio.readU8(msg)==send.CLC_MOVE and msgio.readU8(msg)==2,"move header")
  old=send.zeroCommand();decoded=delta.readDeltaUsercmdKey(msg,written.key,old);decoded2=delta.readDeltaUsercmdKey(msg,written.key,decoded)
  count=count+req(same(decoded,first) and same(decoded2,second),"keyed usercmd roundtrip")
  count=count+req(written.key==(0x13572468^9^send.hashKey("print server",32)),"checksum key")
  count=count+req(state.outPackets[5].serverTime==950 and state.outPackets[5].realtime==1000 and state.outPackets[5].cmdNumber==2,"outpacket bookkeeping")
  count=count+req(state.lastPacketSentTime==1000 and state.outgoingSequence==6 and len(h.context.packets)==1,"transmit bookkeeping")

  state=active();h=host();state.cmdNumber=1;state.commands[1]=first;state.outPackets[send.PACKET_MASK].cmdNumber=0;state.noDelta=true
  count=count+req(send.writePacket(state,h).moveType==send.CLC_MOVE_NO_DELTA,"forced no-delta")
  state=active();h=host();state.packetDup=-4;send.writePacket(state,h);count=count+req(state.packetDup==0 and h.context.events[0]=="cl_packetdup=0","packetdup low clamp")
  state=active();h=host();state.packetDup=9;send.writePacket(state,h);count=count+req(state.packetDup==5 and h.context.events[0]=="cl_packetdup=5","packetdup high clamp")
  state=active();h=host();state.cmdNumber=50;state.outPackets[send.PACKET_MASK].cmdNumber=0;result=send.writePacket(state,h)
  count=count+req(result.commandCount==32 and h.context.events[0]=="diag:MAX_PACKET_USERCMDS","command count cap")
  state=active();h=host();state.reliableSequence=65;count=count+req(try(send.writePacket(state,h)) is error,"reliable overflow")
  state=active();h=host();state.demoPlaying=true;count=count+req(not send.writePacket(state,h).sent and state.outgoingSequence==1,"write demo guard")
  state=active();h=host();empty=send.writePacket(state,h).message;msgio.beginReading(empty);msgio.readI32(empty);msgio.readI32(empty);msgio.readI32(empty)
  count=count+req(msgio.readU8(empty)== -1,"no phantom reliable command")
  state=active();h=host();state.remoteAddressType=4;state.lanAddress=false;state.maxPackets=20;state.outPackets[0].realtime=1000;result=send.send(state,1010,h)
  count=count+req(result=="choked" and state.cmdNumber==1 and state.commands[1].serverTime==1010,"choke retains new command")

  captured=Context([],[]);runtime=netchan.init(27000);runtime.context=captured;runtime.sendPacketFn=transmitWire
  channel=netchan.setup(netchan.NS_CLIENT,netchan.Address(4,[127,0,0,1],27960),27000);connection=clientNetchan.createConnection();clientRuntime=clientNetchan.create(runtime,connection)
  live=send.liveServices(clientRuntime,channel);state=active();state.cmdNumber=1;state.commands[1]=first;state.outPackets[send.PACKET_MASK].cmdNumber=0
  send.writePacket(state,live);count=count+req(len(captured.packets)==1 and channel.outgoingSequence==2 and state.outgoingSequence==2,"live netchan transmit")
  count=count+req(len(captured.packets[0])>6 and captured.packets[0][4]==120 and captured.packets[0][5]==105,"live qport header")

  frameState=outerFrame.runtime();frameState.running=1;frameState.state=outerFrame.CA_ACTIVE;frameState.realtime=100
  frameHost=outerFrame.services();sendState=active();sendState.realtime=0;sendState.oldFrameTime=0;sendHost=host();outerFrame.attachSend(frameHost,sendState,sendHost)
  outerFrame.run(frameState,16,frameHost)
  count=count+req(sendState.connectionState==send.CA_ACTIVE and sendState.realtime==116 and sendState.cmdNumber==1,"outer frame synchronizes send state")
  count=count+req(len(sendHost.context.packets)==1 and sendState.lastPacketSentTime==116,"outer frame transmits command")
  print("PASS: "+str(count)+" client send-command contracts");return 0
end function

function transmitWire(runtime,sock,data,address) runtime.context.packets=runtime.context.packets+[data];return len(data) end function
