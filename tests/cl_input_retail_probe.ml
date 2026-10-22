import mq3.client.cl_input as cl
import mq3.client.send_cmd as send
import mq3.qcommon.command_buffer as commands
import mq3.format.pk3 as pk3

function main(args)
  if len(args)<1 then return error(7742,"retail root required") end if
  archive=pk3.open(args[0]+"/baseq3/pak0.pk3");if archive is error then return archive end if
  cgame=pk3.read(archive,"vm/cgame.qvm");if cgame is error or len(cgame)<1000 then return error(7742,"retail cgame.qvm missing") end if
  cmd=commands.create();commands.initCommands(cmd);state=cl.create(cmd,send.create(),send.services());state.frameTime=150;state.frameMsec=50;state.serverTime=1234;cl.CL_InitInput(state)
  commands.executeString(cmd,"+forward 17 100");commands.executeString(cmd,"+attack 178 120");commands.executeString(cmd,"-attack 178 125");cl.CL_MouseEvent(state,12,-8,130);value=cl.CL_CreateCmd(state)
  if value.forwardmove!=127 or (value.buttons&1)==0 or value.serverTime!=1234 or value.viewangles[1]>=0.0 then return error(7742,"retail input probe command mismatch") end if
  print "PASS: retail cgame.qvm "+str(len(cgame))+" bytes drives native cl_input command";return 0
end function
