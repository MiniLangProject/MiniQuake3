import mq3.server.game_vm as gameVm
function main(args)
  print str(gameVm.GAME_INIT)+"|"+str(gameVm.GAME_SHUTDOWN)+"|"+str(gameVm.GAME_CLIENT_CONNECT)+"|"+str(gameVm.GAME_CLIENT_BEGIN)+"|"+str(gameVm.GAME_CLIENT_USERINFO_CHANGED)+"|"+str(gameVm.GAME_CLIENT_DISCONNECT)+"|"+str(gameVm.GAME_CLIENT_COMMAND)+"|"+str(gameVm.GAME_CLIENT_THINK)+"|"+str(gameVm.GAME_RUN_FRAME)+"|"+str(gameVm.GAME_CONSOLE_COMMAND)+"|"+str(gameVm.BOTAI_START_FRAME)
  return 0
end function
