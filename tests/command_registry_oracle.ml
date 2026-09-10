// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.command_buffer as command

struct Trace events end struct
function event(state,text) state.context.events = state.context.events+text; return void end function
function printEvent(state,text) return event(state,"P:"+text+"|") end function
function alpha(state) return event(state,"A:"+command.args(state)+"|") end function
function beta(state) return event(state,"B:"+command.args(state)+"|") end function
function completion(state,name) return event(state,"K:"+name+"|") end function
function cvarCommand(state) event(state,"C:"+command.argv(state,0)+"|"); return command.argv(state,0)=="cvarhit" end function
function clientCommand(state) event(state,"G:"+command.argv(state,0)+"|"); return command.argv(state,0)=="clienthit" end function
function serverCommand(state) event(state,"S:"+command.argv(state,0)+"|"); return command.argv(state,0)=="serverhit" end function
function uiCommand(state) event(state,"U:"+command.argv(state,0)+"|"); return command.argv(state,0)=="uihit" end function
function forward(state,text) return event(state,"F:"+text+"|") end function
function cvarString(state,name) event(state,"V:"+name+"|"); if name=="sequence" then return "echo vvalue;beta" end if; return "" end function
function readFile(state,name) event(state,"R:"+name+"|"); if name=="ok.cfg" then return "echo fromfile;alpha" end if; return void end function
function freeFile(state,data) return event(state,"FREE|") end function
function encodeHex(text)
  data=bytes(text);digits=bytes("0123456789abcdef");result=""
  for each value in data result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for
  return result
end function
function snapshot(state,label)
  names=""; for each entry in state.functions names=names+entry.name+"," end for
  print "R|"+label+"|"+encodeHex(state.context.events)+"|"+names+"|"+encodeHex(state.buffer)+"|"+str(state.wait)
  state.context.events="";return void
end function
function main(args)
  state=command.create();state.context=Trace("");state.printFn=printEvent
  state.cvarCommandFn=cvarCommand;state.clientGameCommandFn=clientCommand;state.serverGameCommandFn=serverCommand;state.uiGameCommandFn=uiCommand
  state.forwardCommandFn=forward;state.clientRunning=true;state.serverRunning=true;state.cvarStringFn=cvarString;state.readFileFn=readFile;state.freeFileFn=freeFile
  command.initCommands(state);command.addCommand(state,"alpha",alpha);command.addCommand(state,"beta",beta);command.addCommand(state,"delegated",void);snapshot(state,"init")
  command.addCommand(state,"alpha",alpha);command.addCommand(state,"delegated",void);command.commandCompletion(state,completion);snapshot(state,"duplicate_completion")
  command.executeString(state,"ALPHA one two");snapshot(state,"registered_case_move")
  command.executeString(state,"delegated x");snapshot(state,"null_delegates")
  command.executeString(state,"cvarhit");command.executeString(state,"clienthit");command.executeString(state,"serverhit");command.executeString(state,"uihit");command.executeString(state,"unknown raw \"q v\"");snapshot(state,"dispatch_chain")
  command.executeString(state,"echo hello \"two words\"");snapshot(state,"echo")
  command.executeString(state,"vstr sequence");snapshot(state,"vstr_insert");command.execute(state);snapshot(state,"vstr_execute")
  command.executeString(state,"exec ok");snapshot(state,"exec_insert");command.execute(state);snapshot(state,"exec_execute")
  command.executeString(state,"exec missing");command.executeString(state,"exec");command.executeString(state,"vstr");snapshot(state,"builtin_errors")
  command.executeString(state,"cmdlist *a*");snapshot(state,"filtered_list")
  command.executeString(state,"cmdlist ?e*");command.executeString(state,"cmdlist [a-c]*");snapshot(state,"filter_grammar")
  command.executeString(state,"exec dir.with/ok");command.executeString(state,"exec dir.with\\ok");snapshot(state,"default_extension")
  state.clientRunning=false;command.executeString(state,"clienthit");snapshot(state,"running_gates");state.clientRunning=true
  command.removeCommand(state,"beta");command.removeCommand(state,"missing");command.commandCompletion(state,completion);snapshot(state,"remove_completion")
  return 0
end function
