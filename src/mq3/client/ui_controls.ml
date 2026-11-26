// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_controls2.c.
package mq3.client.ui_controls

import mq3.vm.cgame_key_traps as keys
import mq3.compat.textnumbers as numbers
import std.string as strings

/// Save-confirmation result selecting the noop response.
const SAVE_NOOP=0
/// Save-confirmation result selecting the yes response.
const SAVE_YES=1
/// Save-confirmation result selecting the no response.
const SAVE_NO=2
/// Save-confirmation result selecting the cancel response.
const SAVE_CANCEL=3
/// Controls-menu category grouping the movement bindings.
const C_MOVEMENT=0
/// Controls-menu category grouping the looking bindings.
const C_LOOKING=1
/// Controls-menu category grouping the weapons bindings.
const C_WEAPONS=2
/// Controls-menu category grouping the misc bindings.
const C_MISC=3
/// Number of controls-menu categories, used to bound category-indexed tables.
const C_MAX=4
/// Menu control identifier routed to the movement action by the menu event handler.
const ID_MOVEMENT=100
/// Menu control identifier routed to the looking action by the menu event handler.
const ID_LOOKING=101
/// Menu control identifier routed to the weapons action by the menu event handler.
const ID_WEAPONS=102
/// Menu control identifier routed to the misc action by the menu event handler.
const ID_MISC=103
/// Menu control identifier routed to the defaults action by the menu event handler.
const ID_DEFAULTS=104
/// Event identifier of the Back control used to leave the controls and key-bindings menu and return to
/// its parent menu.
const ID_BACK=105
/// Menu control identifier routed to the saveandexit action by the menu event handler.
const ID_SAVEANDEXIT=106
/// Menu control identifier routed to the exit action by the menu event handler.
const ID_EXIT=107
/// Menu control identifier routed to the freelook action by the menu event handler.
const ID_FREELOOK=34
/// Menu control identifier routed to the invertmouse action by the menu event handler.
const ID_INVERTMOUSE=35
/// Menu control identifier routed to the alwaysrun action by the menu event handler.
const ID_ALWAYSRUN=36
/// Menu control identifier routed to the autoswitch action by the menu event handler.
const ID_AUTOSWITCH=37
/// Menu control identifier routed to the mousespeed action by the menu event handler.
const ID_MOUSESPEED=38
/// Menu control identifier routed to the joyenable action by the menu event handler.
const ID_JOYENABLE=39
/// Menu control identifier routed to the joythreshold action by the menu event handler.
const ID_JOYTHRESHOLD=40
/// Menu control identifier routed to the smoothmouse action by the menu event handler.
const ID_SMOOTHMOUSE=41
/// Menu callback event reporting that the item was gotfocus.
const QM_GOTFOCUS=1
/// Menu callback event reporting that the item was lostfocus.
const QM_LOSTFOCUS=2
/// Activation callback event accepted by the controls and key-bindings menu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=27
/// Engine key code for the backspace input, used by menu and client key-event handling.
const K_BACKSPACE=127
/// Engine key code for the del input, used by menu and client key-event handling.
const K_DEL=140
/// Engine key code for the kp del input, used by menu and client key-event handling.
const K_KP_DEL=171
/// Engine key code for the mouse2 input, used by menu and client key-event handling.
const K_MOUSE2=179
/// Engine key code for the char flag input, used by menu and client key-event handling.
const K_CHAR_FLAG=1024
/// Controls-menu player-preview selector for the idle animation or weapon pose.
const ANIM_IDLE=0
/// Controls-menu player-preview selector for the run animation or weapon pose.
const ANIM_RUN=1
/// Controls-menu player-preview selector for the walk animation or weapon pose.
const ANIM_WALK=2
/// Controls-menu player-preview selector for the back animation or weapon pose.
const ANIM_BACK=3
/// Controls-menu player-preview selector for the jump animation or weapon pose.
const ANIM_JUMP=4
/// Controls-menu player-preview selector for the crouch animation or weapon pose.
const ANIM_CROUCH=5
/// Controls-menu player-preview selector for the stepleft animation or weapon pose.
const ANIM_STEPLEFT=6
/// Controls-menu player-preview selector for the stepright animation or weapon pose.
const ANIM_STEPRIGHT=7
/// Controls-menu player-preview selector for the turnleft animation or weapon pose.
const ANIM_TURNLEFT=8
/// Controls-menu player-preview selector for the turnright animation or weapon pose.
const ANIM_TURNRIGHT=9
/// Controls-menu player-preview selector for the lookup animation or weapon pose.
const ANIM_LOOKUP=10
/// Controls-menu player-preview selector for the lookdown animation or weapon pose.
const ANIM_LOOKDOWN=11
/// Controls-menu player-preview selector for the weapon1 animation or weapon pose.
const ANIM_WEAPON1=12
/// Controls-menu player-preview selector for the weapon2 animation or weapon pose.
const ANIM_WEAPON2=13
/// Controls-menu player-preview selector for the weapon3 animation or weapon pose.
const ANIM_WEAPON3=14
/// Controls-menu player-preview selector for the weapon4 animation or weapon pose.
const ANIM_WEAPON4=15
/// Controls-menu player-preview selector for the weapon5 animation or weapon pose.
const ANIM_WEAPON5=16
/// Controls-menu player-preview selector for the weapon6 animation or weapon pose.
const ANIM_WEAPON6=17
/// Controls-menu player-preview selector for the weapon7 animation or weapon pose.
const ANIM_WEAPON7=18
/// Controls-menu player-preview selector for the weapon8 animation or weapon pose.
const ANIM_WEAPON8=19
/// Controls-menu player-preview selector for the weapon9 animation or weapon pose.
const ANIM_WEAPON9=20
/// Controls-menu player-preview selector for the weapon10 animation or weapon pose.
const ANIM_WEAPON10=21
/// Controls-menu player-preview selector for the attack animation or weapon pose.
const ANIM_ATTACK=22
/// Controls-menu player-preview selector for the gesture animation or weapon pose.
const ANIM_GESTURE=23
/// Controls-menu player-preview selector for the die animation or weapon pose.
const ANIM_DIE=24
/// Controls-menu player-preview selector for the chat animation or weapon pose.
const ANIM_CHAT=25

