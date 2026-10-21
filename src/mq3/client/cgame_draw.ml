// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_draw.c.  Rendering, tracing, sound and
// menu calls are represented as typed boundary actions so this module can run
// as an observer beside the authoritative retail cgame QVM.
package mq3.client.cgame_draw

import mq3.compat.numeric as n

const TEAM_FREE=0
const TEAM_RED=1
const TEAM_BLUE=2
const TEAM_SPECTATOR=3
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
const PM_INTERMISSION=5
const PMF_FOLLOW=0x1000
const PMF_SCOREBOARD=0x2000
const SNAPFLAG_RATE_DELAYED=1
const MAX_CLIENTS=64
const MAX_LOCATIONS=64
const LAG_SAMPLES=128
const VOTE_TIME=30000
const FADE_TIME=200
const BIGCHAR_WIDTH=16
const BIGCHAR_HEIGHT=16
const GIANT_WIDTH=32
const GIANT_HEIGHT=48
const TINYCHAR_WIDTH=8
const TINYCHAR_HEIGHT=8
const ICON_SIZE=48
const ITEM_BLOB_TIME=200
const ATTACKER_HEAD_TIME=10000

struct Action kind x y width height text shader color value client dispatched end struct
struct Glyph xSkip height imageWidth imageHeight top s t s2 t2 shader end struct
struct Client name team infoValid health armor location weapon powerups deferred headModel headSkin modelIcon end struct
struct Powerup expires icon end struct
struct TraceResult entityNum fog invisible end struct
struct Lagometer frameSamples snapshotSamples snapshotFlags frameCount snapshotCount end struct
struct State time levelStartTime serverTime latestSnapshotNum serverCommandSequence team gametype clientNum health armor ammo weapon weaponTime weaponFiring showScores levelShot draw2D drawStatus drawIcons draw3dIcons drawCrosshair drawCrosshairNames crosshairHealth renderingThirdPerson crosshairSize crosshairX crosshairY itemPickupBlendTime crosshairClientNum crosshairClientTime attackerTime attackerNum warmup warmupCount lowAmmoWarning scoreBoardShowing voteTime voteModified voteString voteYes voteNo teamVoteTime teamVoteModified teamVoteString teamVoteYes teamVoteNo pmType pmFlags noPredict synchronous stereoSeparation refX refY refWidth refHeight centerPrint centerPrintTime centerPrintY centerPrintCharWidth centerPrintLines voiceTime frameTime previousFrameTimes fpsIndex clients locations sortedTeamPlayers powerups lag actions emitted suppressed end struct

function action(kind,x,y,width,height,text,shader,color,value,client) return Action(kind,x,y,width,height,text,shader,color,value,client,false) end function
function publish(state,command,retailActive) command.dispatched=not retailActive;state.actions=state.actions+[command];if command.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if;return command end function
function client(name,team) return Client(name,team,true,100,0,0,0,0,false,"","","") end function
function powerup(expires,icon) return Powerup(expires,icon) end function
function lagometer() return Lagometer([],[],[],0,0) end function
function state()
  return State(0,0,0,0,0,TEAM_FREE,GT_FFA,0,100,0,0,0,0,false,false,false,true,true,true,true,1,true,true,false,32.0,0,0,0,-1,0,0,0,0,0,0,false,0,false,"",0,0,[0,0],[false,false],["",""],[0,0],[0,0],0,0,false,false,0.4,0,0,640,480,"",0,0,16,0,0,0,[0,0,0,0],0,[],[],[],[],lagometer(),[],0,0)
