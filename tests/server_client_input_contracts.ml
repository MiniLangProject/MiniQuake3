// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.message as message
import mq3.server.client_command as clientCommand
import mq3.server.client_command_dispatch as dispatch
import mq3.server.user_move as userMove
import mq3.server.client_input as input
import mq3.server.client_message as clientMessage

struct Capture event args end struct
struct MessageHost context end struct
function req(value,label) if not value then return error(6995,"client input: "+label) end if;return 1 end function
function builtin(host,client,name,parser) host.context.event="builtin:"+name;host.context.args=parser.argv;return void end function
function game(host,client,parser) host.context.event="game";host.context.args=parser.argv;return void end function
function ignored(host,client,name) host.context.event="ignored:"+name;return void end function
function main(args)
  count=0;capture=Capture("",[])
  commandHost=clientCommand.runtime();dispatchHost=dispatch.services();dispatchHost.context=capture
  dispatchHost.builtinFn=builtin;dispatchHost.gameFn=game;dispatchHost.ignoredFn=ignored
  moveServer=userMove.createServer(1234,10,0);moveHost=userMove.services()
  runtime=input.create(commandHost,dispatchHost,moveServer,moveHost,dispatch.SS_GAME);client=input.createClient();client.state=clientCommand.CS_ACTIVE
  messageHost=MessageHost(runtime)
  input.setTime(runtime,500)
  count=count+req(commandHost.time==500 and moveServer.time==500,"shared clock")
  msg=message.init(128);message.writeLong(msg,1);message.writeString(msg,"userinfo \\name\\ranger");message.beginReading(msg)
  count=count+req(input.clientCommandFn(messageHost,client,msg),"reliable command accepted")
  count=count+req(capture.event=="builtin:userinfo" and client.lastClientCommand==1,"builtin dispatched")
  count=count+req(client.lastClientCommandString=="userinfo \\name\\ranger" and client.nextReliableTime==1500,"reliable state updated")
  msg=message.init(128);message.writeLong(msg,2);message.writeString(msg,"say hello");message.beginReading(msg)
  count=count+req(input.clientCommandFn(messageHost,client,msg) and capture.event=="ignored:say","flood reaches dispatcher gate")
  commandHost.clientRunning=true;msg=message.init(128);message.writeLong(msg,3);message.writeString(msg,"say hello");message.beginReading(msg)
  count=count+req(input.clientCommandFn(messageHost,client,msg) and capture.event=="game","game callback wired")
  move=message.init(16);message.writeByte(move,0);message.beginReading(move);client.messageAcknowledge=7
  count=count+req(input.userMoveFn(messageHost,client,move,true)=="empty" and client.deltaMessage==7,"delta move wired")
  move=message.init(16);message.writeByte(move,0);message.beginReading(move)
  count=count+req(input.userMoveFn(messageHost,client,move,false)=="empty" and client.deltaMessage==-1,"no-delta move wired")
  parserHost=clientMessage.services();parserHost.context=runtime
  parserHost.clientCommandFn=input.clientCommandFn;parserHost.userMoveFn=input.userMoveFn
  packet=message.init(256);message.writeLong(packet,77);message.writeLong(packet,9);message.writeLong(packet,0)
  message.writeByte(packet,clientMessage.CLC_CLIENT_COMMAND);message.writeLong(packet,4);message.writeString(packet,"cp ready")
  message.writeByte(packet,clientMessage.CLC_EOF);message.beginReading(packet)
  count=count+req(clientMessage.execute(clientMessage.createServer(77,70),client,parserHost,packet)=="eof","outer parser integration")
  count=count+req(capture.event=="builtin:cp" and client.messageAcknowledge==9 and client.lastClientCommand==4,"outer parser state")
  count=count+req(len(client.reliableCommands)==64 and len(client.frames)==32,"unified client arrays")
  count=count+req(client.lastUsercmd.serverTime==0 and client.downloadName=="","unified client defaults")
  count=count+req(try(input.create(void,dispatchHost,moveServer,moveHost,2)) is error,"configuration validation")
  count=count+req(try(input.setTime(void,0)) is error,"clock validation")
  print "PASS: "+str(count)+" server client-input integration contracts";return 0
end function