/// Native lower-body animation slot for the walk sequence.
const LEGS_WALK=14
/// Native lower-body animation slot for the run sequence.
const LEGS_RUN=15
/// Native lower-body animation slot for the back sequence.
const LEGS_BACK=16
/// Native lower-body animation slot for the jump sequence.
const LEGS_JUMP=18
/// Native lower-body animation slot for the idle sequence.
const LEGS_IDLE=22
/// Native lower-body animation slot for the idlecr sequence.
const LEGS_IDLECR=23
/// Native upper-body animation slot for the gesture sequence.
const TORSO_GESTURE=6
/// Native upper-body animation slot for the attack sequence.
const TORSO_ATTACK=7
/// Native upper-body animation slot for the stand sequence.
const TORSO_STAND=11
/// Native whole-body animation slot for the death1 sequence.
const BOTH_DEATH1=0
/// Native weapon identifier selecting no selected weapon.
const WP_NONE=0
/// Native weapon identifier selecting the gauntlet.
const WP_GAUNTLET=1
/// Native weapon identifier selecting the machine gun.
const WP_MACHINEGUN=2
/// Native weapon identifier selecting the shotgun.
const WP_SHOTGUN=3
/// Native weapon identifier selecting the grenade launcher.
const WP_GRENADE_LAUNCHER=4
/// Native weapon identifier selecting the rocket launcher.
const WP_ROCKET_LAUNCHER=5
/// Native weapon identifier selecting the lightning gun.
const WP_LIGHTNING=6
/// Native weapon identifier selecting the railgun.
const WP_RAILGUN=7
/// Native weapon identifier selecting the plasma gun.
const WP_PLASMAGUN=8
/// Native weapon identifier selecting the BFG.
const WP_BFG=9
/// Native weapon identifier selecting the grappling hook.
const WP_GRAPPLING_HOOK=10

/// Virtual shader or image asset name used for the menu's back0 artwork.
const ART_BACK0="menu/art/back_0"
/// Virtual shader or image asset name used for the menu's back1 artwork.
const ART_BACK1="menu/art/back_1"
/// Virtual shader or image asset name used for the menu's framel artwork.
const ART_FRAMEL="menu/art/frame2_l"
/// Virtual shader or image asset name used for the menu's framer artwork.
const ART_FRAMER="menu/art/frame1_r"

/// Stores UI controls binding record, including `command`, `label`, `id`, `anim`, `default1`, `default2` and additional values.
struct Binding
  /// When constructing this record, `binding` supplies `command` for this member.
  command
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Control identifier linking this command binding to the corresponding entry in the controls menu.
  id
  /// When constructing this record, `binding` supplies `anim` for this member.
  anim
  /// When constructing this record, `binding` supplies `key` for this member.
  default1
  /// When constructing this record, `binding` supplies `-1` for this member.
  default2
  /// When constructing this record, `binding` supplies `-1` for this member.
  bind1
  /// When constructing this record, `binding` supplies `-1` for this member.
  bind2
end struct
/// Stores UI controls config record, including `name`, `defaultValue`, `value`.
struct Config
  /// Engine configuration-variable name used to read, update, or register this setting.
  name
  /// When constructing this record, `initCvars` supplies `fallback` for this member.
  defaultValue
  /// Current or default setting value held by this configuration variable or UI control.
  value
end struct
/// Stores UI controls control record, including `id`, `group`, `visible`, `inactive`, `grayed`, `highlighted` and additional values.
struct Control
  /// Event-routing identifier of this selectable control in the controls and key-bindings menu.
  id
  /// Controls-menu section to which this binding belongs, as selected by the control identifier.
  group
  /// True when the record is eligible for the current drawing or browser-display pass.
  visible
  /// When constructing this record, `makeControls` supplies `true` for this member.
  inactive
  /// When constructing this record, `makeControls` supplies `true` for this member.
  grayed
  /// When constructing this record, `makeControls` supplies `false` for this member.
  highlighted
  /// Horizontal position of this menu control in the virtual layout used by the controls and
  /// key-bindings menu.
  x
  /// Vertical position of this menu control in the virtual layout used by the controls and key-bindings
  /// menu.
  y
end struct
/// Stores UI controls draw binding record, including `label`, `keys`, `selected`, `grayed`, `waiting`.
struct DrawBinding
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// When constructing this record, `drawKeyBinding` supplies `"???"` for this member.
  keys
  /// Current selection state or selected entry retained by the owning UI control.
  selected
  /// When constructing this record, `drawKeyBinding` supplies `true` for this member.
  grayed
  /// When constructing this record, `drawKeyBinding` supplies `state.waitingForKey` for this member.
  waiting
