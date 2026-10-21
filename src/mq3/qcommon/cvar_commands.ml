// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Console binding for qcommon/cvar.c's cvar_restart command.
package mq3.qcommon.cvar_commands
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as command

function emit(commandState,text) command.emit(commandState,text);return void end function

function valueCommand(commandState,registry)
  variable=cvar.find(registry,command.argv(commandState,0));if variable==void then return false end if
  if command.argc(commandState)==1 then
    emit(commandState,"\""+variable.name+"\" is:\""+variable.string+"^7\" default:\""+variable.resetString+"^7\"\n")
    if variable.latchedString!=void then emit(commandState,"latched: \""+variable.latchedString+"\"\n") end if
  else
    cvar.set2(registry,variable.name,command.argv(commandState,1),false)
  end if
  return true
end function

function toggleCallback(commandState,registry)
  if command.argc(commandState)!=2 then emit(commandState,"usage: toggle <variable>\n");return void end if
  variable=cvar.find(registry,command.argv(commandState,1));value=0;if variable!=void then value=variable.integer end if
  next="1";if value!=0 then next="0" end if;cvar.set2(registry,command.argv(commandState,1),next,false);return void
end function

function setCallback(commandState,registry)
  if command.argc(commandState)<3 then emit(commandState,"usage: set <variable> <value>\n");return void end if
  combined="";length=0
  for index=2 to command.argc(commandState)-1
    token=command.argv(commandState,index);tokenLength=len(bytes(token))-1;if tokenLength<0 then tokenLength=0 end if
    if length+tokenLength>=command.MAX_STRING_TOKENS-2 then break end if
    combined=combined+token;if index!=command.argc(commandState)-1 then combined=combined+" " end if
    length=length+tokenLength
  end for
  cvar.set2(registry,command.argv(commandState,1),combined,false);return void
end function

function flaggedSet(commandState,registry,flag,usage)
  if command.argc(commandState)!=3 then emit(commandState,usage);return void end if
  setCallback(commandState,registry);variable=cvar.find(registry,command.argv(commandState,1));if variable!=void then variable.flags=variable.flags|flag end if;return void
end function
function setUserCallback(commandState,registry) return flaggedSet(commandState,registry,cvar.USERINFO,"usage: setu <variable> <value>\n") end function
function setServerCallback(commandState,registry) return flaggedSet(commandState,registry,cvar.SERVERINFO,"usage: sets <variable> <value>\n") end function
function setArchiveCallback(commandState,registry) return flaggedSet(commandState,registry,cvar.ARCHIVE,"usage: seta <variable> <value>\n") end function
function resetCallback(commandState,registry)
  if command.argc(commandState)!=2 then emit(commandState,"usage: reset <variable>\n");return void end if
  cvar.set2(registry,command.argv(commandState,1),void,false);return void
end function
function flagText(flags)
  text="";if (flags&cvar.SERVERINFO)!=0 then text=text+"S" else text=text+" " end if
  if (flags&cvar.USERINFO)!=0 then text=text+"U" else text=text+" " end if
  if (flags&cvar.ROM)!=0 then text=text+"R" else text=text+" " end if
  if (flags&cvar.INIT)!=0 then text=text+"I" else text=text+" " end if
  if (flags&cvar.ARCHIVE)!=0 then text=text+"A" else text=text+" " end if
  if (flags&cvar.LATCH)!=0 then text=text+"L" else text=text+" " end if
  if (flags&cvar.CHEAT)!=0 then text=text+"C" else text=text+" " end if
  return text
end function
function listCallback(commandState,registry)
  match=void;if command.argc(commandState)>1 then match=command.argv(commandState,1) end if
  count=0
  for each variable in registry.variables
    if match==void or command.filterName(match,variable.name) then emit(commandState,flagText(variable.flags)+" "+variable.name+" \""+variable.string+"\"\n") end if
    count=count+1
  end for
  emit(commandState,"\n"+str(count)+" total cvars\n");emit(commandState,str(registry.numIndexes)+" cvar indexes\n");return void
end function

function restartCallback(commandState,registry)
  if registry==void then return error(3514,"cvar_restart command is not bound") end if
  return cvar.restart(registry)
end function

function install(registry,commandState)
  if registry==void or commandState==void then return error(3514,"cvar_restart requires registry and command state") end if
  bindings=[["toggle",toggleCallback],["set",setCallback],["sets",setServerCallback],["setu",setUserCallback],["seta",setArchiveCallback],["reset",resetCallback],["cvarlist",listCallback],["cvar_restart",restartCallback]]
  for each binding in bindings if not command.addContextCommand(commandState,binding[0],binding[1],registry) then return error(3514,binding[0]+" command already registered") end if end for
  commandState.cvarContextCommandFn=valueCommand;commandState.cvarCommandContext=registry
  return true
end function
