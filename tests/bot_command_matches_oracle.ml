import mq3.game.bot_command_matches as cmd
function main(args)
  state=cmd.create(void);state.maxclients=4;state.names[0]="Ranger";state.names[1]="Major Tom";state.names[2]="Sarge"
  print("find="+str(cmd.FindClientByName(state,"Sarge"))+","+str(cmd.FindClientByName(state,"major"))+","+str(cmd.FindClientByName(state,"Rang"))+","+str(cmd.FindClientByName(state,"Xaero")))
  p=cmd.BotGPSToPosition(" -12 34 005");print("gps="+str(p[0])+","+str(p[1])+","+str(p[2]));p=cmd.BotGPSToPosition("1,-2;3");print("punct="+str(p[0])+","+str(p[1])+","+str(p[2]));return 0
end function
