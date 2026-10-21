import mq3.client.cgame_servercmds as server
import std.bytes as byteTools
function row(text) value=server.removeChatEscapeChar(text);raw=bytes(value);print("clean|"+str(len(raw))+"|"+byteTools.toHex(raw));return void end function
function main(args)
  for each name in ["getflag","OFFENSE","defend","DEFENDFLAG","patrol","camp","followme","returnflag","followflagcarrier","bogus"] print("order|"+name+"|"+str(server.validOrder(name))) end for
  escape=decode(bytes(1,25));row("plain");row("a"+escape+"b");row(escape+escape);row("x"+escape+"y"+escape+"z");return 0
end function
