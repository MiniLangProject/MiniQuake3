// SPDX-License-Identifier: GPL-2.0-or-later
// Interactive input/frame ownership for the unchanged Baseq3 ui.qvm.
package mq3.client.original_ui_session

import mq3.client.keycodes as q3keys
import mq3.platform.playable_window as window

const KEYCATCH_UI=2
const KEYCATCH_CONSOLE=1
const K_CHAR_FLAG=q3keys.K_CHAR_FLAG
const K_BACKSPACE=q3keys.K_BACKSPACE
const K_UPARROW=q3keys.K_UPARROW
const K_DOWNARROW=q3keys.K_DOWNARROW
const K_LEFTARROW=q3keys.K_LEFTARROW
const K_RIGHTARROW=q3keys.K_RIGHTARROW
const K_ALT=q3keys.K_ALT
const K_CTRL=q3keys.K_CTRL
const K_SHIFT=q3keys.K_SHIFT
const K_INS=q3keys.K_INS
const K_DEL=q3keys.K_DEL
const K_PGDN=q3keys.K_PGDN
const K_PGUP=q3keys.K_PGUP
const K_HOME=q3keys.K_HOME
const K_END=q3keys.K_END
const K_F1=q3keys.K_F1
const K_MOUSE1=q3keys.K_MOUSE1
const K_MOUSE2=q3keys.K_MOUSE2
const K_MOUSE3=q3keys.K_MOUSE3
const UIMENU_NONE=0
const UIMENU_MAIN=1
const UIMENU_INGAME=2
const UIMENU_NEED_CD=3
const UIMENU_BAD_CD_KEY=4
const UIMENU_TEAM=5
const UIMENU_POSTGAME=6

const VK_BACK=8
const VK_TAB=9
const VK_RETURN=13
const VK_SHIFT=16
const VK_CONTROL=17
const VK_MENU=18
const VK_ESCAPE=27
const VK_SPACE=32
const VK_PRIOR=33
const VK_NEXT=34
const VK_END=35
const VK_HOME=36
const VK_LEFT=37
const VK_UP=38
const VK_RIGHT=39
const VK_DOWN=40
const VK_INSERT=45
const VK_DELETE=46
const VK_F1=112
const VK_LBUTTON=1
const VK_RBUTTON=2
const VK_MBUTTON=4

/// Stores original UI session binding record, including `virtualKey`, `quakeKey`, `normalChar`, `shiftedChar`.
struct Binding virtualKey quakeKey normalChar shiftedChar end struct
/// Stores original UI session host-service callbacks, including `context`, `catcherFn`, `keyEventFn`, `mouseEventFn`, `refreshFn`, `menuFn` and additional values.
struct Services context catcherFn keyEventFn mouseEventFn refreshFn menuFn commandCountFn stateEventFn connectFn end struct
/// Stores original UI session state, including `services`, `inputContext`, `keyDownFn`, `mouseDeltaFn`, `bindings`, `down` and additional values.
struct State services inputContext keyDownFn mouseDeltaFn bindings down frameCount end struct
/// Stores original UI session frame data, including `active`, `refreshed`, `menuOpened`, `keyEvents`, `charEvents`, `mouseEvents` and additional values.
struct Frame active refreshed menuOpened keyEvents charEvents mouseEvents commandStart uiCommands commandCount end struct

/// Creates the original UI session error `7686` with diagnostic text `"original UI session: "+message`.
/// @param message Argument 2 of `error`; passed as `"original UI session: "+message`.
function fail(message) return error(7686,"original UI session: "+message) end function
/// Creates a `mq3.client.original_ui_session.Services` record. Assigns `context` from `context`, `catcherFn` from `catcherFn`, `keyEventFn` from `keyEventFn`, `mouseEventFn` from `mouseEventFn`.
/// @param context Value used to initialize `Services.context`.
/// @param catcherFn Value used to initialize `Services.catcherFn`.
/// @param keyEventFn Value used to initialize `Services.keyEventFn`.
/// @param mouseEventFn Value used to initialize `Services.mouseEventFn`.
/// @param refreshFn Value used to initialize `Services.refreshFn`.
/// @param menuFn Value used to initialize `Services.menuFn`.
/// @param commandCountFn Value used to initialize `Services.commandCountFn`.
function services(context,catcherFn,keyEventFn,mouseEventFn,refreshFn,menuFn,commandCountFn)
  return Services(context,catcherFn,keyEventFn,mouseEventFn,refreshFn,menuFn,commandCountFn,void,void)
