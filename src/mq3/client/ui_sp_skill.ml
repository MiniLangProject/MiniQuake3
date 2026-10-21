// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_spskill.c.
package mq3.client.ui_sp_skill
const QM_ACTIVATED=3
const K_MOUSE2=178
const K_ESCAPE=27
const CHAN_ANNOUNCER=7
const ID_BABY=10
const ID_EASY=11
const ID_MEDIUM=12
const ID_HARD=13
const ID_NIGHTMARE=14
const ID_BACK=15
const ID_FIGHT=16
struct SkillItem id label y color shader end struct
struct SkillMenu fullscreen cursor arenaInfo skill items assets sounds actions cvarWrites end struct
function clampSkill(value) if value<1 then return 1 else if value>5 then return 5 end if;return value end function
function skillPicture(skill) return "menu/art/level_complete"+str(clampSkill(skill)) end function
// SetSkillColor
function setSkillColor(menu,skill,color)
  index=skill-1
  if index>=0 and index<5 then menu.items[index].color=color end if
  return menu
end function
// UI_SPSkillMenu_SkillEvent
function skillEvent(menu,id,notification)
  if notification!=QM_ACTIVATED then return menu end if
  menu=setSkillColor(menu,menu.skill,"red")
  skill=clampSkill(id-ID_BABY+1);menu.skill=skill;menu=setSkillColor(menu,skill,"white")
  menu.items[5].shader=skillPicture(skill);menu.cvarWrites=menu.cvarWrites+[["g_spSkill",skill]]
  if id==ID_NIGHTMARE then menu.sounds=menu.sounds+[["sound/misc/nightmare.wav",CHAN_ANNOUNCER]] else menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]] end if
  return menu
end function
// UI_SPSkillMenu_FightEvent
function fightEvent(menu,notification) if notification==QM_ACTIVATED then menu.actions=menu.actions+[["spArenaStart",menu.arenaInfo]] end if;return menu end function
// UI_SPSkillMenu_BackEvent
function backEvent(menu,notification) if notification==QM_ACTIVATED then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]];menu.actions=menu.actions+["pop"] end if;return menu end function
// UI_SPSkillMenu_Key
function key(menu,keyCode) if keyCode==K_MOUSE2 or keyCode==K_ESCAPE then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]] end if;menu.actions=menu.actions+[["defaultKey",keyCode]];return menu end function
// UI_SPSkillMenu_Cache
function cache() return ["menu/art/cut_frame","menu/art/back_0.tga","menu/art/back_1.tga","menu/art/fight_0","menu/art/fight_1","menu/art/level_complete1","menu/art/level_complete2","menu/art/level_complete3","menu/art/level_complete4","menu/art/level_complete5","sound/misc/nightmare.wav","sound/misc/silence.wav"] end function
// UI_SPSkillMenu_Init
function init(rawSkill)
  skill=clampSkill(rawSkill);red="red";items=[SkillItem(ID_BABY,"I Can Win",170,red,""),SkillItem(ID_EASY,"Bring It On",198,red,""),SkillItem(ID_MEDIUM,"Hurt Me Plenty",227,red,""),SkillItem(ID_HARD,"Hardcore",255,red,""),SkillItem(ID_NIGHTMARE,"NIGHTMARE!",283,red,""),SkillItem(0,"skillPicture",368,"white",skillPicture(skill)),SkillItem(ID_BACK,"back",416,"white","menu/art/back_0.tga"),SkillItem(ID_FIGHT,"fight",416,"white","menu/art/fight_0")]
  menu=SkillMenu(true,ID_FIGHT,"",skill,items,cache(),[],[],[]);menu=setSkillColor(menu,skill,"white")
  if skill==5 then menu.sounds=menu.sounds+[["sound/misc/nightmare.wav",CHAN_ANNOUNCER]] end if
  return menu
end function
// UI_SPSkillMenu
function open(arenaInfo,rawSkill) menu=init(rawSkill);menu.arenaInfo=arenaInfo;menu.actions=menu.actions+["push"];return menu end function
