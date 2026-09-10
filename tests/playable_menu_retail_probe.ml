import mq3.client.playable_menu as menu
import mq3.format.pk3 as pk3
function require(ok,text) if not ok then return error(7592,text) end if;return 1 end function
function main(args)
  if len(args)!=1 then return error(7592,"pak0.pk3 path required") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=menu.load(archive,246,10);if catalog is error then return catalog end if
  count=0
  for each asset in catalog.assets
    if asset.key=="cursor" then count=count+require(asset.image.width==32 and asset.image.height==32,"retail cursor dimensions")
    else count=count+require(asset.image.width==256 and asset.image.height==256,"retail font atlas dimensions") end if
  end for
  print("PASS: retail Baseq3 menu "+str(catalog.textureCount)+" textures / "+str(count)+" image checks");return 0
end function
