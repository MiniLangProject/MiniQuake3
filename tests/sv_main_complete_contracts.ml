// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.main_runtime as main
import mq3.server.connectionless as connectionless
import mq3.server.oob_connect as oob
import mq3.qcommon.message as message
import mq3.shared.info as info
import std.string as strings

struct Context packets prints drops commands now resolutions end struct
function req(value,label) if not value then return error(7349,"sv_main complete: "+label) end if;return 1 end function
function send(host,address,text) host.context.packets=host.context.packets+[[address,text]];return text end function
function say(host,text) host.context.prints=host.context.prints+[text];return void end function
function drop(host,value,reason) host.context.drops=host.context.drops+1;value.state=main.CS_ZOMBIE;return void end function
function runCommand(host,text) host.context.commands=host.context.commands+[text];return "executed "+text+"\n" end function
function millis(host) return host.context.now end function
function resolve(host,name) host.context.resolutions=host.context.resolutions+1;if name=="bad" then return void end if;return oob.address(4,[1,2,3,4],1234) end function
function host()
  value=main.services();value.context=Context([],[],0,[],1000,0);value.sendFn=send;value.printFn=say;value.dropFn=drop;value.executeFn=runCommand;value.millisecondsFn=millis;value.resolveFn=resolve;return value
end function
function wire(text) data=bytes([255,255,255,255])+bytes(text)+bytes([10,0]);msg=message.initStorage(data,len(data),false);msg.cursize=len(data);return msg end function
function responseInfo(text) first=strings.indexOf(text,"\n",0);if first<0 then return "" end if;start=first+1;last=strings.indexOf(text,"\n",start);if last<0 then last=len(bytes(text)) end if;return strings.substr(text,start,last-start) end function
function main(args)
  count=0;h=host();state=main.runtime()
  count=count+req(main.SV_ExpandNewlines("a\nb\n")=="a\\nb\\n","newline expansion")
  long="";for i=0 to 1029 long=long+"x" end for;count=count+req(len(bytes(main.SV_ExpandNewlines(long)))==1021,"newline buffer bound")

  c=main.client(main.CS_ACTIVE,"Ranger",42,7);c.reliableSent=1;c.reliableSequence=3;c.reliableCommands[2]="cs 4 old";c.reliableCommands[3]="print x"
  count=count+req(main.SV_ReplacePendingServerCommands(c,"cs 4 new") and c.reliableCommands[2]=="cs 4 new","pending config replacement")
  count=count+req(not main.SV_ReplacePendingServerCommands(c,"cs 5 no"),"unmatched config retained")
  count=count+req(main.SV_AddServerCommand(h,c,"print y") and c.reliableSequence==4 and c.reliableCommands[4]=="print y","reliable insertion")
  overflow=main.client(main.CS_ACTIVE,"Overflow",0,0);overflow.reliableSequence=64
  count=count+req(not main.SV_AddServerCommand(h,overflow,"last") and h.context.drops==1 and overflow.state==main.CS_ZOMBIE,"overflow drop")

  state.dedicated=1;inactive=main.client(main.CS_CONNECTED,"Waiting",1,0);primed=main.client(main.CS_PRIMED,"Primed",2,0);active=main.client(main.CS_ACTIVE,"Active",3,0);state.clients=[inactive,primed,active]
  count=count+req(main.SV_SendServerCommand(state,h,void,"print \"hello\n\"")==2,"broadcast recipient filter")
  count=count+req(inactive.reliableSequence==0 and primed.reliableSequence==1 and active.reliableSequence==1,"broadcast rings")
  count=count+req(strings.startsWith(h.context.prints[len(h.context.prints)-1],"broadcast: print"),"dedicated broadcast echo")
  count=count+req(main.SV_SendServerCommand(state,h,inactive,"cp one")==1 and inactive.reliableSequence==1,"direct command")

  state=main.runtime();state.dedicated=2;state.time=100;state.masters=[main.master("sv_master1","master.example")]
  count=count+req(main.SV_MasterHeartbeat(state,h)==1 and state.nextHeartbeatTime==300100,"heartbeat send")
  count=count+req(main.SV_MasterHeartbeat(state,h)==0 and h.context.resolutions==1,"heartbeat interval/cache")
  state.time=300100;count=count+req(main.SV_MasterHeartbeat(state,h)==1 and h.context.resolutions==1,"cached master reused")
  state.masters=state.masters+[main.master("sv_master2","bad")];state.time=600100;count=count+req(main.SV_MasterHeartbeat(state,h)==1 and state.masters[1].value=="","failed master cleared")
  packets=len(h.context.packets);count=count+req(main.SV_MasterShutdown(state,h)==2 and len(h.context.packets)==packets+2,"double shutdown heartbeat")

  state=main.runtime();state.clients=[main.client(main.CS_CONNECTED,"One",55,9),main.client(main.CS_FREE,"Hidden",0,0)];state.serverInfo="\\sv_hostname\\Arena\\sv_keywords\\ffa"
  status=main.SVC_Status(state,h,oob.address(4,[5,6,7,8],27960),"token")
  count=count+req(strings.startsWith(status,"statusResponse\n") and info.value(responseInfo(status),"challenge")=="token","status challenge")
  count=count+req(strings.indexOf(status,"9 55 \"One\"\n",0)>=0 and strings.indexOf(status,"Hidden",0)<0,"status players")
  state.restricted=true;status=main.SVC_Status(state,h,oob.address(4,[5,6,7,8],1),"x");count=count+req(info.value(responseInfo(status),"sv_keywords")=="demo ffa","restricted keyword")
  state.gametype=main.GT_SINGLE_PLAYER;count=count+req(main.SVC_Status(state,h,void,"x")=="","single player status suppression")

  state=main.runtime();state.maxClients=3;state.privateClients=1;state.hostname="Arena";state.mapname="q3dm1";state.gametypeValue=3;state.pure=1;state.minPing=20;state.maxPing=200;state.game="osp"
  state.clients=[main.client(main.CS_ACTIVE,"Private",0,0),main.client(main.CS_CONNECTED,"Public",0,0),main.client(main.CS_FREE,"Free",0,0)]
  text=main.SVC_Info(state,h,oob.address(4,[1,1,1,1],1),"abc")
  count=count+req(strings.startsWith(text,"infoResponse\n") and info.value(responseInfo(text),"challenge")=="abc","info response/challenge")
  count=count+req(info.value(responseInfo(text),"clients")=="1" and info.value(responseInfo(text),"sv_maxclients")=="2","private slots excluded")
  count=count+req(info.value(responseInfo(text),"hostname")=="Arena" and info.value(responseInfo(text),"mapname")=="q3dm1" and info.value(responseInfo(text),"minPing")=="20" and info.value(responseInfo(text),"game")=="osp","info fields")
  state.uiSinglePlayerActive=true;count=count+req(main.SVC_Info(state,h,void,"x")=="","ui single-player suppression")

  state=main.runtime();state.redirectAddress=oob.address(4,[9,9,9,9],1);count=count+req(main.SV_FlushRedirect(state,h,"hello")=="print\nhello","redirect packet")
  state.rconPassword="pw";h.context.now=1000;result=main.SVC_RemoteCommand(state,h,state.redirectAddress,"rcon pw  status  all",["rcon","pw","status","all"])
  count=count+req(result=="executed status  all\n" and h.context.commands[len(h.context.commands)-1]=="status  all","rcon raw tail")
  count=count+req(main.SVC_RemoteCommand(state,h,state.redirectAddress,"rcon pw x",["rcon","pw","x"])=="throttled","rcon throttle")
  h.context.now=1500;count=count+req(main.SVC_RemoteCommand(state,h,state.redirectAddress,"rcon bad x",["rcon","bad","x"])=="Bad rconpassword.\n","bad password")
  state.rconPassword="";h.context.now=2000;count=count+req(main.SVC_RemoteCommand(state,h,state.redirectAddress,"rcon x y",["rcon","x","y"])=="No rconpassword set on the server.\n","unset password")

  state=main.runtime();state.maxClients=1;state.hostname="Bound";state.mapname="q3dm1";state.clients=[main.client(main.CS_ACTIVE,"Player",11,2)];runtime=oob.create(1,oob.config());bound=main.connectionlessServices(state,h);address=oob.address(4,[127,0,0,1],27960)
  count=count+req(connectionless.dispatch(runtime,bound,address,wire("getinfo probe"))=="getinfo" and strings.startsWith(h.context.packets[len(h.context.packets)-1][1],"infoResponse\n"),"productive getinfo binding")
  count=count+req(connectionless.dispatch(runtime,bound,address,wire("getstatus probe"))=="getstatus" and strings.startsWith(h.context.packets[len(h.context.packets)-1][1],"statusResponse\n"),"productive getstatus binding")
  print("PASS: "+str(count)+" sv_main complete contracts");return 0
end function
