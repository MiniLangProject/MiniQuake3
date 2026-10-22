import mq3.client.ui_shared as ui
import mq3.compat.numeric as numeric
function flag(value) if value then return 1 end if;return 0 end function

function main(args)
  print("hash "+str(ui.hashForString("Player"))+" "+str(ui.hashForString("player")));print("keyword "+str(ui.KeywordHash_Key("RECT"))+" "+str(ui.KeywordHash_Key("rect")))
  r=ui.rect(10.0,20.0,30.0,40.0);print("rect "+str(flag(ui.Rect_ContainsPoint(r,20.0,30.0)))+" "+str(flag(ui.Rect_ContainsPoint(r,10.0,30.0)))+" "+str(flag(ui.Rect_ContainsPoint(r,40.0,60.0))));print("visible "+str(flag(ui.IsVisible(ui.WINDOW_VISIBLE)))+" "+str(flag(ui.IsVisible(ui.WINDOW_VISIBLE|ui.WINDOW_FADINGOUT))))
  c=ui.LerpColor(ui.color(-1.0,0.0,0.5,1.0),ui.color(2.0,1.0,1.5,-1.0),0.5);print("lerp "+str(numeric.trunc32(c.r*1000))+" "+str(numeric.trunc32(c.g*1000))+" "+str(numeric.trunc32(c.b*1000))+" "+str(numeric.trunc32(c.a*1000)))
  f=ui.Fade(ui.WINDOW_VISIBLE|ui.WINDOW_FADINGOUT,0.05,1.0,0,10,true,0.1,1);print("fadeout "+str(f[0])+" "+str(numeric.trunc32(f[1]*1000))+" "+str(f[2]));f=ui.Fade(ui.WINDOW_VISIBLE|ui.WINDOW_FADINGIN,0.95,1.0,0,10,true,0.1,1);print("fadein "+str(f[0])+" "+str(numeric.trunc32(f[1]*1000))+" "+str(f[2]))
  m=ui.memory(64);p=ui.UI_Alloc(m,1);print("alloc1 "+str(p)+" "+str(m.used));p=ui.UI_Alloc(m,16);print("alloc2 "+str(p)+" "+str(m.used));p=ui.UI_Alloc(m,40);print("overflow "+str(flag(p is void))+" "+str(flag(ui.UI_OutOfMemory(m))));return 0
end function
