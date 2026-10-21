// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_main.c. Every engine/UI side effect is
// represented by a typed Action. retailActive suppresses dispatch while keeping
// the unchanged Retail QVM authoritative and this port observable.
package mq3.client.cgame_main
import std.string as strings
import mq3.compat.numeric as numeric
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
extern function atof(text as cstr) from "ucrtbase.dll" returns double

const MAX_CLIENTS=64
const MAX_CONFIGSTRINGS=1024
const CS_MUSIC=2
const CS_GAME_VERSION=20
const CS_LEVEL_START_TIME=21
const CS_ITEMS=27
const CS_MODELS=32
const CS_SOUNDS=288
const CS_PLAYERS=544
const TEAM_FREE=0
const TEAM_RED=1
const TEAM_BLUE=2
const TEAM_SPECTATOR=3
const GT_TOURNAMENT=1
const GT_TEAM=3
const WP_MACHINEGUN=2
const CG_INIT=0
const CG_SHUTDOWN=1
const CG_CONSOLE_COMMAND=2
const CG_DRAW_ACTIVE_FRAME=3
const CG_CROSSHAIR_PLAYER=4
const CG_LAST_ATTACKER=5
const CG_KEY_EVENT=6
const CG_MOUSE_EVENT=7
const CG_EVENT_HANDLING=8
const FEEDER_REDTEAM_LIST=1
const FEEDER_BLUETEAM_LIST=2
const FEEDER_SCOREBOARD=3

struct Action boundary kind name value value2 number flags dispatched end struct
struct Result handled value actions end struct
struct Cvar name defaultValue flags value integer modificationCount end struct
struct Item classname pickupSound sounds icon end struct
struct Client infoValid team name powerups botSkill handicap teamTask wins losses teamLeader score end struct
struct Score client team score time ping end struct
struct HudAssets textFont smallFont bigFont gradientBar cursor fadeClamp fadeCycle fadeAmount shadowX shadowY shadowColor shadowFadeClamp end struct
struct State initialized loading clientNum processedSnapshotNum serverCommandSequence weaponSelect redflag blueflag flagStatus levelStartTime gametype mapname screenXScale screenYScale time crosshairClientTime crosshairClientNum attackerTime attackerNum forceModelModificationCount drawTeamOverlayModificationCount cvars configstrings clients scores numScores selectedScore spectatorList spectatorLen spectatorWidth infoScreenText gameVersion hudFile hudAssets menuFiles eventType cursorX cursorY nextCinematicHandle end struct

function client() return Client(false,TEAM_FREE,"",0,0,100,0,0,0,false,0) end function
function hudAssets() return HudAssets("","","","","",0.0,0,0.0,0.0,0.0,[],0.0) end function
function create()
  clients=[];for i=0 to MAX_CLIENTS-1 clients=clients+[client()] end for
  return State(false,false,0,0,0,WP_MACHINEGUN,-1,-1,-1,0,0,"",1.0,1.0,0,0,-1,0,-1,-1,-1,[],array(MAX_CONFIGSTRINGS,""),clients,[],0,0,"",0,-1,"","baseq3-1","ui/hud.txt",hudAssets(),[],0,0,0,1)
end function
function action(boundary,kind,name,value,value2,number,flags,retailActive) return Action(boundary,kind,name,value,value2,number,flags,not retailActive) end function
function result(handled,value) return Result(handled,value,[]) end function
function emit(effect,boundary,kind,name,value,value2,number,flags,retailActive) effect.actions=effect.actions+[action(boundary,kind,name,value,value2,number,flags,retailActive)];return void end function
function merge(effect,other) effect.actions=effect.actions+other.actions;return void end function

// CG_Printf
// Com_Printf
function printMessage(text,retailActive) effect=result(true,0);emit(effect,"system","print","",text,"",0,0,retailActive);return effect end function
// CG_Error
// Com_Error
function errorMessage(text,retailActive) effect=result(true,-1);emit(effect,"system","error","",text,"",0,0,retailActive);return effect end function
// CG_Argv
function argv(args,index) if index<0 or index>=len(args) then return "" end if;return args[index] end function
// CG_ConfigString
function configString(state,index) if index<0 or index>=MAX_CONFIGSTRINGS then return error(7840,"CG_ConfigString: bad index: "+str(index)) end if;return state.configstrings[index] end function

