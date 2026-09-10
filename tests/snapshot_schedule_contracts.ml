import mq3.server.snapshot_schedule as schedule

struct Context snapshots fragments order time end struct
function snapshot(host,c) host.context.snapshots=host.context.snapshots+1;host.context.order=host.context.order+"S"+str(c.slot);c.nextSnapshotTime=host.context.time+77 end function
function fragment(host,c) host.context.fragments=host.context.fragments+1;host.context.order=host.context.order+"F"+str(c.slot) end function
function req(value,text) if not value then return error(499,"snapshot schedule: "+text) end if;return 1 end function
function setup(count,time)
  clients=[];for i=0 to count-1 clients=clients+[schedule.client(i)] end for
  context=Context(0,0,"",time);return [clients,schedule.services(snapshot,fragment,context)]
end function
function main(args)
  n=0;a=setup(3,1000);c=a[0];h=a[1]
  c[0].state=0;c[1].state=4;c[1].nextSnapshotTime=1001;c[2].state=3;c[2].nextSnapshotTime=1000
  n=n+req(schedule.sendClientMessages(c,1000,0,h)==1,"one due client")
  n=n+req(h.context.snapshots==1 and h.context.fragments==0,"snapshot callback")
  n=n+req(h.context.order=="S2","slot iteration")
  n=n+req(c[0].nextSnapshotTime==0,"free skipped")
  n=n+req(c[1].nextSnapshotTime==1001,"future skipped")
  n=n+req(c[2].nextSnapshotTime==1077,"snapshot owns reschedule")

  a=setup(2,2000);c=a[0];h=a[1]
  c[0].state=4;c[0].rate=5000;c[0].netchan.unsentFragments=true;c[0].netchan.unsentLength=2100;c[0].netchan.unsentFragmentStart=100
  c[1].state=4;c[1].rate=10000;c[1].netchan.unsentFragments=true;c[1].netchan.unsentLength=500;c[1].netchan.unsentFragmentStart=100
  n=n+req(schedule.sendClientMessages(c,2000,0,h)==2,"two fragments due")
  n=n+req(h.context.snapshots==0 and h.context.fragments==2,"fragments take priority")
  n=n+req(h.context.order=="F0F1","fragment iteration")
  n=n+req(c[0].nextSnapshotTime==2309,"fragment cap rate")
  n=n+req(c[1].nextSnapshotTime==2044,"fragment remainder rate")

  a=setup(1,3000);c=a[0];h=a[1];c[0].state=4;c[0].rate=9000;c[0].netchan.unsentFragments=true;c[0].netchan.unsentLength=200;c[0].netchan.unsentFragmentStart=100
  n=n+req(schedule.sendClientMessages(c,3000,500,h)==1,"maxrate fragment due")
  n=n+req(c[0].nextSnapshotTime==3148,"minimum maxrate clamp")
  n=n+req(h.context.fragments==1,"maxrate fragment callback")

  a=setup(1,4000);c=a[0];h=a[1];c[0].state=4;c[0].nextSnapshotTime=4000
  n=n+req(schedule.sendClientMessages(c,4000,0,h)==1,"exact deadline due")
  n=n+req(h.context.snapshots==1,"deadline snapshot")
  n=n+req(try(schedule.sendClientMessages(c,4000,0,void)) is error,"host required")
  bad=schedule.services(void,fragment,h.context);n=n+req(try(schedule.sendClientMessages(c,4000,0,bad)) is error,"snapshot service required")
  bad=schedule.services(snapshot,void,h.context);n=n+req(try(schedule.sendClientMessages(c,4000,0,bad)) is error,"fragment service required")
  print "PASS: "+str(n)+" snapshot-schedule contracts";return 0
end function
