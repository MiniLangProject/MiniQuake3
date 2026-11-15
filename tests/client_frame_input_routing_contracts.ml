// SPDX-License-Identifier: GPL-2.0-or-later
// Exact productive app functions are extracted into ignored build/ for headless tests.
import mq3.tests.client_frame_routing as frameRoute
import mq3.engine.local_qvm_match as match
import mq3.client.qvm_frame_input as frame
import mq3.client.original_ui_session as ui
import mq3.client.console_input as console
import mq3.client.cgame_vm as cgame
import mq3.client.input_command_events as events
import mq3.platform.playable_window as window
import mq3.vm.cgame_key_traps as keys
import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as frameCvars
struct RoutingCtx cgameKeys uiKeyCatcher clientTextInput uiClient commandState now inputClearContext inputClearFn end struct
struct RoutingClient connState end struct
struct RoutingMinimalCtx cgameKeys end struct
struct RoutingState context cgame end struct
struct RoutingCapture match keys chars mouse refresh menus cgame end struct
struct RoutingCgHost machineRuntime callFn end struct
struct RoutingCgState active slot callCount lastExport lastArgs host end struct
function routingFixtureReq(ok,text) if not ok then return error(7699,"input routing: "+text) end if;return 1 end function
function routingFixtureCatchers(capture) return match.keyCatcher(capture.match) end function
function routingFixtureKeyEvent(capture,key,down)
  capture.keys=capture.keys+1;if (key&ui.K_CHAR_FLAG)!=0 then capture.chars=capture.chars+1 end if
  if key==27 and down then match.uiSetCatcher(capture.match.context,match.keyCatcher(capture.match)&(~2));match.uiClearKeysProductive(capture.match.context) end if;return true