end function
/// Creates a `mq3.client.original_ui_session.Binding` record. Assigns `virtualKey` from `virtualKey`, `quakeKey` from `quakeKey`, `normalChar` from `normalChar`, `shiftedChar` from `shiftedChar`.
/// @param virtualKey Value used to initialize `Binding.virtualKey`.
/// @param quakeKey Value used to initialize `Binding.quakeKey`.
/// @param normalChar Value used to initialize `Binding.normalChar`.
/// @param shiftedChar Value used to initialize `Binding.shiftedChar`.
function binding(virtualKey,quakeKey,normalChar,shiftedChar) return Binding(virtualKey,quakeKey,normalChar,shiftedChar) end function
/// Calls `mq3.client.original_ui_session.binding` from original UI session `bindings`. The final path returns `result`.
function bindings()
  result=[binding(VK_ESCAPE,27,0,0),binding(VK_RETURN,13,0,0),binding(VK_TAB,9,0,0),binding(VK_BACK,K_BACKSPACE,0,0),binding(VK_SPACE,32,32,32),binding(VK_UP,K_UPARROW,0,0),binding(VK_DOWN,K_DOWNARROW,0,0),binding(VK_LEFT,K_LEFTARROW,0,0),binding(VK_RIGHT,K_RIGHTARROW,0,0),binding(VK_SHIFT,K_SHIFT,0,0),binding(VK_CONTROL,K_CTRL,0,0),binding(VK_MENU,K_ALT,0,0),binding(VK_INSERT,K_INS,0,0),binding(VK_DELETE,K_DEL,0,0),binding(VK_PRIOR,K_PGUP,0,0),binding(VK_NEXT,K_PGDN,0,0),binding(VK_HOME,K_HOME,0,0),binding(VK_END,K_END,0,0),binding(VK_LBUTTON,K_MOUSE1,0,0),binding(VK_RBUTTON,K_MOUSE2,0,0),binding(VK_MBUTTON,K_MOUSE3,0,0)]
  for index=0 to 11 result=result+[binding(VK_F1+index,K_F1+index,0,0)] end for
  shiftedDigits=[41,33,64,35,36,37,94,38,42,40]
  for index=0 to 9 result=result+[binding(48+index,48+index,48+index,shiftedDigits[index])] end for
  for index=0 to 25 result=result+[binding(65+index,97+index,97+index,65+index)] end for
  result=result+[binding(186,59,59,58),binding(187,61,61,43),binding(188,44,44,60),binding(189,45,45,95),binding(190,46,46,62),binding(191,47,47,63),binding(192,96,96,126),binding(219,91,91,123),binding(220,92,92,124),binding(221,93,93,125),binding(222,39,39,34)]
  return result
end function
/// Calls `mq3.client.original_ui_session.bindings`, `mq3.client.original_ui_session.State` from original UI session `create`. The final path returns `State(serviceSet,inputContext,keyDownFn,mouseDeltaFn,mapped,array(len(mapped),false),0)`.
/// @param serviceSet Record read through `serviceSet.catcherFn`, `serviceSet.keyEventFn`, `serviceSet.mouseEventFn`, `serviceSet.refreshFn` and additional values.
/// @param inputContext Value used by `return State(serviceSet,inputContext,keyDownFn,mouseDeltaFn,mapped,array(len(mapped),false),0)`.
/// @param keyDownFn Callback invoked by `create` for key down.
/// @param mouseDeltaFn Callback invoked by `create` for mouse delta.
function create(serviceSet,inputContext,keyDownFn,mouseDeltaFn)
  if serviceSet==void or serviceSet.catcherFn==void or serviceSet.keyEventFn==void or serviceSet.mouseEventFn==void or serviceSet.refreshFn==void or serviceSet.menuFn==void or serviceSet.commandCountFn==void then return fail("complete UI services are required") end if
  if keyDownFn==void or mouseDeltaFn==void then return fail("native input callbacks are required") end if
  mapped=bindings();return State(serviceSet,inputContext,keyDownFn,mouseDeltaFn,mapped,array(len(mapped),false),0)
