// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.key_binding_dispatch as contractBindingDispatch
import mq3.client.input_command_events as boundInputEvents
import mq3.client.input_command as boundInputCore

function req(value,label) if not value then return error(7733,"key binding dispatch: "+label) end if;return 1 end function
function main(args)
  count=0
  commands=contractBindingDispatch.commands("+forward; say go; +attack",119,true,25)
  count=count+req(len(commands)==3 and commands[0].text=="+forward 119 25\n" and commands[1].text=="say go\n" and commands[2].text=="+attack 119 25\n","compound down text")
  count=count+req(commands[0].button and commands[0].action=="forward" and commands[0].down,"compound down metadata")
  commands=contractBindingDispatch.commands("+forward; say go; +attack",119,false,40)
  count=count+req(len(commands)==3 and commands[0].text=="-forward 119 40\n" and commands[1].text=="say go\n" and commands[2].text=="-attack 119 40\n","compound up")
  count=count+req(contractBindingDispatch.commands("say one; say two",97,true,50)[0].text=="say one; say two\n","plain binding remains whole")
  count=count+req(len(contractBindingDispatch.commands("say one",97,false,60))==0,"plain release ignored")
  count=count+req(contractBindingDispatch.commands("+forward ;;;  +attack",119,true,70)[0].action=="forward","action whitespace trimmed")
  count=count+req(try(contractBindingDispatch.commands("+forward",-1,true,0)) is error,"key validation")
  count=count+req(boundInputEvents.quakeKey(87)==119 and boundInputEvents.quakeKey(1)==178 and boundInputEvents.quakeKey(32)==32,"native key translation")
  state=boundInputCore.create(0.0,0.0,0.0)
  emitted=boundInputEvents.applyBound(state,10,boundInputEvents.INPUT_KEY,87,1,"+moveright");count=count+req(state.moveright.active and not state.forward.active and len(emitted)==1,"custom movement down")
  boundInputEvents.applyBound(state,30,boundInputEvents.INPUT_KEY,87,0,"+moveright");count=count+req(not state.moveright.active and state.moveright.msec==20,"custom movement up")
  boundInputEvents.applyBound(state,40,boundInputEvents.INPUT_KEY,1,1,"+button5");count=count+req(state.buttons[5].active and not state.buttons[0].active,"custom button")
  boundInputEvents.applyBound(state,45,boundInputEvents.INPUT_KEY,65,1,"+mlook");count=count+req(state.mlooking,"mlook down")
  boundInputEvents.release(state,60);count=count+req(not state.buttons[5].active and not state.mlooking,"complete release")
  count=count+req(boundInputEvents.defaultBinding(119)=="+forward" and boundInputEvents.defaultBinding(178)=="+attack","fallback defaults")
  // The native Sys_QueEvent path is already normalized. Exhaust the complete
  // Quake key domain, especially lowercase p..z overlapping Win32 F-keys.
  for key=0 to 255
    emitted=boundInputEvents.applyBoundQuake(state,100+key,boundInputEvents.INPUT_KEY,key,1,"echo quake")
    if len(emitted)!=1 or emitted[0].key!=key then return error(7733,"normalized key changed: "+str(key)) end if
  end for
  count=count+req(true,"all 256 normalized Quake keynums are preserved")
  state=boundInputCore.create(0.0,0.0,0.0)
  emitted=boundInputEvents.applyBoundQuake(state,10,boundInputEvents.INPUT_KEY,119,1,"+forward")
  count=count+req(state.forward.active and state.forward.down0==119 and emitted[0].key==119,"normalized W is forward, not VK_F8")
  boundInputEvents.applyBoundQuake(state,30,boundInputEvents.INPUT_KEY,119,0,"+forward")
  count=count+req(not state.forward.active and state.forward.msec==20,"normalized key release matches the same source")
  emitted=boundInputEvents.applyBoundQuake(state,40,boundInputEvents.INPUT_KEY,178,1,"+attack")
  count=count+req(state.buttons[0].active and state.buttons[0].down0==178 and emitted[0].key==178,"normalized mouse button remains mouse1")
  emitted=boundInputEvents.applyBoundQuake(state,45,boundInputEvents.INPUT_KEY,112,1,"+left")
  count=count+req(state.left.active and emitted[0].key==112,"normalized lowercase p is not translated to F1")
  emitted=boundInputEvents.applyBoundQuake(state,46,boundInputEvents.INPUT_KEY,133,1,"+lookup")
  count=count+req(state.lookup.active and emitted[0].key==133,"normalized navigation key retained")
  boundInputEvents.applyBoundQuake(state,50,boundInputEvents.INPUT_MOUSE,4,-6,"")
  count=count+req(state.mouseDx[0]==4 and state.mouseDy[0]==-6,"normalized native mouse motion remains relative")
  // WM_KILLFOCUS emits releases for each held normalized key; replay that
  // native stream through the managed kbuttons and allow the retained short
  // click once, then verify no movement/attack remains stuck on later ticks.
  state=boundInputCore.create(0.0,0.0,0.0)
  boundInputEvents.applyBoundQuake(state,10,boundInputEvents.INPUT_KEY,119,1,"+forward")
  boundInputEvents.applyBoundQuake(state,20,boundInputEvents.INPUT_KEY,178,1,"+attack")
  boundInputEvents.applyBoundQuake(state,30,boundInputEvents.INPUT_KEY,119,0,"+forward")
  boundInputEvents.applyBoundQuake(state,30,boundInputEvents.INPUT_KEY,178,0,"+attack")
  first=boundInputCore.createCommand(state,boundInputCore.defaults(),50,50,50,2,1.0,0,false)
  afterFocus=boundInputCore.createCommand(state,boundInputCore.defaults(),100,50,100,2,1.0,0,false)
  count=count+req(not boundInputEvents.anyDown(state) and (first.buttons&1)!=0 and (afterFocus.buttons&1)==0 and afterFocus.forwardmove==0,"focus releases prevent stuck managed movement and attack")
  print("PASS: "+str(count)+" key binding-dispatch contracts");return 0
end function
