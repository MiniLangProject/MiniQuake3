import mq3.client.ui_sppostgame as post
import mq3.client.ui_gameinfo as game
import mq3.client.ui_qmenu as menu

function b(value) if value then return 1 end if;return 0 end function
function main(args)
  value=post.create(game.create());post.UI_SPPostgameMenu_AgainEvent(value,1);print("again_ignore "+str(b(value.popped))+" 0 ")
  value=post.create(game.create());post.UI_SPPostgameMenu_AgainEvent(value,menu.QM_ACTIVATED);print("again "+str(b(value.popped))+" 0 map_restart 0")
  value=post.create(game.create());post.UI_SPPostgameMenu_MenuEvent(value,2);print("menu_ignore "+str(b(value.popped))+" 0 ")
  value=post.create(game.create());post.UI_SPPostgameMenu_MenuEvent(value,menu.QM_ACTIVATED);print("menu "+str(b(value.popped))+" 0 disconnect; levelselect")
  value=post.create(game.create());post.UI_SPPostgameMenu_Init(value,0);value.phase=1;value.ignoreKeysTime=200;result=post.UI_SPPostgameMenu_MenuKey(value,13,100,0,0);print("key_ignore "+str(result)+" "+str(value.phase)+" "+str(value.starttime)+" "+str(value.ignoreKeysTime)+" 0")
  value=post.create(game.create());post.UI_SPPostgameMenu_Init(value,0);value.phase=1;value.ignoreKeysTime=0;result=post.UI_SPPostgameMenu_MenuKey(value,13,300,0,0);print("key_phase1 "+str(result)+" "+str(value.phase)+" "+str(value.starttime)+" "+str(value.ignoreKeysTime)+" 0 abort_podium")
  value=post.create(game.create());post.UI_SPPostgameMenu_Init(value,0);value.phase=2;value.ignoreKeysTime=0;result=post.UI_SPPostgameMenu_MenuKey(value,13,600,0,0);print("key_phase2 "+str(result)+" "+str(value.phase)+" "+str(value.starttime)+" "+str(value.ignoreKeysTime)+" 0 ")
  value=post.create(game.create());post.UI_SPPostgameMenu_Init(value,0);value.phase=3;value.ignoreKeysTime=0;print("key_escape "+str(post.UI_SPPostgameMenu_MenuKey(value,menu.K_ESCAPE,1,0,0))+" 0")
  value=post.create(game.create());post.UI_SPPostgameMenu_Init(value,0);value.phase=3;value.ignoreKeysTime=0;result=post.UI_SPPostgameMenu_MenuKey(value,65,1,0,0);print("key_default "+str(result)+" 1")
  return 0
end function
