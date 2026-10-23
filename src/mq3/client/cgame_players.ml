// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic native port of code/cgame/cg_players.c. Rendering, collision, audio
// and filesystem calls cross typed boundaries and may be suppressed while the
// retail QVM remains authoritative.
package mq3.client.cgame_players
import mq3.client.cg_local as cgabi
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

const MAX_CLIENTS=64
const MAX_ANIMATIONS=31
const MAX_TOTALANIMATIONS=36
const ANIM_TOGGLEBIT=128
const TEAM_RED=1
const TEAM_BLUE=2
const TEAM_SPECTATOR=3
const GT_TEAM=3
const LEGS_WALKCR=13
const LEGS_WALK=14
const LEGS_RUN=15
const LEGS_BACK=16
const LEGS_LAND=19
const LEGS_LANDB=21
const LEGS_IDLE=22
const LEGS_IDLECR=23
const LEGS_TURN=24
const LEGS_BACKCR=31
const LEGS_BACKWALK=32
const FLAG_RUN=33
const FLAG_STAND=34
const FLAG_STAND2RUN=35
const TORSO_GESTURE=6
const PW_QUAD=1
const PW_BATTLESUIT=2
const PW_HASTE=3
const PW_INVIS=4
const PW_REGEN=5
const PW_FLIGHT=6
const PW_REDFLAG=7
const PW_BLUEFLAG=8
const PW_NEUTRALFLAG=9
const EF_DEAD=1
const EF_AWARD_EXCELLENT=8
const EF_AWARD_GAUNTLET=64
const EF_AWARD_CAP=2048
const EF_TALK=4096
const EF_CONNECTION=8192
const EF_AWARD_IMPRESSIVE=32768
const EF_AWARD_DEFEND=65536
const EF_AWARD_ASSIST=131072
const PAIN_TWITCH_TIME=cgabi.PAIN_TWITCH_TIME

struct Action boundary kind entity name value origin color dispatched end struct
struct Animation firstFrame numFrames loopFrames frameLerp initialLerp reversed flipflop end struct
struct LerpFrame oldFrame frame oldFrameTime frameTime backlerp animationNumber animationTime animation yawAngle yawing pitchAngle pitching end struct
struct ClientInfo infoValid deferred name team modelName skinName headModelName headSkinName redTeam blueTeam color1 color2 footsteps headOffset gender fixedlegs fixedtorso newAnims legsModel torsoModel headModel legsSkin torsoSkin headSkin modelIcon sounds animations score powerups breathPuffTime end struct
struct Entity number clientNum eFlags powerups legsAnim torsoAnim generic1 origin angles velocity painTime painDirection trailTime dustTrailTime legs torso flag end struct
struct Trace fraction endpos normal startsolid allsolid surfaceFlags end struct
struct Vertex origin color end struct
struct State time frameTime gametype localClientNum renderingThirdPerson shadows drawFriend noPlayerAnims animSpeed swingSpeed enableBreath enableDust clients files actions end struct

function animation(firstFrame,numFrames,loopFrames,frameLerp,initialLerp,reversed,flipflop) return Animation(firstFrame,numFrames,loopFrames,frameLerp,initialLerp,reversed,flipflop) end function
function lerpFrame() return LerpFrame(0,0,0,0,0.0,0,0,void,0.0,false,0.0,false) end function
function clientInfo() return ClientInfo(false,false,"",0,"sarge","default","sarge","default","","",[1.0,1.0,1.0],[1.0,1.0,1.0],0,[0.0,0.0,0.0],0,false,false,false,"","","","","","","",array(13,""),[],0,0,0) end function
function entity(number,clientNum) return Entity(number,clientNum,0,0,LEGS_IDLE,11,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0,0,lerpFrame(),lerpFrame(),lerpFrame()) end function
function vertex(origin) return Vertex(origin,[255,255,255,255]) end function
function create()
  clients=[];for i=0 to MAX_CLIENTS-1 clients=clients+[clientInfo()] end for
  return State(0,0,0,0,false,1,true,false,1,0.3,false,false,clients,[],[])
end function
function effect(state,boundary,kind,entityNum,name,value,origin,color,retailActive) item=Action(boundary,kind,entityNum,name,value,origin,color,not retailActive);state.actions=state.actions+[item];return item end function
function bit(value,index) return (value & (1<<index))!=0 end function
function customSoundNames() return ["*death1.wav","*death2.wav","*death3.wav","*jump1.wav","*pain25_1.wav","*pain50_1.wav","*pain75_1.wav","*pain100_1.wav","*falling1.wav","*gasp.wav","*drown.wav","*fall1.wav","*taunt.wav"] end function