end function
function routingFixtureMouseEvent(capture,x,y) capture.mouse=capture.mouse+1;return true end function
function routingFixtureRefresh(capture,now) capture.refresh=capture.refresh+1;return true end function
function routingFixtureMenu(capture,routingFixtureMenu) capture.menus=capture.menus+1;match.uiSetCatcher(capture.match.context,match.keyCatcher(capture.match)|2);return true end function
function routingFixtureCount(capture) return 0 end function
function routingFixtureKeyDown(context,key) return false end function
function routingFixtureMouseDelta(context) return [0,0] end function
function routingFixtureCgCall(capture,slot,args) capture.cgame=capture.cgame+1;return true end function
function routingFixtureSend(bridge,state,type,key,value) return frameRoute.applyInputEvent(bridge,state,window.InputEvent(1003,type,key,value)) end function
function main(args)
  checked=0;text=console.create(78,console.services(void));text.connectionState=8;ctx=RoutingCtx(keys.create(),0,text,RoutingClient(8),commands.create(),1000,void,void);state=RoutingState(ctx,void);capture=RoutingCapture(state,0,0,0,0,0,0);state.cgame=RoutingCgState(true,1,0,-1,[],RoutingCgHost(capture,routingFixtureCgCall))
  services=ui.services(capture,routingFixtureCatchers,routingFixtureKeyEvent,routingFixtureMouseEvent,routingFixtureRefresh,routingFixtureMenu,routingFixtureCount);session=ui.create(services,void,routingFixtureKeyDown,routingFixtureMouseDelta);client=frame.create([0.0,0.0,0.0],[0,0,0],1000,1000);plan=frame.prepare(client,1004,0,7,true,false,false);bridge=frameRoute.ClientInputBridge(client,plan,session,state);match.attachInputClear(state,bridge,frameRoute.clearClientInput)
  match.setKeyBinding(state,178,"+attack");match.setKeyBinding(state,119,"+forward");match.setKeyBinding(state,103,"+button7")
  console.beginMessage(text,false,-1);match.uiSetCatcher(ctx,4);routingFixtureSend(bridge,state,window.INPUT_KEY,27,1);frameRoute.refreshUiFrame(session,1004)
  checked=checked+routingFixtureReq(match.keyCatcher(state)==0 and capture.menus==0 and capture.keys==0 and capture.refresh==0,"chat Escape closes only chat, never opens UI")
  routingFixtureSend(bridge,state,window.INPUT_KEY,27,0);checked=checked+routingFixtureReq(match.keyCatcher(state)==0,"chat Escape release does not reopen UI")
  routingFixtureSend(bridge,state,window.INPUT_KEY,178,1);routingFixtureSend(bridge,state,window.INPUT_KEY,27,1);cmd=frame.finish(client,plan,1000,2,1.0,match.keyCatcher(state),events.anyDown(client.input))
  checked=checked+routingFixtureReq((cmd.buttons&2)!=0 and match.keyCatcher(state)==2 and capture.menus==1,"Attack then Escape has BUTTON_TALK before command submission")
  checked=checked+routingFixtureReq(not client.input.buttons[0].active,"opening menu releases actual attack source")
  frameRoute.refreshUiFrame(session,1004);checked=checked+routingFixtureReq(capture.refresh==1,"UI refresh survives after input routing without polling it again")
  plan=frame.prepare(client,1008,1,7,true,false,false);bridge.plan=plan;before=capture.keys;routingFixtureSend(bridge,state,window.INPUT_KEY,27,1);routingFixtureSend(bridge,state,window.INPUT_KEY,178,1)
  checked=checked+routingFixtureReq(capture.keys==before+1 and match.keyCatcher(state)==0 and client.input.buttons[0].active,"UI Escape then Attack follows chronological catcher transition")
  routingFixtureSend(bridge,state,window.INPUT_KEY,178,0);checked=checked+routingFixtureReq(not client.input.buttons[0].active,"same-frame attack release is retained")
  routingFixtureSend(bridge,state,window.INPUT_KEY,119,1);routingFixtureSend(bridge,state,window.INPUT_KEY,103,1);match.uiSetCatcher(ctx,2);match.uiClearKeysProductive(ctx)
  checked=checked+routingFixtureReq(not client.input.forward.active and not client.input.buttons[7].active,"UI Key_ClearStates releases all actual bound actions")
  routingFixtureSend(bridge,state,window.INPUT_KEY,119,1);checked=checked+routingFixtureReq(not client.input.forward.active,"UI held key cannot be reapplied by gameplay polling")
  before=capture.keys;routingFixtureSend(bridge,state,window.INPUT_KEY,13,1);routingFixtureSend(bridge,state,window.INPUT_CHAR,97,0);routingFixtureSend(bridge,state,window.INPUT_KEY,13,0)
  checked=checked+routingFixtureReq(capture.keys==before+3 and capture.chars==1,"UI key and WM_CHAR delivered exactly once")
  before=capture.mouse;routingFixtureSend(bridge,state,window.INPUT_MOUSE,5,-3);checked=checked+routingFixtureReq(capture.mouse==before+1 and client.input.mouseDx[0]==0 and client.input.mouseDy[0]==0,"UI mouse never leaks into gameplay")
  match.uiSetCatcher(ctx,8);before=capture.cgame;routingFixtureSend(bridge,state,window.INPUT_MOUSE,2,4);checked=checked+routingFixtureReq(capture.cgame==before+1 and client.input.mouseDx[0]==0,"Cgame mouse is exclusive")
  before=capture.cgame;routingFixtureSend(bridge,state,window.INPUT_KEY,27,1);checked=checked+routingFixtureReq(match.keyCatcher(state)==0 and capture.cgame==before+1 and state.cgame.lastExport==cgame.CG_EVENT_HANDLING,"Cgame Escape clears capture without opening UI")
  routingFixtureSend(bridge,state,window.INPUT_KEY,119,1);match.uiSetCatcher(ctx,4);routingFixtureSend(bridge,state,window.INPUT_KEY,119,0);checked=checked+routingFixtureReq(not client.input.forward.active,"chat catcher still delivers held gameplay key-up")
  match.uiSetCatcher(ctx,1);routingFixtureSend(bridge,state,window.INPUT_MOUSE,5,7);checked=checked+routingFixtureReq(client.input.mouseDx[0]==0,"windowed console mouse remains inactive")
  match.uiSetCatcher(ctx,5);routingFixtureSend(bridge,state,window.INPUT_CHAR,120,0);checked=checked+routingFixtureReq(text.console.text=="x" and text.chat.text=="","console chars take priority over active chat")
  routingFixtureSend(bridge,state,window.INPUT_KEY,console.K_LEFTARROW,1);routingFixtureSend(bridge,state,window.INPUT_KEY,console.K_DEL,1);checked=checked+routingFixtureReq(text.console.text=="","console normal keys take priority over active chat")
  routingFixtureSend(bridge,state,window.INPUT_KEY,27,1);checked=checked+routingFixtureReq(match.keyCatcher(state)==1 and capture.menus==1,"Escape handles chat first even when console is also open")
  keys.clearStates(ctx.cgameKeys);match.uiSetCatcher(ctx,0);routingFixtureSend(bridge,state,window.INPUT_KEY,120,1);checked=checked+routingFixtureReq(match.anyKeyDown(state),"unbound physical key participates in BUTTON_ANY")
  routingFixtureSend(bridge,state,window.INPUT_KEY,120,0);checked=checked+routingFixtureReq(not match.anyKeyDown(state),"unbound physical key-up clears BUTTON_ANY source")
  match.uiSetCatcher(ctx,3);before=capture.keys;routingFixtureSend(bridge,state,window.INPUT_KEY,27,1);checked=checked+routingFixtureReq(capture.keys==before+1 and match.keyCatcher(state)==1,"Escape reaches active UI even with console catcher")
  match.uiSetCatcher(ctx,2);before=capture.chars;routingFixtureSend(bridge,state,window.INPUT_CHAR,96,0);routingFixtureSend(bridge,state,window.INPUT_CHAR,126,0);checked=checked+routingFixtureReq(capture.chars==before,"console toggle characters are never delivered to UI")
  match.uiSetCatcher(ctx,6);before=capture.chars;routingFixtureSend(bridge,state,window.INPUT_CHAR,122,0);checked=checked+routingFixtureReq(capture.chars==before+1 and text.chat.text=="","UI chars take priority over active chat")
  match.uiSetCatcher(ctx,3);before=capture.keys;routingFixtureSend(bridge,state,window.INPUT_KEY,178,0);checked=checked+routingFixtureReq(capture.keys==before+1,"UI key-up survives console bit")
  match.uiSetCatcher(ctx,9);before=capture.cgame;routingFixtureSend(bridge,state,window.INPUT_KEY,119,0);checked=checked+routingFixtureReq(capture.cgame==before+1 and state.cgame.lastExport==cgame.CG_KEY_EVENT,"Cgame key-up survives console bit")
  minimal=RoutingMinimalCtx(keys.create());keys.setDown(minimal.cgameKeys,119,true);match.uiClearKeys(minimal);checked=checked+routingFixtureReq(not keys.isDown(minimal.cgameKeys,119),"legacy minimal UI key-clear service remains field-compatible")
  match.uiSetCatcher(ctx,0);match.setKeyBinding(state,122,"+zoom");routingFixtureSend(bridge,state,window.INPUT_KEY,122,1);routingFixtureSend(bridge,state,window.INPUT_KEY,122,0);checked=checked+routingFixtureReq(ctx.commandState.buffer=="+zoom 122 1003\n-zoom 122 1003\n","non-movement +bindings reach original cgame commands on down and up")
  seeded=frameCvars.create();match.seedCvars(seeded);checked=checked+routingFixtureReq(frameCvars.find(seeded,"sensitivity").resetString=="5" and frameCvars.find(seeded,"cl_run").integer==1,"controls defaults exist before UI module initialization")
  ctx.commandState.buffer="";routingFixtureSend(bridge,state,window.INPUT_KEY,122,1);frameRoute.clearClientInput(bridge);checked=checked+routingFixtureReq(ctx.commandState.buffer=="+zoom 122 1003\n-zoom 122 0\n" and not match.keyIsDown(state,122),"forced UI clear emits delegated -zoom before clearing physical keys")
  print "PASS: "+str(checked)+" exact productive app routing contracts";return 0
end function
