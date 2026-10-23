import mq3.game.g_public as p
import mq3.game.syscalls as s
function main(args)
  print("api "+str(p.GAME_API_VERSION))
  print("flags "+str(p.SVF_NOCLIENT)+" "+str(p.SVF_CLIENTMASK)+" "+str(p.SVF_BOT)+" "+str(p.SVF_BROADCAST)+" "+str(p.SVF_PORTAL)+" "+str(p.SVF_USE_CURRENT_ORIGIN)+" "+str(p.SVF_SINGLECLIENT)+" "+str(p.SVF_NOSERVERINFO)+" "+str(p.SVF_CAPSULE)+" "+str(p.SVF_NOTSINGLECLIENT))
  print("imports "+str(s.G_PRINT)+" "+str(s.G_FS_SEEK)+" "+str(s.BOTLIB_SETUP)+" "+str(s.BOTLIB_USER_COMMAND)+" "+str(s.BOTLIB_AAS_ENABLE_ROUTING_AREA)+" "+str(s.BOTLIB_EA_SAY)+" "+str(s.BOTLIB_AI_LOAD_CHARACTER)+" "+str(s.BOTLIB_PC_SOURCE_FILE_AND_LINE))
  print("exports "+str(p.GAME_INIT)+" "+str(p.GAME_SHUTDOWN)+" "+str(p.GAME_CLIENT_CONNECT)+" "+str(p.GAME_CLIENT_BEGIN)+" "+str(p.GAME_CLIENT_USERINFO_CHANGED)+" "+str(p.GAME_CLIENT_DISCONNECT)+" "+str(p.GAME_CLIENT_COMMAND)+" "+str(p.GAME_CLIENT_THINK)+" "+str(p.GAME_RUN_FRAME)+" "+str(p.GAME_CONSOLE_COMMAND)+" "+str(p.BOTAI_START_FRAME))
  print("sizes 308 516")
  return 0
end function
