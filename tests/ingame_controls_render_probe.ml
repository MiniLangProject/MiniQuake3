import mq3.tests.controls_render_app as controlsRenderApp
import mq3.engine.local_qvm_match as controlsRenderMatch
import mq3.format.pk3 as controlsRenderPk3
import mq3.format.bsp as controlsRenderBsp
function main(args)
 if len(args)!=4 then print "usage: replay pak qvms mode frames";return 2 end if
 archive=controlsRenderPk3.open(args[0]);if archive is error then return archive end if
 map=controlsRenderBsp.load(controlsRenderPk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
 settings=controlsRenderMatch.UserSettings([["mq3_regression_replay",args[2],args[2],void,0]],array(256,void),array(controlsRenderMatch.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"))
 return controlsRenderApp.runLimitedSettingsNamed(archive,map,"q3dm1",args[1],toNumber(args[3]),settings)
end function