end function
function clear(value) value.actions=[];return void end function
function printableLength(text) data=bytes(text);index=0;count=0;while index<len(data) if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2 else count=count+1;index=index+1 end if end while;return count end function
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
function colorHealth(health,armor) if health<=0 then return [0.0,0.0,0.0,1.0] end if;count=armor;limit=n.trunc32(health*0.66/0.34);if count>limit then count=limit end if;total=health+count;g=0.0;b=0.0;if total>60 then g=1.0 else if total>=30 then g=(total-30)/30.0 end if;if total>=100 then b=1.0 else if total>=66 then b=(total-66)/33.0 end if;return [1.0,g,b,1.0] end function
function fadeAlpha(value,start,total) if start==0 then return 0.0 end if;t=value.time-start;if t<0 or t>=total then return 0.0 end if;if total-t<FADE_TIME then return (total-t)/FADE_TIME end if;return 1.0 end function
function drawText(value,x,y,text,size,color,retailActive) return publish(value,action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1),retailActive) end function
function drawPic(value,x,y,w,h,shader,color,retailActive) return publish(value,action("pic",x,y,w,h,"",shader,color,0,-1),retailActive) end function

// CG_Text_Width
function textWidth(text,scale,limit,glyphs,glyphScale)
  if text==void then return 0 end if;data=bytes(text);max=len(data);if limit>0 and max>limit then max=limit end if;index=0;count=0;width=0.0
  while index<len(data) and count<max
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2
    else
      if data[index]<len(glyphs) then width=width+glyphs[data[index]].xSkip end if
      index=index+1;count=count+1
    end if
  end while;return n.trunc32(width*scale*glyphScale)
end function
// CG_Text_Height
function textHeight(text,scale,limit,glyphs,glyphScale)
  if text==void then return 0 end if;data=bytes(text);max=len(data);if limit>0 and max>limit then max=limit end if;index=0;count=0;height=0.0
  while index<len(data) and count<max
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2
    else
      if data[index]<len(glyphs) and glyphs[data[index]].height>height then height=glyphs[data[index]].height end if
      index=index+1;count=count+1
    end if
  end while;return n.trunc32(height*scale*glyphScale)
end function
// CG_Text_PaintChar
function textPaintChar(value,x,y,width,height,scale,s,t,s2,t2,shader,retailActive) return publish(value,action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1),retailActive) end function
// CG_Text_Paint
function textPaint(value,x,y,scale,color,text,adjust,limit,style,glyphs,glyphScale,retailActive)
  if text==void then return x end if;data=bytes(text);max=len(data);if limit>0 and max>limit then max=limit end if;index=0;count=0;useScale=scale*glyphScale
  while index<len(data) and count<max
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then publish(value,action("set-color",0,0,0,0,"","",color,data[index+1],-1),retailActive);index=index+2
    else
      if data[index]<len(glyphs) then
        glyph=glyphs[data[index]]
        if style==1 or style==2 then ofs=1;if style==2 then ofs=2 end if;textPaintChar(value,x+ofs,y-n.trunc32(useScale*glyph.top)+ofs,glyph.imageWidth,glyph.imageHeight,useScale,glyph.s,glyph.t,glyph.s2,glyph.t2,glyph.shader,retailActive) end if
        textPaintChar(value,x,y-n.trunc32(useScale*glyph.top),glyph.imageWidth,glyph.imageHeight,useScale,glyph.s,glyph.t,glyph.s2,glyph.t2,glyph.shader,retailActive);x=x+n.trunc32(glyph.xSkip*useScale+adjust)
      end if
      index=index+1;count=count+1
    end if
  end while;return x
end function

// CG_DrawField
function drawField(value,x,y,width,number,retailActive)
  if width<1 then return [] end if;if width>5 then width=5 end if;low=-99999;high=99999;if width==1 then low=0;high=9 else if width==2 then low=-9;high=99 else if width==3 then low=-99;high=999 else if width==4 then low=-999;high=9999 end if;number=clamp(number,low,high);text=str(number);if len(text)>width then text=decode(slice(bytes(text),0,width)) end if;x=x+2+16*(width-len(text));result=[]
  data=bytes(text);if len(data)>0 then for i=0 to len(data)-1 frame=data[i]-48;if data[i]==45 then frame=10 end if;result=result+[publish(value,action("number",x,y,16,24,"",str(frame),void,frame,-1),retailActive)];x=x+16 end for end if;return result
