// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.main_runtime as main
import mq3.server.oob_connect as oob

struct Context packets prints drops commands now resolves end struct
function send(host,address,text) host.context.packets=host.context.packets+[text];return void end function
function say(host,text) host.context.prints=host.context.prints+[text];return void end function
function drop(host,value,reason) host.context.drops=host.context.drops+1;value.state=main.CS_ZOMBIE;return void end function
function executeCommand(host,text) host.context.commands=host.context.commands+[text];return "executed\n" end function
function millis(host) return host.context.now end function
function resolve(host,name) host.context.resolves=host.context.resolves+1;if name=="bad" then return void end if;return oob.address(4,[1,2,3,4],1234) end function
function setup()
  host=main.services();host.context=Context([],[],0,[],1000,0);host.sendFn=send;host.printFn=say;host.dropFn=drop;host.executeFn=executeCommand;host.millisecondsFn=millis;host.resolveFn=resolve;return host
end function
function hexText(text) raw=bytes(text);digits=bytes("0123456789abcdef");result="";for each value in raw result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for;return result end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  h=setup();expanded=main.SV_ExpandNewlines("a\nb\n");print("expand|"+hexText(expanded));long="";for i=0 to 1098 long=long+"x" end for;expanded=main.SV_ExpandNewlines(long);print("expandlong|"+str(len(bytes(expanded))))
  h=setup();c=main.client(main.CS_FREE,"",0,0);c.reliableSent=1;c.reliableSequence=3;c.reliableCommands[2]="cs 4 old";c.reliableCommands[3]="print x";first=main.SV_ReplacePendingServerCommands(c,"cs 4 new");second=main.SV_ReplacePendingServerCommands(c,"cs 5 no");print("replace|"+str(flag(first))+"|"+str(flag(second))+"|"+hexText(c.reliableCommands[2]))
  h=setup();c=main.client(main.CS_ACTIVE,"",0,0);main.SV_AddServerCommand(h,c,"one");text="add|"+str(c.reliableSequence)+"|"+hexText(c.reliableCommands[1]);overflow=main.client(main.CS_FREE,"",0,0);overflow.reliableSequence=64;main.SV_AddServerCommand(h,overflow,"last");print(text+"|"+str(overflow.reliableSequence)+"|"+str(h.context.drops))
  h=setup();state=main.runtime();state.maxClients=3;state.dedicated=1;c0=main.client(main.CS_CONNECTED,"",0,0);c1=main.client(main.CS_PRIMED,"",0,0);c2=main.client(main.CS_ACTIVE,"",0,0);state.clients=[c0,c1,c2];main.SV_SendServerCommand(state,h,void,"print \"hello\n\"");print("send|"+str(c0.reliableSequence)+"|"+str(c1.reliableSequence)+"|"+str(c2.reliableSequence)+"|"+hexText(h.context.prints[0]))
  h=setup();state=main.runtime();state.dedicated=2;state.time=100;state.masters=[main.master("sv_master1","master.example")];main.SV_MasterHeartbeat(state,h);text="heart|"+str(len(h.context.packets));main.SV_MasterHeartbeat(state,h);print(text+"|"+str(len(h.context.packets))+"|"+str(h.context.resolves)+"|"+str(state.nextHeartbeatTime)+"|0");state.time=300100;main.SV_MasterHeartbeat(state,h);print("heart2|"+str(len(h.context.packets))+"|"+str(h.context.resolves));main.SV_MasterShutdown(state,h);print("shutdown|"+str(len(h.context.packets)))
  h=setup();state=main.runtime();state.maxClients=2;state.clients=[main.client(main.CS_CONNECTED,"One",55,9),main.client(main.CS_FREE,"",0,0)];state.serverInfo="\\sv_hostname\\Arena\\sv_keywords\\ffa";main.SVC_Status(state,h,oob.address(4,[9,8,7,6],27960),"token");print("status|"+hexText(h.context.packets[0]))
  h=setup();state=main.runtime();state.maxClients=3;state.privateClients=1;state.clients=[main.client(main.CS_CONNECTED,"",0,0),main.client(main.CS_CONNECTED,"",0,0),main.client(main.CS_FREE,"",0,0)];state.hostname="Arena";state.mapname="q3dm1";state.gametypeValue=3;state.pure=1;state.minPing=20;state.maxPing=200;state.game="osp";main.SVC_Info(state,h,oob.address(4,[9,8,7,6],27960),"abc");print("info|"+hexText(h.context.packets[0]))
  h=setup();state=main.runtime();state.redirectAddress=oob.address(4,[9,8,7,6],27960);main.SV_FlushRedirect(state,h,"hello");print("flush|"+hexText(h.context.packets[0]))
  h=setup();state=main.runtime();state.rconPassword="pw";address=oob.address(4,[9,8,7,6],27960);main.SVC_RemoteCommand(state,h,address,"rcon pw  status  all",["rcon","pw","status","all"]);print("rcon|"+h.context.commands[0]+"|"+hexText(h.context.packets[0]));main.SVC_RemoteCommand(state,h,address,"rcon pw x",["rcon","pw","x"]);print("throttle|"+str(len(h.context.packets)));h.context.now=1500;main.SVC_RemoteCommand(state,h,address,"rcon bad x",["rcon","bad","x"]);print("bad|"+hexText(h.context.packets[1]));return 0
end function
