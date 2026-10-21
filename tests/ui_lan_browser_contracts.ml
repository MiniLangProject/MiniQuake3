import mq3.client.ui_lan_browser as lan
import mq3.shared.info as info

function req(value,label) if not value then return error(7695,"UI LAN browser: "+label) end if;return 1 end function

function main(args)
  state=lan.create();count=0
  count=count+req(lan.count(state,lan.AS_GLOBAL)==0,"empty catalog")
  count=count+req(lan.add(state,lan.AS_GLOBAL,"Zulu","127.0.0.1:27960")==1,"add global")
  count=count+req(lan.add(state,lan.AS_GLOBAL,"duplicate","127.0.0.1:27960")==0,"duplicate address")
  count=count+req(lan.add(state,99,"bad","invalid")== -1,"invalid source")
  count=count+req(lan.add(state,lan.AS_GLOBAL,"alpha","quake.example:27960")==1 and lan.count(state,lan.AS_GLOBAL)==2,"second global")
  count=count+req(lan.address(state,lan.AS_GLOBAL,0)=="127.0.0.1:27960" and lan.address(state,lan.AS_GLOBAL,9)=="","address lookup")
  count=count+req(lan.serverPing(state,lan.AS_GLOBAL,0)== -1 and lan.serverPing(state,99,0)== -1,"initial ping")
  count=count+req(lan.updateVisiblePings(state,lan.AS_GLOBAL),"visible unresolved ping")
  count=count+req(lan.updateServer(state,lan.AS_GLOBAL,0,"q3dm1",3,8,42,0,200,"baseq3",0,1,0,"players\\3"),"update response")
  text=lan.serverInfo(state,lan.AS_GLOBAL,0)
  count=count+req(info.value(text,"hostname")=="Zulu" and info.value(text,"mapname")=="q3dm1","info identity")
  count=count+req(info.value(text,"clients")=="3" and info.value(text,"sv_maxclients")=="8" and info.value(text,"ping")=="42","info numbers")
  count=count+req(info.value(text,"game")=="baseq3" and info.value(text,"addr")=="127.0.0.1:27960","info game/address")
  count=count+req(lan.serverPing(state,lan.AS_GLOBAL,0)==42 and lan.serverStatus(state,"127.0.0.1:27960")=="players\\3","response query")
  count=count+req(lan.compare(state,lan.AS_GLOBAL,lan.SORT_HOST,0,0,1)==1,"host ascending")
  count=count+req(lan.compare(state,lan.AS_GLOBAL,lan.SORT_HOST,1,0,1)== -1,"host descending")
  count=count+req(lan.compare(state,lan.AS_GLOBAL,lan.SORT_CLIENTS,0,0,1)==1,"client sort")
  lan.markVisible(state,lan.AS_GLOBAL,-1,false);count=count+req(not lan.isVisible(state,lan.AS_GLOBAL,0) and not lan.isVisible(state,lan.AS_GLOBAL,1),"mark all hidden")
  lan.markVisible(state,lan.AS_GLOBAL,1,true);count=count+req(lan.isVisible(state,lan.AS_GLOBAL,1) and not lan.isVisible(state,lan.AS_GLOBAL,0),"mark one visible")
  count=count+req(lan.updateVisiblePings(state,lan.AS_GLOBAL),"visible second unresolved")
  lan.resetPings(state,lan.AS_GLOBAL);count=count+req(lan.serverPing(state,lan.AS_GLOBAL,0)== -1,"reset ping")
  count=count+req(lan.queuePing(state,"one:27960",17,"\\hostname\\one")==0 and lan.queuePing(state,"two:27960",23,"\\hostname\\two")==1,"queue pings")
  p=lan.getPing(state,1);count=count+req(lan.pingCount(state)==2 and p[0]=="two:27960" and p[1]==23,"get ping")
  count=count+req(info.value(lan.getPingInfo(state,0),"hostname")=="one","ping info")
  lan.clearPing(state,0);p=lan.getPing(state,0);count=count+req(lan.pingCount(state)==1 and p[0]=="two:27960","clear compacts")
  lan.save(state);lan.updateServer(state,lan.AS_GLOBAL,0,"changed",9,9,88,0,0,"mod",2,1,0,"changed");lan.remove(state,lan.AS_GLOBAL,"QUAKE.EXAMPLE:27960");count=count+req(lan.count(state,lan.AS_GLOBAL)==1,"case-insensitive remove")
  lan.load(state);count=count+req(lan.count(state,lan.AS_GLOBAL)==2,"cache restore")
  count=count+req(lan.serverPing(state,lan.AS_GLOBAL,0)== -1 and info.value(lan.serverInfo(state,lan.AS_GLOBAL,0),"mapname")=="q3dm1","cache snapshot owns records")
  lan.remove(state,lan.AS_GLOBAL,"127.0.0.1:27960");count=count+req(lan.count(state,lan.AS_GLOBAL)==1 and lan.address(state,lan.AS_GLOBAL,0)=="quake.example:27960","remove compacts")
  count=count+req(lan.serverStatus(state,"missing")==void and lan.serverInfo(state,99,0)=="","missing queries")
  full=lan.create();for index=0 to lan.MAX_OTHER_SERVERS-1 lan.add(full,lan.AS_FAVORITES,"server",str(index)) end for
  count=count+req(lan.count(full,lan.AS_FAVORITES)==lan.MAX_OTHER_SERVERS and lan.add(full,lan.AS_FAVORITES,"overflow","extra")== -1,"Baseq3 catalog capacity")
  print("PASS: "+str(count)+" UI LAN browser contracts");return 0
end function
