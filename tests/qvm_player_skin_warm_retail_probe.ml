import mq3.format.pk3 as pk3
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
  print("PASS: "+str(count)+" QVM player skin warm retail contracts");return 0
end function
