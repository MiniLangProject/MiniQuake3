import mq3.game.g_local as g
function main(args)
  print("strings "+g.GAMEVERSION+"|"+g.SP_PODIUM_MODEL)
  print("timing "+str(g.BODY_QUEUE_SIZE)+" "+str(g.INFINITE)+" "+str(g.FRAMETIME)+" "+str(g.CARNAGE_REWARD_TIME)+" "+str(g.REWARD_SPRITE_TIME)+" "+str(g.INTERMISSION_DELAY_TIME)+" "+str(g.SP_INTERMISSION_DELAY_TIME))
  print("flags "+str(g.FL_GODMODE)+" "+str(g.FL_NOTARGET)+" "+str(g.FL_TEAMSLAVE)+" "+str(g.FL_NO_KNOCKBACK)+" "+str(g.FL_DROPPED_ITEM)+" "+str(g.FL_NO_BOTS)+" "+str(g.FL_NO_HUMANS)+" "+str(g.FL_FORCE_GESTURE))
  print("enums "+str(g.MOVER_POS1)+" "+str(g.MOVER_POS2)+" "+str(g.MOVER_1TO2)+" "+str(g.MOVER_2TO1)+"|"+str(g.CON_DISCONNECTED)+" "+str(g.CON_CONNECTING)+" "+str(g.CON_CONNECTED)+"|"+str(g.SPECTATOR_NOT)+" "+str(g.SPECTATOR_FREE)+" "+str(g.SPECTATOR_FOLLOW)+" "+str(g.SPECTATOR_SCOREBOARD)+"|"+str(g.TEAM_BEGIN)+" "+str(g.TEAM_ACTIVE))
  print("limits "+str(g.FOLLOW_ACTIVE1)+" "+str(g.FOLLOW_ACTIVE2)+" "+str(g.MAX_NETNAME)+" "+str(g.MAX_VOTE_COUNT)+" "+str(g.MAX_SPAWN_VARS)+" "+str(g.MAX_SPAWN_VARS_CHARS)+" "+str(g.MAX_FILEPATH))
  print("damage "+str(g.DAMAGE_RADIUS)+" "+str(g.DAMAGE_NO_ARMOR)+" "+str(g.DAMAGE_NO_KNOCKBACK)+" "+str(g.DAMAGE_NO_PROTECTION))
  // The QVM ABI is ILP32; the exact unchanged-C sizes and offsets are asserted
  // here while MiniLang uses managed objects for the same semantic records.
  print("sizes 48 28 148 776 808 9212 292")
  print("entity 0 208 516 520 576 804")
  print("client 0 468 616 644 772")
  print("level 0 4 8 12 16 4508 4512 9124 9176 9180")
  return 0
end function
