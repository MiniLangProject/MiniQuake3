// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.udp as udp
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as netchan
import mq3.qcommon.huffman as huffman

function req(value,label) if not value then return error(499,"net transport: "+label) end if;return 1 end function
function equal(a,b) if len(a)!=len(b) then return false end if;if len(a)>0 then for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for end if;return true end function
function wait(socket)
  for attempt=0 to 9999 packet=transport.receive(socket,65535);if packet.received then return packet end if end for
  return error(499,"net transport: localhost timeout")
end function
function main(args)
  count=0;udp.startup();a=udp.open();b=udp.open();loopback=udp.ipv4(127,0,0,1)
  ae=udp.bind(a,udp.Endpoint(loopback,0));be=udp.bind(b,udp.Endpoint(loopback,0))
  qa=transport.endpointToAddress(ae);qb=transport.endpointToAddress(be)
  count=count+req(qa.type==transport.NA_IP and qa.ip==[127,0,0,1] and qa.port==ae.port,"endpoint to address")
  round=transport.addressToEndpoint(qb);count=count+req(round.address==loopback and round.port==be.port,"address to endpoint")
  empty=transport.receive(a,64);count=count+req(not empty.received and len(empty.data)==0,"nonblocking receive")
  runtime=transport.attach(netchan.init(32123),a);channel=netchan.setup(netchan.NS_CLIENT,qb,0)
  wire=netchan.transmit(runtime,channel,bytes([1,2,3,4,5]))
  got=wait(b);count=count+req(equal(got.data,wire),"netchan callback exact bytes")
  count=count+req(got.address.ip==[127,0,0,1] and got.address.port==ae.port,"netchan source")
  count=count+req(len(wire)==11 and wire[4]==123 and wire[5]==125,"client qport header")
  text=transport.outOfBandPrint(b,qa,"getchallenge")
  got=wait(a);count=count+req(equal(got.data,text),"OOB print datagram")
  count=count+req(equal(slice(text,0,4),bytes([255,255,255,255])),"OOB marker")
  count=count+req(decode(slice(text,4,len(text)-4))=="getchallenge","OOB text")
  connect=bytes("connect \"\\name\\Ranger\\protocol\\68\\qport\\32123\\challenge\\77\"")
  compressed=transport.outOfBandData(a,qb,connect);got=wait(b)
  count=count+req(equal(got.data,compressed),"OOB data datagram")
  count=count+req(equal(slice(compressed,0,12),bytes([255,255,255,255])+bytes("connect ")),"connect prefix uncompressed")
  restored=huffman.decompressPacket(compressed,12,16384)
  count=count+req(equal(restored,bytes([255,255,255,255])+connect),"connect decompression")
  count=count+req(len(compressed)>12 and not equal(compressed,restored),"connect payload encoded")
  count=count+req(transport.sendPacket(runtime,netchan.NS_CLIENT,bytes([9]),netchan.Address(transport.NA_BOT,[0,0,0,0],0))==0,"bot packet discarded")
  count=count+req(try(transport.addressToEndpoint(netchan.Address(transport.NA_LOOPBACK,[127,0,0,1],0))) is error,"unsupported loopback rejected")
  udp.close(a);udp.close(b);udp.cleanup()
  print "PASS: "+str(count)+" UDP net transport contracts";return 0
end function
