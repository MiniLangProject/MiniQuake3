import mq3.client.playable_ambient_sounds as catalogLoader
import mq3.audio.spatial_mixer as mixer
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=1 then return error(7642,"pak0 path required") end if
  archive=pk3.open(args[0]);map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));catalog=catalogLoader.load(map,archive)
  if len(catalog.speakers)!=8 or len(catalog.uniqueSounds)!=1 then return error(7643,"unexpected q3dm1 fire catalog") end if
  state=mixer.create(22050,1024);id=1
  for each speaker in catalog.speakers mixer.addLoop(state,id,speaker.origin,speaker.sound,1.0,speaker.globalSound);id=id+1 end for
  if len(state.sources)!=8 then return error(7643,"q3dm1 fire loops not admitted") end if
  for each source in state.sources
    if source.globalSound or source.sound.sampleRate!=22050 or source.sound.channels!=1 or source.sound.bitsPerSample!=16 then return error(7643,"unexpected q3dm1 fire source") end if
  end for
  listener=state.sources[0].origin;chunk=mixer.render(state,listener,[0.0,1.0,0.0])
  if len(chunk.samples)!=4096 or chunk.audibleSources<1 or chunk.limiterGain<=0.0 or chunk.limiterGain>1.0 then return error(7643,"invalid q3dm1 spatial mix") end if
  print("PASS: q3dm1 spatial fires=8 rate=22050 stereoFrames="+str(chunk.frames)+" audible="+str(chunk.audibleSources));return 0
end function
