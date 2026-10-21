import mq3.client.ui_spreset as reset
import mq3.client.ui_gameinfo as game
import mq3.client.ui_qmenu as menu

function req(ok,label) if not ok then return error(7971,"UI SP reset contract: "+label) end if;return 1 end function
function seeded()
  value=game.create();game.setCvar(value,"g_spScores1","\\l0\\1");game.setCvar(value,"g_spScores5","\\l0\\2");game.setCvar(value,"g_spAwards","\\a0\\9");game.setCvar(value,"g_spVideos","\\tier1\\1");return value
end function
function main(args)
  count=0;g=seeded();value=reset.UI_ResetMenu(g,0)
  count=count+req(value.menu.fullscreen and value.menu.wrapAround and len(value.menu.items)==2 and value.menu.cursor==1 and value.pushed,"disconnected menu and NO focus")
  count=count+req(value.yes.id==reset.ID_YES and value.no.id==reset.ID_NO and value.yes.string=="YES" and value.no.string=="NO","text item identities")
  count=count+req(value.yes.x<value.slashX and value.slashX<value.no.x and value.yes.y==264,"proportional positions")
  count=count+req(len(value.assets)==1 and value.assets[0]=="menu/art/cut_frame" and reset.Reset_Cache()[0]=="menu/art/cut_frame","frame cache")
  count=count+req(not reset.UI_ResetMenu(seeded(),reset.CA_CONNECTED).menu.fullscreen,"connected overlay")
  rows=reset.Reset_MenuDraw(value,100);count=count+req(len(rows)==9 and rows[0][8]=="menu/art/cut_frame" and rows[1][5]=="RESET GAME?" and rows[2][5]=="/","reset draw composition")
  count=count+req(rows[5][5]=="WARNING: This resets all of the" and rows[8][5]=="start over from the beginning.","warning copy")
  untouched=reset.UI_ResetMenu(seeded(),0);count=count+req(not reset.Reset_MenuEvent(untouched,reset.ID_YES,menu.QM_GOTFOCUS) and untouched.popCount==0,"ignore nonactivation")
  no=reset.UI_ResetMenu(seeded(),0);count=count+req(reset.Reset_MenuEvent(no,reset.ID_NO,menu.QM_ACTIVATED) and no.popCount==1 and not no.levelMenuOpened and game.cvar(no.game,"g_spAwards")!="","NO preserves game")
  yes=reset.UI_ResetMenu(seeded(),0);count=count+req(reset.Reset_MenuEvent(yes,reset.ID_YES,menu.QM_ACTIVATED) and yes.popCount==2 and yes.levelMenuOpened,"YES menu stack")
  count=count+req(game.cvar(yes.game,"g_spScores1")=="" and game.cvar(yes.game,"g_spScores5")=="" and game.cvar(yes.game,"g_spAwards")=="" and game.cvar(yes.game,"g_spVideos")=="","YES clears progress")
  count=count+req(yes.cvarWrites[0][0]=="ui_spSelection" and yes.cvarWrites[0][1]=="0","selection reset")
  arrows=reset.UI_ResetMenu(seeded(),0);sound=reset.Reset_MenuKey(arrows,menu.K_LEFTARROW,0,0);count=count+req(sound==menu.SOUND_MOVE and arrows.menu.cursor==0,"arrows become tab")
  enter=reset.UI_ResetMenu(seeded(),0);sound=reset.Reset_MenuKey(enter,menu.K_ENTER,0,0);count=count+req(sound==menu.SOUND_MOVE and enter.popCount==1 and not enter.levelMenuOpened,"Enter activates focused NO")
  noKey=reset.UI_ResetMenu(seeded(),0);reset.Reset_MenuKey(noKey,110,0,0);count=count+req(noKey.popCount==1 and not noKey.levelMenuOpened,"N shortcut")
  yesKey=reset.UI_ResetMenu(seeded(),0);reset.Reset_MenuKey(yesKey,89,0,0);count=count+req(yesKey.popCount==2 and yesKey.levelMenuOpened and game.cvar(yesKey.game,"g_spAwards")=="","Y shortcut")
  print("PASS: "+str(count)+" UI SP reset contracts")
  return 0
end function
