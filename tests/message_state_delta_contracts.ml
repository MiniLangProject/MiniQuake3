import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
function req(v,s) if not v then return error(499,"state delta: "+s) end if;return 1 end function
function main(args)
  c=0;e=es.create();e.number=8;m=message.init(1024)
  c=c+req(not delta.writeDeltaEntity(m,e,es.copy(e),false) and m.bit==0,"unchanged skip")
  c=c+req(delta.writeDeltaEntity(m,e,es.copy(e),true),"unchanged force")
  message.beginReading(m);num=message.readBits(m,10);decoded=delta.readDeltaEntity(m,e,num)
  c=c+req(decoded.number==8 and es.words(decoded)==es.words(e),"forced no-delta roundtrip")
  m=message.init(1024);delta.writeDeltaEntity(m,e,void,false);message.beginReading(m);num=message.readBits(m,10);decoded=delta.readDeltaEntity(m,e,num)
  c=c+req(decoded.number==1023,"remove sentinel")
  c=c+req(not delta.writeDeltaEntity(message.init(64),void,void,false),"void remove skip")
  e2=es.copy(e);e2.pos.trBase=[0.0,-4096.0,4095.0];e2.origin=[3.25,0.0,n.bitsFloat(0x80000000)];e2.constantLight=-1
  m=message.init(1024);delta.writeDeltaEntity(m,e,e2,false);message.beginReading(m);num=message.readBits(m,10);decoded=delta.readDeltaEntity(m,e,num)
  c=c+req(decoded.pos.trBase==e2.pos.trBase,"entity integral float boundaries")
  c=c+req(decoded.origin[0]==3.25 and n.floatBits(decoded.origin[2])==0,"entity zero float canonicalization")
  c=c+req(decoded.constantLight==-1,"entity full integer")
  c=c+req(decoded.number==8,"entity number retained")
  badEntity=es.copy(e);badEntity.number=1024;c=c+req(try(delta.writeDeltaEntity(message.init(64),e,badEntity,true)) is error,"write entity number bound")
  c=c+req(try(delta.readDeltaEntity(message.init(64),e,-1)) is error,"read entity lower bound")
  c=c+req(try(delta.readDeltaEntity(message.init(64),e,1024)) is error,"read entity upper bound")
  p=ps.create();q=ps.copy(p);q.weaponTime=-32768;q.viewheight=-128;q.origin=[-4096.0,4095.0,3.25]
  q.stats[0]=-32768;q.persistant[15]=32767;q.ammo[7]=-1;q.powerups[4]=-1
  m=message.init(2048);delta.writeDeltaPlayerstate(m,p,q);message.beginReading(m);r=delta.readDeltaPlayerstate(m,p)
  c=c+req(r.weaponTime==-32768 and r.viewheight==-128,"signed scalar fields")
  c=c+req(r.origin==q.origin,"player float modes")
  c=c+req(r.stats[0]==-32768,"stats mask")
  c=c+req(r.persistant[15]==32767,"persistant mask")
  c=c+req(r.ammo[7]==-1,"ammo mask")
  c=c+req(r.powerups[4]==-1,"powerup mask")
  c=c+req(r.ping==0 and r.entityEventSequence==0,"untransmitted fields copied")
  base=ps.create();base.ping=77;base.entityEventSequence=9;m=message.init(64);delta.writeDeltaPlayerstate(m,base,ps.copy(base));message.beginReading(m);r=delta.readDeltaPlayerstate(m,base)
  c=c+req(r.ping==77 and r.entityEventSequence==9,"base-only player fields preserved")
  c=c+req(try(delta.writeDeltaPlayerstate(message.init(64),p,void)) is error,"missing target rejected")
  bad=message.init(64);message.writeByte(bad,255);message.beginReading(bad);c=c+req(try(delta.readDeltaPlayerstate(bad,p)) is error,"player lc bound")
  bad=message.init(64);message.writeBits(bad,0,1);message.writeBits(bad,1,1);message.writeByte(bad,255);message.beginReading(bad);c=c+req(try(delta.readDeltaEntity(bad,e,1)) is error,"entity lc bound")
  c=c+req(try(delta.readDeltaPlayerstate(message.init(64),p)) is error,"truncated player lc rejected")
  bad=message.init(64);message.writeBits(bad,0,1);message.writeBits(bad,1,1);message.beginReading(bad);c=c+req(try(delta.readDeltaEntity(bad,e,1)) is error,"truncated entity lc rejected")
  c=c+req(len(delta.entityOffsets())==51 and len(delta.entityBits())==51,"entity netfield table length")
  c=c+req(len(delta.playerOffsets())==48 and len(delta.playerBits())==48,"player netfield table length")
  values=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];changed=[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2];c=c+req(delta.arrayMask(changed,values)==0x8001,"array mask endpoints")
  print "PASS: "+str(c)+" state-delta contracts";return 0
end function
