import mq3.client.playable_muzzle_flash as flash
import mq3.client.playable_item_models as items
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then print("usage: playable_muzzle_flash_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  names=[];for each def in flash.definitions() names=names+[def.weaponClass,def.flashClass] end for
  catalog=items.loadCatalog(archive,names,0,64,32);if catalog is error then return catalog end if
  if len(catalog.assets)!=18 then return error(7612,"retail weapon/flash catalog incomplete") end if
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];parent=items.transform([0.0,0.0,0.0],identity,1.0)
  triangles=0
  for each def in flash.definitions()
    rendered=flash.render(catalog,def.weaponClass,parent,100,100,true,2048);if rendered is error then return rendered end if
    if len(rendered.triangles)==0 then return error(7612,"empty retail flash "+def.weaponClass) end if
    triangles=triangles+len(rendered.triangles)
  end for
  print("PASS: retail muzzle flashes 9 weapons / "+str(len(catalog.textures))+" textures / "+str(triangles)+" triangles");return 0
end function
