import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.game.bg_public as bg
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.playable_materials as materials
import mq3.renderer.qvm_scene_materials as sceneMaterials

function require(ok,label) if not ok then return error(7685,"player skin warmup: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return error(7685,"usage: qvm_player_skin_warm_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  assets=["models/players/crash/upper_default.skin","models/players/crash/head_default.skin","models/players/sarge/lower_default.skin"]
  kinds=["skin","skin","model"]
  catalog=sceneMaterials.buildIndexed(archive,[],assets,kinds,1500,500,void,scripts);if catalog is error then return catalog end if
  firstSlot=catalog.nextTextureSlot;count=0
  warmed=sceneMaterials.warmRegisteredPlayerSkins(catalog,archive,assets,kinds);if warmed is error then return warmed end if
  count=count+require(warmed==2 and len(catalog.loadedSkins)==2,"only registered Crash skin handles warmed")
  count=count+require(catalog.imageCache.images.get("models/players/crash/crash.tga")!=void and catalog.imageCache.images.get("models/players/crash/crash_t.tga")!=void,"Retail Crash base and torso decoded before scene")
  count=count+require(catalog.imageCache.images.get("textures/effects/envmapblue.jpg")!=void,"Crash torso shader's environment map decoded before scene")
  count=count+require(len(catalog.materials)==0 and len(catalog.textures)==0 and catalog.nextTextureSlot==firstSlot,"warmup reserves no materials or texture slots")
  before=catalog.imageCache.misses
  base=materials.loadImageCached(archive,"models/players/crash/crash.tga",catalog.imageCache)
  torso=materials.loadImageCached(archive,"models/players/crash/crash_t.tga",catalog.imageCache)
  count=count+require(base!=void and torso!=void and base[1]!=void and torso[1]!=void and catalog.imageCache.misses==before,"subsequent scene load reuses warm images")
  count=count+require(sceneMaterials.warmRegisteredPlayerSkins(catalog,archive,assets,kinds)==0 and catalog.imageCache.misses==before,"repeat warmup skips processed skins")
  hologram="models/mapobjects/bitch/fembotbig.md3";xray="models/mapobjects/skel/xray.md3"
  model=md3.loadPacked(pk3.read(archive,hologram));if model is error then return model end if
  other=md3.loadPacked(pk3.read(archive,xray));if other is error then return other end if
  registry=[hologram,xray,"*1"];modelKinds=["model","model","model"]
  loadedModels=[sceneGeometry.md3Lods([model,model]),other,void];config=array(bg.CS_MODELS+4,"")
  config[bg.CS_MODELS+1]="*1";config[bg.CS_MODELS+2]="MODELS/MAPOBJECTS/BITCH/FEMBOTBIG.MD3"
  nextSlot=catalog.nextTextureSlot;textureCount=len(catalog.textures)
  warmed=sceneMaterials.warmServerModelImages(catalog,archive,registry,modelKinds,loadedModels,config)
  count=count+require(warmed==1 and catalog.imageCache.images.get("models/mapobjects/bitch/hologirl.tga")!=void and catalog.imageCache.images.get("models/mapobjects/bitch/hologirl2.jpg")!=void,"registered MD3 stages decoded once across repeated LODs")
  count=count+require(catalog.imageCache.images.get("models/mapobjects/skel/xray.tga")==void and catalog.nextTextureSlot==nextSlot and len(catalog.textures)==textureCount,"unlisted model and runtime texture slots stay untouched")
  before=catalog.imageCache.misses
  ignored=materials.runtimeStagesCached(archive,catalog.scriptIndex,"models/mapobjects/bitch/hologirl",nextSlot,nextSlot+32,catalog.imageCache)
  count=count+require(catalog.imageCache.misses==before and len(ignored[0])>0,"visible hologram shader reuses its decoded stage images")
  print("PASS: "+str(count)+" QVM skin and server model warm retail contracts");return 0
end function
