import std.fs as fs
import mq3.collision.world as cm
import mq3.collision.visibility as vis
import mq3.game.entities as gameEntities
import mq3.game.entitystate as es
import mq3.server.snapshot_runtime as runtimeAdapter
import mq3.server.snapshot_delta as snapshotDelta
import mq3.qcommon.message as message
function main(args)
  if len(args)!=4 then return error(499,"usage: bsp x y z") end if
  world=cm.loadBrushWorld(fs.readAllBytes(args[0]));level=gameEntities.create(world);level.num_entities=66
  origin=[toNumber(args[1]),toNumber(args[2]),toNumber(args[3])]
  player=level.clients[0];player.ps.clientNum=0;player.ps.origin=origin;player.ps.viewheight=0
  own=gameEntities.initEntity(level.entities[0]);gameEntities.bindClient(level,own,player);own.s.origin=origin;own.r.currentOrigin=origin;own.r.mins=[-1.0,-1.0,-1.0];own.r.maxs=[1.0,1.0,1.0];gameEntities.link(level,own)
  visible=gameEntities.initEntity(level.entities[64]);visible.s.origin=origin;visible.r.currentOrigin=origin;visible.r.mins=[-1.0,-1.0,-1.0];visible.r.maxs=[1.0,1.0,1.0];gameEntities.link(level,visible)
  broadcast=gameEntities.initEntity(level.entities[65]);broadcast.s.origin=[origin[0]+4096.0,origin[1],origin[2]];broadcast.r.currentOrigin=broadcast.s.origin;broadcast.r.mins=[-1.0,-1.0,-1.0];broadcast.r.maxs=[1.0,1.0,1.0];broadcast.r.svFlags=32;gameEntities.link(level,broadcast)
  adapter=runtimeAdapter.create(level,16);frame=runtimeAdapter.buildClientFrame(adapter,level,0,false)
  baseline64=es.create();baseline64.number=64;baseline65=es.create();baseline65.number=65
  msg=message.init(4096);emitted=snapshotDelta.writeSnapshotPayload(msg,void,frame,adapter.buildWorld.ring,adapter.buildWorld.ringCapacity,[baseline64,baseline65],1234,0,0)
  leaf=cm.pointLeafnum(world,origin);cluster=vis.leafCluster(world.visibility,leaf);area=vis.leafArea(world.visibility,leaf)
  first=adapter.buildWorld.ring[frame.firstEntity%adapter.buildWorld.ringCapacity].number;second=adapter.buildWorld.ring[(frame.firstEntity+1)%adapter.buildWorld.ringCapacity].number
  print "PASS: map="+args[0]+" leaf="+str(leaf)+" cluster="+str(cluster)+" area="+str(area)+" entities="+str(frame.numEntities)+" ring="+str(first)+","+str(second)+" emitted="+str(emitted)+" packetBytes="+str(msg.cursize)
  return 0
end function
