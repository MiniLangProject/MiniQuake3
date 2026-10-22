import mq3.renderer.tr_font_runtime as font
import mq3.format.pk3 as pk3
struct Capture calls end struct
function shader(capture,name) capture.calls=capture.calls+1;return capture.calls end function
function req(ok,label) if not ok then return error(7800,"tr_font Retail: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;count=0;archive=pk3.open(args[0]);if archive is error then return archive end if
  state=font.create(archive);capture=Capture(0);count=count+req(not font.R_InitFreeType(state,false),"shipped Baseq3 FreeType-disabled lifecycle")
  for each size in [12,16,20] result=font.RE_RegisterFont(state,capture,shader,"fonts/arial.ttf",size);count=count+req(not result.found and result.data==void,"pre-rendered font absent at "+str(size)) end for
  count=count+req(state.registeredFontCount==0 and capture.calls==0,"missing fonts do not mutate registry")
  atlas=pk3.read(archive,"gfx/2d/bigchars.tga");count=count+req(not (atlas is error) and len(atlas)>18 and atlas[2]==2,"real Baseq3 bitmap font atlas")
  font.R_DoneFreeType(state);count=count+req(state.registeredFontCount==0 and not state.freeTypeInitialized,"Retail shutdown")
  print("PASS: "+str(count)+" Retail tr_font contracts");return 0
end function
