import mq3.client.ui_spreset as reset
import mq3.client.ui_gameinfo as game
import mq3.client.ui_qmenu as menu

function b(value) if value then return 1 end if;return 0 end function
function row(label,value,defaults,key)
  print(label+str(value.popCount)+" "+str(b(value.levelMenuOpened))+" "+str(len(value.cvarWrites))+" "+str(b(value.levelMenuOpened))+" "+str(defaults)+" "+str(key))
end function
function main(args)
  value=reset.UI_ResetMenu(game.create(),0);reset.Reset_MenuEvent(value,reset.ID_YES,1);row("event_ignore ",value,0,0)
  value=reset.UI_ResetMenu(game.create(),0);reset.Reset_MenuEvent(value,reset.ID_NO,menu.QM_ACTIVATED);row("event_no ",value,0,0)
  value=reset.UI_ResetMenu(game.create(),0);reset.Reset_MenuEvent(value,reset.ID_YES,menu.QM_ACTIVATED);row("event_yes ",value,0,0)
  value=reset.UI_ResetMenu(game.create(),0);result=reset.Reset_MenuKey(value,menu.K_LEFTARROW,0,0);print("key_left "+str(result)+" "+str(value.popCount)+" 0 "+str(len(value.cvarWrites))+" 0 1 9")
  value=reset.UI_ResetMenu(game.create(),0);result=reset.Reset_MenuKey(value,110,0,0);print("key_n "+str(result)+" "+str(value.popCount)+" 0 "+str(len(value.cvarWrites))+" 0 1 110")
  value=reset.UI_ResetMenu(game.create(),0);result=reset.Reset_MenuKey(value,89,0,0);print("key_Y "+str(result)+" "+str(value.popCount)+" "+str(b(value.levelMenuOpened))+" "+str(len(value.cvarWrites))+" "+str(b(value.levelMenuOpened))+" 1 89")
  value=reset.UI_ResetMenu(game.create(),0);result=reset.Reset_MenuKey(value,65,0,0);print("key_other "+str(result)+" 0 0 0 0 1 65")
  return 0
end function
