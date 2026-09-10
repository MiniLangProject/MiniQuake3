import mq3.qcommon.message as message
import mq3.server.snapshot_delta as snapshot
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
function req(value,label) if not value then return error(499,"snapshot delta: "+label) end if;return 1 end function
function state(number,value) e=es.create();e.number=number;e.eType=value;return e end function
function main(args)
  c=0
  c=c+req(snapshot.frame(7,3).firstEntity==7 and snapshot.frame(7,3).numEntities==3,"frame fields")
  ring=[state(8,0),state(9,0),state(10,0)]
  c=c+req(snapshot.entityAt(ring,3,4).number==9,"positive ring wrap")
  c=c+req(snapshot.entityAt(ring,3,-1).number==10,"negative ring wrap")
  c=c+req(try(snapshot.entityAt(ring,0,0)) is error,"zero ring rejected")
  c=c+req(try(snapshot.entityAt(ring,4,0)) is error,"oversized capacity rejected")
  c=c+req(snapshot.baselineFor(ring,9).number==9,"baseline lookup")
  c=c+req(try(snapshot.baselineFor(ring,7)) is error,"missing baseline rejected")
  c=c+req(try(snapshot.emitPacketEntities(message.init(64),void,void,ring,3,[])) is error,"target required")
  c=c+req(try(snapshot.emitPacketEntities(message.init(64),void,snapshot.frame(-1,1),ring,3,[])) is error,"negative target start rejected")
  c=c+req(try(snapshot.emitPacketEntities(message.init(64),void,snapshot.frame(0,-1),ring,3,[])) is error,"negative target count rejected")
  c=c+req(try(snapshot.emitPacketEntities(message.init(64),void,snapshot.frame(0,4),ring,3,[])) is error,"target count bound")
  c=c+req(try(snapshot.emitPacketEntities(message.init(64),snapshot.frame(-1,1),snapshot.frame(0,0),ring,3,[])) is error,"negative base start rejected")
  c=c+req(try(snapshot.emitPacketEntities(message.init(64),snapshot.frame(0,4),snapshot.frame(0,0),ring,3,[])) is error,"base count bound")
  m=message.init(128);count=snapshot.emitPacketEntities(m,void,snapshot.frame(0,0),ring,3,[])
  c=c+req(count==0 and m.bit>0,"empty snapshot terminator")
  same=state(8,3);m=message.init(128);count=snapshot.emitPacketEntities(m,snapshot.frame(0,1),snapshot.frame(1,1),[same,same],2,[])
  c=c+req(count==0,"unchanged entity omitted")
  m=message.init(128);count=snapshot.emitPacketEntities(m,snapshot.frame(0,1),snapshot.frame(1,0),[state(8,3)],1,[])
  c=c+req(count==1,"remove emitted")
  m=message.init(128);count=snapshot.emitPacketEntities(m,void,snapshot.frame(0,1),[state(8,3)],1,[state(8,0)])
  c=c+req(count==1,"baseline add emitted")
  c=c+req(try(snapshot.emitPacketEntities(message.init(128),void,snapshot.frame(0,1),[state(8,3)],1,[])) is error,"add baseline required")
  oldPacket=snapshot.packetFrame(5,1,bytes([1,2]),ps.create())
  c=c+req(snapshot.deltaFrameValid(90,100,true,oldPacket,20,16),"delta frame accepted")
  c=c+req(not snapshot.deltaFrameValid(0,100,true,oldPacket,20,16),"nonpositive delta rejected")
  c=c+req(not snapshot.deltaFrameValid(90,100,false,oldPacket,20,16),"inactive delta rejected")
  c=c+req(not snapshot.deltaFrameValid(70,100,true,oldPacket,20,16),"old sequence rejected")
  stale=snapshot.packetFrame(4,0,[],ps.create());c=c+req(not snapshot.deltaFrameValid(90,100,true,stale,20,16),"rolled ring rejected")
  target=snapshot.packetFrame(0,0,bytes([0x12,0x34]),ps.create());m=message.init(1024);count=snapshot.writeSnapshotPayload(m,void,target,ring,3,[],123456,0,5)
  message.beginReading(m);opcode=message.readU8(m);time=message.readI32(m);last=message.readU8(m);flags=message.readU8(m);areas=message.readU8(m);a=message.readU8(m);b=message.readU8(m)
  c=c+req(count==0 and opcode==snapshot.SVC_SNAPSHOT and time==123456 and last==0 and flags==5 and areas==2 and a==0x12 and b==0x34,"snapshot payload header")
  c=c+req(try(snapshot.writeSnapshotPayload(message.init(1024),void,target,ring,3,[],0,1,0)) is error,"base required by lastframe")
  huge=snapshot.packetFrame(0,0,bytes(256,0),ps.create());c=c+req(try(snapshot.writeSnapshotPayload(message.init(1024),void,huge,ring,3,[],0,0,0)) is error,"area byte bound")
  print "PASS: "+str(c)+" snapshot-delta contracts";return 0
end function
