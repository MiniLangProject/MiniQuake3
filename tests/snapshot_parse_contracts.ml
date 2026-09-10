import mq3.client.snapshot_parse as parse
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate
import std.fs as fs

function require(ok,text) if not ok then return error(6860,text) end if;return 1 end function
function ent(number,time) e=entitystate.create();e.number=number;e.time=time;return e end function
function nativeEnt(number,value) e=entitystate.create();e.number=number;e.eType=value;e.pos.trTime=value*101;e.origin[0]=value;return e end function

function main(args)
  count=0;state=parse.createState();old=parse.createFrame();old.parseEntitiesNum=0;old.numEntities=3
  state.parseEntities[0]=ent(1,10);state.parseEntities[1]=ent(2,20);state.parseEntities[2]=ent(5,50);state.parseEntitiesNum=3
  state.entityBaselines[3]=ent(3,0)
  msg=message.init(4096)
  delta.writeDeltaEntity(msg,state.parseEntities[1],ent(2,22),false)
  delta.writeDeltaEntity(msg,state.entityBaselines[3],ent(3,33),false)
  delta.writeDeltaEntity(msg,state.parseEntities[2],void,false)
  message.writeBits(msg,parse.ENTITY_SENTINEL,parse.GENTITYNUM_BITS)
  message.beginReading(msg);frame=parse.createFrame();n=parse.parsePacketEntities(state,msg,old,frame)
  count=count+require(n==3 and frame.parseEntitiesNum==3 and state.parseEntitiesNum==6,"merge counts")
  count=count+require(state.parseEntities[3].number==1 and state.parseEntities[3].time==10,"unchanged prefix")
  count=count+require(state.parseEntities[4].number==2 and state.parseEntities[4].time==22,"old delta")
  count=count+require(state.parseEntities[5].number==3 and state.parseEntities[5].time==33,"baseline add")
  count=count+require(state.parseEntities[5].number!=5,"remove consumes no slot")

  empty=message.init(64);message.writeBits(empty,parse.ENTITY_SENTINEL,parse.GENTITYNUM_BITS);message.beginReading(empty)
  next=parse.createFrame();count=count+require(parse.parsePacketEntities(state,empty,frame,next)==3,"sentinel copies old tail")
  count=count+require(state.parseEntities[6].number==1 and state.parseEntities[8].number==3,"copied frame order")

  bad=message.init(128);delta.writeDeltaEntity(bad,ent(4,0),ent(4,1),false);delta.writeDeltaEntity(bad,ent(3,0),ent(3,1),false);message.writeBits(bad,parse.ENTITY_SENTINEL,10);message.beginReading(bad)
  count=count+require(try(parse.parsePacketEntities(parse.createState(),bad,void,parse.createFrame())) is error,"unsorted input rejected")
  short=message.init(16);message.beginReading(short);count=count+require(try(parse.parsePacketEntities(parse.createState(),short,void,parse.createFrame())) is error,"truncated input rejected")
  if len(args)>0 then
    native=parse.createState();nativeOld=parse.createFrame();nativeOld.numEntities=3
    native.parseEntities[0]=nativeEnt(1,1);native.parseEntities[1]=nativeEnt(3,3);native.parseEntities[2]=nativeEnt(5,5);native.parseEntitiesNum=3
    packet=fs.readAllBytes(args[0]);wire=message.initStorage(packet,len(packet),false);wire.cursize=len(packet);message.beginReading(wire)
    nativeNew=parse.createFrame();count=count+require(parse.parsePacketEntities(native,wire,nativeOld,nativeNew)==5,"native merge count")
    expected=[nativeEnt(0,6),nativeEnt(1,1),nativeEnt(2,2),nativeEnt(3,7),nativeEnt(6,6)]
    for index=0 to 4
      count=count+require(entitystate.words(native.parseEntities[3+index])==entitystate.words(expected[index]),"native merge entity "+str(index))
    end for
  end if
  print("PASS: "+str(count)+" client snapshot packet-entity contracts")
  return 0
end function
