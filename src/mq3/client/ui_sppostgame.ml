// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_sppostgame.c.
package mq3.client.ui_sppostgame

import mq3.client.ui_gameinfo as gameinfo
import mq3.client.ui_qmenu as qmenu
import mq3.client.cgame_drawtools as drawtools
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as numeric

const MAX_SCOREBOARD_CLIENTS=8
const AWARD_PRESENTATION_TIME=2000
const ID_AGAIN=10
const ID_NEXT=11
const ID_MENU=12
const RANK_TIED_FLAG=16384
const AWARD_ACCURACY=0
const AWARD_IMPRESSIVE=1
const AWARD_EXCELLENT=2
const AWARD_GAUNTLET=3
const AWARD_FRAGS=4
const AWARD_PERFECT=5

struct Postgame game menu itemAgain itemNext itemMenu phase ignoreKeysTime starttime scoreboardtime serverId clientNums ranks scores placeNames playerConfigs level numClients won numAwards awardsEarned awardsLevels playedSound lastTier winnerSound demoVersion scoreboardEnabled popped commands cvarWrites sounds starts drawRows assets pushed keyCatcher menuDepthReset end struct

function create(game)
  return Postgame(game,qmenu.menu(true,false),void,void,void,0,0,0,0,0,array(8,0),array(8,0),array(8,0),["","",""],[],0,0,-1,0,array(6,0),array(6,0),array(6,false),0,"",false,true,false,[],[],[],[],[],[],false,false,false)
end function

function command(value,text) value.commands=value.commands+[text];return value end function
function cvar(value,name,text) value.cvarWrites=value.cvarWrites+[[name,text]];return value end function
function draw(kind,x,y,w,h,text,style,color,asset) return [kind,x,y,w,h,text,style,color,asset] end function
function medalNames() return ["Accuracy","Impressive","Excellent","Gauntlet","Frags","Perfect"] end function
function medalPics() return ["menu/medals/medal_accuracy","menu/medals/medal_impressive","menu/medals/medal_excellent","menu/medals/medal_gauntlet","menu/medals/medal_frags","menu/medals/medal_victory"] end function
function medalSounds() return ["sound/feedback/accuracy.wav","sound/feedback/impressive_a.wav","sound/feedback/excellent_a.wav","sound/feedback/gauntlet.wav","sound/feedback/frags.wav","sound/feedback/perfect.wav"] end function
function medalLocations() return [144,448,88,504,32,560] end function

