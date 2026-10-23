// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.win_net_runtime as win
import mq3.platform.udp as udp
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as net
function req(value,label) if not value then return error(6976,"win_net: "+label) end if;return 1 end function
function same(left,right) if len(left)!=len(right) then return false end if;for i=0 to len(left)-1 if left[i]!=right[i] then return false end if end for;return true end function
function waitPacket(state,capacity) for attempt=0 to 9999 value=win.Sys_GetPacket(state,capacity);if value.received then return value end if end for;return error(6976,"win_net: receive timeout") end function
function main(args)
  count=0;udp.startup()
  count=count+req(win.NET_ErrorString(10035)=="WSAEWOULDBLOCK" and win.NET_ErrorString(123)=="NO ERROR","error strings")
  ip=net.Address(win.NA_IP,[1,2,3,4],27960);round=win.SockadrToNetadr(win.NetadrToSockadr(ip));count=count+req(round.type==win.NA_IP and round.ip==ip.ip and round.port==27960,"IPv4 sockaddr roundtrip")
  broad=win.NetadrToSockadr(net.Address(win.NA_BROADCAST,[],27961));count=count+req(broad.address==udp.ipv4(255,255,255,255),"broadcast sockaddr")
  ipx=win.Sys_StringToSockaddr("01020304.05060708090a");count=count+req(ipx!=void and ipx.family==6 and ipx.ipx==[1,2,3,4,5,6,7,8,9,10],"IPX parser")
  numeric=win.Sys_StringToAdr("127.0.0.1");count=count+req(numeric!=void and numeric.ip==[127,0,0,1],"IPv4 parser")
  count=count+req(win.Sys_StringToAdr("host.invalid.invalid")==void,"resolver failure")
  lan=win.create();lan.localIPs=[udp.ipv4(10,1,2,3),udp.ipv4(172,18,1,1),udp.ipv4(192,168,1,5)]
  count=count+req(win.Sys_IsLANAddress(lan,net.Address(win.NA_LOOPBACK,[],0)),"loopback LAN")
  count=count+req(win.Sys_IsLANAddress(lan,net.Address(win.NA_IPX,array(10,0),0)),"IPX LAN")
  count=count+req(win.Sys_IsLANAddress(lan,net.Address(win.NA_IP,[10,99,1,1],0)),"class A LAN")
  count=count+req(win.Sys_IsLANAddress(lan,net.Address(win.NA_IP,[172,31,9,9],0)),"RFC1918 B LAN")
  count=count+req(win.Sys_IsLANAddress(lan,net.Address(win.NA_IP,[192,168,99,9],0)),"RFC1918 C LAN")
  count=count+req(not win.Sys_IsLANAddress(lan,net.Address(win.NA_IP,[8,8,8,8],0)),"WAN classification")
  shown=win.Sys_ShowIP(lan);count=count+req(len(shown)==3 and shown[0]=="IP: 10.1.2.3","show local IP")
  sender=win.create();receiver=win.create();sender.socket=win.NET_IPSocket("localhost",win.PORT_ANY);receiver.socket=win.NET_IPSocket("localhost",win.PORT_ANY)
  senderEndpoint=udp.localEndpoint(sender.socket);receiverEndpoint=udp.localEndpoint(receiver.socket);target=net.Address(win.NA_IP,[127,0,0,1],receiverEndpoint.port)
  data=bytes([0,1,2,127,128,254,255,81]);count=count+req(win.Sys_SendPacket(sender,len(data),data,target)==len(data),"Sys_SendPacket UDP")
  packet=waitPacket(receiver,64);count=count+req(same(packet.data,data) and packet.source.port==senderEndpoint.port and packet.readcount==0,"Sys_GetPacket UDP")
  count=count+req(receiver.recvfromCount>0,"receive counter")
  empty=win.Sys_GetPacket(receiver,64);count=count+req(not empty.received,"nonblocking empty")
  pending=bytes([9,8,7]);win.Sys_SendPacket(sender,len(pending),pending,target);count=count+req(win.NET_Sleep(receiver,1000),"select readable");packet=waitPacket(receiver,64);count=count+req(same(packet.data,pending),"select payload")
  relaySocket=win.NET_IPSocket("localhost",win.PORT_ANY);relayEndpoint=udp.localEndpoint(relaySocket);sender.usingSocks=true;sender.socksRelay=udp.Endpoint(udp.ipv4(127,0,0,1),relayEndpoint.port)
  proxyData=bytes([11,12,13]);proxyTarget=net.Address(win.NA_IP,[8,8,4,4],27960);count=count+req(win.Sys_SendPacket(sender,len(proxyData),proxyData,proxyTarget)==len(proxyData),"SOCKS UDP send")
  relayPacket=udp.receiveFrom(relaySocket,64);for attempt=0 to 9999 if relayPacket.received then break end if;relayPacket=udp.receiveFrom(relaySocket,64) end for
  count=count+req(relayPacket.received and same(relayPacket.data,bytes([0,0,0,1,8,8,4,4,109,56,11,12,13])),"SOCKS UDP request header")
  receiver.usingSocks=true;receiver.socksRelay=udp.Endpoint(udp.ipv4(127,0,0,1),relayEndpoint.port);reply=bytes([0,0,0,1,9,8,7,6,106,105,21,22]);udp.sendTo(relaySocket,udp.Endpoint(udp.ipv4(127,0,0,1),receiverEndpoint.port),reply)
  proxyPacket=waitPacket(receiver,64);count=count+req(proxyPacket.readcount==10 and proxyPacket.source.ip==[9,8,7,6] and proxyPacket.source.port==27241 and proxyPacket.data==reply,"SOCKS UDP response header")
  sender.usingSocks=false;receiver.usingSocks=false;exact=bytes(16,7);win.Sys_SendPacket(sender,len(exact),exact,target);dropped=win.Packet(false,void,bytes(0,0),0)
  for attempt=0 to 9999 dropped=win.Sys_GetPacket(receiver,16);if len(receiver.logs)>0 then break end if end for
  count=count+req(not dropped.received and len(receiver.logs)>0,"original oversize equality drop")
  loops=transport.createLoopbacks();transport.sendLoopPacket(loops,net.NS_CLIENT,bytes([4,3,2,1]));loopPacket=transport.getLoopPacket(loops,net.NS_SERVER,16);count=count+req(loopPacket.received and loopPacket.address.type==win.NA_LOOPBACK and same(loopPacket.data,bytes([4,3,2,1])),"loopback queue")
  cv=win.cvars();count=count+req(not win.NET_GetCvars(lan,cv),"unchanged cvars");cv.generation=1;count=count+req(win.NET_GetCvars(lan,cv),"modified cvars")
  count=count+req(win.NET_IPXSocket(27960)==void and not win.NET_OpenIPX(lan),"retired IPX is deterministic")
  cv.socksEnabled=true;cv.socksServer="127.0.0.1";count=count+req(not win.NET_OpenSocks(lan,1080) and not lan.usingSocks,"SOCKS failure is explicit")
  udp.close(relaySocket);udp.close(sender.socket);udp.close(receiver.socket);udp.cleanup()
  life=win.create();base=win.cvars();base.port=0;count=count+req(win.NET_Init(life,base) and life.initialized and life.networkingEnabled and life.socket!=void and udp.localEndpoint(life.socket).port>0,"NET_Init and config")
  count=count+req(not win.NET_Config(life,true,base),"unchanged NET_Config no-op")
  count=count+req(win.NET_Restart(life) and life.socket!=void,"NET_Restart")
  addresses=win.NET_GetLocalAddress(life);count=count+req(addresses!=void and len(addresses)<=16,"local address enumeration")
  count=count+req(win.NET_Shutdown(life) and not life.initialized and not life.networkingEnabled and life.socket==void,"NET_Shutdown")
  count=count+req(not win.NET_Shutdown(life),"idempotent shutdown")
  print("PASS: "+str(count)+" complete win_net contracts");return 0
end function
