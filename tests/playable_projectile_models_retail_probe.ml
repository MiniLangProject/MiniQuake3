import mq3.client.playable_projectile_models as models
import mq3.client.playable_projectile_view as view
import mq3.client.playable_viewer as viewer
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then print("usage: playable_projectile_models_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=models.loadCatalog(archive,0,8);if catalog is error then return catalog end if
  if len(catalog.assets)!=4 or len(catalog.skipped)!=0 then return error(7602,"retail projectile catalog incomplete") end if
  if len(catalog.textures)!=8 then return error(7603,"retail projectile texture count differs from Baseq3") end if
  camera=viewer.camera([0.0,0.0,0.0],0.0,0.0,320.0,0.1)
  styles=[view.STYLE_ROCKET,view.STYLE_PLASMA,view.STYLE_GRENADE,view.STYLE_BFG]
  triangles=0;pixels=0
  for each texture in catalog.textures pixels=pixels+texture.image.width*texture.image.height end for
  for each style in styles
    snapshot=view.flying(style,style,[64.0,0.0,0.0],[96.0+style*8.0,0.0,0.0],1000)
    rendered=models.renderSnapshot(catalog,snapshot,camera,1000,models.MAX_TRIANGLES_PER_PROJECTILE);if rendered is error then return rendered end if
    if rendered.fallback or len(rendered.triangles)<1 then return error(7604,"retail projectile emitted no triangles") end if
    triangles=triangles+len(rendered.triangles)
  end for
  limited=models.loadCatalog(archive,32,1);if limited is error then return limited end if
  if len(limited.assets)!=1 or models.find(limited,view.STYLE_PLASMA)==void or len(limited.skipped)!=3 then return error(7605,"slot exhaustion did not retain plasma fallback plan") end if
  print("PASS: retail projectile models assets="+str(len(catalog.assets))+" textures="+str(len(catalog.textures))+" pixels="+str(pixels)+" triangles="+str(triangles)+" limitedFallbacks="+str(len(limited.skipped)))
  return 0
end function
