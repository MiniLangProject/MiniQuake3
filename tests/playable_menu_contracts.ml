import mq3.client.playable_menu as menu
import mq3.renderer.playable_materials as materials
function require(ok,text) if not ok then return error(7591,text) end if;return 1 end function
function fakeCatalog()
  image=materials.Image(256,256,bytes(4,255));assets=[];slot=246
  for each item in menu.descriptors() assets=assets+[menu.Asset(item[0],item[1]+".tga",image,slot)];slot=slot+1 end for
  return menu.Catalog(assets,246,len(assets))
end function
function main(args)
  count=0;catalog=fakeCatalog();definitions=menu.descriptors()
  count=count+require(menu.REQUIRED_TEXTURES==4 and len(definitions)==4,"bounded retail artwork set")
  count=count+require(definitions[0][1]=="menu/art/font1_prop" and definitions[1][1]=="menu/art/font1_prop_glo","original proportional fonts")
  count=count+require(definitions[2][1]=="menu/art/font2_prop" and definitions[3][1]=="menu/art/3_cursor2","original banner and cursor")
  count=count+require(menu.find(catalog,"GLOW").slot==247,"case-insensitive lookup")
  count=count+require(menu.find(catalog,"missing")==void,"unknown asset")
  count=count+require(menu.propGlyph("A")==[5,4,18] and menu.propGlyph("Z")==[5,64,14],"original proportional atlas coordinates")
  count=count+require(menu.bannerGlyph("Q")==[82,97,30] and menu.bannerGlyph("W")==[42,139,51],"original banner atlas coordinates")
  count=count+require(menu.propGlyph("?")[2]==-1 and menu.bannerGlyph("?")[2]==-1,"unsupported glyph sentinel")
  count=count+require(menu.textWidth("A A",1.0)==50.0,"proportional spacing")
  count=count+require(menu.bannerWidth("AB",1.0)==68.0,"banner spacing")
  entries=menu.menuEntries();count=count+require(len(entries)==7 and entries[0]=="SINGLE PLAYER" and entries[6]=="EXIT","Baseq3 main menu entries")
  count=count+require(menu.entryY(0)==134.0 and menu.entryY(6)==338.0,"original 34px vertical spacing")
  navigation=menu.state();count=count+require(navigation.selected==0,"menu starts on single player")
  count=count+require(menu.step(navigation,false,true,false)==menu.ACTION_NONE and navigation.selected==1,"down edge selects multiplayer")
  count=count+require(menu.step(navigation,false,true,false)==menu.ACTION_NONE and navigation.selected==1,"held down does not repeat")
  menu.step(navigation,false,false,false);menu.step(navigation,true,false,false);count=count+require(navigation.selected==0,"up edge returns to single player")
  menu.step(navigation,false,false,false);menu.step(navigation,true,false,false);count=count+require(navigation.selected==6,"selection wraps upward")
  menu.step(navigation,false,false,false);count=count+require(menu.step(navigation,false,false,true)==menu.ACTION_EXIT,"enter activates selected exit")
  count=count+require(menu.action(0)==menu.ACTION_SINGLE_PLAYER and menu.action(7)==menu.ACTION_NONE,"menu actions are bounded")
  count=count+require(try(menu.step(void,false,false,false)) is error,"missing menu state rejected")
  count=count+require(try(menu.load(void,246,4)) is error,"archive required")
  count=count+require(try(menu.load(catalog,-1,4)) is error,"negative slot rejected")
  count=count+require(try(menu.load(catalog,253,4)) is error,"native slot overflow rejected")
  count=count+require(try(menu.load(catalog,246,3)) is error,"texture budget rejected")
  print("PASS: "+str(count)+" playable menu contracts");return 0
end function
