import mq3.client.ui_network_options as network
import mq3.client.ui_system_config as system
function req(ok,label) if not ok then return error(7812,"UI network/options contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req([network.rateIndex(0),network.rateIndex(2500),network.rateIndex(2501),network.rateIndex(3001),network.rateIndex(4001),network.rateIndex(5001)]==[0,0,1,2,3,4],"rate thresholds")
  count=count+req([network.rateValue(0),network.rateValue(1),network.rateValue(2),network.rateValue(3),network.rateValue(4)]==[2500,3000,4000,5000,25000],"rate values")
  menu=network.open(4000);count=count+req(menu.wrapAround and menu.fullscreen and menu.cursor==network.ID_NETWORK and len(menu.items)==9 and menu.items[7].value==2,"network topology")
  menu=network.event(menu,network.ID_RATE,network.QM_ACTIVATED,4);count=count+req(menu.cvarWrites==[["rate",25000]],"rate write")
  menu=network.event(menu,network.ID_DISPLAY,network.QM_ACTIVATED,0);count=count+req(menu.actions==["pop","display"],"network navigation")
  old=len(menu.cvarWrites);menu=network.event(menu,network.ID_RATE,0,0);count=count+req(len(menu.cvarWrites)==old,"network ignores non activation")
  disconnected=system.open(0);connected=system.open(system.CA_CONNECTED);count=count+req(disconnected.fullscreen and not connected.fullscreen,"connection fullscreen")
  count=count+req(disconnected.pushed and len(disconnected.items)==8 and disconnected.items[3].y==168 and disconnected.items[6].y==270,"system topology")
  disconnected=system.event(disconnected,system.ID_SOUND,system.QM_ACTIVATED);count=count+req(disconnected.actions==["sound"],"system routing")
  count=count+req(network.cache()==system.cache() and len(system.cache())==4,"shared assets")
  print("PASS: "+str(count)+" UI network/system contracts");return 0
end function
