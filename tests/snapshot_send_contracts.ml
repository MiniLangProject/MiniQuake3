import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.server.snapshot_send as send
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
struct Context calls packet built download local lan end struct
function captureTx(host,c,p) host.context.calls=host.context.calls+1;host.context.packet=p;c.outgoingSequence=c.outgoingSequence+1 end function
function build(host,c,s) host.context.built=host.context.built+1 end function
function down(host,c,m) host.context.download=host.context.download+1 end function
function local(host,c) return host.context.local end function
function lan(host,c) return host.context.lan end function
function req(v,t) if not v then return error(499,"snapshot send: "+t) end if;return 1 end function
function setup()
  e=es.create();ring=array(8,e);s=send.server(1000,ring,8,[]);c=send.client();c.frames[1]=send.frame(0,0,[],ps.create());x=Context(0,void,0,0,false,false);h=send.services(build,down,captureTx,local,lan,x);return [c,s,h]
end function
function main(args)
  n=0;a=setup();c=a[0];s=a[1];h=a[2]
  n=n+req(send.snapshotFlags(c,s)==0,"active flags")
  c.rateDelayed=true;n=n+req(send.snapshotFlags(c,s)==1,"rate flag");c.state=3;n=n+req(send.snapshotFlags(c,s)==3,"inactive flag")
  c.state=4;c.rateDelayed=false;c.deltaMessage=0;n=n+req(send.deltaBase(c,s)[0]==void,"no delta")
  c.outgoingSequence=30;c.deltaMessage=1;n=n+req(send.deltaBase(c,s)[0]==void,"old packet delta")
  c.outgoingSequence=10;c.deltaMessage=8;c.frames[8]=send.frame(0,0,[],ps.create());s.nextSnapshotEntities=2;n=n+req(send.deltaBase(c,s)[0]!=void and send.deltaBase(c,s)[1]==2,"valid delta")
  s.nextSnapshotEntities=8;n=n+req(send.deltaBase(c,s)[0]==void,"rolled entity delta")
  n=n+req(send.rateMsec(c,100,0)==5,"unlimited rate")
  n=n+req(send.rateMsec(c,2000,0)==61,"message rate cap")
  n=n+req(send.rateMsec(c,100,500)==148,"minimum maxrate")
  n=n+req(try(send.rateMsec(send.client(),1,0))==1,"default rate")
  bad=send.client();bad.rate=0;n=n+req(try(send.rateMsec(bad,1,0)) is error,"zero rate rejected")
  a=setup();packet=send.sendClientSnapshot(a[0],a[1],a[2]);f=a[0].frames[1]
  n=n+req(a[2].context.built==1 and a[2].context.download==1 and a[2].context.calls==1,"service ordering")
  read=message.initStorage(packet,len(packet),false);read.cursize=len(packet);message.beginReading(read)
  ack=message.readI32(read);svc=message.readU8(read);time=message.readI32(read);last=message.readU8(read);flags=message.readU8(read);areas=message.readU8(read)
  decoded=delta.readDeltaPlayerstate(read,void);terminator=message.readBits(read,delta.GENTITYNUM_BITS);eof=message.readU8(read)
  n=n+req(ack==0 and svc==7 and time==1000 and last==0 and flags==0 and areas==0 and decoded!=void and terminator==1023 and eof==send.SVC_EOF,"EOF decoded before transmit")
  n=n+req(f.messageSize>0 and f.messageSize<=len(packet) and f.messageSent==1000 and f.messageAcked==-1,"frame send metadata")
  n=n+req(a[0].nextSnapshotTime==1050 and not a[0].rateDelayed,"snapshot interval floor")
  a=setup();a[0].rate=1000;send.sendClientSnapshot(a[0],a[1],a[2]);n=n+req(a[0].rateDelayed and a[0].nextSnapshotTime>1050,"rate delay")
  a=setup();a[2].context.local=true;send.sendClientSnapshot(a[0],a[1],a[2]);n=n+req(a[0].nextSnapshotTime==999,"loopback immediate")
  a=setup();a[1].lanForceRate=true;a[2].context.lan=true;send.sendClientSnapshot(a[0],a[1],a[2]);n=n+req(a[0].nextSnapshotTime==999,"LAN immediate")
  a=setup();a[0].state=3;send.sendClientSnapshot(a[0],a[1],a[2]);n=n+req(a[0].nextSnapshotTime==2000,"inactive floor")
  a=setup();a[0].state=3;a[0].downloadName="pak";send.sendClientSnapshot(a[0],a[1],a[2]);n=n+req(a[0].nextSnapshotTime<2000,"download bypasses inactive floor")
  a=setup();a[0].bot=true;n=n+req(send.sendClientSnapshot(a[0],a[1],a[2])==void and a[2].context.built==1 and a[2].context.calls==0,"bot builds without transmit")
  a=setup();a[2].transmitFn=void;n=n+req(try(send.sendClientSnapshot(a[0],a[1],a[2])) is error,"transmit service required")
  n=n+req(try(send.server(0,[],0,[])) is error,"entity ring required")
  a=setup();a[0].frames=[];n=n+req(try(send.currentFrame(a[0])) is error,"frame ring required")
  print "PASS: "+str(n)+" snapshot-send contracts";return 0
end function