end function
// CG_Draw3DModel
function draw3DModel(value,x,y,w,h,model,skin,origin,angles,retailActive) if not value.drawIcons or not value.draw3dIcons then return void end if;return publish(value,action("model",x,y,w,h,str(origin)+"|"+str(angles),model,void,0,-1),retailActive) end function
// CG_DrawHead
function drawHead(value,x,y,w,h,clientNum,angles,retailActive) if clientNum<0 or clientNum>=len(value.clients) then return void end if;ci=value.clients[clientNum];if value.draw3dIcons and ci.headModel!="" then draw3DModel(value,x,y,w,h,ci.headModel,ci.headSkin,[70.0,0.0,0.0],angles,retailActive) else if value.drawIcons and ci.modelIcon!="" then drawPic(value,x,y,w,h,ci.modelIcon,void,retailActive) end if;if ci.deferred then drawPic(value,x,y,w,h,"defer",void,retailActive) end if;return void end function
// CG_DrawFlagModel
function drawFlagModel(value,x,y,w,h,team,force2D,retailActive) if team!=TEAM_RED and team!=TEAM_BLUE and team!=TEAM_FREE then return void end if;name="neutral";if team==TEAM_RED then name="red" else if team==TEAM_BLUE then name="blue" end if;if not force2D and value.draw3dIcons then return draw3DModel(value,x,y,w,h,name+"-flag-model","",[90.0,0.0,0.0],[0.0,0.0,0.0],retailActive) end if;if value.drawIcons then return drawPic(value,x,y,w,h,name+"-flag-icon",void,retailActive) end if;return void end function
// CG_DrawStatusBarHead
function drawStatusBarHead(value,x,damageTime,damageX,retailActive) size=60;if damageTime!=0 and value.time-damageTime<500 then frac=(value.time-damageTime)/500.0;size=n.trunc32(60*(1.5-frac*0.5));x=x-n.trunc32((size-60)*(0.5+damageX*0.5)) end if;return drawHead(value,x,480-size,size,size,value.clientNum,[0.0,180.0,0.0],retailActive) end function
// CG_DrawStatusBarFlag
function drawStatusBarFlag(value,x,team,retailActive) return drawFlagModel(value,x,480-ICON_SIZE,ICON_SIZE,ICON_SIZE,team,false,retailActive) end function
// CG_DrawTeamBackground
function drawTeamBackground(value,x,y,w,h,alpha,team,retailActive) if team!=TEAM_RED and team!=TEAM_BLUE then return void end if;color=[1.0,0.0,0.0,alpha];if team==TEAM_BLUE then color=[0.0,0.0,1.0,alpha] end if;return drawPic(value,x,y,w,h,"team-status",color,retailActive) end function
// CG_DrawStatusBar
function drawStatusBar(value,retailActive)
  if not value.drawStatus then return void end if;drawTeamBackground(value,0,420,640,60,0.33,value.team,retailActive);if value.weapon!=0 and value.ammo>=0 then drawField(value,0,432,3,value.ammo,retailActive) end if;drawStatusBarHead(value,249,0,0.0,retailActive);drawField(value,185,432,3,value.health,retailActive);if value.armor>0 then drawField(value,370,432,3,value.armor,retailActive);if value.drawIcons and not value.draw3dIcons then drawPic(value,434,432,48,48,"armor",void,retailActive) end if end if;return void
end function

