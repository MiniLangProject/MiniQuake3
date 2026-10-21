// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
import mq3.qcommon.cvar_commands as cvarCommands
import mq3.qcommon.command_buffer as commands

function req(ok,label) if not ok then return error(3514,"cvar restart contract: "+label) end if;return 1 end function
function main(args)
  count=0;count=count+req(try(cvar.restart(void)) is error,"null registry rejected")
  registry=cvar.create();normal=cvar.get(registry,"normal","base",cvar.ARCHIVE);cvar.set2(registry,"normal","changed",true)
  unchanged=cvar.get(registry,"unchanged","base",0);pending=cvar.get(registry,"pending","base",cvar.LATCH);cvar.set2(registry,"pending","next",false)
  changedLatch=cvar.get(registry,"changedLatch","base",cvar.LATCH);cvar.set2(registry,"changedLatch","live",true);cvar.set2(registry,"changedLatch","next",false)
  rom=cvar.get(registry,"rom","base",cvar.ROM);cvar.set2(registry,"rom","live",true)
  init=cvar.get(registry,"init","base",cvar.INIT);cvar.set2(registry,"init","live",true)
  keep=cvar.get(registry,"keep","base",cvar.NORESTART);cvar.set2(registry,"keep","live",true)
  user=cvar.set2(registry,"user","temp",false);oldIndexes=registry.numIndexes;cvar.restart(registry)
  count=count+req(normal.string=="base" and normal.modificationCount==3,"registered value reset")
  count=count+req(unchanged.string=="base" and unchanged.modificationCount==1,"unchanged reset is no-op")
  count=count+req(pending.string=="base" and pending.latchedString=="next" and pending.modificationCount==2,"equal reset preserves pending latch")
  count=count+req(changedLatch.string=="base" and changedLatch.latchedString==void and changedLatch.modificationCount==4,"changed latch reset and cleared")
  count=count+req(rom.string=="live" and init.string=="live" and keep.string=="live","protected values preserved")
  count=count+req(cvar.find(registry,"user")==void,"user variable removed")
  count=count+req(user.name==void and user.string=="temp" and user.flags==cvar.USER_CREATED and user.modificationCount==1,"x86 pointer-sized clear preserved")
  count=count+req(registry.numIndexes==oldIndexes and registry.indexes[oldIndexes-1]==user,"stable handle table retained")
  reborn=cvar.get(registry,"user","reborn",0);count=count+req(reborn.index==oldIndexes and registry.numIndexes==oldIndexes+1,"recreated variable gets fresh handle")
  commandState=commands.create();commands.initCommands(commandState)
  count=count+req(try(cvarCommands.install(void,commandState)) is error,"install rejects missing registry")
  count=count+req(cvarCommands.install(registry,commandState),"restart command installed")
  count=count+req(try(cvarCommands.install(registry,commandState)) is error,"duplicate command rejected")
  cvar.set2(registry,"normal","again",true);commands.executeText(commandState,commands.EXEC_NOW,"cvar_restart")
  count=count+req(normal.string=="base","immediate command resets")
  cvar.set2(registry,"normal","queued",true);commands.executeText(commandState,commands.EXEC_APPEND,"cvar_restart\n")
  count=count+req(normal.string=="queued","append waits for execute")
  commands.execute(commandState);count=count+req(normal.string=="base" and commandState.buffer=="","queued command executes")
  count=count+req(len(commandState.functions)==13,"five builtins plus eight cvar commands")
  print "PASS: "+str(count)+" cvar restart contracts";return 0
end function
