import mq3.client.demo as demo
function hx(data) digits=bytes("0123456789abcdef");t="";for each v in data t=t+decode(bytes([digits[(v>>4)&15],digits[v&15]])) end for;return t end function
function flag(v) if v then return "1" end if;return "0" end function
function readcase(name,data) s=demo.playback();p=demo.readDemoMessage(s,data,777);size=0;text="";if p!=void then size=len(p);text=hx(p) end if;print "R|"+name+"|"+str(s.serverMessageSequence)+"|"+str(s.lastPacketTime)+"|"+str(s.offset)+"|"+flag(s.completed)+"|"+str(size)+"|"+text end function
function main(args)
 packet=bytes(10,0);for i=0 to 9 packet[i]=i+1 end for;w=demo.encodeMessage(0x12345678,packet,4);print "W|"+str(len(w))+"|"+hx(w)
 for each n in [0,42,9999,-1,10000] print "F|"+str(n)+"|"+demo.demoFilename(n) end for
 normal=demo.encodeMessage(7,bytes([9,8,7]),0);readcase("normal",normal);endRecord=demo.encodeEnd();readcase("end",endRecord);readcase("short-seq",bytes([7,0,0]));readcase("short-len",bytes([7,0,0,0,3,0]));readcase("short-data",bytes([7,0,0,0,3,0,0,0,9,8]))
 print "R|nofile|1";return 0
end function