// CG_DrawAttacker
function drawAttacker(value,y,retailActive) if value.health<=0 or value.attackerTime==0 or value.attackerNum<0 or value.attackerNum>=len(value.clients) or value.attackerNum==value.clientNum then return y end if;if value.time-value.attackerTime>ATTACKER_HEAD_TIME then value.attackerTime=0;return y end if;drawHead(value,580,y,60,60,value.attackerNum,[0.0,180.0,0.0],retailActive);name=value.clients[value.attackerNum].name;drawText(value,640-printableLength(name)*16,y+60,name,16,[1.0,1.0,1.0,0.5],retailActive);return y+78 end function
// CG_DrawSnapshot
function drawSnapshot(value,y,retailActive) text="time:"+str(value.serverTime)+" snap:"+str(value.latestSnapshotNum)+" cmd:"+str(value.serverCommandSequence);drawText(value,635-printableLength(text)*16,y+2,text,16,void,retailActive);return y+20 end function
// CG_DrawFPS
function drawFPS(value,y,milliseconds,retailActive) frame=milliseconds-value.frameTime;value.frameTime=milliseconds;slot=value.fpsIndex%4;if slot<len(value.previousFrameTimes) then value.previousFrameTimes[slot]=frame end if;value.fpsIndex=value.fpsIndex+1;if value.fpsIndex>4 then total=0;for each sample in value.previousFrameTimes total=total+sample end for;if total==0 then total=1 end if;fps=n.trunc32(4000/total);text=str(fps)+"fps";drawText(value,635-printableLength(text)*16,y+2,text,16,void,retailActive) end if;return y+20 end function
// CG_DrawTimer
function drawTimer(value,y,retailActive) seconds=n.trunc32((value.time-value.levelStartTime)/1000);mins=n.trunc32(seconds/60);seconds=seconds-mins*60;text=str(mins)+":"+str(n.trunc32(seconds/10))+str(seconds%10);drawText(value,635-printableLength(text)*16,y+2,text,16,void,retailActive);return y+20 end function
// CG_DrawTeamOverlay
function drawTeamOverlay(value,y,right,upper,retailActive)
  if value.team!=TEAM_RED and value.team!=TEAM_BLUE then return y end if;players=[];pwidth=0;count=len(value.sortedTeamPlayers);if count>8 then count=8 end if
  if count>0 then for i=0 to count-1 index=value.sortedTeamPlayers[i];if index>=0 and index<len(value.clients) then ci=value.clients[index];if ci.infoValid and ci.team==value.team then players=players+[index];width=printableLength(ci.name);if width>pwidth then pwidth=width end if end if end if end for end if
  if len(players)==0 then return y end if;if pwidth>12 then pwidth=12 end if;lwidth=0;for each location in value.locations width=printableLength(location);if width>lwidth then lwidth=width end if end for;if lwidth>16 then lwidth=16 end if;width=(pwidth+lwidth+11)*8;x=0;if right then x=640-width end if;height=len(players)*8;if not upper then y=y-height end if;result=y;if upper then result=y+height end if;drawTeamBackground(value,x,y,width,height,0.33,value.team,retailActive)
  for each index in players ci=value.clients[index];drawText(value,x+8,y,ci.name,8,void,retailActive);location="unknown";if ci.location>=0 and ci.location<len(value.locations) and value.locations[ci.location]!="" then location=value.locations[ci.location] end if;drawText(value,x+16+pwidth*8,y,location,8,void,retailActive);drawText(value,x+24+(pwidth+lwidth)*8,y,str(ci.health)+" "+str(ci.armor),8,colorHealth(ci.health,ci.armor),retailActive);drawPic(value,x+48+(pwidth+lwidth)*8,y,8,8,"weapon-"+str(ci.weapon),void,retailActive);y=y+8 end for;return result
end function
// CG_DrawUpperRight
function drawUpperRight(value,milliseconds,retailActive) y=0;if value.gametype>=GT_TEAM then y=drawTeamOverlay(value,y,true,true,retailActive) end if;y=drawSnapshot(value,y,retailActive);y=drawFPS(value,y,milliseconds,retailActive);y=drawTimer(value,y,retailActive);return drawAttacker(value,y,retailActive) end function

