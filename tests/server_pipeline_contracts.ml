import std.fs as fs
import mq3.collision.world as cm
import mq3.game.entities as gameEntities
import mq3.game.entitystate as es
import mq3.server.pipeline as serverPipeline
import mq3.server.download as serverDownload
import mq3.qcommon.netchan as netchan
import mq3.compat.numeric as numeric
struct DownloadContext data pos end struct
struct NetContext packets end struct
function req(v,s) if not v then return error(499,"server pipeline: "+s) end if;return 1 end function
function idpak(h,n,g) return false end function
function openFile(h,n) return [9,len(h.context.data)] end function
function readFile(h,f,count) left=len(h.context.data)-h.context.pos;if left>count then left=count end if;if left<=0 then return bytes(0,0) end if;r=slice(h.context.data,h.context.pos,left);h.context.pos=h.context.pos+left;return r end function
function closeFile(h,f) return void end function
function drop(h,s,t) return void end function
function sendPacket(r,sock,packet,address) r.context.packets=r.context.packets+[packet] end function
function main(args)
  c=0;world=cm.loadBrushWorld(fs.readAllBytes(args[0]));level=gameEntities.create(world);level.num_entities=65
  p=level.clients[0];p.ps.clientNum=0;p.ps.origin=[0.0,0.0,0.0];p.ps.viewheight=0
  own=gameEntities.initEntity(level.entities[0]);gameEntities.bindClient(level,own,p)
  target=gameEntities.initEntity(level.entities[64]);target.r.linked=true;target.r.svFlags=32;target.s.eType=7
  data=bytes(2048,0x5a);dh=serverDownload.services(idpak,openFile,readFile,closeFile,drop,DownloadContext(data,0));ds=serverDownload.create("x.pk3",0,50);dserver=serverDownload.server(0,true,false,0)
  nr=netchan.init(0);nr.context=NetContext([]);nr.sendPacketFn=sendPacket;address=netchan.Address(4,[127,0,0,1],27960);channel=netchan.setup(netchan.NS_SERVER,address,0)
  baseline=es.create();baseline.number=64;pipe=serverPipeline.create(level,0,8,[baseline],ds,dserver,dh,nr,channel)
  payload=serverPipeline.sendSnapshot(pipe,level,1000);slot=pipe.client.frames[1]
  c=c+req(slot!=void and slot.firstEntity==0 and slot.numEntities==1,"frame slot built")
  c=c+req(pipe.runtime.buildWorld.nextSnapshotEntities==1 and pipe.server.nextSnapshotEntities==1,"ring cursor synchronized")
  c=c+req(pipe.server.snapshotEntities[0].number==64 and pipe.runtime.buildWorld.ring[0].number==64,"shared entity ring")
  c=c+req(ds.currentBlock==2 and ds.xmitBlock==1 and ds.blockSizes[0]==2048,"download callback")
  c=c+req(len(payload)>=1300 and len(pipe.fragments)==2 and len(nr.context.packets)==2,"fragment chain drained")
  c=c+req((numeric.readI32(pipe.fragments[0],0)&netchan.FRAGMENT_BIT)!=0 and len(pipe.fragments[0])==1308,"first server fragment")
  c=c+req(len(pipe.fragments[1])>8 and not channel.unsentFragments and channel.outgoingSequence==2 and pipe.client.outgoingSequence==2,"final fragment and sequence")
  c=c+req(pipe.client.frames[1].messageSent==1000 and pipe.client.frames[1].messageAcked==-1,"send metadata retained")
  pipe.client.bot=true;before=len(nr.context.packets);serverPipeline.sendSnapshot(pipe,level,1050);c=c+req(len(nr.context.packets)==before and pipe.runtime.buildWorld.snapshotCounter==2,"bot builds without send")
  c=c+req(try(serverPipeline.sendSnapshot(pipe,gameEntities.create(world),1100)) is error,"level mismatch rejected")
  c=c+req(try(serverPipeline.create(level,-1,8,[],void,void,void,nr,channel)) is error,"client bound")
  print "PASS: "+str(c)+" server-pipeline contracts";return 0
end function