// UI_SPPostgameMenu_AgainEvent
function UI_SPPostgameMenu_AgainEvent(value,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;value.popped=true;command(value,"map_restart 0\n");return true
end function

// UI_SPPostgameMenu_NextEvent
function UI_SPPostgameMenu_NextEvent(value,event)
  if event!=qmenu.QM_ACTIVATED then return void end if;value.popped=true;level=0;if value.won==0 then level=0 else level=value.level+1 end if;levelSet=numeric.trunc32(level/gameinfo.ARENAS_PER_TIER);current=gameinfo.UI_GetCurrentGame(value.game);if current==-1 then current=value.level end if;currentSet=numeric.trunc32(current/gameinfo.ARENAS_PER_TIER);if levelSet>currentSet or levelSet==gameinfo.UI_GetNumSPTiers(value.game) then level=current end if;arena=gameinfo.UI_GetArenaInfoByNumber(value.game,level);if arena==void then return void end if;value.starts=value.starts+[[level,arena]];return arena
end function

// UI_SPPostgameMenu_MenuEvent
function UI_SPPostgameMenu_MenuEvent(value,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;value.popped=true;command(value,"disconnect; levelselect\n");return true
end function

// UI_SPPostgameMenu_MenuKey
function UI_SPPostgameMenu_MenuKey(value,key,realtime,cursorx,cursory)
  if realtime<value.ignoreKeysTime then return qmenu.SOUND_NONE end if
  if value.phase==1 then command(value,"abort_podium\n");value.phase=2;value.starttime=realtime;value.ignoreKeysTime=realtime+250;return qmenu.SOUND_NONE end if
  if value.phase==2 then value.phase=3;value.starttime=realtime;value.ignoreKeysTime=realtime+250;return qmenu.SOUND_NONE end if
  if key==qmenu.K_ESCAPE or key==qmenu.K_MOUSE2 then return qmenu.SOUND_NONE end if
  activate=key==qmenu.K_ENTER or key==qmenu.K_KP_ENTER or qmenu.joystickActivate(key);current=qmenu.Menu_ItemAtCursor(value.menu)
  if (key==qmenu.K_MOUSE1 or key==qmenu.K_MOUSE3) and current!=void and (current.flags&qmenu.QMF_HASMOUSEFOCUS)!=0 then activate=true end if
  if activate and current!=void and (current.flags&(qmenu.QMF_MOUSEONLY|qmenu.QMF_GRAYED|qmenu.QMF_INACTIVE))==0 then
    if current.id==ID_AGAIN then UI_SPPostgameMenu_AgainEvent(value,qmenu.QM_ACTIVATED) else if current.id==ID_NEXT then UI_SPPostgameMenu_NextEvent(value,qmenu.QM_ACTIVATED) else if current.id==ID_MENU then UI_SPPostgameMenu_MenuEvent(value,qmenu.QM_ACTIVATED) end if;return qmenu.SOUND_MOVE
  end if
  return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)
end function

// UI_SPPostgameMenu_DrawAwardsMedals
function UI_SPPostgameMenu_DrawAwardsMedals(value,max)
  rows=[];locations=medalLocations();pics=medalPics();if max>0 then for index=0 to max-1 medal=value.awardsEarned[index];amount=value.awardsLevels[index];x=locations[index];rows=rows+[draw("bitmap",x,64,48,48,"",0,void,pics[medal])];text="";if medal==AWARD_ACCURACY then text=str(amount)+"%" else if amount!=1 then text=str(amount) end if;if text!="" then rows=rows+[draw("string",x+24,116,0,0,text,qmenu.UI_CENTER,[1.0,1.0,0.0,1.0],"")] end if end for end if;return rows
end function

// UI_SPPostgameMenu_DrawAwardsPresentation
function UI_SPPostgameMenu_DrawAwardsPresentation(value,timer)
  awardNum=numeric.trunc32(timer/AWARD_PRESENTATION_TIME);atimer=timer%AWARD_PRESENTATION_TIME;alpha=(AWARD_PRESENTATION_TIME-atimer)/AWARD_PRESENTATION_TIME;color=[1.0,1.0,1.0,alpha];medal=value.awardsEarned[awardNum];rows=[draw("proportional",320,64,0,0,medalNames()[medal],qmenu.UI_CENTER,color,"")]+UI_SPPostgameMenu_DrawAwardsMedals(value,awardNum+1)
  if not value.playedSound[awardNum] then value.playedSound[awardNum]=true;value.sounds=value.sounds+[medalSounds()[medal]] end if;return rows
end function

function playerInfo(value,clientNum) if clientNum>=0 and clientNum<len(value.playerConfigs) then return value.playerConfigs[clientNum] end if;return "" end function
function cleanName(text)
  data=bytes(text);result="";index=0;while index<len(data) if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2 else if data[index]>=32 and data[index]<=126 then result=result+decode(bytes([data[index]]));index=index+1 else index=index+1 end if end while;return result
end function
function padded(text,width) while len(bytes(text))<width text=text+" " end while;return text end function

// Prepname
function Prepname(value,index)
  name=info.value(playerInfo(value,value.clientNums[index]),"n");if len(bytes(name))>63 then name=decode(slice(bytes(name),0,63)) end if;name=cleanName(name);while len(bytes(name))>0 and drawtools.proportionalStringWidth(name)>256 name=decode(slice(bytes(name),0,len(bytes(name))-1)) end while;if index<3 then value.placeNames[index]=name end if;return name
end function

// UI_SPPostgameMenu_MenuDrawScoreLine
function UI_SPPostgameMenu_MenuDrawScoreLine(value,n,y)
  if n>value.numClients+1 then n=n-(value.numClients+2) end if;if n>=value.numClients then return [] end if;rank=value.ranks[n];rows=[];if (rank&RANK_TIED_FLAG)!=0 then rows=rows+[draw("string",640-31*8,y,0,0,"(tie)",qmenu.UI_LEFT|qmenu.UI_SMALLFONT,[1.0,1.0,1.0,1.0],"")];rank=rank&(~RANK_TIED_FLAG) end if;name=cleanName(info.value(playerInfo(value,value.clientNums[n]),"n"));text="#"+str(rank+1)+": "+padded(name,16)+" ";if value.scores[n]<10 and value.scores[n]>=0 then text=text+" " end if;text=text+str(value.scores[n]);return rows+[draw("string",640-25*8,y,0,0,text,qmenu.UI_LEFT|qmenu.UI_SMALLFONT,[1.0,1.0,1.0,1.0],"")]
end function

// UI_SPPostgameMenu_Cache
function UI_SPPostgameMenu_Cache(buildscript)
  assets=["menu/art/menu_0","menu/art/menu_1","menu/art/replay_0","menu/art/replay_1","menu/art/next_0","menu/art/next_1"]+medalPics()+medalSounds();if buildscript then assets=assets+["music/loss.wav","music/win.wav","sound/player/announce/youwin.wav"] end if;return assets
end function

// UI_SPPostgameMenu_Init
function UI_SPPostgameMenu_Init(value,realtime)
  value.menu=qmenu.menu(true,false);value.ignoreKeysTime=realtime+1500;value.assets=UI_SPPostgameMenu_Cache(false)
  value.itemMenu=qmenu.item(qmenu.MTYPE_BITMAP,"menu/art/menu_0",ID_MENU,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS|qmenu.QMF_INACTIVE);value.itemMenu.width=128;value.itemMenu.height=64;value.itemMenu.focuspic="menu/art/menu_1"
  value.itemAgain=qmenu.item(qmenu.MTYPE_BITMAP,"menu/art/replay_0",ID_AGAIN,320,416,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_PULSEIFFOCUS|qmenu.QMF_INACTIVE);value.itemAgain.width=128;value.itemAgain.height=64;value.itemAgain.focuspic="menu/art/replay_1"
  value.itemNext=qmenu.item(qmenu.MTYPE_BITMAP,"menu/art/next_0",ID_NEXT,640,416,qmenu.QMF_RIGHT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS|qmenu.QMF_INACTIVE);value.itemNext.width=128;value.itemNext.height=64;value.itemNext.focuspic="menu/art/next_1"
  value.menu=qmenu.Menu_AddItem(value.menu,value.itemMenu);value.menu=qmenu.Menu_AddItem(value.menu,value.itemAgain);value.menu=qmenu.Menu_AddItem(value.menu,value.itemNext);return value
end function

function addAward(value,medal,amount,logged)
  if logged!=0 then gameinfo.UI_LogAwardData(value.game,medal,logged) end if;value.awardsEarned[value.numAwards]=medal;value.awardsLevels[value.numAwards]=amount;value.numAwards=value.numAwards+1;return value
end function
function arg(argv,index) if index<0 or index>=len(argv) then return "" end if;return argv[index] end function

// UI_SPPostgameMenu_f
function UI_SPPostgameMenu_f(game,realtime,systemInfo,serverInfo,argv,playerConfigs,demoVersion)
  value=create(game);value.serverId=numbers.atoi(info.value(systemInfo,"sv_serverid"));map=info.value(serverInfo,"mapname");arena=gameinfo.UI_GetArenaInfoByMap(game,map);if arena==void then return void end if;value.level=numbers.atoi(info.value(arena,"num"));value.numClients=numbers.atoi(arg(argv,1));playerClient=numbers.atoi(arg(argv,2));playerRank=8;if value.numClients>MAX_SCOREBOARD_CLIENTS then value.numClients=MAX_SCOREBOARD_CLIENTS end if;value.playerConfigs=playerConfigs
  if value.numClients>0 then for index=0 to value.numClients-1 value.clientNums[index]=numbers.atoi(arg(argv,9+index*3));value.ranks[index]=numbers.atoi(arg(argv,10+index*3));value.scores[index]=numbers.atoi(arg(argv,11+index*3));if value.clientNums[index]==playerClient then playerRank=(value.ranks[index]&(~RANK_TIED_FLAG))+1 end if end for end if
  gameinfo.UI_SetBestScore(game,value.level,playerRank);awardValues=[numbers.atoi(arg(argv,3)),numbers.atoi(arg(argv,4)),numbers.atoi(arg(argv,5)),numbers.atoi(arg(argv,6)),numbers.atoi(arg(argv,7)),numbers.atoi(arg(argv,8))];value.numAwards=0
  if awardValues[0]>=50 then addAward(value,0,awardValues[0],1) end if;if awardValues[1]!=0 then addAward(value,1,awardValues[1],awardValues[1]) end if;if awardValues[2]!=0 then addAward(value,2,awardValues[2],awardValues[2]) end if;if awardValues[3]!=0 then addAward(value,3,awardValues[3],awardValues[3]) end if;oldFrags=numeric.trunc32(gameinfo.UI_GetAwardLevel(game,4)/100);gameinfo.UI_LogAwardData(game,4,awardValues[4]);newFrags=numeric.trunc32(gameinfo.UI_GetAwardLevel(game,4)/100);if newFrags>oldFrags then addAward(value,4,newFrags*100,0) end if;if awardValues[5]!=0 then addAward(value,5,1,1) end if
  if playerRank==1 then value.won=gameinfo.UI_TierCompleted(game,value.level) else value.won=-1 end if;value.starttime=realtime;value.scoreboardtime=realtime;value.demoVersion=demoVersion;value.keyCatcher=true;value.menuDepthReset=true;UI_SPPostgameMenu_Init(value,realtime);value.pushed=true;if playerRank==1 then value.menu.cursor=2 else value.menu.cursor=1 end if
  Prepname(value,0);Prepname(value,1);Prepname(value,2);if playerRank!=1 then value.winnerSound="sound/player/announce/"+value.placeNames[0]+"_wins.wav";command(value,"music music/loss\n") else value.winnerSound="sound/player/announce/youwin.wav";command(value,"music music/win\n") end if;value.phase=1;value.lastTier=gameinfo.UI_GetNumSPTiers(game);if gameinfo.UI_GetSpecialArenaInfo(game,"final")!=void then value.lastTier=value.lastTier+1 end if;return value
end function

// UI_SPPostgameMenu_MenuDraw
function UI_SPPostgameMenu_MenuDraw(value,realtime,currentServerId)
  rows=[];if currentServerId!=value.serverId then value.popped=true;return rows end if;if value.numClients>2 then rows=rows+[draw("proportional",510,389,0,0,value.placeNames[2],qmenu.UI_CENTER,[1.0,1.0,1.0,1.0],"")] end if;rows=rows+[draw("proportional",130,389,0,0,value.placeNames[1],qmenu.UI_CENTER,[1.0,1.0,1.0,1.0],""),draw("proportional",320,362,0,0,value.placeNames[0],qmenu.UI_CENTER,[1.0,1.0,1.0,1.0],"")]
  if value.phase==1 then timer=realtime-value.starttime;if timer>=1000 and value.winnerSound!="" then value.sounds=value.sounds+[value.winnerSound];value.winnerSound="" end if;if timer<5000 then value.drawRows=rows;return rows end if;value.phase=2;value.starttime=realtime end if
  if value.phase==2 then timer=realtime-value.starttime;if timer>=value.numAwards*AWARD_PRESENTATION_TIME then if timer<5000 then value.drawRows=rows;return rows end if;value.phase=3;value.starttime=realtime else rows=rows+UI_SPPostgameMenu_DrawAwardsPresentation(value,timer) end if end if
  if value.phase==3 then
    if value.demoVersion then
      if value.won==1 and gameinfo.UI_ShowTierVideo(value.game,8) then cvar(value,"nextmap","");command(value,"disconnect; cinematic demoEnd.RoQ\n");value.drawRows=rows;return rows end if
    else
      if value.won>-1 and gameinfo.UI_ShowTierVideo(value.game,value.won+1) then
        if value.won==value.lastTier then cvar(value,"nextmap","");command(value,"disconnect; cinematic end.RoQ\n");value.drawRows=rows;return rows end if
        cvar(value,"ui_spSelection",str(value.won*gameinfo.ARENAS_PER_TIER));cvar(value,"nextmap","levelselect");command(value,"disconnect; cinematic tier"+str(value.won+1)+".RoQ\n");value.drawRows=rows;return rows
      end if
    end if
    value.menu.items[0].flags=value.menu.items[0].flags&(~qmenu.QMF_INACTIVE);value.menu.items[1].flags=value.menu.items[1].flags&(~qmenu.QMF_INACTIVE);value.menu.items[2].flags=value.menu.items[2].flags&(~qmenu.QMF_INACTIVE);rows=rows+UI_SPPostgameMenu_DrawAwardsMedals(value,value.numAwards)+qmenu.Menu_Draw(value.menu,realtime)
  end if
  if value.scoreboardEnabled then timer=realtime-value.scoreboardtime;index=0;if value.numClients<=3 then index=0 else index=numeric.trunc32(timer/1500)%(value.numClients+2) end if;rows=rows+UI_SPPostgameMenu_MenuDrawScoreLine(value,index,0)+UI_SPPostgameMenu_MenuDrawScoreLine(value,index+1,16)+UI_SPPostgameMenu_MenuDrawScoreLine(value,index+2,32) end if;value.drawRows=rows;return rows
end function
