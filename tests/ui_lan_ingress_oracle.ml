import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_ingress as ingress
import mq3.client.connectionless as connectionless
import mq3.qcommon.message as message
import mq3.qcommon.netchan as netchan
import mq3.shared.info as info

function adr(a,b,c,d,port) return netchan.Address(4,[a,b,c,d],port) end function
function wire(command,payload)
 raw=bytes([255,255,255,255])+bytes(command)+bytes([10]);if payload!=void then raw=raw+bytes(payload) end if;raw=raw+bytes([0]);m=message.initStorage(raw,len(raw),false);m.cursize=len(raw);return m
end function
function masters()
 raw=bytes([255,255,255,255])+bytes("getserversResponse")+bytes([92,1,2,3,4,109,56,92,5,6,7,8,109,57,92,69,79,84,0]);m=message.initStorage(raw,len(raw),false);m.cursize=len(raw);return m
end function
function main(args)
 b=lan.create();r=ingress.create(b);h=ingress.services(r);c=connectionless.create(adr(127,0,0,1,27960))
 connectionless.dispatch(c,h,adr(9,9,9,9,27950),masters());print("servers|"+str(lan.count(b,lan.AS_GLOBAL))+"|"+lan.address(b,lan.AS_GLOBAL,0)+"|"+lan.address(b,lan.AS_GLOBAL,1)+"|"+str(lan.serverPing(b,lan.AS_GLOBAL,0)))
 ingress.requestPing(r,"1.2.3.4:27960",100);ingress.setRealtime(r,141);packet="\\protocol\\68\\hostname\\Arena One\\mapname\\q3dm1\\clients\\3\\sv_maxclients\\8\\game\\baseq3\\gametype\\0\\minping\\0\\maxping\\200\\punkbuster\\0"
 connectionless.dispatch(c,h,adr(1,2,3,4,27960),wire("infoResponse",packet));server=lan.serverInfo(b,lan.AS_GLOBAL,0)
 print("info|"+str(lan.serverPing(b,lan.AS_GLOBAL,0))+"|"+info.value(server,"hostname")+"|"+info.value(server,"mapname")+"|"+info.value(server,"clients")+"|"+info.value(lan.getPingInfo(b,0),"nettype"))
 ingress.setPingUpdateSource(r,lan.AS_LOCAL);connectionless.dispatch(c,h,adr(10,0,0,1,27960),wire("infoResponse","\\protocol\\67\\hostname\\Wrong"));connectionless.dispatch(c,h,adr(10,0,0,2,27960),wire("infoResponse",packet));print("local|"+str(lan.count(b,lan.AS_LOCAL))+"|"+lan.address(b,lan.AS_LOCAL,0)+"|"+str(lan.serverPing(b,lan.AS_LOCAL,0)))
 ingress.requestStatus(r,"1.2.3.4:27960");connectionless.dispatch(c,h,adr(1,2,3,4,27960),wire("statusResponse","\\sv_hostname\\Arena One\\mapname\\q3dm1\n12 34 \\\"Ranger\\\"\n-2 51 \\\"Sarge\\\"\n\n"));print("status|"+lan.serverStatus(b,"1.2.3.4:27960"))
 return 0
end function
