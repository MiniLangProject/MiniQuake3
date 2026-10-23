import mq3.client.cl_parse_runtime as parser
import mq3.client.server_message as serverMessage
import mq3.client.gamestate as gamestate
import mq3.client.download as download
import mq3.client.system_info as systemInfo
import mq3.qcommon.message as message
import mq3.format.pk3 as pk3

struct Context writes end struct
function req(value,text) if not value then return error(6998,"cl_parse retail: "+text) end if;return 1 end function
function setCvar(host,name,value) host.context.writes=host.context.writes+[[name,value]];return void end function
function getCvar(host,name) if name=="sv_pure" then return "1" end if;return "" end function

function main(args)
  if len(args)!=1 then return 2 end if
  archive=pk3.open(args[0]);arenaBytes=pk3.read(archive,"scripts/arenas.txt");if arenaBytes is error then return arenaBytes end if
  arenaText=decode(arenaBytes);context=Context([]);services=systemInfo.services();services.context=context;services.setCvarFn=setCvar;services.getCvarFn=getCvar
  runtime=parser.create(download.services(),services);parser.configureShownet(runtime,2,void,void)
  wire=message.init(8192);message.writeLong(wire,0);message.writeByte(wire,serverMessage.SVC_GAMESTATE);message.writeLong(wire,17)
  message.writeByte(wire,gamestate.SVC_CONFIGSTRING);message.writeShort(wire,1);message.writeBigString(wire,"\\sv_serverid\\68\\sv_pure\\1")
  message.writeByte(wire,gamestate.SVC_CONFIGSTRING);message.writeShort(wire,5);message.writeBigString(wire,arenaText)
  message.writeByte(wire,gamestate.SVC_EOF);message.writeLong(wire,0);message.writeLong(wire,0x12345678);message.writeByte(wire,serverMessage.SVC_EOF);message.beginReading(wire)
  result=parser.CL_ParseServerMessage(runtime,wire);checks=0
  checks=checks+req(result==[0,0],"retail gamestate dispatch")
  checks=checks+req(runtime.protocol.gamestateState.serverCommandSequence==17 and runtime.systemState.serverId==68,"trailer and system info")
  checks=checks+req(gamestate.configString(runtime.protocol.gamestateState,5)==arenaText,"retail arenas configstring exact")
  checks=checks+req(runtime.protocol.gamestateState.dataCount>3300 and runtime.protocol.gamestateState.checksumFeed==0x12345678,"retail storage and feed")
  checks=checks+req(len(runtime.protocol.dispatcher.shownetLines)==3,"shownet command stream "+str(runtime.protocol.dispatcher.shownetLines))
  print "PASS: retail cl_parse "+str(checks)+" checks "+str(len(arenaBytes))+" arena bytes";return 0
end function
