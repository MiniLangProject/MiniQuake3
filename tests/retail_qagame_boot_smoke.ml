import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then print("usage: retail_qagame_boot_smoke <pak0.pk3> <1.32b-qvm-directory>");return 2 end if
  archive=pk3.open(args[0]);map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"))
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  if len(state.context.errors)!=0 then print("Retail VM error after init: "+state.context.errors[0]);return error(7642,"retail qagame init error") end if
  worldHit=match.traceWorld(state.context,[216.0,1328.0,128.0],[-15.0,-15.0,-24.0],[15.0,15.0,32.0],[216.0,1328.0,-1024.0],1023,0x2010001,false)
  if worldHit.fraction<=0.0 or worldHit.fraction>=1.0 or worldHit.entityNum!=1022 or worldHit.planeNormal[2]!=1.0 then return error(7642,"retail qagame host did not expose q3dm1 BSP collision") end if
  match.connectLocal(state,0)
  if len(state.context.errors)!=0 then print("Retail VM error after connect: "+state.context.errors[0]);return error(7642,"retail qagame connect error") end if
  initial=match.snapshot(state,0);if initial is error then return initial end if
  for frame=1 to 8
    command=qworld.userCommand(1000+frame*50,[0,0,0],0,2,127,0,0);thought=match.submitUsercmd(state,0,command);if thought is error then return thought end if
    match.runFrame(state,1000+frame*50);if len(state.context.errors)!=0 then print("Retail VM error after frame "+str(frame)+": "+state.context.errors[0]);return error(7642,"retail qagame frame error") end if
  end for
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  if snapshot.playerState.commandTime!=1400 or snapshot.playerState.origin==initial.playerState.origin then return error(7642,"retail qagame did not consume and simulate usercmd movement") end if
  if snapshot.playerState.clientNum!=0 or len(snapshot.entities)==0 then return error(7641,"retail qagame snapshot missing client state or entities") end if
  for each entity in snapshot.entities if entity.pos.trType<0 or entity.pos.trType>5 or entity.apos.trType<0 or entity.apos.trType>5 then print("Invalid snapshot trajectory entity="+str(entity.number)+" pos="+str(entity.pos.trType)+" apos="+str(entity.apos.trType));return error(7642,"invalid qagame entity trajectory") end if end for
  client=match.bootCgame(state);if client is error then return client end if
  if len(state.context.errors)!=0 then print("Retail VM error after cgame init: "+state.context.errors[0]);return error(7642,"retail cgame init error") end if
  predicted=qworld.userCommand(1450,[0,0,0],0,2,127,0,0);thought=match.submitUsercmd(state,0,predicted);if thought is error then return thought end if
  match.drawCgame(state,1450)
  if len(state.context.errors)!=0 then print("Retail VM error: "+state.context.errors[0]);return error(7642,"retail VM emitted an engine error") end if
  if state.context.cgameCollisionQueries==0 then return error(7642,"retail cgame prediction did not query collision") end if
  if len(state.context.scene.entities)==0 or len(state.context.renderQueue.commands)==0 or len(state.context.soundCommands)==0 then return error(7642,"retail cgame did not submit scene, 2D or sound commands") end if
  linked=0;for each ent in state.context.spatialScene.entities if ent.linked then linked=linked+1 end if end for
  if linked<len(snapshot.entities) or len(snapshot.entities)==0 then return error(7642,"PVS snapshot contains an invalid linked-entity selection") end if
  print("PASS: retail QVM match entities="+str(state.context.entityCount)+" stride="+str(state.context.entityStride)+" frames="+str(state.context.frames)+" snapshotEntities="+str(len(snapshot.entities))+" spatialLinked="+str(linked)+" worldFraction="+str(worldHit.fraction)+" commandTime="+str(snapshot.playerState.commandTime)+" predictionTraces="+str(state.context.cgameCollisionQueries)+" health="+str(snapshot.playerState.stats[0])+" assets="+str(len(state.context.assets))+" sceneEntities="+str(len(state.context.scene.entities))+" lights="+str(len(state.context.scene.dlights))+" draw2D="+str(len(state.context.renderQueue.commands))+" sounds="+str(len(state.context.soundCommands)))
  match.shutdown(state);return 0
end function
