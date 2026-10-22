import mq3.client.ui_specify_server as specify
function req(ok,label) if not ok then return error(7862,"UI specify server contract: "+label) end if;return 1 end function
function main(args)
 count=0;menu=specify.open();count=count+req(menu.wrapAround and menu.fullscreen and menu.port=="27960" and menu.actions==["push"],"defaults")
 count=count+req(menu.domainWidth==38 and menu.domainMax==80 and menu.portWidth==6 and menu.portMax==5,"field limits")
 count=count+req(len(menu.assets)==6 and menu.assets[4]=="menu/art/fight_0","cache")
 menu.domain="example.org";menu=specify.event(menu,specify.ID_SPECIFYSERVERGO,specify.QM_ACTIVATED);count=count+req(menu.commands==["connect example.org:27960\n"],"connect default port")
 noport=specify.init();noport.domain="127.0.0.1";noport.port="";noport=specify.event(noport,specify.ID_SPECIFYSERVERGO,specify.QM_ACTIVATED);count=count+req(noport.commands==["connect 127.0.0.1\n"],"connect no port")
 empty=specify.event(specify.init(),specify.ID_SPECIFYSERVERGO,specify.QM_ACTIVATED);count=count+req(len(empty.commands)==0,"empty ignored")
 back=specify.event(specify.init(),specify.ID_SPECIFYSERVERBACK,specify.QM_ACTIVATED);count=count+req(back.actions==["pop"],"back")
 back=specify.event(back,specify.ID_SPECIFYSERVERBACK,0);count=count+req(len(back.actions)==1,"notification ignored")
 print("PASS: "+str(count)+" native UI specify server contracts (4 symbols)");return 0
end function
