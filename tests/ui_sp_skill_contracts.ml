import mq3.client.ui_sp_skill as skill
function req(ok,label) if not ok then return error(7861,"UI SP skill contract: "+label) end if;return 1 end function
function main(args)
  count=0;menu=skill.open("\\map\\q3dm1",3)
  count=count+req(menu.fullscreen and menu.cursor==skill.ID_FIGHT and menu.arenaInfo=="\\map\\q3dm1" and len(menu.items)==8,"menu topology")
  count=count+req(menu.items[2].color=="white" and menu.items[0].color=="red" and menu.items[5].shader=="menu/art/level_complete3","initial skill")
  menu=skill.skillEvent(menu,skill.ID_NIGHTMARE,skill.QM_ACTIVATED);count=count+req(menu.skill==5 and menu.cvarWrites==[["g_spSkill",5]] and menu.items[4].color=="white","nightmare selection")
  count=count+req(menu.sounds[len(menu.sounds)-1][0]=="sound/misc/nightmare.wav","nightmare sound")
  menu=skill.skillEvent(menu,skill.ID_EASY,0);count=count+req(menu.skill==5 and len(menu.cvarWrites)==1,"ignore non activation")
  menu=skill.fightEvent(menu,skill.QM_ACTIVATED);count=count+req(menu.actions[len(menu.actions)-1]==["spArenaStart","\\map\\q3dm1"],"fight routing")
  menu=skill.backEvent(menu,skill.QM_ACTIVATED);count=count+req(menu.actions[len(menu.actions)-1]=="pop" and menu.sounds[len(menu.sounds)-1][0]=="sound/misc/silence.wav","back")
  before=len(menu.sounds);menu=skill.key(menu,skill.K_ESCAPE);count=count+req(len(menu.sounds)==before+1 and menu.actions[len(menu.actions)-1]==["defaultKey",skill.K_ESCAPE],"key forwarding")
  count=count+req([skill.clampSkill(-2),skill.clampSkill(3),skill.clampSkill(9)]==[1,3,5],"skill clamp")
  count=count+req(len(skill.cache())==12,"complete cache")
  print("PASS: "+str(count)+" UI SP skill contracts");return 0
end function