end function
/// Adapts `state.services.catcherFn` to original UI session `keyCatcher`, returning its result for `state.services.context`.
/// @param state Record read through `state.services.catcherFn`, `state.services.context`.
function keyCatcher(state) return state.services.catcherFn(state.services.context) end function
/// Computes `(keyCatcher(state)&KEYCATCH_UI)!=0` for original UI session `active`.
/// @param state Shared original UI session state passed to the helper calls in `active`.
function active(state) return (keyCatcher(state)&KEYCATCH_UI)!=0 end function
/// Computes `active(state) and (keyCatcher(state)&KEYCATCH_CONSOLE)==0` for original UI session `acceptsInput`.
/// @param state Shared original UI session state passed to the helper calls in `acceptsInput`.
function acceptsInput(state) return active(state) and (keyCatcher(state)&KEYCATCH_CONSOLE)==0 end function
/// Calls `state.services.menuFn` from original UI session `setMenu`. The final path returns `state.services.menuFn(state.services.context,menu)`.
/// @param state Record read through `state.services.menuFn`, `state.services.context`.
/// @param menu Value used by `if state==void or menu<UIMENU_NONE or menu>UIMENU_POSTGAME then return fail("invalid active menu") end if`.
function setMenu(state,menu)
  if state==void or menu<UIMENU_NONE or menu>UIMENU_POSTGAME then return fail("invalid active menu") end if
  return state.services.menuFn(state.services.context,menu)
end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openMain`, returning its result for `state, UIMENU_MAIN`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function openMain(state) return setMenu(state,UIMENU_MAIN) end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openIngame`, returning its result for `state, UIMENU_INGAME`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function openIngame(state) return setMenu(state,UIMENU_INGAME) end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openNeedCd`, returning its result for `state, UIMENU_NEED_CD`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function openNeedCd(state) return setMenu(state,UIMENU_NEED_CD) end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openBadCdKey`, returning its result for `state, UIMENU_BAD_CD_KEY`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function openBadCdKey(state) return setMenu(state,UIMENU_BAD_CD_KEY) end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openTeam`, returning its result for `state, UIMENU_TEAM`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function openTeam(state) return setMenu(state,UIMENU_TEAM) end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openPostgame`, returning its result for `state, UIMENU_POSTGAME`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function openPostgame(state) return setMenu(state,UIMENU_POSTGAME) end function
/// Adapts `mq3.client.original_ui_session.setMenu` to original UI session `close`, returning its result for `state, UIMENU_NONE`.
/// @param state Argument 1 of `mq3.client.original_ui_session.setMenu`.
function close(state) return setMenu(state,UIMENU_NONE) end function
/// Calls `state.services.connectFn` from original UI session `drawConnectScreen`. The final path returns `state.services.connectFn(state.services.context,overlay)`.
/// @param state Record read through `state.services.connectFn`, `state.services.context`.
/// @param overlay Value used by `return state.services.connectFn(state.services.context,overlay)`.
function drawConnectScreen(state,overlay)
  if state==void or state.services.connectFn==void then return fail("connect-screen service is required") end if
  return state.services.connectFn(state.services.context,overlay)
end function

/// Calls `mq3.client.original_ui_session.active`, `mq3.client.original_ui_session.openIngame`, `mq3.client.original_ui_session.acceptsInput` and additional helpers from original UI session `dispatchKey`. The final path returns `sent`.
/// @param state Record read through `state.services.keyEventFn`, `state.services.context`.
/// @param key Key or control identifier used to select the corresponding original UI session entry.
/// @param down Whether this event presses the key/button; false represents its release.
/// @param character Value used by `if down and character>0 then`.
/// @param shifted Value used by `if shifted then value=shifted end if`.
function dispatchKey(state,key,down,character,shifted)
  result=[0,0,0]
  if key==27 and down and not active(state) then
    opened=openIngame(state);if opened is error then return opened end if;result[2]=1;return result
  end if
  if not acceptsInput(state) then return result end if
  sent=state.services.keyEventFn(state.services.context,key,down);if sent is error then return sent end if;result[0]=1
  if down and character>0 then
    value=character;if shifted then value=shifted end if
    sent=state.services.keyEventFn(state.services.context,value|K_CHAR_FLAG,true);if sent is error then return sent end if;result[1]=1
  end if
  return result
end function

