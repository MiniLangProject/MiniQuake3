import mq3.client.map_loading as mapLoading
import mq3.game.bg_public as bg
import mq3.format.pk3 as pk3
import mq3.compat.numeric as numeric
import mq3.platform.playable_window as window
import mq3.renderer.command_queue as q2commands

function main(args)
  if len(args)<1 or len(args)>2 then return error(7682,"expected Retail archive path") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  screen=mapLoading.create(archive,"q3dm1","localhost",true);if screen is error then return screen end if
  missing=mapLoading.create(archive,"absent_map","localhost",true);if missing.assets[0]!="menu/art/unknownmap" then return error(7682,"unknownmap fallback") end if
  config=array(bg.CS_PLAYERS+3,"")
  config[0]="\\mapname\\q3dm1\\g_gametype\\2\\fraglimit\\10";config[3]="Arena Gate"
  cmds=mapLoading.layout(screen,"maps/q3dm1.bsp",640,480,config)
  if screen.assets[0]!="levelshots/q3dm1" or cmds[0].shader!=1 or cmds[1].shader!=2 or cmds[1].values[6]!=2.5 or cmds[1].values[7]!=2.0 then return error(7682,"levelshot/detail commands") end if
  rows=array(480,0)
  for each cmd in cmds
    if cmd.id==q2commands.RC_STRETCH_PIC and cmd.shader==3 then y=numeric.trunc32(cmd.values[1]);if y>=0 and y<480 then rows[y]=rows[y]+1 end if end if
  end for
  for each y in [16,64,96,148,175,202]
    if rows[y]==0 or rows[y+2]==0 then return error(7682,"missing text or shadow row "+str(y)) end if
  end for
  opened=window.open(640,480);if opened is error then return opened end if
  drawn=try(mapLoading.show(screen,"maps/q3dm1.bsp",640,480,config,false))
  if drawn is error then window.shutdown();return drawn end if
  if not drawn or screen.catalog.unresolvedQuads!=0 or len(screen.catalog.textures)<3 then window.shutdown();return error(7682,"loading textures or window missing") end if
  for each texture in screen.catalog.textures
    if texture.imageName=="$defaultimage" then window.shutdown();return error(7682,"unexpected fallback image") end if
  end for
  if len(args)==2 then
    config[bg.CS_ITEMS]="0101"
    config[bg.CS_PLAYERS]="\\model\\sarge/default"
    config[bg.CS_PLAYERS+1]="\\model\\crash/default"
    names=["icons/iconr_shard","icons/iconr_red","models/players/sarge/icon_default.tga","models/players/crash/icon_default.tga"]
    mapLoading.collectIcons(screen,config,names,["shaderNoMip","shaderNoMip","shaderNoMip","shaderNoMip"],1)
    if len(screen.loadingInfo.itemIcons)!=2 or len(screen.loadingInfo.playerIcons)!=2 then return error(7682,"registered loading icons") end if
    handles=screen.loadingInfo.playerIcons
    if screen.assets[handles[0]-1]!=names[3] or screen.assets[handles[1]-1]!=names[2] then return error(7682,"local player portrait must be first") end if
    drawn=mapLoading.show(screen,"",640,480,config,false)
    if drawn is error then return drawn end if
    if screen.catalog.unresolvedQuads!=0 or len(screen.catalog.textures)<7 then return error(7682,"late icon texture upload") end if
    cmds=mapLoading.layout(screen,"",640,480,config)
    if cmds[2].shader!=handles[0] or cmds[2].values!=[16.0,284.0,64.0,64.0,0.0,0.0,1.0,1.0] or cmds[4].shader!=screen.loadingInfo.itemIcons[0] then return error(7682,"original portrait and item rows") end if
  end if
  mapLoading.release(screen);window.shutdown()
  print "PASS: Retail Arena Gate loading screen";return 0
end function
