// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_controls2.c.
package mq3.client.ui_controls

import mq3.vm.cgame_key_traps as keys
import mq3.compat.textnumbers as numbers
import std.string as strings

const SAVE_NOOP=0
const SAVE_YES=1
const SAVE_NO=2
const SAVE_CANCEL=3
const C_MOVEMENT=0
const C_LOOKING=1
const C_WEAPONS=2
const C_MISC=3
const C_MAX=4
const ID_MOVEMENT=100
const ID_LOOKING=101
const ID_WEAPONS=102
const ID_MISC=103
const ID_DEFAULTS=104
const ID_BACK=105
const ID_SAVEANDEXIT=106
const ID_EXIT=107
const ID_FREELOOK=34
const ID_INVERTMOUSE=35
const ID_ALWAYSRUN=36
const ID_AUTOSWITCH=37
const ID_MOUSESPEED=38
const ID_JOYENABLE=39
const ID_JOYTHRESHOLD=40
const ID_SMOOTHMOUSE=41
const QM_GOTFOCUS=1
const QM_LOSTFOCUS=2
const QM_ACTIVATED=3
const K_ESCAPE=27
const K_BACKSPACE=127
const K_DEL=140
const K_KP_DEL=171
const K_MOUSE2=179
const K_CHAR_FLAG=1024
const ANIM_IDLE=0
const ANIM_RUN=1
const ANIM_WALK=2
const ANIM_BACK=3
const ANIM_JUMP=4
const ANIM_CROUCH=5
const ANIM_STEPLEFT=6
const ANIM_STEPRIGHT=7
const ANIM_TURNLEFT=8
const ANIM_TURNRIGHT=9
const ANIM_LOOKUP=10
const ANIM_LOOKDOWN=11
const ANIM_WEAPON1=12
const ANIM_WEAPON2=13
const ANIM_WEAPON3=14
const ANIM_WEAPON4=15
const ANIM_WEAPON5=16
const ANIM_WEAPON6=17
const ANIM_WEAPON7=18
const ANIM_WEAPON8=19
const ANIM_WEAPON9=20
const ANIM_WEAPON10=21
const ANIM_ATTACK=22
const ANIM_GESTURE=23
const ANIM_DIE=24
const ANIM_CHAT=25

const LEGS_WALK=14
const LEGS_RUN=15
const LEGS_BACK=16
const LEGS_JUMP=18
const LEGS_IDLE=22
const LEGS_IDLECR=23
const TORSO_GESTURE=6
const TORSO_ATTACK=7
const TORSO_STAND=11
const BOTH_DEATH1=0
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

const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"
const ART_FRAMEL="menu/art/frame2_l"
const ART_FRAMER="menu/art/frame1_r"

struct Binding command label id anim default1 default2 bind1 bind2 end struct
struct Config name defaultValue value end struct
struct Control id group visible inactive grayed highlighted x y end struct
struct DrawBinding label keys selected grayed waiting end struct
struct Action boundary kind name text value number dispatched end struct
struct State keyState bindings configs controls section waitingForKey changesMade cursorId cvarValues cvarDefaults settings actions retailActive playerModel playerName playerViewangles playerMoveangles playerLegs playerTorso playerWeapon playerChat pushed cached weaponModels menuEvents end struct

