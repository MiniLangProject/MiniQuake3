import mq3.server.snapshot_build as snapshot
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.compat.numeric as n
struct Context pvs end struct
function pointLeaf(s,origin) if origin[0]>=100.0 then return 1 end if;return 0 end function
function leafArea(s,leaf) return leaf end function
function leafCluster(s,leaf) return leaf end function
function writeArea(s,bits,area) bits[0]=bits[0]|(1<<area);return 1 end function
function clusterPvs(s,cluster) return s.context.pvs[cluster] end function
function connected(s,first,second) return first==second end function
function host(rows) return snapshot.services(pointLeaf,leafArea,leafCluster,writeArea,clusterPvs,connected,Context(rows)) end function
function entity(number) state=es.create();state.number=number;return snapshot.snapshotEntity(state,true,0,0,[0],0,0,0) end function
function makeWorld(count)
  entities=[]
  if count>0 then for i=0 to count-1 entities=entities+[entity(i)] end for end if
  w=snapshot.world(true,entities,64);w.snapshotCounter=1;return w
end function
function output(name,w,h,f,numbers)
  values=[];if numbers.count>0 then for i=0 to numbers.count-1 values=values+[numbers.values[i]] end for end if;values=snapshot.sortEntityNumbers(values)
  text=name+"|"+str(len(values))+"|";for i=0 to len(values)-1 if i>0 then text=text+"," end if;text=text+str(values[i]) end for
  text=text+"|";digits=bytes("0123456789abcdef");value=f.areaBits[0];text=text+decode(bytes([digits[(value>>4)&15],digits[value&15]]))+"|"
  for i=0 to len(w.entities)-1 if i>0 then text=text+"," end if;if w.entities[i].snapshotCounter==w.snapshotCounter then text=text+"1" else text=text+"0" end if end for
  print text;return void
end function
function visible(name,w,h)
  f=snapshot.frame();f.playerState.clientNum=2;n=snapshot.entityNumbers();snapshot.addEntitiesVisibleFromPoint(w,h,[0.0,0.0,0.0],f,n,false);output(name,w,h,f,n)
end function
function main(args)
  w=makeWorld(9);w.entities[1].linked=false;w.entities[2].svFlags=snapshot.SVF_NOCLIENT;w.entities[3].svFlags=snapshot.SVF_SINGLECLIENT;w.entities[3].singleClient=2;w.entities[4].svFlags=snapshot.SVF_SINGLECLIENT;w.entities[4].singleClient=1;w.entities[5].svFlags=snapshot.SVF_NOTSINGLECLIENT;w.entities[5].singleClient=2;w.entities[6].svFlags=snapshot.SVF_NOTSINGLECLIENT;w.entities[6].singleClient=1;w.entities[7].svFlags=snapshot.SVF_CLIENTMASK;w.entities[7].singleClient=1<<2;w.entities[8].svFlags=snapshot.SVF_CLIENTMASK;w.entities[8].singleClient=1<<1;visible("filters",w,host([bytes([1,0]),bytes([0,0])]))
  w=makeWorld(2);w.entities[0].svFlags=snapshot.SVF_BROADCAST;w.entities[0].clusters=[];w.entities[0].areaNum=1;w.entities[1].areaNum=1;visible("broadcast",w,host([bytes([0,0]),bytes([0,0])]))
  w=makeWorld(4);w.entities[1].clusters=[1];w.entities[1].areaNum=1;w.entities[2].linked=false;w.entities[3].svFlags=snapshot.SVF_PORTAL;w.entities[3].state.origin2=[100.0,0.0,0.0];visible("portal",w,host([bytes([1,0]),bytes([2,0])]))
  w=makeWorld(2);w.entities[1].snapshotCounter=1;visible("dedupe",w,host([bytes([1,0]),bytes([0,0])]))
  w=makeWorld(3);w.ringCapacity=4;w.ring=array(4,void);w.nextSnapshotEntities=3;w.entities[2].svFlags=snapshot.SVF_BROADCAST;h=host([bytes([1,0]),bytes([0,0])]);p=ps.create();p.clientNum=0;p.origin=[10.0,20.0,30.0];p.viewheight=26;f=snapshot.buildClientSnapshot(w,h,p,true,false)
  print "build|"+str(f.firstEntity)+"|"+str(f.numEntities)+"|"+str(w.nextSnapshotEntities)+"|"+str(w.ring[3].number)+","+str(w.ring[0].number)+"|fe|"+str(n.trunc32(f.playerState.origin[2]))+","+str(f.playerState.viewheight)+","+str(f.playerState.clientNum)
  return 0
end function
