// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.client_pings as pings

function line(name,clients,states)
  pings.calculate(clients,states);text=name;i=0
  while i<len(clients) text=text+"|"+str(clients[i].ping)+":"+str(states[i].ping);i=i+1 end while
  print text
end function

function setup(count)
  clients=[];states=[];i=0
  while i<count clients=clients+[pings.client()];ps=pings.playerState();ps.ping=-77;states=states+[ps];i=i+1 end while
  return [clients,states]
end function

function main(args)
  pair=setup(4);c=pair[0];s=pair[1]
  c[0].state=0;c[0].ping=13
  c[1].state=pings.CS_ACTIVE;c[1].ping=14
  c[2].state=pings.CS_ACTIVE;c[2].gentity=pings.gameEntity(pings.SVF_BOT)
  c[3].state=pings.CS_ACTIVE;c[3].gentity=pings.gameEntity(0)
  line("states",c,s)
  pair=setup(1);c=pair[0];s=pair[1];c[0].state=pings.CS_ACTIVE;c[0].gentity=pings.gameEntity(0)
  c[0].frames[0]=pings.frame(100,110);c[0].frames[1]=pings.frame(200,221);c[0].frames[2]=pings.frame(-50,1);line("average",c,s)
  pair=setup(1);c=pair[0];s=pair[1];c[0].state=pings.CS_ACTIVE;c[0].gentity=pings.gameEntity(0);c[0].frames[0]=pings.frame(1,2001);line("clamp",c,s)
  pair=setup(1);c=pair[0];s=pair[1];c[0].state=pings.CS_ACTIVE;c[0].gentity=pings.gameEntity(0)
  c[0].frames[0]=pings.frame(100,99);c[0].frames[1]=pings.frame(100,0);c[0].frames[2]=pings.frame(100,-1);line("signed",c,s)
  return 0
end function
