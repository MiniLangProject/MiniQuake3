import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.format.player_animation as anim

function main(args)
  if len(args)<1 then print("usage: player_animation_retail_smoke <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  base="models/players/sarge/"
  configData=pk3.read(archive,base+"animation.cfg");if configData is error then return configData end if
  cfg=anim.parse(decode(configData));if cfg is error then return cfg end if
  lower=md3.load(pk3.read(archive,base+"lower.md3"));if lower is error then return lower end if
  upper=md3.load(pk3.read(archive,base+"upper.md3"));if upper is error then return upper end if
  pair=anim.samplePlayer(cfg,anim.LEGS_WALK,anim.TORSO_GESTURE,75);if pair is error then return pair end if
  lowerTriangles=0;upperTriangles=0
  for i=0 to len(lower.surfaces)-1 value=anim.render(lower,i,pair.lower,4);if value is error then return value end if;lowerTriangles=lowerTriangles+len(value) end for
  for i=0 to len(upper.surfaces)-1 value=anim.render(upper,i,pair.upper,4);if value is error then return value end if;upperTriangles=upperTriangles+len(value) end for
  print("PASS: retail Sarge animation rows="+str(len(cfg.animations))+" lowerFrames="+str(lower.numFrames)+" upperFrames="+str(upper.numFrames)+" sampledTriangles="+str(lowerTriangles+upperTriangles));return 0
end function
