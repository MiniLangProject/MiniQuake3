import mq3.engine.local_qvm_match as match
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then print("usage: retail_qagame_boot_smoke <pak0.pk3> <1.32b-qvm-directory>");return 2 end if
  archive=pk3.open(args[0]);map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"))
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  if len(state.context.errors)!=0 then print("Retail VM error after init: "+state.context.errors[0]);return error(7642,"retail qagame init error") end if
  match.connectLocal(state,0)
  if len(state.context.errors)!=0 then print("Retail VM error after connect: "+state.context.errors[0]);return error(7642,"retail qagame connect error") end if
  for frame=1 to 8 match.runFrame(state,1000+frame*50);if len(state.context.errors)!=0 then print("Retail VM error after frame "+str(frame)+": "+state.context.errors[0]);return error(7642,"retail qagame frame error") end if end for
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  if snapshot.playerState.clientNum!=0 or len(snapshot.entities)==0 then return error(7641,"retail qagame snapshot missing client state or entities") end if
  for each entity in snapshot.entities if entity.pos.trType<0 or entity.pos.trType>5 or entity.apos.trType<0 or entity.apos.trType>5 then print("Invalid snapshot trajectory entity="+str(entity.number)+" pos="+str(entity.pos.trType)+" apos="+str(entity.apos.trType));return error(7642,"invalid qagame entity trajectory") end if end for
  client=match.bootCgame(state);if client is error then return client end if
  if len(state.context.errors)!=0 then print("Retail VM error after cgame init: "+state.context.errors[0]);return error(7642,"retail cgame init error") end if
  match.drawCgame(state,snapshot.serverTime)
  if len(state.context.errors)!=0 then print("Retail VM error: "+state.context.errors[0]);return error(7642,"retail VM emitted an engine error") end if
  if len(state.context.scene.entities)==0 or len(state.context.renderQueue.commands)==0 or len(state.context.soundCommands)==0 then return error(7642,"retail cgame did not submit scene, 2D or sound commands") end if
  print("PASS: retail QVM match entities="+str(state.context.entityCount)+" frames="+str(state.context.frames)+" snapshotEntities="+str(len(snapshot.entities))+" health="+str(snapshot.playerState.stats[0])+" assets="+str(len(state.context.assets))+" sceneEntities="+str(len(state.context.scene.entities))+" lights="+str(len(state.context.scene.dlights))+" draw2D="+str(len(state.context.renderQueue.commands))+" sounds="+str(len(state.context.soundCommands)))
  match.shutdown(state);return 0
end function
