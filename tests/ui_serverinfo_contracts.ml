import mq3.client.ui_serverinfo as s
import mq3.client.ui_qmenu as q

function req(ok,label) if not ok then return error(7991,"UI serverinfo contract: "+label) end if;return 1 end function
function main(args)
  count=0;state=s.create(false);state.currentAddress="127.0.0.1:27960";state.favorites=["","bad","10.0.0.1:27960"];count=count+req(s.Favorites_Add(state)==1 and state.favorites[0]==state.currentAddress,"first empty favorite");count=count+req(state.actions[0].boundary=="cvar" and state.actions[0].name=="server1","typed favorite cvar")
  before=len(state.actions);count=count+req(s.Favorites_Add(state)==0 and len(state.actions)==before,"duplicate favorite ignored");state.currentAddress="";count=count+req(s.Favorites_Add(state)==0,"empty address ignored")
  full=s.create(false);full.currentAddress="8.8.8.8:27960";full.favorites=[];for i=1 to 16 full.favorites=full.favorites+[str(i)+".0.0.1"] end for;count=count+req(s.Favorites_Add(full)==0 and len(full.actions)==0,"full numeric favorites ignored")
  state=s.create(false);s.UI_ServerInfoMenu(state,"\\sv_hostname\\Arena\\mapname\\q3dm1\\g_gametype\\0",false,"127.0.0.1:27960",[]);count=count+req(state.pushed and len(state.menu.items)==5 and state.menu.fullscreen,"menu lifecycle and layout");count=count+req(state.banner.string=="SERVER INFO" and state.add.string=="ADD TO FAVORITES" and state.back.focuspic==s.SERVERINFO_BACK1,"original labels and art");count=count+req(state.numlines==3 and state.pairs[1]==["mapname","q3dm1"],"serverinfo pair parsing")
  rows=s.ServerInfo_MenuDraw(state,123);count=count+req(len(rows)==7 and rows[0].text=="sv_hostname:" and rows[1].text=="Arena" and rows[6].kind=="menu","key/value draw and menu")
  count=count+req(not s.ServerInfo_Event(state,s.ID_ADD,1) and not state.popped,"inactive add ignored");count=count+req(s.ServerInfo_Event(state,s.ID_ADD,q.QM_ACTIVATED) and state.popped and state.favorites[0]=="127.0.0.1:27960","add and pop")
  back=s.create(false);s.UI_ServerInfoMenu(back,"\\a\\b",false,"",[]);count=count+req(s.ServerInfo_Event(back,s.ID_BACK,q.QM_ACTIVATED) and back.popped,"back event")
  running=s.create(false);s.UI_ServerInfoMenu(running,"\\a\\b",true,"",[]);count=count+req((running.add.flags&q.QMF_GRAYED)!=0,"local server add grayed")
  long="";for i=0 to 17 long=long+"\\k"+str(i)+"\\v"+str(i) end for;many=s.create(false);s.UI_ServerInfoMenu(many,long,false,"",[]);count=count+req(many.numlines==16 and len(many.pairs)==18,"line count cap retains info");count=count+req(len(s.ServerInfo_MenuDraw(many,0))==37,"original draws all server pairs")
  s.UI_ServerInfoMenu(many,"\\mapname\\q3dm17",false,"",[]);count=count+req(many.numlines==1 and many.pairs==[["mapname","q3dm17"]],"fresh serverinfo refresh replaces prior pairs")
  keyState=s.create(false);s.UI_ServerInfoMenu(keyState,"\\a\\b",false,"",[]);count=count+req(s.ServerInfo_MenuKey(keyState,q.K_ESCAPE,0,0)==q.SOUND_OUT and keyState.menu.popped,"default menu key")
  suppressed=s.create(true);s.ServerInfo_Cache(suppressed);ok=true;for each action in suppressed.actions if action.dispatched then ok=false end if end for;count=count+req(len(suppressed.actions)==4 and ok,"typed suppressible cache actions");live=s.create(false);s.ServerInfo_Cache(live);count=count+req(live.actions[0].dispatched,"native host action dispatch")
  print("PASS: "+str(count)+" UI serverinfo contracts");return 0
end function
