import mq3.client.playable_viewmodel as viewmodel
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
  print("PASS: retail viewmodels 10 hand MD3s / "+str(len(machinegun.frames))+" machinegun tag frames");return 0
end function