function cvarSpec(name,defaultValue,flags) return Cvar(name,defaultValue,flags,defaultValue,atoi(defaultValue),0) end function
function cvarSpecs()
  // Exact baseq3 table order; numeric flags preserve archive(1), userinfo(2),
  // serverinfo(4), rom(64) and cheat(512) intent at the host boundary.
  names=["cg_ignore","cg_autoswitch","cg_drawGun","cg_zoomfov","cg_fov","cg_viewsize","cg_stereoSeparation","cg_shadows","cg_gibs","cg_draw2D","cg_drawStatus","cg_drawTimer","cg_drawFPS","cg_drawSnapshot","cg_draw3dIcons","cg_drawIcons","cg_drawAmmoWarning","cg_drawAttacker","cg_drawCrosshair","cg_drawCrosshairNames","cg_drawRewards","cg_crosshairSize","cg_crosshairHealth","cg_crosshairX","cg_crosshairY","cg_brassTime","cg_simpleItems","cg_marks","cg_lagometer","cg_railTrailTime","cg_gunX","cg_gunY","cg_gunZ","cg_centertime","cg_runpitch","cg_runroll","cg_bobup","cg_bobpitch","cg_bobroll","cg_swingSpeed","cg_animspeed","cg_debuganim","cg_debugposition","cg_debugevents","cg_errordecay","cg_nopredict","cg_noplayeranims","cg_showmiss","cg_footsteps","cg_tracerchance","cg_tracerwidth","cg_tracerlength","cg_thirdPersonRange","cg_thirdPersonAngle","cg_thirdPerson","cg_teamChatTime","cg_teamChatHeight","cg_forceModel","cg_predictItems","cg_deferPlayers","cg_drawTeamOverlay","teamoverlay","cg_stats","cg_drawFriend","cg_teamChatsOnly","cg_noVoiceChats","cg_noVoiceText","com_buildScript","cl_paused","com_blood","g_synchronousClients","cg_cameraOrbit","cg_cameraOrbitDelay","cg_timescaleFadeEnd","cg_timescaleFadeSpeed","timescale","cg_scorePlums","cg_smoothClients","com_cameraMode","pmove_fixed","pmove_msec","cg_noTaunt","cg_noProjectileTrail","ui_smallFont","ui_bigFont","cg_oldRail","cg_oldRocket","cg_oldPlasma","cg_trueLightning"]
  defaults=["0","1","1","22.5","90","100","0.4","1","1","1","1","0","0","0","1","1","1","1","4","1","1","24","1","0","0","2500","0","1","1","400","0","0","0","3","0.002","0.005","0.005","0.002","0.002","0.3","1","0","0","0","100","0","0","0","1","0.4","1","100","40","0","0","3000","0","0","1","1","0","0","0","1","0","0","0","0","0","1","0","0","50","1","0","1","1","0","0","0","8","0","0","0.25","0.4","1","1","1","0.0"]
  effect=[];for i=0 to len(names)-1 flags=0;if i>=1 and i<=29 then flags=1 end if;if names[i]=="teamoverlay" then flags=66 end if;if names[i]=="cl_paused" then flags=64 end if;if names[i]=="cg_scorePlums" or names[i]=="cg_smoothClients" then flags=3 end if;effect=effect+[cvarSpec(names[i],defaults[i],flags)] end for;return effect
end function
function findCvar(state,name) for each cv in state.cvars if strings.equalsIgnoreCaseAscii(cv.name,name) then return cv end if end for;return void end function

// CG_RegisterCvars
function registerCvars(state,svRunning,retailActive)
  effect=result(true,0);state.cvars=cvarSpecs()
  for each cv in state.cvars emit(effect,"cvar","register",cv.name,cv.defaultValue,"",0,cv.flags,retailActive) end for
  for each pair in [["model","sarge"],["headmodel","sarge"],["team_model","james"],["team_headmodel","*james"]] emit(effect,"cvar","register",pair[0],pair[1],"",0,3,retailActive) end for
  forced=findCvar(state,"cg_forceModel");state.forceModelModificationCount=forced.modificationCount;emit(effect,"state","local-server","",svRunning,"",atoi(svRunning),0,retailActive);return effect
end function
// CG_ForceModelChange
function forceModelChange(state,retailActive)
  effect=result(true,0);for i=0 to MAX_CLIENTS-1 if configString(state,CS_PLAYERS+i)!="" then emit(effect,"client","new-info","",configString(state,CS_PLAYERS+i),"",i,0,retailActive) end if end for;return effect
end function
// CG_UpdateCvars
function updateCvars(state,updates,retailActive)
  effect=result(true,0)
  for each update in updates cv=findCvar(state,update[0]);if cv!=void then cv.value=update[1];cv.integer=atoi(update[1]);cv.modificationCount=atoi(update[2]);emit(effect,"cvar","update",cv.name,cv.value,"",cv.modificationCount,cv.flags,retailActive) end if end for
  overlay=findCvar(state,"cg_drawTeamOverlay");if overlay!=void and overlay.modificationCount!=state.drawTeamOverlayModificationCount then state.drawTeamOverlayModificationCount=overlay.modificationCount;emit(effect,"cvar","set","teamoverlay","1","",0,0,retailActive) end if
  forced=findCvar(state,"cg_forceModel");if forced!=void and forced.modificationCount!=state.forceModelModificationCount then state.forceModelModificationCount=forced.modificationCount;merge(effect,forceModelChange(state,retailActive)) end if;return effect
end function
// CG_CrosshairPlayer
function crosshairPlayer(state) if state.time>state.crosshairClientTime+1000 then return -1 end if;return state.crosshairClientNum end function
// CG_LastAttacker
function lastAttacker(state) if state.attackerTime==0 then return -1 end if;return state.attackerNum end function

