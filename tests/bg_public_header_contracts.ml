import mq3.game.bg_public as b
function req(ok,label) if not ok then return error(7954,"bg_public.h: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(b.GAME_VERSION=="baseq3-1" and b.DEFAULT_GRAVITY==800 and b.GIB_HEALTH==-40,"version and physics")
  count=count+req(b.MAX_ITEMS==256 and b.DEFAULT_SHOTGUN_SPREAD==700 and b.DEFAULT_SHOTGUN_COUNT==11 and b.ITEM_RADIUS==15,"item and weapon constants")
  count=count+req(b.MINS_Z==-24 and b.DEFAULT_VIEWHEIGHT==26 and b.CROUCH_VIEWHEIGHT==12 and b.DEAD_VIEWHEIGHT==-16,"view heights")
  count=count+req(b.CS_MODELS==32 and b.CS_SOUNDS==288 and b.CS_PLAYERS==544 and b.CS_LOCATIONS==608 and b.CS_PARTICLES==672 and b.CS_MAX==736,"configstring ranges")
  count=count+req(b.PMF_ALL_TIMES==(b.PMF_TIME_WATERJUMP|b.PMF_TIME_LAND|b.PMF_TIME_KNOCKBACK) and b.MAXTOUCH==32,"pmove flags")
  count=count+req(b.EV_EVENT_BITS==(b.EV_EVENT_BIT1|b.EV_EVENT_BIT2) and b.EVENT_VALID_MSEC==300,"event flags")
  count=count+req(b.MASK_PLAYERSOLID==0x02010001 and b.MASK_DEADSOLID==0x00010001 and b.MASK_WATER==0x38 and b.MASK_OPAQUE==0x19 and b.MASK_SHOT==0x06000001,"content masks")
  count=count+req(b.DF_NO_FALLING==8 and b.DF_FIXED_FOV==16 and b.DF_NO_FOOTSTEPS==32,"dm flags")
  count=count+req(b.ITEM_INDEX(17)==17,"managed item index")
  count=count+req(len(b.typeNames())==20,"public type inventory")
  print("PASS: "+str(count)+" bg_public.h ABI contracts")
  return 0
end function
