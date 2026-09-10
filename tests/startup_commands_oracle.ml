// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.command_buffer as command
import mq3.qcommon.startup_commands as startup

struct Variable name value flags end struct
struct Context events variables end struct
function event(state,text) state.context.events=state.context.events+text;return void end function
function find(state,name) for each variable in state.context.variables if variable.name==name then return variable end if end for;return void end function
function getCvar(state,name,value,flags)
  event(state,"G:"+name+":"+value+":"+str(flags)+"|");variable=find(state,name)
  if variable!=void then return variable end if
  variable=Variable(name,value,flags);state.context.variables=state.context.variables+[variable];return variable
end function
function setCvar(state,name,value)
  event(state,"S:"+name+":"+value+"|");variable=getCvar(state,name,value,0);variable.value=value;return void
end function
function encodeHex(text)
  data=bytes(text);digits=bytes("0123456789abcdef");result=""
  for each value in data result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for
  return result
end function
function intBool(value) if value then return 1 end if;return 0 end function
function fixture()
  cmd=command.create();state=startup.create(cmd);state.context=Context("",[]);state.cvarSetFn=setCvar;state.cvarGetFn=getCvar;return state
end function
function snapshot(state,label,value)
  result="S|"+label+"|"+str(value)+"|"+str(len(state.lines))
  for each line in state.lines result=result+"|"+encodeHex(line) end for
  result=result+"|"+encodeHex(state.commandState.buffer)+"|"+encodeHex(state.context.events)
  for each variable in state.context.variables result=result+"|"+variable.name+"="+variable.value+":"+str(variable.flags) end for
  print result;state.context.events="";return void
end function
function main(args)
  state=fixture();startup.parseCommandLine(state,"quake3 +set test blah +map test");snapshot(state,"basic",0)
  state=fixture();startup.parseCommandLine(state,"set a \"x+y\"+map q3dm1\nnext\r\rfinal+");snapshot(state,"quotes_lines",0)
  text="";for index=0 to 34 if index>0 then text=text+"+" end if;text=text+"c"+decode(bytes([65+(index%26)])) end for
  state=fixture();startup.parseCommandLine(state,text);snapshot(state,"line_limit",0)
  state=fixture();startup.parseCommandLine(state,"set x 1+SAFE +map x");value=startup.safeMode(state);snapshot(state,"safe",intBool(value))
  state=fixture();startup.parseCommandLine(state,"set x 1+CvAr_ReStArT+safe");value=startup.safeMode(state);snapshot(state,"restart_first",intBool(value));value=startup.safeMode(state);snapshot(state,"safe_second",intBool(value))
  state=fixture();startup.parseCommandLine(state,"set foo one+set foo \"two words\"+SET upper no+set developer+map q3dm1");startup.startupVariable(state,"foo");snapshot(state,"variable_match",0);startup.startupVariable(state,void);snapshot(state,"variable_all",0)
  state=fixture();startup.parseCommandLine(state,"set a 1+settings menu+SET b 2+map q3dm1++echo hi");value=startup.addStartupCommands(state);snapshot(state,"add_commands",intBool(value))
  state=fixture();startup.parseCommandLine(state,"safe+set x 1+map q3dm2");value=intBool(startup.safeMode(state));startup.startupVariable(state,void);value=value*10+intBool(startup.addStartupCommands(state));snapshot(state,"integrated",value)
  return 0
end function
