import mq3.client.ui_shared as ui
import mq3.compat.textnumbers as numbers

function req(ok,label) if not ok then return error(7961,"ui_shared contract: "+label) end if;return 1 end function
function main(args)
  count=0;dc=ui.display(false);ui.Init_Display(dc)
  count=count+req(ui.hashForString("Player") == ui.hashForString("player") and ui.KeywordHash_Key("RECT")==ui.KeywordHash_Key("rect"),"case-insensitive hashes")
  mem=ui.memory(32);count=count+req(ui.UI_Alloc(mem,1)==0 and ui.UI_Alloc(mem,16)==16 and ui.UI_OutOfMemory(mem)==false,"aligned allocator");count=count+req(ui.UI_Alloc(mem,1)==void and ui.UI_OutOfMemory(mem),"allocator overflow")
  s=ui.source("1.25 -7 1 2 3 4 10 20 30 40 hello { setcvar test 1 }","parser");count=count+req(ui.Float_Parse(s)==1.25 and ui.Int_Parse(s)==-7,"numeric parser");c=ui.Color_Parse(s);r=ui.Rect_Parse(s);count=count+req(c.r==1 and c.a==4 and r.x==10 and r.h==40 and ui.String_Parse(s)=="hello","typed parser");count=count+req(ui.PC_Script_Parse(s)=="setcvar test 1","script parser")
  count=count+req(ui.Rect_ContainsPoint(ui.rect(10.0,20.0,30.0,40.0),20.0,30.0) and not ui.Rect_ContainsPoint(ui.rect(10.0,20.0,30.0,40.0),10.0,30.0),"strict hit test")
  lc=ui.LerpColor(ui.color(-1.0,0.0,0.5,1.0),ui.color(2.0,1.0,1.5,-1.0),0.5);count=count+req(lc.r==0.5 and lc.g==0.5 and lc.b==1.0 and lc.a==0.0,"lerp clamps components")
  faded=ui.Fade(ui.WINDOW_VISIBLE|ui.WINDOW_FADINGOUT,0.05,1.0,0,10,true,0.1,1);count=count+req((faded[0]&ui.WINDOW_VISIBLE)==0 and faded[1]<0.0,"fade out clears visibility")
  text="{ name main rect 0 0 640 480 fullscreen 1 visible 1 focuscolor 1 0 0 1 fadeClamp 1 fadeAmount 0.1 fadeCycle 10 onOpen { setcvar opened 1 } itemDef { name play rect 10 20 100 30 type 1 visible 1 text PLAY action { setcvar action fired } } itemDef { name volume rect 10 60 200 20 type 10 visible 1 cvar s_volume cvarFloat s_volume 0.5 0 1 } }"
  parsed=ui.menu();src=ui.source(text,"contract.menu");ok=ui.Menu_Parse(src,parsed);count=count+req(ok and parsed.window.name=="main" and len(parsed.items)==2 and len(src.errors)==0 and len(src.warnings)==0,"menu and item parser")
  dc.menus=[parsed];ui.Menus_ActivateByName(dc,"main");count=count+req(ui.Display_VisibleMenuCount(dc)==1 and ui.pairGet(dc.cvars,"opened","")=="1","activation script")
  play=ui.Menu_FindItemByName(parsed,"play");count=count+req(ui.Item_SetFocus(dc,play,20,25) and parsed.cursorItem==0,"focus")
  ui.Item_Action(dc,play);count=count+req(ui.pairGet(dc.cvars,"action","")=="fired","item action")
  volume=ui.Menu_FindItemByName(parsed,"volume");dc.cvars=ui.pairSet(dc.cvars,"s_volume","0.5");count=count+req(ui.Item_Slider_ThumbPosition(dc,volume)>volume.window.rect.x,"slider thumb");ui.Item_Slider_HandleKey(dc,volume,ui.K_RIGHTARROW,true);count=count+req(numbers.atof(str(ui.pairGet(dc.cvars,"s_volume","0")))>0.5,"slider key")
  edit=ui.item();edit.window.flags=ui.WINDOW_VISIBLE;edit.type=ui.ITEM_TYPE_EDITFIELD;edit.cvar="name";edit.typeData.maxChars=8;dc.cvars=ui.pairSet(dc.cvars,"name","ab");edit.typeData.cursorPos=2;ui.Item_TextField_HandleKey(dc,edit,99);count=count+req(ui.pairGet(dc.cvars,"name","")=="abc","edit insertion")
  list=ui.item();list.window.flags=ui.WINDOW_VISIBLE;list.type=ui.ITEM_TYPE_LISTBOX;list.special=3.0;list.window.rect=ui.rect(0.0,0.0,100.0,100.0);list.typeData.elementHeight=20.0;dc.cvars=ui.pairSet(dc.cvars,"feederCount:"+str(list.special),10);count=count+req(ui.Item_ListBox_MaxScroll(dc,list)==5,"list max scroll");ui.Item_ListBox_HandleKey(dc,list,ui.K_DOWNARROW,true,false);count=count+req(list.typeData.cursorPos==1,"list selection")
  multi=ui.item();multi.type=ui.ITEM_TYPE_MULTI;multi.cvar="mode";multi.typeData.settings=["A","B"];multi.typeData.values=["a","b"];dc.cvars=ui.pairSet(dc.cvars,"mode","a");ui.Item_Multi_HandleKey(dc,multi,ui.K_RIGHTARROW);count=count+req(ui.pairGet(dc.cvars,"mode","")=="b" and ui.Item_Multi_Setting(dc,multi)=="B","multi cycling")
  yes=ui.item();yes.cvar="enabled";dc.cvars=ui.pairSet(dc.cvars,"enabled","0");ui.Item_YesNo_HandleKey(dc,yes,ui.K_ENTER);count=count+req(ui.pairGet(dc.cvars,"enabled","")=="1","yes/no toggle")
  ui.Controls_SetDefaults(dc);keys=ui.Controls_GetKeyAssignment(dc,"+attack");count=count+req(keys[0]==ui.K_CTRL and keys[1]==-1 and ui.BindingIDFromName("+attack")>=0,"bindings")
  ui.Menu_PaintAll(dc);count=count+req(len(dc.actions)>0 and dc.actions[len(dc.actions)-1].dispatched,"typed renderer actions")
  retail=ui.display(true);ui.emit(retail,"renderer","draw","","",0,void);count=count+req(not retail.actions[0].dispatched,"retail suppression")
  beforeStrings=len(dc.memory.strings);first=ui.String_Alloc(dc,"shared");second=ui.String_Alloc(dc,"shared");count=count+req(first==second and len(dc.memory.strings)==beforeStrings+1 and ui.String_Report(dc)[0]==1,"string interning")
  play.cvarTest="gate";play.enableCvar="yes";dc.cvars=ui.pairSet(dc.cvars,"gate","yes");count=count+req(ui.Item_EnableShowViaCvar(dc,play,1),"cvar enable");dc.cvars=ui.pairSet(dc.cvars,"gate","no");count=count+req(not ui.Item_EnableShowViaCvar(dc,play,1),"cvar disable")
  ui.Menu_TransitionItemByName(parsed,"play",ui.rect(0.0,0.0,10.0,10.0),ui.rect(20.0,10.0,30.0,20.0),1,2.0);dc.realtime=2;ui.Item_UpdateEffects(dc,play);dc.realtime=4;ui.Item_UpdateEffects(dc,play);count=count+req(play.window.rectClient.x==20.0 and (play.window.flags&ui.WINDOW_INTRANSITION)==0,"transition completion")
  oldX=play.window.rectClient.x;ui.Menu_OrbitItemByName(parsed,"play",oldX,play.window.rectClient.y,100.0,100.0,1);dc.realtime=6;ui.Item_UpdateEffects(dc,play);count=count+req(play.window.rectClient.x!=oldX,"orbit step")
  bind=ui.item();bind.cvar="+attack";count=count+req(ui.Item_Bind_HandleKey(dc,bind,ui.K_ENTER,true) and ui.Display_KeyBindPending(dc),"bind capture");ui.Item_Bind_HandleKey(dc,bind,ui.K_MOUSE1,true);keys=ui.Controls_GetKeyAssignment(dc,"+attack");count=count+req(not ui.Display_KeyBindPending(dc) and keys[0]==ui.K_MOUSE1,"bind commit")
  owner=ui.item();owner.ownerDraw=42;owner.ownerDrawFlags=7;owner.window.flags=ui.WINDOW_VISIBLE;before=len(dc.actions);ui.Item_OwnerDraw_Paint(dc,owner);count=count+req(len(dc.actions)==before+1 and dc.actions[len(dc.actions)-1].boundary=="ownerdraw","ownerdraw boundary")
  ui.Menu_FadeItemByName(parsed,"volume",true);count=count+req((volume.window.flags&ui.WINDOW_FADINGOUT)!=0 and not ui.IsVisible(volume.window.flags),"fade visibility")
  print("PASS: "+str(count)+" ui_shared native contracts");return 0
end function
