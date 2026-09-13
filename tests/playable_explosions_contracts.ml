import mq3.client.playable_explosions as explosions
import mq3.client.playable_projectile_view as view
import mq3.shared.math as qmath

function require(ok,text) if not ok then return error(7651,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.001 end function
function main(args)
  count=0;rocket=explosions.profile(view.STYLE_ROCKET);grenade=explosions.profile(view.STYLE_GRENADE);plasma=explosions.profile(view.STYLE_PLASMA);bfg=explosions.profile(view.STYLE_BFG)
  count=count+require(rocket.frequency==8.0 and len(rocket.frames)==8 and rocket.duration==1000 and rocket.sprite,"rocket shader animation profile")
  count=count+require(grenade.frequency==5.0 and len(grenade.frames)==3 and grenade.duration==600 and grenade.sprite,"grenade shader animation profile")
  count=count+require(bfg.frequency==5.0 and len(bfg.frames)==3 and bfg.duration==600 and bfg.sprite,"BFG shader animation profile")
  count=count+require(plasma.frames==["models/weaphits/plasmaboom"] and not plasma.sprite,"plasma ring profile")
  count=count+require(explosions.profile(99)==void,"unknown style rejected")
  impact=view.retailImpact(7,view.STYLE_ROCKET,[1.0,2.0,3.0],[0.0,0.0,1.0],1000)
  count=count+require(impact.expiresAt==2000 and explosions.randomOffset(impact)==15,"rocket lifetime and deterministic source skew")
  count=count+require(explosions.rotation(impact)==211,"deterministic explosion orientation")
  timing=explosions.timing(impact,rocket,1100);count=count+require(timing==[115,1985],"shader time includes source skew")
  count=count+require(near(explosions.spriteRadius(1985,985,1100),34.83),"sprite expands from 30 to 72 units")
  count=count+require(near(explosions.triangleWave(0.25),0.5) and near(explosions.triangleWave(0.75),0.5),"plasma triangle wave")
  uv=explosions.plasmaUv([0.2,0.7],0);count=count+require(near(uv[0],0.0) and near(uv[1],0.8333333333),"plasma stretch starts at shader amplitude")
  axes=explosions.plasmaAxes(impact);count=count+require(near(axes[0][2],1.0) and near(qmath.DotProduct(axes[1],axes[2]),0.0),"plasma model follows impact normal")
  count=count+require(explosions.MAX_TEXTURES==15 and explosions.MAX_TRIANGLES==4096,"bounded explosion resources")
  print("PASS: "+str(count)+" playable explosion contracts");return 0
end function
