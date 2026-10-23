// SPDX-License-Identifier: GPL-2.0-or-later
// Real localhost Winsock path through SV_ConnectionlessPacket's native router
// and the concrete SVC_Info/SVC_Status/SVC_RemoteCommand bindings.
import mq3.server.main_runtime as main
import mq3.server.connectionless as connectionless
import mq3.server.oob_connect as oob
import mq3.server.network_ingress as ingress
import mq3.server.client_message as clientMessage
import mq3.platform.udp as udp
import mq3.qcommon.message as message
import std.string as strings

struct LiveContext socket sent commands now end struct
function req(value,label) if not value then return error(7350,"sv_main productive: "+label) end if;return 1 end function
function endpoint(address) return udp.Endpoint(udp.ipv4(address.ip[0],address.ip[1],address.ip[2],address.ip[3]),address.port) end function
function send(host,address,text) wire=bytes([255,255,255,255])+bytes(text)+bytes([0]);udp.sendTo(host.context.socket,endpoint(address),wire);host.context.sent=host.context.sent+1;return void end function
function executeCommand(host,text) host.context.commands=host.context.commands+[text];return "command ok\n" end function
function millis(host) return host.context.now end function
function request(text) return bytes([255,255,255,255])+bytes(text)+bytes([10,0]) end function
function waitDatagram(socket)
  for attempt=0 to 19999 packet=udp.receiveFrom(socket,65535);if packet.received then return packet end if end for
  return error(7350,"sv_main productive: UDP timeout")
end function
function packetText(packet) return decode(slice(packet.data,4,len(packet.data)-4)) end function
function disconnect(host,address,text) return void end function
function dispatch(serverSocket,runtime)
  packet=waitDatagram(serverSocket);octets=udp.octets(packet.endpoint.address);address=oob.address(4,octets,packet.endpoint.port);return ingress.serverPacket(runtime,address,packet.data)
end function
function main(args)
  count=0;udp.startup();serverSocket=udp.open();clientSocket=udp.open();loopback=udp.ipv4(127,0,0,1);serverEndpoint=udp.bind(serverSocket,udp.Endpoint(loopback,0));clientEndpoint=udp.bind(clientSocket,udp.Endpoint(loopback,0))
  state=main.runtime();state.maxClients=2;state.hostname="Live Arena";state.mapname="q3dm1";state.serverInfo="\\sv_hostname\\Live Arena\\mapname\\q3dm1";state.rconPassword="secret";state.clients=[main.client(main.CS_ACTIVE,"Ranger",34,7),main.client(main.CS_FREE,"",0,0)]
  services=main.services();services.context=LiveContext(serverSocket,0,[],1000);services.sendFn=send;services.executeFn=executeCommand;services.millisecondsFn=millis;host=main.connectionlessServices(state,services);oobRuntime=oob.create(2,oob.config())
  ingressHost=ingress.services();ingressHost.connectionlessRuntime=oobRuntime;ingressHost.connectionlessHost=host;ingressHost.disconnectFn=disconnect;runtime=ingress.create(clientMessage.createServer(0,0),[],ingressHost)

  udp.sendTo(clientSocket,serverEndpoint,request("getinfo live"));count=count+req(dispatch(serverSocket,runtime)=="oob" and runtime.lastPacketResult=="oob","getinfo packet-event dispatch");reply=waitDatagram(clientSocket);text=packetText(reply)
  count=count+req(strings.startsWith(text,"infoResponse\n") and strings.indexOf(text,"\\hostname\\Live Arena",0)>=0,"getinfo UDP reply")
  count=count+req(reply.endpoint.port==serverEndpoint.port,"reply source endpoint")

  udp.sendTo(clientSocket,serverEndpoint,request("getstatus token"));count=count+req(dispatch(serverSocket,runtime)=="oob","getstatus packet-event dispatch");text=packetText(waitDatagram(clientSocket))
  count=count+req(strings.startsWith(text,"statusResponse\n") and strings.indexOf(text,"7 34 \"Ranger\"",0)>=0,"getstatus UDP players")

  udp.sendTo(clientSocket,serverEndpoint,request("rcon secret status  all"));count=count+req(dispatch(serverSocket,runtime)=="oob","rcon packet-event dispatch");text=packetText(waitDatagram(clientSocket))
  count=count+req(text=="print\ncommand ok\n"+decode(bytes([0])) and services.context.commands==["status  all"],"rcon UDP redirect/raw command")
  count=count+req(services.context.sent==3 and clientEndpoint.port!=serverEndpoint.port,"three live replies")
  udp.close(clientSocket);udp.close(serverSocket);udp.cleanup();print("PASS: "+str(count)+" productive sv_main localhost UDP contracts");return 0
end function
