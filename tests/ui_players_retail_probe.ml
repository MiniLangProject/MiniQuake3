import mq3.client.ui_players as players
import mq3.client.ui_playermodel as models
import mq3.format.pk3 as pk3

function req(ok,label) if not ok then return error(7983,"Retail UI player/model: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  files=[];for each entry in archive.entries files=files+[entry.name] end for
  animation=pk3.read(archive,"models/players/sarge/animation.cfg");if animation is error then return animation end if
  source=players.assetSource(files,[["models/players/sarge/animation.cfg",decode(animation)]],false);pi=players.create();count=0
  count=count+req(players.UI_RegisterClientModelname(source,pi,"sarge/default"),"register Sarge from pak0")
  count=count+req(pi.legsModel=="models/players/sarge/lower.md3" and pi.torsoModel=="models/players/sarge/upper.md3" and pi.headModel=="models/players/sarge/head.md3","retail MD3 paths")
  count=count+req(pi.legsSkin=="models/players/sarge/lower_default.skin" and pi.torsoSkin=="models/players/sarge/upper_default.skin" and pi.headSkin=="models/players/sarge/head_default.skin","retail skin paths")
  count=count+req(len(pi.animations)==31 and pi.animations[players.LEGS_WALKCR].firstFrame>=0,"retail animation.cfg")
  count=count+req(len(source.actions)==6 and source.actions[0].boundary=="renderer" and source.actions[0].kind=="register-model","typed renderer registration")
  dispatched=true;for each action in source.actions if not action.dispatched then dispatched=false end if end for;count=count+req(dispatched,"production host actions dispatched")
  state=models.create(source);models.PlayerModel_BuildList(state,files,false,false);count=count+req(state.nummodels==89 and state.numpages==6,"retail portrait catalog")
  found=false;for each icon in state.modelnames if icon=="models/players/sarge/icon_default" then found=true end if end for;count=count+req(found,"Sarge default portrait")
  print("PASS: "+str(count)+" retail UI player/model contracts models="+str(state.nummodels)+" animations="+str(len(pi.animations)));return 0
end function
