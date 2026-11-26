import mq3.audio.qvm_sound_assets as assets
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then return error(7653,"usage: qvm_sound_assets_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  names=["models/weapons2/rocketl/rocketl.md3","sound/weapons/rocket/rocklf1a.wav","gfx/2d/bigchars","sound/misc/menu1.wav","sound/feedback/1_frag.wav"]
  kinds=["model","sound","shaderNoMip","sound","sound"]
  catalog=assets.load(archive,names,kinds);if catalog is error then return catalog end if
  if catalog.registered!=3 or len(catalog.clips)!=3 or len(catalog.missing)!=0 then return error(7653,"retail handle catalog incomplete") end if
  if assets.clipForHandle(catalog,2)==void or assets.clipForHandle(catalog,4)==void or assets.clipForHandle(catalog,5)==void then return error(7653,"retail global handles were not preserved") end if
  total=0;for each clip in catalog.clips total=total+len(clip.sound.samples) end for
  if total<1 then return error(7653,"retail PCM is empty") end if
  originalClip=assets.clipForHandle(catalog,2)
  result=assets.sync(catalog,names+["gfx/2d/crosshaira"],kinds+["shader"]);if result is error then return result end if
  if catalog.scanned!=6 or catalog.registered!=3 then return error(7653,"non-sound registration changed the sound catalog") end if
  result=assets.sync(catalog,names+["gfx/2d/crosshaira","sound/weapons/rocket/rocklf1a.wav","sound/absent_file.wav"],kinds+["shader","sound","sound"]);if result is error then return result end if
  if assets.clipForHandle(catalog,7)==void or not assets.missingForHandle(catalog,8) or assets.clipForHandle(catalog,2)!=originalClip then return error(7653,"incremental sound handles were replaced or dropped") end if
  print("PASS: retail QVM sound handles=3 wavs=3 pcmBytes="+str(total)+" incremental sound and failed handle preserved");return 0
end function
