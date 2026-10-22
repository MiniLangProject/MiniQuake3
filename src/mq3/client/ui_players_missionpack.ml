// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native, renderer-neutral port of code/ui/ui_players.c.
package mq3.client.ui_players_missionpack

import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.compat.transcendental as crt
import mq3.shared.math as q
import mq3.shared.parser as parser
import std.string as strings

extern function tan(value as double) from "ucrtbase.dll" returns double

const UI_TIMER_GESTURE=2300
const UI_TIMER_JUMP=1000
const UI_TIMER_LAND=130
const UI_TIMER_WEAPON_SWITCH=300
const UI_TIMER_ATTACK=500
const UI_TIMER_MUZZLE_FLASH=20
const UI_TIMER_WEAPON_DELAY=250
const JUMP_HEIGHT=56
const ANIM_TOGGLEBIT=128
const MAX_ANIMATIONS=31
const BOTH_DEATH1=0
const TORSO_GESTURE=6
const TORSO_ATTACK=7
const TORSO_ATTACK2=8
const TORSO_DROP=9
const TORSO_RAISE=10
const TORSO_STAND=11
const TORSO_STAND2=12
const LEGS_WALKCR=13
const LEGS_JUMP=18
const LEGS_LAND=19
const LEGS_IDLE=22
const LEGS_TURN=24
const TORSO_GETFLAG=25
const WP_NONE=0
const WP_GAUNTLET=1
const WP_MACHINEGUN=2
const WP_SHOTGUN=3
const WP_GRENADE_LAUNCHER=4
const WP_ROCKET_LAUNCHER=5
const WP_LIGHTNING=6
const WP_RAILGUN=7
const WP_PLASMAGUN=8
const WP_BFG=9
const WP_GRAPPLING_HOOK=10

struct Action boundary kind name detail number vector dispatched end struct
struct Animation firstFrame numFrames loopFrames frameLerp initialLerp end struct
struct LerpFrame oldFrame oldFrameTime frame frameTime backlerp yawAngle yawing pitchAngle pitching animationNumber animation animationTime end struct
struct AssetSource files animationFiles actions retailActive diagnostics end struct
struct Orientation origin axis found end struct
struct RenderEntity kind origin axis oldframe frame backlerp model skin shader radius renderfx tag end struct
struct PlayerInfo legsModel legsSkin legs torsoModel torsoSkin torso headModel headSkin animations weaponModel barrelModel flashModel flashDlightColor muzzleFlashTime viewAngles moveAngles currentWeapon legsAnim torsoAnim weapon lastWeapon pendingWeapon weaponTimer pendingLegsAnim torsoAnimationTimer pendingTorsoAnim legsAnimationTimer chat newModel barrelSpinning barrelAngle barrelTime realWeapon jumpHeight realtime actions end struct

function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function lerpFrame() return LerpFrame(0,0,0,0,0.0,0.0,false,0.0,false,-1,void,0) end function
function assetSource(files,animationFiles,retailActive) return AssetSource(files,animationFiles,[],retailActive,[]) end function
function create() return PlayerInfo("","",lerpFrame(),"","",lerpFrame(),"","",[],"","","",[1.0,1.0,1.0],0,[0.0,0.0,0.0],[0.0,0.0,0.0],WP_NONE,0,0,WP_NONE,WP_NONE,-1,0,0,0,0,0,false,false,false,0.0,0,WP_NONE,0.0,0,[]) end function
function emit(list,boundary,kind,name,detail,number,vector,retailActive) return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)] end function
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
function exists(source,path) for each name in source.files if same(name,path) then return true end if end for;return false end function
function animationText(source,path) for each pair in source.animationFiles if same(pair[0],path) then return pair[1] end if end for;return void end function
function register(source,kind,path) if not exists(source,path) then return "" end if;source.actions=emit(source.actions,"renderer","register-"+kind,path,"",0,void,source.retailActive);return path end function
function matrixMultiply(a,b) result=[[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]];for i=0 to 2 for j=0 to 2 result[i][j]=a[i][0]*b[0][j]+a[i][1]*b[1][j]+a[i][2]*b[2][j] end for end for;return result end function
function angleSubtract(a,b) value=a-b;while value>180.0 value=value-360.0 end while;while value<-180.0 value=value+360.0 end while;return value end function
function absolute(value) if value<0 then return 0-value end if;return value end function

