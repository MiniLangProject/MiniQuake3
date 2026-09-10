import mq3.server.snapshot_schedule as schedule

struct Context actions end struct
function append(host,kind,clientState) host.context.actions=host.context.actions+kind+str(clientState.slot)+"," end function
function snapshot(host,clientState) append(host,"S",clientState);clientState.nextSnapshotTime=host.context.time+50+clientState.slot end function
function fragment(host,clientState) append(host,"F",clientState) end function
struct OracleContext actions time end struct

function setup(count,time)
  clients=[]
  for i=0 to count-1 clients=clients+[schedule.client(i)] end for
  context=OracleContext("",time);host=schedule.services(snapshot,fragment,context)
  return [clients,host]
end function
function dump(name,all,time,maxRate)
  clients=all[0];host=all[1];schedule.sendClientMessages(clients,time,maxRate,host);text=name+"|"+host.context.actions
  for each c in clients text=text+"|"+str(c.nextSnapshotTime) end for
  effective=maxRate;if effective!=0 and effective<1000 then effective=1000 end if
  print text+"|max="+str(effective)
end function
function main(args)
  a=setup(6,1000);c=a[0]
  c[0].state=0;c[1].state=3;c[1].nextSnapshotTime=1001
  c[2].state=4;c[2].nextSnapshotTime=1000
  c[3].state=4;c[3].nextSnapshotTime=900;c[3].rate=5000;c[3].netchan.unsentFragments=true;c[3].netchan.unsentLength=2100;c[3].netchan.unsentFragmentStart=100
  c[4].state=2;c[4].nextSnapshotTime=0
  c[5].state=4;c[5].nextSnapshotTime=1000;c[5].rate=10000;c[5].netchan.unsentFragments=true;c[5].netchan.unsentLength=500;c[5].netchan.unsentFragmentStart=100
  dump("mixed",a,1000,0)
  a=setup(2,2000);c=a[0]
  c[0].state=4;c[0].rate=9000;c[0].netchan.unsentFragments=true;c[0].netchan.unsentLength=200;c[0].netchan.unsentFragmentStart=100
  c[1].state=4;c[1].rate=500;c[1].netchan.unsentFragments=true;c[1].netchan.unsentLength=50;c[1].netchan.unsentFragmentStart=50
  dump("maxrate",a,2000,500)
  a=setup(1,3000);c=a[0];c[0].state=4;c[0].rate=1000;c[0].netchan.unsentFragments=true;c[0].netchan.unsentLength=10000;c[0].netchan.unsentFragmentStart=9999
  dump("remaining",a,3000,0)
  return 0
end function
