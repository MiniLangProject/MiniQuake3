import mq3.server.snapshot_runtime as runtimeAdapter
import mq3.server.world as serverWorld
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
struct MockScene world end struct
struct MockEntity s r client end struct
struct MockClient ps end struct
struct MockLevel scene entities num_entities clients end struct
function req(value,label) if not value then return error(499,"snapshot runtime: "+label) end if;return 1 end function
function gameEntity(number)
  state=es.create();state.number=number;state.eType=number+4
  spatial=serverWorld.entity(number);spatial.linked=true;spatial.svFlags=32;spatial.singleClient=7;spatial.clusters=[2,3];spatial.lastCluster=4;spatial.areanum=5;spatial.areanum2=6
  return MockEntity(state,spatial,void)
end function
function level(count,scene)
  values=[];if count>0 then for i=0 to count-1 values=values+[gameEntity(i)] end for end if
  clients=[];if count>0 then for i=0 to count-1 clients=clients+[MockClient(ps.create())] end for end if
  return MockLevel(scene,values,count,clients)
end function
function main(args)
 c=0
 c=c+req(try(runtimeAdapter.hostServices(void)) is error,"missing scene rejected")
 scene=MockScene(1);l=level(2,scene);mapped=runtimeAdapter.mappedEntity(l.entities[1])
 c=c+req(mapped.state.number==1 and mapped.state.eType==5,"entity state mapped")
 c=c+req(mapped.linked and mapped.svFlags==32 and mapped.singleClient==7,"spatial flags mapped")
 c=c+req(mapped.clusters==[2,3] and mapped.lastCluster==4 and mapped.areaNum==5 and mapped.areaNum2==6,"visibility metadata mapped")
 l.entities[1].s.eType=99;c=c+req(mapped.state.eType==5,"mapped state detached")
 adapter=runtimeAdapter.create(l,4);c=c+req(len(adapter.buildWorld.entities)==2 and adapter.buildWorld.ringCapacity==4,"runtime created")
 adapter.buildWorld.entities[1].snapshotCounter=17;l.entities[1].s.eType=33;l.entities[1].r.svFlags=64;count=runtimeAdapter.syncLevel(adapter,l)
 c=c+req(count==2 and adapter.buildWorld.entities[1].state.eType==33 and adapter.buildWorld.entities[1].svFlags==64,"level refresh")
 c=c+req(adapter.buildWorld.entities[1].snapshotCounter==17,"dedupe counter preserved")
 l.entities=l.entities+[gameEntity(2)];l.clients=l.clients+[MockClient(ps.create())];l.num_entities=3;runtimeAdapter.syncLevel(adapter,l);c=c+req(len(adapter.buildWorld.entities)==3,"entity growth")
 l.num_entities=1;runtimeAdapter.syncLevel(adapter,l);c=c+req(len(adapter.buildWorld.entities)==1,"entity shrink")
 other=level(1,MockScene(2));c=c+req(try(runtimeAdapter.syncLevel(adapter,other)) is error,"scene mismatch rejected")
 l.num_entities=-1;c=c+req(try(runtimeAdapter.syncLevel(adapter,l)) is error,"negative count rejected")
 l.num_entities=5;c=c+req(try(runtimeAdapter.syncLevel(adapter,l)) is error,"oversized count rejected")
 l.num_entities=1;c=c+req(try(runtimeAdapter.buildClientFrame(adapter,l,-1,false)) is error,"negative client rejected")
 c=c+req(try(runtimeAdapter.buildClientFrame(adapter,l,1,false)) is error,"client range rejected")
 c=c+req(try(runtimeAdapter.create(void,4)) is error,"missing level rejected")
 print "PASS: "+str(c)+" snapshot-runtime contracts";return 0
end function
