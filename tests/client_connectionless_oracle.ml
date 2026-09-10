// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.connectionless as con
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
struct Context events modified end struct
function add(h,text) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+text;return void end function
function info(h,s,a,m) add(h,"info:"+message.readCString(m));return void end function
function status(h,s,a,m) add(h,"status:"+message.readCStringLine(m));return void end function
function pr(h,s,text) if text=="Server disconnected for unknown reason\n" then add(h,"warn") else h.context.events=h.context.events+"print:"+text end if;return void end function
function drop(h,s,show,text) add(h,"cvar");add(h,"drop");s.connectionState=con.CA_DISCONNECTED;return void end function
function echo(h,s,a,text) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+"oob:"+text;return void end function
function motd(h,s,a,text) add(h,"motd");return void end function
function servers(h,s,a,m) add(h,"servers");return void end function
function lan(h,s,a) return a.ip[3]==1 end function
function auth(h,s) add(h,"auth");return void end function
function userinfo(h,s) return "\\name\\p" end function
function dataFn(h,s,a,data) add(h,"data:"+decode(data)+":"+str(len(data)));return void end function
function clearFn(h,s) h.context.modified=0;return void end function
function host() h=con.services();h.context=Context("",2);h.infoFn=info;h.statusFn=status;h.printFn=pr;h.disconnectFn=drop;h.outOfBandFn=echo;h.motdFn=motd;h.serversFn=servers;h.lanFn=lan;h.authorizationFn=auth;h.userinfoFn=userinfo;h.outOfBandDataFn=dataFn;h.clearUserinfoModifiedFn=clearFn;return h end function
function adr(last,port) return net.Address(4,[1,2,3,last],port) end function
function wire(line,tail) data=bytes([255,255,255,255])+bytes(line)+bytes([10]);if tail!=void then data=data+bytes(tail)+bytes([0]) end if;m=message.initStorage(data,len(data),true);m.cursize=len(data);return m end function
function reset(state) s=con.create(adr(4,27960));s.connectionState=state;s.realtime=5000;s.lastPacketTime=0;s.qport=4242;s.channel=net.setup(net.NS_CLIENT,s.serverAddress,0);return s end function
function show(tag,s,h) q=0;if s.channel!=void then q=s.channel.qport end if;print tag+"|"+str(s.connectionState)+"|"+str(s.challenge)+"|"+str(s.connectPacketCount)+"|"+str(s.connectTime)+"|"+str(s.serverAddress.port)+"|"+str(q)+"|"+s.serverMessage+"|"+h.context.events;return void end function
function run(tag,state,source,line,tail) s=reset(state);h=host();con.dispatch(s,h,source,wire(line,tail));show(tag,s,h);return void end function
function resend(tag,state,now,previous,demo,last) s=reset(state);s.realtime=now;s.connectTime=previous;s.demoplaying=demo;s.serverAddress.ip[3]=last;s.challenge=765;h=host();con.checkForResend(s,h);print tag+"|"+str(s.connectPacketCount)+"|"+str(s.connectTime)+"|"+str(s.connectionState)+"|"+str(h.context.modified)+"|"+h.context.events;return void end function
function main(args)
 run("challenge",con.CA_CONNECTING,adr(9,3000),"challengeResponse 12345",void);run("challenge_bad",con.CA_CONNECTED,adr(9,3000),"CHALLENGERESPONSE 8",void);run("connect",con.CA_CHALLENGING,adr(4,3001),"connectResponse",void);run("connect_wrong",con.CA_CHALLENGING,adr(8,3001),"connectResponse",void);run("connect_dup",con.CA_CONNECTED,adr(4,3001),"connectResponse",void);run("info",con.CA_DISCONNECTED,adr(2,1),"infoResponse","\\protocol\\68");run("status",con.CA_DISCONNECTED,adr(2,1),"statusResponse","\\sv_hostname\\Q3\n");run("disconnect",con.CA_ACTIVE,adr(4,27960),"disconnect",void)
 s=reset(con.CA_ACTIVE);s.realtime=1000;h=host();con.dispatch(s,h,adr(4,27960),wire("disconnect",void));print "disconnect_fresh|"+str(s.connectionState)+"|"+h.context.events
 run("print",con.CA_CONNECTING,adr(4,1),"print","hello world");run("echo",con.CA_DISCONNECTED,adr(2,1),"echo pong",void);run("unknown",con.CA_DISCONNECTED,adr(2,1),"something",void);resend("resend_demo",con.CA_CONNECTING,5000,0,true,9);resend("resend_wait",con.CA_CONNECTING,2999,0,false,9);resend("resend_wan",con.CA_CONNECTING,5000,0,false,9);resend("resend_lan",con.CA_CONNECTING,5000,0,false,1);resend("resend_connect",con.CA_CHALLENGING,5000,0,false,9);return 0
end function