// CG_CustomSound
function customSound(state,clientNum,soundName,retailActive)
  if strings.substr(soundName,0,1)!="*" then effect(state,"audio","register-sound",clientNum,soundName,"",void,void,retailActive);return soundName end if
  if clientNum<0 or clientNum>=MAX_CLIENTS then clientNum=0 end if;names=customSoundNames();for i=0 to len(names)-1 if soundName==names[i] then return state.clients[clientNum].sounds[i] end if end for;return error(7850,"Unknown custom sound: "+soundName)
end function
function tokens(text) effect=[];data=bytes(text);at=0;while at<len(data) while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if;if data[at]==47 and at+1<len(data) and data[at+1]==47 then while at<len(data) and data[at]!=10 at=at+1 end while else start=at;while at<len(data) and data[at]>32 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))] end if end while;return effect end function
// CG_ParseAnimationFile
function parseAnimationFile(filename,text,ci)
  if text==void or len(text)==0 or len(text)>=19999 then return false end if;data=tokens(text);at=0;ci.footsteps=0;ci.headOffset=[0.0,0.0,0.0];ci.gender=0;ci.fixedlegs=false;ci.fixedtorso=false
  while at<len(data) key=strings.toLowerAscii(data[at]);if key=="footsteps" and at+1<len(data) then at=at+1;value=strings.toLowerAscii(data[at]);if value=="boot" then ci.footsteps=1 else if value=="flesh" then ci.footsteps=2 else if value=="mech" then ci.footsteps=3 else if value=="energy" then ci.footsteps=4 else ci.footsteps=0 end if;at=at+1 else if key=="headoffset" and at+3<len(data) then ci.headOffset=[numbers.atof32(data[at+1]),numbers.atof32(data[at+2]),numbers.atof32(data[at+3])];at=at+4 else if key=="sex" and at+1<len(data) then sex=strings.toLowerAscii(data[at+1]);ci.gender=0;if strings.substr(sex,0,1)=="f" then ci.gender=1 else if strings.substr(sex,0,1)=="n" then ci.gender=2 end if;at=at+2 else if key=="fixedlegs" then ci.fixedlegs=true;at=at+1 else if key=="fixedtorso" then ci.fixedtorso=true;at=at+1 else break end if end while
  ci.animations=[];skip=0;for i=0 to MAX_ANIMATIONS-1 if at+3>=len(data) then return false end if;first=atoi(data[at]);count=atoi(data[at+1]);loops=atoi(data[at+2]);fps=numbers.atof32(data[at+3]);at=at+4;if i==LEGS_WALKCR then skip=first-ci.animations[TORSO_GESTURE].firstFrame end if;if i>=LEGS_WALKCR then first=first-skip end if;reversed=count<0;if reversed then count=0-count end if;if fps==0.0 then fps=1.0 end if;millis=n.trunc32(1000.0/fps);ci.animations=ci.animations+[animation(first,count,loops,millis,millis,reversed,false)] end for
  backcr=ci.animations[LEGS_WALKCR];ci.animations=ci.animations+[animation(backcr.firstFrame,backcr.numFrames,backcr.loopFrames,backcr.frameLerp,backcr.initialLerp,true,false)];backwalk=ci.animations[LEGS_WALK];ci.animations=ci.animations+[animation(backwalk.firstFrame,backwalk.numFrames,backwalk.loopFrames,backwalk.frameLerp,backwalk.initialLerp,true,false)];ci.animations=ci.animations+[animation(0,16,16,66,66,false,false),animation(16,5,0,50,50,false,false),animation(16,5,1,66,66,true,false)];return true
end function
// CG_FileExists
function fileExists(state,filename) for each file in state.files if file==filename then return true end if end for;return false end function
function teamSuffix(state,ci) if state.gametype<GT_TEAM then return "default" end if;if ci.team==TEAM_BLUE then return "blue" end if;return "red" end function
// CG_FindClientModelFile
function findClientModelFile(state,ci,teamName,modelName,skinName,base,ext)
  team=teamSuffix(state,ci);for each folder in ["","characters/"] for pass=0 to 1 prefix="";if pass==0 and teamName!="" then prefix=teamName end if;for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+"/"+prefix+leaf;if fileExists(state,path) then return path end if end for;if teamName=="" then break end if end for end for;return void
