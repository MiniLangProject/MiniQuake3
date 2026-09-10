// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.netchan as net
struct Context packet end struct
function sendPacket(runtime,sock,data,address) runtime.context.packet=data;return void end function
function payload(count) result=bytes(count,0);if count>0 then for index=0 to count-1 result[index]=(index*37+11)&255 end for end if;return result end function
function flag(value) if value then return 1 end if;return 0 end function
function hex(data) digits=bytes("0123456789abcdef");result="";if len(data)>0 then for each value in data result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for end if;return result end function
function packet(sequence,fragmented,qport,start,claimed,body,serverInput) header=4;if serverInput then header=header+2 end if;if fragmented then header=header+4 end if;result=bytes(header+len(body),0);value=sequence;if fragmented then value=value|net.FRAGMENT_BIT end if;net.writeLong(result,0,value);offset=4;if serverInput then net.writeShort(result,offset,qport);offset=offset+2 end if;if fragmented then net.writeShort(result,offset,start);net.writeShort(result,offset+2,claimed) end if;if len(body)>0 then for index=0 to len(body)-1 result[header+index]=body[index] end for end if;return result end function
function tx(label,runtime,channel) data=runtime.context.packet;print "T|"+label+"|"+str(len(data))+"|"+str(channel.outgoingSequence)+"|"+str(flag(channel.unsentFragments))+"|"+str(channel.unsentFragmentStart)+"|"+str(channel.unsentLength)+"|"+hex(data);return void end function
function pc(label,channel,data,maxsize) result=net.process(channel,data,maxsize);print "P|"+label+"|"+str(flag(result.accepted))+"|"+str(result.cursize)+"|"+str(result.readcount)+"|"+str(result.bit)+"|"+str(channel.incomingSequence)+"|"+str(channel.dropped)+"|"+str(channel.fragmentLength)+"|"+hex(result.data);return void end function
function main(args)
 runtime=net.init(70000);runtime.context=Context(bytes(0,0));runtime.sendPacketFn=sendPacket;print "I|"+str(runtime.qport);address=net.Address(2,[127,0,0,1],27960);channel=net.setup(net.NS_CLIENT,address,123);print "S|"+str(channel.sock)+"|"+str(channel.dropped)+"|"+str(channel.qport)+"|"+str(channel.incomingSequence)+"|"+str(channel.outgoingSequence)
 net.transmit(runtime,channel,payload(3));tx("client3",runtime,channel);channel=net.setup(net.NS_SERVER,address,0);net.transmit(runtime,channel,bytes(0,0));tx("server0",runtime,channel)
 channel=net.setup(net.NS_CLIENT,address,0);net.transmit(runtime,channel,payload(1300));tx("exact1",runtime,channel);net.transmitNextFragment(runtime,channel);tx("exact0",runtime,channel)
 channel=net.setup(net.NS_SERVER,address,0);net.transmit(runtime,channel,payload(1301));tx("short1",runtime,channel);net.transmitNextFragment(runtime,channel);tx("short2",runtime,channel)
 channel=net.setup(net.NS_CLIENT,address,0);pc("plain",channel,packet(1,false,0,0,0,payload(4),false),net.MAX_MSGLEN);pc("duplicate",channel,packet(1,false,0,0,0,payload(1),false),net.MAX_MSGLEN);pc("dropped",channel,packet(4,false,0,0,0,payload(1),false),net.MAX_MSGLEN)
 channel=net.setup(net.NS_SERVER,address,0);pc("frag1",channel,packet(7,true,123,0,1300,payload(1300),true),net.MAX_MSGLEN);pc("frag2",channel,packet(7,true,123,1300,2,payload(2),true),net.MAX_MSGLEN)
 channel=net.setup(net.NS_SERVER,address,0);pc("gap",channel,packet(2,true,0,3,1,payload(1),true),net.MAX_MSGLEN);pc("truncated",channel,packet(2,true,0,0,2,payload(1),true),net.MAX_MSGLEN)
 channel=net.setup(net.NS_CLIENT,address,0);pc("exact_recv_data",channel,packet(8,true,0,0,1300,payload(1300),false),net.MAX_MSGLEN);pc("exact_recv_zero",channel,packet(8,true,0,1300,0,bytes(0,0),false),net.MAX_MSGLEN)
 channel=net.setup(net.NS_CLIENT,address,0);pc("newseq_old",channel,packet(9,true,0,0,1300,payload(1300),false),net.MAX_MSGLEN);pc("newseq_reset",channel,packet(10,true,0,0,1,payload(1),false),net.MAX_MSGLEN)
 channel=net.setup(net.NS_CLIENT,address,0);pc("retry_first",channel,packet(11,true,0,0,1300,payload(1300),false),net.MAX_MSGLEN);pc("retry_gap",channel,packet(11,true,0,1301,1,payload(1),false),net.MAX_MSGLEN);pc("retry_ok",channel,packet(11,true,0,1300,1,payload(1),false),net.MAX_MSGLEN)
 channel=net.setup(net.NS_CLIENT,address,0);pc("partial_base",channel,packet(12,false,0,0,0,payload(1),false),net.MAX_MSGLEN);pc("partial_first",channel,packet(13,true,0,0,1300,payload(1300),false),net.MAX_MSGLEN);pc("partial_old",channel,packet(12,false,0,0,0,payload(1),false),net.MAX_MSGLEN);pc("partial_duplicate",channel,packet(13,true,0,0,1300,payload(1300),false),net.MAX_MSGLEN)
 channel=net.setup(net.NS_SERVER,address,0);pc("server_qport",channel,packet(3,false,4321,0,0,payload(1),true),net.MAX_MSGLEN)
 channel=net.setup(net.NS_CLIENT,address,0);pc("negative_length",channel,packet(20,true,0,0,-1,bytes(0,0),false),net.MAX_MSGLEN);pc("overlong_length",channel,packet(21,true,0,0,3,payload(2),false),net.MAX_MSGLEN);return 0
end function
