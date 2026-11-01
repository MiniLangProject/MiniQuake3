// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.udp as udp
import mq3.qcommon.network_pump as pump

struct Capture calls sides sources payloads end struct
function req(value,label) if not value then return error(499,"network pump: "+label) end if;return 1 end function
function equal(a,b) if len(a)!=len(b) then return false end if;if len(a)>0 then for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for end if;return true end function
function clientPacket(c,address,data) c.calls=c.calls+1;c.sides=c.sides+[pump.SIDE_CLIENT];c.sources=c.sources+[address.port];c.payloads=c.payloads+[data];return void end function
function serverPacket(c,address,data) c.calls=c.calls+1;c.sides=c.sides+[pump.SIDE_SERVER];c.sources=c.sources+[address.port];c.payloads=c.payloads+[data];return void end function
function rejectPacket(c,address,data) return error(499,"network pump: rejected packet") end function
function waitFor(runtime,capture,wanted)
  total=0
  for attempt=0 to 9999
    total=total+pump.drain(runtime,wanted-capture.calls)
    if capture.calls>=wanted then return total end if
  end for
  return error(499,"network pump: localhost timeout")
end function
function main(args)
  count=0;udp.startup();client=udp.open();server=udp.open();clientSender=udp.open();serverSender=udp.open();loopback=udp.ipv4(127,0,0,1)
  clientEndpoint=udp.bind(client,udp.Endpoint(loopback,0));serverEndpoint=udp.bind(server,udp.Endpoint(loopback,0))
  clientSource=udp.bind(clientSender,udp.Endpoint(loopback,0));serverSource=udp.bind(serverSender,udp.Endpoint(loopback,0))
  capture=Capture(0,[],[],[]);runtime=pump.create(client,server,65535,capture,clientPacket,serverPacket)
  count=count+req(len(runtime.clientBuffer)==65535 and len(runtime.serverBuffer)==65535 and len(runtime.clientMetadata)==8 and len(runtime.serverMetadata)==8,"receive buffers allocated once per pump")
  empty=pump.pumpOnce(runtime);count=count+req(not empty.processed and capture.calls==0,"empty queues")
  count=count+req(runtime.nextSide==pump.SIDE_CLIENT,"empty preserves preference")
  binary=bytes([0,255,128,1,0,81]);udp.sendTo(clientSender,clientEndpoint,binary);waitFor(runtime,capture,1)
  count=count+req(capture.sides==[pump.SIDE_CLIENT],"client dispatch")
  count=count+req(equal(capture.payloads[0],binary),"client binary exact")
  count=count+req(capture.sources[0]==clientSource.port,"client source")
  count=count+req(runtime.nextSide==pump.SIDE_SERVER,"client yields preference")
  udp.sendTo(serverSender,serverEndpoint,bytes("server"));waitFor(runtime,capture,2)
  count=count+req(capture.sides==[pump.SIDE_CLIENT,pump.SIDE_SERVER],"server dispatch")
  count=count+req(capture.sources[1]==serverSource.port,"server source")
  count=count+req(runtime.nextSide==pump.SIDE_CLIENT,"server yields preference")
  // Queue both directions before pumping: the explicit preference must alternate.
  for i=0 to 2 udp.sendTo(clientSender,clientEndpoint,bytes([10+i]));udp.sendTo(serverSender,serverEndpoint,bytes([20+i])) end for
  waitFor(runtime,capture,8)
  count=count+req(capture.sides==[pump.SIDE_CLIENT,pump.SIDE_SERVER,pump.SIDE_CLIENT,pump.SIDE_SERVER,pump.SIDE_CLIENT,pump.SIDE_SERVER,pump.SIDE_CLIENT,pump.SIDE_SERVER],"two-way fairness")
  count=count+req(capture.payloads[2][0]==10 and capture.payloads[3][0]==20 and capture.payloads[6][0]==12 and capture.payloads[7][0]==22,"per-socket FIFO")
  count=count+req(not pump.pumpOnce(runtime).processed,"queues fully drained")
  large=bytes(2048,0);for i=0 to len(large)-1 large[i]=(i*91+7)&255 end for;udp.sendTo(serverSender,serverEndpoint,large);waitFor(runtime,capture,9)
  count=count+req(equal(capture.payloads[8],large),"large binary exact")
  count=count+req(pump.drain(runtime,0)==0,"zero budget")
  // A frame budget stops predictably and leaves the remainder for the next frame.
  for i=0 to 3 udp.sendTo(clientSender,clientEndpoint,bytes([40+i])) end for
  before=capture.calls;firstCount=0;for attempt=0 to 9999 if firstCount<2 then firstCount=firstCount+pump.drain(runtime,2-firstCount) end if;if firstCount==2 then break end if end for
  count=count+req(firstCount==2 and capture.calls==before+2,"drain budget")
  waitFor(runtime,capture,before+4);count=count+req(capture.calls==before+4,"drain remainder")
  count=count+req(capture.payloads[before][0]==40 and capture.payloads[before+3][0]==43,"budget FIFO")
  runtime.clientPacketFn=rejectPacket;udp.sendTo(clientSender,clientEndpoint,bytes([99]));rejected=false
  for attempt=0 to 9999 result=try(pump.pumpOnce(runtime));if result is error then rejected=true;break end if end for
  count=count+req(rejected,"packet callback failures propagate to frame owner")
  count=count+req(try(pump.create(void,void,64,capture,clientPacket,serverPacket)) is error,"requires socket")
  count=count+req(try(pump.create(client,server,0,capture,clientPacket,serverPacket)) is error,"capacity validation")
  count=count+req(try(pump.drain(runtime,-1)) is error,"budget validation")
  udp.close(client);udp.close(server);udp.close(clientSender);udp.close(serverSender);udp.cleanup()
  print "PASS: "+str(count)+" network pump contracts";return 0
end function
