import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
function encodeHex(data,count) d=bytes("0123456789abcdef");s="";if count>0 then for i=0 to count-1 v=data[i];s=s+decode(bytes([d[(v>>4)&15],d[v&15]])) end for end if;return s end function
function wordText(values) s="";for i=0 to len(values)-1 if i>0 then s=s+"," end if;s=s+str(n.u32(values[i])) end for;return s end function
function erun(name,a,b,force) m=message.init(4096);delta.writeDeltaEntity(m,a,b,force);s="E|"+name+"|"+str(m.cursize)+"|"+str(m.bit)+"|"+encodeHex(m.data,m.cursize)+"|";if m.bit>0 then message.beginReading(m);num=message.readBits(m,delta.GENTITYNUM_BITS);decodedState=delta.readDeltaEntity(m,a,num);s=s+wordText(es.words(decodedState)) end if;print s end function
function prun(name,a,b) m=message.init(4096);delta.writeDeltaPlayerstate(m,a,b);s="P|"+name+"|"+str(m.cursize)+"|"+str(m.bit)+"|"+encodeHex(m.data,m.cursize)+"|";message.beginReading(m);decodedState=delta.readDeltaPlayerstate(m,a);print s+wordText(ps.words(decodedState)) end function
function exhaustiveFields()
  entityPhysical=[16,24,28,36,40,32,64,44,60,180,132,4,200,184,196,148,12,8,140,192,168,120,20,48,92,96,100,176,188,160,144,156,204,112,104,108,164,116,84,52,56,68,72,76,80,88,124,128,136,152,172]
  entityWidths=[32,0,0,0,0,0,0,0,0,10,0,8,8,8,8,10,8,19,10,8,8,0,32,8,0,0,0,24,16,8,10,8,8,0,0,0,8,0,32,32,32,0,0,0,0,32,0,0,0,32,16]
  base=es.create();base.number=23
  for i=0 to 50
    data=bytes(es.BYTE_SIZE,0);n.writeU32(data,0,23);value=3
    if entityWidths[i]==0 then value=n.floatBits(-7.0) else if entityWidths[i]==32 then value=0x12345678 end if
    tag="field";if i<10 then tag=tag+"0" end if;tag=tag+str(i)
    n.writeU32(data,entityPhysical[i],value);erun(tag,base,es.load(data,0),false)
  end for
  playerPhysical=[0,20,24,8,32,36,156,152,44,28,40,72,16,108,84,88,112,76,116,12,68,148,104,128,48,52,60,132,164,168,172,176,180,440,4,56,64,80,120,124,140,144,160,92,96,100,448,444]
  playerWidths=[32,0,0,8,0,0,0,0,-16,0,0,8,-16,16,8,4,8,8,8,16,10,4,16,10,16,16,16,8,-8,8,8,8,8,8,8,16,16,12,8,8,8,5,0,0,0,0,10,16]
  base=ps.create()
  for i=0 to 47
    data=bytes(ps.BYTE_SIZE,0);value=3
    if playerWidths[i]==0 then value=n.floatBits(-7.0) else if playerWidths[i]==32 then value=0x12345678 else if playerWidths[i]<0 then value=-3 end if
    tag="field";if i<10 then tag=tag+"0" end if;tag=tag+str(i)
    n.writeU32(data,playerPhysical[i],value);prun(tag,base,ps.load(data,0))
  end for
  return void
end function
function main(args)
 e0=es.create();e0.number=17;e1=es.copy(e0);erun("skip",e0,e1,false);erun("force",e0,e1,true);erun("remove",e0,void,false)
 e1=es.copy(e0);e1.pos.trTime=123456;e1.pos.trBase[0]=0;e1.pos.trBase[1]=-17;e1.pos.trDelta[0]=3.25;e1.event=513;e1.eFlags=0x34567;erun("mixed",e0,e1,false)
 e0=es.copy(e1);e1.angles2[2]=-91.0;e1.constantLight=0x12345678;e1.frame=65530;erun("late",e0,e1,false)
 p0=ps.create();p1=ps.copy(p0);prun("zero",void,p1)
 p1.commandTime=123456789;p1.origin[0]=-33;p1.origin[1]=3.5;p1.weaponTime=-1234;p1.viewheight=-12;p1.weapon=17;p1.loopSound=60000;prun("fields",p0,p1)
 p0=ps.copy(p1);p1.stats[0]=-7;p1.stats[15]=30000;p1.persistant[3]=-123;p1.ammo[2]=999;p1.ammo[14]=-2;p1.powerups[1]=0x12345678;p1.powerups[15]=-1;prun("arrays",p0,p1)
 p0=ps.copy(p1);p1.grapplePoint[2]=4095;p1.jumppad_ent=1023;p1.loopSound=1;prun("late",p0,p1);exhaustiveFields();return 0
end function
