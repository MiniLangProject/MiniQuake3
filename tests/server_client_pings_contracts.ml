// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.client_pings as pings
function req(value,label) if not value then return error(499,"server client pings: "+label) end if;return 1 end function
function arrays(count) c=[];s=[];i=0;while i<count c=c+[pings.client()];s=s+[pings.playerState()];i=i+1 end while;return [c,s] end function
function active(cl) cl.state=pings.CS_ACTIVE;cl.gentity=pings.gameEntity(0);return cl end function
function main(args)
  n=0
  pair=arrays(1);c=pair[0];s=pair[1];s[0].ping=71;c[0].ping=4;pings.calculate(c,s);n=n+req(c[0].ping==999 and s[0].ping==71,"inactive leaves player state")
  pair=arrays(1);c=pair[0];s=pair[1];c[0].state=pings.CS_ACTIVE;s[0].ping=72;pings.calculate(c,s);n=n+req(c[0].ping==999 and s[0].ping==72,"missing entity leaves player state")
  pair=arrays(1);c=pair[0];s=pair[1];c[0].state=pings.CS_ACTIVE;c[0].gentity=pings.gameEntity(pings.SVF_BOT);s[0].ping=73;pings.calculate(c,s);n=n+req(c[0].ping==0 and s[0].ping==73,"bot leaves player state")
  pair=arrays(1);c=pair[0];s=pair[1];active(c[0]);pings.calculate(c,s);n=n+req(c[0].ping==999 and s[0].ping==999,"no acknowledgements")
  pair=arrays(1);c=pair[0];s=pair[1];active(c[0]);c[0].frames[0]=pings.frame(10,20);c[0].frames[1]=pings.frame(20,41);pings.calculate(c,s);n=n+req(c[0].ping==15 and s[0].ping==15,"integer average")
  pair=arrays(1);c=pair[0];s=pair[1];active(c[0]);c[0].frames[0]=pings.frame(0,1000);pings.calculate(c,s);n=n+req(c[0].ping==999,"upper clamp")
  pair=arrays(1);c=pair[0];s=pair[1];active(c[0]);c[0].frames[0]=pings.frame(50,1);pings.calculate(c,s);n=n+req(c[0].ping==-49 and s[0].ping==-49,"signed delta is not lower clamped")
  pair=arrays(1);c=pair[0];s=pair[1];active(c[0]);c[0].frames[0]=pings.frame(-10,1);c[0].frames[1]=pings.frame(500,0);c[0].frames[2]=pings.frame(500,-2);pings.calculate(c,s);n=n+req(c[0].ping==11,"only positive acknowledgement")
  pair=arrays(2);c=pair[0];s=pair[1];active(c[0]);active(c[1]);c[0].frames[0]=pings.frame(1,4);c[1].frames[31]=pings.frame(20,29);pings.calculate(c,s);n=n+req(c[0].ping==3 and c[1].ping==9,"all clients and ring edge")
  n=n+req(try(pings.calculate(void,[])) is error,"missing clients")
  n=n+req(try(pings.calculate([],void)) is error,"missing player states")
  pair=arrays(1);n=n+req(try(pings.calculate(pair[0],[])) is error,"short player states")
  states=[];states=states+[pings.playerState()];n=n+req(try(pings.calculate(array(1,void),states)) is error,"missing client")
  pair=arrays(1);active(pair[0][0]);pair[0][0].frames=[];n=n+req(try(pings.calculate(pair[0],pair[1])) is error,"short frame ring")
  pair=arrays(1);active(pair[0][0]);n=n+req(try(pings.calculate(pair[0],array(1,void))) is error,"missing active player state")
  pair=arrays(1);pair[0][0].state=0;pings.calculate(pair[0],array(1,void));n=n+req(pair[0][0].ping==999,"inactive needs no player state")
  print "PASS: "+str(n)+" server client-ping contracts";return 0
end function
