import mq3.client.cgame_servercmds as server
import std.string as strings
function req(value,message) if not value then return error(7825,message) end if;return 1 end function
function sound(path,compress) return path end function
function find(actions,kind) for each item in actions if item.kind==kind then return item end if end for;return void end function
function main(args)
  count=0;s=server.create()
  count=count+req(server.validOrder("GETFLAG")==server.TEAMTASK_OFFENSE and server.validOrder("defendflag")==server.TEAMTASK_DEFENSE and server.validOrder("bad")==-1,"valid orders")
  s.clients[2].team=1;scores=["scores","2","7","8","2","12","33","4","5","6","70","1","2","3","4","5","1","6","99","20","44","9","8","7","60","0","0","0","0","0","0","1"]
  count=count+req(server.parseScores(s,scores)==2 and s.teamScores==[7,8],"score header")
  count=count+req(s.scores[0].client==2 and s.scores[0].score==12 and s.scores[0].captures==6 and s.scores[0].team==1,"score fields")
  count=count+req(s.clients[2].score==12 and s.clients[2].powerups==6 and s.scores[1].client==0,"score client clamp")
  count=count+req(server.parseTeamInfo(s,["tinfo","1","2","9","88","55","7","16"])==1 and s.clients[2].location==9 and s.clients[2].health==88 and s.clients[2].armor==55 and s.clients[2].curWeapon==7 and s.clients[2].powerups==16,"team info")
  s.configstrings[server.CS_SERVERINFO]="\\g_gametype\\4\\dmflags\\8\\teamflags\\3\\fraglimit\\20\\capturelimit\\8\\timelimit\\15\\sv_maxclients\\12\\mapname\\q3ctf1\\g_redTeam\\Stroggs\\g_blueTeam\\Pagans"
  parsed=server.parseServerinfo(s);count=count+req(s.gametype==4 and s.dmflags==8 and s.mapname=="maps/q3ctf1.bsp" and s.redTeam=="Stroggs" and s.blueTeam=="Pagans","server info")
  count=count+req(len(parsed.actions)==3 and parsed.actions[0].value=="g_gametype","server info cvars")
  s.configstrings[server.CS_WARMUP]="5000";warm=server.parseWarmup(s);count=count+req(s.warmup==5000 and s.warmupCount==-1 and find(warm.actions,"prepare-team")!=void,"warmup start")
  s.configstrings[server.CS_SCORES1]="4";s.configstrings[server.CS_SCORES2]="3";s.configstrings[server.CS_LEVEL_START_TIME]="1200";s.configstrings[server.CS_FLAGSTATUS]="21";server.setConfigValues(s);count=count+req(s.scores1==4 and s.scores2==3 and s.levelStartTime==1200 and s.redflag==2 and s.blueflag==1,"initial config values")
  s.configstrings[server.CS_SHADERSTATE]="textures/a=textures/b:1.5@x=y:0@";remaps=server.shaderStateChanged(s,false);count=count+req(len(remaps.actions)==2 and remaps.actions[0].value=="textures/a" and remaps.actions[0].value2=="textures/b" and not remaps.actions[0].dispatched,"shader state")
  changed=server.configStringModified(s,server.CS_VOTE_TIME,"42",true);count=count+req(s.voteTime==42 and s.voteModified and len(changed.actions)==0,"vote config")
  changed=server.configStringModified(s,server.CS_MODELS+3,"models/a.md3",false);count=count+req(changed.actions[0].kind=="register-model" and changed.actions[0].number==3 and not changed.actions[0].dispatched,"model registration")
  changed=server.configStringModified(s,server.CS_SOUNDS+2,"*death1.wav",true);count=count+req(len(changed.actions)==0,"player sound skip")
  changed=server.configStringModified(s,server.CS_PLAYERS+5,"\\n\\Ranger",true);count=count+req(len(changed.actions)==2 and changed.actions[0].number==5,"client refresh")
  s.teamChatHeight=2;s.teamChatTime=3000;s.time=100;text="^1";for i=0 to 84 text=text+"a" end for;lines=server.addToTeamChat(s,text);count=count+req(lines==2 and s.teamChatPos==2 and s.teamLastChatPos==0,"team chat wrap")
  count=count+req(len(s.teamChatMsgs[0])==82 and strings.substr(s.teamChatMsgs[1],0,2)=="^1","team chat color carry")
  s.warmup=0;s.voteTime=99;s.intermissionStarted=true;restart=server.mapRestart(s,false);count=count+req(s.mapRestart and not s.intermissionStarted and s.voteTime==0 and s.fraglimitWarnings==0,"map restart state")
  count=count+req(find(restart.actions,"clear-particles")!=void and find(restart.actions,"fight")!=void and find(restart.actions,"center-print")!=void,"map restart effects")
  tokens=server.voiceTokens("// x\nfemale greet { sound/a.wav \"Hello there\" } /* y */ bye { sound/b.wav Bye }");count=count+req(tokens==["female","greet","{","sound/a.wav","Hello there","}","bye","{","sound/b.wav","Bye","}"],"voice lexer")
  list=server.parseVoiceChats("scripts/female1.voice","female greet { sound/a.wav \"Hello\" sound/b.wav \"Hi\" }",64,sound,true);count=count+req(list.gender==server.GENDER_FEMALE and len(list.chats)==1 and len(list.chats[0].variants)==2,"voice parser")
  count=count+req(server.getVoiceChat(list,"GREET",0.75).chat=="Hi" and server.getVoiceChat(list,"missing",0.0)==void,"voice lookup")
  files=[["scripts/female1.voice","female greet { sound/a.wav Hello }"],["scripts/male1.voice","male offense { sound/o.wav Attack }"]];count=count+req(server.loadVoiceChats(s,files,sound,true)==2,"voice load")
  count=count+req(server.headModelVoiceChats(s,"scripts/male1.voice")==1 and server.headModelVoiceChats(s,"missing.voice")==-1,"head vc parse")
  s.clients[3].name="Sarge";s.clients[3].gender=server.GENDER_MALE;s.clients[3].headModelName="sarge";s.clients[3].headSkinName="default";chosen=server.voiceChatListForClient(s,3,[]);count=count+req(chosen.name=="scripts/male1.voice","gender fallback")
  s.time=1000;s.localClientNum=0;s.randomCursor=0.0;voice=server.voiceChatLocal(s,server.SAY_TEAM,false,3,2,"offense",[],false);count=count+req(s.voiceChatBufferIn==1 and len(voice.actions)==0,"buffer voice")
  s.time=1001;played=server.playBufferedVoiceChats(s,false);count=count+req(find(played.actions,"voice")!=void and find(played.actions,"response-head")!=void and s.voiceChatTime==2001,"play voice")
  count=count+req(s.acceptTask==server.TEAMTASK_OFFENSE and s.acceptLeader==3 and s.acceptOrderTime==6001,"voice order")
  escape=decode(bytes(1,25));count=count+req(server.removeChatEscapeChar("a"+escape+"b")=="ab","chat escape")
  chat=server.serverCommand(s,["chat","hello"+escape+"!"],[],false);count=count+req(find(chat.actions,"talk")!=void and find(chat.actions,"print").value=="hello!\n","chat command")
  cp=server.serverCommand(s,["cp","Prepare"],[],false);count=count+req(cp.actions[0].kind=="center-print" and cp.actions[0].value=="Prepare","center print command")
  direct=server.serverCommand(s,["remapShader","old","new","2"],[],false);count=count+req(direct.actions[0].kind=="remap-shader" and direct.actions[0].number==2,"direct shader remap")
  shot=server.serverCommand(s,["clientLevelShot"],[],false);count=count+req(s.levelShot and shot.handled,"level shot")
  unknown=server.serverCommand(s,["wat"],[],false);count=count+req(find(unknown.actions,"print").value=="Unknown client game command: wat\n","unknown command")
  s.serverCommandSequence=0;batch=server.executeNewServerCommands(s,3,[[1,["cp","one"]],[3,["clientLevelShot"]]],[],false);count=count+req(s.serverCommandSequence==3 and len(batch.actions)==1 and s.levelShot,"sequenced commands")
  count=count+req(server.cmdArgv(["a","b"],1)=="b" and server.cmdArgv([],3)=="","Cmd_Argv")
  print("PASS: "+str(count)+" native cg_servercmds contracts");return 0
end function
