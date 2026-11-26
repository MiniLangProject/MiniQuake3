// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_spskill.c.
package mq3.client.ui_sp_skill
/// Activation callback event accepted by the single-player difficulty menu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Engine key code for the mouse2 input, used by menu and client key-event handling.
const K_MOUSE2=178
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=27
/// Sound channel reserved for global announcer feedback.
const CHAN_ANNOUNCER=7
/// Menu control identifier routed to the baby action by the menu event handler.
const ID_BABY=10
/// Menu control identifier routed to the easy action by the menu event handler.
const ID_EASY=11
/// Menu control identifier routed to the medium action by the menu event handler.
const ID_MEDIUM=12
/// Menu control identifier routed to the hard action by the menu event handler.
const ID_HARD=13
/// Menu control identifier routed to the nightmare action by the menu event handler.
const ID_NIGHTMARE=14
/// Event identifier of the Back control used to leave the single-player difficulty menu and return to
/// its parent menu.
const ID_BACK=15
/// Menu control identifier routed to the fight action by the menu event handler.
const ID_FIGHT=16
/// Stores UI sp skill skill item record, including `id`, `label`, `y`, `color`, `shader`.
struct SkillItem
  /// Event-routing identifier of this selectable control in the single-player difficulty menu.
  id
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Vertical position of this menu control in the virtual layout used by the single-player difficulty
  /// menu.
  y
  /// Named menu color such as red or white used to highlight a skill label or menu asset.
  color
  /// Image asset path for the difficulty illustration or navigation button; empty for text-only skill
  /// choices.
  shader
end struct
/// Stores UI sp skill skill menu record, including `fullscreen`, `cursor`, `arenaInfo`, `skill`, `items`, `assets` and additional values.
struct SkillMenu
  /// Whether the single-player skill-selection menu covers the entire UI instead of appearing over the
  /// underlying game view.
  fullscreen
  /// When constructing this record, `init` supplies `ID_FIGHT` for this member.
  cursor
  /// When constructing this record, `init` supplies an empty string for this member.
  arenaInfo
  /// When constructing this record, `init` supplies `skill` for this member.
  skill
  /// When constructing this record, `init` supplies `items` for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the single-player
  /// difficulty menu.
  assets
  /// Registered sound resources associated with the player model or media group.
  sounds
  /// Host requests queued while selecting bot difficulty and launching the chosen arena, retained in
  /// request order.
  actions
  /// Cvar name/value changes queued by the single-player difficulty menu for the host to apply.
  cvarWrites
end struct
/// Evaluates UI sp skill `clampSkill` and returns `1`, `5`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<1`, `value>5` before the calculation continues.
function clampSkill(value) if value<1 then return 1 else if value>5 then return 5 end if;return value end function
/// Computes `"menu/art/level_complete"+str(clampSkill(skill))` for UI sp skill `skillPicture`.
/// @param skill Value used by `return "menu/art/level_complete"+str(clampSkill(skill))`.
function skillPicture(skill) return "menu/art/level_complete"+str(clampSkill(skill)) end function
// SetSkillColor
/// @param menu Mutable UI sp skill record/storage; this routine assigns `menu.items[index].color`.
/// @param skill Value used by `index=skill-1`.
/// @param color Color value used by the UI sp skill drawing or interpolation operation.
function setSkillColor(menu,skill,color)
  index=skill-1
  if index>=0 and index<5 then menu.items[index].color=color end if
  return menu
