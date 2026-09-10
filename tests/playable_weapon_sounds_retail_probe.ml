import mq3.client.playable_weapon_sounds as sounds
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then print("usage: playable_weapon_sounds_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=sounds.load(archive);if catalog is error then return catalog end if
  if len(catalog.weapons)!=9 then return error(7572,"retail weapon catalog is incomplete") end if
  if len(catalog.clips)!=21 then return error(7572,"retail clip de-duplication changed") end if
  totalBytes=0
  for each clip in catalog.clips
    sound=clip.sound
    if sound.sampleRate<4000 or len(sound.samples)<1 then return error(7572,"invalid decoded PCM "+clip.path) end if
    totalBytes=totalBytes+len(sound.samples)
  end for
  for each def in sounds.definitions()
    weapon=sounds.find(catalog,def.classname);if weapon==void then return error(7572,"missing "+def.classname) end if
    if sounds.fireSound(catalog,def.weapon,0)==void then return error(7572,"missing fire sound "+def.weapon) end if
    if sounds.pickupSound(catalog,def.weapon)==void then return error(7572,"missing pickup sound "+def.weapon) end if
    if len(def.impactPaths)>0 and sounds.impactSound(catalog,def.weapon,0)==void then return error(7572,"missing impact sound "+def.weapon) end if
  end for
  print("PASS: retail weapon sounds 9 weapons / "+str(len(catalog.clips))+" unique WAVs / "+str(totalBytes)+" PCM bytes");return 0
end function
