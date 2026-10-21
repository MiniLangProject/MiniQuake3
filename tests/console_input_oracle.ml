// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.console_input as input
import mq3.client.key_bindings_config as config
import mq3.vm.cgame_key_traps as keys

function hexByte(value)
 digits="0123456789abcdef";high=(value>>4)&15;low=value&15
 return decode(slice(bytes(digits),high,1))+decode(slice(bytes(digits),low,1))
end function
function dump(label,state,field) encoded="";for each value in bytes(field.text) encoded=encoded+hexByte(value) end for;over=0;if state.overstrike then over=1 end if;print(label+" "+str(field.cursor)+" "+str(field.scroll)+" "+str(over)+" "+encoded) end function
function main(args)
 state=input.create(3,input.services(void));f=state.console
 input.charEvent(state,f,97);input.charEvent(state,f,98);input.charEvent(state,f,99);dump("insert",state,f)
 input.fieldKeyDown(state,f,input.K_LEFTARROW,false,false);input.fieldKeyDown(state,f,input.K_DEL,false,false);dump("delete",state,f)
 input.fieldKeyDown(state,f,input.K_INS,false,false);input.charEvent(state,f,90);dump("overstrike",state,f)
 input.charEvent(state,f,1);dump("home",state,f);input.charEvent(state,f,5);input.charEvent(state,f,8);dump("end-back",state,f)
 state=input.create(5,input.services(void));f=state.console;f.text="abcdef";f.cursor=4;f.scroll=2;input.fieldKeyDown(state,f,input.K_HOME,false,false);input.fieldKeyDown(state,f,input.K_RIGHTARROW,false,false);dump("navigation",state,f)
 keyState=keys.create();keys.setBinding(keyState,119,"+forward");keys.setBinding(keyState,32,"+moveup");raw=bytes(config.bindingText(config.create(keyState)));encoded="";for each value in raw encoded=encoded+hexByte(value) end for;print("bindings "+encoded)
 return 0
end function
