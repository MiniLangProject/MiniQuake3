import mq3.format.pk3 as pk3
import mq3.renderer.player_model_assembly as player
import mq3.client.playable_item_models as items
import mq3.client.playable_weapon_barrel as barrel
import mq3.client.playable_muzzle_flash as flash

function main(args)
  if len(args)<1 then print("usage: player_model_assembly_retail_smoke <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  base="models/players/sarge/"
  lower=pk3.read(archive,base+"lower.md3");if lower is error then return lower end if
  upper=pk3.read(archive,base+"upper.md3");if upper is error then return upper end if
  head=pk3.read(archive,base+"head.md3");if head is error then return head end if
  value=player.load(lower,upper,head);if value is error then return value end if
  still=player.animation(0,0,0.0)
  assembled=player.assemble(value,still,still,still,player.identityTransform());if assembled is error then return assembled end if
  weapon=player.upperAttachment(assembled,"tag_weapon");if weapon is error then return weapon end if
  catalog=items.loadCatalog(archive,["weapon_machinegun","barrel_machinegun","flash_machinegun"],64,32,3);if catalog is error then return catalog end if
  gun=items.find(catalog,"weapon_machinegun");if gun==void then return error(7531,"retail machinegun attachment asset missing") end if
  gunTransform=items.transform(weapon.origin,weapon.axis,1.0);gunTriangles=items.renderAsset(gun,gunTransform,512);if gunTriangles is error then return gunTriangles end if
  barrelTriangles=barrel.render(catalog,"weapon_machinegun",gunTransform,0.0,512);if barrelTriangles is error then return barrelTriangles end if
  flashResult=flash.render(catalog,"weapon_machinegun",gunTransform,100,100,false,512);if flashResult is error then return flashResult end if
  flashMuzzle=flash.muzzleTransform(catalog,"weapon_machinegun",gunTransform);if flashMuzzle is error then return flashMuzzle end if
  flashLight=flash.dynamicLight(catalog,"weapon_machinegun",gunTransform,100,100,false);if flashLight is error then return flashLight end if
  if len(gunTriangles)==0 or len(barrelTriangles)==0 or len(flashResult.triangles)==0 or flashMuzzle==void or flashLight==void or flashMuzzle.origin!=flashLight.origin then return error(7531,"retail attached machinegun, barrel or flash produced no shared muzzle/light") end if
  triangles=player.render(assembled,2);if triangles is error then return triangles end if
  if len(triangles)<3 then return error(7531,"retail player produced too few triangles") end if
  print("PASS: retail sarge lower="+str(value.lower.numSurfaces)+" upper="+str(value.upper.numSurfaces)+" head="+str(value.head.numSurfaces)+" sampled="+str(len(triangles))+" torsoZ="+str(assembled.upper.transform.origin[2])+" headZ="+str(assembled.head.transform.origin[2])+" weaponZ="+str(weapon.origin[2])+" muzzleZ="+str(flashMuzzle.origin[2])+" weaponTriangles="+str(len(gunTriangles))+" barrelTriangles="+str(len(barrelTriangles))+" flashTriangles="+str(len(flashResult.triangles))+" flashRadius="+str(flashLight.radius));return 0
end function
