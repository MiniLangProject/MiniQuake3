import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_ingress as ingress
import mq3.client.connectionless as connectionless
import mq3.qcommon.message as message
import mq3.qcommon.netchan as netchan
import mq3.shared.info as info

function req(value,label) if not value then return error(7699,"UI LAN ingress: "+label) end if;return 1 end function
function adr(a,b,c,d,port) return netchan.Address(4,[a,b,c,d],port) end function
function wire(command,payload)
  raw=bytes([255,255,255,255])+bytes(command)+bytes([10])
  if payload!=void then raw=raw+bytes(payload) end if
  raw=raw+bytes([0]);msg=message.initStorage(raw,len(raw),false);msg.cursize=len(raw);return msg
end function
function serverWire()
  raw=bytes([255,255,255,255])+bytes("getserversResponse")+bytes([92,1,2,3,4,109,56,92,5,6,7,8,109,57,92,69,79,84,0])
  msg=message.initStorage(raw,len(raw),false);msg.cursize=len(raw);return msg
end function

function main(args)
  browser=lan.create();state=ingress.create(browser);host=ingress.services(state);client=connectionless.create(adr(127,0,0,1,27960));count=0
  result=connectionless.dispatch(client,host,adr(9,9,9,9,27950),serverWire())
  count=count+req(result=="getserversResponse" and lan.count(browser,lan.AS_GLOBAL)==2,"master dispatch")
  count=count+req(lan.address(browser,lan.AS_GLOBAL,0)=="1.2.3.4:27960" and lan.address(browser,lan.AS_GLOBAL,1)=="5.6.7.8:27961","master binary addresses")
  count=count+req(lan.serverPing(browser,lan.AS_GLOBAL,0)== -1 and info.value(lan.serverInfo(browser,lan.AS_GLOBAL,0),"hostname")=="","master initializes blank server")

  ingress.requestPing(state,"1.2.3.4:27960",100);ingress.setRealtime(state,141)
  text="\\protocol\\68\\hostname\\Arena One\\mapname\\q3dm1\\clients\\3\\sv_maxclients\\8\\game\\baseq3\\gametype\\0\\minping\\0\\maxping\\200\\punkbuster\\0"
  result=connectionless.dispatch(client,host,adr(1,2,3,4,27960),wire("infoResponse",text))
  count=count+req(result=="infoResponse" and lan.serverPing(browser,lan.AS_GLOBAL,0)==42,"ping completion time")
  server=lan.serverInfo(browser,lan.AS_GLOBAL,0);count=count+req(info.value(server,"hostname")=="Arena One" and info.value(server,"mapname")=="q3dm1" and info.value(server,"clients")=="3","info fields")
  count=count+req(lan.pingCount(browser)==1 and lan.getPing(browser,0)[1]==42 and info.value(lan.getPingInfo(browser,0),"nettype")=="1","ping queue info")

  bad="\\protocol\\67\\hostname\\Wrong";connectionless.dispatch(client,host,adr(10,0,0,1,27960),wire("infoResponse",bad))
  count=count+req(lan.count(browser,lan.AS_LOCAL)==0,"reject other protocol")
  ingress.setPingUpdateSource(state,lan.AS_LOCAL);connectionless.dispatch(client,host,adr(10,0,0,1,27960),wire("infoResponse",text))
  count=count+req(lan.count(browser,lan.AS_LOCAL)==1 and lan.address(browser,lan.AS_LOCAL,0)=="10.0.0.1:27960","local discovery")
  count=count+req(lan.serverPing(browser,lan.AS_LOCAL,0)== -1 and info.value(lan.serverInfo(browser,lan.AS_LOCAL,0),"hostname")=="","local response initializes blank")
  connectionless.dispatch(client,host,adr(10,0,0,1,27960),wire("infoResponse",text));count=count+req(lan.count(browser,lan.AS_LOCAL)==1,"local duplicate ignored")

  ingress.requestStatus(state,"1.2.3.4:27960");status="\\sv_hostname\\Arena One\\mapname\\q3dm1\n12 34 \\\"Ranger\\\"\n-2 51 \\\"Sarge\\\"\n\n"
  connectionless.dispatch(client,host,adr(1,2,3,4,27960),wire("statusResponse",status))
  count=count+req(lan.serverStatus(browser,"1.2.3.4:27960")=="\\sv_hostname\\Arena One\\mapname\\q3dm1\\\\12 34 \\\"Ranger\\\"\\-2 51 \\\"Sarge\\\"\\","status framing")
  old=lan.serverStatus(browser,"1.2.3.4:27960");connectionless.dispatch(client,host,adr(1,2,3,4,27960),wire("statusResponse","\\changed\\1\n\n"))
  count=count+req(lan.serverStatus(browser,"1.2.3.4:27960")==old,"unsolicited status ignored")

  ingress.setMaster(state,1);connectionless.dispatch(client,host,adr(9,9,9,9,27950),serverWire())
  count=count+req(lan.count(browser,lan.AS_MPLAYER)==2 and lan.count(browser,lan.AS_GLOBAL)==2,"alternate master catalog")
  print("PASS: "+str(count)+" UI LAN packet ingress contracts");return 0
end function
