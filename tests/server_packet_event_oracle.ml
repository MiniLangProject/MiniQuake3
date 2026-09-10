// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.packet_event as packetEvent
import mq3.server.connectionless as connectionless
import mq3.server.netchan as serverNet
import mq3.server.oob_connect as oobConnect
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.compat.numeric as numeric
struct Context events accept header end struct
function mark(host,text) host.context.events=host.context.events+text end function
function diagnostic(host,candidate,source) mark(host,"F") end function
function oobDiagnostic(host,source,text) host.context.events=host.context.events+"O" end function
function process(host,candidate,msg) mark(host,"N");if not host.context.accept then return false end if;msg.readcount=host.context.header;msg.bit=msg.readcount*8;return true end function
function executeClient(host,candidate,msg) mark(host,"E") end function
function disconnect(host,source,text) mark(host,"D") end function
function adr(last,port) return net.Address(4,[1,2,3,last],port) end function
function makeClient(state,last,port,qport,time) c=packetEvent.client(state,serverNet.client(0,net.setup(net.NS_SERVER,adr(last,port),qport)));c.lastPacketTime=time;return c end function
function fixture() context=Context("",true,6);oobRuntime=oobConnect.create(3,oobConnect.config());oobHost=connectionless.services();oobHost.context=context;oobHost.diagnosticFn=oobDiagnostic;host=packetEvent.services(oobRuntime,oobHost);host.context=context;host.processFn=process;host.executeFn=executeClient;host.disconnectFn=disconnect;host.diagnosticFn=diagnostic;state=packetEvent.runtime([packetEvent.client(packetEvent.CS_FREE,serverNet.client(0,net.setup(net.NS_SERVER,adr(0,0),0))),packetEvent.client(packetEvent.CS_FREE,serverNet.client(0,net.setup(net.NS_SERVER,adr(0,0),0))),packetEvent.client(packetEvent.CS_FREE,serverNet.client(0,net.setup(net.NS_SERVER,adr(0,0),0)))]);state.time=777;return [state,host,context] end function
function setclient(state,index,value) state.clients[index]=value end function
function wire(size,oob,qport) data=bytes(64,0);numeric.writeU32(data,0,4);if size>=6 then net.writeShort(data,4,qport) end if;if oob then for i=0 to 3 data[i]=255 end for;raw=bytes("wat");for i=0 to 2 data[i+4]=raw[i] end for end if;if size>6 and not oob then for i=6 to size-1 data[i]=(i*13+1)&255 end for end if;msg=message.initStorage(data,64,true);msg.cursize=size;return msg end function
function line(label,state,host,msg) result=label+"|"+host.context.events+"|"+str(msg.readcount)+"|"+str(msg.bit);for each c in state.clients result=result+"|"+str(c.state)+","+str(c.netchan.channel.remoteAddress.port)+","+str(c.lastPacketTime) end for;print result end function
function run(label,size,oob,fromLast,fromPort,qport,kind)
 f=fixture();state=f[0];host=f[1];context=f[2]
 if kind==1 then setclient(state,0,makeClient(2,4,27960,1234,10)) end if
 if kind==2 then setclient(state,0,makeClient(packetEvent.CS_ZOMBIE,4,27960,1234,10)) end if
 if kind==3 then setclient(state,0,makeClient(packetEvent.CS_FREE,4,27960,1234,10)) end if
 if kind==4 then setclient(state,0,makeClient(2,4,27960,111,10));setclient(state,1,makeClient(2,4,27961,222,11)) end if
 if label=="reject" then context.accept=false end if
 msg=wire(size,oob,qport);packetEvent.packetEvent(state,host,adr(fromLast,fromPort),msg);line(label,state,host,msg)
end function
function main(args)
 run("oob",8,true,9,30000,0,1);run("ok",12,false,4,27960,1234,1);run("translated",12,false,4,30000,1234,1);run("reject",12,false,4,27960,1234,1);run("zombie",12,false,4,27960,1234,2);run("free",12,false,4,27960,1234,3);run("wrongip",12,false,9,27960,1234,1);run("wrongqport",12,false,4,27960,4321,1);run("second",12,false,4,30000,222,4);run("runt",3,false,4,27960,1234,1);return 0
end function
