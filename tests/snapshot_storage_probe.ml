import mq3.server.snapshot_build as storageSnapshot
import mq3.game.entitystate as storageEntity
import mq3.game.playerstate as storagePlayer
struct Trace calls hash end struct
function wordsText(values) text="";for each item in values text=text+str(item)+"," end for;return text end function
function point(s,origin) print "point|"+wordsText(origin);s.context.calls=s.context.calls+1;s.context.hash=s.context.hash*3+origin[0];if origin[0]>=100 then return 1 end if;return 0 end function
function area(s,leaf) return leaf end function
function cluster(s,leaf) return leaf end function
function bits(s,output,area) output[area]=output[area]|(1<<area);return 2 end function
function pvs(s,cluster) if cluster==1 then return bytes([2]) end if;return bytes([1]) end function
function connected(s,a,b) return a==b end function
function mix(h,word) return ((h*31)^word)&0x7FFFFFFF end function
function runCase(count,client,missing,zombie,portal,capacity)
  entities=array(count,void)
  if count>0 then for i=0 to count-1
    e=storageEntity.create();e.number=i;e.eType=i%13;e.origin=[(i*1.0),-(i*1.0),0.25];e.generic1=i*3
    entities[i]=storageSnapshot.snapshotEntity(e,true,0,0,[0],0,0,0)
  end for end if
  if portal and count>3 then entities[1].svFlags=storageSnapshot.SVF_PORTAL;entities[1].state.generic1=0;entities[1].state.origin2=[100.0,0.0,0.0];entities[2].areaNum=1;entities[2].areaNum2=1;entities[2].clusters=[1];entities[3].state.number=777 end if
  w=storageSnapshot.world(true,entities,capacity);w.nextSnapshotEntities=capacity-1
  h=storageSnapshot.services(point,area,cluster,bits,pvs,connected,Trace(0,0));ps=storagePlayer.create();ps.clientNum=client;ps.viewheight=26
  if count>0 and client<count then ps.origin=[(client*1.0),2.0,3.0] end if
  f=storageSnapshot.buildClientSnapshot(w,h,ps,not missing,zombie)
  print "player|"+wordsText(storagePlayer.words(f.playerState))+"|area|"+wordsText(f.areaBits)
  sum=17;other=29
  for each word in storagePlayer.words(f.playerState) sum=mix(sum,word);other=mix(other,word+7) end for
  for each byte in f.areaBits sum=mix(sum,byte);other=mix(other,byte+7) end for
  if f.numEntities>0 then for i=0 to f.numEntities-1
    e=w.ring[(f.firstEntity+i)%w.ringCapacity]
    print "entity|"+wordsText(storageEntity.words(e))
    for each word in storageEntity.words(e) sum=mix(sum,word);other=mix(other,word+7) end for
  end for end if
  marks=0;if count>0 then for i=0 to count-1 marks=mix(marks,w.entities[i].snapshotCounter);marks=mix(marks,w.entities[i].state.number) end for end if
  if count>0 then for i=0 to count-1 print "counter|"+str(i)+"|"+str(w.entities[i].snapshotCounter)+"|number|"+str(w.entities[i].state.number) end for end if
  before=void;prior=void;if f.numEntities>0 then prior=w.ring[f.firstEntity%w.ringCapacity];before=storageEntity.words(prior) end if
  if count>0 and not missing and not zombie then limit=count;if limit>1024 then limit=1024 end if;ps.clientNum=(client+1)%limit;storageSnapshot.buildClientSnapshot(w,h,ps,true,false) end if
  if prior!=void and storageEntity.words(prior)!=before then return error(499,"prior snapshot mutated") end if
  print str(count)+"|"+str(client)+"|"+str(missing)+"|"+str(zombie)+"|"+str(portal)+"|"+str(f.numEntities)+"|"+str(f.firstEntity)+"|"+str(f.areaBytes)+"|"+str(sum)+"|"+str(other)+"|"+str(marks)+"|"+str(h.context.calls)+"|"+str(h.context.hash)
  return 0
end function
function main(args)
  runCase(0,0,true,false,false,1);runCase(0,0,false,true,false,1)
  for each count in [1,3,33,129,1024,1025]
    runCase(count,0,false,false,false,count);runCase(count,0,false,false,true,count);lastClient=count-1;if lastClient>1023 then lastClient=1023 end if;runCase(count,lastClient,false,false,false,count)
    runCase(count,0,true,false,false,count);runCase(count,0,false,true,false,count)
  end for
  runCase(1025,0,false,false,false,1024);runCase(1025,0,false,false,true,1024)
  w=storageSnapshot.world(true,[],1);w.snapshotCounter=1;e=storageSnapshot.snapshotEntity(storageEntity.create(),true,0,0,[],0,0,0);numbers=storageSnapshot.entityNumbers();numbers.count=1024
  if storageSnapshot.addEntity(w,e,numbers) or e.snapshotCounter!=1 or len(numbers.values)!=1024 then return error(499,"public cap and marking changed") end if
  print "PASS: public cap mark and detached prior frames";return 0
end function
