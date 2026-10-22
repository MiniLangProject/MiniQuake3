// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.ui_main_missionpack as ui
function req(value,label) if not value then return error(499,"ui_main missionpack contract: "+label) end if;return 1 end function
function contracts()
  checks=0;s=ui.create(false);checks=checks+req(ui.UI_RegisterCvars(s)==110,"complete 110-entry cvar table");checks=checks+req(ui.cvarString(s,"ui_teamName")=="Pagans" and ui.cvarString(s,"ui_serverStatusTimeOut")=="7000","cvar defaults")
  before=len(s.actions);checks=checks+req(ui.UI_UpdateCvars(s)==110 and len(s.actions)==before+110,"cvar update host boundary")
  checks=checks+req(ui.Text_Width(s,"ab^1cd",1.0,0)==32,"color escapes excluded from width");checks=checks+req(ui.Text_Width(s,"abcdef",1.0,3)==24 and ui.Text_Height(s,"x",0.5,0)==8,"font limit and height")
  assets=ui.AssetCache(s);checks=checks+req(assets==11 and ui.AssetCache(s)==11,"asset cache idempotent")
  parsed=ui.Asset_Parse(s,["{","gradientbar","gfx/gradient","menuEnterSound","sound/menu.wav","}"],0);checks=checks+req(parsed.ok and parsed.next==6,"asset parser")
  teams="teams { { \"Pagans\" \"icons/pagans\" \"Xaero\" \"Sarge\" \"Anarki\" \"Slash\" \"Klesk\" } } characters { { \"Mynx\" \"female\" } { \"Ranger\" \"male\" } } aliases { { \"Mynx\" \"mynx\" \"o\" } }"
  checks=checks+req(ui.UI_ParseTeamInfo(s,"ui/team.txt",teams),"retail-style team parser");checks=checks+req(len(s.teams)==1 and s.teams[0].teamMembers[4]=="Klesk","five team members");checks=checks+req(s.characters[0].base=="Janet" and s.characters[1].base=="James","character sex bases");checks=checks+req(s.aliases[0].ai=="mynx" and s.aliases[0].action=="o","alias semantics")
  game="gametypes { { \"FFA\" 0 } { \"CTF\" 4 } } joingametypes { { \"Any\" -1 } { \"Team\" 3 } } maps { { \"Arena Gate\" \"q3dm1\" 2 \"Sarge\" 0 100 3 240 } }"
  checks=checks+req(ui.UI_ParseGameInfo(s,"ui/gameinfo.txt",game),"gameinfo parser");checks=checks+req(len(s.maps)==1 and s.maps[0].mapLoadName=="q3dm1" and s.maps[0].timeToBeat[3]==240,"map fields and time-to-beat");checks=checks+req(len(s.gameTypes)==2 and len(s.joinGameTypes)==2,"game type tables")
  s.currentGameType=0;checks=checks+req(ui.UI_MapCountByGameType(s,true)==1,"map activation by game type");actual=[-1];checks=checks+req(ui.UI_SelectedMap(s,0,actual)=="Arena Gate" and actual[0]==0,"selected map translation")
  checks=checks+req(ui.UI_HeadCountByTeam(s)==2,"head count");actual=[-1];checks=checks+req(ui.UI_SelectedHead(s,1,actual)=="Ranger" and actual[0]==1,"selected head translation")
  s.servers=[ui.serverInfo("1.1.1.1","Zulu","q3dm1",3,8,0,80),ui.serverInfo("2.2.2.2","Alpha","q3ctf1",0,8,4,40),ui.serverInfo("3.3.3.3","Full","q3dm7",8,8,0,20)];s.currentNetFilter=0;s.currentNetSource=ui.AS_GLOBAL
  checks=checks+req(ui.UI_BuildServerDisplayList(s,true)==3,"server display build");s.sortKey=0;ui.UI_ServersSort(s,0,true);checks=checks+req(s.servers[s.displayServers[0]].hostname=="Alpha","server hostname sort");s.sortKey=4;ui.UI_ServersSort(s,4,true);checks=checks+req(s.servers[s.displayServers[0]].ping==20,"server ping sort")
  ui.setCvar(s,"ui_browserShowEmpty","0");checks=checks+req(ui.UI_BuildServerDisplayList(s,true)==2,"empty server filter");ui.setCvar(s,"ui_browserShowFull","0");checks=checks+req(ui.UI_BuildServerDisplayList(s,true)==1,"full server filter")
  checks=checks+req(ui.UI_FeederCount(s,ui.FEEDER_SERVERS)==1 and ui.UI_FeederItemText(s,ui.FEEDER_SERVERS,0,2)=="3 (8)","server feeder")
  s.currentGameType=ui.GT_FFA;s.currentNetGameType=ui.GT_TEAM;s.currentNetSource=ui.AS_GLOBAL;s.demoAvailable=false;checks=checks+req(ui.UI_OwnerDrawVisible(s,ui.UI_SHOW_FFA) and not ui.UI_OwnerDrawVisible(s,ui.UI_SHOW_NOTFFA),"ffa visibility");checks=checks+req(ui.UI_OwnerDrawVisible(s,ui.UI_SHOW_NETANYTEAMGAME) and not ui.UI_OwnerDrawVisible(s,ui.UI_SHOW_DEMOAVAILABLE),"network and demo visibility")
  old=s.currentCrosshair;ui.UI_Crosshair_HandleKey(s,0,0,ui.K_MOUSE1);checks=checks+req(s.currentCrosshair==old+1 and ui.cvarString(s,"cg_drawCrosshair")==str(old+1),"crosshair key")
  ui.setCvar(s,"handicap","5");ui.UI_Handicap_HandleKey(s,0,0,ui.K_MOUSE1);checks=checks+req(ui.cvarString(s,"handicap")=="100","handicap wrap")
  s.currentNetSource=ui.AS_LOCAL;s.realtime=100;ui.UI_StartServerRefresh(s,true);checks=checks+req(s.refreshActive and s.refreshTime==1100 and s.actions[len(s.actions)-1].name=="localservers","local refresh lifecycle");checks=checks+req(ui.UI_StopServerRefresh(s) and not s.refreshActive,"refresh stop")
  checks=checks+req(ui.UI_ReadableSize(1048577)=="1.00 MB" and ui.UI_ReadableSize(1610612736)=="1.-2 GB","native readable-size overflow semantics");checks=checks+req(ui.UI_PrintTime(3600000)=="60 min 0 sec" and ui.UI_PrintTime(3601000)=="1 hr 0 min","strict time boundaries");checks=checks+req(ui.stristr("AlphaSARGEomega","sarge")==5 and ui.stristr("abc","")==0,"case-insensitive substring")
  movies=ui.UI_LoadMovies(s,["intro.roq","tier1.ROQ"]);demos=ui.UI_LoadDemos(s,["match.dm_68","duel.dm_68"],68);checks=checks+req(movies==2 and s.movies[0]=="INTRO" and demos==2 and s.demos[1]=="DUEL","movie and demo loading")
  mods=ui.UI_LoadMods(s,[["osp","OSP Mod"],["baseq3",""]]);checks=checks+req(mods==2 and ui.UI_FeederItemText(s,ui.FEEDER_MODS,0,0)=="OSP Mod","mod descriptions")
  s.q3HeadNames=["sarge/red","sarge/blue"];checks=checks+req(ui.UI_hasSkinForBase(s,"sarge","red"),"team skin lookup")
  ui._UI_SetActiveMenu(s,4);checks=checks+req(s.fullscreen and s.paused and s.keyCatcher==2,"ingame menu activation");ui._UI_SetActiveMenu(s,0);checks=checks+req(not s.fullscreen and not s.paused and s.keyCatcher==0,"menu close lifecycle")
  s.actions=[];s.retailActive=true;ui.UI_DrawCenteredPic(s,7,100,50);checks=checks+req(len(s.actions)==1 and not s.actions[0].dispatched,"retail render suppression")
  s=ui.create(false);result=ui.vmMain(s,ui.UI_GETAPIVERSION,[]);checks=checks+req(result.value==ui.UI_API_VERSION,"vm api");result=ui.vmMain(s,ui.UI_INIT,[false]);checks=checks+req(result.value==0 and s.initialized,"vm init");result=ui.vmMain(s,99,[]);checks=checks+req(result.value==-1,"vm unknown")
  return checks
end function
function main(args) count=contracts();print("PASS: "+str(count)+" ui_main missionpack contracts");return 0 end function
