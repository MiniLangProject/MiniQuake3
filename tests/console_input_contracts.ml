// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.console_input as input
import mq3.client.key_bindings_config as config
import mq3.vm.cgame_key_traps as keys
import mq3.qcommon.command_buffer as command

struct Capture commands reliable prints scrolls clipboard end struct
function cmd(cap,text) cap.commands=cap.commands+[text];return void end function
function reliable(cap,text) cap.reliable=cap.reliable+[text];return void end function
function emit(cap,text) cap.prints=cap.prints+[text];return void end function
function clipboard(cap) return cap.clipboard end function
function captureScroll(cap,name,count) cap.scrolls=cap.scrolls+[[name,count]];return void end function
function req(value,label) if not value then return error(7739,"console input: "+label) end if;return 1 end function
function main(args)
 count=0;cap=Capture([],[],[],[],"PASTE");host=input.services(cap);host.commandFn=cmd;host.reliableFn=reliable;host.printFn=emit;host.clipboardFn=clipboard;host.scrollFn=captureScroll
 state=input.create(4,host);f=state.console
 input.charEvent(state,f,97);input.charEvent(state,f,98);input.charEvent(state,f,99);count=count+req(f.text=="abc" and f.cursor==3 and f.scroll==0,"insert")
 input.charEvent(state,f,100);count=count+req(f.scroll==1,"horizontal scroll")
 input.fieldKeyDown(state,f,input.K_LEFTARROW,false,false);input.fieldKeyDown(state,f,input.K_DEL,false,false);count=count+req(f.text=="abc" and f.cursor==3,"delete")
 input.fieldKeyDown(state,f,input.K_HOME,false,false);input.fieldKeyDown(state,f,input.K_INS,false,false);input.charEvent(state,f,90);count=count+req(f.text=="Zbc" and state.overstrike,"overstrike")
 input.charEvent(state,f,3);count=count+req(f.text=="" and f.cursor==0 and f.scroll==0,"ctrl-c")
 input.charEvent(state,f,22);count=count+req(f.text=="PASTE","ctrl-v")
 input.charEvent(state,f,8);count=count+req(f.text=="PAST" and f.cursor==4,"backspace")
 state.connectionState=input.CA_ACTIVE;state.console.text="/map q3dm1";state.console.cursor=10;input.consoleKey(state,input.K_ENTER,false,false);count=count+req(cap.commands[len(cap.commands)-1]=="map q3dm1\n","explicit console command")
 state.console.text="hello";state.console.cursor=5;input.consoleKey(state,input.K_ENTER,false,false);count=count+req(cap.commands[len(cap.commands)-1]=="cmd say hello\n","active console chat")
 input.consoleKey(state,input.K_UPARROW,false,false);count=count+req(state.console.text=="hello","history up")
 input.consoleKey(state,input.K_DOWNARROW,false,false);count=count+req(state.console.text=="","history down")
 input.consoleKey(state,input.K_MWHEELUP,false,true);count=count+req(cap.scrolls[len(cap.scrolls)-1][1]==3,"accelerated scroll")
 state.chat.text="team ready";state.chatTeam=true;state.chatPlayerNum=-1;state.catcher=input.KEYCATCH_MESSAGE;input.messageKey(state,input.K_ENTER,false,false);count=count+req(cap.reliable[0]=="say_team \"team ready\"\n" and state.catcher==0,"team message")
 state.chat.text="private";state.chatPlayerNum=3;state.catcher=input.KEYCATCH_MESSAGE;input.messageKey(state,input.K_ENTER,false,false);count=count+req(cap.reliable[1]=="tell 3 \"private\"\n","tell message")
 state.chat.text="cancel";state.catcher=input.KEYCATCH_MESSAGE;input.messageKey(state,input.K_ESCAPE,false,false);count=count+req(state.chat.text=="" and state.catcher==0,"escape message")
 keyState=keys.create();commandState=command.create();command.initCommands(commandState);binding=config.create(keyState);binding.printFn=emit;binding.printContext=cap;installed=config.install(binding,commandState);count=count+req(installed==true,"install bind commands")
 command.executeText(commandState,command.EXEC_NOW,"bind w +moveright");count=count+req(keys.getBinding(keyState,119)=="+moveright","bind command")
 command.executeText(commandState,command.EXEC_NOW,"bind SPACE \"+moveup\"");count=count+req(keys.getBinding(keyState,32)=="+moveup","quoted bind")
 text=config.bindingText(binding);count=count+req(text=="unbindall\nbind SPACE \"+moveup\"\nbind w \"+moveright\"\n","write binding order")
 command.executeText(commandState,command.EXEC_NOW,"unbind w");count=count+req(keys.getBinding(keyState,119)=="","unbind command")
 keys.setBinding(keyState,97,"+moveleft");command.executeText(commandState,command.EXEC_NOW,"unbindall");count=count+req(keys.getBinding(keyState,32)=="" and keys.getBinding(keyState,97)=="","unbindall command")
 loaded=config.loadText(binding,commandState,"unbindall\nbind a \"+moveleft\"\nbind d \"+moveright\"\n");count=count+req(loaded==true and keys.getBinding(keyState,97)=="+moveleft" and keys.getBinding(keyState,100)=="+moveright","config load")
 print("PASS: "+str(count)+" console input/config contracts");return 0
end function
