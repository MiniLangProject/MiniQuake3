import mq3.client.cl_parse_runtime as parser
import mq3.client.server_message as serverMessage
import mq3.client.snapshot_parse as snapshotParse
import mq3.client.snapshot_command as snapshotCommand
import mq3.client.gamestate as gamestate
import mq3.client.download as download
import mq3.client.system_info as systemInfo
import mq3.server.snapshot_delta as serverDelta
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as messageDelta
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate

struct Context lines events cvars end struct
function req(value,text) if not value then return error(6995,"cl_parse complete: "+text) end if;return 1 end function
function output(context,line) context.lines=context.lines+[line];return void end function
function cvalue(host,name,value) host.context.events=host.context.events+[name+"="+str(value)];return void end function
function reliable(host,text) host.context.events=host.context.events+[text];return void end function
function openFile(host,name) host.context.events=host.context.events+["open:"+name];return 4 end function
function writeFile(host,data,size,handle) host.context.events=host.context.events+["write:"+str(size)];return void end function
function setCvar(host,name,value) host.context.cvars=host.context.cvars+[[name,value]];return void end function
function getCvar(host,name) if name=="sv_pure" then return "1" end if;if name=="fs_game" then return "old" end if;return "" end function
function resetCheats(host) host.context.events=host.context.events+["cheats"];return void end function
function loaded(host,paks,names) host.context.events=host.context.events+["loaded:"+paks+":"+names];return void end function
function referenced(host,paks,names) host.context.events=host.context.events+["referenced:"+paks+":"+names];return void end function
function ent(number,value) result=entitystate.create();result.number=number;result.eType=value;return result end function