function weaponPath(weapon)
  names=["","models/weapons2/gauntlet/gauntlet.md3","models/weapons2/machinegun/machinegun.md3","models/weapons2/shotgun/shotgun.md3","models/weapons2/grenadel/grenadel.md3","models/weapons2/rocketl/rocketl.md3","models/weapons2/lightning/lightning.md3","models/weapons2/railgun/railgun.md3","models/weapons2/plasma/plasma.md3","models/weapons2/bfg/bfg.md3","models/weapons2/grapple/grapple.md3"];if weapon<0 or weapon>=len(names) then return "" end if;return names[weapon]
end function
function stripMd3(path) if len(path)>=4 and strings.equalsIgnoreCaseAscii(strings.substr(path,len(path)-4,4),".md3") then return strings.substr(path,0,len(path)-4) end if;return path end function
function flashColor(weapon) if weapon==WP_GAUNTLET or weapon==WP_LIGHTNING or weapon==WP_PLASMAGUN or weapon==WP_GRAPPLING_HOOK then return [0.6,0.6,1.0] end if;if weapon==WP_GRENADE_LAUNCHER then return [1.0,0.7,0.5] end if;if weapon==WP_ROCKET_LAUNCHER then return [1.0,0.75,0.0] end if;if weapon==WP_RAILGUN then return [1.0,0.5,0.0] end if;if weapon==WP_BFG then return [1.0,0.7,1.0] end if;if weapon==WP_MACHINEGUN or weapon==WP_SHOTGUN then return [1.0,1.0,0.0] end if;return [1.0,1.0,1.0] end function

// UI_PlayerInfo_SetWeapon
function UI_PlayerInfo_SetWeapon(source,pi,weaponNum)
  pi.currentWeapon=weaponNum;attempt=weaponNum;path=""
  while true
    pi.realWeapon=attempt;pi.weaponModel="";pi.barrelModel="";pi.flashModel="";if attempt==WP_NONE then return pi end if
    path=weaponPath(attempt);if path!="" then pi.weaponModel=register(source,"model",path) end if
    if pi.weaponModel!="" then break end if;if attempt==WP_MACHINEGUN then attempt=WP_NONE else attempt=WP_MACHINEGUN end if
  end while
  base=stripMd3(path);if attempt==WP_MACHINEGUN or attempt==WP_GAUNTLET or attempt==WP_BFG then pi.barrelModel=register(source,"model",base+"_barrel.md3") end if;pi.flashModel=register(source,"model",base+"_flash.md3");pi.flashDlightColor=flashColor(attempt);return pi
