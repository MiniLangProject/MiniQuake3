import mq3.format.pk3 as pk3
import mq3.botlib.ai_chat_matches as chat
import mq3.game.bot_command_matches as cmd
function req(ok,label) if not ok then return error(7442,"retail ai_cmd: "+label) end if;return 1 end function
struct RetailContext archive reads end struct
function read(loader,name) loader.reads=loader.reads+1;data=pk3.read(loader.archive,name);if data is error then return data end if;return decode(data) end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;matcher=chat.create(RetailContext(archive,0),read);loaded=chat.ensureLoaded(matcher);if loaded is error then return loaded end if;c=0;c=c+req(loaded==138,"retail match template count")
  s=cmd.create(matcher);s.maxclients=3;s.names[0]="Sarge";s.names[1]="Ranger";s.names[2]="Major";s.teams[0]=1;s.teams[1]=1;s.teams[2]=1;s.configs[0]="x";s.configs[1]="x";s.configs[2]="x";s.itemGoals=[cmd.goal(1,-1,8,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,"Rocket Launcher")];b=cmd.createBot(0);b.team=1
  c=c+req(cmd.BotMatchMessage(s,b,"(Ranger) Atrium: get the Rocket Launcher",true),"retail get-item dispatch");c=c+req(b.ltgtype==cmd.LTG_GETITEM,"get-item state transition")
  m=chat.findMatch(matcher,"(Ranger) Atrium: get the flag",cmd.MTCONTEXT_MISC|cmd.MTCONTEXT_INITIALTEAMCHAT|cmd.MTCONTEXT_CTF);c=c+req(m!=void and not (m is error) and m.type==cmd.MSG_GETFLAG,"retail getflag grammar")
  m=chat.findMatch(matcher,"Ranger entered the game",cmd.MTCONTEXT_MISC|cmd.MTCONTEXT_INITIALTEAMCHAT|cmd.MTCONTEXT_CTF);c=c+req(m!=void and not (m is error),"retail enter-game grammar")
  text=pk3.read(archive,"botfiles/teamplay.h");c=c+req(not (text is error) and len(text)>1000,"retail teamplay definitions")
  print("PASS: "+str(c)+" Retail qagame ai_cmd probes templates="+str(loaded));return 0
end function