end function
// UI_SPSkillMenu_SkillEvent
/// @param menu Mutable UI sp skill record/storage; this routine assigns `menu.skill`, `menu.items[5].shader`, `menu.cvarWrites`, `menu.sounds`.
/// @param id Value used by `skill=clampSkill(id-ID_BABY+1)`.
/// @param notification Value used by `if notification!=QM_ACTIVATED then return menu end if`.
function skillEvent(menu,id,notification)
  if notification!=QM_ACTIVATED then return menu end if
  menu=setSkillColor(menu,menu.skill,"red")
  skill=clampSkill(id-ID_BABY+1);menu.skill=skill;menu=setSkillColor(menu,skill,"white")
  menu.items[5].shader=skillPicture(skill);menu.cvarWrites=menu.cvarWrites+[["g_spSkill",skill]]
  if id==ID_NIGHTMARE then menu.sounds=menu.sounds+[["sound/misc/nightmare.wav",CHAN_ANNOUNCER]] else menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]] end if
  return menu
end function
// UI_SPSkillMenu_FightEvent
/// @param menu Mutable UI sp skill record/storage; this routine assigns `menu.actions`.
/// @param notification Value used by `if notification==QM_ACTIVATED then menu.actions=menu.actions+[["spArenaStart",menu.arenaInfo]] end if`.
function fightEvent(menu,notification) if notification==QM_ACTIVATED then menu.actions=menu.actions+[["spArenaStart",menu.arenaInfo]] end if;return menu end function
// UI_SPSkillMenu_BackEvent
/// @param menu Mutable UI sp skill record/storage; this routine assigns `menu.sounds`, `menu.actions`.
/// @param notification Value used by `if notification==QM_ACTIVATED then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]]`.
function backEvent(menu,notification) if notification==QM_ACTIVATED then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]];menu.actions=menu.actions+["pop"] end if;return menu end function
// UI_SPSkillMenu_Key
/// @param menu Mutable UI sp skill record/storage; this routine assigns `menu.sounds`, `menu.actions`.
/// @param keyCode Value used by `if keyCode==K_MOUSE2 or keyCode==K_ESCAPE then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]] end if`.
function key(menu,keyCode) if keyCode==K_MOUSE2 or keyCode==K_ESCAPE then menu.sounds=menu.sounds+[["sound/misc/silence.wav",CHAN_ANNOUNCER]] end if;menu.actions=menu.actions+[["defaultKey",keyCode]];return menu end function
// UI_SPSkillMenu_Cache
function cache() return ["menu/art/cut_frame","menu/art/back_0.tga","menu/art/back_1.tga","menu/art/fight_0","menu/art/fight_1","menu/art/level_complete1","menu/art/level_complete2","menu/art/level_complete3","menu/art/level_complete4","menu/art/level_complete5","sound/misc/nightmare.wav","sound/misc/silence.wav"] end function
// UI_SPSkillMenu_Init
/// @param rawSkill Value used by `skill=clampSkill(rawSkill)`.
function init(rawSkill)
  skill=clampSkill(rawSkill);red="red";items=[SkillItem(ID_BABY,"I Can Win",170,red,""),SkillItem(ID_EASY,"Bring It On",198,red,""),SkillItem(ID_MEDIUM,"Hurt Me Plenty",227,red,""),SkillItem(ID_HARD,"Hardcore",255,red,""),SkillItem(ID_NIGHTMARE,"NIGHTMARE!",283,red,""),SkillItem(0,"skillPicture",368,"white",skillPicture(skill)),SkillItem(ID_BACK,"back",416,"white","menu/art/back_0.tga"),SkillItem(ID_FIGHT,"fight",416,"white","menu/art/fight_0")]
  menu=SkillMenu(true,ID_FIGHT,"",skill,items,cache(),[],[],[]);menu=setSkillColor(menu,skill,"white")
  if skill==5 then menu.sounds=menu.sounds+[["sound/misc/nightmare.wav",CHAN_ANNOUNCER]] end if
  return menu
end function
// UI_SPSkillMenu
/// @param arenaInfo Value assigned to `menu.arenaInfo`.
/// @param rawSkill Value used by `menu=init(rawSkill)`.
function open(arenaInfo,rawSkill) menu=init(rawSkill);menu.arenaInfo=arenaInfo;menu.actions=menu.actions+["push"];return menu end function
