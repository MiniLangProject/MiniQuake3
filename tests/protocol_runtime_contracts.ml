import mq3.client.protocol_runtime as protocol
import mq3.client.server_message as serverMessage
import mq3.client.gamestate as gamestate
import mq3.client.download as download
import mq3.server.snapshot_delta as server
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
struct Context events end struct
function req(v,s) if not v then return error(6930,"client protocol: "+s) end if;return 1 end function
function event(host,text) host.context.events=host.context.events+[text];return void end function
function cval(h,n,v) event(h,"cv:"+n+"="+str(v)) end function
function reliable(h,v) event(h,"cmd:"+v) end function
function open(h,n) event(h,"open:"+n);return 7 end function
function write(h,d,n,f) event(h,"write:"+str(n)+":"+str(d[0])) end function
function services() h=download.services();h.context=Context([]);h.cvarValueFn=cval;h.reliableFn=reliable;h.openFn=open;h.writeFn=write;return h end function
function ent(number,value) e=entitystate.create();e.number=number;e.eType=value;return e end function
function gamestatePayload(m)
  zero=entitystate.create();base=ent(7,3);message.writeLong(m,5);message.writeByte(m,gamestate.SVC_CONFIGSTRING);message.writeShort(m,1);message.writeBigString(m,"\\sv_serverid\\9");message.writeByte(m,gamestate.SVC_BASELINE);delta.writeDeltaEntity(m,zero,base,true);message.writeByte(m,gamestate.SVC_EOF);message.writeLong(m,2);message.writeLong(m,0x1234);return base
end function
function main(args)
 c=0;host=services();runtime=protocol.create(host);d=runtime.dispatcher;runtime.downloadState.downloadTempName="tmp";runtime.downloadState.downloadName="final";d.reliableSequence=70;d.snapshotState.serverMessageSequence=11;d.snapshotState.outgoingSequence=1;d.snapshotState.realtime=900;d.snapshotState.snap.valid=true;d.snapshotState.entityState.parseEntitiesNum=9
 wire=message.init(8192);message.writeLong(wire,-100);message.writeByte(wire,serverMessage.SVC_GAMESTATE);base=gamestatePayload(wire);message.writeByte(wire,serverMessage.SVC_DOWNLOAD);message.writeShort(wire,0);message.writeLong(wire,1);message.writeShort(wire,1);message.writeByte(wire,9)
 p=playerstate.create();p.commandTime=500;frame=server.packetFrame(0,1,bytes([3]),p);server.writeSnapshotPayload(wire,void,frame,[ent(7,8)],1,[base],700,0,1);message.writeByte(wire,serverMessage.SVC_EOF);message.beginReading(wire);result=protocol.parse(runtime,wire)
 c=c+req(result==[0,1] and d.reliableAcknowledge==70,"outer dispatch and stale ack")
 c=c+req(runtime.gamestateState.serverCommandSequence==5 and d.serverCommandSequence==5,"gamestate command sequence sync")
 c=c+req(gamestate.configString(runtime.gamestateState,1)=="\\sv_serverid\\9","configstring parsed")
 c=c+req(runtime.gamestateState.clientNum==2 and runtime.gamestateState.checksumFeed==0x1234,"gamestate trailer")
 c=c+req(d.snapshotState.entityState.parseEntitiesNum==1 and d.snapshotState.snap.numEntities==1,"gamestate reset then snapshot")
 c=c+req(d.snapshotState.entityState.parseEntities[0].number==7 and d.snapshotState.entityState.parseEntities[0].eType==8,"baseline-backed snapshot")
 c=c+req(d.snapshotState.snap.serverCommandNum==5 and d.snapshotState.snap.serverTime==700,"snapshot sees gamestate sequence")
 c=c+req(runtime.downloadState.downloadSize==1 and runtime.downloadState.downloadBlock==1 and runtime.downloadState.downloadCount==1,"download state")
 c=c+req(host.context.events==["cv:cl_downloadSize=1","open:tmp","write:1:9","cmd:nextdl 0","cv:cl_downloadCount=1"],"download services")
 c=c+req(d.snapshotState.serverMessageSequence==11 and d.snapshotState.realtime==900,"connection timing preserved across clear")
 c=c+req(d.gamestateFn!=void and d.downloadFn!=void and d.context==runtime,"concrete handlers installed")
 c=c+req(try(protocol.parse(void,wire)) is error,"missing runtime")
 print "PASS: "+str(c)+" client protocol-runtime contracts";return 0
end function
