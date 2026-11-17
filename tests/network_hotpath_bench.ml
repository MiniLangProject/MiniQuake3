// SPDX-License-Identifier: GPL-2.0-or-later
// Same-process before/after microbenchmarks, not game FPS measurements.
import mq3.client.gamestate as gamestate
import mq3.server.netchan as serverNet
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import std.time as time

// Baselines copied from master ed8aeee; preserve algorithm for measurement.
function oldString(state,index)
  start=state.stringOffsets[index];if start==0 then return "" end if
  data=[];while start<state.dataCount and state.stringData[start]!=0 data=data+[state.stringData[start]];start=start+1 end while
  return decode(bytes(data))
end function
function oldEncode(client,msg)
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  msg.bit=0;msg.readcount=0;msg.oob=false;message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  raw=bytes(client.lastClientCommandString);index=0;key=(client.challenge^client.channel.outgoingSequence)&255
  for offset=4 to msg.cursize-1
    step=serverNet.commandByte(raw,index);value=step[0];index=step[1]
    key=(key^(value<<(offset&1)))&255;msg.data[offset]=(msg.data[offset]^key)&255
  end for
  return msg
end function
function require(value,label) if not value then return error(7984,"network benchmark: "+label) end if;return void end function
function main(args)
  state=gamestate.create();state.stringOffsets[2]=1;state.dataCount=1026
  for i=1 to 1024 state.stringData[i]=65+i%26 end for
  state.stringData[1025]=0
  require(oldString(state,2)==gamestate.configString(state,2),"configstring equality")
  peer=serverNet.client(123456,net.setup(net.NS_SERVER,net.Address(4,[127,0,0,1],27960),2222))
  peer.lastClientCommandString="say benchmark%key";one=message.init(8192);two=message.init(8192)
  one.cursize=8192;two.cursize=8192
  for i=0 to 8191 one.data[i]=i%256;two.data[i]=i%256 end for
  oldEncode(peer,one);serverNet.encode(peer,two);require(one.data==two.data,"encoded bytes equality")
  // Warm both paths before measuring; alternate ordering to reduce bias.
  for i=0 to 7 oldString(state,2);gamestate.configString(state,2);oldEncode(peer,one);serverNet.encode(peer,two) end for
  sum=0
  for sample=0 to 4
    t=time.ticks();for i=0 to 63 sum=sum+len(oldString(state,2)) end for;beforeString=time.ticks()-t
    t=time.ticks();for i=0 to 63 sum=sum+len(gamestate.configString(state,2)) end for;afterString=time.ticks()-t
    beforeXor=0;afterXor=0
    if sample%2==0 then
      t=time.ticks();for i=0 to 63 oldEncode(peer,one) end for;beforeXor=time.ticks()-t
      t=time.ticks();for i=0 to 63 serverNet.encode(peer,two) end for;afterXor=time.ticks()-t
    else
      t=time.ticks();for i=0 to 63 serverNet.encode(peer,two) end for;afterXor=time.ticks()-t
      t=time.ticks();for i=0 to 63 oldEncode(peer,one) end for;beforeXor=time.ticks()-t
    end if
    require(one.data==two.data,"repeated encoding bytes")
    print "BENCH sample="+str(sample)+" string_before_ms="+str(beforeString)+" string_after_ms="+str(afterString)+" xor_before_ms="+str(beforeXor)+" xor_after_ms="+str(afterXor)
  end for
  require(sum==655360,"benchmark workload")
  print "PASS: exact-byte network hot-path microbenchmarks; not an FPS claim"
  return 0
end function
