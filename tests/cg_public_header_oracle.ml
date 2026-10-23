import mq3.client.cgame_public as p
function main(args)
  print "limits "+str(p.CMD_BACKUP)+" "+str(p.CMD_MASK)+" "+str(p.MAX_ENTITIES_IN_SNAPSHOT)+" "+str(p.CGAME_IMPORT_API_VERSION)
  print "events "+str(p.CGAME_EVENT_NONE)+" "+str(p.CGAME_EVENT_TEAMMENU)+" "+str(p.CGAME_EVENT_SCOREBOARD)+" "+str(p.CGAME_EVENT_EDITHUD)
  print "imports0 "+str(p.CG_PRINT)+" "+str(p.CG_ARGS)+" "+str(p.CG_FS_FOPENFILE)+" "+str(p.CG_UPDATESCREEN)+" "+str(p.CG_CM_LOADMAP)+" "+str(p.CG_CM_MARKFRAGMENTS)+" "+str(p.CG_S_STARTSOUND)+" "+str(p.CG_S_STARTBACKGROUNDTRACK)+" "+str(p.CG_R_LOADWORLDMAP)+" "+str(p.CG_R_REGISTERSHADER)
  print "imports1 "+str(p.CG_R_CLEARSCENE)+" "+str(p.CG_R_LERPTAG)+" "+str(p.CG_GETGLCONFIG)+" "+str(p.CG_GETGAMESTATE)+" "+str(p.CG_GETSNAPSHOT)+" "+str(p.CG_GETUSERCMD)+" "+str(p.CG_R_REGISTERSHADERNOMIP)+" "+str(p.CG_MEMORY_REMAINING)+" "+str(p.CG_R_REGISTERFONT)+" "+str(p.CG_KEY_GETKEY)
  print "imports2 "+str(p.CG_PC_ADD_GLOBAL_DEFINE)+" "+str(p.CG_PC_SOURCE_FILE_AND_LINE)+" "+str(p.CG_S_STOPBACKGROUNDTRACK)+" "+str(p.CG_REAL_TIME)+" "+str(p.CG_SNAPVECTOR)+" "+str(p.CG_REMOVECOMMAND)+" "+str(p.CG_R_LIGHTFORPOINT)+" "+str(p.CG_CIN_PLAYCINEMATIC)+" "+str(p.CG_CIN_SETEXTENTS)+" "+str(p.CG_R_REMAP_SHADER)
  print "imports3 "+str(p.CG_S_ADDREALLOOPINGSOUND)+" "+str(p.CG_S_STOPLOOPINGSOUND)+" "+str(p.CG_CM_TEMPCAPSULEMODEL)+" "+str(p.CG_CM_CAPSULETRACE)+" "+str(p.CG_CM_TRANSFORMEDCAPSULETRACE)+" "+str(p.CG_R_ADDADDITIVELIGHTTOSCENE)+" "+str(p.CG_GET_ENTITY_TOKEN)+" "+str(p.CG_R_ADDPOLYSTOSCENE)+" "+str(p.CG_R_INPVS)+" "+str(p.CG_FS_SEEK)
  print "builtins "+str(p.CG_MEMSET)+" "+str(p.CG_MEMCPY)+" "+str(p.CG_STRNCPY)+" "+str(p.CG_SIN)+" "+str(p.CG_COS)+" "+str(p.CG_ATAN2)+" "+str(p.CG_SQRT)+" "+str(p.CG_FLOOR)+" "+str(p.CG_CEIL)+" "+str(p.CG_TESTPRINTINT)+" "+str(p.CG_TESTPRINTFLOAT)+" "+str(p.CG_ACOS)
  print "exports "+str(p.CG_INIT)+" "+str(p.CG_SHUTDOWN)+" "+str(p.CG_CONSOLE_COMMAND)+" "+str(p.CG_DRAW_ACTIVE_FRAME)+" "+str(p.CG_CROSSHAIR_PLAYER)+" "+str(p.CG_LAST_ATTACKER)+" "+str(p.CG_KEY_EVENT)+" "+str(p.CG_MOUSE_EVENT)+" "+str(p.CG_EVENT_HANDLING)
  print "snapshot 53772 0 4 8 12 44 512 516 53764 53768"
  return 0
end function
