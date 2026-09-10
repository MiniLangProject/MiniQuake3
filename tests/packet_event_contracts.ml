// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.packet_event as packetEvent
import mq3.client.connectionless as connectionless
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.compat.numeric as numeric
struct Context processCount parseCount demoCount demoHeader accept clearWaiting oobCount end struct
function req(value,label) if not value then return error(6990,"packet event: "+label) end if;return 1 end function
function diagnostic(host,state,line) host.context.oobCount=host.context.oobCount+1 end function
function process(host,state,msg) host.context.processCount=host.context.processCount+1;if not host.context.accept then return false end if;msg.readcount=6;msg.bit=48;return true end function
function parse(host,state,msg) host.context.parseCount=host.context.parseCount+1;msg.readcount=77;if host.context.clearWaiting then state.demoWaiting=false end if end function
function demo(host,state,msg,header) host.context.demoCount=host.context.demoCount+1;host.context.demoHeader=header end function
function adr(last,port) return net.Address(4,[1,2,3,last],port) end function
function fixture(stateValue)
 con=connectionless.create(adr(4,27960));con.connectionState=stateValue;con.channel=net.setup(net.NS_CLIENT,con.serverAddress,0);state=packetEvent.create(con);state.realtime=900
 context=Context(0,0,0,-1,true,false,0);oobHost=connectionless.services();oobHost.context=context;oobHost.diagnosticFn=diagnostic;host=packetEvent.services(oobHost);host.context=context;host.processFn=process;host.parseFn=parse;host.demoFn=demo;return [state,host,context]
end function
function wire(sequence,size,oob)
 data=bytes(64,0);if oob then data[0]=255;data[1]=255;data[2]=255;data[3]=255;raw=bytes("wat");data[4]=raw[0];data[5]=raw[1];data[6]=raw[2] else numeric.writeU32(data,0,sequence);if size>4 then for i=4 to size-1 data[i]=(i*11+1)&255 end for end if end if
 msg=message.initStorage(data,64,true);msg.cursize=size;return msg
end function
function main(args)
 count=0;count=count+req(try(packetEvent.create(void)) is error,"connection required")
 f=fixture(connectionless.CA_CONNECTED);state=f[0];host=f[1];context=f[2];count=count+req(state.serverMessageSequence==0 and not state.demoRecording,"initial state")
 msg=wire(0,8,true);count=count+req(packetEvent.isOob(msg),"oob marker")
 result=packetEvent.packetEvent(state,host,adr(9,1),msg);count=count+req(result=="oob" and state.connection.lastPacketTime==900,"oob updates time before dispatch")
 count=count+req(context.oobCount==1 and context.processCount==0,"oob connectionless dispatch")
 f=fixture(connectionless.CA_CONNECTING);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(4,8,false));count=count+req(result=="disconnected" and f[0].connection.lastPacketTime==900,"pre-connected packet ignored after timestamp")
 f=fixture(connectionless.CA_CONNECTED);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(4,3,false));count=count+req(result=="runt" and f[0].connection.lastPacketTime==900,"runt packet")
 f=fixture(connectionless.CA_CONNECTED);result=packetEvent.packetEvent(f[0],f[1],adr(9,27960),wire(4,8,false));count=count+req(result=="wrongAddress" and f[2].processCount==0,"wrong ip rejected")
 f=fixture(connectionless.CA_CONNECTED);result=packetEvent.packetEvent(f[0],f[1],adr(4,27961),wire(4,8,false));count=count+req(result=="wrongAddress","wrong port rejected")
 f=fixture(connectionless.CA_CONNECTED);f[2].accept=false;result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(4,8,false));count=count+req(result=="rejected" and f[2].processCount==1 and f[2].parseCount==0,"netchan rejection")
 f=fixture(connectionless.CA_CONNECTED);msg=wire(0x12345678,12,false);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),msg);count=count+req(result=="sequenced" and f[2].processCount==1,"netchan success")
 count=count+req(f[0].serverMessageSequence==0x12345678,"raw little endian sequence")
 count=count+req(f[0].connection.lastPacketTime==900,"sequenced timestamp")
 count=count+req(f[2].parseCount==1 and msg.readcount==77,"server message callback")
 f=fixture(connectionless.CA_ACTIVE);f[0].demoRecording=true;f[0].demoWaiting=true;packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(9,12,false));count=count+req(f[2].demoCount==0,"demo waiting suppresses recording")
 f=fixture(connectionless.CA_ACTIVE);f[0].demoRecording=true;f[0].demoWaiting=true;f[2].clearWaiting=true;packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(10,12,false));count=count+req(f[2].demoCount==1 and not f[0].demoWaiting,"post-parse demo decision")
 count=count+req(f[2].demoHeader==6,"header captured before parser")
 f=fixture(connectionless.CA_ACTIVE);packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(-7,12,false));count=count+req(f[0].serverMessageSequence==-7 and f[2].demoCount==0,"signed sequence and recording disabled")
 f=fixture(connectionless.CA_CONNECTED);f[1].processFn=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(1,8,false))) is error,"process service required")
 f=fixture(connectionless.CA_CONNECTED);f[1].parseFn=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(1,8,false))) is error,"parse service required")
 f=fixture(connectionless.CA_ACTIVE);f[0].demoRecording=true;f[1].demoFn=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(1,8,false))) is error,"demo service required when recording")
 f=fixture(connectionless.CA_CONNECTED);f[1].connectionlessHost=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(0,8,true))) is error,"oob service required")
 count=count+req(try(packetEvent.packetEvent(void,host,adr(4,27960),wire(1,8,false))) is error,"state required")
 print "PASS: "+str(count)+" packet-event contracts";return 0
end function