/// Updates `state.down[index]` during original UI session `frame`.
/// @param state Mutable original UI session record/storage; this routine assigns `state.down[index]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function frame(state,now)
  if state==void or typeof(now)!="int" or now<0 then return fail("valid state and frame time are required") end if
  keyEvents=0;charEvents=0;menuOpened=false;shifted=state.keyDownFn(state.inputContext,K_SHIFT)
  for index=0 to len(state.bindings)-1
    // The Win32 queue is normalized to Quake keynums at its boundary, just as
    // Sys_QueEvent is in the original engine.  Poll that same key domain so
    // mouse buttons, navigation keys and lowercase letters cannot diverge.
    item=state.bindings[index];down=state.keyDownFn(state.inputContext,item.quakeKey)
    if down!=state.down[index] then
      state.down[index]=down
      if state.services.stateEventFn!=void then observed=state.services.stateEventFn(state.services.context,item.quakeKey,down);if observed is error then return observed end if end if
      shiftedChar=0;if shifted then shiftedChar=item.shiftedChar end if
      sent=dispatchKey(state,item.quakeKey,down,item.normalChar,shiftedChar)
      if sent is error then return sent end if;keyEvents=keyEvents+sent[0];charEvents=charEvents+sent[1];if sent[2]!=0 then menuOpened=true end if
    end if
  end for
  mouseEvents=0;delta=state.mouseDeltaFn(state.inputContext)
  if delta==void or len(delta)!=2 then return fail("mouse callback must return two components") end if
  if acceptsInput(state) and (delta[0]!=0 or delta[1]!=0) then sent=state.services.mouseEventFn(state.services.context,delta[0],delta[1]);if sent is error then return sent end if;mouseEvents=1 end if
  return finishOriginalUiFrame(state,now,menuOpened,keyEvents,charEvents,mouseEvents)
end function

/// Updates `state.frameCount` during original UI session `finishOriginalUiFrame`.
/// @param state Mutable original UI session record/storage; this routine assigns `state.frameCount`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param menuOpened Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`.
/// @param keyEvents Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`.
/// @param charEvents Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`.
/// @param mouseEvents Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`.
function finishOriginalUiFrame(state,now,menuOpened,keyEvents,charEvents,mouseEvents)
  refreshed=false;commandStart=state.services.commandCountFn(state.services.context)
  if active(state) then
    value=state.services.refreshFn(state.services.context,now);if value is error then return value end if;refreshed=true;state.frameCount=state.frameCount+1
  end if
  count=state.services.commandCountFn(state.services.context)
  return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)
end function

// Win32 supplies key transitions, text and pointer deltas in message order.
// Keep physical keys distinct from WM_CHAR, as in CL_KeyEvent/CL_CharEvent.
/// @param state Record read through `state.services.stateEventFn`, `state.services.context`, `state.services.keyEventFn`, `state.services.mouseEventFn`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param events Value used by `for each event in events`.
function frameQueued(state,now,events)
  if state==void or typeof(now)!="int" or now<0 then return fail("valid state and frame time are required") end if
  keyEvents=0;charEvents=0;mouseEvents=0;menuOpened=false
  for each event in events
    if event.type==window.INPUT_KEY then
      key=event.value;down=event.value2!=0
      if state.services.stateEventFn!=void then
        observed=state.services.stateEventFn(state.services.context,key,down);if observed is error then return observed end if
      end if
      if acceptsInput(state) then
        sent=state.services.keyEventFn(state.services.context,key,down);if sent is error then return sent end if
        keyEvents=keyEvents+1
      else if key==27 and down and not active(state) then
        opened=openMain(state);if opened is error then return opened end if;menuOpened=true
      end if
    else if event.type==window.INPUT_CHAR then
      if event.value!=96 and event.value!=126 and acceptsInput(state) then
        sent=state.services.keyEventFn(state.services.context,event.value|K_CHAR_FLAG,true);if sent is error then return sent end if
        charEvents=charEvents+1
      end if
    else if event.type==window.INPUT_MOUSE and acceptsInput(state) then
      sent=state.services.mouseEventFn(state.services.context,event.value,event.value2);if sent is error then return sent end if
      mouseEvents=mouseEvents+1
    end if
  end for
  return finishOriginalUiFrame(state,now,menuOpened,keyEvents,charEvents,mouseEvents)
end function