function binding(command,label,id,anim,key) return Binding(command,label,id,anim,key,-1,-1,-1) end function
function defaultBindings()
  return [binding("+scores","show scores",0,ANIM_IDLE,9),binding("+button2","use item",1,ANIM_IDLE,13),binding("+speed","run / walk",2,ANIM_RUN,138),binding("+forward","walk forward",3,ANIM_WALK,132),binding("+back","backpedal",4,ANIM_BACK,133),binding("+moveleft","step left",5,ANIM_STEPLEFT,44),binding("+moveright","step right",6,ANIM_STEPRIGHT,46),binding("+moveup","up / jump",7,ANIM_JUMP,32),binding("+movedown","down / crouch",8,ANIM_CROUCH,99),binding("+left","turn left",9,ANIM_TURNLEFT,134),binding("+right","turn right",10,ANIM_TURNRIGHT,135),binding("+strafe","sidestep / turn",11,ANIM_IDLE,136),binding("+lookup","look up",12,ANIM_LOOKUP,141),binding("+lookdown","look down",13,ANIM_LOOKDOWN,140),binding("+mlook","mouse look",14,ANIM_IDLE,47),binding("centerview","center view",15,ANIM_IDLE,144),binding("+zoom","zoom view",16,ANIM_IDLE,-1),binding("weapon 1","gauntlet",17,ANIM_WEAPON1,49),binding("weapon 2","machinegun",18,ANIM_WEAPON2,50),binding("weapon 3","shotgun",19,ANIM_WEAPON3,51),binding("weapon 4","grenade launcher",20,ANIM_WEAPON4,52),binding("weapon 5","rocket launcher",21,ANIM_WEAPON5,53),binding("weapon 6","lightning",22,ANIM_WEAPON6,54),binding("weapon 7","railgun",23,ANIM_WEAPON7,55),binding("weapon 8","plasma gun",24,ANIM_WEAPON8,56),binding("weapon 9","BFG",25,ANIM_WEAPON9,57),binding("+attack","attack",26,ANIM_ATTACK,137),binding("weapprev","prev weapon",27,ANIM_IDLE,91),binding("weapnext","next weapon",28,ANIM_IDLE,93),binding("+button3","gesture",29,ANIM_GESTURE,180),binding("messagemode","chat",30,ANIM_CHAT,116),binding("messagemode2","chat - team",31,ANIM_CHAT,-1),binding("messagemode3","chat - target",32,ANIM_CHAT,-1),binding("messagemode4","chat - attacker",33,ANIM_CHAT,-1)]
end function
function groupFor(id)
  if id==ID_ALWAYSRUN or (id>=2 and id<=11) then return C_MOVEMENT end if
  if id==ID_MOUSESPEED or id==ID_SMOOTHMOUSE or id==ID_INVERTMOUSE or (id>=12 and id<=16) or id==ID_FREELOOK or id==ID_JOYENABLE or id==ID_JOYTHRESHOLD then return C_LOOKING end if
  if id==ID_AUTOSWITCH or (id>=17 and id<=28) then return C_WEAPONS end if
  return C_MISC
end function
function makeControls() result=[];for id=0 to 41 result=result+[Control(id,groupFor(id),false,true,true,false,320,0)] end for;return result end function
function create(retailActive)
  return State(keys.create(),defaultBindings(),[],makeControls(),C_LOOKING,false,false,0,[],[],[],[],retailActive,"","",[0.0,150.0,0.0],[0.0,150.0,0.0],LEGS_IDLE,TORSO_STAND,-1,false,false,false,[],[])
end function
function emit(state,kind,name,text,value,number) item=Action("ui-controls",kind,name,text,value,number,not state.retailActive);state.actions=state.actions+[item];return item end function
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
function clean(value) result="";at=0;while at<len(value) if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else result=result+value[at];at=at+1 end if end while;return result end function
function pairGet(pairs,name,fallback) for each pair in pairs if pair[0]==name then return pair[1] end if end for;return fallback end function
function pairSet(pairs,name,value) result=[];for each pair in pairs if pair[0]!=name then result=result+[pair] end if end for;return result+[[name,value]] end function
function cvar(state,name) return pairGet(state.cvarValues,name,"0") end function
function setCvar(state,name,value) state.cvarValues=pairSet(state.cvarValues,name,str(value));emit(state,"set-cvar",name,str(value),value,0);return void end function
function defaultCvar(state,name) return pairGet(state.cvarDefaults,name,"0") end function
function setting(state,name) return pairGet(state.settings,name,0.0) end function
function setSetting(state,name,value) state.settings=pairSet(state.settings,name,value);return value end function
function clamp(low,high,value) if value<low then return low end if;if value>high then return high end if;return value end function
function control(state,id) if id>=0 and id<len(state.controls) then return state.controls[id] end if;return void end function
function actionBinding(state,id) if id>=0 and id<len(state.bindings) then return state.bindings[id] end if;return void end function

// Controls_InitCvars / Controls_GetCvarDefault / Controls_GetCvarValue
function initCvars(state)
  state.configs=[];for each name in ["cl_run","m_pitch","cg_autoswitch","sensitivity","in_joystick","joy_threshold","m_filter","cl_freelook"] current=numbers.atof(cvar(state,name));fallback=numbers.atof(defaultCvar(state,name));state.configs=state.configs+[Config(name,fallback,current)];emit(state,"reset-cvar",name,"",fallback,0);emit(state,"set-cvar",name,str(current),current,0) end for;return len(state.configs)
end function
function getCvarDefault(state,name) for each item in state.configs if item.name==name then return item.defaultValue end if end for;return 0.0 end function
function getCvarValue(state,name) for each item in state.configs if item.name==name then return item.value end if end for;return 0.0 end function

