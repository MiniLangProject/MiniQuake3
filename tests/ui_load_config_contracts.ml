import mq3.client.ui_load_config as load
function req(ok,label) if not ok then return error(7862,"UI load config contract: "+label) end if;return 1 end function
function main(args)
 count=0;menu=load.open(["autoexec.cfg","custom.CFG","plain"])
 count=count+req(menu.wrapAround and menu.fullscreen and menu.names==["AUTOEXEC","CUSTOM","PLAIN"] and menu.actions==["push"],"list normalization")
 count=count+req(len(menu.assets)==9 and menu.assets[6]=="menu/art/arrows_horz_0","cache")
 menu.selected=1;menu=load.event(menu,load.ID_GO,load.QM_ACTIVATED);count=count+req(menu.commands==["exec CUSTOM\n"] and menu.actions[len(menu.actions)-1]=="pop","load")
 left=load.event(load.init(["a.cfg"]),load.ID_LEFT,load.QM_ACTIVATED);right=load.event(left,load.ID_RIGHT,load.QM_ACTIVATED);count=count+req(right.actions==["scroll:left","scroll:right"],"paging")
 empty=load.init([]);count=count+req(empty.goHidden and empty.names==["No Files Found."],"empty")
 empty=load.event(empty,load.ID_GO,load.QM_ACTIVATED);count=count+req(len(empty.commands)==0,"empty cannot load")
 before=len(menu.actions);menu=load.event(menu,load.ID_BACK,0);count=count+req(len(menu.actions)==before,"ignore notification")
 many=[];for i=0 to 130 many=many+["c"+str(i)+".cfg"] end for;count=count+req(len(load.init(many).names)==128,"config limit")
 print("PASS: "+str(count)+" native UI load config contracts (4 symbols)");return 0
end function
