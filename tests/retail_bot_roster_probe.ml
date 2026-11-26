import mq3.engine.local_qvm_match as match
import mq3.qcommon.command_buffer as commandBuffer
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import std.string as strings

function main(args)
  if len(args)!=4 then return error(7699,"usage: retail_bot_roster_probe <pak0.pk3> <qvms> <bot-name> <character-file>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  settings=match.UserSettings([],array(256,void),array(match.MAX_CLIENTS,"\\name\\Player\\rate\\25000"),["addbot "+args[2]+" 3"])
  state=match.bootWithQvmsSettingsNamed(archive,map,"q3dm1",1000,args[1],settings);if state is error then return state end if
  executed=commandBuffer.execute(state.context.commandState);if executed is error then return executed end if
  if len(state.context.errors)>0 then return error(7699,state.context.errors[0]) end if
  if state.context.botAllocations!=1 or state.context.clientStates[0]!=2 then return error(7699,"bot did not spawn: "+args[2]) end if
  info=state.context.userinfos[0]
  // funname may legally replace the plain roster name with Quake color codes.
  if not strings.contains(info,"\\name\\") or not strings.contains(info,"\\characterfile\\"+args[3]) then return error(7699,"wrong bot profile: "+args[2]+" "+info) end if
  active=0
  for frame=1 to 120
    advanced=match.runFrame(state,1000+frame*100);if advanced is error then return advanced end if
    command=state.context.botServer.clients[0].userCommand
    if command!=void and command.weapon>0 and (command.forwardmove!=0 or command.rightmove!=0 or command.upmove!=0 or command.buttons!=0) then active=active+1 end if
  end for
  if len(state.context.errors)>0 then return error(7699,state.context.errors[0]) end if
  if active==0 then return error(7699,"bot never submitted an active command: "+args[2]) end if
  stopped=match.shutdown(state);if stopped is error then return stopped end if
  print("PASS bot="+args[2]+" active="+str(active)+" frames=120");return 0
end function
