import mq3.client.cl_cgame_runtime as cl
import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then return error(7762,"usage: cl_cgame_retail_probe <pak0.pk3> <qvm-dir>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  retailQvm=pk3.read(archive,"vm/cgame.qvm");if retailQvm is error or len(retailQvm)<10000 then return error(7762,"retail cgame.qvm missing") end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  match.connectLocal(state,0);match.snapshot(state,0)
  for frame=1 to 3 command=qworld.userCommand(1000+frame*50,[0,0,0],0,2,127,0,0);match.submitUsercmd(state,0,command);match.runFrame(state,1000+frame*50) end for
  client=match.bootCgame(state);if client is error then return client end if
  match.submitUsercmd(state,0,qworld.userCommand(1200,[0,0,0],0,2,127,0,0));drawn=match.drawCgame(state,1200);if drawn is error then return drawn end if
  if len(state.context.errors)!=0 or not state.cgame.active or state.cgame.lastExport!=3 then return error(7762,"retail cgame lifecycle failed") end if
  if state.context.snapshotNumber<=0 or state.context.latestSnapshot==void or state.context.cgameCollisionQueries==0 then return error(7762,"retail snapshot/prediction bridge failed") end if
  if state.context.latestRefdef==void or len(state.context.renderQueue.commands)==0 or len(state.context.soundCommands)==0 then return error(7762,"retail render/audio traps failed") end if
  facade=cl.create(void,state.cgame,void,void,void);facade.serverMessageSequence=state.context.snapshotNumber;facade.lastExecutedServerCommand=state.context.cgameServerCommands.lastExecuted;facade.clientNum=0
  if cl.CL_GameCommand(facade) is error then return error(7762,"C-named console export failed") end if
  print "PASS: retail cl_cgame qvmBytes="+str(len(retailQvm))+" snapshot="+str(state.context.snapshotNumber)+" collisionTraps="+str(state.context.cgameCollisionQueries)+" draw2D="+str(len(state.context.renderQueue.commands))+" sounds="+str(len(state.context.soundCommands));match.shutdown(state);return 0
end function
