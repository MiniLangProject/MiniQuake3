import mq3.qcommon.message as message
import mq3.server.reliable_commands as reliable

function encodeHex(data,count)
  digits=bytes("0123456789abcdef");text=""
  if count>0 then for index=0 to count-1 value=data[index];text=text+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for end if
  return text
end function
function flag(value) if value then return 1 end if;return 0 end function
function put(client,sequence,text) client.reliableCommands[sequence&63]=text end function
function emit(name,client)
  msg=message.init(4096);reliable.updateServerCommandsToClient(client,msg)
  print name+"|"+str(client.reliableSent)+"|"+str(msg.cursize)+"|"+str(msg.bit)+"|"+str(flag(msg.overflowed))+"|"+encodeHex(msg.data,msg.cursize)
end function
function client(ack,sequence)
  result=reliable.create();result.reliableAcknowledge=ack;result.reliableSequence=sequence;return result
end function
function main(args)
  c=client(0,0);emit("empty",c)
  c=client(0,1);put(c,1,"print hi");emit("single",c)
  c=client(1,4);put(c,2,"");put(c,3,"cp center");put(c,4,"cs 7 value");emit("range",c)
  c=client(62,66);put(c,63,"s63");put(c,64,"s64");put(c,65,"s65");put(c,66,"s66");emit("wrap",c)
  c=client(7,7);c.reliableSent=3;emit("acked",c)
  c=client(-1,1);put(c,0,"zero");put(c,1,"one");emit("negative",c)
  c=client(126,130);put(c,127,"cmd127");put(c,128,"cmd128");put(c,129,"cmd129");put(c,130,"cmd130");emit("highwrap",c)
  return 0
end function
