import mq3.client.cinematic_runtime as cinematics
import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import mq3.renderer.qvm_video_materials as videoMaterials
import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser

struct ProbeMaterial stages end struct
struct ProbeCatalog materials end struct
struct ProbeFrame width height pixels end struct

function require(ok,label) if not ok then return error(7695,"QVM video material probe: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return error(7695,"usage: qvm_video_materials_retail_probe <pak0.pk3>") end if
  count=0;archive=pk3.open(args[0]);if archive is error then return archive end if
  source="textures/miniquake3/video {\n nopicmip\n {\n  videoMap video/idlogo.RoQ\n  rgbGen identity\n  tcMod scroll .125 0\n }\n}\n"
  index=shaderIndex.build(source);parsed=shaderParser.parseIndexed(index,"textures/miniquake3/video")
  count=count+require(parsed!=void and len(parsed.stages)==1,"videoMap shader parses")
  count=count+require(parsed.stages[0].mapMode=="video" and parsed.stages[0].images==["video/idlogo.RoQ"],"cinematic path retained")
  resolved=materials.runtimeStages(archive,index,"textures/miniquake3/video",40,48);stages=resolved[0]
  count=count+require(len(stages)==1 and materials.isVideoStage(stages[0]),"runtime video stage retained without static image decode")
  count=count+require(materials.videoName(stages[0])=="video/idlogo.RoQ" and stages[0].clampTexture,"video stage uses scratch clamp sampling")
  count=count+require(stages[0].slots==[40] and resolved[1]==41 and len(stages[0].uvMods)==1,"seed slot and shader state retained")

  runtime=cinematics.create(archive);manager=videoMaterials.create(runtime,400,cinematics.MAX_HANDLES)
  catalog=ProbeCatalog([ProbeMaterial(stages)]);bound=videoMaterials.bindCatalog(manager,catalog,1000)
  count=count+require(bound==1 and len(manager.bindings)==1,"catalog video stage bound")
  binding=manager.bindings[0]
  count=count+require(binding.handle==0 and binding.slot==400 and stages[0].slots==[400],"stable handle scratch slot installed")
  count=count+require(runtime.handles[0].looping and runtime.handles[0].silent and runtime.handles[0].shader,"CIN loop/silent/shader flags installed")
  uploads=videoMaterials.update(manager,1000)
  count=count+require(len(uploads)==1 and uploads[0].slot==400,"first frame requests one scratch upload")
  count=count+require(uploads[0].width==256 and uploads[0].height==256 and len(uploads[0].pixels)==256*256*4,"CIN_UploadCinematic 256x256 contract")
  count=count+require(len(cinematics.takeDraws(runtime))==0 and len(cinematics.takeAudio(runtime,0))==0,"shader update emits neither explicit quad nor audio")
  count=count+require(len(videoMaterials.update(manager,1000))==0,"clean frame does not re-upload")
  second=videoMaterials.update(manager,1040)
  count=count+require(len(second)==1 and runtime.handles[0].decoder.frameCount>=2,"shader bind advances and uploads timed frames")
  rebound=videoMaterials.bindCatalog(manager,catalog,1040)
  count=count+require(rebound==1 and len(manager.bindings)==1 and stages[0].slots==[400],"repeat binding reuses handle and slot")
  pixels=bytes([1,2,3,4,5,6,7,8]);scaled=videoMaterials.scratchPixels(ProbeFrame(2,1,pixels))
  count=count+require(len(scaled)==256*256*4 and slice(scaled,0,4)==bytes([1,2,3,4]) and slice(scaled,1020,4)==bytes([5,6,7,8]),"scratch resampler spans source pixels")
  videoMaterials.close(manager);count=count+require(cinematics.run(runtime,0,1080)==cinematics.FMV_EOF,"closing binding stops shader cinematic")
  print("PASS: "+str(count)+" QVM video material retail contracts handle=0 slot=400 frame=256x256");return 0
end function
