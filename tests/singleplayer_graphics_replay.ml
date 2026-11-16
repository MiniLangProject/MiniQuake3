import mq3.engine.local_qvm_match as match
import mq3.client.qvm_preview_app as app
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=3 and len(args)!=4 then return error(7706,"pak0, qvm root, frame count and optional arena map required") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  mapName="q3dm1";if len(args)==4 then mapName=args[3] end if
  map=bsp.load(pk3.read(archive,"maps/"+mapName+".bsp"));if map is error then return map end if
  settings=match.UserSettings([["g_gametype","2","0",void,0]],array(256,void),array(match.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
  return app.runLimitedSettingsNamed(archive,map,mapName,args[1],toNumber(args[2]),settings)
end function