function main(args)
  count=0;context=Context([],[],[])
  dh=download.services();dh.context=context;dh.cvarValueFn=cvalue;dh.reliableFn=reliable;dh.openFn=openFile;dh.writeFn=writeFile
  sh=systemInfo.services();sh.context=context;sh.setCvarFn=setCvar;sh.getCvarFn=getCvar;sh.cheatResetFn=resetCheats;sh.loadedPaksFn=loaded;sh.referencedPaksFn=referenced
  runtime=parser.create(dh,sh);count=count+req(runtime.protocol.dispatcher.gamestateFn!=void and runtime.protocol.dispatcher.downloadFn!=void,"productive handlers")
  count=count+req(runtime.protocol.gamestateState.systemInfoFn!=void,"systeminfo installed")

  show=runtime.protocol.dispatcher;probe=message.init(16);message.writeByte(probe,7);message.beginReading(probe)
  count=count+req(not parser.SHOWNET(show,probe,"quiet") and len(show.shownetLines)==0,"shownet quiet")
  parser.configureShownet(runtime,2,output,context);message.readU8(probe)
  count=count+req(parser.SHOWNET(show,probe,"manual") and show.shownetLines[0]=="  0:manual" and context.lines[0]=="  0:manual","shownet offset and callback")

  cmd=message.init(128);message.writeLong(cmd,3);message.writeString(cmd,"cp ready");message.beginReading(cmd)
  count=count+req(parser.CL_ParseCommandString(show,cmd) and show.serverCommandSequence==3 and show.serverCommands[3]=="cp ready","command facade")
  duplicate=message.init(128);message.writeLong(duplicate,3);message.writeString(duplicate,"ignored");message.beginReading(duplicate)
  count=count+req(not parser.CL_ParseCommandString(show,duplicate) and show.serverCommands[3]=="cp ready","duplicate command")

  gs=gamestate.create();gs.context=systemInfo.Binding(runtime.systemState,sh);gs.systemInfoFn=systemInfo.gamestateChanged
  wire=message.init(2048);message.writeLong(wire,9);message.writeByte(wire,gamestate.SVC_CONFIGSTRING);message.writeShort(wire,1);message.writeBigString(wire,"\\sv_serverid\\77\\sv_cheats\\0\\sv_pure\\1\\sv_paks\\11\\sv_pakNames\\pak0");message.writeByte(wire,gamestate.SVC_EOF);message.writeLong(wire,2);message.writeLong(wire,1234);message.beginReading(wire)
  parser.CL_ParseGamestate(gs,wire);count=count+req(gs.serverCommandSequence==9 and gs.clientNum==2 and gs.checksumFeed==1234,"gamestate facade")
  count=count+req(runtime.systemState.serverId==77 and runtime.systemState.connectedPure==1,"gamestate systeminfo integration")

  ds=download.create();ds.downloadTempName="part.tmp";ds.downloadName="pak.pk3";wire=message.init(128);message.writeShort(wire,0);message.writeLong(wire,2);message.writeShort(wire,2);message.writeData(wire,bytes([4,5]));message.beginReading(wire)
  count=count+req(parser.CL_ParseDownload(ds,dh,wire) and ds.downloadBlock==1 and ds.downloadCount==2,"download facade")

  es=snapshotParse.createState();frame=snapshotParse.createFrame();old=ent(8,5);empty=message.init(8);message.beginReading(empty)
  count=count+req(parser.CL_DeltaEntity(es,empty,frame,8,old,true) and es.parseEntitiesNum==1 and es.parseEntities[0].eType==5,"delta entity facade")
  packet=message.init(16);message.writeBits(packet,1023,10);message.beginReading(packet);fresh=snapshotParse.createFrame()
  count=count+req(parser.CL_ParsePacketEntities(es,packet,void,fresh)==0 and fresh.parseEntitiesNum==1,"packet entities facade")

  ss=snapshotCommand.create();ss.serverMessageSequence=12;ss.serverCommandSequence=4;ss.outgoingSequence=1;ss.realtime=900
  ps=playerstate.create();ps.commandTime=500;snapWire=message.init(2048);serverDelta.writeSnapshotPayload(snapWire,void,serverDelta.packetFrame(0,0,bytes([1]),ps),[],0,[],700,0,1);message.beginReading(snapWire);message.readU8(snapWire)
  snap=parser.CL_ParseSnapshot(ss,snapWire);count=count+req(snap.valid and snap.messageNum==12 and snap.serverCommandNum==4 and snap.serverTime==700,"snapshot facade")

  directState=systemInfo.create();pairs=parser.CL_SystemInfoChanged(directState,sh,"\\sv_serverid\\91\\sv_cheats\\0\\sv_pure\\1")
  count=count+req(pairs==3 and directState.serverId==91 and directState.connectedPure==1,"systeminfo facade")

  parser.configureShownet(runtime,2,output,context);show.shownetLines=[];context.lines=[];outer=message.init(64);message.writeLong(outer,0);message.writeByte(outer,serverMessage.SVC_NOP);message.writeByte(outer,serverMessage.SVC_EOF);message.beginReading(outer)
  result=parser.CL_ParseServerMessage(runtime,outer);count=count+req(result==[0,0],"server message facade")
  count=count+req(show.shownetLines==["------------------","  1:svc_nop","  2:END OF MESSAGE"] and context.lines==show.shownetLines,"shownet stream")
  parser.configureShownet(runtime,1,void,void);show.shownetLines=[];message.beginReading(outer);parser.CL_ParseServerMessage(runtime,outer)
  count=count+req(len(show.shownetLines)==1 and show.shownetLines[0]==str(outer.cursize),"shownet size mode")
  parser.configureShownet(runtime,3,void,void);show.shownetLines=[];show.snapshotState.serverMessageSequence=14
  snapshotMessage=message.init(2048);message.writeLong(snapshotMessage,0);serverDelta.writeSnapshotPayload(snapshotMessage,void,serverDelta.packetFrame(0,0,bytes([1]),ps),[],0,[],710,0,1);message.writeByte(snapshotMessage,serverMessage.SVC_EOF);message.beginReading(snapshotMessage);parser.CL_ParseServerMessage(runtime,snapshotMessage)
  count=count+req(len(show.shownetLines)==6 and show.shownetLines[1]=="  1:svc_snapshot" and show.shownetLines[2]=="  6:playerstate" and show.shownetLines[3]=="  9:packet entities" and show.shownetLines[4]=="   snapshot:14  delta:-1  ping:0","snapshot shownet integration")

  truncatedArea=message.init(128);message.writeLong(truncatedArea,0);message.writeByte(truncatedArea,serverMessage.SVC_SNAPSHOT);message.writeLong(truncatedArea,720);message.writeByte(truncatedArea,0);message.writeByte(truncatedArea,0);message.writeByte(truncatedArea,2);message.beginReading(truncatedArea)
  beforeMessage=show.snapshotState.snap.messageNum;beforeEntities=show.snapshotState.entityState.parseEntitiesNum;beforeNew=show.snapshotState.newSnapshots
  count=count+req(try(parser.CL_ParseServerMessage(runtime,truncatedArea)) is error and show.snapshotState.snap.messageNum==beforeMessage and show.snapshotState.entityState.parseEntitiesNum==beforeEntities and show.snapshotState.newSnapshots==beforeNew,"truncated area propagated without snapshot state advance")

  truncatedEntities=message.init(1024);message.writeLong(truncatedEntities,0);message.writeByte(truncatedEntities,serverMessage.SVC_SNAPSHOT);message.writeLong(truncatedEntities,730);message.writeByte(truncatedEntities,0);message.writeByte(truncatedEntities,0);message.writeByte(truncatedEntities,0);messageDelta.writeDeltaPlayerstate(truncatedEntities,void,ps);message.beginReading(truncatedEntities)
  beforeMessage=show.snapshotState.snap.messageNum;beforeEntities=show.snapshotState.entityState.parseEntitiesNum;beforeNew=show.snapshotState.newSnapshots
  count=count+req(try(parser.CL_ParseServerMessage(runtime,truncatedEntities)) is error and show.snapshotState.snap.messageNum==beforeMessage and show.snapshotState.entityState.parseEntitiesNum==beforeEntities and show.snapshotState.newSnapshots==beforeNew,"truncated entities propagated without snapshot state advance")
  count=count+req(try(parser.CL_ParseServerMessage(void,outer)) is error,"missing runtime")
  print "PASS: "+str(count)+" complete cl_parse contracts";return 0
end function
