import mq3.client.playable_viewmodel as viewmodel
import mq3.client.playable_item_models as itemModels
import mq3.client.playable_viewer as viewer
import mq3.format.pk3 as pk3

function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.00001 end function

function main(args)
  if len(args)!=1 then print("usage: playable_viewmodel_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  names=["weapon_gauntlet","weapon_machinegun","weapon_shotgun","weapon_grenadelauncher","weapon_rocketlauncher","weapon_lightning","weapon_railgun","weapon_plasmagun","weapon_bfg","weapon_grapplinghook"]
  catalog=viewmodel.loadCatalog(archive,names);if catalog is error then return catalog end if
  if len(catalog.attachments)!=10 or catalog.skipped!=0 then return error(7622,"retail hand catalog incomplete") end if
  for each name in names
    attachment=viewmodel.findAttachment(catalog,name);if attachment==void or len(attachment.frames)<15 then return error(7622,"missing retail hand animation "+name) end if
    tag=viewmodel.tagFromFrame(attachment.frames[0],"tag_weapon");if tag==void then return error(7622,"missing retail tag_weapon "+name) end if
  end for
  machinegun=viewmodel.findAttachment(catalog,"weapon_machinegun");tag=viewmodel.tagFromFrame(machinegun.frames[0],"tag_weapon")
  if tag.origin!=[-6.921875,-2.890625,-7.171875] or not near(tag.axis[1][2],-0.013887549750506878) then return error(7622,"retail machinegun tag drift") end if
  modelCatalog=itemModels.loadCatalog(archive,["weapon_machinegun"],0,8,1);if modelCatalog is error then return modelCatalog end if
  asset=itemModels.find(modelCatalog,"weapon_machinegun");if asset==void then return error(7622,"retail machinegun model missing") end if
  camera=viewer.camera([0.0,0.0,0.0],0.0,0.0,0.0,0.0);projection=viewer.prepareProjection(camera,640,480,90.0,1.0)
  transform=viewmodel.frameWeaponTransform(camera,viewmodel.BobSample(0,0.0,0.0),0,-1000,0.0,0,viewmodel.softwareRendererSettings(),machinegun,0,0,0.0)
  triangles=itemModels.renderAsset(asset,transform,4096);if triangles is error then return triangles end if
  visible=0;projected=0;screenMinX=1000000.0;screenMaxX=-1000000.0;screenMinY=1000000.0;screenMaxY=-1000000.0
  for each triangle in triangles
    vertices=[]
    for corner=0 to 2
      point=viewer.preparedViewPoint(projection,triangle.positions[corner])
      vertices=vertices+[[point[0],point[1],point[2],triangle.texCoords[corner][0],triangle.texCoords[corner][1]]]
    end for
    clipped=viewer.clipNearPolygon(vertices,1.0);if clipped is error then return clipped end if
    if len(clipped)>=3 then
      for index=1 to len(clipped)-2
        a=viewer.projectPreparedView(projection,[clipped[0][0],clipped[0][1],clipped[0][2]])
        b=viewer.projectPreparedView(projection,[clipped[index][0],clipped[index][1],clipped[index][2]])
        c=viewer.projectPreparedView(projection,[clipped[index+1][0],clipped[index+1][1],clipped[index+1][2]])
        projected=projected+1;minX=a.x;if b.x<minX then minX=b.x end if;if c.x<minX then minX=c.x end if
        maxX=a.x;if b.x>maxX then maxX=b.x end if;if c.x>maxX then maxX=c.x end if
        minY=a.y;if b.y<minY then minY=b.y end if;if c.y<minY then minY=c.y end if
        maxY=a.y;if b.y>maxY then maxY=b.y end if;if c.y>maxY then maxY=c.y end if
        if minX<screenMinX then screenMinX=minX end if;if maxX>screenMaxX then screenMaxX=maxX end if
        if minY<screenMinY then screenMinY=minY end if;if maxY>screenMaxY then screenMaxY=maxY end if
        if maxX>=0.0 and minX<640.0 and maxY>=0.0 and minY<480.0 then visible=visible+1 end if
      end for
    end if
  end for
  if visible<1 then print("projected "+str(projected)+" bounds "+str(screenMinX)+","+str(screenMinY)+".."+str(screenMaxX)+","+str(screenMaxY));return error(7622,"retail machinegun is outside the original first-person viewport") end if
  print("PASS: retail viewmodels 10 hand MD3s / "+str(len(machinegun.frames))+" machinegun tag frames / "+str(visible)+" clipped viewport triangles");return 0
end function
