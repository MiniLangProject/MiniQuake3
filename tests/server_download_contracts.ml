import mq3.qcommon.message as message
import mq3.server.download as d
import mq3.server.client_command_dispatch as dispatch
struct C data pos drops closes id denied end struct
struct SendContext gamestates client end struct
function idpak(h,n,g) return h.context.id end function
function open(h,n) if h.context.denied then return void end if;return [9,len(h.context.data)] end function
function read(h,x,count) left=len(h.context.data)-h.context.pos;if left>count then left=count end if;r=bytes(left,1);h.context.pos=h.context.pos+left;return r end function
function hostClose(h,x) h.context.closes=h.context.closes+1 end function
function hostDrop(h,s,t) h.context.drops=h.context.drops+1 end function
function host(data) return d.services(idpak,open,read,hostClose,hostDrop,C(data,0,0,0,false,false)) end function
function sendGamestate(runtime,client) runtime.context.gamestates=runtime.context.gamestates+1;runtime.context.client=client;return void end function
function fallback(h,c,name,p) return void end function
function req(v,t) if not v then return error(499,"download: "+t) end if;return 1 end function
function main(args)
 n=0;s=d.create("x.pk3",0,50);h=host(bytes(3,1));m=message.init(200);sv=d.server(100,true,false,0);d.writeToClient(s,sv,h,m)
 n=n+req(s.count==3 and s.currentBlock==2 and s.xmitBlock==1 and s.eof,"data and eof queued")
 n=n+req(s.blockSizes[0]==3 and s.blockSizes[1]==0,"block sizes")
 n=n+req(d.acknowledge(s,sv,h,0) and s.clientBlock==1,"data ack")
 n=n+req(d.acknowledge(s,sv,h,1) and s.name=="" and s.handle==void and h.context.closes==1,"eof ack closes")
 n=n+req(d.writeToClient(s,sv,h,message.init(20))==0,"idle download")
 s=d.create("x",0,50);h=host(bytes(17000,1));m=message.init(5000);d.writeToClient(s,sv,h,m);n=n+req(s.currentBlock==8 and s.count==16384 and not s.eof,"window cap")
 n=n+req(s.xmitBlock==1,"zero rate one block")
 s.xmitBlock=s.currentBlock;sv.time=500;n=n+req(d.writeToClient(s,sv,h,message.init(5000))==0,"early resend held")
 sv.time=1201;n=n+req(d.writeToClient(s,sv,h,message.init(5000))==1 and s.xmitBlock==1,"timeout resend")
 n=n+req(not d.acknowledge(s,sv,h,5) and h.context.drops==1,"bad ack drops")
 n=n+req(d.blockCount(d.create("",0,50),0)==1,"zero rate")
 n=n+req(d.blockCount(d.create("",250000,100),0)==13,"rate block count")
 n=n+req(d.blockCount(d.create("",250000,100),500)==1,"minimum max rate")
 s=d.create("budget",0,50);h=host(bytes(2048,1));s.handle=1;s.size=2048;m=message.init(1024);d.writeToClient(s,sv,h,m);n=n+req(m.overflowed and s.xmitBlock==1,"message budget overflow state")
 s=d.create("missing",0,50);h=host(bytes(0,0));h.context.denied=true;m=message.init(2048);d.writeToClient(s,d.server(0,true,false,0),h,m);n=n+req(s.name=="" and m.cursize>0,"missing rejection packet")
 s=d.create("pak0.pk3",0,50);h=host(bytes(3,1));h.context.id=true;m=message.init(2048);d.writeToClient(s,d.server(0,true,false,0),h,m);n=n+req(s.name=="" and m.cursize>0,"id pak rejected")
 s=d.create("x",0,50);h=host(bytes(3,1));m=message.init(2048);d.writeToClient(s,d.server(0,false,true,0),h,m);n=n+req(s.name=="","disabled pure rejected")
 s=d.create("x",0,50);n=n+req(try(d.writeToClient(s,sv,void,message.init(20))) is error,"filesystem service required")
 s=d.create("x",0,50);s.handle=1;s.size=0;s.blockSizes[0]=0;h=host([]);n=n+req(d.acknowledge(s,sv,h,0) and h.context.closes==1,"empty eof close")
 // Exercise the actual reliable-command dispatch boundary used by client_input.
 s=d.create("old.pk3",0,50);s.handle=7;s.blocks[0]=bytes([1]);s.blockSizes[0]=1;h=host(bytes([1,2,3]));sv=d.server(321,true,false,0);client=C([],0,0,0,false,false)
 sent=SendContext(0,void);runtime=d.commandRuntime(s,sv,h,sendGamestate,sent);dh=dispatch.services();dh.context=C([],0,0,0,false,false);dh.downloadContext=runtime;dh.downloadFn=d.dispatchCommand;dh.builtinFn=fallback
 n=n+req(dispatch.execute(dh,client,"download maps/new.pk3",true,dispatch.SS_GAME)=="builtin","begin routed as builtin")
 n=n+req(s.name=="maps/new.pk3" and s.handle==void and h.context.closes==1 and s.blockSizes[0]==0,"begin closes and replaces active transfer")
 longName="";i=0;while i<80 longName=longName+"x";i=i+1 end while;dispatch.execute(dh,client,"download "+longName,true,dispatch.SS_GAME);n=n+req(len(bytes(s.name))==63,"begin applies MAX_QPATH copy")
 s.handle=8;s.blockSizes[0]=3;s.clientBlock=0;dispatch.execute(dh,client,"nextdl 0",true,dispatch.SS_GAME);n=n+req(s.clientBlock==1 and s.sendTime==321,"nextdl acknowledges live transfer")
 dispatch.execute(dh,client,"nextdl 9",true,dispatch.SS_GAME);n=n+req(h.context.drops==1,"bad nextdl drops client")
 dispatch.execute(dh,client,"stopdl",true,dispatch.SS_GAME);n=n+req(s.name=="" and s.handle==void and h.context.closes==2,"stopdl closes transfer")
 n=n+req(dispatch.execute(dh,client,"donedl",true,dispatch.SS_GAME)=="builtin" and sent.gamestates==1 and sent.client==client,"donedl resends gamestate")
 dh=dispatch.services();dh.downloadContext=void;dh.downloadFn=d.dispatchCommand;n=n+req(try(dispatch.execute(dh,client,"download x",true,dispatch.SS_GAME)) is error,"missing command binding rejected")
 print "PASS: "+str(n)+" server-download contracts";return 0
end function
