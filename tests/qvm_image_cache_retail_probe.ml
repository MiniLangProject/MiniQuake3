// SPDX-License-Identifier: GPL-2.0-or-later
// Retail image reuse keeps decoded pixels shared while each shader owns slots.
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.playable_materials as materials

function require(ok,label) if not ok then return error(7699,"Retail image cache: "+label) end if;return 1 end function
function main(args)
  archive=pk3.open(args[0]);if archive is error then return archive end if
  path="textures/base_door/shinymetaldoor_outside3a2.tga"
  loaded=materials.loadImage(archive,path);if loaded==void then return error(7699,"missing Retail door image") end if
  stage=materials.RuntimeStage([loaded[0]],[loaded[1]],[42],0.0,[],0,0,"texture","identity",void,"identity",void,[255,255,255,255],false,false,true,false,256.0,[])
  world=materials.Catalog([materials.Material(0,"door",loaded[0],loaded[1],42,[stage],[],false,3.0,false,false,0.0,0.0,false)],0,1,1,1,0,0)
  cache=materials.imageCache(archive);materials.seedImageCacheFromCatalog(cache,world)
  count=0;count=count+require(cache.count==1,"world image seeded once")
  reused=materials.loadImageCached(archive,path,cache)
  count=count+require(reused!=void and reused[1]==loaded[1] and cache.hits==1 and cache.misses==0,"same archive reuses decoded image identity")
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  first=materials.runtimeStagesCached(archive,scripts[0],"textures/base_door/shinymetaldoor_outside3a2",300,310,cache)
  second=materials.runtimeStagesCached(archive,scripts[0],"textures/base_door/shinymetaldoor_outside3a2",320,330,cache)
  count=count+require(len(first[0])>0 and len(second[0])>0 and first[0][0].slots[0]==300 and second[0][0].slots[0]==320,"stage slots remain independent")
  count=count+require(first[0][0].images[0]==second[0][0].images[0],"new shader registrations share pixel image")
  map=bsp.load(pk3.read(archive,"maps/q3dm0.bsp"));if map is error then return map end if
  worldCatalog=materials.loadIndexed(archive,map,400,64,scripts[0],scripts[1]);if worldCatalog is error then return worldCatalog end if
  worldDoor=void
  for each material in worldCatalog.materials if stringEqualsIgnoreCaseAscii(material.shaderName,"textures/base_door/shinymetaldoor_outside3a2") then worldDoor=material;break end if end for
  count=count+require(worldDoor!=void,"q3dm0 world catalog includes the animated door shader")
  worldCache=materials.imageCache(archive);materials.seedImageCacheFromCatalog(worldCache,worldCatalog)
  worldHitsBefore=worldCache.hits;door=materials.runtimeStagesCached(archive,scripts[0],"textures/base_door/shinymetaldoor_outside3a2",400,420,worldCache)
  matchingPixels=0
  for each stage in door[0]
    imageIndex=0;while imageIndex<len(stage.images)
      for each worldStage in worldDoor.stages
        worldImageIndex=0;while worldImageIndex<len(worldStage.images)
          if stringEqualsIgnoreCaseAscii(stage.imageNames[imageIndex],worldStage.imageNames[worldImageIndex]) then
            if stage.images[imageIndex].width==worldStage.images[worldImageIndex].width and stage.images[imageIndex].height==worldStage.images[worldImageIndex].height and stage.images[imageIndex].pixels==worldStage.images[worldImageIndex].pixels then matchingPixels=matchingPixels+1 end if
          end if
          worldImageIndex=worldImageIndex+1
        end while
      end for
      imageIndex=imageIndex+1
    end while
  end for
  // WorldCatalog decodes duplicate filenames separately today. The seeded
  // cache retains the first image, which can differ in object identity from
  // this door material while having identical Retail pixels.
  count=count+require(matchingPixels==3 and worldCache.hits-worldHitsBefore==3,"q3dm0 reuses all three decoded door stage images across world and scene slots")
  other=pk3.open(args[0]);if other is error then return other end if
  separate=materials.loadImageCached(other,path,cache)
  count=count+require(separate!=void and separate[1]!=loaded[1] and separate[1].pixels==loaded[1].pixels and cache.hits>=1,"archive identity rejects stale decoded image")
  print "PASS: "+str(count)+" Retail image cache contracts";return 0
end function
