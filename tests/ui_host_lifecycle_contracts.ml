import mq3.client.ui_host_lifecycle as host
import mq3.compat.numeric as n

struct Context fullscreen catcher events end struct
function fullscreen(c) c.events=c.events+[["fullscreen"]];return c.fullscreen end function
function refresh(c,time) c.events=c.events+[["refresh",time]];return 0 end function
function menu(c,value) c.events=c.events+[["menu",value]];c.catcher=c.catcher|host.KEYCATCH_UI;return 0 end function
function connect(c,overlay) c.events=c.events+[["connect",overlay]];return 0 end function
function cgame(c) c.events=c.events+[["cgame"]];return 0 end function
function cinematic(c) c.events=c.events+[["cinematic"]];return 0 end function
function catcher(c) return c.catcher end function
function setCatcher(c,value) c.catcher=value;c.events=c.events+[["catcher",value]];return 0 end function
function req(ok,message) if not ok then return error(3461,message) end if;return 1 end function
function fixed(data,offset)
  result=[];index=0;while index<host.MAX_STRING_CHARS and data[offset+index]!=0 result=result+[data[offset+index]];index=index+1 end while;return decode(bytes(result))
end function
function draw(context,state,time)
  configured=host.services(context,fullscreen,refresh,menu,connect,cgame,cinematic,catcher);return host.drawScreen(configured,state,time)
end function

function main(args)
  count=0
  value=host.createClientState(host.CA_CHALLENGING,7,3,"127.0.0.1:27960","motd\\ready","Awaiting challenge")
  data=host.encodeClientState(value)
  count=count+req(not (data is error) and len(data)==3084,"exact uiClientState_t size")
  count=count+req(n.readU32(data,0)==host.CA_CHALLENGING and n.readU32(data,4)==7 and n.readU32(data,8)==3,"three leading ABI integers")
  count=count+req(fixed(data,12)=="127.0.0.1:27960" and fixed(data,1036)=="motd\\ready" and fixed(data,2060)=="Awaiting challenge","fixed client-state strings")
  long="";for index=0 to 1099 long=long+"x" end for;truncated=host.encodeClientState(host.createClientState(host.CA_CONNECTED,0,-1,long,long,long))
  count=count+req(truncated[12+1022]==120 and truncated[12+1023]==0 and truncated[1036+1023]==0 and truncated[2060+1023]==0,"Q_strncpyz termination")
  count=count+req(host.connecting(host.CA_AUTHORIZING)==1 and host.connecting(host.CA_PRIMED)==1 and host.connecting(host.CA_DISCONNECTED)==0 and host.connecting(host.CA_ACTIVE)==0,"CL_InitUI connecting range")
  count=count+req(try(host.createClientState(10,0,0,"","","")) is error,"invalid client connection state rejected")

  context=Context(false,0,[]);frame=draw(context,host.CA_DISCONNECTED,100)
  count=count+req(frame.menuCalls==1 and frame.refreshCalls==1 and context.events==[["fullscreen"],["menu",host.UIMENU_MAIN],["refresh",100]],"disconnected forces and draws main menu")
  context=Context(false,0,[]);frame=draw(context,host.CA_CONNECTING,101)
  count=count+req(frame.refreshCalls==1 and frame.connectCalls==1 and not frame.overlay and context.events==[["fullscreen"],["refresh",101],["connect",false]],"connecting dialog order")
  context=Context(false,host.KEYCATCH_UI,[]);frame=draw(context,host.CA_CHALLENGING,102)
  count=count+req(frame.refreshCalls==2 and frame.connectCalls==1,"active menu refresh follows challenging dialog")
  context=Context(false,0,[]);frame=draw(context,host.CA_CONNECTED,103)
  count=count+req(frame.refreshCalls==1 and context.events[2]==["connect",false],"connected dialog")
  context=Context(false,0,[]);frame=draw(context,host.CA_LOADING,104)
  count=count+req(frame.cgameFrames==1 and frame.connectCalls==1 and frame.overlay and context.events==[["fullscreen"],["cgame"],["refresh",104],["connect",true]],"loading overlay after cgame")
  context=Context(false,host.KEYCATCH_UI,[]);frame=draw(context,host.CA_PRIMED,105)
  count=count+req(frame.cgameFrames==1 and frame.refreshCalls==2 and frame.overlay,"primed overlay and menu refresh")
  context=Context(false,0,[]);frame=draw(context,host.CA_ACTIVE,106)
  count=count+req(frame.cgameFrames==1 and frame.refreshCalls==0 and context.events==[["fullscreen"],["cgame"]],"active cgame only")
  context=Context(false,host.KEYCATCH_UI,[]);frame=draw(context,host.CA_ACTIVE,107)
  count=count+req(frame.cgameFrames==1 and frame.refreshCalls==1,"active menu draws over cgame")
  context=Context(false,0,[]);frame=draw(context,host.CA_CINEMATIC,108)
  count=count+req(frame.cinematicFrames==1 and context.events==[["fullscreen"],["cinematic"]],"cinematic delegation")
  context=Context(true,host.KEYCATCH_UI,[]);frame=draw(context,host.CA_LOADING,109)
  count=count+req(frame.fullscreen and frame.cgameFrames==0 and frame.connectCalls==0 and frame.refreshCalls==1 and context.events==[["fullscreen"],["refresh",109]],"fullscreen menu suppresses world and overlay")
  count=count+req(try(draw(Context(false,0,[]),host.CA_AUTHORIZING,110)) is error and try(draw(Context(false,0,[]),host.CA_UNINITIALIZED,110)) is error,"undrawable transient states rejected")
  count=count+req(try(draw(Context(false,0,[]),host.CA_ACTIVE,-1)) is error,"negative realtime rejected")
  context=Context(false,15,[]);cleared=host.clearUiCatcher(context,catcher,setCatcher)
  count=count+req(not (cleared is error) and context.catcher==13 and context.events==[["catcher",13]],"shutdown clears shared UI catcher only")
  count=count+req(try(host.drawScreen(host.services(context,void,refresh,menu,connect,cgame,cinematic,catcher),host.CA_ACTIVE,0)) is error,"incomplete draw services rejected")
  print("PASS: "+str(count)+" UI host lifecycle contracts");return 0
end function
