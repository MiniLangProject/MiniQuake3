// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.command_buffer as command
import mq3.qcommon.startup_commands as startup

struct Variable name value flags end struct
struct Context events variable end struct
function require(condition,label) if not condition then return error(499,"Startup command contract: "+label) end if;return 1 end function
function same(a,b) if len(a)!=len(b) then return false end if;for index=0 to len(a)-1 if a[index]!=b[index] then return false end if end for;return true end function
function setCvar(state,name,value) state.context.events=state.context.events+["set:"+name+":"+value];state.context.variable.name=name;state.context.variable.value=value;return void end function
function getCvar(state,name,value,flags) state.context.events=state.context.events+["get:"+name];return state.context.variable end function
function nullCvar(state,name,value,flags) return void end function
function fixture()
  state=startup.create(command.create());state.context=Context([],Variable("","",0));state.cvarSetFn=setCvar;state.cvarGetFn=getCvar;return state
end function
function main(args)
  count=0;state=fixture();startup.parseCommandLine(state,"");count=count+require(same(state.lines,[""]),"empty line retained")
  startup.parseCommandLine(state,"a+b+c");count=count+require(same(state.lines,["a","b","c"]),"plus split")
  startup.parseCommandLine(state,"a+\"b+c\"+d");count=count+require(same(state.lines,["a","\"b+c\"","d"]),"quoted plus retained")
  startup.parseCommandLine(state,"a\r\n\nb");count=count+require(same(state.lines,["a","","","b"]),"CRLF separators are independent")
  text="";for index=0 to 34 if index>0 then text=text+"+" end if;text=text+str(index) end for;startup.parseCommandLine(state,text)
  count=count+require(len(state.lines)==32 and state.lines[31]=="31+32+33+34","32-line return preserves separator tail")
  startup.parseCommandLine(state,"one+SaFe+safe");count=count+require(startup.safeMode(state) and same(state.lines,["one","","safe"]),"safe clears first match")
  count=count+require(startup.safeMode(state) and state.lines[2]=="","second safe remains discoverable")
  startup.parseCommandLine(state,"one+two");count=count+require(not startup.safeMode(state),"safe absence")
  state=startup.create(command.create());startup.parseCommandLine(state,"set a b");count=count+require(try(startup.startupVariable(state,void)) is error,"Cvar services required")
  state=fixture();state.cvarGetFn=nullCvar;startup.parseCommandLine(state,"set a b");count=count+require(try(startup.startupVariable(state,void)) is error,"NULL Cvar_Get rejected")
  state=fixture();startup.parseCommandLine(state,"SET upper no+set lower yes");startup.startupVariable(state,void);count=count+require(same(state.context.events,["set:lower:yes","get:lower"]),"set is case sensitive")
  count=count+require(state.context.variable.flags==startup.CVAR_USER_CREATED,"user-created flag")
  state=fixture();startup.parseCommandLine(state,"set a one+set b two");startup.startupVariable(state,"b");count=count+require(same(state.context.events,["set:b:two","get:b"]),"matched startup variable")
  state=fixture();startup.parseCommandLine(state,"set");startup.startupVariable(state,void);count=count+require(state.context.variable.name=="" and state.context.variable.value=="","missing set arguments are empty")
  state=fixture();state.lines=["","set a 1","SET b 2","settings menu"];count=count+require(not startup.addStartupCommands(state),"three-byte set prefix suppresses added result")
  count=count+require(state.commandState.buffer=="set a 1\nSET b 2\nsettings menu\n","nonempty startup lines appended")
  print "PASS: "+str(count)+" startup command contracts";return 0
end function