function splitWords(text) effect=[];data=bytes(text);at=0;while at<len(data) while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if;start=at;while at<len(data) and data[at]>32 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))] end while;return effect end function
function suffix(text,want) if len(text)<len(want) then return false end if;return strings.equalsIgnoreCaseAscii(strings.substr(text,len(text)-len(want),len(want)),want) end function
// CG_RegisterItemSounds
function registerItemSounds(item,itemNum,retailActive)
  effect=result(true,0);if item.pickupSound!="" then emit(effect,"audio","register-sound",item.pickupSound,"","",itemNum,0,retailActive) end if
  for each sound in splitWords(item.sounds) if len(sound)<5 or len(sound)>=64 then return error(7841,"PrecacheItem: "+item.classname+" has bad precache string") end if;if suffix(sound,"wav") then emit(effect,"audio","register-sound",sound,"","",itemNum,0,retailActive) end if end for;return effect
end function
function baseSounds() return ["sound/feedback/1_minute.wav","sound/feedback/5_minute.wav","sound/feedback/sudden_death.wav","sound/feedback/1_frag.wav","sound/feedback/2_frags.wav","sound/feedback/3_frags.wav","sound/feedback/three.wav","sound/feedback/two.wav","sound/feedback/one.wav","sound/feedback/fight.wav","sound/feedback/prepare.wav","sound/feedback/prepare_team.wav","sound/teamplay/flagcapture_yourteam.wav","sound/feedback/redleads.wav","sound/feedback/blueleads.wav","sound/feedback/teamstied.wav","sound/feedback/hit_teammate.wav","sound/teamplay/voc_red_scores.wav","sound/teamplay/voc_blue_scores.wav","sound/teamplay/flagcapture_yourteam.wav","sound/teamplay/flagcapture_opponent.wav","sound/teamplay/flagreturn_yourteam.wav","sound/teamplay/flagreturn_opponent.wav","sound/teamplay/flagtaken_yourteam.wav","sound/teamplay/flagtaken_opponent.wav","sound/teamplay/voc_red_returned.wav","sound/teamplay/voc_blue_returned.wav","sound/teamplay/voc_enemy_flag.wav","sound/teamplay/voc_team_flag.wav","sound/teamplay/flagreturn_opponent.wav","sound/teamplay/voc_team_1flag.wav","sound/teamplay/voc_enemy_1flag.wav","sound/teamplay/voc_you_flag.wav","sound/feedback/voc_holyshit.wav","sound/teamplay/voc_base_attack.wav","sound/teamplay/voc_you_flag.wav","sound/feedback/voc_holyshit.wav","sound/teamplay/flagreturn_opponent.wav","sound/teamplay/voc_team_1flag.wav","sound/teamplay/voc_enemy_1flag.wav","sound/weapons/machinegun/buletby1.wav","sound/weapons/change.wav","sound/items/wearoff.wav","sound/items/use_nothing.wav","sound/player/gibsplt1.wav","sound/player/gibimp1.wav","sound/player/gibimp2.wav","sound/player/gibimp3.wav","sound/items/invul_activate.wav","sound/items/invul_impact_01.wav","sound/items/invul_impact_02.wav","sound/items/invul_impact_03.wav","sound/items/invul_juiced.wav","sound/items/obelisk_hit_01.wav","sound/items/obelisk_hit_02.wav","sound/items/obelisk_hit_03.wav","sound/items/obelisk_respawn.wav","sound/items/cl_ammoregen.wav","sound/items/cl_doubler.wav","sound/items/cl_guard.wav","sound/items/cl_scout.wav","sound/world/telein.wav","sound/world/teleout.wav","sound/items/respawn1.wav","sound/weapons/noammo.wav","sound/player/talk.wav","sound/player/land1.wav","sound/feedback/hit.wav","sound/feedback/hithi.wav","sound/feedback/hitlo.wav","sound/feedback/impressive.wav","sound/feedback/excellent.wav","sound/feedback/denied.wav","sound/feedback/humiliation.wav","sound/feedback/assist.wav","sound/feedback/defense.wav","sound/feedback/first_impressive.wav","sound/feedback/first_excellent.wav","sound/feedback/first_gauntlet.wav","sound/feedback/takenlead.wav","sound/feedback/tiedlead.wav","sound/feedback/lostlead.wav","sound/feedback/vote_now.wav","sound/feedback/vote_passed.wav","sound/feedback/vote_failed.wav","sound/player/watr_in.wav","sound/player/watr_out.wav","sound/player/watr_un.wav","sound/world/jumppad.wav","sound/items/flight.wav","sound/items/use_medkit.wav","sound/items/damage3.wav","sound/weapons/machinegun/ric1.wav","sound/weapons/machinegun/ric2.wav","sound/weapons/machinegun/ric3.wav","sound/weapons/railgun/railgf1a.wav","sound/weapons/rocket/rocklx1a.wav","sound/weapons/plasma/plasmx1a.wav","sound/weapons/proxmine/wstbexpl.wav","sound/weapons/nailgun/wnalimpd.wav","sound/weapons/nailgun/wnalimpl.wav","sound/weapons/nailgun/wnalimpm.wav","sound/weapons/vulcan/wvulimpd.wav","sound/weapons/vulcan/wvulimpl.wav","sound/weapons/vulcan/wvulimpm.wav","sound/weapons/weapon_hover.wav","sound/items/kam_explode.wav","sound/items/kam_implode.wav","sound/items/kam_explode_far.wav","sound/feedback/voc_youwin.wav","sound/feedback/voc_youlose.wav","sound/misc/yousuck.wav","sound/weapons/proxmine/wstbimpl.wav","sound/weapons/proxmine/wstbimpm.wav","sound/weapons/proxmine/wstbimpd.wav","sound/weapons/proxmine/wstbactv.wav","sound/items/regen.wav","sound/items/protect3.wav","sound/items/n_health.wav","sound/weapons/grenade/hgrenb1a.wav","sound/weapons/grenade/hgrenb2a.wav","sound/player/james/death1.wav","sound/player/james/death2.wav","sound/player/james/death3.wav","sound/player/james/jump1.wav","sound/player/james/pain25_1.wav","sound/player/james/pain75_1.wav","sound/player/james/pain100_1.wav","sound/player/james/falling1.wav","sound/player/james/gasp.wav","sound/player/james/drown.wav","sound/player/james/fall1.wav","sound/player/james/taunt.wav","sound/player/janet/death1.wav","sound/player/janet/death2.wav","sound/player/janet/death3.wav","sound/player/janet/jump1.wav","sound/player/janet/pain25_1.wav","sound/player/janet/pain75_1.wav","sound/player/janet/pain100_1.wav","sound/player/janet/falling1.wav","sound/player/janet/gasp.wav","sound/player/janet/drown.wav","sound/player/janet/fall1.wav","sound/player/janet/taunt.wav"] end function
// CG_RegisterSounds
function registerSounds(state,items,retailActive)
  effect=result(true,0);for each name in baseSounds() emit(effect,"audio","register-sound",name,"","",0,0,retailActive) end for
  for foot=1 to 4 for each stem in ["step","boot","flesh","mech","energy","splash","clank"] emit(effect,"audio","register-sound","sound/player/footsteps/"+stem+str(foot)+".wav","","",0,0,retailActive) end for end for
  if len(items)>1 then for i=1 to len(items)-1 merge(effect,registerItemSounds(items[i],i,retailActive)) end for end if
  for i=1 to 255 name=configString(state,CS_SOUNDS+i);if name=="" then break end if;if strings.substr(name,0,1)!="*" then emit(effect,"audio","register-game-sound",name,"","",i,0,retailActive) end if end for;return effect
