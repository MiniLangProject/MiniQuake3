import mq3.client.playable_weapon_sounds as sounds
import mq3.audio.wav as wav

function require(ok,label) if not ok then return error(7571,"Weapon-sound contract: "+label) end if;return 1 end function
function same(a,b) if len(a)!=len(b) then return false end if;for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for;return true end function
function le16(value) return bytes([value&255,(value>>8)&255]) end function
function le32(value) return bytes([value&255,(value>>8)&255,(value>>16)&255,(value>>24)&255]) end function
function pcm(sample)
  payload=le16(1)+le16(1)+le32(8000)+le32(8000)+le16(1)+le16(8)
  body=bytes("WAVEfmt ")+le32(len(payload))+payload+bytes("data")+le32(1)+bytes([sample])+bytes([0])
  return bytes("RIFF")+le32(len(body))+body
end function
function fakeClip(path,value) return sounds.Clip(path,wav.Sound(8000,1,8,1,8000,bytes([value]))) end function
function weapon(def,fire,impact,pickup) return sounds.WeaponSounds(def,fire,impact,pickup) end function

function main(args)
  count=0;defs=sounds.definitions()
  count=count+require(len(defs)==9,"nine weapon families")
  count=count+require(sounds.definition("MACHINEGUN").classname=="weapon_machinegun","short case-insensitive lookup")
  count=count+require(sounds.definition("weapon_rocketlauncher").weapon=="rocket","classname lookup")
  count=count+require(sounds.definition("rocketlauncher").weapon=="rocket","long rocket alias")
  count=count+require(sounds.definition("railgun").weapon=="rail","long rail alias")
  count=count+require(sounds.definition("plasmagun").weapon=="plasma","long plasma alias")
  count=count+require(sounds.definition("grenadelauncher").weapon=="grenade","long grenade alias")
  count=count+require(sounds.definition("gauntlet").firePaths[0]=="sound/weapons/melee/fstrun.wav","retail gauntlet firing loop")
  machine=sounds.definition("machinegun")
  count=count+require(len(machine.firePaths)==4 and machine.firePaths[0]=="sound/weapons/machinegun/machgf1b.wav","machinegun fire variants")
  count=count+require(len(machine.impactPaths)==3 and machine.impactPaths[2]=="sound/weapons/machinegun/ric3.wav","machinegun ricochets")
  count=count+require(len(sounds.definition("shotgun").impactPaths)==0,"shotgun has no invented impact sound")
  count=count+require(sounds.definition("rocket").impactPaths[0]=="sound/weapons/rocket/rocklx1a.wav","rocket explosion")
  count=count+require(len(sounds.definition("lightning").impactPaths)==3,"lightning hit variants")
  count=count+require(sounds.definition("rail").impactPaths[0]=="sound/weapons/plasma/plasmx1a.wav","retail rail impact mapping")
  count=count+require(sounds.definition("plasma").firePaths[0]=="sound/weapons/plasma/hyprbf1a.wav","plasma fire")
  count=count+require(sounds.definition("grenade").impactPaths[0]=="sound/weapons/rocket/rocklx1a.wav","grenade explosion")
  count=count+require(sounds.definition("bfg").impactPaths[0]=="sound/weapons/rocket/rocklx1a.wav","BFG explosion")
  for each def in defs count=count+require(def.pickupPath==sounds.PICKUP_PATH,def.weapon+" pickup") end for
  decoded=sounds.decodeClip("fixture.wav",pcm(129));count=count+require(decoded.path=="fixture.wav","decoded path retained")
  count=count+require(decoded.sound.sampleRate==8000 and same(decoded.sound.samples,bytes([129])),"decoded sound is playable PCM")
  count=count+require(try(sounds.decodeClip("bad.wav",bytes([1,2,3]))) is error,"bad WAV rejected")
  fire=[fakeClip("fire0",10),fakeClip("fire1",11)];impact=[fakeClip("hit0",20)];pickup=fakeClip(sounds.PICKUP_PATH,30)
  catalog=sounds.Catalog([weapon(machine,fire,impact,pickup)],[fire[0],fire[1],impact[0],pickup])
  count=count+require(sounds.find(catalog,"WEAPON_MACHINEGUN").definition==machine,"catalog classname lookup")
  count=count+require(sounds.find(catalog,"weapon_bfg")==void,"catalog miss")
  count=count+require(sounds.fireSound(catalog,"machinegun",0).samples[0]==10,"first fire selection")
  count=count+require(sounds.fireSound(catalog,"machinegun",3).samples[0]==11,"wrapped fire selection")
  count=count+require(sounds.fireSound(catalog,"machinegun",-1).samples[0]==11,"negative sequence selection")
  count=count+require(sounds.impactSound(catalog,"machinegun",9).samples[0]==20,"impact selection")
  count=count+require(sounds.pickupSound(catalog,"machinegun").samples[0]==30,"pickup selection")
  empty=sounds.Catalog([weapon(sounds.definition("shotgun"),[fakeClip("shot",40)],[],pickup)],[])
  count=count+require(sounds.impactSound(empty,"shotgun",0)==void,"absent impact remains silent")
  count=count+require(sounds.fireSound(catalog,"unknown",0)==void and sounds.pickupSound(catalog,"unknown")==void,"unknown sounds remain silent")
  count=count+require(sounds.findClip(catalog.clips,"FIRE1")==fire[1],"case-insensitive clip lookup")
  count=count+require(try(sounds.load(void)) is error,"void archive rejected")
  count=count+require(try(sounds.play(void)) is error,"void playback rejected before native call")
  print("PASS: "+str(count)+" playable weapon-sound contracts");return 0
end function
