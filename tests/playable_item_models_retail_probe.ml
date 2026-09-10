import mq3.client.playable_item_models as models
import mq3.client.playable_items as items
import mq3.format.bsp as bsp
import mq3.format.md3 as md3
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then print("usage: playable_item_models_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  mapData=pk3.read(archive,"maps/q3dm1.bsp");if mapData is error then return mapData end if
  map=bsp.load(mapData);if map is error then return map end if
  state=items.load(map);if state is error then return state end if
  classnames=[]
  for each source in state.items classnames=classnames+[source.classname] end for
  q3dm1Classnames=classnames
  // Also resolve every supported Baseq3 family so a model found on another map
  // cannot hide a bad path/material behind q3dm1's smaller entity inventory.
  classnames=classnames+["weapon_gauntlet","weapon_machinegun","weapon_shotgun","weapon_grenadelauncher","weapon_rocketlauncher","weapon_lightning","weapon_railgun","weapon_plasmagun","weapon_bfg","weapon_grapplinghook"]
  classnames=classnames+["ammo_bullets","ammo_shells","ammo_grenades","ammo_rockets","ammo_lightning","ammo_slugs","ammo_cells","ammo_bfg"]
  classnames=classnames+["item_health_small","item_health","item_health_large","item_health_mega","item_armor_shard","item_armor_combat","item_armor_body"]
  classnames=classnames+["item_quad","item_enviro","item_haste","item_invis","item_regen","item_flight","holdable_medkit","holdable_teleporter"]
  catalog=models.loadCatalog(archive,classnames,0,96,64);if catalog is error then return catalog end if
  if len(catalog.assets)<1 or len(catalog.textures)<1 then return error(7562,"q3dm1 produced no retail item assets") end if
  if len(catalog.assets)!=33 then return error(7562,"supported retail item catalog is incomplete") end if
  machinegun=models.find(catalog,"weapon_machinegun");if machinegun==void then return error(7563,"retail machinegun asset missing") end if
  first=state.items[0];asset=models.find(catalog,first.classname);if asset==void then return error(7564,"first q3dm1 item asset missing") end if
  triangles=models.renderItem(asset,first.origin,0,1000,48);if triangles is error then return triangles end if
  weaponTriangles=models.renderAsset(machinegun,models.identityTransform(),48);if weaponTriangles is error then return weaponTriangles end if
  if len(triangles)<1 or len(weaponTriangles)<1 then return error(7565,"retail item model emitted no triangles") end if
  pixels=0
  for each texture in catalog.textures pixels=pixels+texture.image.width*texture.image.height end for
  print("PASS: retail q3dm1 item models entities="+str(len(state.items))+" q3dm1Names="+str(len(q3dm1Classnames))+" assets="+str(len(catalog.assets))+" textures="+str(len(catalog.textures))+" pixels="+str(pixels)+" pickupTriangles="+str(len(triangles))+" weaponTriangles="+str(len(weaponTriangles)))
  return 0
end function
