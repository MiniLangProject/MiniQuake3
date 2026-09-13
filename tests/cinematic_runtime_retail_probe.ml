import mq3.client.cinematic_runtime as cinematic
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then return error(7694,"usage: cinematic_runtime_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;state=cinematic.create(archive);if state is error then return state end if
  handle=cinematic.play(state,"idlogo.RoQ",0,0,320,240,cinematic.CIN_LOOP,1000);if handle<0 then return error(7694,"retail RoQ did not open") end if
  duplicate=cinematic.play(state,"video/idlogo.RoQ",1,2,3,4,cinematic.CIN_LOOP,1000);if duplicate!=handle then return error(7694,"non-system duplicate did not reuse handle") end if
  status=cinematic.run(state,handle,1000);if status!=cinematic.FMV_PLAY then return error(7694,"retail RoQ did not enter play state") end if
  drawn=cinematic.draw(state,handle);if drawn==void or drawn.frame.width<1 or drawn.frame.height<1 or len(drawn.frame.pixels)!=drawn.frame.width*drawn.frame.height*4 then return error(7694,"retail RoQ produced no RGBA frame") end if
  audio=cinematic.takeAudio(state,handle);if len(audio)<1 or len(audio[0].samples)<1 then return error(7694,"retail RoQ produced no PCM audio") end if
  if not cinematic.setExtents(state,handle,11,22,333,222) then return error(7694,"retail extents failed") end if;next=cinematic.draw(state,handle);if next.extents.x!=11 or next.extents.height!=222 or not next.dirty then return error(7694,"draw extents not retained") end if
  presented=cinematic.presentation(next,640,480,1280,720);if presented.x!=22 or presented.y!=33 or presented.width!=666 or presented.height!=333 or presented.sourceWidth!=512 or presented.sourceHeight!=256 then return error(7694,"native cinematic presentation scaling failed") end if
  presented=cinematic.presentation(next,640,480,1280,720);if presented.x!=22 or presented.y!=33 or presented.width!=666 or presented.height!=333 then return error(7694,"virtual cinematic extents were not scaled") end if
  status=cinematic.run(state,handle,1040);if status!=cinematic.FMV_PLAY or state.handles[handle].decoder.frameCount<2 then return error(7694,"timed frame advance failed") end if
  frames=state.handles[handle].decoder.frameCount;width=drawn.frame.width;height=drawn.frame.height;cinematic.stop(state,handle);if cinematic.run(state,handle,1080)!=cinematic.FMV_EOF then return error(7694,"stopped handle did not report EOF") end if
  silent=cinematic.play(state,"video/idlogo.RoQ",0,0,64,64,cinematic.CIN_SILENT,2000);cinematic.run(state,silent,2000);if len(cinematic.takeAudio(state,silent))!=0 then return error(7694,"silent cinematic queued audio") end if
  ticks=0;status=cinematic.FMV_PLAY;while status==cinematic.FMV_PLAY and ticks<1000 ticks=ticks+1;status=cinematic.run(state,silent,2000+ticks*34) end while
  decodedFrames=state.handles[silent].decoder.frameCount;if status!=cinematic.FMV_EOF or decodedFrames!=state.handles[silent].movie.videoFrames then return error(7694,"full retail stream did not reach exact EOF") end if
  cinematic.closeAll(state);print("PASS: retail RoQ "+str(width)+"x"+str(height)+" frames="+str(decodedFrames)+" audioChunks="+str(len(audio))+" extents=333x222");return 0
end function
