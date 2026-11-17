// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.server_command_stream as stream
import mq3.qcommon.command_buffer as command

struct Context events end struct
function req(value,label) if not value then return error(6939,"server command stream: "+label) end if;return 1 end function
function config(c,index,value) c.events=c.events+["cs:"+str(index)+":"+value];return void end function
function system(c) c.events=c.events+["system"];return void end function
function notify(c) c.events=c.events+["notify"];return void end function
function cmds(c) c.events=c.events+["cmds"];return void end function
function close(c) c.events=c.events+["close"];return void end function
function queue(c,text) c.events=c.events+["queue:"+text];return void end function
function host(context)
  value=stream.services();value.context=context;value.configstringFn=config;value.systemInfoFn=system;value.clearNotifyFn=notify;value.clearUsercmdsFn=cmds;value.closeConsoleFn=close;value.queueConsoleFn=queue;return value
end function

function main(args)
  count=0;commands=command.create();table=array(stream.MAX_CONFIGSTRINGS,"");state=stream.create(commands,table);context=Context([]);services=host(context)
  count=count+req(state.commandSequence==0 and state.lastExecuted==0 and len(state.commands)==64,"defaults")
  count=count+req(stream.queue(state,"print one")==1 and stream.queue(state,"cp two")==2,"queue sequence")
  count=count+req(state.commands[1]=="print one" and state.commands[2]=="cp two","queue ring")
  count=count+req(stream.get(state,services,1) and state.lastExecuted==1,"regular command")
  count=count+req(command.argc(commands)==2 and command.argv(commands,0)=="print" and command.argv(commands,1)=="one","regular tokenization")
  count=count+req(try(stream.get(state,services,3)) is error,"future command rejected")

  old=stream.create(command.create(),table);old.commandSequence=65;old.demoPlaying=true
  count=count+req(not stream.get(old,services,1) and old.lastExecuted==0,"cycled demo command ignored")
  old.demoPlaying=false;count=count+req(try(stream.get(old,services,1)) is error,"cycled live command rejected")

  state=stream.create(command.create(),table);stream.queue(state,"bcs0 5 \"alpha ");stream.queue(state,"bcs1 5 \"beta ");stream.queue(state,"bcs2 5 \"gamma")
  count=count+req(not stream.get(state,services,1) and not stream.get(state,services,2),"big config fragments withheld")
  count=count+req(stream.get(state,services,3) and table[5]=="alpha beta gamma","big config assembled")
  count=count+req(command.argv(state.commandState,0)=="cs" and command.argv(state.commandState,2)=="alpha beta gamma","assembled command retokenized")
  count=count+req(context.events[len(context.events)-1]=="cs:5:alpha beta gamma","config callback")

  state=stream.create(command.create(),table);stream.queue(state,"cs 1 \"\\sv_serverid\\77\"");context.events=[]
  count=count+req(stream.get(state,services,1) and table[1]=="\\sv_serverid\\77","system configstring")
  count=count+req(context.events==["cs:1:\\sv_serverid\\77","system"],"system callback order")
  stream.queue(state,"cs 1 \"\\sv_serverid\\77\"");context.events=[]
  count=count+req(stream.get(state,services,2) and state.lastExecuted==2,"unchanged systeminfo remains an application command")
  count=count+req(len(context.events)==0,"unchanged systeminfo skips config and system callbacks")
  stream.queue(state,"cs 5 \"alpha beta gamma\"")
  count=count+req(stream.get(state,services,3) and len(context.events)==0,"unchanged ordinary configstring skips callback")
  stream.queue(state,"cs 5 alpha beta changed")
  count=count+req(stream.get(state,services,4) and table[5]=="alpha beta changed" and context.events==["cs:5:alpha beta changed"],"changed configstring retains all arguments and calls once")

  state=stream.create(command.create(),table);stream.queue(state,"map_restart 0");context.events=[]
  count=count+req(stream.get(state,services,1) and context.events==["notify","cmds"],"map restart clears client state")
  state=stream.create(command.create(),table);stream.queue(state,"clientLevelShot");context.events=[]
  count=count+req(not stream.get(state,services,1) and len(context.events)==0,"remote levelshot blocked")
  services.serverRunning=true;count=count+req(stream.get(state,services,1) and len(context.events)==3 and context.events[0]=="notify" and context.events[1]=="close","local levelshot accepted")
  count=count+req(context.events[2]=="queue:wait ; wait ; wait ; wait ; screenshot levelshot\n","levelshot command queued")

  state=stream.create(command.create(),table);stream.queue(state,"disconnect \"maintenance now\"")
  count=count+req(try(stream.get(state,services,1)) is error and state.lastExecuted==1,"disconnect reason drops")
  state=stream.create(command.create(),table);stream.queue(state,"disconnect")
  count=count+req(try(stream.get(state,services,1)) is error,"plain disconnect drops")
  state=stream.create(command.create(),table);state.bigConfigString=decode(bytes(stream.BIG_INFO_STRING-1,120));stream.queue(state,"bcs1 0 x")
  count=count+req(try(stream.get(state,services,1)) is error,"big config bound")
  count=count+req(try(stream.create(command.create(),[])) is error and try(stream.queue(void,"x")) is error,"invalid state rejected")
  print("PASS: "+str(count)+" server command-stream contracts");return 0
end function
