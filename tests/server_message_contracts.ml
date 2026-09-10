import mq3.client.server_message as client
import mq3.client.snapshot_command as snapshot
import mq3.server.reliable_commands as reliable
import mq3.server.snapshot_delta as server
import mq3.qcommon.message as message
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate

function req(ok,text) if not ok then return error(6895,text) end if;return 1 end function
function ent(number,value) e=entitystate.create();e.number=number;e.eType=value;return e end function
struct HostState game download end struct
function gameHost(state,msg) state.context.game=state.context.game+1;return void end function
function downloadHost(state,msg) state.context.download=state.context.download+1;return void end function

function main(args)
  count=0;sender=reliable.create();reliable.add(sender,"cp alpha");reliable.add(sender,"print beta")
  p=playerstate.create();p.commandTime=500;frame=server.packetFrame(0,1,bytes([3]),p);wire=message.init(4096)
  snapshotRing=[ent(2,9)];message.writeLong(wire,4);reliable.updateServerCommandsToClient(sender,wire);server.writeSnapshotPayload(wire,void,frame,snapshotRing,len(snapshotRing),[ent(2,0)],700,0,1);message.writeByte(wire,client.SVC_EOF)
  state=client.create(void);state.reliableSequence=5;state.snapshotState.serverMessageSequence=11;state.snapshotState.outgoingSequence=1;state.snapshotState.realtime=900
  message.beginReading(wire);result=client.parseServerMessage(state,wire)
  count=count+req(result==[2,1] and state.reliableAcknowledge==4,"ack and dispatch counts")
  count=count+req(state.serverCommandSequence==2 and state.serverCommands[1]=="cp alpha" and state.serverCommands[2]=="print beta","command ring")
  count=count+req(state.snapshotState.snap.valid and state.snapshotState.snap.serverCommandNum==2 and state.snapshotState.snap.serverTime==700,"snapshot sees commands")
  count=count+req(state.snapshotState.snap.numEntities==1 and state.snapshotState.entityState.parseEntities[0].number==2,"snapshot entity")
  duplicate=message.init(256);message.writeLong(duplicate,-100);message.writeByte(duplicate,client.SVC_SERVER_COMMAND);message.writeLong(duplicate,2);message.writeString(duplicate,"ignored");message.writeByte(duplicate,client.SVC_EOF);message.beginReading(duplicate)
  state.reliableSequence=10;result=client.parseServerMessage(state,duplicate)
  count=count+req(result==[0,0] and state.reliableAcknowledge==10 and state.serverCommands[2]=="print beta","stale ack repair and duplicate")
  wrap=message.init(128);message.writeLong(wrap,10);message.writeByte(wrap,client.SVC_SERVER_COMMAND);message.writeLong(wrap,65);message.writeString(wrap,"wrapped");message.writeByte(wrap,client.SVC_EOF);message.beginReading(wrap);client.parseServerMessage(state,wrap)
  count=count+req(state.serverCommandSequence==65 and state.serverCommands[1]=="wrapped","absolute sequence ring mask")
  nop=message.init(64);message.writeLong(nop,10);message.writeByte(nop,client.SVC_NOP);message.writeByte(nop,client.SVC_EOF);message.beginReading(nop)
  count=count+req(client.parseServerMessage(state,nop)==[0,0],"nop")
  bad=message.init(64);message.writeLong(bad,0);message.writeByte(bad,client.SVC_BAD);message.beginReading(bad)
  count=count+req(try(client.parseServerMessage(client.create(void),bad)) is error,"bad opcode")
  short=message.init(64);message.writeLong(short,0);message.writeByte(short,client.SVC_SERVER_COMMAND);message.writeLong(short,3);message.beginReading(short)
  count=count+req(try(client.parseServerMessage(client.create(void),short)) is error,"truncated command")
  hosts=client.create(void);hosts.context=HostState(0,0);hosts.gamestateFn=gameHost;hosts.downloadFn=downloadHost;wire=message.init(64);message.writeLong(wire,0);message.writeByte(wire,client.SVC_GAMESTATE);message.writeByte(wire,client.SVC_DOWNLOAD);message.writeByte(wire,client.SVC_EOF);message.beginReading(wire);client.parseServerMessage(hosts,wire)
  count=count+req(hosts.context.game==1 and hosts.context.download==1,"gamestate and download host dispatch")
  print("PASS: "+str(count)+" client server-message contracts");return 0
end function
