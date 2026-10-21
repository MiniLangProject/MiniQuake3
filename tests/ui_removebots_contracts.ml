import mq3.client.ui_remove_bots as remove

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function count(state,kind) result=0;for each action in state.actions if action.kind==kind then result=result+1 end if end for;return result end function
function players() return ["\\n\\^1Human\\skill\\0","\\n\\^2Sarge\\skill\\2","\\n\\Visor\\skill\\3","\\n\\Spectator\\skill\\0","\\n\\^3Xaero\\skill\\5","\\n\\Orbb\\skill\\1","\\n\\Slash\\skill\\4","\\n\\Major\\skill\\2","\\n\\Keel\\skill\\3","\\n\\Ranger\\skill\\1"] end function
function main(args)
  failures=0;state=remove.create(true);list=players();failures=failures+req(remove.getBots(state,"\\sv_maxclients\\10",list)==8 and state.botClientNums[0]==1 and state.botClientNums[2]==4 and state.botClientNums[7]==9,"bot client discovery")
  names=remove.setBotNames(state);failures=failures+req(names[0]=="Sarge" and names[1]=="Visor" and names[2]=="Xaero" and names[6]=="Keel","client names and color cleanup")
  failures=failures+req(remove.cache(state)==5 and state.cached and count(state,"register-shader")==5,"five original menu assets")
  failures=failures+req(not remove.upEvent(state,remove.QM_ACTIVATED),"top paging boundary")
  failures=failures+req(remove.downEvent(state,remove.QM_ACTIVATED) and state.baseBotNum==1 and state.botnames[0]=="Visor","down pages client names")
  failures=failures+req(remove.upEvent(state,remove.QM_ACTIVATED) and state.baseBotNum==0 and state.botnames[0]=="Sarge","up restores client names")
  failures=failures+req(not remove.downEvent(state,1),"paging activation gate")
  state.visibleCount=7;failures=failures+req(remove.botEvent(state,remove.ID_BOTNAME0+2,remove.QM_ACTIVATED) and state.selectedBotNum==2,"bot selection")
  failures=failures+req(not remove.botEvent(state,remove.ID_BOTNAME0+7,remove.QM_ACTIVATED),"selection visible-range guard")
  state.actions=[];failures=failures+req(remove.deleteEvent(state,remove.QM_ACTIVATED) and state.actions[0].text=="clientkick 4\n" and not state.actions[0].dispatched,"selected clientkick command")
  failures=failures+req(not remove.deleteEvent(state,1),"delete activation gate")
  failures=failures+req(remove.backEvent(state,remove.QM_ACTIVATED) and state.menuEvents[len(state.menuEvents)-1][0]=="pop","back pops menu")
  empty=remove.create(true);remove.init(empty,"\\sv_maxclients\\2",["\\n\\Human\\skill\\0","\\n\\Other\\skill\\0"]);failures=failures+req(empty.numBots==0 and empty.visibleCount==0 and not remove.deleteEvent(empty,remove.QM_ACTIVATED),"empty bot list safe delete")
  state=remove.create(true);remove.init(state,"\\sv_maxclients\\10",list);failures=failures+req(state.baseBotNum==0 and state.selectedBotNum==0 and state.visibleCount==7 and state.cached,"complete menu init")
  state=remove.create(true);remove.removeBotsMenu(state,"\\sv_maxclients\\10",list);failures=failures+req(state.pushed and state.menuEvents[0][0]=="push" and state.actions[len(state.actions)-1].kind=="push-menu","public menu lifecycle")
  if failures!=0 then return failures end if;print("PASS: 15 native ui_removebots contracts (10 symbols)");return 0
end function
