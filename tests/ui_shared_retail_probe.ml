import mq3.client.ui_shared as ui
import mq3.format.pk3 as pk3
import std.string as strings

function req(ok,label) if not ok then return error(7962,"retail ui_shared: "+label) end if;return 1 end function
function has(files,path) for each name in files if strings.equalsIgnoreCaseAscii(name,path) then return true end if end for;return false end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;files=[];for each entry in archive.entries files=files+[entry.name] end for;count=0
  count=count+req(has(files,"menu/art/slider2.tga") and has(files,"menu/art/sliderbutt_0.tga") and has(files,"menu/art/switch_on.tga") and has(files,"menu/art/3_cursor2.tga"),"real retail widget assets")
  dc=ui.display(false);value=ui.menu();value.window.name="retail";value.window.flags=ui.WINDOW_VISIBLE|ui.WINDOW_HASFOCUS;value.window.rect=ui.rect(0.0,0.0,640.0,480.0);value.window.background="menu/art/cut_frame.tga"
  slider=ui.item();slider.parent=value;slider.window.flags=ui.WINDOW_VISIBLE;slider.window.rect=ui.rect(100.0,100.0,200.0,20.0);slider.type=ui.ITEM_TYPE_SLIDER;slider.cvar="s_volume";slider.typeData.minVal=0.0;slider.typeData.maxVal=1.0;slider.typeData.defVal=0.8
  yes=ui.item();yes.parent=value;yes.window.flags=ui.WINDOW_VISIBLE;yes.window.rect=ui.rect(100.0,140.0,100.0,20.0);yes.type=ui.ITEM_TYPE_YESNO;yes.cvar="cg_drawGun";yes.window.background="menu/art/switch_on.tga";value.items=[slider,yes];dc.menus=[value];dc.focus=value;dc.cvars=[["s_volume","0.8"],["cg_drawGun","1"]]
  count=count+req(ui.Item_Slider_ThumbPosition(dc,slider)>200.0,"retail slider geometry")
  ui.Display_CacheAll(dc);count=count+req(len(dc.actions)>=2 and dc.actions[0].kind=="register-shader","asset registration boundary")
  before=len(dc.actions);ui.Menu_PaintAll(dc);count=count+req(len(dc.actions)>before and dc.actions[len(dc.actions)-1].boundary=="renderer","retail widget paint")
  count=count+req(ui.Display_CursorType(dc,110.0,110.0)==ui.CURSOR_SIZER and ui.Display_CursorType(dc,10.0,10.0)==ui.CURSOR_ARROW,"cursor hit testing")
  dc.cursorx=150.0;ui.Item_Slider_HandleKey(dc,slider,ui.K_MOUSE1,true);count=count+req(ui.pairGet(dc.cvars,"s_volume","")!="0.8","slider interaction")
  ui.Item_YesNo_HandleKey(dc,yes,ui.K_MOUSE1);count=count+req(ui.pairGet(dc.cvars,"cg_drawGun","")=="0","yes/no interaction")
  suppressed=ui.display(true);ui.emit(suppressed,"renderer","draw-handle-pic","menu/art/cut_frame.tga","",0,void);count=count+req(not suppressed.actions[0].dispatched,"QVM suppression")
  print("PASS: "+str(count)+" retail ui_shared contracts assets="+str(len(files)));return 0
end function