end function
// UI_ForceLegsAnim
function UI_ForceLegsAnim(pi,anim) pi.legsAnim=((pi.legsAnim&ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)|anim;if anim==LEGS_JUMP then pi.legsAnimationTimer=UI_TIMER_JUMP end if;return void end function
// UI_SetLegsAnim
function UI_SetLegsAnim(pi,anim) if pi.pendingLegsAnim!=0 then anim=pi.pendingLegsAnim;pi.pendingLegsAnim=0 end if;return UI_ForceLegsAnim(pi,anim) end function
// UI_ForceTorsoAnim
function UI_ForceTorsoAnim(pi,anim) pi.torsoAnim=((pi.torsoAnim&ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)|anim;if anim==TORSO_GESTURE then pi.torsoAnimationTimer=UI_TIMER_GESTURE end if;if anim==TORSO_ATTACK or anim==TORSO_ATTACK2 then pi.torsoAnimationTimer=UI_TIMER_ATTACK end if;return void end function
// UI_SetTorsoAnim
function UI_SetTorsoAnim(pi,anim) if pi.pendingTorsoAnim!=0 then anim=pi.pendingTorsoAnim;pi.pendingTorsoAnim=0 end if;return UI_ForceTorsoAnim(pi,anim) end function
// UI_TorsoSequencing
function UI_TorsoSequencing(source,pi)
  current=pi.torsoAnim&(~ANIM_TOGGLEBIT);if pi.weapon!=pi.currentWeapon and current!=TORSO_DROP then pi.torsoAnimationTimer=UI_TIMER_WEAPON_SWITCH;UI_ForceTorsoAnim(pi,TORSO_DROP) end if;if pi.torsoAnimationTimer>0 then return void end if
  if current==TORSO_GESTURE or current==TORSO_ATTACK or current==TORSO_ATTACK2 then UI_SetTorsoAnim(pi,TORSO_STAND);return void end if
  if current==TORSO_DROP then UI_PlayerInfo_SetWeapon(source,pi,pi.weapon);pi.torsoAnimationTimer=UI_TIMER_WEAPON_SWITCH;UI_ForceTorsoAnim(pi,TORSO_RAISE);return void end if;if current==TORSO_RAISE then UI_SetTorsoAnim(pi,TORSO_STAND) end if
end function
// UI_LegsSequencing
function UI_LegsSequencing(pi)
  current=pi.legsAnim&(~ANIM_TOGGLEBIT);if pi.legsAnimationTimer>0 then if current==LEGS_JUMP then pi.jumpHeight=JUMP_HEIGHT*crt.sin(3.14159265358979323846*(UI_TIMER_JUMP-pi.legsAnimationTimer)/UI_TIMER_JUMP) end if;return void end if;if current==LEGS_JUMP then UI_ForceLegsAnim(pi,LEGS_LAND);pi.legsAnimationTimer=UI_TIMER_LAND;pi.jumpHeight=0.0;return void end if;if current==LEGS_LAND then UI_SetLegsAnim(pi,LEGS_IDLE) end if
end function
// UI_PositionEntityOnTag
function UI_PositionEntityOnTag(entity,parent,orientation) if not orientation.found then return void end if;entity.origin=[parent.origin[0],parent.origin[1],parent.origin[2]];for i=0 to 2 entity.origin=q.VectorMA(entity.origin,orientation.origin[i],parent.axis[i]) end for;entity.axis=matrixMultiply(orientation.axis,parent.axis);entity.backlerp=parent.backlerp;return entity end function
// UI_PositionRotatedEntityOnTag
function UI_PositionRotatedEntityOnTag(entity,parent,orientation) if not orientation.found then return void end if;entity.origin=[parent.origin[0],parent.origin[1],parent.origin[2]];for i=0 to 2 entity.origin=q.VectorMA(entity.origin,orientation.origin[i],parent.axis[i]) end for;entity.axis=matrixMultiply(matrixMultiply(entity.axis,orientation.axis),parent.axis);return entity end function
// UI_SetLerpFrameAnimation
function UI_SetLerpFrameAnimation(pi,lf,newAnimation) lf.animationNumber=newAnimation;index=newAnimation&(~ANIM_TOGGLEBIT);if index<0 or index>=MAX_ANIMATIONS or index>=len(pi.animations) then return error(7980,"Bad animation number: "+str(index)) end if;lf.animation=pi.animations[index];lf.animationTime=lf.frameTime+lf.animation.initialLerp;return index end function
// UI_RunLerpFrame
function UI_RunLerpFrame(pi,lf,newAnimation,realtime)
  if newAnimation!=lf.animationNumber or lf.animation==void then selected=UI_SetLerpFrameAnimation(pi,lf,newAnimation);if selected is error then return selected end if end if
  if realtime>=lf.frameTime then lf.oldFrame=lf.frame;lf.oldFrameTime=lf.frameTime;anim=lf.animation;if realtime<lf.animationTime then lf.frameTime=lf.animationTime else lf.frameTime=lf.oldFrameTime+anim.frameLerp end if;f=n.trunc32((lf.frameTime-lf.animationTime)/anim.frameLerp);if f>=anim.numFrames then f=f-anim.numFrames;if anim.loopFrames!=0 then f=(f%anim.loopFrames)+anim.numFrames-anim.loopFrames else f=anim.numFrames-1;lf.frameTime=realtime end if end if;lf.frame=anim.firstFrame+f;if realtime>lf.frameTime then lf.frameTime=realtime end if end if
  if lf.frameTime>realtime+200 then lf.frameTime=realtime end if;if lf.oldFrameTime>realtime then lf.oldFrameTime=realtime end if;if lf.frameTime==lf.oldFrameTime then lf.backlerp=0.0 else lf.backlerp=1.0-(realtime-lf.oldFrameTime)/(lf.frameTime-lf.oldFrameTime) end if;return lf.frame
end function
// UI_PlayerAnimation
function UI_PlayerAnimation(source,pi,frametime,realtime) pi.legsAnimationTimer=pi.legsAnimationTimer-frametime;if pi.legsAnimationTimer<0 then pi.legsAnimationTimer=0 end if;UI_LegsSequencing(pi);legsAnim=pi.legsAnim;if pi.legs.yawing and (legsAnim&(~ANIM_TOGGLEBIT))==LEGS_IDLE then legsAnim=LEGS_TURN end if;UI_RunLerpFrame(pi,pi.legs,legsAnim,realtime);pi.torsoAnimationTimer=pi.torsoAnimationTimer-frametime;if pi.torsoAnimationTimer<0 then pi.torsoAnimationTimer=0 end if;UI_TorsoSequencing(source,pi);UI_RunLerpFrame(pi,pi.torso,pi.torsoAnim,realtime);return [pi.legs.oldFrame,pi.legs.frame,pi.legs.backlerp,pi.torso.oldFrame,pi.torso.frame,pi.torso.backlerp] end function
// UI_SwingAngles
function UI_SwingAngles(destination,swingTolerance,clampTolerance,speed,angle,swinging,frametime)
  if not swinging then swing=angleSubtract(angle,destination);if swing>swingTolerance or swing<0-swingTolerance then swinging=true end if end if;if not swinging then return [angle,swinging] end if;swing=angleSubtract(destination,angle);scale=2.0;if absolute(swing)<swingTolerance*0.5 then scale=0.5 else if absolute(swing)<swingTolerance then scale=1.0 end if
  if swing>=0 then move=frametime*scale*speed;if move>=swing then move=swing;swinging=false end if;angle=q.AngleNormalize360(angle+move) else move=frametime*scale*(0-speed);if move<=swing then move=swing;swinging=false end if;angle=q.AngleNormalize360(angle+move) end if;swing=angleSubtract(destination,angle);if swing>clampTolerance then angle=q.AngleNormalize360(destination-(clampTolerance-1)) else if swing<0-clampTolerance then angle=q.AngleNormalize360(destination+(clampTolerance-1)) end if;return [angle,swinging]
end function
// UI_MovedirAdjustment
function UI_MovedirAdjustment(pi) relative=[pi.viewAngles[0]-pi.moveAngles[0],pi.viewAngles[1]-pi.moveAngles[1],pi.viewAngles[2]-pi.moveAngles[2]];move=q.AngleVectors(relative)[0];if absolute(move[0])<0.01 then move[0]=0.0 end if;if absolute(move[1])<0.01 then move[1]=0.0 end if;if move[1]==0 and move[0]>0 then return 0.0 end if;if move[1]<0 and move[0]>0 then return 22.0 end if;if move[1]<0 and move[0]==0 then return 45.0 end if;if move[1]<0 and move[0]<0 then return -22.0 end if;if move[1]==0 and move[0]<0 then return 0.0 end if;if move[1]>0 and move[0]<0 then return 22.0 end if;if move[1]>0 and move[0]==0 then return -45.0 end if;return -22.0 end function
// UI_PlayerAngles
function UI_PlayerAngles(pi,frametime)
  head=[pi.viewAngles[0],q.AngleNormalize360(pi.viewAngles[1]),pi.viewAngles[2]];legs=[0.0,0.0,0.0];torso=[0.0,0.0,0.0];if (pi.legsAnim&(~ANIM_TOGGLEBIT))!=LEGS_IDLE or (pi.torsoAnim&(~ANIM_TOGGLEBIT))!=TORSO_STAND then pi.torso.yawing=true;pi.torso.pitching=true;pi.legs.yawing=true end if;adjust=UI_MovedirAdjustment(pi);legs[1]=head[1]+adjust;torso[1]=head[1]+0.25*adjust
  swung=UI_SwingAngles(torso[1],25.0,90.0,0.3,pi.torso.yawAngle,pi.torso.yawing,frametime);pi.torso.yawAngle=swung[0];pi.torso.yawing=swung[1];swung=UI_SwingAngles(legs[1],40.0,90.0,0.3,pi.legs.yawAngle,pi.legs.yawing,frametime);pi.legs.yawAngle=swung[0];pi.legs.yawing=swung[1];torso[1]=pi.torso.yawAngle;legs[1]=pi.legs.yawAngle;dest=head[0]*0.75;if head[0]>180 then dest=(-360+head[0])*0.75 end if;swung=UI_SwingAngles(dest,15.0,30.0,0.1,pi.torso.pitchAngle,pi.torso.pitching,frametime);pi.torso.pitchAngle=swung[0];pi.torso.pitching=swung[1];torso[0]=pi.torso.pitchAngle;for i=0 to 2 head[i]=head[i]-torso[i];torso[i]=torso[i]-legs[i] end for;return [q.AngleVectors(legs),q.AngleVectors(torso),q.AngleVectors(head)]
end function
// UI_PlayerFloatSprite
function UI_PlayerFloatSprite(pi,origin,shader,retailActive) at=[origin[0],origin[1],origin[2]+48.0];pi.actions=emit(pi.actions,"scene","sprite",shader,"chat",10,at,retailActive);return pi.actions[len(pi.actions)-1] end function
// UI_MachinegunSpinAngle
function UI_MachinegunSpinAngle(pi,realtime)
  delta=realtime-pi.barrelTime;angle=0.0
  if pi.barrelSpinning then
    angle=pi.barrelAngle+delta*0.9
  else
    if delta>1000 then delta=1000 end if
    speed=0.5*(0.9+(1000-delta)/1000.0);angle=pi.barrelAngle+delta*speed
  end if
  torso=pi.torsoAnim&(~ANIM_TOGGLEBIT);if torso==TORSO_ATTACK2 then torso=TORSO_ATTACK end if;spinning=torso==TORSO_ATTACK;if pi.barrelSpinning!=spinning then pi.barrelTime=realtime;pi.barrelAngle=q.AngleNormalize360(angle);pi.barrelSpinning=spinning end if;return angle
end function

function renderEntity(kind,model,skin,tag) return RenderEntity(kind,[0.0,0.0,0.0],identityAxis(),0,0,0.0,model,skin,"",0.0,0,tag) end function
// UI_DrawPlayer
function UI_DrawPlayer(source,x,y,w,h,pi,time,frametime,retailActive)
  if pi.legsModel=="" or pi.torsoModel=="" or pi.headModel=="" or len(pi.animations)==0 or pi.animations[0].numFrames==0 then return [] end if
  // Team Arena deliberately accepts a zero-sized preview as a model-cache call.
  if w==0 or h==0 then return [] end if;pi.realtime=time
  if pi.pendingWeapon!=-1 and time>pi.weaponTimer then pi.weapon=pi.pendingWeapon;pi.lastWeapon=pi.pendingWeapon;pi.pendingWeapon=-1;pi.weaponTimer=0;if pi.currentWeapon!=pi.weapon then pi.actions=emit(pi.actions,"audio","play-local","sound/weapons/change.wav","",0,void,retailActive) end if end if
  axes=UI_PlayerAngles(pi,frametime);frames=UI_PlayerAnimation(source,pi,frametime,time);fovx=n.trunc32(w/640.0*90.0);xx=w/tan(fovx/360.0*3.14159265358979323846);fovy=crt.atan2(h,xx)*(360.0/3.14159265358979323846);origin=[39.2/tan(fovx*3.14159265358979323846/360.0),0.0,-4.0]
  pi.actions=emit(pi.actions,"renderer","clear-scene","","",time,[x,y-pi.jumpHeight,w,h],retailActive);parts=[["legs",pi.legsModel,pi.legsSkin,frames[0],frames[1],frames[2]],["torso",pi.torsoModel,pi.torsoSkin,frames[3],frames[4],frames[5]],["head",pi.headModel,pi.headSkin,0,0,0.0]];for each part in parts pi.actions=emit(pi.actions,"scene","player-part",part[1],part[0],part[4],[origin[0],origin[1],origin[2]],retailActive) end for
  if pi.currentWeapon!=WP_NONE and pi.weaponModel!="" then pi.actions=emit(pi.actions,"scene","tagged-model",pi.weaponModel,"tag_weapon",pi.currentWeapon,origin,retailActive) end if;if pi.barrelModel!="" and (pi.realWeapon==WP_MACHINEGUN or pi.realWeapon==WP_GAUNTLET or pi.realWeapon==WP_BFG) then spin=UI_MachinegunSpinAngle(pi,time);pi.actions=emit(pi.actions,"scene","tagged-model",pi.barrelModel,"tag_barrel",n.trunc32(spin),origin,retailActive) end if
  if time<=pi.muzzleFlashTime then if pi.flashModel!="" then pi.actions=emit(pi.actions,"scene","tagged-model",pi.flashModel,"tag_flash",0,origin,retailActive) end if;if pi.flashDlightColor[0]!=0 or pi.flashDlightColor[1]!=0 or pi.flashDlightColor[2]!=0 then pi.actions=emit(pi.actions,"scene","dynamic-light","muzzle","",200,origin,retailActive) end if end if;if pi.chat then UI_PlayerFloatSprite(pi,origin,"sprites/balloon3",retailActive) end if;pi.actions=emit(pi.actions,"scene","light","accent-white","",500,[origin[0]-100.0,origin[1]+100.0,origin[2]+100.0],retailActive);pi.actions=emit(pi.actions,"scene","light","accent-red","",500,[origin[0]-200.0,origin[1],origin[2]],retailActive);pi.actions=emit(pi.actions,"renderer","render-scene","player-preview",str(fovx)+"/"+str(fovy),time,[x,y-pi.jumpHeight,w,h],retailActive);return pi.actions
end function

// UI_FileExists
function UI_FileExists(source,filename) return exists(source,filename) end function

// UI_FindClientHeadFile
// The C function returns qboolean and writes filename.  Returning the selected
// path preserves both results without an unsafe writable character buffer.
function UI_FindClientHeadFile(source,filename,length,teamName,headModelName,headSkinName,base,ext)
  folder="";model=headModelName
  if len(model)>0 and strings.substr(model,0,1)=="*" then folder="heads/";model=strings.substr(model,1,len(model)-1) end if
  while true
    if teamName!="" then
      candidate="models/players/"+folder+model+"/"+headSkinName+"/"+teamName+base+"_default."+ext
      if UI_FileExists(source,candidate) then return candidate end if
      candidate="models/players/"+folder+model+"/"+teamName+base+"_"+headSkinName+"."+ext
      if UI_FileExists(source,candidate) then return candidate end if
    end if
    candidate="models/players/"+folder+model+"/"+headSkinName+"/"+base+"_default."+ext
    if UI_FileExists(source,candidate) then return candidate end if
    candidate="models/players/"+folder+model+"/"+base+"_"+headSkinName+"."+ext
    if UI_FileExists(source,candidate) then return candidate end if
    if folder=="heads/" then break end if;folder="heads/"
  end while
  return ""
end function

// UI_RegisterClientSkin
function UI_RegisterClientSkin(source,pi,modelName,skinName,headModelName,headSkinName,teamName)
  prefix="models/players/"+modelName+"/";if teamName!="" then prefix=prefix+teamName+"/" end if
  pi.legsSkin=register(source,"skin",prefix+"lower_"+skinName+".skin")
  if pi.legsSkin=="" then prefix="models/players/characters/"+modelName+"/";if teamName!="" then prefix=prefix+teamName+"/" end if;pi.legsSkin=register(source,"skin",prefix+"lower_"+skinName+".skin") end if
  prefix="models/players/"+modelName+"/";if teamName!="" then prefix=prefix+teamName+"/" end if
  pi.torsoSkin=register(source,"skin",prefix+"upper_"+skinName+".skin")
  if pi.torsoSkin=="" then prefix="models/players/characters/"+modelName+"/";if teamName!="" then prefix=prefix+teamName+"/" end if;pi.torsoSkin=register(source,"skin",prefix+"upper_"+skinName+".skin") end if
  headPath=UI_FindClientHeadFile(source,"",128,teamName,headModelName,headSkinName,"head","skin")
  if headPath!="" then pi.headSkin=register(source,"skin",headPath) end if
  return pi.legsSkin!="" and pi.torsoSkin!="" and pi.headSkin!=""
end function
function numberStarts(token) if token=="" then return false end if;c=bytes(token)[0];return c>=48 and c<=57 end function
// UI_ParseAnimationFile
function UI_ParseAnimationFile(filename,text)
  if text==void or len(bytes(text))==0 or len(bytes(text))>=19999 then return void end if;scan=parser.create(text);first=""
  while true previous=scan.offset;token=parser.parseExt(scan,true);if token=="" then break end if;key=strings.toLowerAscii(token);if key=="footsteps" or key=="sex" then parser.parseExt(scan,true) else if key=="headoffset" then for axis=0 to 2 parser.parseExt(scan,true) end for else if numberStarts(token) then first=token;break end if end while
  animations=[];skip=0;for index=0 to MAX_ANIMATIONS-1 token=first;first="";if token=="" then token=parser.parseExt(scan,true) end if;if token=="" then return void end if;start=numbers.atoi(token);if index==LEGS_WALKCR then skip=start-animations[TORSO_GESTURE].firstFrame end if;if index>=LEGS_WALKCR then start=start-skip end if;countToken=parser.parseExt(scan,true);loopToken=parser.parseExt(scan,true);fpsToken=parser.parseExt(scan,true);if countToken=="" or loopToken=="" or fpsToken=="" then return void end if;fps=numbers.atof(fpsToken);if fps==0 then fps=1 end if;millis=n.trunc32(1000.0/fps);animations=animations+[Animation(start,numbers.atoi(countToken),numbers.atoi(loopToken),millis,millis)] end for;return animations
end function
// UI_RegisterClientModelname
function UI_RegisterClientModelname(source,pi,modelSkinName,headModelSkinName,teamName)
  pi.torsoModel="";pi.headModel="";if modelSkinName=="" then return false end if
  slash=strings.indexOf(modelSkinName,"/",0);model=modelSkinName;skin="default";if slash>=0 then model=strings.substr(modelSkinName,0,slash);skin=strings.substr(modelSkinName,slash+1,len(modelSkinName)-slash-1) end if
  slash=strings.indexOf(headModelSkinName,"/",0);headModel=headModelSkinName;headSkin="default";if slash>=0 then headModel=strings.substr(headModelSkinName,0,slash);headSkin=strings.substr(headModelSkinName,slash+1,len(headModelSkinName)-slash-1) end if
  pi.legsModel=register(source,"model","models/players/"+model+"/lower.md3");if pi.legsModel=="" then pi.legsModel=register(source,"model","models/players/characters/"+model+"/lower.md3") end if;if pi.legsModel=="" then return false end if
  pi.torsoModel=register(source,"model","models/players/"+model+"/upper.md3");if pi.torsoModel=="" then pi.torsoModel=register(source,"model","models/players/characters/"+model+"/upper.md3") end if;if pi.torsoModel=="" then return false end if
  if len(headModel)>0 and strings.substr(headModel,0,1)=="*" then bare=strings.substr(headModel,1,len(headModel)-1);pi.headModel=register(source,"model","models/players/heads/"+bare+"/"+bare+".md3") else pi.headModel=register(source,"model","models/players/"+headModel+"/head.md3");if pi.headModel=="" then pi.headModel=register(source,"model","models/players/heads/"+headModel+"/"+headModel+".md3") end if end if
  if pi.headModel=="" then return false end if
  if not UI_RegisterClientSkin(source,pi,model,skin,headModel,headSkin,teamName) and not UI_RegisterClientSkin(source,pi,model,"default",headModel,"default",teamName) then return false end if
  path="models/players/"+model+"/animation.cfg";text=animationText(source,path);if text==void then path="models/players/characters/"+model+"/animation.cfg";text=animationText(source,path) end if;pi.animations=UI_ParseAnimationFile(path,text);if pi.animations==void then pi.animations=[];return false end if;return true
end function
function resetInfo(pi) fresh=create();pi.legsModel=fresh.legsModel;pi.legsSkin=fresh.legsSkin;pi.legs=fresh.legs;pi.torsoModel=fresh.torsoModel;pi.torsoSkin=fresh.torsoSkin;pi.torso=fresh.torso;pi.headModel=fresh.headModel;pi.headSkin=fresh.headSkin;pi.animations=[];pi.actions=[];return pi end function
// UI_PlayerInfo_SetModel
function UI_PlayerInfo_SetModel(source,pi,model,headmodel,teamName) resetInfo(pi);UI_RegisterClientModelname(source,pi,model,headmodel,teamName);pi.weapon=WP_MACHINEGUN;pi.currentWeapon=pi.weapon;pi.lastWeapon=pi.weapon;pi.pendingWeapon=-1;pi.weaponTimer=0;pi.chat=false;pi.newModel=true;UI_PlayerInfo_SetWeapon(source,pi,pi.weapon);return pi end function
// UI_PlayerInfo_SetInfo
function UI_PlayerInfo_SetInfo(source,pi,legsAnim,torsoAnim,viewAngles,moveAngles,weaponNumber,chat)
  pi.chat=chat;pi.viewAngles=[viewAngles[0],viewAngles[1],viewAngles[2]];pi.moveAngles=[moveAngles[0],moveAngles[1],moveAngles[2]]
  if pi.newModel then pi.newModel=false;pi.jumpHeight=0.0;pi.pendingLegsAnim=0;UI_ForceLegsAnim(pi,legsAnim);pi.legs.yawAngle=viewAngles[1];pi.legs.yawing=false;pi.pendingTorsoAnim=0;UI_ForceTorsoAnim(pi,torsoAnim);pi.torso.yawAngle=viewAngles[1];pi.torso.yawing=false;if weaponNumber!=-1 then pi.weapon=weaponNumber;pi.currentWeapon=weaponNumber;pi.lastWeapon=weaponNumber;pi.pendingWeapon=-1;pi.weaponTimer=0;UI_PlayerInfo_SetWeapon(source,pi,pi.weapon) end if;return pi end if
  if weaponNumber==-1 then pi.pendingWeapon=-1;pi.weaponTimer=0 else if weaponNumber!=WP_NONE then pi.pendingWeapon=weaponNumber;pi.weaponTimer=pi.realtime+UI_TIMER_WEAPON_DELAY end if;weaponNum=pi.lastWeapon;pi.weapon=weaponNum
  if torsoAnim==BOTH_DEATH1 or legsAnim==BOTH_DEATH1 then pi.torsoAnim=BOTH_DEATH1;pi.legsAnim=BOTH_DEATH1;pi.weapon=WP_NONE;pi.currentWeapon=WP_NONE;UI_PlayerInfo_SetWeapon(source,pi,WP_NONE);pi.jumpHeight=0.0;pi.pendingLegsAnim=0;UI_ForceLegsAnim(pi,BOTH_DEATH1);pi.pendingTorsoAnim=0;UI_ForceTorsoAnim(pi,BOTH_DEATH1);return pi end if
  current=pi.legsAnim&(~ANIM_TOGGLEBIT);if legsAnim!=LEGS_JUMP and (current==LEGS_JUMP or current==LEGS_LAND) then pi.pendingLegsAnim=legsAnim else if legsAnim!=current then pi.jumpHeight=0.0;pi.pendingLegsAnim=0;UI_ForceLegsAnim(pi,legsAnim) end if
  if torsoAnim==TORSO_STAND or torsoAnim==TORSO_STAND2 then if weaponNum==WP_NONE or weaponNum==WP_GAUNTLET then torsoAnim=TORSO_STAND2 else torsoAnim=TORSO_STAND end if end if;if torsoAnim==TORSO_ATTACK or torsoAnim==TORSO_ATTACK2 then if weaponNum==WP_NONE or weaponNum==WP_GAUNTLET then torsoAnim=TORSO_ATTACK2 else torsoAnim=TORSO_ATTACK end if;pi.muzzleFlashTime=pi.realtime+UI_TIMER_MUZZLE_FLASH end if;current=pi.torsoAnim&(~ANIM_TOGGLEBIT);if weaponNum!=pi.currentWeapon or current==TORSO_RAISE or current==TORSO_DROP then pi.pendingTorsoAnim=torsoAnim else if (current==TORSO_GESTURE or current==TORSO_ATTACK) and torsoAnim!=current then pi.pendingTorsoAnim=torsoAnim else if torsoAnim!=current then pi.pendingTorsoAnim=0;UI_ForceTorsoAnim(pi,torsoAnim) end if;return pi
end function
