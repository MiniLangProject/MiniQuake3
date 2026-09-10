// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.udp as udp
function req(value,label) if not value then return error(499,"udp platform: "+label) end if;return 1 end function
function equal(a,b) if len(a)!=len(b) then return false end if;for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for;return true end function
function receive(socket)
  for attempt=0 to 9999
    packet=udp.receiveFrom(socket,65535);if packet.received then return packet end if
  end for
  return error(499,"udp platform: localhost datagram timeout")
end function
function main(args)
  count=0;udp.startup();a=udp.open();b=udp.open()
  loopback=udp.ipv4(127,0,0,1);ae=udp.bind(a,udp.Endpoint(loopback,0));be=udp.bind(b,udp.Endpoint(loopback,0))
  count=count+req(ae.address==loopback and be.address==loopback,"bound addresses")
  count=count+req(ae.port>0 and be.port>0 and ae.port!=be.port,"ephemeral ports")
  count=count+req(udp.octets(loopback)==[127,0,0,1],"address octets")
  empty=udp.receiveFrom(a,32);count=count+req(not empty.received and len(empty.data)==0,"nonblocking no data")
  first=bytes([0,1,2,127,128,254,255,0,81]);count=count+req(udp.sendTo(a,be,first)==len(first),"first send")
  packet=receive(b);count=count+req(equal(packet.data,first),"exact first binary payload")
  count=count+req(packet.endpoint.address==loopback and packet.endpoint.port==ae.port,"first source roundtrip")
  second=bytes(2048,0);for i=0 to len(second)-1 second[i]=(i*73+19)&255 end for
  count=count+req(udp.sendTo(b,ae,second)==2048,"second send")
  packet=receive(a);count=count+req(equal(packet.data,second),"exact large binary payload")
  count=count+req(packet.endpoint.address==loopback and packet.endpoint.port==be.port,"second source roundtrip")
  empty=udp.receiveFrom(a,32);count=count+req(not empty.received,"queue drained to no data")
  count=count+req(try(udp.ipv4(256,0,0,1)) is error,"invalid address rejected")
  count=count+req(try(udp.receiveFrom(a,0)) is error,"invalid capacity rejected")
  udp.close(a);udp.close(b);udp.cleanup()
  print "PASS: "+str(count)+" Windows UDP platform contracts";return 0
end function
