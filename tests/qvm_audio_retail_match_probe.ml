import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.audio.qvm_sound_assets as soundAssets
import mq3.audio.qvm_playback as playback
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then return error(7654,"usage: qvm_audio_retail_match_probe <pak0.pk3> <qvm-directory>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if
  for frame=1 to 8
    command=qworld.userCommand(1000+frame*50,[0,0,0],0,2,127,0,0);thought=match.submitUsercmd(state,0,command);if thought is error then return thought end if
    ran=match.runFrame(state,1000+frame*50);if ran is error then return ran end if
  end for
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  client=match.bootCgame(state);if client is error then return client end if
  predicted=qworld.userCommand(1450,[0,0,0],0,2,127,0,0);thought=match.submitUsercmd(state,0,predicted);if thought is error then return thought end if
  drawn=match.drawCgame(state,1450);if drawn is error then return drawn end if
  catalog=soundAssets.load(archive,state.context.assets,state.context.assetKinds);if catalog is error then return catalog end if
  if catalog.registered<1 or len(catalog.clips)<1 then return error(7654,"retail cgame sound registry did not resolve PCM") end if
  runtime=playback.create(catalog,22050,1024);if runtime is error then return runtime end if
  result=playback.apply(runtime,state.context.soundCommands);if result is error then return result end if
  if result.applied<1 or runtime.listener.origin==void then return error(7654,"retail listener commands were not applied") end if
  qvmApplied=result.applied;qvmMissing=result.missing
  first=catalog.clips[0]
  injected=match.soundEvent("local",-1,6,first.handle,void,void,void,false,"","")
  result=playback.apply(runtime,[injected]);if result is error or result.applied!=1 then return error(7654,"retail registered handle did not start") end if
  chunk=playback.render(runtime);if chunk is error then return chunk end if
  if chunk.audibleVoices<1 or chunk.peak<=0.0 or len(chunk.samples)!=4096 then return error(7654,"retail QVM PCM did not reach mixer output voices="+str(chunk.audibleVoices)+" bytes="+str(len(chunk.samples))+" peak="+str(chunk.peak)) end if
  print("PASS: retail QVM audio registered="+str(catalog.registered)+" decoded="+str(len(catalog.clips))+" missing="+str(len(catalog.missing))+" commands="+str(len(state.context.soundCommands))+" applied="+str(qvmApplied)+" unresolvedCommands="+str(qvmMissing)+" voices="+str(chunk.audibleVoices)+" peak="+str(chunk.peak))
  match.shutdown(state);return 0
end function
