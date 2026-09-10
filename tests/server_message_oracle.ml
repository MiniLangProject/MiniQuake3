import mq3.client.server_message as client
import mq3.server.snapshot_delta as server
import mq3.qcommon.message as message
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
function ent(number,value) e=entitystate.create();e.number=number;e.eType=value;return e end function
function command(msg,seq,text) message.writeByte(msg,client.SVC_SERVER_COMMAND);message.writeLong(msg,seq);message.writeString(msg,text);return void end function
struct HostState game download end struct
function gameHost(state,msg) state.context.game=state.context.game+1;return void end function
function downloadHost(state,msg) state.context.download=state.context.download+1;return void end function
function dump(tag,state) s=state.snapshotState;valid=0;fresh=0;if s.snap.valid then valid=1 end if;if s.newSnapshots then fresh=1 end if;print tag+"|ack="+str(state.reliableAcknowledge)+"|seq="+str(state.serverCommandSequence)+"|c1="+state.serverCommands[1]+"|c2="+state.serverCommands[2]+"|snap="+str(valid)+","+str(s.snap.messageNum)+","+str(s.snap.serverCommandNum)+","+str(s.snap.serverTime)+"|ring="+str(s.entityState.parseEntitiesNum)+"|new="+str(fresh)+"|host=0,0" end function
function main(args)
 state=client.create(void);state.reliableSequence=5;s=state.snapshotState;s.serverMessageSequence=11;s.outgoingSequence=1;s.realtime=900;s.entityState.entityBaselines[2]=ent(2,0)
 p=playerstate.create();p.commandTime=500;frame=server.packetFrame(0,1,bytes([3]),p);wire=message.init(4096);message.writeLong(wire,4);message.writeByte(wire,client.SVC_NOP);command(wire,1,"cp alpha");command(wire,2,"print beta");command(wire,2,"ignored");server.writeSnapshotPayload(wire,void,frame,[ent(2,9)],1,[ent(2,0)],700,0,1);message.writeByte(wire,client.SVC_EOF);message.beginReading(wire);client.parseServerMessage(state,wire);dump("stream",state)
 wire=message.init(4096);s.newSnapshots=false;state.reliableSequence=70;message.writeLong(wire,-100);command(wire,2,"duplicate");command(wire,65,"ring sixtyfive");message.writeByte(wire,client.SVC_EOF);message.beginReading(wire);client.parseServerMessage(state,wire);dump("repair",state)
 state.context=HostState(0,0);state.gamestateFn=gameHost;state.downloadFn=downloadHost;wire=message.init(64);message.writeLong(wire,70);message.writeByte(wire,client.SVC_GAMESTATE);message.writeByte(wire,client.SVC_DOWNLOAD);message.writeByte(wire,client.SVC_EOF);message.beginReading(wire);client.parseServerMessage(state,wire);print "hosts|ack="+str(state.reliableAcknowledge)+"|seq="+str(state.serverCommandSequence)+"|c1="+state.serverCommands[1]+"|c2="+state.serverCommands[2]+"|snap=1,11,2,700|ring=1|new=0|host="+str(state.context.game)+","+str(state.context.download);return 0
end function
