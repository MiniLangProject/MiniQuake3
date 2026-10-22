import mq3.client.ui_players_missionpack as p

function req(ok,label) if not ok then return error(7971,"missionpack UI players contract: "+label) end if;return 1 end function
function animText() text="// compressed by the original before parsing\nfootsteps default\nheadoffset 0 0 0\nsex m\n";for i=0 to 30 text=text+str(i*10)+" 4 2 10\n" end for;return text end function
function baseFiles()
  return ["models/players/sarge/lower.md3","models/players/sarge/upper.md3","models/players/sarge/head.md3","models/players/sarge/lower_default.skin","models/players/sarge/upper_default.skin","models/players/sarge/head_default.skin","models/weapons2/machinegun/machinegun.md3","models/weapons2/machinegun/machinegun_barrel.md3","models/weapons2/machinegun/machinegun_flash.md3"]
end function
function main(args)
  count=0;text=animText();animations=p.UI_ParseAnimationFile("animation.cfg",text);count=count+req(animations!=void and len(animations)==31 and animations[13].firstFrame==60 and animations[25].firstFrame==180,"compressed animation cfg and all leg-relative frames")
  src=p.assetSource(baseFiles(),[["models/players/sarge/animation.cfg",text]],false);pi=p.create();count=count+req(p.UI_FileExists(src,"models/players/sarge/head.md3") and not p.UI_FileExists(src,"missing"),"filesystem query")
  count=count+req(p.UI_FindClientHeadFile(src,"",128,"","sarge","default","head","skin")=="models/players/sarge/head_default.skin","head lookup")
  count=count+req(p.UI_RegisterClientModelname(src,pi,"sarge/default","sarge/default","") and len(pi.animations)==31,"base model")
  count=count+req(pi.headModel=="models/players/sarge/head.md3" and pi.headSkin=="models/players/sarge/head_default.skin","separate head model")
  count=count+req(len(src.actions)==6,"typed renderer registrations")
  custom=["models/players/characters/hero/lower.md3","models/players/characters/hero/upper.md3","models/players/heads/visor/visor.md3","models/players/characters/hero/red/lower_default.skin","models/players/characters/hero/red/upper_default.skin","models/players/heads/visor/head_blue.skin","models/players/characters/hero/animation.cfg","models/weapons2/machinegun/machinegun.md3","models/weapons2/machinegun/machinegun_barrel.md3","models/weapons2/machinegun/machinegun_flash.md3"]
  src2=p.assetSource(custom,[["models/players/characters/hero/animation.cfg",text]],false);pi2=p.create();count=count+req(p.UI_RegisterClientModelname(src2,pi2,"hero/default","*visor/blue","red"),"characters and heads fallback")
  count=count+req(pi2.legsModel=="models/players/characters/hero/lower.md3" and pi2.headModel=="models/players/heads/visor/visor.md3","fallback model paths")
  count=count+req(pi2.legsSkin=="models/players/characters/hero/red/lower_default.skin" and pi2.headSkin=="models/players/heads/visor/head_blue.skin","team and head skins")
  p.UI_PlayerInfo_SetModel(src,pi,"sarge/default","sarge/default","");count=count+req(pi.newModel and pi.currentWeapon==p.WP_MACHINEGUN,"set model lifecycle")
  before=len(pi.actions);rows=p.UI_DrawPlayer(src,0.0,0.0,0.0,200.0,pi,10,16,false);count=count+req(len(rows)==0 and len(pi.actions)==before,"zero-width cache draw")
  p.UI_PlayerInfo_SetInfo(src,pi,p.LEGS_IDLE,p.TORSO_STAND,[0.0,90.0,0.0],[0.0,0.0,0.0],p.WP_MACHINEGUN,true);rows=p.UI_DrawPlayer(src,0.0,0.0,320.0,560.0,pi,1000,16,true);count=count+req(len(rows)>before and rows[len(rows)-1].kind=="render-scene","preview render")
  suppressed=true;for i=before to len(rows)-1 if rows[i].dispatched then suppressed=false end if end for;count=count+req(suppressed,"retail-suppressible host boundary")
  print("PASS: "+str(count)+" missionpack UI players contracts");return 0
end function
