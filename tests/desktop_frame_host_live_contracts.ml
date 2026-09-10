// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.udp as udp
import mq3.platform.desktop_frame_host as host
import mq3.server.network_ingress as ingress

struct Capture packets frames sides end struct
function req(value,label) if not value then return error(499,"desktop frame host live: "+label) end if;return 1 end function
function clientPacket(s,address,data) s.context.packets=s.context.packets+1;s.context.sides=s.context.sides+["client:"+decode(data)];return void end function
function serverFrame(c,time,msec) c.frames=c.frames+1;return void end function
function clientFrame(c,time,msec) c.frames=c.frames+1;return void end function

function main(args)
  n=0;capture=Capture(0,0,[]);server=ingress.services();server.clientPacketFn=clientPacket;server.context=capture
  // Empty bindings are sufficient for a client-side datagram; server protocol
  // parsing remains installed on the second host socket.
  ir=ingress.create([],[],server);services=host.liveServices(ir,capture,serverFrame,clientFrame)
  loopback=udp.ipv4(127,0,0,1);cfg=host.config(udp.Endpoint(loopback,0),udp.Endpoint(loopback,0),2048,1,100)
  runtime=host.start(cfg,services,500);sender=udp.open();udp.bind(sender,udp.Endpoint(loopback,0))
  n=n+req(runtime.clientEndpoint.port>0 and runtime.serverEndpoint.port>0,"ephemeral binds")
  udp.sendTo(sender,runtime.clientEndpoint,bytes("one"));udp.sendTo(sender,runtime.clientEndpoint,bytes("two"))
  for attempt=0 to 9999
    host.frame(runtime,501+attempt)
    if capture.packets>=2 then break end if
  end for
  n=n+req(capture.packets==2 and capture.sides==["client:one","client:two"],"live UDP delivery")
  n=n+req(runtime.packetCount==2,"bounded packets accounted")
  n=n+req(runtime.frameNumber>=2 and capture.frames==runtime.frameNumber*2,"both frame callbacks")
  n=n+req(ir.packetState.time==runtime.time,"ingress time synchronized")
  udp.close(sender);host.shutdown(runtime)
  n=n+req(not runtime.active and not runtime.udpStarted,"live shutdown")
  print "PASS: "+str(n)+" desktop frame host live contracts";return 0
end function
