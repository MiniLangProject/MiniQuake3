import mq3.client.ui_mfield as m
import mq3.client.ui_qmenu as q
function req(value,message) if not value then return error(7892,message) end if;return 1 end function
function main(args)
  count=0;f=m.field(4,6);f.buffer="abcd";f.cursor=2;f.scroll=0;m.MField_KeyDownEvent(f,q.K_RIGHTARROW,false,false,"");count=count+req(f.cursor==3 and f.scroll==0,"right visible");m.MField_KeyDownEvent(f,q.K_RIGHTARROW,false,false,"");count=count+req(f.cursor==4 and f.scroll==1,"right scroll");m.MField_KeyDownEvent(f,q.K_HOME,false,false,"");count=count+req(f.cursor==0 and f.scroll==0,"home");m.MField_KeyDownEvent(f,q.K_END,false,false,"");count=count+req(f.cursor==4 and f.scroll==1,"end")
  m.MField_CharEvent(f,3);count=count+req(f.buffer=="" and f.cursor==0,"ctrl-c clear");f.overstrike=true;m.MField_Paste(f,"abcdefghi");count=count+req(f.buffer=="abcdef" and f.cursor==5,"maxchars paste");m.MField_CharEvent(f,8);count=count+req(f.buffer=="abcdf" and f.cursor==4,"backspace")
  mf=m.MenuField(m.field(8,8),"Label",q.QMF_SMALLFONT,100,20,0,0,0,0,1,1);m.MenuField_Init(mf);count=count+req(mf.left==52 and mf.right==172 and mf.bottom==36,"field bounds");mf.field.buffer="ok";draw=m.MenuField_Draw(mf,true);count=count+req(len(draw)>=4 and not draw[0].dispatched,"suppressed draws");result=m.MenuField_Key(mf,q.K_ENTER,false,false,"");count=count+req(result.key==q.K_TAB,"enter advances");print("PASS: "+str(count)+" native ui_mfield contracts");return 0
end function
