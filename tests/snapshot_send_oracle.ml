import mq3.qcommon.message as message
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.server.snapshot_send as send

struct Context packet download end struct
function captureSend(host,client,payload) host.context.packet=payload;client.outgoingSequence=client.outgoingSequence+1 end function
function download(host,client,msg) if host.context.download!=void then message.writeData(msg,host.context.download) end if end function
function no(host,client) return false end function
function hex(data) digits=bytes("0123456789abcdef");text="";for each value in data text=text+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for;return text end function
function state(number,value) e=es.create();e.number=number;e.eType=value;e.pos.trTime=value*101;return e end function
function setup()
  ring=array(8,void);for i=0 to 7 ring[i]=state(0,0) end for
  s=send.server(12345,ring,8,[state(5,0)]);c=send.client();c.frames[c.outgoingSequence&31]=send.frame(0,0,[],ps.create());ctx=Context(void,void);host=send.services(void,download,captureSend,no,no,ctx)
  return [c,s,host]
end function
function emit(name,all)
  c=all[0];host=all[2];send.sendClientSnapshot(c,all[1],host);packet=host.context.packet
  print name+"|"+str(c.reliableSent)+"|"+str(len(packet))+"|"+hex(packet)
end function
function main(args)
  a=setup();a[0].lastClientCommand=11;emit("full",a)
  a=setup();a[0].reliableSequence=2;a[0].reliableCommands[1]="print hi";a[0].reliableCommands[2]="cp center";emit("reliable",a)
  a=setup();c=a[0];s=a[1];c.outgoingSequence=10;c.deltaMessage=8;s.snapshotEntities[0]=state(5,1);s.snapshotEntities[1]=state(5,7);c.frames[8]=send.frame(0,1,[],ps.create());p=ps.create();p.commandTime=99;c.frames[10]=send.frame(1,1,[],p);s.nextSnapshotEntities=2;emit("delta",a)
  a=setup();c=a[0];s=a[1];c.outgoingSequence=40;c.deltaMessage=10;s.snapshotEntities[0]=state(5,7);p=ps.create();p.commandTime=100;c.frames[8]=send.frame(0,1,[],p);s.nextSnapshotEntities=1;emit("old-delta",a)
  a=setup();c=a[0];s=a[1];c.state=3;c.rateDelayed=true;s.snapFlagServerBit=4;s.padPackets=2;c.frames[1]=send.frame(0,0,bytes([0x12,0x34]),ps.create());emit("flags-pad",a)
  a=setup();a[2].context.download=bytes([6,0xaa,0xbb]);emit("download",a)
  return 0
end function