// CG_DrawScores
function drawScores(value,y,score1,score2,retailActive) y=y-24;if value.gametype>=GT_TEAM then drawText(value,600,y,str(score2),16,[0.0,0.0,1.0,0.33],retailActive);drawText(value,560,y,str(score1),16,[1.0,0.0,0.0,0.33],retailActive) else drawText(value,600,y,str(score1),16,void,retailActive) end if;return y end function
// CG_DrawPowerups
function drawPowerups(value,y,retailActive) if len(value.powerups)==0 then return y end if;for each item in value.powerups if item.expires>value.time then y=y-52;seconds=n.trunc32((item.expires-value.time)/1000);drawText(value,590,y,str(seconds),16,void,retailActive);drawPic(value,608,y,48,48,item.icon,void,retailActive) end if end for;return y end function
// CG_DrawLowerRight
function drawLowerRight(value,score1,score2,retailActive) y=480;y=drawScores(value,y,score1,score2,retailActive);return drawPowerups(value,y,retailActive) end function
// CG_DrawPickupItem
function drawPickupItem(value,y,itemName,itemIcon,pickupTime,retailActive) alpha=fadeAlpha(value,pickupTime,3000);if alpha==0.0 then return y end if;drawPic(value,8,y,32,32,itemIcon,[1.0,1.0,1.0,alpha],retailActive);drawText(value,48,y+8,itemName,16,[1.0,1.0,1.0,alpha],retailActive);return y+32 end function
// CG_DrawLowerLeft
function drawLowerLeft(value,itemName,itemIcon,pickupTime,retailActive) return drawPickupItem(value,440,itemName,itemIcon,pickupTime,retailActive) end function
// CG_DrawTeamInfo
function drawTeamInfo(value,retailActive) return drawTeamOverlay(value,480,false,false,retailActive) end function
// CG_DrawHoldableItem
function drawHoldableItem(value,icon,retailActive) if icon=="" then return void end if;return drawPic(value,640-ICON_SIZE,480-ICON_SIZE,ICON_SIZE,ICON_SIZE,icon,void,retailActive) end function
// CG_DrawPersistantPowerup
function drawPersistantPowerup(value,icon,retailActive) if icon=="" then return void end if;return drawPic(value,640-ICON_SIZE,480-ICON_SIZE*2,ICON_SIZE,ICON_SIZE,icon,void,retailActive) end function
// CG_DrawReward
function drawReward(value,rewardTime,rewardCount,rewardShader,rewardSound,retailActive) alpha=fadeAlpha(value,rewardTime,3000);if alpha==0.0 then return false end if;if rewardCount>=10 then drawPic(value,320-32,56,64,64,rewardShader,[1.0,1.0,1.0,alpha],retailActive);drawText(value,320+32,72,str(rewardCount),16,[1.0,1.0,1.0,alpha],retailActive) else for i=0 to rewardCount-1 drawPic(value,320-rewardCount*16+i*32,56,32,32,rewardShader,[1.0,1.0,1.0,alpha],retailActive) end for end if;return true end function

