// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.packet_event as packetEvent
import mq3.server.connectionless as connectionless
import mq3.server.netchan as serverNet
import mq3.server.oob_connect as oobConnect
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.compat.numeric as numeric
struct Context processCount executeCount disconnectCount diagnosticCount accept end struct
function req(value,label) if not value then return error(7000,"server packet event: "+label) end if;return 1 end function
function adr(last,port) return net.Address(4,[1,2,3,last],port) end function
function makeClient(state,last,port,qport) return packetEvent.client(state,serverNet.client(0x44,net.setup(net.NS_SERVER,adr(last,port),qport))) end function
function process(host,candidate,msg) host.context.processCount=host.context.processCount+1;if not host.context.accept then return false end if;msg.readcount=6;msg.bit=48;return true end function
function executeClient(host,candidate,msg) host.context.executeCount=host.context.executeCount+1 end function
function disconnect(host,source,text) host.context.disconnectCount=host.context.disconnectCount+1 end function
function diagnostic(host,candidate,source) host.context.diagnosticCount=host.context.diagnosticCount+1 end function
function oobDiagnostic(host,source,text) host.context.disconnectCount=host.context.disconnectCount+1 end function
function fixture()
 context=Context(0,0,0,0,true);oobRuntime=oobConnect.create(2,oobConnect.config());oobHost=connectionless.services();oobHost.context=context;oobHost.diagnosticFn=oobDiagnostic
 host=packetEvent.services(oobRuntime,oobHost);host.context=context;host.processFn=process;host.executeFn=executeClient;host.disconnectFn=disconnect;host.diagnosticFn=diagnostic
 state=packetEvent.runtime([makeClient(packetEvent.CS_FREE,0,0,0),makeClient(packetEvent.CS_FREE,0,0,0)]);state.time=901;return [state,host,context]
end function
function wire(sequence,qport,size,oob)
 data=bytes(64,0);if size>=4 then numeric.writeU32(data,0,sequence) end if;if size>=6 then net.writeShort(data,4,qport) end if
 if oob then for i=0 to 3 data[i]=255 end for;raw=bytes("wat");if size>=7 then for i=0 to 2 data[i+4]=raw[i] end for end if end if
 msg=message.initStorage(data,64,true);msg.cursize=size;return msg
end function
function main(args)
 count=0
 count=count+req(packetEvent.sameBase(adr(4,1),adr(4,2)),"base address ignores port")
 count=count+req(not packetEvent.sameBase(adr(4,1),adr(9,1)),"base address checks IP")
 count=count+req(not packetEvent.sameBase(void,adr(4,1)),"missing address differs")
 count=count+req(packetEvent.sameBase(net.Address(2,[],1),net.Address(2,[],2)),"loopback address matches")
 count=count+req(not packetEvent.sameBase(net.Address(3,[],1),net.Address(3,[],1)),"unsupported address type differs")
 count=count+req(packetEvent.isOob(wire(-1,0,7,true)),"OOB marker")
 count=count+req(not packetEvent.isOob(wire(-1,0,3,false)),"short packet is not OOB")
 f=fixture();f[0].clients[0]=makeClient(2,4,27960,1234);msg=wire(5,1234,12,false);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),msg)
 count=count+req(result=="accepted" and f[2].processCount==1,"matching client processed")
 count=count+req(f[2].executeCount==1 and f[0].clients[0].lastPacketTime==901,"accepted client executes and refreshes timeout")
 count=count+req(msg.readcount==6 and msg.bit==48,"process cursor retained")
 f=fixture();f[0].clients[0]=makeClient(2,4,27960,1234);f[2].accept=false;result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(5,1234,12,false))
 count=count+req(result=="rejected" and f[2].executeCount==0,"rejected sequence does not execute")
 count=count+req(f[0].clients[0].lastPacketTime==0,"rejected sequence does not refresh timeout")
 f=fixture();f[0].clients[0]=makeClient(packetEvent.CS_ZOMBIE,4,27960,1234);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(5,1234,12,false))
 count=count+req(result=="accepted" and f[2].processCount==1,"zombie still advances netchan")
 count=count+req(f[2].executeCount==0 and f[0].clients[0].lastPacketTime==0,"zombie suppresses message execution")
 f=fixture();f[0].clients[0]=makeClient(2,4,27960,1234);result=packetEvent.packetEvent(f[0],f[1],adr(4,30000),wire(5,1234,12,false))
 count=count+req(result=="accepted" and f[0].clients[0].netchan.channel.remoteAddress.port==30000,"translated UDP port repaired")
 count=count+req(f[2].diagnosticCount==1,"translated port diagnosed")
 f=fixture();f[0].clients[0]=makeClient(2,4,27960,111);f[0].clients[1]=makeClient(2,4,27961,222);packetEvent.packetEvent(f[0],f[1],adr(4,30000),wire(5,222,12,false))
 count=count+req(f[0].clients[0].lastPacketTime==0 and f[0].clients[1].lastPacketTime==901,"qport selects client behind shared IP")
 f=fixture();f[0].clients[0]=makeClient(2,4,27960,1234);result=packetEvent.packetEvent(f[0],f[1],adr(9,27960),wire(5,1234,12,false))
 count=count+req(result=="unknown" and f[2].disconnectCount==1,"unknown address receives disconnect")
 f=fixture();f[0].clients[0]=makeClient(2,4,27960,1234);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(5,4321,12,false))
 count=count+req(result=="unknown" and f[2].processCount==0,"wrong qport is unknown")
 f=fixture();result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(0,0,3,false));count=count+req(result=="unknown" and f[2].disconnectCount==1,"runt follows unknown sender path")
 f=fixture();result=packetEvent.packetEvent(f[0],f[1],adr(9,1),wire(-1,0,7,true));count=count+req(result=="oob" and f[2].disconnectCount==1,"OOB dispatched before client lookup")
 f=fixture();f[0].clients[0]=makeClient(packetEvent.CS_FREE,4,27960,1234);result=packetEvent.packetEvent(f[0],f[1],adr(4,27960),wire(5,1234,12,false));count=count+req(result=="unknown","free client skipped")
 f=fixture();f[1].disconnectFn=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,1),wire(1,2,6,false))) is error,"disconnect service required")
 f=fixture();f[0].clients[0]=makeClient(2,4,1,2);f[1].processFn=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,1),wire(1,2,6,false))) is error,"process service required")
 f=fixture();f[0].clients[0]=makeClient(2,4,1,2);f[1].executeFn=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,1),wire(1,2,6,false))) is error,"execute service required")
 f=fixture();f[1].connectionlessHost=void;count=count+req(try(packetEvent.packetEvent(f[0],f[1],adr(4,1),wire(-1,0,7,true))) is error,"connectionless service required")
 count=count+req(try(packetEvent.packetEvent(void,fixture()[1],adr(4,1),wire(1,2,6,false))) is error,"runtime required")
 // Exercise the concrete SV_Netchan_Process binding with a valid unfragmented sequence.
 f=fixture();f[0].clients[0]=makeClient(packetEvent.CS_ZOMBIE,4,1,2);f[1].processFn=packetEvent.processNetchan;msg=wire(1,2,18,false);result=packetEvent.packetEvent(f[0],f[1],adr(4,1),msg)
 count=count+req(result=="accepted" and f[0].clients[0].netchan.channel.incomingSequence==1,"concrete server netchan adapter")
 print "PASS: "+str(count)+" server-packet-event contracts";return 0
end function
