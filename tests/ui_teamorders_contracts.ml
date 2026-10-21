import mq3.client.ui_teamorders as t
import mq3.client.ui_qmenu as q

function req(ok,label) if not ok then return error(7990,"UI teamorders contract: "+label) end if;return 1 end function
function server(game) return "\\sv_maxclients\\5\\g_gametype\\"+str(game) end function
function players(team) return ["\\t\\"+str(team)+"\\n\\^1Human","\\t\\"+str(team)+"\\skill\\3\\n\\^2Sarge","\\t\\"+str(team)+"\\skill\\0\\n\\Visor","\\t\\2\\skill\\4\\n\\Klesk","\\t\\"+str(team)+"\\skill\\5\\n\\Major"] end function
function main(args)
  count=0;s=t.create(false);count=count+req(t.UI_TeamOrdersMenu_BuildBotList(s,server(t.GT_CTF),0,players(1))==3 and s.botNames==["Everyone","Sarge","Major"] and s.gametype==t.GT_CTF,"teammate bot list and clean names")
  crowded=["\\t\\1\\n\\Self"];for i=1 to 11 crowded=crowded+["\\t\\1\\skill\\4\\n\\^1LongBotName_"+str(i)] end for;cap=t.create(false);count=count+req(t.UI_TeamOrdersMenu_BuildBotList(cap,"\\sv_maxclients\\12\\g_gametype\\3",0,crowded)==9 and len(bytes(cap.botNames[1]))<=15,"nine-entry cap and bounded names")
  t.UI_TeamOrdersMenu_Init(s,server(t.GT_CTF),0,players(1));count=count+req(len(s.menu.items)==4 and s.menu.fullscreen==false and s.menu.cursor==2,"menu layout and focus");count=count+req(s.banner.string=="TEAM ORDERS" and s.frame.name==t.ART_FRAME and s.back.focuspic==t.ART_BACK1,"original art and banner");count=count+req(len(s.actions)==3 and s.actions[0].kind=="register-shader","typed cache actions")
  count=count+req(s.list.id==t.ID_LIST_BOTS and s.list.numitems==3 and s.list.bottom==120+3*q.PROP_HEIGHT,"bot list geometry")
  s.list.curvalue=1;count=count+req(t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED) and s.selectedBot==1 and s.list.id==t.ID_LIST_CTF_ORDERS and s.list.numitems==7,"bot to CTF orders")
  s.list.curvalue=2;count=count+req(t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED) and s.popped,"order activation pops");count=count+req(s.actions[len(s.actions)-2].text=="say_team \"Sarge follow me\"\n" and s.actions[len(s.actions)-2].boundary=="command","voice order command")
  s=t.create(false);t.UI_TeamOrdersMenu_Init(s,server(t.GT_CTF),0,players(1));s.list.curvalue=0;t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED);s.list.curvalue=0;t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED);count=count+req(s.actions[len(s.actions)-2].text=="say_team \"i am the leader\"\n","untargeted leader order")
  s=t.create(false);t.UI_TeamOrdersMenu_Init(s,server(t.GT_TEAM),0,players(1));s.list.curvalue=1;t.UI_TeamOrdersMenu_ListEvent(s,q.QM_ACTIVATED);count=count+req(s.list.id==t.ID_LIST_TEAM_ORDERS and s.list.numitems==6,"team orders for non-CTF")
  s.list.curvalue=0;count=count+req(t.UI_TeamOrdersMenu_Key(s,q.K_UPARROW,0,0)==q.SOUND_MOVE and s.list.curvalue==5,"up wraps");count=count+req(t.UI_TeamOrdersMenu_Key(s,q.K_DOWNARROW,0,0)==q.SOUND_MOVE and s.list.curvalue==0,"down wraps")
  rows=t.UI_TeamOrdersMenu_ListDraw(s);count=count+req(len(rows)==6 and rows[0].name=="yellow" and rows[1].name=="orange" and (rows[0].number&q.UI_PULSE)!=0,"owner-drawn order colors and focus")
  s=t.create(false);t.UI_TeamOrdersMenu_Init(s,server(t.GT_CTF),0,players(1));count=count+req(t.UI_TeamOrdersMenu_Key(s,q.K_MOUSE1,250,125)==q.SOUND_MOVE and s.list.id==t.ID_LIST_CTF_ORDERS,"mouse player activation");count=count+req(t.UI_TeamOrdersMenu_Key(s,q.K_MOUSE1,10,10)==q.SOUND_NULL,"mouse outside list")
  s=t.create(false);count=count+req(not t.UI_TeamOrdersMenu_f(s,server(0),0,players(1)) and not s.pushed,"non-team rejection");s=t.create(false);count=count+req(not t.UI_TeamOrdersMenu_f(s,server(t.GT_TEAM),0,players(t.TEAM_SPECTATOR)),"spectator rejection");s=t.create(false);count=count+req(t.UI_TeamOrdersMenu_f(s,server(t.GT_TEAM),0,players(1)) and s.pushed and s.actions[len(s.actions)-1].kind=="push-menu","valid menu lifecycle")
  before=len(s.actions);count=count+req(not t.UI_TeamOrdersMenu_BackEvent(s,1) and len(s.actions)==before,"inactive back ignored");count=count+req(t.UI_TeamOrdersMenu_BackEvent(s,q.QM_ACTIVATED) and s.popped,"back pops")
  suppressed=t.create(true);t.UI_TeamOrdersMenu_Cache(suppressed);ok=true;for each action in suppressed.actions if action.dispatched then ok=false end if end for;count=count+req(ok,"retail host action suppression");live=t.create(false);t.UI_TeamOrdersMenu_Cache(live);count=count+req(live.actions[0].dispatched,"native host action dispatch")
  print("PASS: "+str(count)+" UI teamorders contracts");return 0
end function