end struct
/// Stores UI controls queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `number` and additional values.
struct Action
  /// Host service category recorded with a request emitted while applying key bindings and mouse or
  /// movement settings.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while applying key bindings
  /// and mouse or movement settings.
  kind
  /// Binding command, key name, cvar, preview model, or menu resource targeted by the controls action.
  name
  /// Binding value, control-setting value, help message, or command text emitted by the controls menu.
  text
  /// Value payload supplied to the selected host operation while applying key bindings and mouse or
  /// movement settings.
  value
  /// Numeric argument interpreted by the selected host operation while applying key bindings and mouse
  /// or movement settings.
  number
  /// True when this request is marked for native dispatch while applying key bindings and mouse or
  /// movement settings; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI controls state, including `keyState`, `bindings`, `configs`, `controls`, `section`, `waitingForKey` and additional values.
struct State
  /// When constructing this record, `create` supplies `keys.create()` for this member. Used by
  /// `getKeyAssignment` and `setKey` during subsequent processing.
  keyState
  /// Key-to-command associations available to the UI controls editor.
  bindings
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `initCvars` and `getCvarDefault` during subsequent processing.
  configs
  /// When constructing this record, `create` supplies `makeControls()` for this member. Used by
  /// `control` and `update` during subsequent processing.
  controls
  /// When constructing this record, `create` supplies `C_LOOKING` for this member. Used by `update` and
  /// `menuEvent` during subsequent processing.
  section
  /// When constructing this record, `create` supplies `false` for this member. Used by `update` and
  /// `drawKeyBinding` during subsequent processing.
  waitingForKey
  /// When constructing this record, `create` supplies `false` for this member. Used by `menuKey` and
  /// `resetDefaultsAction` during subsequent processing.
  changesMade
  /// When constructing this record, `create` supplies `0` for this member. Used by `update` and
  /// `menuKey` during subsequent processing.
  cursorId
  /// When constructing this record, `create` supplies an empty list for this member. Used by `cvar` and
  /// `setCvar` during subsequent processing.
  cvarValues
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `defaultCvar` during subsequent processing.
  cvarDefaults
  /// When constructing this record, `create` supplies an empty list for this member. Used by `setting`
  /// and `setSetting` during subsequent processing.
  settings
  /// Host requests queued while applying key bindings and mouse or movement settings, retained in
  /// request order.
  actions
  /// True when the retail QVM owns the controls and key-bindings menu, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
  /// Model resource selected for the player presentation.
  playerModel
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `menuInit` during subsequent processing.
  playerName
  /// When constructing this record, `create` supplies `[0.0,150.0,0.0]` for this member. Used by
  /// `updateModel` during subsequent processing.
  playerViewangles
  /// When constructing this record, `create` supplies `[0.0,150.0,0.0]` for this member. Used by
  /// `updateModel` during subsequent processing.
  playerMoveangles
  /// When constructing this record, `create` supplies `LEGS_IDLE` for this member. Used by
  /// `updateModel` during subsequent processing.
  playerLegs
  /// When constructing this record, `create` supplies `TORSO_STAND` for this member. Used by
  /// `updateModel` during subsequent processing.
  playerTorso
  /// When constructing this record, `create` supplies `-1` for this member. Used by `updateModel`
  /// during subsequent processing.
  playerWeapon
  /// When constructing this record, `create` supplies `false` for this member. Used by `updateModel`
  /// during subsequent processing.
  playerChat
  /// Records that the controls and key-bindings menu has been opened on the active menu stack.
  pushed
  /// True once the module's required media has been cached or registered.
  cached
  /// Model resources selected for the weapon presentation.
  weaponModels
  /// Menu-stack and selection events queued for the host adapter.
  menuEvents
end struct

