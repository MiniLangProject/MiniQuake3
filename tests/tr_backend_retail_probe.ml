import std.fs as fs
import mq3.format.bsp as bsp
import mq3.renderer.tr_backend_runtime as backend
import mq3.renderer.texture_state as textures
import mq3.renderer.draw_surfs as drawSurfs
function main(args)
  if len(args)!=1 then return error(7723,"expected retail BSP path") end if
  data=fs.readAllBytes(args[0]);map=bsp.load(data);if map is error then return map end if
  if map.counts[13]<=0 or map.counts[1]<=0 then return error(7724,"retail BSP has no render surfaces or shaders") end if
  state=backend.create(textures.create(void,textures.image(1)),640,480,void);state.refdef=backend.Refdef(1000,1.0,0,[],[]);state.viewParms=backend.viewParms(640,480)
  limit=map.counts[13];if limit>64 then limit=64 end if;key=drawSurfs.pack(0,backend.ENTITYNUM_WORLD,0,0);surfaces=[]
  for index=0 to limit-1 surfaces=surfaces+[backend.Surface(key,index)] end for
  rendered=backend.RB_RenderDrawSurfList(state,surfaces,[backend.Shader("retail-world",false,0.0)],0,false,0,false)
  pixels=bytes(256*256*4,127);backend.RE_UploadCinematic(state,256,256,256,256,pixels,0,true)
  if rendered!=limit or len(state.uploads)!=1 or not state.uploads[0].fullUpload then return error(7725,"retail back-end path did not retain work") end if
  print("PASS: retail tr_backend surfaces="+str(map.counts[13])+" shaders="+str(map.counts[1])+" submitted="+str(rendered)+" upload="+str(len(state.uploads)))
  return 0
end function
