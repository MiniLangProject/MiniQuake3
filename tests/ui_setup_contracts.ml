import mq3.client.ui_setup as setup
function req(ok,label) if not ok then return error(7862,"UI setup contract: "+label) end if;return 1 end function
function main(args)
  count=0;menu=setup.open(false)
  count=count+req(menu.wrapAround and menu.fullscreen and len(menu.items)==7 and menu.actions==["push"],"topology")
  count=count+req(menu.items[0].y==134 and menu.items[5].id==setup.ID_DEFAULTS and menu.items[6].y==416,"layout")
  paused=setup.init(true);count=count+req(len(paused.items)==6 and paused.items[5].id==setup.ID_BACK,"paused hides defaults")
  count=count+req(setup.cache()==["menu/art/back_0","menu/art/back_1","menu/art/frame2_l","menu/art/frame1_r"],"cache")
  for each pair in [[setup.ID_CUSTOMIZEPLAYER,"playerSettings"],[setup.ID_CUSTOMIZECONTROLS,"controls"],[setup.ID_SYSTEMCONFIG,"graphicsOptions"],[setup.ID_GAME,"preferences"],[setup.ID_CDKEY,"cdKey"],[setup.ID_BACK,"pop"]]
    probe=setup.event(setup.init(false),pair[0],setup.QM_ACTIVATED);count=count+req(probe.actions==[pair[1]],"event "+pair[1])
  end for
  probe=setup.event(setup.init(false),setup.ID_DEFAULTS,setup.QM_ACTIVATED);count=count+req(probe.actions[0]=="confirm:SET TO DEFAULTS?:resetDefaultsDraw:resetDefaultsAction","defaults confirm")
  before=len(probe.actions);probe=setup.event(probe,setup.ID_GAME,0);count=count+req(len(probe.actions)==before,"ignore event")
  probe=setup.resetDefaultsAction(probe,true);count=count+req(probe.commands==["exec default.cfg\n","cvar_restart\n","vid_restart\n"],"defaults commands")
  count=count+req(len(setup.resetDefaultsDraw())==2,"warning draw")
  print("PASS: "+str(count)+" native UI setup contracts (6 symbols)");return 0
end function
