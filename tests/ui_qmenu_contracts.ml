import mq3.client.ui_qmenu as q

function req(ok,label) if not ok then return error(7955,"UI QMenu contract: "+label) end if;return 1 end function
function mkAction(name,flags) return q.item(q.MTYPE_ACTION,name,1,100,50,flags) end function

function main(args)
  count=0
  m=q.menu(true,true);a=mkAction("PLAY",q.QMF_PULSEIFFOCUS);m=q.Menu_AddItem(m,a)
  count=count+req(len(m.items)==1 and m.items[0].menuPosition==0,"add item parent position")
  count=count+req(m.items[0].left==100 and m.items[0].right==164 and m.items[0].bottom==66,"action bounds")
  rows=q.Action_Draw(m,m.items[0]);count=count+req(len(rows)==2 and rows[0][0]=="string" and rows[1][0]=="char","action focus draw")

  t=q.item(q.MTYPE_TEXT,"label",2,10,20,0);t.string=" value";t.style=7;t.color=[0.2,0.3,0.4,1.0];m=q.Menu_AddItem(m,t)
  count=count+req((m.items[1].flags&q.QMF_INACTIVE)!=0,"text inactive init")
  count=count+req(q.Text_Draw(m,m.items[1])[0][5]=="label value","text concatenation")
  bt=q.item(q.MTYPE_BTEXT,"",3,320,12,q.QMF_GRAYED);bt.string="TITLE";bt.color=[1.0,0.0,0.0,1.0];bt=q.BText_Init(bt);count=count+req(q.BText_Draw(m,bt)[0][0]=="banner" and q.BText_Draw(m,bt)[0][7]==q.colorDisabled(),"banner disabled draw")

  pt=q.item(q.MTYPE_PTEXT,"",4,320,100,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);pt.string="ABC";pt.style=0;pt.color=q.colorNormal();pt=q.PText_Init(pt)
  count=count+req(pt.left==287 and pt.right==353 and pt.bottom==127,"proportional bounds")
  pt.menuPosition=0;count=count+req((q.PText_Draw(m,pt)[0][6]&q.UI_PULSE)!=0,"proportional pulse")

  bm=q.item(q.MTYPE_BITMAP,"base",5,100,30,q.QMF_RIGHT_JUSTIFY|q.QMF_HIGHLIGHT_IF_FOCUS);bm.width=-20;bm.height=-10;bm.focuspic="focus";bm.focuscolor=[1.0,0.0,0.0,1.0];bm=q.Bitmap_Init(bm)
  count=count+req(bm.left==80 and bm.right==100 and bm.bottom==40,"bitmap absolute bounds")
  bm.width=20;bm.height=10;bm.menuPosition=0;count=count+req(len(q.Bitmap_Draw(m,bm,100))==2,"bitmap focused overlay")

  rb=q.item(q.MTYPE_RADIOBUTTON,"Enabled",6,200,90,0);rb=q.RadioButton_Init(rb)
  count=count+req(rb.left==136 and rb.right==248,"radio bounds")
  count=count+req(q.RadioButton_Key(rb,q.K_LEFTARROW)==q.SOUND_MOVE and rb.curvalue==1 and rb.events==[q.QM_ACTIVATED],"radio keyboard toggle")
  count=count+req(q.RadioButton_Key(rb,q.K_MOUSE1)==q.SOUND_NONE,"radio mouse focus gate")
  rb.flags=rb.flags|q.QMF_HASMOUSEFOCUS;count=count+req(q.RadioButton_Key(rb,q.K_MOUSE1)==q.SOUND_MOVE and rb.curvalue==0,"radio mouse toggle")
  rb.menuPosition=0;count=count+req(len(q.RadioButton_Draw(m,rb))==5,"radio focused rendering")

  s=q.item(q.MTYPE_SLIDER,"Volume",7,300,100,0);s.minvalue=0.0;s.maxvalue=10.0;s.curvalue=5.0;s=q.Slider_Init(s)
  count=count+req(s.left==244 and s.right==404,"slider bounds")
  count=count+req(q.Slider_Key(s,q.K_RIGHTARROW,0)==q.SOUND_MOVE and s.curvalue==6.0,"slider increment")
  s.curvalue=10.0;count=count+req(q.Slider_Key(s,q.K_RIGHTARROW,0)==q.SOUND_BUZZ,"slider upper clamp")
  count=count+req(q.Slider_Key(s,q.K_MOUSE1,316)==q.SOUND_MOVE and s.curvalue==0.0,"slider mouse projection")
  s.menuPosition=0;draw=q.Slider_Draw(m,s);count=count+req(len(draw)==3 and s.range==0.0 and draw[2][8]=="menu/art/sliderbutt_1","slider draw range")

  spin=q.item(q.MTYPE_SPINCONTROL,"Mode",8,200,120,0);spin.itemnames=["Easy","Nightmare"];spin=q.SpinControl_Init(spin)
  count=count+req(spin.numitems==2 and spin.left==160 and spin.right==280,"spin bounds/items")
  count=count+req(q.SpinControl_Key(spin,q.K_MOUSE1)==q.SOUND_MOVE and spin.curvalue==1,"spin mouse cycle")
  count=count+req(q.SpinControl_Key(spin,q.K_RIGHTARROW)==q.SOUND_BUZZ,"spin end buzz")
  spin.menuPosition=0;count=count+req(len(q.SpinControl_Draw(m,spin))==4,"spin focused rendering")

  list=q.item(q.MTYPE_SCROLLLIST,"",9,100,150,0);list.width=8;list.height=3;list.itemnames=["Alpha","Bravo","Charlie","Delta","Echo"];list=q.ScrollList_Init(list)
  count=count+req(list.columns==1 and list.separation==0 and list.right==164 and list.bottom==198,"scroll init")
  count=count+req(q.ScrollList_Key(list,q.K_DOWNARROW,0,0)==q.SOUND_MOVE and list.curvalue==1,"scroll down")
  count=count+req(q.ScrollList_Key(list,q.K_END,0,0)==q.SOUND_MOVE and list.curvalue==4 and list.listTop==2,"scroll end")
  count=count+req(q.ScrollList_Key(list,q.K_PGUP,0,0)==q.SOUND_MOVE and list.curvalue==2 and list.listTop==2,"scroll page up")
  count=count+req(q.ScrollList_Key(list,98,0,0)==q.SOUND_MOVE and list.curvalue==1 and list.listTop==1,"scroll ascii cycle")
  list.flags=list.flags|q.QMF_HASMOUSEFOCUS;count=count+req(q.ScrollList_Key(list,q.K_MOUSE1,105,182)==q.SOUND_MOVE and list.curvalue==3,"scroll mouse selection")
  list.menuPosition=0;count=count+req(len(q.ScrollList_Draw(m,list))==4,"scroll draw rows and selection")

  multi=q.item(q.MTYPE_SCROLLLIST,"",10,320,100,q.QMF_CENTER_JUSTIFY);multi.width=5;multi.height=2;multi.columns=2;multi.itemnames=["A","B","C","D","E"];multi=q.ScrollList_Init(multi)
  count=count+req(multi.separation==3 and multi.left==268 and multi.right==372,"multi-column centered bounds")
  multi.curvalue=0;count=count+req(q.ScrollList_Key(multi,q.K_RIGHTARROW,0,0)==q.SOUND_MOVE and multi.curvalue==2,"multi-column right")

  f=q.item(q.MTYPE_FIELD,"",11,20,220,q.QMF_UPPERCASE);f.widthInChars=4;f.maxchars=6;f.buffer="ab";f=q.MenuField_Init(f)
  count=count+req(f.fieldCursor==2 and f.right==52,"field init")
  r=q.MenuField_Key(f,q.K_CHAR_FLAG|99);count=count+req(r.sound==q.SOUND_NULL and f.buffer=="abC" and f.fieldCursor==3,"field uppercase insert")
  q.MenuField_Key(f,q.K_LEFTARROW);q.MenuField_Key(f,q.K_DEL);count=count+req(f.buffer=="ab" and f.fieldCursor==2,"field cursor delete")
  f.menuPosition=0;count=count+req(len(q.MenuField_Draw(m,f))==2,"field focused draw")
  nf=q.item(q.MTYPE_FIELD,"",12,0,0,q.QMF_NUMBERSONLY);nf.widthInChars=3;nf.maxchars=3;nf=q.MenuField_Init(nf);q.MenuField_Key(nf,q.K_CHAR_FLAG|65);q.MenuField_Key(nf,q.K_CHAR_FLAG|55);count=count+req(nf.buffer=="7","field numeric filter")

  nav=q.menu(true,true);nav=q.Menu_AddItem(nav,mkAction("A",0));nav=q.Menu_AddItem(nav,mkAction("B",q.QMF_GRAYED));nav=q.Menu_AddItem(nav,mkAction("C",q.QMF_MOUSEONLY));nav=q.Menu_AddItem(nav,mkAction("D",0));nav.cursor=0
  count=count+req(q.Menu_DefaultKey(nav,q.K_DOWNARROW,0,0)==q.SOUND_MOVE and nav.cursor==3,"default key skips unavailable")
  count=count+req(q.Menu_DefaultKey(nav,q.K_DOWNARROW,0,0)==q.SOUND_MOVE and nav.cursor==0,"default key wraps")
  count=count+req(nav.items[0].events==[q.QM_LOSTFOCUS,q.QM_GOTFOCUS],"cursor focus notifications")
  count=count+req(q.Menu_DefaultKey(nav,q.K_ESCAPE,0,0)==q.SOUND_OUT and nav.popped,"escape pop")
  q.Menu_DefaultKey(nav,q.K_F11,0,0);q.Menu_DefaultKey(nav,q.K_F12,0,0);count=count+req(nav.debug and nav.commands==["screenshot\n"],"debug keys")
  nav.items[0].callback=function(v,e)=>0;count=count+req(q.Menu_DefaultKey(nav,q.K_ENTER,0,0)==q.SOUND_MOVE and nav.items[0].events[len(nav.items[0].events)-1]==q.QM_ACTIVATED,"enter activation")
  nav.items[0].flags=nav.items[0].flags|q.QMF_SILENT;count=count+req(q.Menu_ActivateItem(nav,nav.items[0])==q.SOUND_NONE,"silent activation")
  count=count+req(q.Menu_ItemAtCursor(nav)==nav.items[0],"item at cursor")
  q.Menu_SetCursor(nav,3);count=count+req(nav.cursor==3,"set cursor");q.Menu_SetCursorToItem(nav,nav.items[0]);count=count+req(nav.cursor==0,"set cursor to item")

  hidden=q.item(q.MTYPE_TEXT,"hidden",13,0,0,q.QMF_HIDDEN);hidden.string="x";hidden=q.Text_Init(hidden);m.items=m.items+[hidden];count=count+req(len(q.Menu_Draw(m,0))>=2,"menu draw dispatch/hidden")
  assets=q.Menu_Cache(false);rage=q.Menu_Cache(true);count=count+req(len(assets)==18 and assets[8]=="menuback" and rage[8]=="menubackRagePro" and assets[15]=="menu/art/slider2","menu cache assets")
  print("PASS: "+str(count)+" UI QMenu contracts")
  return 0
end function