end function
// CG_FindClientHeadFile
function findClientHeadFile(state,ci,teamName,headModelName,headSkinName,base,ext)
  heads="";model=headModelName;if strings.substr(model,0,1)=="*" then heads="heads/";model=strings.substr(model,1,len(model)-1) end if;team=teamSuffix(state,ci)
  for each folder in [heads,"heads/"] for pass=0 to 1 prefix="";if pass==0 and teamName!="" then prefix=teamName end if;for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="models/players/"+folder+model+"/"+leaf;if fileExists(state,path) then return path end if end for;if teamName=="" then break end if end for end for;return void
end function
// CG_RegisterClientSkin
function registerClientSkin(state,ci,teamName,modelName,skinName,headModelName,headSkinName,retailActive)
  legs=findClientModelFile(state,ci,teamName,modelName,skinName,"lower","skin");torso=findClientModelFile(state,ci,teamName,modelName,skinName,"upper","skin");head=findClientHeadFile(state,ci,teamName,headModelName,headSkinName,"head","skin");if legs==void or torso==void or head==void then return false end if;ci.legsSkin=legs;ci.torsoSkin=torso;ci.headSkin=head;for each path in [legs,torso,head] effect(state,"renderer","register-skin",0,path,"",void,void,retailActive) end for;return true
end function
// CG_RegisterClientModelname
function registerClientModelname(state,ci,modelName,skinName,headModelName,headSkinName,teamName,animationText,retailActive)
  headName=headModelName;if headName=="" then headName=modelName end if;ci.legsModel="models/players/"+modelName+"/lower.md3";ci.torsoModel="models/players/"+modelName+"/upper.md3";if strings.substr(headName,0,1)=="*" then bare=strings.substr(headName,1,len(headName)-1);ci.headModel="models/players/heads/"+bare+"/"+bare+".md3" else ci.headModel="models/players/"+headName+"/head.md3" end if;for each path in [ci.legsModel,ci.torsoModel,ci.headModel] effect(state,"renderer","register-model",0,path,"",void,void,retailActive) end for;if not registerClientSkin(state,ci,teamName,modelName,skinName,headName,headSkinName,retailActive) then return false end if;if not parseAnimationFile("models/players/"+modelName+"/animation.cfg",animationText,ci) then return false end if;icon=findClientHeadFile(state,ci,teamName,headName,headSkinName,"icon","skin");if icon==void then icon=findClientHeadFile(state,ci,teamName,headName,headSkinName,"icon","tga") end if;if icon==void then return false end if;ci.modelIcon=icon;effect(state,"renderer","register-shader",0,icon,"",void,void,retailActive);ci.newAnims=true;return true
