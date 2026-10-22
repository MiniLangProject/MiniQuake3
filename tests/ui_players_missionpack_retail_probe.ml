import mq3.client.ui_players_missionpack as p
import mq3.format.pk3 as pk3

function req(ok,label) if not ok then return error(7972,"retail missionpack UI players: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;files=[];for each entry in archive.entries files=files+[entry.name] end for;animation=pk3.read(archive,"models/players/sarge/animation.cfg");if animation is error then return animation end if
  source=p.assetSource(files,[["models/players/sarge/animation.cfg",decode(animation)]],false);pi=p.create();count=0
  count=count+req(not p.UI_RegisterClientModelname(source,pi,"sarge/default","sarge/default",""),"baseq3 correctly lacks Team Arena gesture animations")
  count=count+req(pi.legsModel=="models/players/sarge/lower.md3" and pi.torsoModel=="models/players/sarge/upper.md3" and pi.headModel=="models/players/sarge/head.md3","retail models")
  count=count+req(pi.legsSkin=="models/players/sarge/lower_default.skin" and pi.torsoSkin=="models/players/sarge/upper_default.skin" and pi.headSkin=="models/players/sarge/head_default.skin","retail skins")
  count=count+req(len(pi.animations)==0,"original Team Arena parser rejects 25-entry baseq3 animation")
  count=count+req(p.UI_FindClientHeadFile(source,"",128,"","sarge","default","head","skin")=="models/players/sarge/head_default.skin","retail head resolver")
  count=count+req(len(source.actions)==6,"typed registration count")
  dispatched=true;for each action in source.actions if not action.dispatched then dispatched=false end if end for;count=count+req(dispatched,"production host actions")
  print("PASS: "+str(count)+" retail missionpack UI player contracts baseq3-animations="+str(len(pi.animations)));return 0
end function
