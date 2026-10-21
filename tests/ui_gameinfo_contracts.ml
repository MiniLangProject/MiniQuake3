import mq3.client.ui_gameinfo as game
import mq3.shared.info as info

function req(ok,label) if not ok then return error(7960,"UI gameinfo contract: "+label) end if;return 1 end function
function fixture()
  arenas="{ map a0 type single } { map a1 type \"single ffa\" } { map a2 type single } { map a3 type single } { map train type single special training } { map final type single special final } { map duel type \"ffa tourney\" }"
  bots="{ name Sarge model sarge/default } { name Visor model visor/default }"
  s=game.create();game.UI_InitMemory(s);game.UI_LoadArenas(s,"scripts/arenas.txt",arenas,[]);game.UI_LoadBots(s,"scripts/bots.txt",bots,[]);return s
end function

function main(args)
  count=0
  mem=game.create();count=count+req(game.UI_Alloc(mem,1)==1 and mem.allocPoint==32,"pool first alignment");count=count+req(game.UI_Alloc(mem,33)==33 and mem.allocPoint==96,"pool second alignment");mem.allocPoint=game.POOLSIZE-16;count=count+req(game.UI_Alloc(mem,32)==void and mem.outOfMemory,"pool overflow");game.UI_InitMemory(mem);count=count+req(mem.allocPoint==0 and not mem.outOfMemory,"pool reset")
  parsed=game.UI_ParseInfos(mem,"// comment\n{ map q3dm1 longname \"Arena Gate\" type \"single ffa\" } { name \"Ranger\" empty\nnext }",4)
  count=count+req(len(parsed)==2 and info.value(parsed[0],"map")=="q3dm1" and info.value(parsed[0],"longname")=="Arena Gate","info parse quoted/comment")
  count=count+req(info.value(parsed[1],"empty")=="<NULL>","info missing line value")
  limited=game.UI_ParseInfos(mem,"{ a 1 } { b 2 }",1);count=count+req(len(limited)==1 and mem.diagnostics[len(mem.diagnostics)-1]=="Max infos exceeded\n","info max bound")

  s=fixture();count=count+req(game.UI_GetNumArenas(s)==7 and game.UI_GetNumBots(s)==2,"arena bot totals");count=count+req(game.UI_GetNumSPArenas(s)==4 and game.UI_GetNumSPTiers(s)==1 and s.numSpecialSinglePlayerArenas==2,"SP tier totals")
  count=count+req(info.value(game.UI_GetArenaInfoByMap(s,"A2"),"num")=="2","case-insensitive map lookup")
  count=count+req(info.value(game.UI_GetArenaInfoByNumber(s,4),"special")=="training" and info.value(game.UI_GetArenaInfoByNumber(s,6),"map")=="duel","arena number ordering")
  count=count+req(info.value(game.UI_GetSpecialArenaInfo(s,"FINAL"),"map")=="final","special lookup")
  count=count+req(game.UI_GetArenaInfoByNumber(s,99)==void and game.UI_GetArenaInfoByMap(s,"missing")==void,"invalid arena lookup")
  count=count+req(info.value(game.UI_GetBotInfoByNumber(s,1),"name")=="Visor" and info.value(game.UI_GetBotInfoByName(s,"sArGe"),"model")=="sarge/default","bot lookups")
  count=count+req(game.UI_GetBotInfoByNumber(s,-1)==void and game.UI_GetBotInfoByName(s,"none")==void,"invalid bot lookup")
  bits=game.GametypeBits("ffa tourney single team ctf");count=count+req(bits==31 and game.GametypeBits("FFA CTF")==17,"gametype bits")

  uneven=game.create();game.UI_InitMemory(uneven);game.UI_LoadArenas(uneven,"x","{ map a type single } { map b type single } { map c type single } { map d type single } { map e type single }",[]);count=count+req(uneven.numSinglePlayerArenas==4 and len(uneven.diagnostics)>=2,"uneven tier truncation")
  tooLarge=game.create();huge=decode(bytes(game.MAX_ARENAS_TEXT,65));count=count+req(game.UI_LoadArenasFromFile(tooLarge,"huge",huge)==0 and len(tooLarge.arenas)==0,"arena file size gate")

  game.setCvar(s,"g_spScores1","\\l0\\3");game.setCvar(s,"g_spScores2","\\l0\\2");game.setCvar(s,"g_spScores3","\\l0\\2");best=game.UI_GetBestScore(s,0);count=count+req(best.score==2 and best.skill==3,"best score/equal higher skill")
  count=count+req(game.UI_GetBestScore(s,-1).score==0,"best score invalid level")
  game.setCvar(s,"g_spSkill","3");count=count+req(game.UI_SetBestScore(s,0,1) and info.value(game.cvar(s,"g_spScores3"),"l0")=="1","set improved score");count=count+req(not game.UI_SetBestScore(s,0,4),"reject worse score");count=count+req(not game.UI_SetBestScore(s,0,9),"reject invalid score")
  game.setCvar(s,"g_spSkill","8");count=count+req(not game.UI_SetBestScore(s,1,1),"reject invalid skill")

  game.setCvar(s,"g_spAwards","\\a1\\7");count=count+req(game.UI_LogAwardData(s,1,3) and game.UI_GetAwardLevel(s,1)==10,"award accumulation");count=count+req(not game.UI_LogAwardData(s,1,0) and not game.UI_LogAwardData(s,6,1),"award validation")
  count=count+req(game.UI_ShowTierVideo(s,1) and not game.UI_ShowTierVideo(s,1) and not game.UI_ShowTierVideo(s,0),"tier video one-shot")
  count=count+req(game.UI_CanShowTierVideo(s,1),"tier video available");s.demoversion=true;count=count+req(not game.UI_CanShowTierVideo(s,1),"demo video restriction");game.UI_ShowTierVideo(s,8);count=count+req(game.UI_CanShowTierVideo(s,8),"demo tier eight")

  progress=fixture();count=count+req(game.UI_GetCurrentGame(progress)==4,"training first")
  game.setCvar(progress,"g_spSkill","1");game.UI_SetBestScore(progress,4,1);count=count+req(game.UI_GetCurrentGame(progress)==0,"first regular after training")
  for level=0 to 3 game.UI_SetBestScore(progress,level,1) end for;count=count+req(game.UI_GetCurrentGame(progress)==5,"final after regular arenas")
  count=count+req(game.UI_TierCompleted(progress,4)==0 and game.UI_TierCompleted(progress,5)==2,"special tier completion")
  count=count+req(game.UI_TierCompleted(progress,3)==1,"regular tier completion")
  game.setCvar(progress,"g_spScores1",info.setValue(game.cvar(progress,"g_spScores1"),"l2","2",void,void));count=count+req(game.UI_TierCompleted(progress,3)==-1,"incomplete tier")

  unlocked=fixture();game.UI_SPUnlock_f(unlocked);count=count+req(unlocked.levelMenuReinitialized and info.value(game.cvar(unlocked,"g_spScores1"),"l5")=="1" and info.value(game.cvar(unlocked,"g_spVideos"),"tier8")=="1","unlock levels/videos")
  game.UI_SPUnlockMedals_f(unlocked);count=count+req(game.UI_GetAwardLevel(unlocked,0)==100 and game.UI_GetAwardLevel(unlocked,5)==100,"unlock medals")
  game.UI_NewGame(unlocked);count=count+req(game.cvar(unlocked,"g_spScores1")=="" and game.cvar(unlocked,"g_spAwards")=="" and game.cvar(unlocked,"g_spVideos")=="","new game clear")

  demo=game.create();game.UI_InitGameinfo(demo,"a","{ map a type single } { map b type single } { map c type single } { map d type single }",[],"b","{ name Sarge }",[],0);count=count+req(demo.demoversion,"four-map demo detection")
  retail=game.create();game.UI_InitGameinfo(retail,"a","{ map a type single } { map b type single } { map c type single } { map d type single }{map t type single special training}",[],"b","{ name Sarge }",[],0);count=count+req(not retail.demoversion,"special map full detection");retail=game.UI_InitGameinfo(retail,"a","{ map a type single } { map b type single } { map c type single } { map d type single }{map t type single special training}",[],"b","{ name Sarge }",[],1);count=count+req(retail.demoversion,"fs restrict demo detection")
  print("PASS: "+str(count)+" UI gameinfo contracts")
  return 0
end function