end function
// CG_ColorFromString
function colorFromString(value) val=atoi(value);if val<1 or val>7 then return [1.0,1.0,1.0] end if;return [toFloat((val>>2)&1),toFloat((val>>1)&1),toFloat(val&1)] end function
// CG_LoadClientInfo
function loadClientInfo(state,ci,animationText,retailActive) ok=registerClientModelname(state,ci,ci.modelName,ci.skinName,ci.headModelName,ci.headSkinName,"",animationText,retailActive);if not ok then ci.modelName="sarge";ci.skinName="default";ci.headModelName="sarge";ci.headSkinName="default" end if;for i=0 to len(customSoundNames())-1 ci.sounds[i]="sound/player/"+ci.modelName+"/"+strings.substr(customSoundNames()[i],1,len(customSoundNames()[i])-1);effect(state,"audio","register-sound",0,ci.sounds[i],"",void,void,retailActive) end for;ci.deferred=false;return ok
end function
// CG_CopyClientInfoModel
function copyClientInfoModel(sourceInfo,targetInfo) targetInfo.footsteps=sourceInfo.footsteps;targetInfo.gender=sourceInfo.gender;targetInfo.headOffset=sourceInfo.headOffset;targetInfo.fixedlegs=sourceInfo.fixedlegs;targetInfo.fixedtorso=sourceInfo.fixedtorso;targetInfo.legsModel=sourceInfo.legsModel;targetInfo.torsoModel=sourceInfo.torsoModel;targetInfo.headModel=sourceInfo.headModel;targetInfo.legsSkin=sourceInfo.legsSkin;targetInfo.torsoSkin=sourceInfo.torsoSkin;targetInfo.headSkin=sourceInfo.headSkin;targetInfo.modelIcon=sourceInfo.modelIcon;targetInfo.animations=sourceInfo.animations;targetInfo.sounds=sourceInfo.sounds;targetInfo.newAnims=sourceInfo.newAnims;return void end function
// CG_ScanForExistingClientInfo
function scanForExistingClientInfo(state,ci) for each existing in state.clients if existing.infoValid and not existing.deferred and existing.modelName==ci.modelName and existing.skinName==ci.skinName and existing.headModelName==ci.headModelName and existing.headSkinName==ci.headSkinName and existing.team==ci.team then copyClientInfoModel(existing,ci);ci.deferred=false;return true end if end for;return false end function
// CG_SetDeferredClientInfo
function setDeferredClientInfo(state,ci) if scanForExistingClientInfo(state,ci) then return false end if;for each existing in state.clients if existing.infoValid and not existing.deferred then copyClientInfoModel(existing,ci);ci.deferred=true;return true end if end for;ci.deferred=false;return false end function
// CG_NewClientInfo
function newClientInfo(state,clientNum,config,animationText,deferPlayers,retailActive)
  if clientNum<0 or clientNum>=MAX_CLIENTS then return false end if;if config=="" then state.clients[clientNum]=clientInfo();return false end if;ci=clientInfo();ci.name=info.value(config,"n");ci.team=atoi(info.value(config,"t"));model=info.value(config,"model");head=info.value(config,"hmodel");slash=strings.indexOf(model,"/",0);ci.modelName=model;ci.skinName="default";if slash>=0 then ci.modelName=strings.substr(model,0,slash);ci.skinName=strings.substr(model,slash+1,len(model)-slash-1) end if;slash=strings.indexOf(head,"/",0);ci.headModelName=head;ci.headSkinName="default";if slash>=0 then ci.headModelName=strings.substr(head,0,slash);ci.headSkinName=strings.substr(head,slash+1,len(head)-slash-1) end if;ci.color1=colorFromString(info.value(config,"c1"));ci.color2=colorFromString(info.value(config,"c2"));ci.infoValid=true;if not scanForExistingClientInfo(state,ci) then if deferPlayers then setDeferredClientInfo(state,ci) else loadClientInfo(state,ci,animationText,retailActive) end if end if;state.clients[clientNum]=ci;return true
end function
// CG_LoadDeferredPlayers
function loadDeferredPlayers(state,animationText,lowMemory,retailActive) loaded=0;for each ci in state.clients if ci.infoValid and ci.deferred then if lowMemory then ci.deferred=false else loadClientInfo(state,ci,animationText,retailActive);loaded=loaded+1 end if end if end for;return loaded end function

// CG_SetLerpFrameAnimation
function setLerpFrameAnimation(ci,lf,newAnimation) lf.animationNumber=newAnimation;index=newAnimation & ~ANIM_TOGGLEBIT;if index<0 or index>=len(ci.animations) then return error(7851,"Bad animation number: "+str(index)) end if;lf.animation=ci.animations[index];lf.animationTime=lf.frameTime+lf.animation.initialLerp;return index end function
// CG_RunLerpFrame
function runLerpFrame(state,ci,lf,newAnimation,speedScale)
  if state.animSpeed==0 then lf.oldFrame=0;lf.frame=0;lf.backlerp=0.0;return 0 end if;if newAnimation!=lf.animationNumber or lf.animation==void then setLerpFrameAnimation(ci,lf,newAnimation) end if;if state.time>=lf.frameTime then lf.oldFrame=lf.frame;lf.oldFrameTime=lf.frameTime;anim=lf.animation;if anim.frameLerp==0 then return lf.frame end if;if state.time<lf.animationTime then lf.frameTime=lf.animationTime else lf.frameTime=lf.oldFrameTime+anim.frameLerp end if;f=n.trunc32((lf.frameTime-lf.animationTime)/anim.frameLerp*speedScale);frames=anim.numFrames;if anim.flipflop then frames=frames*2 end if;if f>=frames then f=f-frames;if anim.loopFrames>0 then f=(f%anim.loopFrames)+anim.numFrames-anim.loopFrames else f=frames-1;lf.frameTime=state.time end if end if;if anim.reversed then lf.frame=anim.firstFrame+anim.numFrames-1-f else if anim.flipflop and f>=anim.numFrames then lf.frame=anim.firstFrame+anim.numFrames-1-(f%anim.numFrames) else lf.frame=anim.firstFrame+f end if;if state.time>lf.frameTime then lf.frameTime=state.time end if end if;if lf.frameTime>state.time+200 then lf.frameTime=state.time end if;if lf.oldFrameTime>state.time then lf.oldFrameTime=state.time end if;if lf.frameTime==lf.oldFrameTime then lf.backlerp=0.0 else lf.backlerp=1.0-(state.time-lf.oldFrameTime)/(lf.frameTime-lf.oldFrameTime) end if;return lf.frame
