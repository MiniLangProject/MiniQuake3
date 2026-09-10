import mq3.server.oob_connect as oob
struct C events random lan local heart drops deny end struct
function rnd(h) v=h.context.random;h.context.random=v+1;return v end function
function lan(h,a) return h.context.lan end function
function local(h,a) return h.context.local end function
function sent(h,a,t) h.context.events=h.context.events+[t] end function
function auth(h,c,a) h.context.events=h.context.events+["auth:"+str(c)] end function
function game(h,s,u) return h.context.deny end function
function drop(h,c,r) h.context.drops=h.context.drops+1 end function
function heart(h) h.context.heart=h.context.heart+1 end function
function runtime(count) r=oob.create(count,oob.config());r.context=C([],10,false,false,0,0,void);r.randFn=rnd;r.lanFn=lan;r.localFn=local;r.sendFn=sent;r.authorizeFn=auth;r.gameConnectFn=game;r.dropFn=drop;r.heartbeatFn=heart;return r end function
function adr(n,p) return oob.address(2,[10,0,0,n],p) end function
function ui(ch,q,pw) return "\\protocol\\68\\challenge\\"+str(ch)+"\\qport\\"+str(q)+"\\password\\"+pw end function
function req(v,t) if not v then return error(499,"oob: "+t) end if;return 1 end function
function main(args)
 n=0;r=runtime(2);n=n+req(r.challenges[0]!=r.challenges[1] and r.clients[0]!=r.clients[1],"isolated rings");r.time=100;a=adr(1,27960);c=oob.getChallenge(r,a)
 n=n+req(c.challenge==((10<<16)^11^100) and c.firstTime==100,"new challenge random")
 n=n+req(len(r.context.events)==1 and r.context.events[0]=="auth:"+str(c.challenge),"authorize boundary")
 again=oob.getChallenge(r,a);n=n+req(again==c and r.context.random==12,"challenge reuse")
 r.context.lan=true;r.time=200;oob.getChallenge(r,a);n=n+req(c.pingTime==200 and r.context.events[len(r.context.events)-1]=="challengeResponse "+str(c.challenge),"lan immediate")
 r.context.lan=false;c.firstTime=0;r.time=5001;oob.getChallenge(r,a);n=n+req(c.pingTime==5001,"authorize timeout")
 r.config.singlePlayer=true;n=n+req(oob.getChallenge(r,adr(2,1))==void,"single player ignored")
 r=runtime(2);r.time=1000;a=adr(1,27960);c=r.challenges[4];c.address=a;c.challenge=77;c.pingTime=900
 got=oob.directConnect(r,a,ui(77,1234,""));n=n+req(got.accepted and got.slot==0 and r.clients[0].state==2,"valid connect")
 n=n+req(r.clients[0].challenge==77 and r.clients[0].qport==1234 and r.clients[0].gamestateMessageNum==-1,"connected fields")
 n=n+req(r.context.heart==1 and r.context.events[len(r.context.events)-1]=="connectResponse","first heartbeat")
 n=n+req(not oob.directConnect(r,a,ui(77,1234,"")).accepted,"reconnect limited")
 r.time=5000;got=oob.directConnect(r,a,ui(77,1234,""));n=n+req(got.accepted and got.slot==0,"slot reuse")
 n=n+req(not oob.directConnect(r,a,"\\protocol\\67").accepted,"protocol reject")
 r=runtime(1);n=n+req(not oob.directConnect(r,adr(2,1),ui(1,2,"")).accepted,"missing challenge")
 r=runtime(1);r.context.local=true;got=oob.directConnect(r,adr(2,1),ui(0,2,""));n=n+req(got.accepted and oob.sameBase(r.clients[0].address,adr(2,9)),"local skips challenge")
 n=n+req(r.clients[0].userinfo!="" and got.userinfo!="","local userinfo")
 r=runtime(2);r.config.privateClients=1;r.config.privatePassword="secret";r.context.local=true;got=oob.directConnect(r,a,ui(0,1,"bad"));n=n+req(got.slot==1,"private slot skipped")
 r=runtime(2);r.config.privateClients=1;r.config.privatePassword="secret";r.context.local=true;got=oob.directConnect(r,a,ui(0,1,"secret"));n=n+req(got.slot==0,"private password")
 r=runtime(1);r.context.local=true;r.clients[0].state=2;r.clients[0].bot=true;got=oob.directConnect(r,a,ui(0,1,""));n=n+req(got.accepted and r.context.drops==1,"local replaces all-bot server")
 r=runtime(1);r.clients[0].state=2;n=n+req(oob.directConnect(r,a,ui(0,1,"")).reason=="challenge","remote validates challenge before full")
 r=runtime(1);r.context.local=true;r.context.deny="banned";got=oob.directConnect(r,a,ui(0,1,""));n=n+req(not got.accepted and got.reason=="game","game reject boundary")
 r=runtime(1);r.time=1000;c=r.challenges[0];c.address=a;c.challenge=4;c.pingTime=990;r.config.minPing=20;got=oob.directConnect(r,a,ui(4,1,""));n=n+req(got.reason=="minping" and c.address.port==0,"min ping clears port")
 r=runtime(1);r.time=1000;c=r.challenges[0];c.address=a;c.challenge=4;c.pingTime=0;r.config.maxPing=500;got=oob.directConnect(r,a,ui(4,1,""));n=n+req(got.reason=="maxping" and c.connected,"max ping")
 r=runtime(1);r.time=1000;r.context.lan=true;c=r.challenges[0];c.address=a;c.challenge=4;c.pingTime=0;r.config.maxPing=5;got=oob.directConnect(r,a,ui(4,1,""));n=n+req(got.accepted,"lan ping bypass")
 n=n+req(oob.atoi("-12x")==-12 and oob.atoi("")==0,"atoi prefix")
 n=n+req(try(oob.create(0,oob.config())) is error,"maxclient bound")
 print "PASS: "+str(n)+" OOB-connect contracts";return 0
end function
