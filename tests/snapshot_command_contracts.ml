import mq3.client.snapshot_command as command
import mq3.client.snapshot_parse as parse
import mq3.server.snapshot_delta as server
import mq3.qcommon.message as message
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate

function req(ok,text) if not ok then return error(6875,text) end if;return 1 end function
function ent(number,value) e=entitystate.create();e.number=number;e.eType=value;return e end function
function ps(time,health) p=playerstate.create();p.commandTime=time;p.stats[0]=health;return p end function

function payload(oldFrame,newFrame,ring,baselines,time,last,flags)
  msg=message.init(4096);server.writeSnapshotPayload(msg,oldFrame,newFrame,ring,len(ring),baselines,time,last,flags);message.beginReading(msg)
  req(message.readU8(msg)==server.SVC_SNAPSHOT,"svc marker");return msg
end function

function main(args)
  count=0;ring=[ent(1,4),ent(2,7)];base=[ent(1,0),ent(2,0)];newFrame=server.packetFrame(0,2,bytes([5,9]),ps(1000,75))
  state=command.create();state.serverMessageSequence=7;state.serverCommandSequence=3;state.outgoingSequence=4;state.realtime=1400;state.outPackets[3].serverTime=900;state.outPackets[3].realtime=1200
  got=command.parseSnapshot(state,payload(void,newFrame,ring,base,1234,0,2))
  count=count+req(got.valid and got.serverTime==1234 and got.messageNum==7 and got.deltaNum==-1 and got.snapFlags==2,"full header")
  count=count+req(got.serverCommandNum==3 and len(got.areaMask)==command.MAX_MAP_AREA_BYTES and got.areaMask[0]==5 and got.areaMask[1]==9 and got.areaMask[31]==0 and got.playerState.commandTime==1000 and got.playerState.stats[0]==75,"payload state")
  count=count+req(got.numEntities==2 and state.entityState.parseEntitiesNum==2 and parse.parsedEntity(state.entityState,0).number==1 and parse.parsedEntity(state.entityState,1).number==2,"full entities")
  count=count+req(got.ping==200 and state.newSnapshots and not state.demoWaiting and state.snapshots[7&31].valid,"promotion and ping")
  got.areaMask[0]=77;count=count+req(state.snapshots[7&31].areaMask[0]==5,"snapshot area-mask value copy");got.areaMask[0]=5

  serverOld=server.packetFrame(0,2,bytes([5,9]),ps(1000,75));ring2=[ent(1,4),ent(2,7),ent(1,8),ent(3,6)];nextFrame=server.packetFrame(2,2,bytes([1]),ps(1100,60))
  state.serverMessageSequence=9;state.outgoingSequence=5;state.outPackets[4].serverTime=1050;state.outPackets[4].realtime=1300
  deltaGot=command.parseSnapshot(state,payload(serverOld,nextFrame,ring2,base+[ent(3,0)],1300,2,1))
  count=count+req(deltaGot.valid and deltaGot.deltaNum==7 and deltaGot.numEntities==2 and deltaGot.playerState.stats[0]==60,"valid delta")
  count=count+req(parse.parsedEntity(state.entityState,2).number==1 and parse.parsedEntity(state.entityState,2).eType==8 and parse.parsedEntity(state.entityState,3).number==3,"delta merge")
  count=count+req(not state.snapshots[8].valid and state.snapshots[9].valid and deltaGot.ping==100,"gap invalidation")

  invalid=command.create();invalid.serverMessageSequence=12;badOld=command.emptySnapshot();badOld.valid=false;badOld.messageNum=10;invalid.snapshots[10]=badOld
  badServerOld=server.packetFrame(0,0,bytes(0,0),ps(0,0));badNew=server.packetFrame(0,0,bytes(0,0),ps(1,1));before=invalid.snap.messageNum
  rejected=command.parseSnapshot(invalid,payload(badServerOld,badNew,[],[],1500,2,0))
  count=count+req(not rejected.valid and invalid.snap.messageNum==before and not invalid.newSnapshots,"invalid delta consumed only")

  tooOld=command.create();tooOld.serverMessageSequence=20;old=command.emptySnapshot();old.valid=true;old.messageNum=18;old.parseEntitiesNum=0;tooOld.snapshots[18]=old;tooOld.entityState.parseEntitiesNum=parse.MAX_PARSE_ENTITIES-127
  serverTooOld=server.packetFrame(0,0,bytes(0,0),ps(0,0));rejected=command.parseSnapshot(tooOld,payload(serverTooOld,server.packetFrame(0,0,bytes(0,0),ps(0,0)),[],[],1,2,0))
  count=count+req(not rejected.valid,"parse entity age rejection")
  print("PASS: "+str(count)+" client snapshot-command contracts");return 0
end function