end function
function baseGraphics() return ["menu/art/skill1.tga","menu/art/skill2.tga","menu/art/skill3.tga","menu/art/skill4.tga","menu/art/skill5.tga","viewBloodBlend","gfx/2d/defer.tga","menu/tab/name.tga","menu/tab/ping.tga","menu/tab/score.tga","menu/tab/time.tga","smokePuff","smokePuffRagePro","shotgunSmokePuff","nailtrail","models/weaphits/proxmineb.md3","sprites/plasma1","bloodTrail","lagometer","disconnected","waterBubble","gfx/misc/tracer","gfx/2d/select","gfx/2d/backtile","icons/noammo","powerups/quad","powerups/quadWeapon","powerups/battleSuit","powerups/battleWeapon","powerups/invisibility","powerups/regen","hasteSmokePuff","models/powerups/orb/r_orb.md3","models/powerups/orb/b_orb.md3","icons/skull_red","icons/skull_blue","models/flags/r_flag.md3","models/flags/b_flag.md3","icons/iconf_red1","icons/iconf_red2","icons/iconf_red3","icons/iconf_blu1","icons/iconf_blu2","icons/iconf_blu3","models/flag2/flagpole.md3","models/flag2/flagflap3.md3","models/flag2/red.skin","models/flag2/blue.skin","models/flag2/white.skin","models/mapobjects/flagbase/red_base.md3","models/mapobjects/flagbase/blue_base.md3","models/mapobjects/flagbase/ntrl_base.md3","models/flags/n_flag.md3","icons/iconf_neutral1","icons/iconf_red2","icons/iconf_blu2","icons/iconf_neutral3","models/powerups/overload_base.md3","models/powerups/overload_target.md3","models/powerups/overload_lights.md3","models/powerups/overload_energy.md3","models/powerups/harvester/harvester.md3","models/powerups/harvester/red.skin","models/powerups/harvester/blue.skin","models/powerups/obelisk/obelisk.md3","models/weaphits/kamikred","hasteSmokePuff","sprites/foe","powerups/blueflag","gfx/2d/colorbar.tga","models/weaphits/kamikblu","models/powerups/armor/armor_yel.md3","icons/iconr_yellow","models/weapons2/shells/m_shell.md3","models/weapons2/shells/s_shell.md3","models/gibs/abdomen.md3","models/gibs/arm.md3","models/gibs/chest.md3","models/gibs/fist.md3","models/gibs/foot.md3","models/gibs/forearm.md3","models/gibs/intestine.md3","models/gibs/leg.md3","models/gibs/skull.md3","models/gibs/brain.md3","models/weapons2/shells/s_shell.md3","sprites/balloon3","bloodExplosion","models/weaphits/bullet.md3","models/weaphits/ring02.md3","models/weaphits/boom01.md3","models/powerups/pop.md3","models/misc/telep.md3","teleportEffect","models/weaphits/kamboom2.md3","models/weaphits/kamwave.md3","models/powerups/kamikazi.md3","models/powerups/trailtest.md3","models/powerups/guard_player.md3","models/powerups/scout_player.md3","models/powerups/doubler_player.md3","models/powerups/ammo_player.md3","models/powerups/shield/impact.md3","models/powerups/shield/juicer.md3","models/powerups/regen.md3","ui/assets/statusbar/selectedhealth.tga","models/powerups/shield/shield.md3","medal_impressive","medal_excellent","medal_gauntlet","medal_defend","medal_assist","medal_capture","gfx/damage/bullet_mrk","gfx/damage/burn_med_mrk","gfx/damage/hole_lg_mrk","gfx/damage/plasma_mrk","markShadow","wake","bloodMark","ui/assets/statusbar/patrol.tga","ui/assets/statusbar/assault.tga","ui/assets/statusbar/camp.tga","ui/assets/statusbar/follow.tga","ui/assets/statusbar/defend.tga","ui/assets/statusbar/team_leader.tga","ui/assets/statusbar/retrieve.tga","ui/assets/statusbar/escort.tga","menu/art/3_cursor2","ui/assets/sizecursor.tga","ui/assets/selectcursor.tga","ui/assets/statusbar/flag_in_base.tga","ui/assets/statusbar/flag_capture.tga","ui/assets/statusbar/flag_missing.tga","models/players/james/lower.md3","models/players/james/upper.md3","models/players/heads/james/james.md3","models/players/janet/lower.md3","models/players/janet/upper.md3","models/players/heads/janet/janet.md3"] end function
// CG_RegisterGraphics
function registerGraphics(state,items,retailActive)
  effect=result(true,0);emit(effect,"renderer","clear-scene","","","",0,0,retailActive);emit(effect,"renderer","load-world",state.mapname,"","",0,0,retailActive)
  digits=["zero","one","two","three","four","five","six","seven","eight","nine","minus"];for each digit in digits emit(effect,"renderer","register-shader","gfx/2d/numbers/"+digit+"_32b","","",0,0,retailActive) end for
  for each name in baseGraphics() emit(effect,"renderer","register-shader",name,"","",0,0,retailActive) end for
  for skill=1 to 5 emit(effect,"renderer","register-shader","menu/art/skill"+str(skill)+".tga","","",skill,0,retailActive) end for
  if len(items)>1 then for i=1 to len(items)-1 emit(effect,"renderer","register-item-visuals",items[i].classname,items[i].icon,"",i,0,retailActive) end for end if
  for i=1 to 255 name=configString(state,CS_MODELS+i);if name=="" then break end if;emit(effect,"renderer","register-game-model",name,"","",i,0,retailActive) end for
  emit(effect,"particles","clear","","","",0,0,retailActive);return effect
