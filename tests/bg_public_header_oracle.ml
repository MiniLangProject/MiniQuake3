import mq3.game.bg_public as b
import mq3.compat.numeric as n
function main(args)
  print("base "+str(b.DEFAULT_GRAVITY)+" "+str(b.GIB_HEALTH)+" "+str(n.floatBits(b.ARMOR_PROTECTION))+" "+str(b.MAX_ITEMS)+" "+str(b.DEFAULT_SHOTGUN_SPREAD)+" "+str(b.DEFAULT_SHOTGUN_COUNT)+" "+str(b.ITEM_RADIUS)+" "+str(b.LIGHTNING_RANGE))
  print("config "+str(b.CS_MUSIC)+" "+str(b.CS_BOTINFO)+" "+str(b.CS_ITEMS)+" "+str(b.CS_MODELS)+" "+str(b.CS_SOUNDS)+" "+str(b.CS_PLAYERS)+" "+str(b.CS_PARTICLES)+" "+str(b.CS_MAX))
  print("pmflags "+str(b.PMF_DUCKED)+" "+str(b.PMF_JUMP_HELD)+" "+str(b.PMF_BACKWARDS_JUMP)+" "+str(b.PMF_TIME_LAND)+" "+str(b.PMF_TIME_WATERJUMP)+" "+str(b.PMF_GRAPPLE_PULL)+" "+str(b.PMF_SCOREBOARD)+" "+str(b.PMF_ALL_TIMES))
  print("events "+str(b.EF_BOUNCE)+" "+str(b.EF_AWARD_DENIED)+" "+str(b.EV_EVENT_BIT1)+" "+str(b.EV_EVENT_BIT2)+" "+str(b.EV_EVENT_BITS)+" "+str(b.EVENT_VALID_MSEC))
  print("masks "+str(b.MASK_ALL)+" "+str(b.MASK_SOLID)+" "+str(b.MASK_PLAYERSOLID)+" "+str(b.MASK_DEADSOLID)+" "+str(b.MASK_WATER)+" "+str(b.MASK_OPAQUE)+" "+str(b.MASK_SHOT))
  print("enums 8 6 3 4 8 13 23 37")
  print("sizes 232 28 52")
  return 0
end function
