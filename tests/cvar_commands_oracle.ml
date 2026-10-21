// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
import mq3.qcommon.cvar_commands as cvarCommands
import mq3.qcommon.command_buffer as command

struct Context output end struct
function emit(state,text) state.context.output=state.context.output+text;return void end function
function escaped(text)
  data=bytes(text);result="";for each value in data if value==0 then break else if value==10 then result=result+"\\n" else if value==92 then result=result+"\\\\" else result=result+decode(bytes([value])) end if end for;return result
end function
function record(label,name,state,registry)
  variable=cvar.find(registry,name);line=label+"|";if variable==void then line=line+"<missing>" else line=line+variable.name+"|"+variable.string+"|"+variable.resetString+"|"+str(variable.flags)+"|"+str(variable.modificationCount) end if
  print line+"|out="+escaped(state.context.output);state.context.output="";return void
end function
function run(state,text) command.executeString(state,text);return void end function
function main(args)
  registry=cvar.create();state=command.create();command.initCommands(state);state.context=Context("");state.printFn=emit;cvarCommands.install(registry,state)
  run(state,"set");record("set_usage","alpha",state,registry)
  run(state,"set alpha one two");record("set_multi","alpha",state,registry)
  run(state,"seta alpha archived");record("seta","alpha",state,registry)
  run(state,"setu userinfo value");record("setu","userinfo",state,registry)
  run(state,"sets serverinfo value");record("sets","serverinfo",state,registry)
  run(state,"toggle flag");record("toggle_new","flag",state,registry)
  run(state,"toggle flag");record("toggle_old","flag",state,registry)
  run(state,"reset alpha");record("reset","alpha",state,registry)
  run(state,"alpha");record("direct_print","alpha",state,registry)
  run(state,"alpha next ignored");record("direct_set","alpha",state,registry)
  run(state,"setu bad");record("setu_usage","bad",state,registry)
  return 0
end function
