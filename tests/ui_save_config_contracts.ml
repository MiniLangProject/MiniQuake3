import mq3.client.ui_save_config as save
function req(ok,label) if not ok then return error(7862,"UI save config contract: "+label) end if;return 1 end function
function main(args)
 count=0;menu=save.open();count=count+req(menu.wrapAround and menu.fullscreen and menu.maxchars==20 and menu.actions==["push"],"topology")
 count=count+req(len(menu.assets)==5 and menu.assets[4]=="menu/art/cut_frame","cache")
 empty=save.saveEvent(menu,save.QM_ACTIVATED);count=count+req(len(empty.commands)==0,"empty ignored")
 menu.name="DUEL.CFG";menu=save.saveEvent(menu,save.QM_ACTIVATED);count=count+req(menu.commands==["writeconfig DUEL.cfg\n"] and menu.actions[len(menu.actions)-1]=="pop","strip/write")
 untouched=save.saveEvent(save.init(),0);count=count+req(len(untouched.commands)==0,"notification ignored")
 back=save.backEvent(save.init(),save.QM_ACTIVATED);count=count+req(back.actions==["pop"],"back")
 draw=save.drawName(menu,true);count=count+req(len(draw)==3 and draw[2]=="field:left+pulse+small:highlight:DUEL.CFG","focused draw")
 draw=save.drawName(menu,false);count=count+req(draw[2]=="field:left+small:red:DUEL.CFG","unfocused draw")
 print("PASS: "+str(count)+" native UI save config contracts (6 symbols)");return 0
end function
