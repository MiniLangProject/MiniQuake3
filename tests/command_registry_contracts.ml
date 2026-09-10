// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.command_buffer as command

struct Context events end struct
function require(condition,label) if not condition then return error(499,"Command registry contract: "+label) end if; return 1 end function
function same(a,b) if len(a)!=len(b) then return false end if; for index=0 to len(a)-1 if a[index]!=b[index] then return false end if end for; return true end function
function event(state,text) state.context.events=state.context.events+[text];return void end function
function printEvent(state,text) return event(state,text) end function
function action(state) return event(state,"action") end function
function complete(state,name) return event(state,name) end function
function no(state) event(state,"service");return false end function
function forward(state,text) return event(state,"forward:"+text) end function

function main(args)
  count=0;state=command.create();state.context=Context([]);state.printFn=printEvent
  count=count+require(command.filterName("*a*","Alpha") and command.filterName("?e*","beta") and command.filterName("[a-c]*","Beta") and not command.filterName("[d-f]*","beta"),"Com_Filter wildcard grammar")
  count=count+require(command.defaultExtension("cfg/autoexec",".cfg")=="cfg/autoexec.cfg" and command.defaultExtension("cfg/a.b",".cfg")=="cfg/a.b","default extension basename")
  count=count+require(command.defaultExtension("dir.with\\autoexec",".cfg")=="dir.with\\autoexec","original slash-only scan")
  count=count+require(command.addCommand(state,"one",action) and not command.addCommand(state,"one",action) and same(state.context.events,["Cmd_AddCommand: one already defined\n"]),"duplicate diagnostic")
  state.context.events=[];count=count+require(not command.addCommand(state,"one",void) and len(state.context.events)==0,"completion-only duplicate silent")
  command.addCommand(state,"two",action);command.commandCompletion(state,complete)
  count=count+require(same(state.context.events,["two","one"]),"head-first completion")
  count=count+require(command.removeCommand(state,"two") and not command.removeCommand(state,"Two") and len(state.functions)==1,"case-sensitive removal")
  state.context.events=[];command.executeString(state,"ONE");count=count+require(same(state.context.events,["action"]),"case-insensitive dispatch")
  command.addCommand(state,"defer",void);state.cvarCommandFn=no;state.forwardCommandFn=forward;state.context.events=[];command.executeString(state,"defer raw")
  count=count+require(same(state.context.events,["service","forward:defer raw"]),"NULL command continues service chain")
  state.clientRunning=false;state.clientGameCommandFn=no;state.serverRunning=false;state.serverGameCommandFn=no;state.uiGameCommandFn=no;state.context.events=[];command.executeString(state,"unknown")
  count=count+require(same(state.context.events,["service","forward:unknown"]),"running gates skip game services")
  state=command.create();command.tokenizeString(state,"exec x");count=count+require(try(command.execCommand(state)) is error,"exec requires read service")
  command.tokenizeString(state,"vstr x");count=count+require(try(command.vstrCommand(state)) is error,"vstr requires cvar service")
  count=count+require(try(command.executeText(state,99,"x")) is error,"bad execute mode")
  command.tokenizeString(state,"kept original");command.tokenizeString(state,void);count=count+require(command.argc(state)==0 and command.cmd(state)=="kept original","NULL tokenize preserves original command")
  state=command.create();state.context=Context([]);state.printFn=printEvent;command.initCommands(state)
  count=count+require(command.argv(state,-1)=="" and command.argv(state,0)=="" and len(state.functions)==5,"init and argv bounds")
  command.executeString(state,"echo a b");count=count+require(same(state.context.events,["a ","b ","\n"]),"echo print fragmentation")
  print "PASS: "+str(count)+" command registry contracts";return 0
end function
