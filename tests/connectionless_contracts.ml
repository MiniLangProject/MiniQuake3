import mq3.server.connectionless as connectionless
import mq3.server.oob_connect as oob
import mq3.qcommon.message as message
struct Context events end struct
function req(v,s) if not v then return error(499,"connectionless: "+s) end if;return 1 end function
function add(h,v) h.context.events=h.context.events+[v] end function
function status(h,a,x) add(h,"status:"+x[1]) end function
function info(h,a,x) add(h,"info:"+x[1]) end function
function rcon(h,a,m,t,x) add(h,"rcon:"+x[2]) end function
function auth(h,a,x) add(h,"auth") end function
function decompress(h,m,o) add(h,"decompress:"+str(o)) end function
function diagnostic(h,a,t) add(h,"bad:"+t) end function
function random(r) return 7 end function
function lan(r,a) return true end function
function local(r,a) return true end function
function send(r,a,t) r.context=r.context+[t] end function
function host() h=connectionless.services();h.context=Context([]);h.statusFn=status;h.infoFn=info;h.rconFn=rcon;h.authorizeFn=auth;h.decompressFn=decompress;h.diagnosticFn=diagnostic;return h end function
function runtime() r=oob.create(2,oob.config());r.randFn=random;r.lanFn=lan;r.localFn=local;r.sendFn=send;r.context=[];return r end function
function wire(text) m=message.initOob(512);message.writeLong(m,-1);message.writeString(m,text);return m end function
function main(args)
 c=0;a=oob.address(4,[1,2,3,4],27960);r=runtime();h=host()
 c=c+req(connectionless.dispatch(r,h,a,wire("getstatus abc"))=="getstatus" and h.context.events==["status:abc"],"status dispatch")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("GETINFO xyz"))=="getinfo" and h.context.events==["info:xyz"],"info casefold")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("getchallenge"))=="getchallenge" and len(r.context)==1,"challenge binding")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("connect \\protocol\\68\\qport\\9"))=="connect" and r.clients[0].state==oob.CS_CONNECTED,"connect binding")
 c=c+req(h.context.events==["decompress:12"],"connect decompression boundary")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("rcon pw status"))=="rcon" and h.context.events==["rcon:status"],"rcon dispatch")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("ipAuthorize x"))=="ipAuthorize" and h.context.events==["auth"],"authorize boundary")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("disconnect"))=="disconnect" and h.context.events==[],"disconnect ignored")
 h.context.events=[];c=c+req(connectionless.dispatch(r,h,a,wire("wat x"))=="unknown" and h.context.events==["bad:wat x"],"unknown diagnostic")
 c=c+req(connectionless.tokens(" a  b ")==["a","b"],"token spacing")
 c=c+req(connectionless.connectPrefix(wire("connect x")),"connect prefix")
 c=c+req(not connectionless.connectPrefix(wire("Connect x")),"prefix is case sensitive")
 bad=message.initOob(32);message.writeLong(bad,0);message.writeString(bad,"getinfo");c=c+req(try(connectionless.dispatch(r,h,a,bad)) is error,"marker rejected")
 c=c+req(try(connectionless.dispatch(void,h,a,wire("x"))) is error,"runtime required")
 c=c+req(try(connectionless.dispatch(r,void,a,wire("x"))) is error,"host required")
 c=c+req(try(connectionless.dispatch(r,h,void,wire("x"))) is error,"address required")
 c=c+req(try(connectionless.dispatch(r,h,a,void)) is error,"message required")
 c=c+req(connectionless.dispatch(r,h,a,wire(""))=="unknown","empty command")
 print "PASS: "+str(c)+" connectionless contracts";return 0
end function
