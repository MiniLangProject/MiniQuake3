import mq3.server.snapshot_build as snapshot
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
struct Context pvs origins end struct
function req(value,label) if not value then return error(499,"snapshot build: "+label) end if;return 1 end function
function pointLeaf(s,origin) s.context.origins=s.context.origins+[origin];if origin[0]>=100.0 then return 1 end if;return 0 end function
function leafArea(s,leaf) return leaf end function
function leafCluster(s,leaf) return leaf end function
function writeArea(s,bits,area) bits[0]=bits[0]|(1<<area);return 1 end function
function clusterPvs(s,cluster) return s.context.pvs[cluster] end function
function connected(s,a,b) return a==b end function
function host(rows) return snapshot.services(pointLeaf,leafArea,leafCluster,writeArea,clusterPvs,connected,Context(rows,[])) end function
function entity(number) state=es.create();state.number=number;state.eType=number+10;return snapshot.snapshotEntity(state,true,0,0,[0],0,0,0) end function
function make(count,capacity) values=[];if count>0 then for i=0 to count-1 values=values+[entity(i)] end for end if;return snapshot.world(true,values,capacity) end function
function main(args)
 c=0
 c=c+req(snapshot.sortEntityNumbers([5,1,3,0])==[0,1,3,5],"number sort")
 c=c+req(snapshot.sortEntityNumbers([])==[],"empty sort")
 c=c+req(try(snapshot.sortEntityNumbers([1,2,1])) is error,"duplicate rejected")
 reverse=array(1024,0);for i=0 to 1023 reverse[i]=1023-i end for;sorted=snapshot.sortEntityNumbers(reverse)
 c=c+req(sorted[0]==0 and sorted[511]==511 and sorted[1023]==1023 and reverse[0]==1023,"maximum entity sort")
 c=c+req(try(snapshot.world(true,[],0)) is error,"zero ring rejected")
 w=make(1,2);w.snapshotCounter=1;n=snapshot.entityNumbers();c=c+req(snapshot.addEntity(w,w.entities[0],n) and n.count==1 and n.values[0]==0,"entity add")
 c=c+req(not snapshot.addEntity(w,w.entities[0],n) and n.count==1,"entity dedupe")
 w.entities[0].snapshotCounter=0;n.count=1024;c=c+req(not snapshot.addEntity(w,w.entities[0],n) and w.entities[0].snapshotCounter==1,"full list still marks")
 c=c+req(snapshot.pvsContains(bytes([0x80,1]),7) and snapshot.pvsContains(bytes([0x80,1]),8),"pvs bit addressing")
 c=c+req(not snapshot.pvsContains(bytes([1]),-1) and not snapshot.pvsContains(bytes([1]),8),"pvs bounds")
 c=c+req(snapshot.distanceSquared([1.0,2.0,3.0],[4.0,6.0,3.0])==25.0,"portal distance")
 h=host([bytes([1]),bytes([0])]);w=make(1,2);w.active=false;w.snapshotCounter=1;f=snapshot.frame();n=snapshot.entityNumbers();snapshot.addEntitiesVisibleFromPoint(w,h,[0.0,0.0,0.0],f,n,false)
 c=c+req(n.count==0 and h.context.origins==[],"inactive server")
 w=make(1,2);w.snapshotCounter=1;w.entities[0].linked=false;f=snapshot.frame();n=snapshot.entityNumbers();snapshot.addEntitiesVisibleFromPoint(w,h,[0.0,0.0,0.0],f,n,false);c=c+req(n.count==0,"unlinked filtered")
 w=make(1,2);w.snapshotCounter=1;w.entities[0].areaNum=1;w.entities[0].areaNum2=1;f=snapshot.frame();n=snapshot.entityNumbers();snapshot.addEntitiesVisibleFromPoint(w,h,[0.0,0.0,0.0],f,n,false);c=c+req(n.count==0,"disconnected area filtered")
 w=make(1,2);w.snapshotCounter=1;w.entities[0].clusters=[];f=snapshot.frame();n=snapshot.entityNumbers();snapshot.addEntitiesVisibleFromPoint(w,h,[0.0,0.0,0.0],f,n,false);c=c+req(n.count==0,"empty clusters filtered")
 w=make(1,2);w.snapshotCounter=1;w.entities[0].svFlags=snapshot.SVF_CLIENTMASK;f=snapshot.frame();f.playerState.clientNum=32;n=snapshot.entityNumbers();c=c+req(try(snapshot.addEntitiesVisibleFromPoint(w,h,[0.0,0.0,0.0],f,n,false)) is error,"client mask bound")
 p=ps.create();p.clientNum=0;p.origin=[10.0,20.0,30.0];p.viewheight=26
 w=make(3,3);w.entities[2].svFlags=snapshot.SVF_BROADCAST;h=host([bytes([1]),bytes([0])]);f=snapshot.buildClientSnapshot(w,h,p,true,false)
 c=c+req(f.numEntities==2 and f.firstEntity==0 and w.nextSnapshotEntities==2,"frame ring counts")
 c=c+req(w.ring[0].number==1 and w.ring[1].number==2,"own entity excluded and sorted copies")
 c=c+req(f.playerState.clientNum==0 and f.playerState.origin==p.origin,"playerstate copied")
 c=c+req(h.context.origins[0]==[10.0,20.0,56.0],"viewheight origin")
 c=c+req(f.areaBytes==1 and f.areaBits[0]==254 and f.areaBits[31]==255,"area mask inverted")
 w.entities[1].state.eType=99;c=c+req(w.ring[0].eType==11,"ring state detached copy")
 before=w.snapshotCounter;empty=snapshot.buildClientSnapshot(w,h,p,false,false);c=c+req(empty.numEntities==0 and w.snapshotCounter==before+1,"missing client empty frame")
 before=w.snapshotCounter;empty=snapshot.buildClientSnapshot(w,h,p,true,true);c=c+req(empty.numEntities==0 and w.snapshotCounter==before+1,"zombie empty frame")
 bad=ps.create();bad.clientNum=5;c=c+req(try(snapshot.buildClientSnapshot(make(1,2),h,bad,true,false)) is error,"client entity bound")
 w=make(2,2);w.entities[1].state.number=77;f=snapshot.buildClientSnapshot(w,h,p,true,false);c=c+req(w.entities[1].state.number==1,"entity number repaired")
 portal=make(2,4);portal.entities[1].svFlags=snapshot.SVF_PORTAL;portal.entities[1].state.origin=[500.0,0.0,0.0];portal.entities[1].state.origin2=[100.0,0.0,0.0];portal.entities[1].state.generic1=10;h=host([bytes([1]),bytes([2])]);snapshot.buildClientSnapshot(portal,h,p,true,false);c=c+req(len(h.context.origins)==1,"distant portal skipped")
 print "PASS: "+str(c)+" snapshot-build contracts";return 0
end function
