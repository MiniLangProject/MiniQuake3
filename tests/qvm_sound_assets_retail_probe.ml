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
  print("PASS: retail QVM sound handles=3 wavs="+str(len(catalog.clips))+" pcmBytes="+str(total));return 0
end function
