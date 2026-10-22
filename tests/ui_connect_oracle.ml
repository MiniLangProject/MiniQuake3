import mq3.client.ui_connect as connect

function actionAt(state,y)
  result="";for each action in state.actions if action.kind=="text" and action.x!=8 and action.y==y then result=action.text end if end for;return result
end function
function actionKind(state,kind) count=0;for each action in state.actions if action.kind==kind then count=count+1 end if end for;return count end function
function sizeRow(value) print("size|"+str(value)+"|"+connect.readableSize(value));return void end function
function timeRow(value) print("time|"+str(value)+"|"+connect.printTime(value));return void end function
function downloadRow(state,label,size,count,start,now)
  state.actions=[];state.downloadSize=size;state.downloadCount=count;state.downloadTime=start;state.realtime=now;connect.displayDownloadInfo(state,"pak0.pk3");print("download|"+label+"|"+actionAt(state,128)+"|"+actionAt(state,160)+"|"+actionAt(state,192)+"|"+actionAt(state,224));return void
end function
function screenRow(state,label,connection,packets,overlay,download)
  client=connect.clientState(connection,packets,"quake.example","\\motd\\Welcome","Server says wait","\\mapname\\q3dm1");connect.configure(state,client,3000,download,8192,4096,1000);connect.drawConnectScreen(state,overlay);wrapped="";for each action in state.actions if action.kind=="wrapped-text" then wrapped=action.text end if end for;print("screen|"+label+"|"+str(actionKind(state,"menu-cache"))+"|"+str(actionKind(state,"background"))+"|"+actionAt(state,16)+"|"+actionAt(state,64)+"|"+actionAt(state,448)+"|"+wrapped+"|"+actionAt(state,128)+"|"+actionAt(state,160));return void
end function
function main(args)
  sizeRow(1024);sizeRow(1025);sizeRow(1048576);sizeRow(1572864);sizeRow(1073741824);sizeRow(1610612736);timeRow(60000);timeRow(61000);timeRow(3600000);timeRow(3661000)
  state=connect.create(false);downloadRow(state,"estimate",8192,2048,1000,3000);downloadRow(state,"rate",8192,4096,1000,3000);downloadRow(state,"unknown",0,8192,1000,3000)
  screenRow(state,"connecting",connect.CA_CONNECTING,4,false,"");screenRow(state,"challenging",connect.CA_CHALLENGING,2,true,"");screenRow(state,"connected",connect.CA_CONNECTED,0,true,"");screenRow(state,"download",connect.CA_CONNECTED,0,true,"pak0.pk3");screenRow(state,"loading",connect.CA_LOADING,0,true,"")
  state.actions=[];connect.keyConnect(state,13);print("key|enter|"+str(actionKind(state,"execute")));connect.keyConnect(state,connect.K_ESCAPE);print("key|escape|"+str(actionKind(state,"execute")));return 0
end function
