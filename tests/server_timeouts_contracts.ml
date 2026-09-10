// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.timeouts as timeout
struct Context drops reasons diagnostics slots end struct
function drop(h,c,reason) h.context.drops=h.context.drops+1;h.context.reasons=h.context.reasons+[reason];return void end function
function diagnostic(h,index) h.context.diagnostics=h.context.diagnostics+1;h.context.slots=h.context.slots+[index];return void end function
function host() h=timeout.services();h.context=Context(0,[],0,[]);h.dropFn=drop;h.diagnosticFn=diagnostic;return h end function
function req(value,label) if not value then return error(499,"server timeouts: "+label) end if;return 1 end function
function state(now,dropSeconds,zombieSeconds,clients) s=timeout.runtime(clients);s.time=now;s.timeoutSeconds=dropSeconds;s.zombieSeconds=zombieSeconds;return s end function
function main(args)
 n=0
 c=timeout.client(timeout.CS_CONNECTED,7999,0);s=state(10000,2,2,[c]);h=host();timeout.check(s,h);n=n+req(c.timeoutCount==1 and c.state==timeout.CS_CONNECTED,"stale increments")
 i=0;while i<4 timeout.check(s,h);i=i+1 end while;n=n+req(c.timeoutCount==5 and h.context.drops==0,"five frame grace")
 timeout.check(s,h);n=n+req(c.timeoutCount==6 and c.state==timeout.CS_FREE,"sixth frees")
 n=n+req(h.context.drops==1 and h.context.reasons==["timed out"],"drop reason")
 c=timeout.client(timeout.CS_CONNECTED,8000,5);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.state==timeout.CS_CONNECTED and c.timeoutCount==0,"drop equality recent")
 c=timeout.client(timeout.CS_ACTIVE,9000,5);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.timeoutCount==0 and h.context.drops==0,"recent active resets")
 c=timeout.client(timeout.CS_ZOMBIE,7999,12);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.state==timeout.CS_FREE and c.timeoutCount==12,"expired zombie preserves counter")
 n=n+req(h.context.diagnostics==1 and h.context.slots==[0],"zombie diagnostic slot")
 c=timeout.client(timeout.CS_ZOMBIE,8000,12);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.state==timeout.CS_ZOMBIE and c.timeoutCount==0,"zombie equality retained")
 c=timeout.client(timeout.CS_FREE,5,12);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.state==timeout.CS_FREE and c.timeoutCount==0,"free resets")
 c=timeout.client(timeout.CS_ACTIVE,10001,4);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.lastPacketTime==10000 and c.timeoutCount==0,"future active clamped")
 c=timeout.client(timeout.CS_ZOMBIE,10001,4);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.lastPacketTime==10000 and c.state==timeout.CS_ZOMBIE,"future zombie clamped")
 a=timeout.client(timeout.CS_ZOMBIE,0,8);b=timeout.client(timeout.CS_ZOMBIE,0,9);s=state(10000,2,2,[a,b]);s.maxClients=1;h=host();timeout.check(s,h);n=n+req(a.state==timeout.CS_FREE and b.state==timeout.CS_ZOMBIE,"maxclients boundary")
 n=n+req(h.context.slots==[0],"processed slot identity")
 c=timeout.client(timeout.CS_CONNECTED,-2147483647,0);h=host();timeout.check(state(-2147483648,2,2,[c]),h);n=n+req(c.lastPacketTime==-2147483648 and c.timeoutCount==1,"signed time wrap")
 c=timeout.client(timeout.CS_CONNECTED,0,5);h=host();timeout.check(state(123,2147484,2,[c]),h);n=n+req(c.state==timeout.CS_FREE and h.context.drops==1,"timeout multiplication wrap")
 c=timeout.client(timeout.CS_CONNECTED,99,5);h=host();timeout.check(state(100,0,0,[c]),h);n=n+req(c.state==timeout.CS_FREE,"zero timeout")
 c=timeout.client(timeout.CS_ZOMBIE,99,5);h=host();timeout.check(state(100,0,0,[c]),h);n=n+req(c.state==timeout.CS_FREE and h.context.diagnostics==1,"zero zombie time")
 c=timeout.client(timeout.CS_CONNECTED,0,-1);h=host();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.timeoutCount==0 and c.state==timeout.CS_CONNECTED,"negative counter advances to zero")
 c=timeout.client(timeout.CS_CONNECTED,0,5);h=timeout.services();timeout.check(state(10000,2,2,[c]),h);n=n+req(c.state==timeout.CS_FREE,"optional callbacks")
 n=n+req(try(timeout.check(void,host())) is error,"missing runtime")
 n=n+req(try(timeout.check(timeout.runtime(void),host())) is error,"missing clients")
 s=state(0,2,2,[]);s.maxClients=1;n=n+req(try(timeout.check(s,host())) is error,"excess client count")
 s=state(0,2,2,[]);s.maxClients=-1;n=n+req(try(timeout.check(s,host())) is error,"negative client count")
 print "PASS: "+str(n)+" server-timeout contracts";return 0
end function
