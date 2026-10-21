import mq3.client.ui_confirm as confirm
function req(ok,label) if not ok then return error(7862,"UI confirm contract: "+label) end if;return 1 end function
function main(args)
  count=0
  menu=confirm.open("EXIT GAME?",true,true,0,60,25,8)
  count=count+req(menu.wrapAround and menu.fullscreen and len(menu.items)==2 and menu.actions==["push","cursor:NO"],"offline topology")
  count=count+req(menu.items[0].label=="YES" and menu.items[0].x==290 and menu.slashX==318 and menu.items[1].x==329,"layout")
  connected=confirm.openStyle("RESTART?",9,false,true,confirm.CA_CONNECTED,60,25,8);count=count+req(not connected.fullscreen and connected.style==9,"connected style")
  no=confirm.event(menu,confirm.ID_CONFIRM_NO,confirm.QM_ACTIVATED);count=count+req(not no.result and no.actions[len(no.actions)-2]=="pop" and no.actions[len(no.actions)-1]=="callback:false","no event")
  yes=confirm.key(menu,"Y");count=count+req(yes.result and yes.actions[len(yes.actions)-1]=="defaultKey:Y","yes shortcut")
  tab=confirm.key(menu,"LEFTARROW");count=count+req(tab.actions[len(tab.actions)-1]=="defaultKey:TAB","arrow remap")
  before=len(menu.actions);ignored=confirm.event(menu,confirm.ID_CONFIRM_YES,0);count=count+req(len(ignored.actions)==before,"ignore event")
  drawing=confirm.draw(menu);count=count+req(len(drawing)==5 and drawing[0]=="pic:142,118,359,256:menu/art/cut_frame" and drawing[4]=="drawCallback","confirm draw")
  msg=confirm.message(["LINE ONE","LINE TWO"],confirm.CA_CONNECTED,20);count=count+req(not msg.fullscreen and len(msg.items)==1 and msg.items[0].x==310 and msg.items[0].y==280,"message topology")
  md=confirm.drawMessage(msg);count=count+req(md[1]=="text:320,188:LINE ONE" and md[2]=="text:320,206:LINE TWO" and md[3]=="drawMenu","message draw")
  count=count+req(confirm.cache()==[confirm.ART_CONFIRM_FRAME],"cache")
  print("PASS: "+str(count)+" native UI confirm contracts (8 symbols)");return 0
end function
