import mq3.client.ui_player_settings as p
import mq3.client.ui_players as players
import mq3.client.ui_qmenu as menu
function dump(tag,s) print(tag+"|"+s.name.buffer+"|"+str(s.handicap)+"|"+str(s.effects)+"|"+s.playerModel) end function
function main(args)
 source=players.assetSource([],[],true);s=p.create(source);p.PlayerSettings_SetMenuItems(s,"^1Ranger",1,"sarge/default",97);dump("set1",s);p.PlayerSettings_SetMenuItems(s,"^1Ranger",99,"sarge/default",1);dump("set2",s);s.name.buffer="Xaero";s.handicap=7;s.effects=5;s.cvarWrites=[];p.PlayerSettings_SaveChanges(s,true);for each pair in s.cvarWrites print("save|"+pair[0]+"="+pair[1]) end for;s.cvarWrites=[];p.PlayerSettings_MenuEvent(s,p.ID_HANDICAP,menu.QM_ACTIVATED,true);print("event|"+s.cvarWrites[0][0]+"="+s.cvarWrites[0][1]);s.cvarWrites=[];p.PlayerSettings_MenuEvent(s,p.ID_MODEL,menu.QM_ACTIVATED,true);modelFlag=0;if s.modelMenu then modelFlag=1 end if;print("model|"+str(modelFlag)+"|"+str(len(s.cvarWrites)));s.cvarWrites=[];p.PlayerSettings_MenuEvent(s,p.ID_BACK,menu.QM_ACTIVATED,true);popFlag=0;if s.popped then popFlag=1 end if;print("back|"+str(popFlag)+"|"+str(len(s.cvarWrites)));s.cvarWrites=[];result=p.PlayerSettings_MenuKey(s,menu.K_ESCAPE,0,0,true);print("key|"+str(result)+"|"+str(len(s.cvarWrites)));return 0
end function
