import mq3.engine.local_qvm_match as match
import mq3.client.cgame_vm as cgameVm
import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as cvar
import mq3.vm.syscall_qagame_world as qworld
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function hasCommand(state,name)
  for each entry in state.functions if commands.sameInsensitive(entry.name,name) then return true end if end for
  return false
end function

function emitDirect(state,text)
  commands.tokenizeString(state.context.commandState,text);state.context.commandState.command=text
  calls=state.cgame.callCount;result=cgameVm.consoleCommand(state.cgame);if result is error then return result end if
  print(text+"|"+str(result)+"|"+str(state.cgame.callCount-calls));return void
end function

function main(args)
  if len(args)!=2 then print("usage: cgame_console_command_retail_probe <pak0.pk3> <qvm-directory>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if
  for frame=1 to 8
    serverTime=1000+frame*50;command=qworld.userCommand(serverTime,[0,0,0],0,2,0,0,0)
    submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
    advanced=match.runFrame(state,serverTime);if advanced is error then return advanced end if
    snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  end for
  client=match.bootCgame(state);if client is error then return client end if
  drawn=match.drawCgame(state,3100);if drawn is error then return drawn end if
  for each name in ["sizeup","SIZEDOWN","+scores","-scores","+zoom","-zoom","startOrbit","unknown","kill"]
    emitted=emitDirect(state,name);if emitted is error then return emitted end if
  end for
  for each required in ["sizeup","sizedown","+scores","-scores","weapnext","weapon","tell_target","startOrbit","kill","say","callvote"]
    if not hasCommand(state.context.commandState,required) then return error(7698,"missing registered Cgame command "+required) end if
  end for
  before=cvar.get(state.context.cvars,"cg_viewsize","100",0).integer
  executed=match.executeClientConsole(state,"sizeup");if executed is error then return executed end if
  after=cvar.find(state.context.cvars,"cg_viewsize").integer
  if after==before or after!=110 then return error(7698,"sizeup did not execute through Cmd_ExecuteString and CG_CONSOLE_COMMAND") end if
  consoleStart=len(state.context.console);executed=match.executeClientConsole(state,"unhandled_console_probe alpha");if executed is error then return executed end if
  if len(state.context.console)!=consoleStart+1 or state.context.console[len(state.context.console)-1][1]!="client unhandled_console_probe alpha" then return error(7698,"unknown command was not forwarded to the server") end if
  if len(state.context.errors)>0 then return error(7698,state.context.errors[0]) end if
  print("PASS: retail Cgame console commands registered="+str(len(state.context.commandState.functions))+" viewsize="+str(after)+" forwarded=1")
  match.shutdown(state);return 0
end function
