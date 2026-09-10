import mq3.client.baseq3_match_display as display
import mq3.client.baseq3_hud as hud
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then return error(7585,"usage: probe pak0.pk3") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  charset=display.load(archive,216);if charset is error then return charset end if
  status=hud.load(archive,217,39);if status is error then return status end if
  if charset.imageName!="gfx/2d/bigchars.tga" or charset.image.width!=256 or charset.image.height!=256 then return error(7585,"unexpected retail bigchars atlas") end if
  if len(status.assets)!=39 then return error(7585,"incomplete retail number/status catalog") end if
  numberPixels=0
  for index=0 to 10
    asset=status.assets[index]
    if asset.image.width!=32 or asset.image.height!=32 then return error(7585,"unexpected retail number shader") end if
    numberPixels=numberPixels+asset.image.width*asset.image.height
  end for
  print("PASS: retail match display 256x256 bigchars / 11 number shaders / "+str(numberPixels)+" number pixels");return 0
end function
