import mq3.client.baseq3_hud as hud
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then return error(7582,"usage: probe pak0.pk3") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=hud.load(archive,217,39);if catalog is error then return catalog end if
  pixels=0
  for each asset in catalog.assets pixels=pixels+asset.image.width*asset.image.height end for
  if len(catalog.assets)!=hud.REQUIRED_TEXTURES or pixels<=0 then return error(7582,"incomplete retail HUD catalog") end if
  ammoKeys=["ammo_machinegun","ammo_shotgun","ammo_grenadelauncher","ammo_rocketlauncher","ammo_lightning","ammo_railgun","ammo_plasmagun","ammo_bfg"]
  for each key in ammoKeys
    asset=hud.find(catalog,key)
    if asset==void or asset.image.width<=0 or asset.image.height<=0 then return error(7582,"missing retail ammo icon "+key) end if
  end for
  print("PASS: retail Baseq3 HUD "+str(len(catalog.assets))+" textures / 8 ammo icons / "+str(pixels)+" pixels");return 0
end function
