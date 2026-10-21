import mq3.client.ui_controls as controls
import mq3.vm.cgame_key_traps as keys
import mq3.compat.textnumbers as numbers

function req(value,message) if not value then print("FAIL: "+message);return 1 end if;return 0 end function
function actionCount(state,kind) count=0;for each action in state.actions if action.kind==kind then count=count+1 end if end for;return count end function
function seed(state)
  state.cvarValues=[["cl_run","2"],["m_pitch","-0.022"],["cg_autoswitch","-2"],["sensitivity","40"],["in_joystick","1"],["joy_threshold","0.9"],["m_filter","0.5"],["cl_freelook","1"],["model","sarge/red"],["name","^1Ranger"]]
  state.cvarDefaults=[["cl_run","0"],["m_pitch","0.022"],["cg_autoswitch","1"],["sensitivity","5"],["in_joystick","0"],["joy_threshold","0.15"],["m_filter","0"],["cl_freelook","1"]]
  keys.setBinding(state.keyState,9,"+scores");keys.setBinding(state.keyState,32,"+moveup");keys.setBinding(state.keyState,90,"+MOVEUP");keys.setBinding(state.keyState,137,"+attack");return state
end function
function main(args)
  failures=0;state=seed(controls.create(true))
  failures=failures+req(len(state.bindings)==34 and state.bindings[0].command=="+scores" and state.bindings[33].command=="messagemode4","34 exact binding rows")
  failures=failures+req(state.bindings[7].default1==32 and state.bindings[29].default1==180 and state.bindings[16].default1==-1,"original default keys")
  failures=failures+req(controls.initCvars(state)==8 and controls.getCvarValue(state,"cl_run")==2.0 and controls.getCvarDefault(state,"cl_run")==0.0,"cvar value/default capture")
  failures=failures+req(controls.getCvarValue(state,"missing")==0.0 and actionCount(state,"reset-cvar")==8 and actionCount(state,"set-cvar")==8,"cvar init host sequence")
  pair=controls.getKeyAssignment(state,"+MOVEUP");failures=failures+req(pair[0]==32 and pair[1]==90,"case-insensitive first two bindings")
  missing=controls.getKeyAssignment(state,"none");failures=failures+req(missing[0]==-1 and missing[1]==-1,"missing binding pair")
  controls.getConfig(state);failures=failures+req(state.bindings[7].bind1==32 and state.bindings[7].bind2==90 and state.bindings[26].bind1==137,"config binding snapshot")
  failures=failures+req(controls.setting(state,"invertmouse") and controls.setting(state,"sensitivity")==30.0 and controls.setting(state,"autoswitch")==0.0 and controls.setting(state,"joythreshold")==0.75,"config clamp and pitch sign")
  state.section=controls.C_MOVEMENT;failures=failures+req(controls.update(state)==11 and state.controls[3].visible and not state.controls[3].inactive and not state.controls[12].visible,"movement section topology")
  state.section=controls.C_WEAPONS;failures=failures+req(controls.update(state)==13 and state.controls[26].visible and state.controls[17].y==200,"weapon section positioning")
  state.waitingForKey=true;state.cursorId=26;controls.update(state);failures=failures+req(not state.controls[26].grayed and state.controls[17].grayed,"waiting mode grays other controls")
  state.waitingForKey=false;controls.updateModel(state,controls.ANIM_RUN);failures=failures+req(state.playerLegs==controls.LEGS_RUN and state.playerTorso==controls.TORSO_STAND,"run preview")
  controls.updateModel(state,controls.ANIM_STEPLEFT);failures=failures+req(state.playerLegs==controls.LEGS_WALK and state.playerMoveangles[1]==240.0,"step-left preview")
  controls.updateModel(state,controls.ANIM_TURNRIGHT);failures=failures+req(state.playerViewangles[1]==60.0,"turn-right preview")
  controls.updateModel(state,controls.ANIM_LOOKUP);failures=failures+req(state.playerViewangles[0]==-45.0,"look preview")
  controls.updateModel(state,controls.ANIM_WEAPON9);failures=failures+req(state.playerWeapon==controls.WP_BFG,"weapon preview")
  controls.updateModel(state,controls.ANIM_ATTACK);failures=failures+req(state.playerTorso==controls.TORSO_ATTACK,"attack preview")
  controls.updateModel(state,controls.ANIM_CHAT);failures=failures+req(state.playerChat,"chat preview")
  controls.updateModel(state,controls.ANIM_DIE);failures=failures+req(state.playerLegs==controls.BOTH_DEATH1 and state.playerWeapon==controls.WP_NONE,"death preview")
  drawn=controls.drawKeyBinding(state,7,true);failures=failures+req(drawn.keys=="SPACE or Z" and drawn.selected and actionCount(state,"draw-binding")==1,"key binding owner draw")
  failures=failures+req(controls.statusBar(state)=="Use Arrow Keys or CLICK to change","control status bar")
  state.playerModel="sarge/red";failures=failures+req(controls.drawPlayer(state,"visor/default",100)=="visor/default" and actionCount(state,"draw-player")==1,"player model refresh and draw")
  controls.setDefaults(state);failures=failures+req(state.bindings[3].bind1==132 and state.bindings[16].bind1==-1 and controls.setting(state,"sensitivity")==5.0,"defaults restore local bindings and cvars")
  state.actions=[];controls.setSetting(state,"invertmouse",true);controls.setSetting(state,"smoothmouse",1);controls.setSetting(state,"alwaysrun",1);controls.setSetting(state,"autoswitch",0);controls.setSetting(state,"sensitivity",7);controls.setSetting(state,"joyenable",1);controls.setSetting(state,"joythreshold",0.2);controls.setSetting(state,"freelook",0);controls.setConfig(state);failures=failures+req(numbers.atof(controls.cvar(state,"m_pitch"))<0.0 and controls.cvar(state,"sensitivity")=="7" and actionCount(state,"execute")==1,"save config cvars and input restart")
  failures=failures+req(keys.getBinding(state.keyState,132)=="+forward" and keys.getBinding(state.keyState,180)=="+button3","save default bindings")
  state.waitingForKey=false;state.cursorId=16;failures=failures+req(controls.actionEvent(state,16,controls.QM_ACTIVATED) and state.waitingForKey,"activate starts capture")
  failures=failures+req(controls.menuKey(state,120)=="menu-out" and state.bindings[16].bind1==120 and state.changesMade,"assign first key")
  controls.actionEvent(state,16,controls.QM_ACTIVATED);controls.menuKey(state,121);failures=failures+req(state.bindings[16].bind1==120 and state.bindings[16].bind2==121,"assign second key")
  controls.actionEvent(state,16,controls.QM_ACTIVATED);controls.menuKey(state,122);failures=failures+req(state.bindings[16].bind1==122 and state.bindings[16].bind2==-1 and keys.getBinding(state.keyState,120)=="","third key replaces pair")
  controls.actionEvent(state,16,controls.QM_ACTIVATED);failures=failures+req(controls.menuKey(state,controls.K_ESCAPE)=="menu-out" and not state.waitingForKey and state.bindings[16].bind1==122,"escape cancels capture")
  state.waitingForKey=false;state.cursorId=16;failures=failures+req(controls.menuKey(state,controls.K_BACKSPACE)=="menu-out" and state.bindings[16].bind1==-1 and keys.getBinding(state.keyState,122)=="","backspace clears selected binding")
  state.cursorId=26;controls.actionEvent(state,26,controls.QM_GOTFOCUS);failures=failures+req(state.playerTorso==controls.TORSO_ATTACK,"focus previews action animation");controls.actionEvent(state,26,controls.QM_LOSTFOCUS);failures=failures+req(state.playerTorso==controls.TORSO_STAND,"lost focus restores idle")
  state.changesMade=false;failures=failures+req(not controls.resetDefaultsAction(state,false) and controls.resetDefaultsAction(state,true) and state.changesMade,"reset confirmation action")
  failures=failures+req(len(controls.resetDefaultsDraw(state))==2,"reset warning draw")
  failures=failures+req(controls.menuEvent(state,controls.ID_MISC,controls.QM_ACTIVATED) and state.section==controls.C_MISC,"section menu event")
  state.changesMade=false;failures=failures+req(controls.menuEvent(state,controls.ID_MOUSESPEED,controls.QM_ACTIVATED) and state.changesMade,"setting menu event marks changes")
  failures=failures+req(controls.menuEvent(state,controls.ID_DEFAULTS,controls.QM_ACTIVATED) and state.menuEvents[len(state.menuEvents)-1][0]=="confirm","defaults confirmation event")
  before=len(state.actions);failures=failures+req(controls.menuEvent(state,controls.ID_BACK,controls.QM_ACTIVATED) and state.menuEvents[len(state.menuEvents)-1][0]=="pop" and len(state.actions)>before,"back saves changes and pops")
  state.actions=[];failures=failures+req(controls.cache(state)==4 and state.cached and actionCount(state,"register-shader")==4,"controls shader cache")
  failures=failures+req(controls.initWeapons(state,["models/weapons2/gauntlet/gauntlet.md3","models/weapons2/machinegun/machinegun.md3"])==2 and actionCount(state,"register-model")==2,"weapon model precache")
  state=seed(controls.create(true));controls.menuInit(state,["models/weapons2/rocketl/rocketl.md3"]);failures=failures+req(state.section==controls.C_LOOKING and state.playerName=="Ranger" and state.playerModel=="sarge/red" and state.cached and len(state.weaponModels)==1,"complete menu init")
  state=seed(controls.create(true));controls.uiControlsMenu(state,[]);failures=failures+req(state.pushed and state.menuEvents[0][0]=="push" and not state.actions[len(state.actions)-1].dispatched,"public menu push and retail suppression")
  if failures!=0 then return failures end if;print("PASS: 43 native ui_controls contracts (22 symbols)");return 0
end function
