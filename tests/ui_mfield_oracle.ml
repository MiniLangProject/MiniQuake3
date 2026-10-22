import mq3.client.ui_mfield as m
import mq3.client.ui_qmenu as q
function show(tag,f) mode=0;if f.overstrike then mode=1 end if;print(tag+"|"+f.buffer+"|"+str(f.cursor)+"|"+str(f.scroll)+"|"+str(mode)) end function
function main(args)
  f=m.field(3,8);f.buffer="abc";f.cursor=1;f.overstrike=false;m.MField_CharEvent(f,88);show("overwrite",f);f.overstrike=true;m.MField_CharEvent(f,89);show("insert",f);m.MField_CharEvent(f,8);show("backspace",f);m.MField_KeyDownEvent(f,q.K_DEL,false,false,"");show("delete",f);m.MField_KeyDownEvent(f,q.K_END,false,false,"");show("end",f);m.MField_KeyDownEvent(f,q.K_LEFTARROW,false,false,"");show("left",f);m.MField_KeyDownEvent(f,q.K_INS,true,false,"12");show("paste",f);m.MField_CharEvent(f,1);show("home",f);m.MField_Clear(f);show("clear",f)
  f.buffer="abcdef";f.cursor=6;f.scroll=5;f.widthInChars=3;f.overstrike=false;draw=m.MField_Draw(f,100,20,q.UI_SMALLFONT|q.UI_PULSE,void,true);print("draw|"+draw.text+"|"+str(f.scroll)+"|"+str(draw.x)+"|"+str(draw.cursorX)+"|"+str(draw.cursorChar))
  mf=m.MenuField(m.field(4,4),"",q.QMF_UPPERCASE,0,0,0,0,0,0,0,0);result=m.MenuField_Key(mf,q.K_CHAR_FLAG|98,false,false,"");print("menu|"+mf.field.buffer+"|"+str(result.key));mf.flags=q.QMF_NUMBERSONLY;result=m.MenuField_Key(mf,q.K_CHAR_FLAG|120,false,false,"");print("buzz|"+str(result.sound)+"|"+mf.field.buffer);return 0
end function