end function
// CG_BuildSpectatorString
function buildSpectatorString(state)
  text="";for each ci in state.clients if ci.infoValid and ci.team==TEAM_SPECTATOR then text=text+ci.name+"     " end if end for;state.spectatorList=text;if len(text)!=state.spectatorLen then state.spectatorLen=len(text);state.spectatorWidth=-1 end if;return text
end function
// CG_RegisterClients
function registerClients(state,retailActive)
  effect=result(true,0);emit(effect,"client","loading","","","",state.clientNum,0,retailActive);emit(effect,"client","new-info","",configString(state,CS_PLAYERS+state.clientNum),"",state.clientNum,0,retailActive)
  for i=0 to MAX_CLIENTS-1 if i!=state.clientNum and configString(state,CS_PLAYERS+i)!="" then emit(effect,"client","loading","","","",i,0,retailActive);emit(effect,"client","new-info","",configString(state,CS_PLAYERS+i),"",i,0,retailActive) end if end for;buildSpectatorString(state);return effect
end function
// CG_StartMusic
function startMusic(state,retailActive) words=splitWords(configString(state,CS_MUSIC));intro="";loopTrack="";if len(words)>0 then intro=words[0] end if;if len(words)>1 then loopTrack=words[1] end if;effect=result(true,0);emit(effect,"audio","start-background",intro,loopTrack,"",0,0,retailActive);return effect end function

