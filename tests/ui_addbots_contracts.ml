import mq3.client.ui_add_bots as add
import mq3.client.ui_gameinfo as game

function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function count(state,kind) result=0;for each action in state.actions if action.kind==kind then result=result+1 end if end for;return result end function
function fixture()
  data=game.create();game.UI_InitMemory(data);text="{ name zeta model sarge/default } { name Alpha model visor/default } { name beta model slash/default } { name delta model major/default } { name Gamma model orbb/default } { name epsilon model keel/default } { name theta model xaero/default } { name Eta model ranger/default } { name iota model bones/default }";game.UI_LoadBots(data,"scripts/bots.txt",text,[]);return data
end function
function main(args)
  failures=0;state=add.create(fixture(),true);failures=failures+req(add.cache(state)==8 and state.cached and count(state,"register-shader")==8,"eight original menu assets")
  add.init(state,0,3);failures=failures+req(state.numBots==9 and state.visibleCount==7 and state.delay==1000,"bot count grid and delay")
  failures=failures+req(state.botnames[0]=="Alpha" and state.botnames[1]=="beta" and state.botnames[6]=="iota","case-insensitive retail-name sort")
  failures=failures+req(state.sortedBotNums[0]==1 and state.sortedBotNums[8]==0,"sorted source indices")
  failures=failures+req(state.skill==2 and state.teamNames[0]=="Free" and state.teamGrayed,"FFA skill/team setup")
  team=add.create(fixture(),true);add.init(team,3,99);failures=failures+req(team.skill==4 and len(team.teamNames)==2 and team.teamNames[1]=="Blue" and not team.teamGrayed,"team game and skill clamp")
  failures=failures+req(add.sortCompare(state,1,2)<0 and add.sortCompare(state,0,7)>0,"sort comparator")
  failures=failures+req(not add.upEvent(state,add.QM_ACTIVATED),"top paging boundary")
  failures=failures+req(add.downEvent(state,add.QM_ACTIVATED) and state.baseBotNum==1 and state.botnames[0]=="beta","down pages by one row")
  failures=failures+req(add.upEvent(state,add.QM_ACTIVATED) and state.baseBotNum==0 and state.botnames[0]=="Alpha","up paging restores names")
  failures=failures+req(not add.downEvent(state,1),"paging activation gate")
  failures=failures+req(add.botEvent(state,add.ID_BOTNAME0+4,add.QM_ACTIVATED) and state.selectedBotNum==4,"bot selection")
  failures=failures+req(not add.botEvent(state,add.ID_BOTNAME0+7,add.QM_ACTIVATED),"selection visible-range guard")
  state.skill=3;state.teamNames=["Red","Blue"];state.team=1;state.delay=1000;state.actions=[];failures=failures+req(add.fightEvent(state,add.QM_ACTIVATED) and state.actions[0].text=="addbot Eta 4 Blue 1000\n" and state.delay==2500,"addbot command and delay")
  failures=failures+req(add.fightEvent(state,add.QM_ACTIVATED) and state.actions[1].text=="addbot Eta 4 Blue 2500\n" and state.delay==4000,"successive addbot delay")
  failures=failures+req(not state.actions[0].dispatched,"retail command suppression")
  state.actions=[];failures=failures+req(add.draw(state)==7 and count(state,"banner")==1 and count(state,"pic")==1 and count(state,"menu-draw")==1,"draw boundaries")
  failures=failures+req(add.backEvent(state,add.QM_ACTIVATED) and state.menuEvents[len(state.menuEvents)-1][0]=="pop","back pops menu")
  state=add.create(fixture(),true);add.addBotsMenu(state,4,2);failures=failures+req(state.pushed and state.cached and state.menuEvents[0][0]=="push" and state.teamNames[0]=="Red","public menu lifecycle")
  if failures!=0 then return failures end if;print("PASS: 19 native ui_addbots contracts (12 symbols)");return 0
end function
