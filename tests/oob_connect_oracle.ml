import mq3.server.oob_connect as oob
struct C events seed lan local heart drops end struct
function rnd(h) h.context.seed=(h.context.seed*214013+2531011)&0xffffffff;return (h.context.seed>>16)&0x7fff end function
function lan(h,a) return h.context.lan end function
function local(h,a) return h.context.local end function
function send(h,a,t) h.context.events=h.context.events+t+";" end function
function auth(h,c,a) h.context.events=h.context.events+"getIpAuthorize "+str(c)+" 10.0.0.1 baseq3 0 ;" end function
function heart(h) h.context.heart=h.context.heart+1 end function
function drop(h,c,t) c.state=0;h.context.drops=h.context.drops+1 end function
function setup() r=oob.create(2,oob.config());r.time=1000;r.context=C("",1,false,false,0,0);r.randFn=rnd;r.lanFn=lan;r.localFn=local;r.sendFn=send;r.authorizeFn=auth;r.heartbeatFn=heart;r.dropFn=drop;return r end function
function a() return oob.address(4,[10,0,0,1],27960) end function
function ui(ch,q,p) return "\\protocol\\68\\challenge\\"+str(ch)+"\\qport\\"+str(q)+"\\password\\"+p end function
function main(args)
 r=setup();r.context.lan=true;c=oob.getChallenge(r,a());print "lan|"+str(c.challenge)+"|"+str(c.firstTime)+"|"+str(c.pingTime)+"|"+r.context.events;r.context.events="";r.time=1100;oob.getChallenge(r,a());print "reuse|"+str(c.challenge)+"|"+str(c.time)+"|"+r.context.events
 r=setup();c=oob.getChallenge(r,a());print "authorize|"+str(c.challenge)+"|"+str(c.pingTime)+"|"+r.context.events;c.firstTime=0;r.time=5001;r.context.events="";oob.getChallenge(r,a());print "timeout|"+str(c.pingTime)+"|"+r.context.events
 r=setup();oob.directConnect(r,a(),"\\protocol\\67");print "protocol|"+str(r.clients[0].state)+"|"+r.context.events
 r=setup();oob.directConnect(r,a(),ui(7,1234,""));print "bad|"+str(r.clients[0].state)+"|"+r.context.events
 r=setup();c=r.challenges[3];c.address=a();c.challenge=7;c.pingTime=900;oob.directConnect(r,a(),ui(7,1234,""));print "connect|"+str(r.clients[0].state)+"|"+str(r.clients[0].qport)+"|"+str(r.clients[0].challenge)+"|"+str(r.clients[0].lastConnectTime)+"|"+str(r.context.heart)+"|"+r.context.events;r.context.events="";oob.directConnect(r,a(),ui(7,1234,""));print "reconnect|"+str(r.clients[0].state)+"|"+r.context.events
 r=setup();r.context.local=true;r.config.privateClients=1;r.config.privatePassword="secret";oob.directConnect(r,a(),ui(0,2,"bad"));print "private|"+str(r.clients[0].state)+"|"+str(r.clients[1].state)+"|"+r.context.events
 return 0
end function