end function
// CG_ClearLerpFrame
function clearLerpFrame(state,ci,lf,animationNumber) lf.frameTime=state.time;lf.oldFrameTime=state.time;setLerpFrameAnimation(ci,lf,animationNumber);lf.oldFrame=lf.animation.firstFrame;lf.frame=lf.animation.firstFrame;return void end function
// CG_PlayerAnimation
function playerAnimation(state,cent) if state.noPlayerAnims then return [0,0,0.0,0,0,0.0] end if;scale=1.0;if bit(cent.powerups,PW_HASTE) then scale=1.5 end if;ci=state.clients[cent.clientNum];legsAnim=cent.legsAnim;if cent.legs.yawing and (legsAnim & ~ANIM_TOGGLEBIT)==LEGS_IDLE then legsAnim=LEGS_TURN end if;runLerpFrame(state,ci,cent.legs,legsAnim,scale);runLerpFrame(state,ci,cent.torso,cent.torsoAnim,scale);return [cent.legs.oldFrame,cent.legs.frame,cent.legs.backlerp,cent.torso.oldFrame,cent.torso.frame,cent.torso.backlerp] end function
function angleMod(value) return (360.0/65536.0)*toFloat(n.trunc32(value*(65536.0/360.0))&65535) end function
function angleSubtract(a,b) effect=a-b;while effect>180.0 effect=effect-360.0 end while;while effect<-180.0 effect=effect+360.0 end while;return effect end function
function absolute(value) if value<0 then return 0-value end if;return value end function
// CG_SwingAngles
function swingAngles(frameTime,destination,swingTolerance,clampTolerance,speed,angle,swinging) if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=true end if;if not swinging then return [angle,false] end if;swing=angleSubtract(destination,angle);scale=2.0;if absolute(swing)<swingTolerance*0.5 then scale=0.5 else if absolute(swing)<swingTolerance then scale=1.0 end if;move=frameTime*scale*speed;if swing<0 then move=0.0-move end if;if (swing>=0 and move>=swing) or (swing<0 and move<=swing) then move=swing;swinging=false end if;angle=angleMod(angle+move);remaining=angleSubtract(destination,angle);if remaining>clampTolerance then angle=angleMod(destination-(clampTolerance-1)) else if remaining<0.0-clampTolerance then angle=angleMod(destination+(clampTolerance-1)) end if;return [angle,swinging] end function
// CG_AddPainTwitch
function addPainTwitch(state,cent,torsoAngles) elapsed=state.time-cent.painTime;if elapsed>=PAIN_TWITCH_TIME then return torsoAngles end if;amount=20.0*(1.0-elapsed/PAIN_TWITCH_TIME);if cent.painDirection!=0 then torsoAngles[2]=torsoAngles[2]+amount else torsoAngles[2]=torsoAngles[2]-amount end if;return torsoAngles end function
// CG_PlayerAngles
function playerAngles(state,cent) offsets=[0,22,45,-22,0,22,-45,-22];direction=0;if (cent.eFlags & EF_DEAD)==0 then direction=n.trunc32(cent.angles[1]);if direction<0 or direction>7 then return error(7852,"Bad player movement angle") end if end if;head=[cent.angles[0],angleMod(cent.angles[1]),cent.angles[2]];legs=[0.0,head[1]+offsets[direction],0.0];torso=[head[0]*0.75,head[1]+0.25*offsets[direction],0.0];torso=addPainTwitch(state,cent,torso);return [legs,torso,head] end function
// CG_HasteTrail
function hasteTrail(state,cent,retailActive) anim=cent.legs.animationNumber & ~ANIM_TOGGLEBIT;if cent.trailTime>state.time or (anim!=LEGS_RUN and anim!=LEGS_BACK) then return false end if;cent.trailTime=cent.trailTime+100;if cent.trailTime<state.time then cent.trailTime=state.time end if;origin=[cent.origin[0],cent.origin[1],cent.origin[2]-16.0];effect(state,"scene","smoke-puff",cent.number,"haste",500,origin,[1.0,1.0,1.0,1.0],retailActive);return true end function
// CG_BreathPuffs
function breathPuffs(state,cent,headOrigin,contents,retailActive) ci=state.clients[cent.clientNum];if not state.enableBreath or (cent.number==state.localClientNum and not state.renderingThirdPerson) or (cent.eFlags & EF_DEAD)!=0 or (contents & 56)!=0 or ci.breathPuffTime>state.time then return false end if;ci.breathPuffTime=state.time+2000;effect(state,"scene","smoke-puff",cent.number,"breath",1500,headOrigin,[1.0,1.0,1.0,0.66],retailActive);return true end function
// CG_DustTrail
function dustTrail(state,cent,trace,retailActive) anim=cent.legs.animationNumber & ~ANIM_TOGGLEBIT;if not state.enableDust or cent.dustTrailTime>state.time or (anim!=LEGS_LANDB and anim!=LEGS_LAND) or (trace.surfaceFlags & 0x40000)==0 then return false end if;cent.dustTrailTime=state.time+40;effect(state,"scene","smoke-puff",cent.number,"dust",500,[cent.origin[0],cent.origin[1],cent.origin[2]-16.0],[0.8,0.8,0.7,0.33],retailActive);return true end function
// CG_TrailItem
function trailItem(state,cent,model,retailActive) effect(state,"scene","trail-item",cent.number,model,"tag_back",[cent.origin[0],cent.origin[1],cent.origin[2]+16.0],void,retailActive);return void end function
// CG_PlayerFlag
function playerFlag(state,cent,skin,retailActive) anim=FLAG_RUN;legs=cent.legsAnim & ~ANIM_TOGGLEBIT;if legs==LEGS_IDLE or legs==LEGS_IDLECR or legs==LEGS_WALK or legs==LEGS_WALKCR then anim=FLAG_STAND end if;runLerpFrame(state,state.clients[cent.clientNum],cent.flag,anim,1.0);effect(state,"scene","tagged-model",cent.number,"flag-pole","tag_flag",cent.origin,void,retailActive);effect(state,"scene","tagged-model",cent.number,"flag-flap",skin,cent.origin,void,retailActive);return void end function
// CG_PlayerTokens
function playerTokens(state,cent,retailActive) count=cent.generic1;if count>16 then count=16 end if;for i=0 to count-1 effect(state,"scene","token",cent.number,"skull",str(i),[cent.origin[0],cent.origin[1],cent.origin[2]+10.0],void,retailActive) end for;return count end function
// CG_PlayerPowerups
function playerPowerups(state,cent,retailActive) if cent.powerups==0 then return 0 end if;if bit(cent.powerups,PW_QUAD) then effect(state,"renderer","light",cent.number,"quad",200,cent.origin,[0.2,0.2,1.0],retailActive) end if;if bit(cent.powerups,PW_FLIGHT) then effect(state,"audio","loop",cent.number,"flight","",cent.origin,void,retailActive) end if;for each flag in [[PW_REDFLAG,"red"],[PW_BLUEFLAG,"blue"],[PW_NEUTRALFLAG,"neutral"]] if bit(cent.powerups,flag[0]) then if state.clients[cent.clientNum].newAnims then playerFlag(state,cent,flag[1],retailActive) else trailItem(state,cent,flag[1]+"-flag",retailActive) end if;effect(state,"renderer","light",cent.number,flag[1],200,cent.origin,void,retailActive) end if end for;if bit(cent.powerups,PW_HASTE) then hasteTrail(state,cent,retailActive) end if;return len(state.actions) end function
// CG_PlayerFloatSprite
function playerFloatSprite(state,cent,shader,retailActive) effect(state,"scene","sprite",cent.number,shader,10,[cent.origin[0],cent.origin[1],cent.origin[2]+48.0],[1.0,1.0,1.0,1.0],retailActive);return true end function
// CG_PlayerSprites
function playerSprites(state,cent,localTeam,retailActive) choices=[[EF_CONNECTION,"connection"],[EF_TALK,"balloon"],[EF_AWARD_IMPRESSIVE,"medal-impressive"],[EF_AWARD_EXCELLENT,"medal-excellent"],[EF_AWARD_GAUNTLET,"medal-gauntlet"],[EF_AWARD_DEFEND,"medal-defend"],[EF_AWARD_ASSIST,"medal-assist"],[EF_AWARD_CAP,"medal-capture"]];for each choice in choices if (cent.eFlags & choice[0])!=0 then return playerFloatSprite(state,cent,choice[1],retailActive) end if end for;if (cent.eFlags & EF_DEAD)==0 and state.gametype>=GT_TEAM and state.clients[cent.clientNum].team==localTeam and state.drawFriend then return playerFloatSprite(state,cent,"friend",retailActive) end if;return false end function
// CG_PlayerShadow
function playerShadow(state,cent,trace,retailActive) if state.shadows==0 or bit(cent.powerups,PW_INVIS) or trace.fraction==1.0 or trace.startsolid or trace.allsolid then return void end if;plane=trace.endpos[2]+1.0;if state.shadows==1 then effect(state,"scene","impact-mark",cent.number,"shadow",1.0-trace.fraction,trace.endpos,[1.0-trace.fraction,1.0-trace.fraction,1.0-trace.fraction,1.0],retailActive) end if;return plane end function
// CG_PlayerSplash
function playerSplash(state,cent,feetContents,headContents,trace,retailActive) if state.shadows==0 or (feetContents&56)==0 or (headContents&57)!=0 or trace.fraction==1.0 then return false end if;effect(state,"scene","wake-poly",cent.number,"wake",4,trace.endpos,[1.0,1.0,1.0,1.0],retailActive);return true end function
// CG_AddRefEntityWithPowerups
function addRefEntityWithPowerups(state,cent,team,part,retailActive) if bit(cent.powerups,PW_INVIS) then effect(state,"scene","model",cent.number,part,"invis",cent.origin,void,retailActive);return 1 end if;count=1;effect(state,"scene","model",cent.number,part,"base",cent.origin,void,retailActive);if bit(cent.powerups,PW_QUAD) then shader="quad";if team==TEAM_RED then shader="red-quad" end if;effect(state,"scene","model",cent.number,part,shader,cent.origin,void,retailActive);count=count+1 end if;if bit(cent.powerups,PW_REGEN) and ((state.time/100)%10)==1 then effect(state,"scene","model",cent.number,part,"regen",cent.origin,void,retailActive);count=count+1 end if;if bit(cent.powerups,PW_BATTLESUIT) then effect(state,"scene","model",cent.number,part,"battlesuit",cent.origin,void,retailActive);count=count+1 end if;return count end function
// CG_LightVerts
function lightVerts(normal,vertices,ambient,directed,lightDir) incoming=normal[0]*lightDir[0]+normal[1]*lightDir[1]+normal[2]*lightDir[2];for each vertex in vertices color=[];for i=0 to 2 value=ambient[i];if incoming>0 then value=value+incoming*directed[i] end if;if value>255 then value=255 end if;color=color+[n.trunc32(value)] end for;vertex.color=color+[255] end for;return true end function
// CG_Player
function player(state,cent,localTeam,shadowTrace,feetContents,headContents,splashTrace,retailActive) if cent.clientNum<0 or cent.clientNum>=MAX_CLIENTS then return error(7853,"Bad clientNum on player entity") end if;ci=state.clients[cent.clientNum];if not ci.infoValid then return false end if;state.actions=[];playerSprites(state,cent,localTeam,retailActive);shadow=playerShadow(state,cent,shadowTrace,retailActive);playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive);frames=playerAnimation(state,cent);playerAngles(state,cent);for each part in ["legs","torso","head"] addRefEntityWithPowerups(state,cent,ci.team,part,retailActive) end for;effect(state,"scene","tag-attach",cent.number,"torso","tag_torso",cent.origin,void,retailActive);effect(state,"scene","tag-attach",cent.number,"head","tag_head",cent.origin,void,retailActive);playerPowerups(state,cent,retailActive);return true end function
// CG_ResetPlayerEntity
function resetPlayerEntity(state,cent) cent.legs=lerpFrame();cent.torso=lerpFrame();cent.flag=lerpFrame();clearLerpFrame(state,state.clients[cent.clientNum],cent.legs,cent.legsAnim);clearLerpFrame(state,state.clients[cent.clientNum],cent.torso,cent.torsoAnim);cent.trailTime=state.time;return void end function
