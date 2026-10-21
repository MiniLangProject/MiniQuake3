import mq3.client.ui_mods as mods
function req(ok,label) if not ok then return error(7862,"UI mods contract: "+label) end if;return 1 end function
function main(args)
  count=0;menu=mods.open([["missionpack","Team Arena"],["long_mod_directory_name","A description that is intentionally longer than forty seven characters total"]])
  count=count+req(menu.wrapAround and menu.fullscreen and len(menu.entries)==3 and menu.actions[len(menu.actions)-1]=="push","topology")
  count=count+req(menu.entries[0].game=="" and menu.entries[0].description=="Quake III Arena","base entry")
  count=count+req(menu.entries[1].game=="missionpack" and menu.entries[1].description=="Team Arena","parsed entry")
  count=count+req(len(menu.entries[2].game)==15 and len(menu.entries[2].description)==47,"bounded copies")
  count=count+req(len(menu.assets)==6 and menu.assets[2]=="menu/art/load_0","cache")
  menu.selected=1;menu=mods.event(menu,mods.ID_GO,mods.QM_ACTIVATED);count=count+req(menu.cvarWrites==["fs_game=missionpack"] and menu.commands==["vid_restart;"] and menu.actions[len(menu.actions)-1]=="pop","load event")
  before=len(menu.actions);menu=mods.event(menu,mods.ID_GO,0);count=count+req(len(menu.actions)==before,"ignore notification")
  menu=mods.event(menu,mods.ID_BACK,mods.QM_ACTIVATED);count=count+req(menu.actions[len(menu.actions)-1]=="pop","back")
  extra=mods.loadModFromFile(mods.loadMods([]),"foo.mod","Foo");count=count+req(extra.entries[1].game=="foo","legacy file helper")
  many=[];for i=0 to 69 many=many+[["m"+str(i),"M"+str(i)]] end for;limited=mods.loadMods(many);count=count+req(len(limited.entries)==64,"mod limit")
  print("PASS: "+str(count)+" native UI mods contracts (7 symbols)");return 0
end function
