import mq3.tests.controls_render_app as controlsRenderApp
import mq3.engine.local_qvm_match as controlsRenderMatch
import mq3.format.pk3 as controlsRenderPk3
import mq3.format.bsp as controlsRenderBsp
function main(args)
 if len(args)!=6 and len(args)!=7 then print "usage: replay pak qvms mode frames map singleplayer [fixed-step-ms]";return 2 end if
 fixedStep="0";if len(args)==7 then fixedStep=args[6] end if
 archive=controlsRenderPk3.open(args[0]);if archive is error then return archive end if
 mapName=args[4];gameType="0";if args[5]=="1" then gameType="2" end if
 map=controlsRenderBsp.load(controlsRenderPk3.read(archive,"maps/"+mapName+".bsp"));if map is error then return map end if
 settings=controlsRenderMatch.UserSettings([["mq3_regression_replay",args[2],args[2],void,0],["mq3_regression_fixed_step",fixedStep,"0",void,0],["g_gametype",gameType,"0",void,0]],array(256,void),array(controlsRenderMatch.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
 return controlsRenderApp.runLimitedSettingsNamed(archive,map,mapName,args[1],toNumber(args[3]),settings)
end function
