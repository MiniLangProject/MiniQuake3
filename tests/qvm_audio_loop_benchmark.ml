// q3dm1 has six fire1 target_speakers which register the same loop each frame.
import std.time as time
import mq3.audio.qvm_sound_assets as assets
import mq3.audio.qvm_playback as playback
import mq3.format.pk3 as pk3

struct Command kind entity channel handle origin velocity axis flag text text2 end struct

function main(args)
  if len(args)!=1 then return error(7653,"expected retail pak0.pk3") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=assets.load(archive,["sound/world/fire1.wav"],["sound"]);if catalog is error then return catalog end if
  if len(catalog.clips)!=1 then return error(7653,"retail fire1 was not decoded") end if
  state=playback.create(catalog,22050,256)
  commands=array(7,void);commands[0]=Command("clearLoops",-1,0,0,void,void,void,false,"","")
  for source=1 to 6 commands[source]=Command("loop",source,0,1,[source*100.0,0.0,0.0],[0.0,0.0,0.0],void,false,"","") end for
  started=time.ticks();applied=0
  for frame=0 to 19
    result=playback.apply(state,commands);if result is error then return result end if
    if result.missing!=0 or len(state.loops)!=6 then return error(7653,"retail fire loop was lost") end if
    applied=applied+result.applied
  end for
  elapsed=time.ticks()-started
  print "Retail loop apply: frames=20 commands="+str(applied)+" elapsedMs="+str(elapsed)+" averageMs="+str(elapsed/20.0)+" monoCacheEntries="+str(state.monoCache.len())
  return 0
end function
