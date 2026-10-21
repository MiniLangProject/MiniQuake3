import mq3.client.ui_ingame as ingame
function req(ok,label) if not ok then return error(7862,"UI ingame contract: "+label) end if;return 1 end function
function main(args)
  count=0
  local=ingame.open(true,true,4,1)
  count=count+req(local.wrapAround and not local.fullscreen and len(local.items)==10,"topology")
  count=count+req(local.frame=="menu/art/addbotframe" and local.cursorX==319 and local.cursorY==80,"frame/cursor")
  count=count+req(local.items[0].y==88 and local.items[9].y==340,"spacing")
  count=count+req(not local.items[1].grayed and not local.items[2].grayed and not local.items[3].grayed and not local.items[6].grayed,"local enabled")
  remote=ingame.init(false,false,ingame.GT_SINGLE_PLAYER,ingame.TEAM_SPECTATOR)
  count=count+req(remote.items[1].grayed and remote.items[2].grayed and remote.items[3].grayed and remote.items[6].grayed,"disabled states")
  m=ingame.event(local,ingame.ID_LEAVEARENA,ingame.QM_ACTIVATED);count=count+req(m.commands==["disconnect\n"],"disconnect")
  m=ingame.event(m,ingame.ID_RESTART,ingame.QM_ACTIVATED);count=count+req(m.actions[len(m.actions)-1]=="confirm:RESTART ARENA?","restart confirm")
  m=ingame.restartAction(m,true);count=count+req(m.commands[len(m.commands)-1]=="map_restart 0\n" and m.actions[len(m.actions)-1]=="pop","restart action")
  m=ingame.event(m,ingame.ID_QUIT,ingame.QM_ACTIVATED);count=count+req(m.actions[len(m.actions)-1]=="confirm:EXIT GAME?","quit confirm")
  m=ingame.quitAction(m,true);count=count+req(m.actions[len(m.actions)-1]=="credits","quit action")
  m=ingame.event(m,ingame.ID_RESUME,ingame.QM_ACTIVATED);count=count+req(m.actions[len(m.actions)-1]=="pop","resume")
  m=ingame.event(m,ingame.ID_ADDBOTS,ingame.QM_ACTIVATED);m=ingame.event(m,ingame.ID_REMOVEBOTS,ingame.QM_ACTIVATED);m=ingame.event(m,ingame.ID_TEAMORDERS,ingame.QM_ACTIVATED)
  count=count+req(m.actions[len(m.actions)-3]=="addBots" and m.actions[len(m.actions)-2]=="removeBots" and m.actions[len(m.actions)-1]=="teamOrders","bot/order events")
  before=len(m.actions);m=ingame.event(m,ingame.ID_SETUP,0);count=count+req(len(m.actions)==before,"ignore notification")
  count=count+req(ingame.cache()==[ingame.INGAME_FRAME],"cache")
  print("PASS: "+str(count)+" native UI ingame contracts (6 symbols)");return 0
end function
