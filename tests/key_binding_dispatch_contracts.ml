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
  print("PASS: "+str(count)+" key binding-dispatch contracts");return 0
end function
