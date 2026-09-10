// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.packet_event as packetEvent
import mq3.client.connectionless as connectionless
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.compat.numeric as numeric
struct Context events processAccept processHeader clearWaiting demoHeader end struct
function mark(context,text) context.events=context.events+text;return void end function
function diagnostic(host,state,line) mark(host.context,"O") end function
function process(host,state,msg) mark(host.context,"N");if not host.context.processAccept then return false end if;msg.readcount=host.context.processHeader;msg.bit=msg.readcount*8;return true end function
function parse(host,state,msg) mark(host.context,"P");msg.readcount=99;if host.context.clearWaiting then state.demoWaiting=false end if;return void end function
function recordDemo(host,state,msg,headerBytes) mark(host.context,"D");host.context.demoHeader=headerBytes;return void end function
function adr(last,port) return net.Address(4,[1,2,3,last],port) end function
function flag(value) if value then return 1 end if;return 0 end function
function hex(data) digits=bytes("0123456789abcdef");result="";if len(data)>0 then for each value in data result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for end if;return result end function
function run(label,stateValue,size,oob,same,accept,recording,waiting,clear,sequence,header)
  connection=connectionless.create(adr(4,27960));connection.connectionState=stateValue;connection.channel=net.setup(net.NS_CLIENT,connection.serverAddress,0)
  state=packetEvent.create(connection);state.realtime=777;state.demoRecording=recording;state.demoWaiting=waiting
  context=Context("",accept,header,clear,-1);oobHost=connectionless.services();oobHost.context=context;oobHost.diagnosticFn=diagnostic;host=packetEvent.services(oobHost);host.context=context;host.processFn=process;host.parseFn=parse;host.demoFn=recordDemo
  data=bytes(64,0)
  if oob then data[0]=255;data[1]=255;data[2]=255;data[3]=255;raw=bytes("wat");for i=0 to 2 data[i+4]=raw[i] end for else numeric.writeU32(data,0,sequence);if size>4 then for i=4 to size-1 data[i]=(i*17+3)&255 end for end if end if
  msg=message.initStorage(data,64,true);msg.cursize=size;source=adr(4,27960);if not same then source=adr(9,27960) end if
  packetEvent.packetEvent(state,host,source,msg)
  print label+"|"+hex(slice(msg.data,0,size))+"|"+str(state.connection.lastPacketTime)+"|"+str(state.serverMessageSequence)+"|"+str(flag(state.demoWaiting))+"|"+str(msg.readcount)+"|"+context.events+"|"+str(context.demoHeader)
  return void
end function
function main(args)
 run("oob",1,8,true,false,false,false,false,false,0,6);run("disconnected",3,8,false,true,true,false,false,false,4,6);run("runt",5,3,false,true,true,false,false,false,4,6);run("wrong",5,8,false,false,true,false,false,false,4,6);run("reject",5,8,false,true,false,false,false,false,4,6);run("success",5,12,false,true,true,false,false,false,0x12345678,6);run("waiting",8,12,false,true,true,true,true,false,9,6);run("record",8,12,false,true,true,true,true,true,10,6);run("negative",8,12,false,true,true,true,false,false,-7,4);return 0
end function
