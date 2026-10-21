import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_ingress as ingress
import mq3.client.ui_lan_queries as queries
import mq3.qcommon.netchan as netchan

struct Context packets end struct
function req(value,label) if not value then return error(7701,"UI LAN queries: "+label) end if;return 1 end function
function captureSend(context,sock,address,packet) context.packets=context.packets+[[sock,address.type,address.ip,address.port,packet]];return len(packet) end function
function captureResolve(context,name,port) if name==queries.MASTER_SERVER_NAME then return netchan.Address(4,[192,0,2,1],port) end if;return void end function
function packetText(packet) return decode(slice(packet,4,len(packet)-4)) end function

function main(args)
  browser=lan.create();input=ingress.create(browser);context=Context([]);host=queries.services();host.context=context;host.sendFn=captureSend;host.resolveFn=captureResolve
  state=queries.create(browser,input,host);count=0
  count=count+req(queries.scanLocal(state)==8 and len(context.packets)==8,"local packet count")
  count=count+req(context.packets[0][0]==netchan.NS_CLIENT and context.packets[0][1]==queries.NA_BROADCAST and context.packets[0][3]==27960,"local first target")
  count=count+req(context.packets[3][3]==27963 and context.packets[4][3]==27960 and packetText(context.packets[7][4])=="getinfo xxx","local ports and repeats")

  context.packets=[];count=count+req(queries.scanGlobal(state,0,"68",["empty","full"],false),"global request")
  count=count+req(len(context.packets)==1 and context.packets[0][0]==netchan.NS_SERVER and context.packets[0][3]==27950,"master target")
  count=count+req(packetText(context.packets[0][4])=="getservers 68 empty full" and input.masterNum==0 and input.pingUpdateSource==lan.AS_GLOBAL,"master command")
  context.packets=[];queries.scanGlobal(state,1,"68",[],true)
  count=count+req(packetText(context.packets[0][4])=="getservers 68 demo" and input.pingUpdateSource==lan.AS_MPLAYER,"restricted alternate master")

  lan.add(browser,lan.AS_GLOBAL,"one","1.2.3.4:27960");lan.add(browser,lan.AS_GLOBAL,"two","5.6.7.8:27961")
  queries.setRealtime(state,100);context.packets=[];count=count+req(queries.updateVisiblePings(state,lan.AS_GLOBAL),"visible work")
  count=count+req(len(context.packets)==2 and len(input.pendingPings)==2 and lan.pingCount(browser)==2,"visible queues two")
  count=count+req(packetText(context.packets[0][4])=="getinfo xxx" and context.packets[1][3]==27961,"visible packets")
  count=count+req(queries.updateVisiblePings(state,lan.AS_GLOBAL) and len(context.packets)==2,"pending not duplicated")

  context.packets=[];count=count+req(not queries.sendPing(state,"1.2.3.4:27960") and len(context.packets)==0,"manual duplicate")
  count=count+req(queries.sendPing(state,"9.8.7.6") and context.packets[0][3]==27960,"manual default port")
  count=count+req(not queries.sendPing(state,"bad address"),"unresolved address")
  queries.setMaxPing(state,50);queries.setRealtime(state,200);count=count+req(queries.updateVisiblePings(state,lan.AS_GLOBAL) and len(input.pendingPings)==0,"ping timeout retirement")
  count=count+req(lan.serverPing(browser,lan.AS_GLOBAL,0)==0 and lan.getPing(browser,0)[1]==100,"timeout server state")

  context.packets=[];queries.setRealtime(state,200);value=queries.serverStatus(state,"1.2.3.4:27960")
  count=count+req(value==void and len(context.packets)==1 and packetText(context.packets[0][4])=="getstatus","status starts")
  queries.setRealtime(state,950);queries.serverStatus(state,"1.2.3.4:27960");count=count+req(len(context.packets)==1,"status exact resend edge")
  queries.setRealtime(state,951);queries.serverStatus(state,"1.2.3.4:27960");count=count+req(len(context.packets)==2,"status resend")
  lan.setStatusByAddress(browser,"1.2.3.4:27960","\\sv_hostname\\one\\");count=count+req(queries.serverStatus(state,"1.2.3.4:27960")=="\\sv_hostname\\one\\" and len(context.packets)==2,"completed status")

  address=queries.numericAddress("127.0.0.1",27960);count=count+req(address.ip==[127,0,0,1] and address.port==27960,"numeric default")
  count=count+req(queries.numericAddress("127.0.0.1:65536",27960)==void and queries.numericAddress("1.2.3",27960)==void,"numeric rejection")
  packet=queries.oob("getstatus");count=count+req(slice(packet,0,4)==bytes([255,255,255,255]) and packetText(packet)=="getstatus","OOB framing")
  print("PASS: "+str(count)+" UI LAN outbound query contracts");return 0
end function
