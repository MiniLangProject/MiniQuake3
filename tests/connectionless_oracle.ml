import mq3.server.connectionless as connectionless
import mq3.server.oob_connect as oob
import mq3.qcommon.message as message
struct Context text end struct
function add(h,t) h.context.text=h.context.text+t end function
function status(h,a,x) add(h,"status") end function
function info(h,a,x) add(h,"info") end function
function rcon(h,a,m,t,x) add(h,"rcon") end function
function auth(h,a,x) add(h,"authorize") end function
function dec(h,m,o) add(h,"decompress:"+str(o)+",") end function
function diag(h,a,t) return void end function
function challenge(r,a) add(r,"challenge") end function
function local(r,a) return true end function
function random(r) return 3 end function
function send(r,a,t) if t=="connectResponse" then r.context.text=r.context.text+"connect" else r.context.text=r.context.text+"challenge" end if end function
function wire(t) m=message.initOob(512);message.writeLong(m,-1);message.writeString(m,t);return m end function
function run(t)
 r=oob.create(2,oob.config());r.localFn=local;r.lanFn=local;r.randFn=random;r.sendFn=send;r.context=Context("");h=connectionless.services();h.context=r.context;h.statusFn=status;h.infoFn=info;h.rconFn=rcon;h.authorizeFn=auth;h.decompressFn=dec;h.diagnosticFn=diag;a=oob.address(4,[1,2,3,4],1)
 connectionless.dispatch(r,h,a,wire(t));print t+"|"+h.context.text
end function
function main(args) run("getstatus x");run("GETINFO x");run("getchallenge");run("connect \\protocol\\68");run("ipAuthorize x");run("rcon p status");run("disconnect");run("unknown");return 0 end function
