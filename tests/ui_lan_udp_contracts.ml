// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_ingress as ingress
import mq3.client.ui_lan_queries as queries
import mq3.client.ui_lan_udp as live
import mq3.platform.udp as udp
import mq3.qcommon.netchan as netchan

function req(value,label) if not value then return error(7703,"UI LAN UDP: "+label) end if;return 1 end function
function packetText(packet) return decode(slice(packet,4,len(packet)-4)) end function
function waitRaw(socket)
  for attempt=0 to 19999 packet=udp.receiveFrom(socket,65535);if packet.received then return packet end if end for
  return error(7703,"UI LAN UDP: responder timeout")
end function
function waitPump(context)
  for attempt=0 to 19999 if live.pump(context,8)>0 then return true end if end for
  return false
end function
function responseWire(command,payload)
  result=bytes([255,255,255,255])+bytes(command)+bytes([10]);if payload!=void then result=result+bytes(payload) end if
  return result+bytes([0])
end function

function main(args)
  browser=lan.create();input=ingress.create(browser);context=live.open(input);host=live.services(context)
  state=queries.create(browser,input,host);responder=udp.open();loopback=udp.ipv4(127,0,0,1);target=udp.bind(responder,udp.Endpoint(loopback,0));count=0

  resolved=queries.resolve(state,"localhost",target.port)
  count=count+req(resolved!=void and resolved.type==queries.NA_IP and resolved.ip==[127,0,0,1] and resolved.port==target.port,"DNS localhost")
  count=count+req(queries.sendPing(state,"localhost:"+str(target.port)),"DNS ping sent")
  request=waitRaw(responder);count=count+req(packetText(request.data)=="getinfo xxx","live getinfo payload")
  clientEndpoint=live.localEndpoint(context,netchan.NS_CLIENT)
  count=count+req(request.endpoint.port==clientEndpoint.port,"client source socket")
  info="\\protocol\\68\\hostname\\Live Arena\\mapname\\q3dm1\\clients\\2\\sv_maxclients\\8"
  udp.sendTo(responder,request.endpoint,responseWire("infoResponse",info));count=count+req(waitPump(context),"info response pumped")
  count=count+req(lan.pingCount(browser)==1 and lan.getPing(browser,0)[1]>=1,"ping completed")

  queries.setRealtime(state,100);queries.serverStatus(state,"127.0.0.1:"+str(target.port));request=waitRaw(responder)
  count=count+req(packetText(request.data)=="getstatus","live getstatus payload")
  status="\\sv_hostname\\Live Arena\\mapname\\q3dm1\n7 11 \\\"Ranger\\\"\n\n"
  udp.sendTo(responder,request.endpoint,responseWire("statusResponse",status));count=count+req(waitPump(context),"status response pumped")
  count=count+req(lan.serverStatus(browser,"127.0.0.1:"+str(target.port))!="","status retained")

  master=queries.resolve(state,"localhost",target.port);host.sendFn(host.context,netchan.NS_SERVER,master,queries.oob("getservers 68"));request=waitRaw(responder)
  serverEndpoint=live.localEndpoint(context,netchan.NS_SERVER)
  count=count+req(request.endpoint.port==serverEndpoint.port and request.endpoint.port!=clientEndpoint.port,"server source socket")
  count=count+req(packetText(request.data)=="getservers 68","live master payload")
  serverWire=bytes([255,255,255,255])+bytes("getserversResponse")+bytes([92,1,2,3,4,109,56,92,69,79,84,0])
  udp.sendTo(responder,request.endpoint,serverWire);count=count+req(waitPump(context),"master response pumped")
  count=count+req(lan.count(browser,lan.AS_GLOBAL)==1 and lan.address(browser,lan.AS_GLOBAL,0)=="1.2.3.4:27960","master result retained")

  count=count+req(queries.scanLocal(state)==8,"broadcast discovery sent")
  count=count+req(live.pump(context,0)==0,"zero pump budget")
  udp.close(responder);count=count+req(live.close(context),"host close")
  count=count+req(not live.close(context),"host close idempotent")
  count=count+req(live.resolveAddress(context,"localhost",27950)==void,"closed host refuses DNS")
  print("PASS: "+str(count)+" live UI LAN UDP contracts");return 0
end function
