import mq3.qcommon.message as message
import mq3.server.download as download
struct Context data pos dropped closed end struct
function noId(h,n,g) return false end function
function opened(h,n) return [1,len(h.context.data)] end function
function readChunk(h,handle,count) left=len(h.context.data)-h.context.pos;if left<0 then return void end if;if left>count then left=count end if;r=bytes(left,0);if left>0 then for i=0 to left-1 r[i]=h.context.data[h.context.pos+i] end for end if;h.context.pos=h.context.pos+left;return r end function
function closed(h,handle) h.context.closed=h.context.closed+1 end function
function dropped(h,state,text) h.context.dropped=h.context.dropped+1 end function
function setup(size,rate,snap) data=bytes(size,0);if size>0 then for i=0 to size-1 data[i]=(i*37+11)&255 end for end if;x=Context(data,0,0,0);h=download.services(noId,opened,readChunk,closed,dropped,x);d=download.create("maps/test.pk3",rate,snap);d.handle=1;d.size=size;return [d,download.server(1000,true,false,0),h] end function
function encodeHex(data,count) digits=bytes("0123456789abcdef");t="";if count>0 then for i=0 to count-1 v=data[i];t=t+decode(bytes([digits[(v>>4)&15],digits[v&15]])) end for end if;return t end function
function flag(v) if v then return "1" end if;return "0" end function
function emit(name,a) m=message.init(10000);download.writeToClient(a[0],a[1],a[2],m);d=a[0];print name+"|"+str(m.cursize)+"|"+str(m.bit)+"|"+flag(m.overflowed)+"|"+str(d.count)+"|"+str(d.clientBlock)+"|"+str(d.currentBlock)+"|"+str(d.xmitBlock)+"|"+flag(d.eof)+"|"+encodeHex(m.data,m.cursize) end function
function ack(name,a,block) download.acknowledge(a[0],a[1],a[2],block);d=a[0];first=0;if d.name!="" then first=bytes(d.name)[0] end if;print name+"|"+str(d.clientBlock)+"|"+str(d.sendTime)+"|"+str(first)+"|"+str(a[2].context.closed)+"|"+str(a[2].context.dropped) end function
struct DoneContext count end struct
function sent(runtime,client) runtime.context.count=runtime.context.count+1;return void end function
function main(args)
 a=setup(3,0,50);emit("small0",a);ack("ack0",a,0);emit("small-eof",a);ack("ack-eof",a,1)
 a=setup(5000,250000,100);emit("rate",a)
 a=setup(17000,0,50);emit("window0",a);ack("window-ack",a,0);emit("window1",a)
 a=setup(3,0,50);emit("first",a);a[1].time=1500;emit("early",a);a[1].time=2501;emit("resend",a);ack("bad-ack",a,3)
 a=setup(3,0,50);download.beginDownload(a[0],a[2],"maps/new.pk3");print "begin|"+a[0].name+"|0|"+str(a[2].context.closed);download.stopDownload(a[0],a[2]);print "stop|0|0|"+str(a[2].context.closed);ctx=DoneContext(0);runtime=download.commandRuntime(a[0],a[1],a[2],sent,ctx);download.doneDownload(runtime,void);print "done|"+str(ctx.count)
 return 0
end function
