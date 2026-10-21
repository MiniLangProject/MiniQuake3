import mq3.client.ui_qmenu as q
function line(value) print(value) end function
function integer(value) return q.idiv(value,1) end function
function boolean(value) if value then return 1 end if;return 0 end function
function main(args)
  t=q.item(q.MTYPE_TEXT,"text",0,10,20,0);t=q.Text_Init(t);line("text|"+str(t.flags))
  t=q.item(q.MTYPE_BTEXT,"banner",0,10,20,0);t=q.BText_Init(t);line("btext|"+str(t.flags))
  b=q.item(q.MTYPE_BITMAP,"pic",0,100,30,q.QMF_RIGHT_JUSTIFY);b.width=-20;b.height=-10;b=q.Bitmap_Init(b);line("bitmap|"+str(b.left)+"|"+str(b.right)+"|"+str(b.top)+"|"+str(b.bottom)+"|"+str(b.shader)+"|"+str(b.focusshader))
  a=q.item(q.MTYPE_ACTION,"PLAY",0,100,50,0);a=q.Action_Init(a);line("action|"+str(a.left)+"|"+str(a.right)+"|"+str(a.top)+"|"+str(a.bottom))
  rb=q.item(q.MTYPE_RADIOBUTTON,"Enabled",0,200,90,0);rb=q.RadioButton_Init(rb);line("radio-init|"+str(rb.left)+"|"+str(rb.right)+"|"+str(rb.top)+"|"+str(rb.bottom));s=q.RadioButton_Key(rb,q.K_LEFTARROW);line("radio-key|"+str(s)+"|"+str(rb.curvalue)+"|1|"+str(q.QM_ACTIVATED));rb.flags=q.QMF_HASMOUSEFOCUS;s=q.RadioButton_Key(rb,q.K_MOUSE1);line("radio-mouse|"+str(s)+"|"+str(rb.curvalue))
  sl=q.item(q.MTYPE_SLIDER,"Volume",0,300,100,0);sl.minvalue=0.0;sl.maxvalue=10.0;sl.curvalue=5.0;sl=q.Slider_Init(sl);line("slider-init|"+str(sl.left)+"|"+str(sl.right)+"|"+str(sl.top)+"|"+str(sl.bottom));s=q.Slider_Key(sl,q.K_RIGHTARROW,0);line("slider-right|"+str(s)+"|"+str(integer(sl.curvalue))+"|1");sl.curvalue=10.0;s=q.Slider_Key(sl,q.K_RIGHTARROW,0);line("slider-limit|"+str(s)+"|"+str(integer(sl.curvalue)));sl.curvalue=5.0;s=q.Slider_Key(sl,q.K_MOUSE1,316);line("slider-mouse|"+str(s)+"|"+str(integer(sl.curvalue)))
  spin=q.item(q.MTYPE_SPINCONTROL,"Mode",0,200,120,0);spin.itemnames=["Easy","Nightmare"];spin=q.SpinControl_Init(spin);line("spin-init|"+str(spin.left)+"|"+str(spin.right)+"|"+str(spin.numitems));s=q.SpinControl_Key(spin,q.K_MOUSE1);line("spin-key|"+str(s)+"|"+str(spin.curvalue));s=q.SpinControl_Key(spin,q.K_RIGHTARROW);line("spin-limit|"+str(s)+"|"+str(spin.curvalue))
  list=q.item(q.MTYPE_SCROLLLIST,"",0,100,150,0);list.width=8;list.height=3;list.itemnames=["A","B","C","D","E"];list=q.ScrollList_Init(list);line("scroll-init|"+str(list.left)+"|"+str(list.right)+"|"+str(list.top)+"|"+str(list.bottom)+"|"+str(list.columns)+"|"+str(list.separation))
  m=q.menu(true,false);m=q.Menu_AddItem(m,q.item(q.MTYPE_ACTION,"A",0,0,0,0));m=q.Menu_AddItem(m,q.item(q.MTYPE_ACTION,"B",0,0,0,q.QMF_GRAYED));m=q.Menu_AddItem(m,q.item(q.MTYPE_ACTION,"C",0,0,0,q.QMF_MOUSEONLY));m=q.Menu_AddItem(m,q.item(q.MTYPE_ACTION,"D",0,0,0,0));m.cursor=1;m.cursor_prev=0;q.Menu_AdjustCursor(m,1);line("adjust-next|"+str(m.cursor));m.cursor=4;m.cursor_prev=3;q.Menu_AdjustCursor(m,1);line("adjust-wrap|"+str(m.cursor));m.items[0].callback=function(v,e)=>0;line("item|"+str(boolean(q.Menu_ItemAtCursor(m)==m.items[0]))+"|"+str(q.Menu_ActivateItem(m,m.items[0])))
  return 0
end function