function menuTokens(text)
  effect=[];data=bytes(text);at=0;while at<len(data) while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if;if data[at]==123 or data[at]==125 then effect=effect+[decode(slice(data,at,1))];at=at+1 else if data[at]==34 then at=at+1;start=at;while at<len(data) and data[at]!=34 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))];if at<len(data) then at=at+1 end if else start=at;while at<len(data) and data[at]>32 and data[at]!=123 and data[at]!=125 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))] end if end while;return effect
end function
// CG_GetMenuBuffer
function getMenuBuffer(filename,text,maxSize) if text==void then return error(7842,"menu file not found: "+filename+", using default") end if;if len(text)>=maxSize then return error(7843,"menu file too large: "+filename) end if;return text end function
// CG_Asset_Parse
function assetParse(state,tokens,start,retailActive)
  effect=result(false,start);if start>=len(tokens) or tokens[start]!="{" then return effect end if;at=start+1
  while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="}" then effect.handled=true;effect.value=at;return effect end if
    if key=="font" or key=="smallfont" or key=="bigfont" then if at+1>=len(tokens) then return effect end if;name=tokens[at];size=atoi(tokens[at+1]);at=at+2;emit(effect,"renderer","register-font",key,name,"",size,0,retailActive);if key=="font" then state.hudAssets.textFont=name else if key=="smallfont" then state.hudAssets.smallFont=name else state.hudAssets.bigFont=name end if
    else if key=="gradientbar" or key=="cursor" then if at>=len(tokens) then return effect end if;name=tokens[at];at=at+1;emit(effect,"renderer","register-shader",key,name,"",0,0,retailActive);if key=="gradientbar" then state.hudAssets.gradientBar=name else state.hudAssets.cursor=name end if
    else if key=="menuentersound" or key=="menuexitsound" or key=="itemfocussound" or key=="menubuzzsound" then if at>=len(tokens) then return effect end if;emit(effect,"audio","register-sound",tokens[at],"","",0,0,retailActive);at=at+1
    else if key=="fadeclamp" then state.hudAssets.fadeClamp=atof(tokens[at]);at=at+1
    else if key=="fadecycle" then state.hudAssets.fadeCycle=atoi(tokens[at]);at=at+1
    else if key=="fadeamount" then state.hudAssets.fadeAmount=atof(tokens[at]);at=at+1
    else if key=="shadowx" then state.hudAssets.shadowX=atof(tokens[at]);at=at+1
    else if key=="shadowy" then state.hudAssets.shadowY=atof(tokens[at]);at=at+1
    else if key=="shadowcolor" then if at+3>=len(tokens) then return effect end if;state.hudAssets.shadowColor=[atof(tokens[at]),atof(tokens[at+1]),atof(tokens[at+2]),atof(tokens[at+3])];state.hudAssets.shadowFadeClamp=atof(tokens[at+3]);at=at+4
    end if
  end while;return effect
end function
// CG_ParseMenu
function parseMenu(state,menuFile,text,retailActive)
  tokens=menuTokens(text);effect=result(true,0);at=0;while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="}" then break end if;if key=="assetglobaldef" then nested=assetParse(state,tokens,at,retailActive);merge(effect,nested);if not nested.handled then break end if;at=nested.value else if key=="menudef" then emit(effect,"ui","new-menu",menuFile,"","",at,0,retailActive);depth=0;while at<len(tokens) if tokens[at]=="{" then depth=depth+1 else if tokens[at]=="}" then depth=depth-1;if depth<=0 then at=at+1;break end if end if;at=at+1 end while end if end while;state.menuFiles=state.menuFiles+[menuFile];return effect
end function
// CG_Load_Menu
function loadMenu(state,tokens,start,files,retailActive)
  effect=result(false,start);if start>=len(tokens) or tokens[start]!="{" then return effect end if;at=start+1;while at<len(tokens) if tokens[at]=="}" then effect.handled=true;effect.value=at+1;return effect end if;name=tokens[at];at=at+1;text="";for each file in files if file[0]==name then text=file[1] end if end for;if text!="" then merge(effect,parseMenu(state,name,text,retailActive)) end if end while;return effect
end function
// CG_LoadMenus
function loadMenus(state,menuFile,text,files,retailActive)
  tokens=menuTokens(text);effect=result(true,0);emit(effect,"ui","reset-menus","","","",0,0,retailActive);at=0;while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="}" then break end if;if key=="loadmenu" then nested=loadMenu(state,tokens,at,files,retailActive);merge(effect,nested);if not nested.handled then break end if;at=nested.value end if end while;emit(effect,"system","print","","UI menu load complete\n","",0,0,retailActive);return effect