/// Creates a `mq3.client.ui_controls.Binding` record. Assigns `command` from `command`, `label` from `label`, `id` from `id`, `anim` from `anim`.
/// @param command Value used to initialize `Binding.command`.
/// @param label Value used to initialize `Binding.label`.
/// @param id Value used to initialize `Binding.id`.
/// @param anim Value used to initialize `Binding.anim`.
/// @param key Value used to initialize `Binding.default1`.
function binding(command,label,id,anim,key) return Binding(command,label,id,anim,key,-1,-1,-1) end function
/// Builds the UI controls `defaultBindings` sequence from `[binding("+scores","show scores",0,ANIM_IDLE,9),binding("+button2","use item",1,ANIM_IDLE,13),binding("+speed","run / walk",2,ANIM_RUN,138),binding("+forward","walk forward",3,ANIM_WALK,132),bindin...`.
function defaultBindings()
  return [binding("+scores","show scores",0,ANIM_IDLE,9),binding("+button2","use item",1,ANIM_IDLE,13),binding("+speed","run / walk",2,ANIM_RUN,138),binding("+forward","walk forward",3,ANIM_WALK,132),binding("+back","backpedal",4,ANIM_BACK,133),binding("+moveleft","step left",5,ANIM_STEPLEFT,44),binding("+moveright","step right",6,ANIM_STEPRIGHT,46),binding("+moveup","up / jump",7,ANIM_JUMP,32),binding("+movedown","down / crouch",8,ANIM_CROUCH,99),binding("+left","turn left",9,ANIM_TURNLEFT,134),binding("+right","turn right",10,ANIM_TURNRIGHT,135),binding("+strafe","sidestep / turn",11,ANIM_IDLE,136),binding("+lookup","look up",12,ANIM_LOOKUP,141),binding("+lookdown","look down",13,ANIM_LOOKDOWN,140),binding("+mlook","mouse look",14,ANIM_IDLE,47),binding("centerview","center view",15,ANIM_IDLE,144),binding("+zoom","zoom view",16,ANIM_IDLE,-1),binding("weapon 1","gauntlet",17,ANIM_WEAPON1,49),binding("weapon 2","machinegun",18,ANIM_WEAPON2,50),binding("weapon 3","shotgun",19,ANIM_WEAPON3,51),binding("weapon 4","grenade launcher",20,ANIM_WEAPON4,52),binding("weapon 5","rocket launcher",21,ANIM_WEAPON5,53),binding("weapon 6","lightning",22,ANIM_WEAPON6,54),binding("weapon 7","railgun",23,ANIM_WEAPON7,55),binding("weapon 8","plasma gun",24,ANIM_WEAPON8,56),binding("weapon 9","BFG",25,ANIM_WEAPON9,57),binding("+attack","attack",26,ANIM_ATTACK,137),binding("weapprev","prev weapon",27,ANIM_IDLE,91),binding("weapnext","next weapon",28,ANIM_IDLE,93),binding("+button3","gesture",29,ANIM_GESTURE,180),binding("messagemode","chat",30,ANIM_CHAT,116),binding("messagemode2","chat - team",31,ANIM_CHAT,-1),binding("messagemode3","chat - target",32,ANIM_CHAT,-1),binding("messagemode4","chat - attacker",33,ANIM_CHAT,-1)]
end function
/// Evaluates UI controls `groupFor` and returns `C_MOVEMENT`, `C_LOOKING`, `C_WEAPONS` and additional values according to its guard/selection conditions.
/// @param id Value used by `if id==ID_ALWAYSRUN or (id>=2 and id<=11) then return C_MOVEMENT end if`.
function groupFor(id)
  if id==ID_ALWAYSRUN or (id>=2 and id<=11) then return C_MOVEMENT end if
  if id==ID_MOUSESPEED or id==ID_SMOOTHMOUSE or id==ID_INVERTMOUSE or (id>=12 and id<=16) or id==ID_FREELOOK or id==ID_JOYENABLE or id==ID_JOYTHRESHOLD then return C_LOOKING end if
  if id==ID_AUTOSWITCH or (id>=17 and id<=28) then return C_WEAPONS end if
  return C_MISC
end function
/// Calls `mq3.client.ui_controls.Control`, `mq3.client.ui_controls.groupFor` from UI controls `makeControls`. The final path returns `result`.
function makeControls() result=[];for id=0 to 41 result=result+[Control(id,groupFor(id),false,true,true,false,320,0)] end for;return result end function
/// Creates a `mq3.client.ui_controls.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive)
  return State(keys.create(),defaultBindings(),[],makeControls(),C_LOOKING,false,false,0,[],[],[],[],retailActive,"","",[0.0,150.0,0.0],[0.0,150.0,0.0],LEGS_IDLE,TORSO_STAND,-1,false,false,false,[],[])
