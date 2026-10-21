// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
import mq3.qcommon.cvar_commands as cvarCommands
import mq3.qcommon.command_buffer as command
import std.string as strings
struct Context output end struct
function emit(state,text) state.context.output=state.context.output+text;return void end function
function req(ok,label) if not ok then return error(3515,"cvar command contract: "+label) end if;return 1 end function
function run(state,text) command.executeString(state,text);return void end function
function main(args)
 count=0;registry=cvar.create();state=command.create();command.initCommands(state);state.context=Context("");state.printFn=emit;cvarCommands.install(registry,state)
 count=count+req(len(state.functions)==13,"complete command registration")
 run(state,"set joined one two three");count=count+req(cvar.find(registry,"joined").string=="one two three","set joins arguments")
 run(state,"seta archive yes");count=count+req((cvar.find(registry,"archive").flags&cvar.ARCHIVE)!=0,"seta flag")
 run(state,"setu user yes");count=count+req((cvar.find(registry,"user").flags&cvar.USERINFO)!=0,"setu flag")
 run(state,"sets server yes");count=count+req((cvar.find(registry,"server").flags&cvar.SERVERINFO)!=0,"sets flag")
 run(state,"toggle missing");count=count+req(cvar.find(registry,"missing").integer==1,"toggle creates one")
 run(state,"toggle missing");count=count+req(cvar.find(registry,"missing").integer==0,"toggle clears nonzero")
 base=cvar.get(registry,"base","default",0);cvar.set2(registry,"base","changed",true);run(state,"reset base");count=count+req(base.string=="default","reset default")
 state.context.output="";run(state,"base");count=count+req(state.context.output=="\"base\" is:\"default^7\" default:\"default^7\"\n","direct print")
 cvar.get(registry,"latched","old",cvar.LATCH);cvar.set2(registry,"latched","new",false);state.context.output="";run(state,"latched");count=count+req(state.context.output=="\"latched\" is:\"old^7\" default:\"old^7\"\nlatched: \"new\"\n","latched print")
 run(state,"base first second");count=count+req(base.string=="first","direct set uses argv one")
 state.context.output="";run(state,"cvarlist b*");count=count+req(strings.indexOf(state.context.output,"base \"first\"",0)>=0 and strings.indexOf(state.context.output,"archive \"yes\"",0)<0,"filtered list")
 count=count+req(strings.indexOf(state.context.output," total cvars\n",0)>=0 and strings.indexOf(state.context.output," cvar indexes\n",0)>=0,"list totals")
 state.context.output="";run(state,"set");run(state,"toggle");run(state,"reset");count=count+req(state.context.output=="usage: set <variable> <value>\nusage: toggle <variable>\nusage: reset <variable>\n","usage diagnostics")
 state.context.output="";run(state,"setu bad extra value");count=count+req(cvar.find(registry,"bad")==void and state.context.output=="usage: setu <variable> <value>\n","flagged arity")
 print "PASS: "+str(count)+" cvar console-command contracts";return 0
end function
