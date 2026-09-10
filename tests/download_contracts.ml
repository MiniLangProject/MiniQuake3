import mq3.client.download as download
import mq3.qcommon.message as message
struct Context events openResult end struct
function req(v,s) if not v then return error(499,"download: "+s) end if;return 1 end function
function cval(h,n,v) h.context.events=h.context.events+["cv:"+n+"="+str(v)] end function
function cstr(h,n,v) h.context.events=h.context.events+["cs:"+n+"="+v] end function
function reliable(h,v) h.context.events=h.context.events+["cmd:"+v] end function
function open(h,n) h.context.events=h.context.events+["open:"+n];return h.context.openResult end function
function write(h,d,n,f) h.context.events=h.context.events+["write:"+str(n)+":"+str(f)+":"+str(d[0])] end function
function close(h,f) h.context.events=h.context.events+["close:"+str(f)] end function
function rename(h,a,b) h.context.events=h.context.events+["rename:"+a+":"+b] end function
function packet(h) h.context.events=h.context.events+["packet"] end function
function next(h) h.context.events=h.context.events+["next"] end function
function output(h,a,b) h.context.events=h.context.events+["print:"+a+":"+b] end function
function host(result) h=download.services();h.context=Context([],result);h.cvarValueFn=cval;h.cvarStringFn=cstr;h.reliableFn=reliable;h.openFn=open;h.writeFn=write;h.closeFn=close;h.renameFn=rename;h.packetFn=packet;h.nextFn=next;h.printFn=output;return h end function
function wire(block,total,data) m=message.init(1024);message.writeShort(m,block);if block==0 then message.writeLong(m,total) end if;message.writeShort(m,len(data));message.writeData(m,data);message.beginReading(m);return m end function
function main(args)
 c=0;s=download.create();s.downloadTempName="tmp";s.downloadName="final";h=host(7);m=wire(0,3,bytes([9,8,7]));c=c+req(download.parseDownload(s,h,m),"block accepted")
 c=c+req(s.downloadSize==3 and s.downloadBlock==1 and s.downloadCount==3 and s.download==7,"block state")
 c=c+req(h.context.events==["cv:cl_downloadSize=3","open:tmp","write:3:7:9","cmd:nextdl 0","cv:cl_downloadCount=3"],"block host order")
 h.context.events=[];m=wire(1,0,bytes(0));c=c+req(download.parseDownload(s,h,m),"eof accepted")
 c=c+req(s.download==0 and s.downloadBlock==2 and s.downloadTempName=="" and s.downloadName=="","eof state")
 c=c+req(h.context.events==["cmd:nextdl 1","cv:cl_downloadCount=3","close:7","rename:tmp:final","cs:cl_downloadName=","packet","packet","next"],"eof host order")
 s=download.create();s.downloadBlock=2;h=host(7);m=wire(1,0,bytes([1]));c=c+req(not download.parseDownload(s,h,m) and h.context.events==[],"out of order ignored")
 s=download.create();h=host(7);m=wire(0,1,bytes([1]));c=c+req(not download.parseDownload(s,h,m),"unrequested rejected")
 c=c+req(h.context.events==["cv:cl_downloadSize=1","print:unrequested:","cmd:stopdl"],"unrequested stop")
 s=download.create();s.downloadTempName="tmp";h=host(0);m=wire(0,1,bytes([1]));c=c+req(not download.parseDownload(s,h,m),"open failure")
 c=c+req(h.context.events==["cv:cl_downloadSize=1","open:tmp","print:create:tmp","cmd:stopdl","next"],"open failure recovery")
 m=message.init(128);message.writeShort(m,0);message.writeLong(m,-1);message.writeString(m,"denied");message.beginReading(m);c=c+req(try(download.parseDownload(download.create(),host(1),m)) is error,"server error propagated")
 c=c+req(try(download.parseDownload(void,host(1),m)) is error,"missing state")
 c=c+req(try(download.parseDownload(download.create(),void,m)) is error,"missing host")
 c=c+req(try(download.parseDownload(download.create(),host(1),message.init(8))) is error,"truncated block")
 m=message.init(32);message.writeShort(m,0);message.writeLong(m,1);message.beginReading(m);c=c+req(try(download.parseDownload(download.create(),host(1),m)) is error,"truncated size")
 m=message.init(32);message.writeShort(m,0);message.writeLong(m,1);message.writeShort(m,-1);message.beginReading(m);c=c+req(try(download.parseDownload(download.create(),host(1),m)) is error,"negative block size")
 s=download.create();s.downloadTempName="tmp";h=host(1);h.writeFn=void;m=wire(0,1,bytes([1]));c=c+req(try(download.parseDownload(s,h,m)) is error,"write host required")
 s=download.create();s.downloadTempName="tmp";h=host(1);h.openFn=void;m=wire(0,0,bytes([1]));c=c+req(try(download.parseDownload(s,h,m)) is error,"open host required")
 c=c+req(download.MAX_MSGLEN==16384,"message size constant")
 print "PASS: "+str(c)+" download contracts";return 0
end function