end function
/// Appends a UI controls action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI controls record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI controls resource.
/// @param text Text consumed or emitted by `emit` in the UI controls path.
/// @param value Value used by `item=Action("ui-controls",kind,name,text,value,number,not state.retailActive)`.
/// @param number Value used by `item=Action("ui-controls",kind,name,text,value,number,not state.retailActive)`.
function emit(state,kind,name,text,value,number) item=Action("ui-controls",kind,name,text,value,number,not state.retailActive);state.actions=state.actions+[item];return item end function
/// Compares two UI controls names using ASCII case-insensitive equality.
/// @param a Argument 1 of `std.string.equalsIgnoreCaseAscii`.
/// @param b Argument 2 of `std.string.equalsIgnoreCaseAscii`.
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
/// Evaluates UI controls `clean` and returns `result` according to its guard/selection conditions.
/// @param value Sequence read at `value[at]`, `value[at+1]`.
function clean(value) result="";at=0;while at<len(value) if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else result=result+value[at];at=at+1 end if end while;return result end function
/// Evaluates UI controls `pairGet` and returns `pair[1]`, `fallback` according to its guard/selection conditions.
/// @param pairs Value used by `for each pair in pairs if pair[0]==name then return pair[1] end if end for`.
/// @param name Name used to select or register the corresponding UI controls resource.
/// @param fallback Value used by `return fallback`.
function pairGet(pairs,name,fallback) for each pair in pairs if pair[0]==name then return pair[1] end if end for;return fallback end function
/// Evaluates UI controls `pairSet` and returns `result+[[name,value]]` according to its guard/selection conditions.
/// @param pairs Value used by `for each pair in pairs if pair[0]!=name then result=result+[pair] end if end for`.
/// @param name Name used to select or register the corresponding UI controls resource.
/// @param value Value used by `return result+[[name,value]]`.
function pairSet(pairs,name,value) result=[];for each pair in pairs if pair[0]!=name then result=result+[pair] end if end for;return result+[[name,value]] end function
/// Adapts `mq3.client.ui_controls.pairGet` to UI controls `cvar`, returning its result for `state.cvarValues, name, "0"`.
/// @param state Record read through `state.cvarValues`.
/// @param name Argument 2 of `mq3.client.ui_controls.pairGet`.
function cvar(state,name) return pairGet(state.cvarValues,name,"0") end function
/// Updates `state.cvarValues` during UI controls `setCvar`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.cvarValues`.
/// @param name Name used to select or register the corresponding UI controls resource.
/// @param value Value used by `state.cvarValues=pairSet(state.cvarValues,name,str(value))`.
function setCvar(state,name,value) state.cvarValues=pairSet(state.cvarValues,name,str(value));emit(state,"set-cvar",name,str(value),value,0);return void end function
/// Adapts `mq3.client.ui_controls.pairGet` to UI controls `defaultCvar`, returning its result for `state.cvarDefaults, name, "0"`.
/// @param state Record read through `state.cvarDefaults`.
/// @param name Argument 2 of `mq3.client.ui_controls.pairGet`.
function defaultCvar(state,name) return pairGet(state.cvarDefaults,name,"0") end function
/// Adapts `mq3.client.ui_controls.pairGet` to UI controls `setting`, returning its result for `state.settings, name, 0.0`.
/// @param state Record read through `state.settings`.
/// @param name Argument 2 of `mq3.client.ui_controls.pairGet`.
function setting(state,name) return pairGet(state.settings,name,0.0) end function
/// Updates `state.settings` during UI controls `setSetting`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.settings`.
/// @param name Name used to select or register the corresponding UI controls resource.
/// @param value Value used by `state.settings=pairSet(state.settings,name,value)`.
function setSetting(state,name,value) state.settings=pairSet(state.settings,name,value);return value end function
/// Clamps `low` to the inclusive bounds `high` and `value` for UI controls.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
function clamp(low,high,value) if value<low then return low end if;if value>high then return high end if;return value end function
/// Evaluates UI controls `control` and returns `state.controls[id]`, `void` according to its guard/selection conditions.
/// @param state Record read through `state.controls`.
/// @param id Value used by `if id>=0 and id<len(state.controls) then return state.controls[id] end if`.
function control(state,id) if id>=0 and id<len(state.controls) then return state.controls[id] end if;return void end function
/// Evaluates UI controls `actionBinding` and returns `state.bindings[id]`, `void` according to its guard/selection conditions.
/// @param state Record read through `state.bindings`.
/// @param id Value used by `if id>=0 and id<len(state.bindings) then return state.bindings[id] end if`.
function actionBinding(state,id) if id>=0 and id<len(state.bindings) then return state.bindings[id] end if;return void end function

// Controls_InitCvars / Controls_GetCvarDefault / Controls_GetCvarValue
/// @param state Mutable UI controls record/storage; this routine assigns `state.configs`.
function initCvars(state)
  state.configs=[];for each name in ["cl_run","m_pitch","cg_autoswitch","sensitivity","in_joystick","joy_threshold","m_filter","cl_freelook"] current=numbers.atof(cvar(state,name));fallback=numbers.atof(defaultCvar(state,name));state.configs=state.configs+[Config(name,fallback,current)];emit(state,"reset-cvar",name,"",fallback,0);emit(state,"set-cvar",name,str(current),current,0) end for;return len(state.configs)
end function
/// Evaluates UI controls `getCvarDefault` and returns `item.defaultValue`, `0.0` according to its guard/selection conditions.
/// @param state Record read through `state.configs`.
/// @param name Name used to select or register the corresponding UI controls resource.
function getCvarDefault(state,name) for each item in state.configs if item.name==name then return item.defaultValue end if end for;return 0.0 end function
/// Evaluates UI controls `getCvarValue` and returns `item.value`, `0.0` according to its guard/selection conditions.
/// @param state Record read through `state.configs`.
/// @param name Name used to select or register the corresponding UI controls resource.
function getCvarValue(state,name) for each item in state.configs if item.name==name then return item.value end if end for;return 0.0 end function

// Controls_UpdateModel
/// @param state Mutable UI controls record/storage; this routine assigns `state.playerViewangles`, `state.playerMoveangles`, `state.playerLegs`, `state.playerTorso` and additional values.
/// @param anim Value used by `switch anim`.
function updateModel(state,anim)
  state.playerViewangles=[0.0,150.0,0.0];state.playerMoveangles=[0.0,150.0,0.0];state.playerLegs=LEGS_IDLE;state.playerTorso=TORSO_STAND;state.playerWeapon=-1;state.playerChat=false
  switch anim
    case ANIM_RUN state.playerLegs=LEGS_RUN end case
    case ANIM_WALK state.playerLegs=LEGS_WALK end case
    case ANIM_BACK state.playerLegs=LEGS_BACK end case
    case ANIM_JUMP state.playerLegs=LEGS_JUMP end case
    case ANIM_CROUCH state.playerLegs=LEGS_IDLECR end case
    case ANIM_TURNLEFT state.playerViewangles[1]=state.playerViewangles[1]+90.0 end case
    case ANIM_TURNRIGHT state.playerViewangles[1]=state.playerViewangles[1]-90.0 end case
    case ANIM_STEPLEFT state.playerLegs=LEGS_WALK;state.playerMoveangles[1]=state.playerViewangles[1]+90.0 end case
    case ANIM_STEPRIGHT state.playerLegs=LEGS_WALK;state.playerMoveangles[1]=state.playerViewangles[1]-90.0 end case
    case ANIM_LOOKUP state.playerViewangles[0]=-45.0 end case
    case ANIM_LOOKDOWN state.playerViewangles[0]=45.0 end case
    case ANIM_WEAPON1 state.playerWeapon=WP_GAUNTLET end case
    case ANIM_WEAPON2 state.playerWeapon=WP_MACHINEGUN end case
    case ANIM_WEAPON3 state.playerWeapon=WP_SHOTGUN end case
    case ANIM_WEAPON4 state.playerWeapon=WP_GRENADE_LAUNCHER end case
    case ANIM_WEAPON5 state.playerWeapon=WP_ROCKET_LAUNCHER end case
    case ANIM_WEAPON6 state.playerWeapon=WP_LIGHTNING end case
    case ANIM_WEAPON7 state.playerWeapon=WP_RAILGUN end case
    case ANIM_WEAPON8 state.playerWeapon=WP_PLASMAGUN end case
    case ANIM_WEAPON9 state.playerWeapon=WP_BFG end case
    case ANIM_WEAPON10 state.playerWeapon=WP_GRAPPLING_HOOK end case
    case ANIM_ATTACK state.playerTorso=TORSO_ATTACK end case
    case ANIM_GESTURE state.playerTorso=TORSO_GESTURE end case
    case ANIM_DIE state.playerLegs=BOTH_DEATH1;state.playerTorso=BOTH_DEATH1;state.playerWeapon=WP_NONE end case
    case ANIM_CHAT state.playerChat=true end case
  end switch
  emit(state,"player-info","animation","",anim,state.playerWeapon);return state
