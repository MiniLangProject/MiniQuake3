import mq3.client.ui_cinematics as cinema
import mq3.client.ui_gameinfo as game

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function count(state,kind) value=0;for each action in state.actions if action.kind==kind then value=value+1 end if end for;return value end function
function main(args)
  failures=0;data=game.create();game.setCvar(data,"g_spVideos","\\tier1\\1\\tier3\\1\\tier8\\1");state=cinema.create(data,false,true)
  failures=failures+req(cinema.cache(state)==4 and state.cached and count(state,"register-shader")==4 and not state.actions[0].dispatched,"asset cache and suppressed boundary")
  cinema.init(state);failures=failures+req(state.enabled[0] and state.enabled[1] and state.enabled[2] and not state.enabled[3] and state.enabled[4] and state.enabled[9],"retail unlock flags")
  failures=failures+req(len(state.names)==10 and state.names[0]=="idlogo" and state.names[9]=="end" and state.labels[1]=="INTRO","cinematic table")
  state.actions=[];failures=failures+req(not cinema.menuEvent(state,cinema.ID_CIN_IDLOGO,1) and len(state.actions)==0,"event activation gate")
  failures=failures+req(cinema.menuEvent(state,cinema.ID_CIN_IDLOGO,cinema.QM_ACTIVATED),"logo event")
  failures=failures+req(state.actions[0].kind=="set-cvar" and state.actions[0].name=="nextmap" and state.actions[0].text=="ui_cinematics 0","nextmap command")
  failures=failures+req(state.actions[1].kind=="execute" and state.actions[1].text=="disconnect; cinematic idlogo.RoQ\n" and state.actions[1].value==2,"logo playback command")
  state.actions=[];cinema.menuEvent(state,16,cinema.QM_ACTIVATED);failures=failures+req(state.actions[0].text=="ui_cinematics 5" and state.actions[1].text=="disconnect; cinematic tier4.RoQ\n","tier playback command")
  state.actions=[];cinema.menuEvent(state,cinema.ID_CIN_END,cinema.QM_ACTIVATED);failures=failures+req(state.actions[1].text=="disconnect; cinematic end.RoQ\n","retail ending")
  demoData=game.create();demoData.demoversion=true;demo=cinema.create(demoData,true,true);cinema.init(demo);failures=failures+req(demo.enabled[0] and not demo.enabled[1] and not demo.enabled[2] and not demo.enabled[8],"demo locks intro and normal tiers")
  demo.actions=[];cinema.menuEvent(demo,cinema.ID_CIN_END,cinema.QM_ACTIVATED);failures=failures+req(demo.actions[1].text=="disconnect; cinematic demoEnd.RoQ 1\n","demo ending command")
  failures=failures+req(not cinema.menuEvent(demo,10,cinema.QM_ACTIVATED) and not cinema.menuEvent(demo,21,cinema.QM_ACTIVATED),"cinematic id bounds")
  demo.actions=[];failures=failures+req(not cinema.backEvent(demo,1) and len(demo.actions)==0,"back activation gate")
  failures=failures+req(cinema.backEvent(demo,cinema.QM_ACTIVATED) and demo.menuEvents[0][0]=="pop" and count(demo,"menu-pop")==1,"back pop")
  state=cinema.create(data,false,true);cinema.cinematicsMenu(state);failures=failures+req(state.pushed and state.menuEvents[0][0]=="push" and count(state,"push-menu")==1,"menu lifecycle")
  state=cinema.create(data,false,true);cinema.cinematicsMenuF(state,7);failures=failures+req(state.cursor==7 and state.menuEvents[1][0]=="cursor","console cursor selection")
  state=cinema.create(data,false,true);cinema.cinematicsMenuF(state,-1);failures=failures+req(state.cursor==0,"negative cursor clamp")
  state=cinema.create(data,false,true);cinema.cinematicsMenuF(state,99);failures=failures+req(state.cursor==9,"upper cursor clamp")
  state=cinema.create(data,false,false);state.actions=[];cinema.menuEvent(state,11,3);failures=failures+req(state.actions[0].dispatched and state.actions[1].dispatched,"production boundary dispatch")
  if failures!=0 then return failures end if;print("PASS: 18 native ui_cinematics contracts (6 symbols)");return 0
end function