// Controls_UpdateModel
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
function groupIds(section)
  if section==C_MOVEMENT then return [36,2,3,4,5,6,7,8,9,10,11] end if
  if section==C_LOOKING then return [38,41,35,12,13,14,34,15,16,39,40] end if
  if section==C_WEAPONS then return [26,28,27,37,17,18,19,20,21,22,23,24,25] end if
  return [0,1,29,30,31,32,33]
end function
function update(state)
  for each item in state.controls item.visible=false;item.inactive=true;item.grayed=true;item.highlighted=false end for;active=groupIds(state.section);y=(480-len(active)*16)/2;for each id in active item=control(state,id);item.visible=true;item.inactive=false;item.grayed=false;item.x=320;item.y=y;y=y+16 end for
  if state.waitingForKey then for each item in state.controls item.grayed=true end for;selected=control(state,state.cursorId);if selected!=void then selected.grayed=false end if;return len(active) end if
  for each item in state.controls if item.visible then item.grayed=false end if end for;return len(active)
end function

// Controls_DrawKeyBinding / Controls_StatusBar / Controls_DrawPlayer
function drawKeyBinding(state,id,selected)
  item=actionBinding(state,id);if item==void then return DrawBinding("","???",selected,true,state.waitingForKey) end if;text="???";if item.bind1!=-1 then text=strings.toUpperAscii(keys.keynumToString(item.bind1));if item.bind2!=-1 then text=text+" or "+strings.toUpperAscii(keys.keynumToString(item.bind2)) end if end if;entry=control(state,id);gray=false;if entry!=void then gray=entry.grayed end if;emit(state,"draw-binding",item.command,item.label+"="+text,0.0,id);if selected then if state.waitingForKey then emit(state,"status","waiting","Waiting for new key ... ESCAPE to cancel",0.0,id) else emit(state,"status","change","Press ENTER or CLICK to change / Press BACKSPACE to clear",0.0,id) end if end if;return DrawBinding(item.label,text,selected,gray,state.waitingForKey)
end function
function statusBar(state) emit(state,"status","controls","Use Arrow Keys or CLICK to change",0.0,0);return "Use Arrow Keys or CLICK to change" end function
function drawPlayer(state,model,realtime) if model!=state.playerModel then state.playerModel=model;emit(state,"player-model",model,"",0.0,0);updateModel(state,ANIM_IDLE) end if;emit(state,"draw-player",model,"",realtime/2.0,0);return state.playerModel end function

// Controls_GetKeyAssignment / Controls_GetConfig
function getKeyAssignment(state,command) result=[-1,-1];count=0;for key=0 to 255 value=keys.getBinding(state.keyState,key);if value!="" and same(value,command) then result[count]=key;count=count+1;if count==2 then break end if end if end for;return result end function
function getConfig(state)
  for each item in state.bindings assigned=getKeyAssignment(state,item.command);item.bind1=assigned[0];item.bind2=assigned[1] end for
  setSetting(state,"invertmouse",getCvarValue(state,"m_pitch")<0.0);setSetting(state,"smoothmouse",clamp(0.0,1.0,getCvarValue(state,"m_filter")));setSetting(state,"alwaysrun",clamp(0.0,1.0,getCvarValue(state,"cl_run")));setSetting(state,"autoswitch",clamp(0.0,1.0,getCvarValue(state,"cg_autoswitch")));setSetting(state,"sensitivity",clamp(2.0,30.0,getCvarValue(state,"sensitivity")));setSetting(state,"joyenable",clamp(0.0,1.0,getCvarValue(state,"in_joystick")));setSetting(state,"joythreshold",clamp(0.05,0.75,getCvarValue(state,"joy_threshold")));setSetting(state,"freelook",clamp(0.0,1.0,getCvarValue(state,"cl_freelook")));return state
end function
function setKey(state,key,command) if key>=0 and key<256 then keys.setBinding(state.keyState,key,command) end if;emit(state,"set-binding",keys.keynumToString(key),command,0.0,key);return void end function