end function

// Controls_Update
/// @param section Value used by `if section==C_MOVEMENT then return [36,2,3,4,5,6,7,8,9,10,11] end if`.
function groupIds(section)
  if section==C_MOVEMENT then return [36,2,3,4,5,6,7,8,9,10,11] end if
  if section==C_LOOKING then return [38,41,35,12,13,14,34,15,16,39,40] end if
  if section==C_WEAPONS then return [26,28,27,37,17,18,19,20,21,22,23,24,25] end if
  return [0,1,29,30,31,32,33]
end function
/// Calls `mq3.client.ui_controls.groupIds`, `mq3.client.ui_controls.control` from UI controls `update`. The final path returns `len(active)`.
/// @param state Record read through `state.controls`, `state.section`, `state.waitingForKey`, `state.cursorId`.
function update(state)
  for each item in state.controls item.visible=false;item.inactive=true;item.grayed=true;item.highlighted=false end for;active=groupIds(state.section);y=(480-len(active)*16)/2;for each id in active item=control(state,id);item.visible=true;item.inactive=false;item.grayed=false;item.x=320;item.y=y;y=y+16 end for
  if state.waitingForKey then for each item in state.controls item.grayed=true end for;selected=control(state,state.cursorId);if selected!=void then selected.grayed=false end if;return len(active) end if
  for each item in state.controls if item.visible then item.grayed=false end if end for;return len(active)
end function

// Controls_DrawKeyBinding / Controls_StatusBar / Controls_DrawPlayer
/// @param state Record read through `state.waitingForKey`.
/// @param id Value used by `item=actionBinding(state,id)`.
/// @param selected Value used by `if item==void then return DrawBinding("","???",selected,true,state.waitingForKey) end if`.
function drawKeyBinding(state,id,selected)
  item=actionBinding(state,id);if item==void then return DrawBinding("","???",selected,true,state.waitingForKey) end if;text="???";if item.bind1!=-1 then text=strings.toUpperAscii(keys.keynumToString(item.bind1));if item.bind2!=-1 then text=text+" or "+strings.toUpperAscii(keys.keynumToString(item.bind2)) end if end if;entry=control(state,id);gray=false;if entry!=void then gray=entry.grayed end if;emit(state,"draw-binding",item.command,item.label+"="+text,0.0,id);if selected then if state.waitingForKey then emit(state,"status","waiting","Waiting for new key ... ESCAPE to cancel",0.0,id) else emit(state,"status","change","Press ENTER or CLICK to change / Press BACKSPACE to clear",0.0,id) end if end if;return DrawBinding(item.label,text,selected,gray,state.waitingForKey)
end function
/// Calls `mq3.client.ui_controls.emit` from UI controls `statusBar`. The final path returns `"Use Arrow Keys or CLICK to change"`.
/// @param state Shared UI controls state passed to the helper calls in `statusBar`.
function statusBar(state) emit(state,"status","controls","Use Arrow Keys or CLICK to change",0.0,0);return "Use Arrow Keys or CLICK to change" end function
/// Updates `state.playerModel` during UI controls `drawPlayer`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.playerModel`.
/// @param model Value assigned to `state.playerModel`.
/// @param realtime Current client real-time clock in milliseconds.
function drawPlayer(state,model,realtime) if model!=state.playerModel then state.playerModel=model;emit(state,"player-model",model,"",0.0,0);updateModel(state,ANIM_IDLE) end if;emit(state,"draw-player",model,"",realtime/2.0,0);return state.playerModel end function

