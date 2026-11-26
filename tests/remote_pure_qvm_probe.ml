// SPDX-License-Identifier: GPL-2.0-or-later
// Boot a protocol-68 Cgame and UI from compressed PK3 assets with no loose VM override.
import mq3.client.demo_playback as pureBootDemo
import mq3.client.ui_vm as pureBootUi
import mq3.client.original_ui_session as pureBootUiSession
import mq3.engine.local_qvm_match as pureBootMatch
import mq3.format.bsp as pureBootBsp
import mq3.format.pk3 as pureBootPk3

function main(args)
  if len(args)!=3 then return error(7827,"usage: remote_pure_qvm_probe <baseq3> <demo-baseq3> <demo>") end if
  archive=pureBootPk3.openStandard(args[0])
  demo=pureBootDemo.open(args[1],archive,args[2],1000)
  defer pureBootDemo.close(demo)
  map=pureBootBsp.load(pureBootPk3.read(archive,"maps/"+demo.mapName+".bsp"))
  state=pureBootMatch.bootServerStream(archive,map,demo.mapName,"",void,demo.protocol,false,"Retail PK3 QVMs",1000)
  defer pureBootMatch.shutdown(state)
  now=state.context.latestSnapshot.serverTime
  pureBootMatch.drawCgameProductive(state,now)
  if len(state.context.errors)>0 then return error(7827,state.context.errors[0]) end if
  if len(state.context.renderViews)==0 then return error(7827,"Retail PK3 cgame did not draw the map") end if
  pureBootMatch.bootUi(state)
  pureBootUi.setActiveMenu(state.ui,pureBootUiSession.UIMENU_INGAME)
  pureBootMatch.refreshUi(state,now+16)
  if len(state.context.errors)>0 then return error(7827,state.context.errors[0]) end if
  if state.context.renderQueue.used==0 then return error(7827,"Retail PK3 in-game UI did not draw") end if
  print("PASS: Retail PK3 cgame and in-game UI from verified packages")
  return 0
end function
