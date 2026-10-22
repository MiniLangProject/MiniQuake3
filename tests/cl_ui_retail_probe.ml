import mq3.client.cl_ui_runtime as clui
import mq3.client.ui_lan_browser as lan
import mq3.client.ui_host_lifecycle as hostState
import mq3.vm.interpreter as interpreter
import mq3.format.pk3 as pk3
import mq3.compat.numeric as n
function uiSyscall(machine,address) return 0 end function
function req(ok,label) if not ok then return error(7803,"cl_ui Retail: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;count=0
  image=pk3.read(archive,"vm/ui.qvm");count=count+req(not (image is error) and len(image)>200000 and n.readU32(image,0)==0x12721444,"Retail ui.qvm image")
  uiMachine=interpreter.load(image,uiSyscall);count=count+req(interpreter.call(uiMachine,[0])==3,"Retail ui.qvm executable old API")
  arenas=pk3.read(archive,"scripts/arenas.txt");count=count+req(not (arenas is error) and len(arenas)>1000,"Retail arena catalog")
  configs=array(clui.MAX_CONFIGSTRINGS,"");configs[0]="\\sv_hostname\\Retail";client=hostState.createClientState(hostState.CA_CONNECTED,2,0,"localhost","","")
  state=clui.create(lan.create(),void,void,void,void,client,bytes(0,0),configs);encoded=clui.GetClientState(state);count=count+req(n.readI32(encoded,0)==hostState.CA_CONNECTED and n.readI32(encoded,4)==2,"Retail client-state facade")
  count=count+req(clui.GetConfigString(state,0,64)=="\\sv_hostname\\Retail","Retail configstring facade")
  count=count+req(clui.LAN_AddServer(state,lan.AS_FAVORITES,"Local Arena","127.0.0.1:27960")==1 and clui.LAN_GetServerCount(state,lan.AS_FAVORITES)==1,"Retail LAN facade")
  count=count+req(clui.LAN_GetServerAddressString(state,lan.AS_FAVORITES,0,64)=="127.0.0.1:27960","Retail LAN address")
  print("PASS: "+str(count)+" Retail cl_ui contracts");return 0
end function
