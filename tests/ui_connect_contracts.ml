import mq3.client.ui_connect as connect

struct IntegrationContext connectScreen end struct
function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function count(state,kind) value=0;for each action in state.actions if action.kind==kind then value=value+1 end if end for;return value end function
function textAt(state,y) value="";for each action in state.actions if action.kind=="text" and action.x!=8 and action.y==y then value=action.text end if end for;return value end function
function main(args)
  failures=0
  failures=failures+req(connect.readableSize(0)=="0 bytes" and connect.readableSize(1024)=="1024 bytes","byte boundary")
  failures=failures+req(connect.readableSize(1025)=="1 KB" and connect.readableSize(1048576)=="1024 KB","kilobyte strict boundaries")
  failures=failures+req(connect.readableSize(1572864)=="1.50 MB","megabyte fraction")
  failures=failures+req(connect.readableSize(1073741824)=="1024.00 MB","gigabyte strict boundary")
  failures=failures+req(connect.readableSize(1610612736)=="1.-2 GB","native signed-overflow-compatible gigabyte fraction")
  failures=failures+req(connect.printTime(0)=="0 sec" and connect.printTime(60000)=="60 sec","seconds boundary")
  failures=failures+req(connect.printTime(61000)=="1 min 1 sec" and connect.printTime(3600000)=="60 min 0 sec","minutes strict boundary")
  failures=failures+req(connect.printTime(3661000)=="1 hr 1 min","hours formatting")
  state=connect.create(true);state.downloadSize=8192;state.downloadCount=2048;state.downloadTime=1000;state.realtime=3000;data=connect.displayDownloadInfo(state,"pak0.pk3");failures=failures+req(data.percent==25 and data.estimate=="estimating" and data.copied=="(2 KB of 8 KB copied)","initial estimate")
  failures=failures+req(count(state,"text")==6 and data.leftWidth==262 and not state.actions[0].dispatched,"download labels and suppressible render boundary")
  state.actions=[];state.downloadCount=4096;data=connect.displayDownloadInfo(state,"pak0.pk3");failures=failures+req(data.percent==50 and data.transferRate==2048 and data.estimate=="2 sec","rate and ETA")
  failures=failures+req(data.rateText=="2 KB/Sec" and data.copied=="(4 KB of 8 KB copied)" and count(state,"text")==7,"rate and copied rendering")
  state.actions=[];state.downloadSize=0;state.downloadCount=8192;data=connect.displayDownloadInfo(state,"unknown.pk3");failures=failures+req(data.percent==-1 and data.name=="unknown.pk3" and data.copied=="(8 KB copied)" and data.rateText=="4 KB/Sec","unknown total download")
  client=connect.clientState(connect.CA_CONNECTING,4,"quake.example","\\motd\\Welcome","Server says wait","\\mapname\\q3dm1");connect.configure(state,client,3000,"",0,0,0);result=connect.drawConnectScreen(state,false);failures=failures+req(result=="Awaiting challenge...4" and textAt(state,128)==result,"connecting status")
  failures=failures+req(count(state,"menu-cache")==1 and count(state,"background")==1 and textAt(state,16)=="Loading q3dm1" and textAt(state,64)=="Connecting to quake.example" and textAt(state,448)=="Welcome","base screen and background")
  failures=failures+req(count(state,"wrapped-text")==1,"pre-connected server message")
  client.connState=connect.CA_CHALLENGING;client.connectPacketCount=2;state.client=client;result=connect.drawConnectScreen(state,true);failures=failures+req(result=="Awaiting connection...2" and count(state,"background")==0,"overlay challenge screen")
  client.connState=connect.CA_CONNECTED;state.client=client;result=connect.drawConnectScreen(state,true);failures=failures+req(result=="Awaiting gamestate..." and count(state,"wrapped-text")==0,"connected gamestate wait")
  state.downloadName="pak0.pk3";state.downloadSize=8192;state.downloadCount=4096;state.downloadTime=1000;result=connect.drawConnectScreen(state,true);failures=failures+req(result=="download" and textAt(state,128)=="pak0.pk3 (50%)" and textAt(state,160)=="2 sec","connected download handoff")
  state.downloadName="";client.connState=connect.CA_LOADING;state.client=client;failures=failures+req(connect.drawConnectScreen(state,true)=="loading" and textAt(state,128)=="","loading suppresses status")
  client.connState=connect.CA_PRIMED;state.client=client;failures=failures+req(connect.drawConnectScreen(state,true)=="primed","primed suppresses status")
  state.lastLoadingText="phase";state.lastConnState=connect.CA_CONNECTED;client.connState=connect.CA_CONNECTING;state.client=client;connect.drawConnectScreen(state,true);failures=failures+req(state.lastLoadingText=="" and state.lastConnState==connect.CA_CONNECTING,"connection regression clears loading text")
  state.actions=[];failures=failures+req(not connect.keyConnect(state,13) and len(state.actions)==0,"non-Escape key ignored")
  failures=failures+req(connect.keyConnect(state,connect.K_ESCAPE) and state.actions[0].kind=="execute" and state.actions[0].text=="disconnect\n" and state.actions[0].value==connect.EXEC_APPEND,"Escape disconnect command")
  production=connect.create(false);connect.keyConnect(production,connect.K_ESCAPE);failures=failures+req(production.actions[0].dispatched,"production host dispatch")
  bridge=IntegrationContext(production);production.client=connect.clientState(connect.CA_CONNECTED,0,"local","","","");production.downloadName="";failures=failures+req(connect.sessionDrawConnectScreen(bridge,true)=="Awaiting gamestate...","original UI session connectFn adapter")
  failures=failures+req(connect.CA_CONNECTING==3 and connect.CA_CONNECTED==5 and connect.CA_PRIMED==7,"engine connection constants")
  if failures!=0 then return failures end if;print("PASS: 27 native ui_connect contracts (5 symbols)");return 0
end function
