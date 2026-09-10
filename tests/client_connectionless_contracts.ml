import mq3.client.connectionless as con
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
struct Context events end struct
function req(v,s) if not v then return error(6941,"client connectionless: "+s) end if;return 1 end function
function add(h,s) h.context.events=h.context.events+[s];return void end function
function info(h,s,a,m) add(h,"info:"+message.readCString(m));return void end function
function status(h,s,a,m) add(h,"status:"+message.readCStringLine(m));return void end function
function drop(h,s,show,text) add(h,"drop");s.connectionState=con.CA_DISCONNECTED;return void end function
function pr(h,s,text) add(h,"print:"+text);return void end function
function oob(h,s,a,text) add(h,"oob:"+text);return void end function
function motd(h,s,a,text) add(h,"motd:"+text);return void end function
function servers(h,s,a,m) add(h,"servers");return void end function
function diag(h,s,text) add(h,"bad:"+text);return void end function
function host() h=con.services();h.context=Context([]);h.infoFn=info;h.statusFn=status;h.disconnectFn=drop;h.printFn=pr;h.outOfBandFn=oob;h.motdFn=motd;h.serversFn=servers;h.diagnosticFn=diag;return h end function
function adr(last,port) return net.Address(4,[1,2,3,last],port) end function
function wire(line,tail) data=bytes([255,255,255,255])+bytes(line)+bytes([10]);if tail!=void then data=data+bytes(tail)+bytes([0]) end if;m=message.initStorage(data,len(data),true);m.cursize=len(data);return m end function
function state(value) s=con.create(adr(4,27960));s.connectionState=value;s.realtime=5000;s.qport=1234;s.channel=net.setup(net.NS_CLIENT,s.serverAddress,0);return s end function
function main(args)
 c=0;a=adr(4,27960);b=adr(4,3000);c=c+req(con.addressEqual(a,a,true),"full address");c=c+req(con.addressEqual(a,b,false),"base ignores port");c=c+req(not con.addressEqual(a,b,true),"full includes port");s=con.create(a);c=c+req(s.connectionState==con.CA_DISCONNECTED,"initial state")
 h=host();s=state(con.CA_CONNECTING);s.connectPacketCount=9;s.connectTime=88;r=con.dispatch(s,h,adr(9,3000),wire("ChAlLeNgErEsPoNsE 765",void));c=c+req(r=="challengeResponse" and s.connectionState==con.CA_CHALLENGING,"challenge state");c=c+req(s.challenge==765,"challenge value");c=c+req(s.connectPacketCount==0 and s.connectTime==-99999,"challenge reset");c=c+req(s.serverAddress.port==3000 and s.serverAddress.ip[3]==9,"proxy handoff")
 s=state(con.CA_CONNECTED);c=c+req(con.dispatch(s,h,a,wire("challengeResponse 1",void))=="ignored","unwanted challenge")
 s=state(con.CA_CHALLENGING);r=con.dispatch(s,h,b,wire("connectResponse",void));c=c+req(r=="connectResponse" and s.connectionState==con.CA_CONNECTED,"connect state");c=c+req(s.channel.remoteAddress.port==3000 and s.channel.qport==1234,"netchan setup");c=c+req(s.lastPacketSentTime==-9999,"first send");s=state(con.CA_CHALLENGING);c=c+req(con.dispatch(s,h,adr(8,3000),wire("connectResponse",void))=="ignored","wrong base");s=state(con.CA_CONNECTING);c=c+req(con.dispatch(s,h,a,wire("connectResponse",void))=="ignored","wrong state")
 h=host();s=state(con.CA_DISCONNECTED);c=c+req(con.dispatch(s,h,a,wire("infoResponse","\\protocol\\68"))=="infoResponse" and h.context.events==["info:\\protocol\\68"],"info");h=host();c=c+req(con.dispatch(s,h,a,wire("statusResponse","players\n"))=="statusResponse" and h.context.events==["status:players"],"status")
 h=host();s=state(con.CA_DISCONNECTED);c=c+req(not con.disconnectPacket(s,h,a),"disconnect state");s=state(con.CA_ACTIVE);s.realtime=2000;c=c+req(not con.disconnectPacket(s,h,a),"disconnect fresh");s.realtime=5000;c=c+req(not con.disconnectPacket(s,h,b),"disconnect address");c=c+req(con.disconnectPacket(s,h,a) and s.connectionState==con.CA_DISCONNECTED,"disconnect accepted")
 h=host();s=state(con.CA_CONNECTING);c=c+req(con.dispatch(s,h,a,wire("print","hello"))=="print" and s.serverMessage=="hello","print");h=host();c=c+req(con.dispatch(s,h,a,wire("echo token",void))=="echo" and h.context.events==["oob:token"],"echo");h=host();c=c+req(con.dispatch(s,h,a,wire("keyAuthorize x",void))=="keyAuthorize" and len(h.context.events)==0,"key");h=host();c=c+req(con.dispatch(s,h,a,wire("motd x",void))=="motd" and h.context.events==["motd:x"],"motd");h=host();c=c+req(con.dispatch(s,h,a,wire("getserversResponseExt",void))=="getserversResponse" and h.context.events==["servers"],"servers");h=host();c=c+req(con.dispatch(s,h,a,wire("wat x",void))=="unknown" and h.context.events==["bad:wat x"],"unknown");c=c+req(try(con.dispatch(void,h,a,wire("x",void))) is error,"required")
 print "PASS: "+str(c)+" client connectionless contracts";return 0
end function