end function
// CG_OwnerDrawHandleKey
function ownerDrawHandleKey(ownerDraw,flags,special,key) return false end function
// CG_FeederCount
function feederCount(state,feederID) if feederID==FEEDER_SCOREBOARD then return state.numScores end if;team=TEAM_RED;if feederID==FEEDER_BLUETEAM_LIST then team=TEAM_BLUE else if feederID!=FEEDER_REDTEAM_LIST then return 0 end if;count=0;for each score in state.scores if score.team==team then count=count+1 end if end for;return count end function
// CG_SetScoreSelection
function setScoreSelection(state,clientNum,hasMenu,retailActive)
  effect=result(true,0);red=0;blue=0;for i=0 to len(state.scores)-1 score=state.scores[i];if score.team==TEAM_RED then red=red+1 else if score.team==TEAM_BLUE then blue=blue+1 end if;if score.client==clientNum then state.selectedScore=i end if end for
  if hasMenu and len(state.scores)>0 then feeder=FEEDER_SCOREBOARD;index=state.selectedScore;if state.gametype>=GT_TEAM then feeder=FEEDER_REDTEAM_LIST;index=red;if state.scores[state.selectedScore].team==TEAM_BLUE then feeder=FEEDER_BLUETEAM_LIST;index=blue end if end if;emit(effect,"ui","set-feeder-selection","","","",index,feeder,retailActive) end if;return effect
end function
// CG_InfoFromScoreIndex
function infoFromScoreIndex(state,index,team) if state.gametype>=GT_TEAM then count=0;for i=0 to len(state.scores)-1 if state.scores[i].team==team then if count==index then return i end if;count=count+1 end if end for end if;return index end function
// CG_FeederItemText
function feederItemText(state,feederID,index,column,readyMask)
  team=-1;if feederID==FEEDER_REDTEAM_LIST then team=TEAM_RED else if feederID==FEEDER_BLUETEAM_LIST then team=TEAM_BLUE end if;scoreIndex=infoFromScoreIndex(state,index,team);if scoreIndex<0 or scoreIndex>=len(state.scores) then return ["",-1] end if;sp=state.scores[scoreIndex];if sp.client<0 or sp.client>=len(state.clients) then return ["",-1] end if;ci=state.clients[sp.client];if not ci.infoValid then return ["",-1] end if
  if column==0 then if ci.botSkill>0 and ci.botSkill<=5 then return ["",ci.botSkill] end if;if ci.handicap<100 then return [str(ci.handicap),-1] end if
  else if column==1 then if team!=-1 then return ["",ci.teamTask] end if
  else if column==2 then if (readyMask & (1<<sp.client))!=0 then return ["Ready",-1] end if;if team==-1 then if state.gametype==GT_TOURNAMENT then return [str(ci.wins)+"/"+str(ci.losses),-1] end if;if ci.team==TEAM_SPECTATOR then return ["Spectator",-1] end if else if ci.teamLeader then return ["Leader",-1] end if
  else if column==3 then return [ci.name,-1] else if column==4 then return [str(ci.score),-1] else if column==5 then return [str(sp.time),-1] else if column==6 then if sp.ping==-1 then return ["connecting",-1] end if;return [str(sp.ping),-1] end if;return ["",-1]
end function
// CG_FeederItemImage
function feederItemImage(feederID,index) return 0 end function
// CG_FeederSelection
function feederSelection(state,feederID,index) if state.gametype<GT_TEAM then state.selectedScore=index;return index end if;team=TEAM_RED;if feederID==FEEDER_BLUETEAM_LIST then team=TEAM_BLUE end if;count=0;for i=0 to len(state.scores)-1 if state.scores[i].team==team then if index==count then state.selectedScore=i end if;count=count+1 end if end for;return state.selectedScore end function
// CG_Cvar_Get
function cvarGet(state,name) cv=findCvar(state,name);if cv==void then return 0.0 end if;return atof(cv.value) end function
// CG_Text_PaintWithCursor
function textPaintWithCursor(text,cursorPos,cursor,limit,style,retailActive) effect=result(true,0);emit(effect,"ui","paint-text",text,str(cursor),"",cursorPos,style,retailActive);return effect end function
// CG_OwnerDrawWidth
function ownerDrawWidth(ownerDraw,scale,gameTypeText,statusText,killerText,redName,blueName) text="";if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==4 then text=redName else if ownerDraw==5 then text=blueName end if;return numeric.trunc32(len(text)*8*scale) end function
// CG_PlayCinematic
function playCinematic(state,name,x,y,w,h,retailActive) handle=state.nextCinematicHandle;state.nextCinematicHandle=handle+1;effect=result(true,handle);emit(effect,"cinematic","play",name,str(x)+","+str(y),str(w)+","+str(h),handle,1,retailActive);return effect end function
// CG_StopCinematic
function stopCinematic(handle,retailActive) effect=result(true,0);emit(effect,"cinematic","stop","","","",handle,0,retailActive);return effect end function
// CG_DrawCinematic
function drawCinematic(handle,x,y,w,h,retailActive) effect=result(true,0);emit(effect,"cinematic","set-extents","",str(x)+","+str(y),str(w)+","+str(h),handle,0,retailActive);emit(effect,"cinematic","draw","","","",handle,0,retailActive);return effect end function
// CG_RunCinematicFrame
function runCinematicFrame(handle,retailActive) effect=result(true,0);emit(effect,"cinematic","run-frame","","","",handle,0,retailActive);return effect end function
// CG_LoadHudMenu
function loadHudMenu(state,hudText,menuFiles,retailActive) state.hudFile="ui/hud.txt";cv=findCvar(state,"cg_hudFiles");if cv!=void and cv.value!="" then state.hudFile=cv.value end if;effect=result(true,0);emit(effect,"ui","init-display","","","",0,0,retailActive);merge(effect,loadMenus(state,state.hudFile,hudText,menuFiles,retailActive));return effect end function
// CG_AssetCache
function assetCache(state,retailActive) effect=result(true,0);for each name in ["ui/assets/gradientbar2.tga","ui/assets/scrollbar.tga","ui/assets/scrollbar_arrow_dwn_a.tga","ui/assets/scrollbar_arrow_up_a.tga","ui/assets/scrollbar_arrow_left.tga","ui/assets/scrollbar_arrow_right.tga","ui/assets/scrollbar_thumb.tga","ui/assets/slider2.tga","ui/assets/sliderbutt_1.tga","ui/assets/fx_base.tga","ui/assets/fx_red.tga","ui/assets/fx_yellow.tga","ui/assets/fx_green.tga","ui/assets/fx_teal.tga","ui/assets/fx_blue.tga","ui/assets/fx_cyan.tga","ui/assets/fx_white.tga"] emit(effect,"renderer","register-shader",name,"","",0,0,retailActive) end for;return effect end function