// Controls_GetKeyAssignment / Controls_GetConfig
/// @param state Record read through `state.keyState`.
/// @param command Value used by `if value!="" and same(value,command) then result[count]=key`.
function getKeyAssignment(state,command) result=[-1,-1];count=0;for key=0 to 255 value=keys.getBinding(state.keyState,key);if value!="" and same(value,command) then result[count]=key;count=count+1;if count==2 then break end if end if end for;return result end function
/// Calls `mq3.client.ui_controls.getKeyAssignment`, `mq3.client.ui_controls.setSetting`, `mq3.client.ui_controls.getCvarValue` and additional helpers from UI controls `getConfig`. The final path returns `state`.
/// @param state Record read through `state.bindings`.
function getConfig(state)
  for each item in state.bindings assigned=getKeyAssignment(state,item.command);item.bind1=assigned[0];item.bind2=assigned[1] end for
  setSetting(state,"invertmouse",getCvarValue(state,"m_pitch")<0.0);setSetting(state,"smoothmouse",clamp(0.0,1.0,getCvarValue(state,"m_filter")));setSetting(state,"alwaysrun",clamp(0.0,1.0,getCvarValue(state,"cl_run")));setSetting(state,"autoswitch",clamp(0.0,1.0,getCvarValue(state,"cg_autoswitch")));setSetting(state,"sensitivity",clamp(2.0,30.0,getCvarValue(state,"sensitivity")));setSetting(state,"joyenable",clamp(0.0,1.0,getCvarValue(state,"in_joystick")));setSetting(state,"joythreshold",clamp(0.05,0.75,getCvarValue(state,"joy_threshold")));setSetting(state,"freelook",clamp(0.0,1.0,getCvarValue(state,"cl_freelook")));return state
end function
/// Calls `mq3.vm.cgame_key_traps.setBinding`, `mq3.client.ui_controls.emit`, `mq3.vm.cgame_key_traps.keynumToString` from UI controls `setKey`.
/// @param state Record read through `state.keyState`.
/// @param key Key or control identifier used to select the corresponding UI controls entry.
/// @param command Value used by `if key>=0 and key<256 then keys.setBinding(state.keyState,key,command) end if`.
function setKey(state,key,command) if key>=0 and key<256 then keys.setBinding(state.keyState,key,command) end if;emit(state,"set-binding",keys.keynumToString(key),command,0.0,key);return void end function

// Controls_SetConfig / Controls_SetDefaults
/// @param state Record read through `state.bindings`.
function setConfig(state)
  for each item in state.bindings if item.bind1!=-1 then setKey(state,item.bind1,item.command);if item.bind2!=-1 then setKey(state,item.bind2,item.command) end if end if end for
  pitch=numbers.atof(cvar(state,"m_pitch"));if pitch<0.0 then pitch=-pitch end if;if setting(state,"invertmouse") then pitch=-pitch end if;setCvar(state,"m_pitch",pitch);setCvar(state,"m_filter",setting(state,"smoothmouse"));setCvar(state,"cl_run",setting(state,"alwaysrun"));setCvar(state,"cg_autoswitch",setting(state,"autoswitch"));setCvar(state,"sensitivity",setting(state,"sensitivity"));setCvar(state,"in_joystick",setting(state,"joyenable"));setCvar(state,"joy_threshold",setting(state,"joythreshold"));setCvar(state,"cl_freelook",setting(state,"freelook"));emit(state,"execute","in_restart","in_restart\n",0.0,2);return true
end function
/// Calls `mq3.client.ui_controls.setSetting`, `mq3.client.ui_controls.getCvarDefault` from UI controls `setDefaults`. The final path returns `state`.
/// @param state Record read through `state.bindings`.
function setDefaults(state)
  for each item in state.bindings item.bind1=item.default1;item.bind2=item.default2 end for;setSetting(state,"invertmouse",getCvarDefault(state,"m_pitch")<0.0);setSetting(state,"smoothmouse",getCvarDefault(state,"m_filter"));setSetting(state,"alwaysrun",getCvarDefault(state,"cl_run"));setSetting(state,"autoswitch",getCvarDefault(state,"cg_autoswitch"));setSetting(state,"sensitivity",getCvarDefault(state,"sensitivity"));setSetting(state,"joyenable",getCvarDefault(state,"in_joystick"));setSetting(state,"joythreshold",getCvarDefault(state,"joy_threshold"));setSetting(state,"freelook",getCvarDefault(state,"cl_freelook"));return state
end function

// Controls_MenuKey
/// @param state Mutable UI controls record/storage; this routine assigns `state.waitingForKey`, `state.changesMade`.
/// @param key Value assigned to `item.bind1`, `item.bind2`.
function menuKey(state,key)
  if not state.waitingForKey then
    if key==K_BACKSPACE or key==K_DEL or key==K_KP_DEL then
      key=-1
    else
      if key==K_MOUSE2 or key==K_ESCAPE then if state.changesMade then setConfig(state) end if end if
      emit(state,"default-key","",str(key),0.0,key);return "default"
    end if
  else
    if (key&K_CHAR_FLAG)!=0 then emit(state,"default-key","",str(key),0.0,key);return "default" end if
    if key==K_ESCAPE then state.waitingForKey=false;update(state);return "menu-out" end if
    if key==96 then emit(state,"default-key","",str(key),0.0,key);return "default" end if
  end if
  state.changesMade=true;if key!=-1 then for each item in state.bindings if item.bind2==key then item.bind2=-1 end if;if item.bind1==key then item.bind1=item.bind2;item.bind2=-1 end if end for end if
  item=actionBinding(state,state.cursorId);found=item!=void
  if found then
    if key==-1 then
      if item.bind1!=-1 then setKey(state,item.bind1,"");item.bind1=-1 end if
      if item.bind2!=-1 then setKey(state,item.bind2,"");item.bind2=-1 end if
    else
      if item.bind1==-1 then
        item.bind1=key
      else
        if item.bind1!=key and item.bind2==-1 then
          item.bind2=key
        else
          setKey(state,item.bind1,"");setKey(state,item.bind2,"");item.bind1=key;item.bind2=-1
        end if
      end if
    end if
  end if
  state.waitingForKey=false;if found then update(state);return "menu-out" end if;emit(state,"default-key","",str(key),0.0,key);return "default"