// CG_AddLagometerFrameInfo
function addLagometerFrameInfo(value) sample=value.time-value.latestSnapshotNum;if len(value.lag.frameSamples)<LAG_SAMPLES then value.lag.frameSamples=value.lag.frameSamples+[sample] else value.lag.frameSamples[value.lag.frameCount%LAG_SAMPLES]=sample end if;value.lag.frameCount=value.lag.frameCount+1;return sample end function
// CG_AddLagometerSnapshotInfo
function addLagometerSnapshotInfo(value,ping,flags,present) sample=ping;if not present then sample=-1;flags=0 end if;if len(value.lag.snapshotSamples)<LAG_SAMPLES then value.lag.snapshotSamples=value.lag.snapshotSamples+[sample];value.lag.snapshotFlags=value.lag.snapshotFlags+[flags] else slot=value.lag.snapshotCount%LAG_SAMPLES;value.lag.snapshotSamples[slot]=sample;value.lag.snapshotFlags[slot]=flags end if;value.lag.snapshotCount=value.lag.snapshotCount+1;return sample end function
// CG_DrawDisconnect
function drawDisconnect(value,commandTime,currentCmdTime,retailActive) if commandTime<=currentCmdTime then return false end if;if ((value.time>>9)&1)!=0 then return true end if;drawPic(value,640-48,480-48,48,48,"disconnect",void,retailActive);return true end function
// CG_DrawLagometer
function drawLagometer(value,enabled,commandTime,currentCmdTime,retailActive) if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if;drawPic(value,640-48,480-48,48,48,"lagometer",void,retailActive);for each sample in value.lag.frameSamples publish(value,action("lag-frame",0,0,1,clamp(sample,-100,100),"","",void,sample,-1),retailActive) end for;for each sample in value.lag.snapshotSamples publish(value,action("lag-snapshot",0,0,1,clamp(sample,-900,900),"","",void,sample,-1),retailActive) end for;if value.noPredict or value.synchronous then drawText(value,592,432,"snc",16,void,retailActive) end if;return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end function