// CG_Init
function init(state,serverMessageNum,serverCommandSequence,clientNum,gameVersion,vidWidth,vidHeight,items,retailActive)
  state.initialized=true;state.loading=true;state.clientNum=clientNum;state.processedSnapshotNum=serverMessageNum;state.serverCommandSequence=serverCommandSequence;state.weaponSelect=WP_MACHINEGUN;state.redflag=-1;state.blueflag=-1;state.flagStatus=-1;state.screenXScale=vidWidth/640.0;state.screenYScale=vidHeight/480.0;effect=result(true,0)
  for each shader in ["gfx/2d/bigchars","white","menu/art/font1_prop.tga","menu/art/font1_prop_glo.tga","menu/art/font2_prop.tga"] emit(effect,"renderer","register-shader",shader,"","",0,0,retailActive) end for
  merge(effect,registerCvars(state,"0",retailActive));emit(effect,"console","init-commands","","","",0,0,retailActive)
  if gameVersion!=state.gameVersion then return error(7844,"Client/Server game mismatch: "+state.gameVersion+"/"+gameVersion) end if;state.levelStartTime=atoi(configString(state,CS_LEVEL_START_TIME));emit(effect,"state","parse-serverinfo","",configString(state,0),"",0,0,retailActive);emit(effect,"collision","load-map",state.mapname,"","",0,0,retailActive)
  merge(effect,registerSounds(state,items,retailActive));merge(effect,registerGraphics(state,items,retailActive));merge(effect,registerClients(state,retailActive));state.loading=false;emit(effect,"state","init-local-entities","","","",0,0,retailActive);emit(effect,"state","init-mark-polys","","","",0,0,retailActive);state.infoScreenText="";emit(effect,"state","set-config-values","","","",0,0,retailActive);merge(effect,startMusic(state,retailActive));emit(effect,"renderer","shader-state-changed","","","",0,0,retailActive);emit(effect,"audio","clear-looping","","","",1,0,retailActive);return effect
end function
// CG_Shutdown
function shutdown(state,retailActive) state.initialized=false;effect=result(true,0);emit(effect,"lifecycle","shutdown","","","",0,0,retailActive);return effect end function
// CG_EventHandling
function eventHandling(state,type) state.eventType=type;return 0 end function
// CG_KeyEvent
function keyEvent(state,key,down) return 0 end function
// CG_MouseEvent
function mouseEvent(state,x,y) state.cursorX=state.cursorX+x;state.cursorY=state.cursorY+y;return 0 end function
// vmMain
function vmMain(state,command,args,items,gameVersion,vidWidth,vidHeight,retailActive)
  if command==CG_INIT then return init(state,args[0],args[1],args[2],gameVersion,vidWidth,vidHeight,items,retailActive) end if;if command==CG_SHUTDOWN then return shutdown(state,retailActive) end if
  if command==CG_CONSOLE_COMMAND then effect=result(true,0);emit(effect,"console","command","","","",0,0,retailActive);return effect end if
  if command==CG_DRAW_ACTIVE_FRAME then effect=result(true,0);emit(effect,"renderer","draw-active-frame","","","",args[0],args[1],retailActive);return effect end if
  if command==CG_CROSSHAIR_PLAYER then return result(true,crosshairPlayer(state)) end if;if command==CG_LAST_ATTACKER then return result(true,lastAttacker(state)) end if
  if command==CG_KEY_EVENT then keyEvent(state,args[0],args[1]!=0);return result(true,0) end if;if command==CG_MOUSE_EVENT then mouseEvent(state,args[0],args[1]);return result(true,0) end if;if command==CG_EVENT_HANDLING then eventHandling(state,args[0]);return result(true,0) end if
  return errorMessage("vmMain: unknown command "+str(command),retailActive)
end function