end function

// Reset/default confirmation and menu callbacks.
/// @param state Mutable UI controls record/storage; this routine assigns `state.changesMade`.
/// @param result Value used by `if not result then return false end if`.
function resetDefaultsAction(state,result) if not result then return false end if;state.changesMade=true;setDefaults(state);update(state);return true end function
/// Calls `mq3.client.ui_controls.emit` from UI controls `resetDefaultsDraw`. The final path returns `lines`.
/// @param state Shared UI controls state passed to the helper calls in `resetDefaultsDraw`.
function resetDefaultsDraw(state) lines=["WARNING: This will reset all","controls to their default values."];emit(state,"text","warning",lines[0],0.0,0);emit(state,"text","warning",lines[1],0.0,1);return lines end function
/// Updates `state.section`, `state.menuEvents`, `state.changesMade` during UI controls `menuEvent`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.section`, `state.menuEvents`, `state.changesMade`.
/// @param id Value used by `if id==ID_MOVEMENT then state.section=C_MOVEMENT`.
/// @param event Event identifier compared with the supported activation/input events.
function menuEvent(state,id,event)
  if event!=QM_ACTIVATED then return false end if
  if id==ID_MOVEMENT then state.section=C_MOVEMENT;update(state);return true else if id==ID_LOOKING then state.section=C_LOOKING;update(state);return true else if id==ID_WEAPONS then state.section=C_WEAPONS;update(state);return true else if id==ID_MISC then state.section=C_MISC;update(state);return true else if id==ID_DEFAULTS then state.menuEvents=state.menuEvents+[["confirm","SET TO DEFAULTS?"]];emit(state,"confirm","defaults","SET TO DEFAULTS?",0.0,0);return true else if id==ID_BACK then if state.changesMade then setConfig(state) end if;state.menuEvents=state.menuEvents+[["pop"]];return true else if id==ID_SAVEANDEXIT then setConfig(state);state.menuEvents=state.menuEvents+[["pop"]];return true else if id==ID_EXIT then state.menuEvents=state.menuEvents+[["pop"]];return true end if
  if id>=ID_FREELOOK and id<=ID_SMOOTHMOUSE then state.changesMade=true;return true end if;return false
end function
/// Updates `state.waitingForKey`, `state.cursorId` during UI controls `actionEvent`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.waitingForKey`, `state.cursorId`.
/// @param id Value assigned to `state.cursorId`.
/// @param event Event identifier compared with the supported activation/input events.
function actionEvent(state,id,event) item=actionBinding(state,id);if item==void then return false end if;if event==QM_LOSTFOCUS then updateModel(state,ANIM_IDLE);return true else if event==QM_GOTFOCUS then updateModel(state,item.anim);return true else if event==QM_ACTIVATED and not state.waitingForKey then state.waitingForKey=true;state.cursorId=id;update(state);return true end if;return false end function

// Controls_InitModel / Controls_InitWeapons / Controls_MenuInit
/// @param state Mutable UI controls record/storage; this routine assigns `state.playerModel`.
function initModel(state) state.playerModel=cvar(state,"model");emit(state,"player-model",state.playerModel,"",0.0,0);updateModel(state,ANIM_IDLE);return state.playerModel end function
/// Updates `state.weaponModels` during UI controls `initWeapons`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.weaponModels`.
/// @param models Value used by `for each model in models state.weaponModels=state.weaponModels+[model]`.
function initWeapons(state,models) state.weaponModels=[];for each model in models state.weaponModels=state.weaponModels+[model];emit(state,"register-model",model,"",0.0,0) end for;return len(state.weaponModels) end function
/// Updates `state.cached` during UI controls `cache`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.cached`.
function cache(state) for each asset in [ART_BACK0,ART_BACK1,ART_FRAMEL,ART_FRAMER] emit(state,"register-shader",asset,"",0.0,0) end for;state.cached=true;return 4 end function
/// Updates `state.bindings`, `state.controls`, `state.section`, `state.waitingForKey` and additional values during UI controls `menuInit`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.bindings`, `state.controls`, `state.section`, `state.waitingForKey` and additional values.
/// @param weaponModels Value used by `initWeapons(state,weaponModels)`.
function menuInit(state,weaponModels)
  state.bindings=defaultBindings();state.controls=makeControls();state.section=C_LOOKING;state.waitingForKey=false;state.changesMade=false;state.cursorId=0;state.actions=[];state.menuEvents=[];cache(state);state.playerName=clean(cvar(state,"name"));initCvars(state);getConfig(state);initModel(state);initWeapons(state,weaponModels);update(state);return state
end function
/// Updates `state.pushed`, `state.menuEvents` during UI controls `uiControlsMenu`.
/// @param state Mutable UI controls record/storage; this routine assigns `state.pushed`, `state.menuEvents`.
/// @param weaponModels Value used by `menuInit(state,weaponModels)`.
function uiControlsMenu(state,weaponModels) menuInit(state,weaponModels);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","controls","",0.0,0);return state end function
