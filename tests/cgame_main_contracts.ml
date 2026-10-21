import mq3.client.cgame_main as main
function req(value,message) if not value then return error(7848,message) end if;return 1 end function
function find(actions,kind) for each item in actions if item.kind==kind then return item end if end for;return void end function
function item(name,pickup,sounds,icon) return main.Item(name,pickup,sounds,icon) end function
function main(args)
  count=0;s=main.create();s.gameVersion="baseq3-1";s.mapname="maps/q3dm1.bsp";s.configstrings[main.CS_GAME_VERSION]="baseq3-1";s.configstrings[main.CS_LEVEL_START_TIME]="1200";s.configstrings[main.CS_MUSIC]="music/intro music/loop";s.configstrings[main.CS_PLAYERS+2]="\\n\\Sarge";s.configstrings[main.CS_SOUNDS+1]="sound/world/wind.wav";s.configstrings[main.CS_MODELS+1]="models/mapobjects/teleporter/teleporter.md3"
  items=[item("none","","",""),item("weapon_rocketlauncher","sound/misc/w_pkup.wav","sound/weapons/rocket/rocklf1a.wav models/not-a-sound.md3","icons/iconw_rocket")]
  registered=main.registerCvars(s,"1",true);count=count+req(len(s.cvars)>80 and len(registered.actions)>80,"cvar table");count=count+req(main.findCvar(s,"cg_fov").value=="90","cvar default")
  updated=main.updateCvars(s,[["cg_drawTeamOverlay","2","1"],["cg_forceModel","1","1"]],true);count=count+req(find(updated.actions,"set")!=void and find(updated.actions,"new-info")!=void,"cvar transitions");count=count+req(not find(updated.actions,"set").dispatched,"retail suppression")
  snd=main.registerItemSounds(items[1],1,false);count=count+req(len(snd.actions)==2 and snd.actions[1].name=="sound/weapons/rocket/rocklf1a.wav","item sounds")
  sounds=main.registerSounds(s,items,true);count=count+req(find(sounds.actions,"register-game-sound").number==1,"game sounds")
  gfx=main.registerGraphics(s,items,true);count=count+req(find(gfx.actions,"load-world").name=="maps/q3dm1.bsp" and find(gfx.actions,"register-game-model").number==1,"graphics")
  s.clients[1].infoValid=true;s.clients[1].team=main.TEAM_SPECTATOR;s.clients[1].name="Spectator";count=count+req(main.buildSpectatorString(s)=="Spectator     " and s.spectatorWidth==-1,"spectators")
  clients=main.registerClients(s,true);count=count+req(find(clients.actions,"new-info")!=void,"clients")
  music=main.startMusic(s,true);count=count+req(music.actions[0].name=="music/intro" and music.actions[0].value=="music/loop","music")
  tokens=main.menuTokens("loadmenu { ui/test.menu } ");count=count+req(tokens==["loadmenu","{","ui/test.menu","}"],"menu lexer")
  asset=main.assetParse(s,["{","font","fonts/font.ttf","16","fadeClamp","0.75","shadowColor","1","0","0","0.5","}"],0,false);count=count+req(asset.handled and s.hudAssets.textFont=="fonts/font.ttf" and s.hudAssets.shadowFadeClamp==0.5,"asset parse")
  parsed=main.parseMenu(s,"ui/test.menu","assetGlobalDef { cursor gfx/cursor fadeCycle 50 } menudef { name scoreboard }",false);count=count+req(s.hudAssets.cursor=="gfx/cursor" and find(parsed.actions,"new-menu")!=void,"menu parse")
  loaded=main.loadMenus(s,"ui/hud.txt","loadmenu { ui/test.menu }",[["ui/test.menu","menudef { name x }"]],false);count=count+req(find(loaded.actions,"reset-menus")!=void and len(s.menuFiles)>=2,"menus")
  s.gametype=main.GT_TEAM;s.scores=[main.Score(2,main.TEAM_RED,10,33,44),main.Score(3,main.TEAM_BLUE,9,22,-1)];s.numScores=2;s.clients[2].infoValid=true;s.clients[2].team=main.TEAM_RED;s.clients[2].name="Red";s.clients[2].score=10;s.clients[3].infoValid=true;s.clients[3].team=main.TEAM_BLUE;s.clients[3].name="Blue"
  count=count+req(main.feederCount(s,main.FEEDER_REDTEAM_LIST)==1 and main.feederCount(s,main.FEEDER_SCOREBOARD)==2,"feeder count");main.feederSelection(s,main.FEEDER_BLUETEAM_LIST,0);count=count+req(s.selectedScore==1,"feeder select");count=count+req(main.feederItemText(s,main.FEEDER_SCOREBOARD,0,3,0)[0]=="Red","feeder text")
  s.time=1500;s.crosshairClientTime=800;s.crosshairClientNum=4;s.attackerTime=10;s.attackerNum=7;count=count+req(main.crosshairPlayer(s)==4 and main.lastAttacker(s)==7,"player queries");s.time=1900;count=count+req(main.crosshairPlayer(s)==-1,"crosshair expiry")
  cinematic=main.playCinematic(s,"video/logo.roq",1,2,3,4,true);count=count+req(cinematic.value==1 and not cinematic.actions[0].dispatched,"cinematic")
  initialized=main.init(s,5,6,2,"baseq3-1",1280,720,items,true);count=count+req(s.initialized and not s.loading and s.screenXScale==2.0 and s.levelStartTime==1200,"init state");count=count+req(find(initialized.actions,"load-map")!=void and find(initialized.actions,"clear-looping")!=void,"init boundaries")
  dispatch=main.vmMain(s,main.CG_CROSSHAIR_PLAYER,[],items,"baseq3-1",640,480,true);count=count+req(dispatch.value==-1,"vm query");main.vmMain(s,main.CG_MOUSE_EVENT,[3,-2],items,"baseq3-1",640,480,true);count=count+req(s.cursorX==3 and s.cursorY==-2,"vm mouse")
  closed=main.shutdown(s,true);count=count+req(not s.initialized and closed.actions[0].kind=="shutdown","shutdown")
  print("PASS: "+str(count)+" native cg_main contracts");return 0
end function
