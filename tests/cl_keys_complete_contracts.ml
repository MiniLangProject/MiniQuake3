import mq3.client.cl_keys_runtime as cl
import mq3.client.console_input as console

struct Capture commands reliable prints clipboard end struct
function commandFn(cap,text) cap.commands=cap.commands+[text];return void end function
function reliableFn(cap,text) cap.reliable=cap.reliable+[text];return void end function
function printFn(cap,text) cap.prints=cap.prints+[text];return void end function
function clipboardFn(cap) return cap.clipboard end function
function req(ok,text) if not ok then return error(7801,"cl_keys: "+text) end if;return 1 end function
function main(args)
  count=0;cap=Capture([],[],[],"paste");services=console.services(cap);services.commandFn=commandFn;services.reliableFn=reliableFn;services.printFn=printFn;services.clipboardFn=clipboardFn;state=cl.create(8,services)
  count=count+req(cl.CA_UNINITIALIZED==0 and cl.CA_DISCONNECTED==1 and cl.CA_AUTHORIZING==2 and cl.CA_CONNECTING==3 and cl.CA_CHALLENGING==4 and cl.CA_CONNECTED==5 and cl.CA_LOADING==6 and cl.CA_PRIMED==7 and cl.CA_ACTIVE==8 and cl.CA_CINEMATIC==9,"Baseq3 connstate_t ABI")
  count=count+req(cl.CL_InitKeyCommands(state) and state.initialized,"CL_InitKeyCommands")
  count=count+req(cl.Key_StringToKeynum("SPACE")==32 and cl.Key_KeynumToString(32)=="SPACE" and cl.Key_KeynumToString(34)=="0x22","key string ABI")
  count=count+req(cl.Key_StringToKeynum("0xff")==255 and cl.Key_StringToKeynum("")==-1,"hex and empty key parsing")
  count=count+req(cl.Key_SetBinding(state,119,"+forward") and cl.Key_GetBinding(state,119)=="+forward" and state.archiveModified,"binding storage")
  cl.Key_SetBinding(state,87,"+forward");count=count+req(cl.Key_GetKey(state,"+FORWARD")==87,"first case-insensitive binding")
  count=count+req(cl.Key_Bind_f(state,["bind","SPACE","+moveup"]) and cl.Key_GetBinding(state,32)=="+moveup","Key_Bind_f")
  count=count+req(cl.Key_Bind_f(state,["bind","x","say","hello"]) and cl.Key_GetBinding(state,120)=="say hello","Key_Bind_f argument join")
  count=count+req(cl.Key_Unbind_f(state,["unbind","x"]) and cl.Key_GetBinding(state,120)=="","Key_Unbind_f")
  listed=cl.Key_Bindlist_f(state,["bindlist"]);count=count+req(listed==3,"Key_Bindlist_f")
  written=cl.Key_WriteBindings(state);count=count+req(written=="unbindall\nbind SPACE \"+moveup\"\nbind W \"+forward\"\nbind w \"+forward\"\n","Key_WriteBindings ordering")
  count=count+req(cl.Key_Unbindall_f(state,["unbindall"]) and cl.Key_GetBinding(state,32)=="","Key_Unbindall_f")
  cl.Key_SetOverstrikeMode(state,true);count=count+req(cl.Key_GetOverstrikeMode(state),"overstrike setters")
  field=state.consoleState.console;cl.Field_CharEvent(state,field,97);cl.Field_CharEvent(state,field,98);field.cursor=0;cl.Field_CharEvent(state,field,90);count=count+req(field.text=="Zb","Field_CharEvent overstrike")
  cl.Key_SetOverstrikeMode(state,false);field.cursor=1;cl.Field_KeyDownEvent(state,field,console.K_DEL);count=count+req(field.text=="Z","Field_KeyDownEvent")
  field.cursor=1;cl.Field_Paste(state,field);count=count+req(field.text=="Zpaste","Field_Paste")
  draw=cl.Field_Draw(state,field,10,20,100,true,0);big=cl.Field_BigDraw(state,field,10,20,100,true,0);count=count+req(draw.text=="Zpaste" and draw.size==8 and big.size==16 and draw.cursorVisible,"Field_Draw and Field_BigDraw")
  blink=cl.Field_VariableSizeDraw(state,field,0,0,100,8,true,256);count=count+req(not blink.cursorVisible,"Field_VariableSizeDraw blink")
  state.consoleState.connectionState=cl.CA_ACTIVE;cl.Key_SetBinding(state,119,"+forward; say go; +attack");cl.CL_KeyEvent(state,119,true,25);count=count+req(cl.Key_IsDown(state,119) and state.anyKeyDown==1 and state.events[len(state.events)-3].text=="+forward 119 25\n","CL_KeyEvent down")
  cl.CL_KeyEvent(state,119,false,40);count=count+req(not cl.Key_IsDown(state,119) and state.anyKeyDown==0 and state.events[len(state.events)-1].text=="-attack 119 40\n","CL_AddKeyUpCommands")
  cl.CL_KeyEvent(state,96,true,50);count=count+req((state.consoleState.catcher&cl.KEYCATCH_CONSOLE)!=0,"hardcoded console toggle")
  cl.CL_CharEvent(state,99);count=count+req(state.consoleState.console.text=="c","CL_CharEvent console")
  state.consoleState.catcher=0;state.consoleState.connectionState=cl.CA_ACTIVE;cl.Key_SetBinding(state,97,"+moveleft");cl.CL_KeyEvent(state,97,true,60);cl.Key_ClearStates(state);count=count+req(not cl.Key_IsDown(state,97) and state.anyKeyDown==0,"Key_ClearStates releases keys")
  console.beginMessage(state.consoleState,true,-1);state.consoleState.chat.text="ready";state.consoleState.chat.cursor=5;cl.Message_Key(state,console.K_ENTER);count=count+req(cap.reliable[0]=="say_team \"ready\"\n","Message_Key")
  state.consoleState.catcher=cl.KEYCATCH_CONSOLE;state.consoleState.console.text="/map q3dm1";state.consoleState.console.cursor=10;cl.Console_Key(state,console.K_ENTER);count=count+req(cap.commands[len(cap.commands)-1]=="map q3dm1\n","Console_Key")
  state.consoleState.catcher=cl.KEYCATCH_UI;cl.CL_CharEvent(state,65);count=count+req(state.events[len(state.events)-1].kind=="ui-key" and state.events[len(state.events)-1].key==(65|cl.K_CHAR_FLAG),"UI char dispatch")
  state.consoleState.catcher=cl.KEYCATCH_CGAME;cl.CL_KeyEvent(state,cl.K_ESCAPE,true,70);count=count+req((state.consoleState.catcher&cl.KEYCATCH_CGAME)==0,"escape clears cgame catcher")
  state.consoleState.catcher=0;state.demoPlaying=true;cl.CL_KeyEvent(state,32,true,80);count=count+req(cl.Key_IsDown(state,32) and state.events[len(state.events)-1].kind=="ui-menu" and state.events[len(state.events)-1].text=="main","demo input remaps to escape")
  cl.Key_ClearStates(state);state.demoPlaying=false;state.consoleState.catcher=0;state.consoleState.connectionState=cl.CA_DISCONNECTED;state.consoleState.console.text="";state.consoleState.console.cursor=0;cl.CL_CharEvent(state,100);count=count+req(state.consoleState.console.text=="d","disconnected chars route to console")
  state.events=[];state.consoleState.connectionState=cl.CA_CINEMATIC;cl.CL_KeyEvent(state,32,true,90);count=count+req(len(state.events)>=2 and state.events[0].kind=="set-nextdemo" and state.events[len(state.events)-1].kind=="ui-menu","cinematic input remaps to escape")
  cl.Key_ClearStates(state);state.events=[];state.consoleState.catcher=0;state.consoleState.connectionState=cl.CA_PRIMED;cl.Key_SetBinding(state,112,"+scores");cl.CL_KeyEvent(state,112,true,100);count=count+req(len(state.events)==1 and state.events[0].kind=="command" and state.events[0].text=="+scores 112 100\n","primed input uses normal binding route")
  count=count+req(not cl.Key_IsDown(state,-1) and cl.Key_GetBinding(state,-1)=="","sentinel key behavior")
  print("PASS: "+str(count)+" complete cl_keys contracts");return 0
end function
