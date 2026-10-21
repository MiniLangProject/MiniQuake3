import mq3.client.ui_playermodel as m
import mq3.client.ui_players as p
import mq3.client.ui_qmenu as menu

function req(ok,label) if not ok then return error(7982,"UI playermodel contract: "+label) end if;return 1 end function
function animText() text="";for i=0 to 30 text=text+str(i*10)+" 4 2 10\n" end for;return text end function
function data()
  files=[];for i=0 to 17 files=files+["models/players/model"+str(i)+"/icon_skin"+str(i)+".tga"] end for;files=files+["models/players/model0/lower.md3","models/players/model0/upper.md3","models/players/model0/head.md3","models/players/model0/lower_skin0.skin","models/players/model0/upper_skin0.skin","models/players/model0/head_skin0.skin","models/weapons2/machinegun/machinegun.md3","models/weapons2/machinegun/machinegun_barrel.md3","models/weapons2/machinegun/machinegun_flash.md3"];return files
end function
function main(args)
  count=0;source=p.assetSource(data(),[["models/players/model0/animation.cfg",animText()]],false);value=m.create(source);count=count+req(m.PlayerModel_BuildList(value,data(),false,false)==18 and value.numpages==2,"model list and pages")
  m.PlayerModel_MenuInit(value,data(),"^1Player","model0/skin0",false,false);count=count+req(len(value.menu.items)==44 and value.playername=="Player" and value.selectedmodel==0,"menu initialization");count=count+req(value.menu.items[4].string=="Player" and value.menu.items[5].string=="MODEL0" and value.menu.items[6].string=="SKIN0","visible player/model/skin labels")
  count=count+req((value.pics[0].flags&menu.QMF_HIGHLIGHT)!=0 and (value.picbuttons[0].flags&menu.QMF_PULSEIFFOCUS)==0 and (value.picbuttons[15].flags&menu.QMF_INACTIVE)==0,"first grid")
  m.PlayerModel_MenuEvent(value,m.ID_NEXTPAGE,menu.QM_ACTIVATED,false);count=count+req(value.modelpage==1 and (value.picbuttons[0].flags&menu.QMF_INACTIVE)==0 and (value.picbuttons[2].flags&menu.QMF_INACTIVE)!=0,"next page grid")
  count=count+req(m.PlayerModel_PicEvent(value,1,menu.QM_ACTIVATED,6000000) and value.selectedmodel==17 and value.modelskin=="model17/skin17" and value.modelname=="MODEL17","picture selection")
  count=count+req(not m.PlayerModel_PicEvent(value,3,menu.QM_ACTIVATED,6000000),"dead slot rejected")
  m.PlayerModel_SaveChanges(value,false);count=count+req(len(value.cvarWrites)==4 and value.cvarWrites[0][1]=="model17/skin17","four model cvars")
  m.PlayerModel_MenuEvent(value,m.ID_BACK,menu.QM_ACTIVATED,false);count=count+req(value.popped and len(value.cvarWrites)==8,"back saves and pops")
  low=m.create(source);low.memoryRemaining=m.LOW_MEMORY;count=count+req(len(m.PlayerModel_DrawPlayer(low,0,16,false))==0 and low.actions[0].name=="LOW MEMORY","low-memory preview")
  cache=m.create(source);m.PlayerModel_Cache(cache,data(),false,false);count=count+req(len(cache.actions)==28,"art and portrait cache")
  full=m.create(source);m.UI_PlayerModelMenu(full,data(),"Player","model0/skin0",false,false);count=count+req(full.pushed and full.menu.cursor==8 and full.playerinfo.legsModel!="","menu push and live preview")
  full.menu.cursor=8;count=count+req(m.PlayerModel_MenuKey(full,menu.K_RIGHTARROW,0,0,false)==menu.SOUND_MOVE and full.menu.cursor==10,"grid keyboard right")
  full.menu.cursor=8;count=count+req(m.PlayerModel_MenuKey(full,menu.K_LEFTARROW,0,0,false)==menu.SOUND_BUZZ,"grid left boundary")
  full.menu.cursor=8;m.PlayerModel_MenuKey(full,menu.K_ENTER,0,0,false);count=count+req(full.selectedmodel==0,"enter selects portrait")
  esc=m.create(source);m.UI_PlayerModelMenu(esc,data(),"Player","model0/skin0",false,false);m.PlayerModel_MenuKey(esc,menu.K_ESCAPE,0,0,false);count=count+req(len(esc.cvarWrites)==4 and esc.menu.popped,"escape saves through default pop")
  build=m.create(source);m.PlayerModel_BuildList(build,data(),true,false);count=count+req(len(build.actions)>=18 and build.actions[0].boundary=="audio","buildscript announcement precache")
  print("PASS: "+str(count)+" UI playermodel contracts");return 0
end function
