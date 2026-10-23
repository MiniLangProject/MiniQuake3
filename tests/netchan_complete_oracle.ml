// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.netchan as net
import mq3.qcommon.net_transport as transport
function flag(value) if value then return 1 end if;return 0 end function
function hex(data) digits=bytes("0123456789abcdef");result="";for each value in data result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for;return result end function
function adr(kind,data,port) return net.Address(kind,data,port) end function
function resolver(context,name) if name=="ok" then return adr(transport.NA_IP,[1,2,3,4],0) end if;if name=="broadcast" then return adr(transport.NA_IP,[255,255,255,255],0) end if;return void end function
function parsed(text) value=transport.stringToAddressWith(text,resolver,void);a=value.address;print "P|"+text+"|"+str(flag(value.ok))+"|"+str(a.type)+"|"+str(a.ip[0])+"."+str(a.ip[1])+"."+str(a.ip[2])+"."+str(a.ip[3])+"|"+str(a.port);return void end function
function main(args)
  a=adr(transport.NA_IP,[1,2,3,4],27960);b=adr(transport.NA_IP,[1,2,3,4],27961);c=adr(transport.NA_IP,[1,2,3,5],27960);l=adr(transport.NA_LOOPBACK,[9,9,9,9],3);x=adr(transport.NA_IPX,[0,1,2,3,4,5,6,7,8,9],7);y=adr(transport.NA_IPX,[0,1,2,3,4,5,6,7,8,9],7)
  print "A|"+str(flag(transport.compareBaseAddress(a,b)))+"|"+str(flag(transport.compareAddress(a,b)))+"|"+str(flag(transport.compareBaseAddress(a,c)))+"|"+str(flag(transport.compareAddress(l,adr(transport.NA_LOOPBACK,[0,0,0,0],9))))+"|"+str(flag(transport.compareBaseAddress(x,y)))+"|"+str(flag(transport.compareAddress(x,y)))+"|"+transport.addressToString(a)+"|"+transport.addressToString(l)+"|"+str(flag(transport.isLocalAddress(l)))
  print "X|"+transport.addressToString(x)
  print "F|"+transport.addressToString(adr(transport.NA_BAD,[0,0,0,0],0))+"|"+transport.addressToString(adr(transport.NA_BROADCAST,[255,255,255,255],27960))
  loops=transport.createLoopbacks();empty=transport.getLoopPacket(loops,net.NS_SERVER,64);print "L|empty="+str(flag(empty.received));transport.sendLoopPacket(loops,net.NS_CLIENT,bytes([1,2,3,4]));one=transport.getLoopPacket(loops,net.NS_SERVER,64);print "L|one="+str(flag(one.received))+","+str(len(one.data))+","+str(one.data[0])+","+str(one.data[3])+","+str(one.address.type)
  loops=transport.createLoopbacks();for i=0 to 19 transport.sendLoopPacket(loops,net.NS_CLIENT,bytes([i])) end for;text="L|wrap=";while true packet=transport.getLoopPacket(loops,net.NS_SERVER,64);if not packet.received then break end if;text=text+str(packet.data[0])+"," end while;print text
  loops=transport.createLoopbacks();runtime=transport.attachLoopback(net.init(0),loops);channel=net.setup(net.NS_CLIENT,adr(transport.NA_LOOPBACK,[0,0,0,0],0),0);net.transmit(runtime,channel,bytes([9,8,7,6]));loopCount=loops.queues[net.NS_SERVER].send;discardBot=transport.sendPacket(runtime,net.NS_CLIENT,bytes([9,8,7,6]),adr(transport.NA_BOT,[0,0,0,0],0));discardBad=transport.sendPacket(runtime,net.NS_CLIENT,bytes([9,8,7,6]),adr(transport.NA_BAD,[0,0,0,0],0));print "S|"+str(loopCount)+"|1|4|9"
  oob=transport.outOfBandPrintPacket("hello 7");print "O|"+str(len(oob))+"|"+hex(slice(oob,0,4))+"|"+decode(slice(oob,4,len(oob)-4))
  parsed("localhost");parsed("ok");parsed("ok:1234");parsed("bad");parsed("broadcast")
  data=bytes(32,0);for i=0 to 31 data[i]=(i*17+3)&255 end for;scrambled=net.scramblePacket(data);restored=net.unscramblePacket(scrambled);print "C|"+hex(scrambled)+"|"+hex(restored)+"|"+str(flag(restored==data));return 0
end function
