import mq3.client.download as download
import mq3.qcommon.message as message
struct Context events end struct
function add(h,e) if h.context.events!="" then h.context.events=h.context.events+"," end if;h.context.events=h.context.events+e end function
function cv(h,n,v) add(h,"cv:"+n+"="+str(v)) end function
function cs(h,n,v) add(h,"cs:"+n+"="+v) end function
function cmd(h,v) add(h,"cmd:"+v) end function
function open(h,n) add(h,"open:"+n);return 7 end function
function write(h,d,n,f) add(h,"write:"+str(n)+":"+str(f)+":"+str(d[0])) end function
function close(h,f) add(h,"close:"+str(f)) end function
function rename(h,a,b) add(h,"rename:"+a+":"+b) end function
function packet(h) add(h,"packet") end function
function next(h) add(h,"next") end function
function output(h,a,b) if a=="unrequested" then add(h,"print:unrequested") else add(h,"print:create:"+b) end if end function
function host() h=download.services();h.context=Context("");h.cvarValueFn=cv;h.cvarStringFn=cs;h.reliableFn=cmd;h.openFn=open;h.writeFn=write;h.closeFn=close;h.renameFn=rename;h.packetFn=packet;h.nextFn=next;h.printFn=output;return h end function
function wire(block,total,data) m=message.init(128);message.writeShort(m,block);if block==0 then message.writeLong(m,total) end if;message.writeShort(m,len(data));message.writeData(m,data);message.beginReading(m);return m end function
function emit(name,s,h) print name+"|"+str(s.downloadSize)+","+str(s.downloadBlock)+","+str(s.download)+","+str(s.downloadCount)+","+s.downloadTempName+","+s.downloadName+"|"+h.context.events end function
function main(args)
 s=download.create();s.downloadTempName="tmp";s.downloadName="final";h=host();download.parseDownload(s,h,wire(0,3,bytes([9,0,0])));emit("block",s,h)
 s=download.create();s.downloadSize=3;s.downloadBlock=1;s.download=7;s.downloadCount=3;s.downloadTempName="tmp";s.downloadName="final";h=host();download.parseDownload(s,h,wire(1,0,bytes(0)));emit("eof",s,h)
 s=download.create();s.downloadBlock=2;h=host();download.parseDownload(s,h,wire(1,0,bytes([4])));emit("wrong",s,h)
 s=download.create();h=host();download.parseDownload(s,h,wire(0,1,bytes([2])));emit("unrequested",s,h);return 0
end function