// Controls_SetConfig / Controls_SetDefaults
function setConfig(state)
  for each item in state.bindings if item.bind1!=-1 then setKey(state,item.bind1,item.command);if item.bind2!=-1 then setKey(state,item.bind2,item.command) end if end if end for
  pitch=numbers.atof(cvar(state,"m_pitch"));if pitch<0.0 then pitch=-pitch end if;if setting(state,"invertmouse") then pitch=-pitch end if;setCvar(state,"m_pitch",pitch);setCvar(state,"m_filter",setting(state,"smoothmouse"));setCvar(state,"cl_run",setting(state,"alwaysrun"));setCvar(state,"cg_autoswitch",setting(state,"autoswitch"));setCvar(state,"sensitivity",setting(state,"sensitivity"));setCvar(state,"in_joystick",setting(state,"joyenable"));setCvar(state,"joy_threshold",setting(state,"joythreshold"));setCvar(state,"cl_freelook",setting(state,"freelook"));emit(state,"execute","in_restart","in_restart\n",0.0,2);return true
end function
function setDefaults(state)
  for each item in state.bindings item.bind1=item.default1;item.bind2=item.default2 end for;setSetting(state,"invertmouse",getCvarDefault(state,"m_pitch")<0.0);setSetting(state,"smoothmouse",getCvarDefault(state,"m_filter"));setSetting(state,"alwaysrun",getCvarDefault(state,"cl_run"));setSetting(state,"autoswitch",getCvarDefault(state,"cg_autoswitch"));setSetting(state,"sensitivity",getCvarDefault(state,"sensitivity"));setSetting(state,"joyenable",getCvarDefault(state,"in_joystick"));setSetting(state,"joythreshold",getCvarDefault(state,"joy_threshold"));setSetting(state,"freelook",getCvarDefault(state,"cl_freelook"));return state
end function

// Controls_MenuKey
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
function resetDefaultsAction(state,result) if not result then return false end if;state.changesMade=true;setDefaults(state);update(state);return true end function
function resetDefaultsDraw(state) lines=["WARNING: This will reset all","controls to their default values."];emit(state,"text","warning",lines[0],0.0,0);emit(state,"text","warning",lines[1],0.0,1);return lines end function
function menuEvent(state,id,event)
  if event!=QM_ACTIVATED then return false end if
  if id==ID_MOVEMENT then state.section=C_MOVEMENT;update(state);return true else if id==ID_LOOKING then state.section=C_LOOKING;update(state);return true else if id==ID_WEAPONS then state.section=C_WEAPONS;update(state);return true else if id==ID_MISC then state.section=C_MISC;update(state);return true else if id==ID_DEFAULTS then state.menuEvents=state.menuEvents+[["confirm","SET TO DEFAULTS?"]];emit(state,"confirm","defaults","SET TO DEFAULTS?",0.0,0);return true else if id==ID_BACK then if state.changesMade then setConfig(state) end if;state.menuEvents=state.menuEvents+[["pop"]];return true else if id==ID_SAVEANDEXIT then setConfig(state);state.menuEvents=state.menuEvents+[["pop"]];return true else if id==ID_EXIT then state.menuEvents=state.menuEvents+[["pop"]];return true end if
  if id>=ID_FREELOOK and id<=ID_SMOOTHMOUSE then state.changesMade=true;return true end if;return false
end function
function actionEvent(state,id,event) item=actionBinding(state,id);if item==void then return false end if;if event==QM_LOSTFOCUS then updateModel(state,ANIM_IDLE);return true else if event==QM_GOTFOCUS then updateModel(state,item.anim);return true else if event==QM_ACTIVATED and not state.waitingForKey then state.waitingForKey=true;state.cursorId=id;update(state);return true end if;return false end function

// Controls_InitModel / Controls_InitWeapons / Controls_MenuInit
function initModel(state) state.playerModel=cvar(state,"model");emit(state,"player-model",state.playerModel,"",0.0,0);updateModel(state,ANIM_IDLE);return state.playerModel end function
function initWeapons(state,models) state.weaponModels=[];for each model in models state.weaponModels=state.weaponModels+[model];emit(state,"register-model",model,"",0.0,0) end for;return len(state.weaponModels) end function
function cache(state) for each asset in [ART_BACK0,ART_BACK1,ART_FRAMEL,ART_FRAMER] emit(state,"register-shader",asset,"",0.0,0) end for;state.cached=true;return 4 end function
function menuInit(state,weaponModels)
  state.bindings=defaultBindings();state.controls=makeControls();state.section=C_LOOKING;state.waitingForKey=false;state.changesMade=false;state.cursorId=0;state.actions=[];state.menuEvents=[];cache(state);state.playerName=clean(cvar(state,"name"));initCvars(state);getConfig(state);initModel(state);initWeapons(state,weaponModels);update(state);return state
end function
function uiControlsMenu(state,weaponModels) menuInit(state,weaponModels);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","controls","",0.0,0);return state end function
