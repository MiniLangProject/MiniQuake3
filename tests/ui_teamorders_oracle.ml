import mq3.client.ui_teamorders as t
import mq3.client.ui_qmenu as q
function ready() s=t.create(false);s.botNames=["Everyone","Sarge"];s.bots=s.botNames;s.numBots=2;s.list=q.item(q.MTYPE_SCROLLLIST,"",t.ID_LIST_BOTS,256,120,q.QMF_NODEFAULTINIT);s.list.top=120;return s end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  s=ready();t.UI_TeamOrdersMenu_SetList(s,t.ID_LIST_BOTS);print("bots "+str(s.list.id)+" "+str(s.list.numitems)+" "+str(s.list.bottom));s.gametype=t.GT_CTF;s.list.curvalue=1;t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED);print("select "+str(s.selectedBot)+" "+str(s.list.id)+" "+str(s.list.numitems));s.list.curvalue=2;t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED);print("ctf "+s.actions[len(s.actions)-2].text+str(flag(s.popped)));s=ready();s.selectedBot=1;t.UI_TeamOrdersMenu_SetList(s,t.ID_LIST_TEAM_ORDERS);s.list.curvalue=2;t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED);print("team "+s.actions[len(s.actions)-2].text+str(flag(s.popped)));s=ready();t.UI_TeamOrdersMenu_BackEvent(s,1);t.UI_TeamOrdersMenu_BackEvent(s,q.QM_ACTIVATED);print("back "+str(flag(s.popped)));return 0
end function
