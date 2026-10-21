import mq3.client.ui_main_menu as mainmenu
function req(ok,label) if not ok then return error(7862,"UI main menu contract: "+label) end if;return 1 end function
function main(args)
  count=0
  base=mainmenu.open(false,true,true,"",["baseq3"])
  count=count+req(base.fullscreen and base.wrapAround and base.showlogo and len(base.items)==7,"base topology")
  count=count+req(base.items[0].label=="SINGLE PLAYER" and base.items[6].label=="EXIT" and base.items[6].y==338,"base positions")
  ta=mainmenu.open(false,true,true,"",["foo","MissionPack"])
  count=count+req(len(ta.items)==8 and ta.items[5].id==mainmenu.ID_TEAMARENA and ta.items[7].y==372,"team arena topology")
  count=count+req(mainmenu.teamArenaExists(["missionpack"]) and not mainmenu.teamArenaExists(["baseq3"]),"mod scan")
  cd=mainmenu.open(false,false,false,"",[]);count=count+req(cd.actions==["cdKey"],"cd key gate")
  err=mainmenu.open(false,true,true,"boom",[]);count=count+req(err.actions==["keyCatcher:UI","resetStack","pushError"],"error gate")
  err=mainmenu.errorMessageKey(err,13);count=count+req(err.cvarWrites[len(err.cvarWrites)-1]=="com_errorMessage=" and err.actions[len(err.actions)-1]=="nullSound","error key")
  m=mainmenu.event(base,mainmenu.ID_SINGLEPLAYER,mainmenu.QM_ACTIVATED);count=count+req(m.actions[len(m.actions)-1]=="spLevel","single event")
  m=mainmenu.event(m,mainmenu.ID_TEAMARENA,mainmenu.QM_ACTIVATED);count=count+req(m.cvarWrites[len(m.cvarWrites)-1]=="fs_game=missionpack" and m.commands==["vid_restart;"],"missionpack event")
  m=mainmenu.event(m,mainmenu.ID_EXIT,mainmenu.QM_ACTIVATED);count=count+req(m.actions[len(m.actions)-1]=="confirm:EXIT GAME?","exit event")
  before=len(m.actions);m=mainmenu.event(m,mainmenu.ID_SETUP,0);count=count+req(len(m.actions)==before,"ignore notification")
  m=mainmenu.exitAction(m,true);count=count+req(m.actions[len(m.actions)-2]=="pop" and m.actions[len(m.actions)-1]=="credits","confirmed exit")
  d=mainmenu.draw(base,0,false);count=count+req(d.bannerModel==mainmenu.MAIN_BANNER_MODEL and d.yaw==180.0 and d.actions[3]=="drawMenu","banner draw")
  ed=mainmenu.draw(err,1000,true);count=count+req(ed.actions[3]=="autoWrap:320,192,600,20:boom" and len(ed.actions)==6,"error/demo draw")
  count=count+req(mainmenu.cache()==[mainmenu.MAIN_BANNER_MODEL],"cache")
  print("PASS: "+str(count)+" native UI main menu contracts (7 symbols)");return 0
end function