// CG_CenterPrint
function centerPrint(value,text,y,charWidth) value.centerPrint=text;value.centerPrintTime=value.time;value.centerPrintY=y;value.centerPrintCharWidth=charWidth;value.centerPrintLines=1;data=bytes(text);for each ch in data if ch==10 then value.centerPrintLines=value.centerPrintLines+1 end if end for;return value.centerPrintLines end function
// CG_DrawCenterString
function drawCenterString(value,centertime,retailActive) alpha=fadeAlpha(value,value.centerPrintTime,n.trunc32(1000*centertime));if alpha==0.0 then return false end if;lines=[];remaining=value.centerPrint;start=0;data=bytes(remaining);for i=0 to len(data) if i==len(data) or data[i]==10 then lines=lines+[decode(slice(data,start,i-start))];start=i+1 end if end for;y=value.centerPrintY-n.trunc32(value.centerPrintLines*BIGCHAR_HEIGHT/2);for each line in lines if len(line)>50 then line=decode(slice(bytes(line),0,50)) end if;x=n.trunc32((640-value.centerPrintCharWidth*printableLength(line))/2);drawText(value,x,y,line,value.centerPrintCharWidth,[1.0,1.0,1.0,alpha],retailActive);y=y+n.trunc32(value.centerPrintCharWidth*1.5) end for;return true end function
// CG_DrawCrosshair
function drawCrosshair(value,retailActive) if value.drawCrosshair==0 or value.team==TEAM_SPECTATOR or value.renderingThirdPerson then return false end if;size=value.crosshairSize;elapsed=value.time-value.itemPickupBlendTime;if elapsed>0 and elapsed<ITEM_BLOB_TIME then size=size*(1.0+elapsed/ITEM_BLOB_TIME) end if;color=void;if value.crosshairHealth then color=colorHealth(value.health,value.armor) end if;drawPic(value,value.refX+n.trunc32((value.refWidth-size)/2)+value.crosshairX,value.refY+n.trunc32((value.refHeight-size)/2)+value.crosshairY,n.trunc32(size),n.trunc32(size),"crosshair-"+str(value.drawCrosshair%10),color,retailActive);return true end function
// CG_ScanForCrosshairEntity
function scanForCrosshairEntity(value,trace) if trace.entityNum<0 or trace.entityNum>=MAX_CLIENTS or trace.fog or trace.invisible then return false end if;value.crosshairClientNum=trace.entityNum;value.crosshairClientTime=value.time;publish(value,action("trace",0,0,0,0,"131072","",void,trace.entityNum,trace.entityNum),true);return true end function
// CG_DrawCrosshairNames
function drawCrosshairNames(value,trace,retailActive) if value.drawCrosshair==0 or not value.drawCrosshairNames or value.renderingThirdPerson then return false end if;scanForCrosshairEntity(value,trace);alpha=fadeAlpha(value,value.crosshairClientTime,1000)*0.5;if alpha==0.0 or value.crosshairClientNum<0 or value.crosshairClientNum>=len(value.clients) then return false end if;name=value.clients[value.crosshairClientNum].name;drawText(value,320-printableLength(name)*8,170,name,16,[1.0,1.0,1.0,alpha],retailActive);return true end function
// CG_DrawSpectator
function drawSpectator(value,retailActive) drawText(value,248,440,"SPECTATOR",16,void,retailActive);if value.gametype==GT_TOURNAMENT then drawText(value,200,460,"waiting to play",16,void,retailActive) else if value.gametype>=GT_TEAM then drawText(value,8,460,"press ESC and use the JOIN menu to play",16,void,retailActive) end if;return void end function
// CG_DrawVote
function drawVote(value,retailActive) if value.voteTime==0 then return false end if;if value.voteModified then value.voteModified=false;publish(value,action("sound",0,0,0,0,"talk","",void,0,-1),retailActive) end if;sec=n.trunc32((VOTE_TIME-(value.time-value.voteTime))/1000);if sec<0 then sec=0 end if;drawText(value,0,58,"VOTE("+str(sec)+"):"+value.voteString+" yes:"+str(value.voteYes)+" no:"+str(value.voteNo),8,void,retailActive);return true end function
// CG_DrawTeamVote
function drawTeamVote(value,retailActive) offset=-1;if value.team==TEAM_RED then offset=0 else if value.team==TEAM_BLUE then offset=1 end if;if offset<0 or value.teamVoteTime[offset]==0 then return false end if;if value.teamVoteModified[offset] then value.teamVoteModified[offset]=false;publish(value,action("sound",0,0,0,0,"talk","",void,0,-1),retailActive) end if;sec=n.trunc32((VOTE_TIME-(value.time-value.teamVoteTime[offset]))/1000);if sec<0 then sec=0 end if;drawText(value,0,90,"TEAMVOTE("+str(sec)+"):"+value.teamVoteString[offset]+" yes:"+str(value.teamVoteYes[offset])+" no:"+str(value.teamVoteNo[offset]),8,void,retailActive);return true end function
// CG_DrawScoreboard
function drawScoreboard(value,retailActive) if value.showScores or value.pmType==3 or value.pmType==PM_INTERMISSION then publish(value,action("scoreboard",0,0,640,480,"","",void,0,-1),retailActive);return true end if;return false end function
// CG_DrawIntermission
function drawIntermission(value,centertime,retailActive) if value.gametype==GT_SINGLE_PLAYER then return drawCenterString(value,centertime,retailActive) end if;value.scoreBoardShowing=drawScoreboard(value,retailActive);return value.scoreBoardShowing end function
// CG_DrawFollow
function drawFollow(value,retailActive) if (value.pmFlags&PMF_FOLLOW)==0 then return false end if;drawText(value,248,24,"following",16,void,retailActive);name="";if value.clientNum>=0 and value.clientNum<len(value.clients) then name=value.clients[value.clientNum].name end if;drawText(value,n.trunc32((640-GIANT_WIDTH*printableLength(name))/2),40,name,GIANT_WIDTH,void,retailActive);return true end function
// CG_DrawAmmoWarning
function drawAmmoWarning(value,enabled,retailActive) if not enabled or value.lowAmmoWarning==0 then return false end if;text="LOW AMMO WARNING";if value.lowAmmoWarning==2 then text="OUT OF AMMO" end if;drawText(value,320-printableLength(text)*8,64,text,16,void,retailActive);return true end function
// CG_DrawProxWarning
function drawProxWarning(value,ticking,proxTick,retailActive) if not ticking then return false end if;text="YOU HAVE BEEN MINED";if proxTick!=0 then text="INTERNAL COMBUSTION IN: "+str(proxTick) end if;drawText(value,320-printableLength(text)*8,80,text,16,[1.0,0.0,0.0,1.0],retailActive);return true end function
// CG_DrawWarmup
function drawWarmup(value,retailActive) if value.warmup==0 then return false end if;if value.warmup<0 then drawText(value,320-19*8,24,"Waiting for players",16,void,retailActive);value.warmupCount=0;return true end if;mode="Free For All";if value.gametype==GT_TEAM then mode="Team Deathmatch" else if value.gametype==GT_CTF then mode="Capture the Flag" end if;drawText(value,320-printableLength(mode)*16,25,mode,32,void,retailActive);sec=n.trunc32((value.warmup-value.time)/1000);if sec<0 then value.warmup=0;sec=0 end if;if sec!=value.warmupCount then value.warmupCount=sec;if sec>=0 and sec<=2 then publish(value,action("sound",0,0,0,0,"count"+str(sec+1),"",void,sec,-1),retailActive) end if end if;text="Starts in: "+str(sec+1);cw=16;if sec==0 then cw=28 else if sec==1 then cw=24 else if sec==2 then cw=20 end if;drawText(value,320-printableLength(text)*cw/2,70,text,cw,void,retailActive);return true end function
// CG_DrawTimedMenus
function drawTimedMenus(value,retailActive) if value.voiceTime!=0 and value.time-value.voiceTime>2500 then publish(value,action("menu-close",0,0,0,0,"voiceMenu","",void,0,-1),retailActive);publish(value,action("cvar",0,0,0,0,"cl_conXOffset=0","",void,0,-1),retailActive);value.voiceTime=0;return true end if;return false end function
// CG_Draw2D
function draw2DFrame(value,trace,retailActive)
  if value.levelShot or not value.draw2D then return false end if;if value.pmType==PM_INTERMISSION then drawIntermission(value,3.0,retailActive);return true end if
  if value.team==TEAM_SPECTATOR then
    drawSpectator(value,retailActive);drawCrosshair(value,retailActive);drawCrosshairNames(value,trace,retailActive)
  else
    if not value.showScores and value.health>0 then drawStatusBar(value,retailActive);drawAmmoWarning(value,true,retailActive);drawCrosshair(value,retailActive);drawCrosshairNames(value,trace,retailActive);drawReward(value,0,0,"","",retailActive) end if
    if value.gametype>=GT_TEAM then drawTeamInfo(value,retailActive) end if
  end if
  drawVote(value,retailActive);drawTeamVote(value,retailActive);drawLagometer(value,true,0,0,retailActive);drawUpperRight(value,value.time,retailActive);drawLowerRight(value,0,0,retailActive);if not drawFollow(value,retailActive) then drawWarmup(value,retailActive) end if;value.scoreBoardShowing=drawScoreboard(value,retailActive);if not value.scoreBoardShowing then drawCenterString(value,3.0,retailActive) end if;return true
end function
// CG_DrawTourneyScoreboard
function drawTourneyScoreboard(value,retailActive) publish(value,action("tourney-scoreboard",0,0,640,480,"","",void,0,-1),retailActive);return true end function
// CG_DrawActive
function drawActive(value,stereoView,hasSnapshot,trace,retailActive) if not hasSnapshot then publish(value,action("information",0,0,640,480,"","",void,0,-1),retailActive);return "information" end if;if value.team==TEAM_SPECTATOR and (value.pmFlags&PMF_SCOREBOARD)!=0 then drawTourneyScoreboard(value,retailActive);return "tourney" end if;separation=0.0;if stereoView==1 then separation=-value.stereoSeparation/2.0 else if stereoView==2 then separation=value.stereoSeparation/2.0 end if;publish(value,action("render-scene",value.refX,value.refY,value.refWidth,value.refHeight,"stereo","",void,n.trunc32(separation*1000),-1),retailActive);draw2DFrame(value,trace,retailActive);return "active" end function
