import mq3.client.ui_sppostgame as post
import mq3.client.ui_gameinfo as game
import mq3.client.ui_qmenu as menu
import mq3.client.cgame_drawtools as drawtools

function req(ok,label) if not ok then return error(7970,"UI SP postgame contract: "+label) end if;return 1 end function
function fixture()
  value=game.create();game.UI_InitMemory(value);game.UI_LoadArenas(value,"scripts/arenas.txt","{ map a0 type single } { map a1 type single } { map a2 type single } { map a3 type single } { map train type single special training } { map final type single special final }",[]);game.setCvar(value,"g_spSkill","1");return value
end function
function argv(rank)
  return ["postgame","3","0","55","2","0","1","15","1","0",str(rank),"20","1","1","10","2","2","5"]
end function
function configs() return ["\\n\\^1Ranger","\\n\\Sarge","\\n\\Visor"] end function
function contains(text,part)
  if len(bytes(part))==0 then return true end if;if len(bytes(text))<len(bytes(part)) then return false end if
  for offset=0 to len(bytes(text))-len(bytes(part)) match=true;for index=0 to len(bytes(part))-1 if bytes(text)[offset+index]!=bytes(part)[index] then match=false end if end for;if match then return true end if end for;return false
end function

function main(args)
  count=0;g=fixture();game.setCvar(g,"g_spAwards","\\a4\\90");value=post.UI_SPPostgameMenu_f(g,100,"\\sv_serverid\\42","\\mapname\\train",argv(0),configs(),false)
  count=count+req(value!=void and value.serverId==42 and value.level==4 and value.numClients==3,"command/config parsing")
  count=count+req(value.clientNums[0]==0 and value.clientNums[2]==2 and value.ranks[1]==1 and value.scores[2]==5,"scoreboard triples")
  count=count+req(value.numAwards==5 and value.awardsEarned[0]==0 and value.awardsEarned[3]==4 and value.awardsLevels[3]==100 and value.awardsEarned[4]==5,"award collection and frag century")
  count=count+req(game.UI_GetAwardLevel(g,0)==1 and game.UI_GetAwardLevel(g,1)==2 and game.UI_GetAwardLevel(g,4)==105 and game.UI_GetAwardLevel(g,5)==1,"persistent awards")
  count=count+req(value.won==0 and value.menu.cursor==2 and value.phase==1,"training victory and next focus")
  count=count+req(value.commands[0]=="music music/win\n" and value.winnerSound=="sound/player/announce/youwin.wav","winner audio")
  count=count+req(value.placeNames[0]=="Ranger" and value.placeNames[1]=="Sarge" and value.lastTier==2,"clean podium names and final tier")
  count=count+req(len(value.menu.items)==3 and (value.menu.items[0].flags&menu.QMF_INACTIVE)!=0 and value.ignoreKeysTime==1600 and len(value.assets)==18,"menu initialization and cache")
  count=count+req(value.pushed and value.keyCatcher and value.menuDepthReset,"UI stack and catcher setup")
  count=count+req(post.UI_SPPostgameMenu_f(g,0,"\\sv_serverid\\1","\\mapname\\missing",argv(0),configs(),false)==void,"unknown arena rejected")

  loss=post.UI_SPPostgameMenu_f(fixture(),0,"\\sv_serverid\\7","\\mapname\\a0",argv(1),configs(),false)
  count=count+req(loss.won==-1 and loss.menu.cursor==1 and loss.commands[0]=="music music/loss\n" and contains(loss.winnerSound,"Ranger_wins.wav"),"loss replay focus and audio")
  cappedArgs=["postgame","12","9","0","0","0","0","0","0"]
  for index=0 to 7 cappedArgs=cappedArgs+[str(index),str(index),str(100-index)] end for
  capped=post.UI_SPPostgameMenu_f(fixture(),0,"\\sv_serverid\\1","\\mapname\\a0",cappedArgs,configs(),false);count=count+req(capped.numClients==8 and capped.clientNums[7]==7,"scoreboard cap")

  eventValue=post.create(fixture());post.UI_SPPostgameMenu_Init(eventValue,100)
  count=count+req(not post.UI_SPPostgameMenu_AgainEvent(eventValue,menu.QM_GOTFOCUS) and not eventValue.popped,"again ignores focus")
  count=count+req(post.UI_SPPostgameMenu_AgainEvent(eventValue,menu.QM_ACTIVATED) and eventValue.popped and eventValue.commands[0]=="map_restart 0\n","again restart")
  eventValue=post.create(fixture());count=count+req(not post.UI_SPPostgameMenu_MenuEvent(eventValue,menu.QM_LOSTFOCUS),"menu ignores nonactivation");count=count+req(post.UI_SPPostgameMenu_MenuEvent(eventValue,menu.QM_ACTIVATED) and eventValue.commands[0]=="disconnect; levelselect\n","menu returns to level select")

  next=post.create(fixture());next.won=0;next.level=4;game.setCvar(next.game,"g_spScores1","\\l4\\1");arena=post.UI_SPPostgameMenu_NextEvent(next,menu.QM_ACTIVATED);count=count+req(arena!=void and next.starts[0][0]==0,"training advances to first arena")
  ignored=post.create(fixture());count=count+req(post.UI_SPPostgameMenu_NextEvent(ignored,menu.QM_GOTFOCUS)==void and not ignored.popped,"next ignores focus")
  blocked=post.create(fixture());blocked.won=1;blocked.level=3;arena=post.UI_SPPostgameMenu_NextEvent(blocked,menu.QM_ACTIVATED);count=count+req(arena!=void and blocked.starts[0][0]==4,"locked next tier uses current game")

  keys=post.create(fixture());post.UI_SPPostgameMenu_Init(keys,0);keys.phase=1;keys.ignoreKeysTime=100
  count=count+req(post.UI_SPPostgameMenu_MenuKey(keys,menu.K_ENTER,50,0,0)==menu.SOUND_NONE and keys.phase==1,"key debounce")
  count=count+req(post.UI_SPPostgameMenu_MenuKey(keys,menu.K_ENTER,100,0,0)==menu.SOUND_NONE and keys.phase==2 and keys.commands[0]=="abort_podium\n" and keys.ignoreKeysTime==350,"phase one skip")
  count=count+req(post.UI_SPPostgameMenu_MenuKey(keys,menu.K_ENTER,350,0,0)==menu.SOUND_NONE and keys.phase==3 and keys.ignoreKeysTime==600,"phase two skip")
  count=count+req(post.UI_SPPostgameMenu_MenuKey(keys,menu.K_ESCAPE,600,0,0)==menu.SOUND_NONE and not keys.menu.popped,"escape suppressed")
  keys.menu.items[1].flags=keys.menu.items[1].flags&(~menu.QMF_INACTIVE);keys.menu.cursor=1;keys.ignoreKeysTime=0;count=count+req(post.UI_SPPostgameMenu_MenuKey(keys,menu.K_ENTER,700,0,0)==menu.SOUND_MOVE and keys.popped and keys.commands[len(keys.commands)-1]=="map_restart 0\n","focused replay activation")

  medals=post.create(fixture());medals.numAwards=3;medals.awardsEarned[0]=0;medals.awardsLevels[0]=55;medals.awardsEarned[1]=1;medals.awardsLevels[1]=2;medals.awardsEarned[2]=3;medals.awardsLevels[2]=1
  rows=post.UI_SPPostgameMenu_DrawAwardsMedals(medals,3);count=count+req(len(rows)==5 and rows[1][5]=="55%" and rows[3][5]=="2","medal amounts and singular omission")
  first=post.UI_SPPostgameMenu_DrawAwardsPresentation(medals,250);again=post.UI_SPPostgameMenu_DrawAwardsPresentation(medals,500);count=count+req(first[0][5]=="Accuracy" and len(medals.sounds)==1 and len(again)==3,"award presentation and one-shot sound")
  count=count+req(len(post.UI_SPPostgameMenu_Cache(false))==18 and len(post.UI_SPPostgameMenu_Cache(true))==21,"cache and buildscript extras")

  names=post.create(fixture());names.playerConfigs=["\\n\\^1ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  result=post.Prepname(names,0);count=count+req(not contains(result,"^1") and len(bytes(result))<=61 and drawtools.proportionalStringWidth(result)<=256,"name clean, C bound and visual truncation")
  score=post.create(fixture());score.numClients=1;score.clientNums[0]=0;score.ranks[0]=post.RANK_TIED_FLAG|1;score.scores[0]=9;score.playerConfigs=["\\n\\^xPlayerNameLongerThanSixteen"]
  scoreRows=post.UI_SPPostgameMenu_MenuDrawScoreLine(score,0,16);count=count+req(len(scoreRows)==2 and scoreRows[0][5]=="(tie)" and contains(scoreRows[1][5],"#2: Player"),"tied scoreboard line")
  count=count+req(contains(scoreRows[1][5],"PlayerNameLongerThanSixteen"),"scoreboard field is minimum width")
  count=count+req(len(post.UI_SPPostgameMenu_MenuDrawScoreLine(score,1,0))==0 and len(post.UI_SPPostgameMenu_MenuDrawScoreLine(score,3,0))==2,"scoreboard blank and wrap")

  phases=post.create(fixture());post.UI_SPPostgameMenu_Init(phases,0);phases.serverId=11;phases.phase=1;phases.starttime=0;phases.winnerSound="winner";phases.placeNames=["A","B","C"];phases.numClients=3
  post.UI_SPPostgameMenu_MenuDraw(phases,999,11);count=count+req(phases.phase==1 and len(phases.sounds)==0,"podium delay")
  post.UI_SPPostgameMenu_MenuDraw(phases,1000,11);count=count+req(len(phases.sounds)==1 and phases.winnerSound=="","winner announcement")
  post.UI_SPPostgameMenu_MenuDraw(phases,5000,11);count=count+req(phases.phase==2 and phases.starttime==5000,"podium to awards")
  post.UI_SPPostgameMenu_MenuDraw(phases,9999,11);count=count+req(phases.phase==2,"minimum award screen duration")
  post.UI_SPPostgameMenu_MenuDraw(phases,10000,11);count=count+req(phases.phase==3 and (phases.menu.items[0].flags&menu.QMF_INACTIVE)==0,"menu activation")
  changed=post.create(fixture());changed.serverId=1;post.UI_SPPostgameMenu_MenuDraw(changed,0,2);count=count+req(changed.popped,"server change closes postgame")

  movie=post.create(fixture());post.UI_SPPostgameMenu_Init(movie,0);movie.phase=3;movie.serverId=1;movie.won=0;movie.lastTier=2;post.UI_SPPostgameMenu_MenuDraw(movie,0,1);count=count+req(movie.commands[0]=="disconnect; cinematic tier1.RoQ\n" and movie.cvarWrites[0][0]=="ui_spSelection" and movie.cvarWrites[1][1]=="levelselect","tier cinematic")
  ending=post.create(fixture());post.UI_SPPostgameMenu_Init(ending,0);ending.phase=3;ending.serverId=1;ending.won=2;ending.lastTier=2;post.UI_SPPostgameMenu_MenuDraw(ending,0,1);count=count+req(ending.commands[0]=="disconnect; cinematic end.RoQ\n" and ending.cvarWrites[0][1]=="","final cinematic")
  demo=post.create(fixture());post.UI_SPPostgameMenu_Init(demo,0);demo.phase=3;demo.serverId=1;demo.won=1;demo.demoVersion=true;post.UI_SPPostgameMenu_MenuDraw(demo,0,1);count=count+req(demo.commands[0]=="disconnect; cinematic demoEnd.RoQ\n","demo cinematic")
  print("PASS: "+str(count)+" UI SP postgame contracts")
  return 0
end function
