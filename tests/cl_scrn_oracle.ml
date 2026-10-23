import mq3.client.cl_scrn_runtime as scr
import mq3.renderer.tr_cmds_runtime as tr
import mq3.client.ui_host_lifecycle as ui
import mq3.renderer.command_queue as commands
import mq3.compat.numeric as n

function scale(width,height,x,y,w,h)
  state=scr.create(tr.create(commands.create(void,void),commands.backend(void),tr.settings(),void),void,void,width,height,1,2);value=scr.SCR_AdjustFrom640(state,x,y,w,h)
  print("S|"+str(n.trunc32(value[0]*1000.0))+"|"+str(n.trunc32(value[1]*1000.0))+"|"+str(n.trunc32(value[2]*1000.0))+"|"+str(n.trunc32(value[3]*1000.0)))
end function
function text(value) print("T|"+str(scr.SCR_Strlen(value))+"|"+str(scr.SCR_GetBigStringWidth(value))) end function
function main(args)
  scale(640,480,10.0,20.0,30.0,40.0);scale(1280,720,10.0,20.0,30.0,40.0);scale(1920,1080,-5.0,2.0,0.5,9.0)
  text("");text("abc");text("a^1bc");text("^^x");text("^7white^1red");return 0
end function
