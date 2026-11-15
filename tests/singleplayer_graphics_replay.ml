import mq3.engine.local_qvm_match as match
import mq3.client.qvm_preview_app as app
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=3 then return error(7706,"pak0, qvm root and frame count required") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  settings=match.UserSettings([["g_gametype","2","0",void,0]],array(256,void),array(match.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
  return app.runLimitedSettingsNamed(archive,map,"q3dm1",args[1],toNumber(args[2]),settings)
end function
