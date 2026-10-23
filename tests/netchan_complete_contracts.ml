// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.netchan as net
import mq3.qcommon.net_transport as transport
function req(value,label) if not value then return error(499,"netchan complete: "+label) end if;return 1 end function
function resolver(context,name) if name=="arena" then return net.Address(transport.NA_IP,[127,0,0,1],0) end if;return void end function
function main(args)
  count=0;ip=net.Address(transport.NA_IP,[127,0,0,1],27960);same=net.Address(transport.NA_IP,[127,0,0,1],27961)
  count=count+req(transport.compareBaseAddress(ip,same) and not transport.compareAddress(ip,same),"base/full address")
  count=count+req(transport.addressToString(ip)=="127.0.0.1:27960","IPv4 text")
  count=count+req(transport.isLocalAddress(net.Address(transport.NA_LOOPBACK,[0,0,0,0],0)),"local address")
  result=transport.stringToAddressWith("arena:27961",resolver,void);count=count+req(result.ok and result.address.ip==[127,0,0,1] and result.address.port==27961,"string resolve")
  count=count+req(not transport.stringToAddressWith("missing",resolver,void).ok,"failed resolve")
  loops=transport.createLoopbacks();runtime=transport.attachLoopback(net.init(9),loops)
  outgoing=net.setup(net.NS_CLIENT,net.Address(transport.NA_LOOPBACK,[0,0,0,0],0),0);wire=net.transmit(runtime,outgoing,bytes([4,3,2,1]));incoming=transport.getLoopPacket(loops,net.NS_SERVER,64)
  count=count+req(incoming.received and incoming.address.type==transport.NA_LOOPBACK and incoming.data==wire,"productive send loop packet")
  channel=net.setup(net.NS_SERVER,incoming.address,0);processed=net.process(channel,incoming.data,64);count=count+req(processed.accepted and slice(processed.data,processed.readcount,processed.cursize-processed.readcount)==bytes([4,3,2,1]),"productive loop process")
  loops=transport.createLoopbacks();runtime=transport.attachLoopback(net.init(32123),loops);outgoing=net.setup(net.NS_CLIENT,net.Address(transport.NA_LOOPBACK,[0,0,0,0],0),0);large=bytes(1301,0);for i=0 to 1300 large[i]=(i*37+11)&255 end for
  net.transmit(runtime,outgoing,large);firstFragment=transport.getLoopPacket(loops,net.NS_SERVER,1400);receiver=net.setup(net.NS_SERVER,firstFragment.address,0);partial=net.process(receiver,firstFragment.data,net.MAX_MSGLEN);count=count+req(not partial.accepted and receiver.fragmentLength==net.FRAGMENT_SIZE and receiver.incomingSequence==0,"productive first fragment")
  net.transmitNextFragment(runtime,outgoing);lastFragment=transport.getLoopPacket(loops,net.NS_SERVER,1400);whole=net.process(receiver,lastFragment.data,net.MAX_MSGLEN);count=count+req(whole.accepted and whole.readcount==4 and slice(whole.data,4,1301)==large and receiver.incomingSequence==1,"productive fragment reassembly")
  duplicate=net.process(receiver,lastFragment.data,net.MAX_MSGLEN);count=count+req(not duplicate.accepted and receiver.incomingSequence==1,"productive fragment duplicate rejection")
  for index=0 to 19 transport.sendLoopPacket(loops,net.NS_CLIENT,bytes([index])) end for;first=transport.getLoopPacket(loops,net.NS_SERVER,64);count=count+req(first.data[0]==4,"loop ring drops oldest")
  count=count+req(try(transport.sendLoopPacket(loops,net.NS_CLIENT,bytes(1401,0))) is error,"loop packet bound")
  count=count+req(try(transport.getLoopPacket(loops,net.NS_SERVER,0)) is error,"loop receive bound")
  short=bytes([1,2,3,4,5,6]);count=count+req(net.scramblePacket(short)==short and net.unscramblePacket(short)==short,"short scramble identity")
  data=bytes(1400,0);for i=0 to 1399 data[i]=(i*29+7)&255 end for;count=count+req(net.unscramblePacket(net.scramblePacket(data))==data,"max scramble roundtrip")
  count=count+req(try(net.scramblePacket(bytes(1401,0))) is error,"scramble bound")
  print "PASS: "+str(count)+" complete net_chan contracts";return 0
end function
