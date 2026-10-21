// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_servercmds.c. Host side effects are
// returned as typed actions so an unchanged Retail QVM can remain authoritative.
package mq3.client.cgame_servercmds
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as numeric
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

const MAX_CLIENTS=64
const MAX_MODELS=256
const MAX_VOICEFILES=8
const MAX_VOICECHATS=64
const MAX_VOICESOUNDS=64
const MAX_HEADMODELS=64
const MAX_VOICECHATBUFFER=32
const MAX_SAY_TEXT=150
const TEAMCHAT_HEIGHT=8
const TEAMCHAT_WIDTH=80
const GT_CTF=4
const GT_1FCTF=5
const GENDER_MALE=0
const GENDER_FEMALE=1
const GENDER_NEUTER=2
const SAY_ALL=0
const SAY_TEAM=1
const SAY_TELL=2
const TEAMTASK_OFFENSE=1
const TEAMTASK_DEFENSE=2
const TEAMTASK_PATROL=3
const TEAMTASK_FOLLOW=4
const TEAMTASK_RETRIEVE=5
const TEAMTASK_ESCORT=6
const TEAMTASK_CAMP=7
const CS_SERVERINFO=0
const CS_MUSIC=2
const CS_WARMUP=5
const CS_SCORES1=6
const CS_SCORES2=7
const CS_VOTE_TIME=8
const CS_VOTE_STRING=9
const CS_VOTE_YES=10
const CS_VOTE_NO=11
const CS_TEAMVOTE_TIME=12
const CS_TEAMVOTE_STRING=14
const CS_TEAMVOTE_YES=16
const CS_TEAMVOTE_NO=18
const CS_LEVEL_START_TIME=21
const CS_INTERMISSION=22
const CS_FLAGSTATUS=23
const CS_SHADERSTATE=24
const CS_MODELS=32
const CS_SOUNDS=288
const CS_PLAYERS=544

struct Score client score ping time scoreFlags powerups accuracy impressive excellent gauntlet defend assist perfect captures team end struct
struct Client name team score powerups location health armor curWeapon gender headModelName headSkinName end struct
struct VoiceVariant sound chat end struct
struct VoiceChat id variants end struct
struct VoiceList name gender chats end struct
struct HeadVoice headmodel voiceChatNum end struct
struct BufferedVoice clientNum sound voiceOnly cmd message end struct
struct Action boundary kind value value2 number dispatched end struct
struct Result handled actions end struct
struct State configstrings clients scores numScores teamScores sortedTeamPlayers gametype dmflags teamflags fraglimit capturelimit timelimit maxclients mapname redTeam blueTeam scores1 scores2 levelStartTime redflag blueflag flagStatus warmup warmupCount voteTime voteYes voteNo voteString voteModified teamVoteTime teamVoteYes teamVoteNo teamVoteString teamVoteModified intermissionStarted teamChatHeight teamChatTime teamChatMsgs teamChatMsgTimes teamChatPos teamLastChatPos time fraglimitWarnings timelimitWarnings mapRestart levelShot serverCommandSequence voiceLists headVoices voiceBuffer voiceChatBufferIn voiceChatBufferOut voiceChatTime currentVoiceClient acceptOrderTime acceptVoice acceptTask acceptLeader teamChatsOnly noTaunt noVoiceChats noVoiceText localClientNum randomCursor end struct

function client() return Client("",0,0,0,0,0,0,0,GENDER_MALE,"","") end function
function create()
  clients=[];for index=0 to MAX_CLIENTS-1 clients=clients+[client()] end for
  return State(array(1024,""),clients,[],0,[0,0],[],0,0,0,0,0,0,0,"","","",
    0,0,0,0,0,0,0,-1,0,0,0,"",false,[0,0],[0,0],[0,0],["",""],[false,false],false,
    TEAMCHAT_HEIGHT,3000,array(TEAMCHAT_HEIGHT,""),array(TEAMCHAT_HEIGHT,0),0,0,0,0,0,false,false,0,
    [],[],array(MAX_VOICECHATBUFFER,void),0,0,0,0,0,"",0,0,false,false,false,false,0,0.0)
end function
function action(boundary,kind,value,value2,number,emit) return Action(boundary,kind,value,value2,number,emit) end function
function result(handled) return Result(handled,[]) end function
function add(effect,boundary,kind,value,value2,number,emit) effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)];return void end function
function arg(args,index) if index<0 or index>=len(args) then return "" end if;return args[index] end function
function integer(args,index) return atoi(arg(args,index)) end function

// CG_ValidOrder
function validOrder(name)
  key=strings.toLowerAscii(name)
  if key=="getflag" or key=="offense" then return TEAMTASK_OFFENSE end if
  if key=="defend" or key=="defendflag" then return TEAMTASK_DEFENSE end if
  if key=="patrol" then return TEAMTASK_PATROL end if
  if key=="camp" then return TEAMTASK_CAMP end if
  if key=="followme" then return TEAMTASK_FOLLOW end if
  if key=="returnflag" then return TEAMTASK_RETRIEVE end if
  if key=="followflagcarrier" then return TEAMTASK_ESCORT end if
  return -1
end function

// CG_ParseScores: the wire command has fourteen fields per score.
function parseScores(state,args)
  count=integer(args,1);if count>MAX_CLIENTS then count=MAX_CLIENTS end if;if count<0 then count=0 end if
  state.numScores=count;state.teamScores=[integer(args,2),integer(args,3)];state.scores=[]
  for index=0 to count-1
    base=index*14+4;number=integer(args,base);if number<0 or number>=MAX_CLIENTS then number=0 end if
    item=Score(number,integer(args,base+1),integer(args,base+2),integer(args,base+3),integer(args,base+4),integer(args,base+5),integer(args,base+6),integer(args,base+7),integer(args,base+8),integer(args,base+9),integer(args,base+10),integer(args,base+11),integer(args,base+12),integer(args,base+13),state.clients[number].team)
    state.scores=state.scores+[item];state.clients[number].score=item.score;state.clients[number].powerups=item.powerups
  end for
  return state.numScores
end function

// CG_ParseTeamInfo
function parseTeamInfo(state,args)
  count=integer(args,1);if count<0 then count=0 end if;if count>MAX_CLIENTS then count=MAX_CLIENTS end if;state.sortedTeamPlayers=[]
  for index=0 to count-1
    base=index*6+2;number=integer(args,base)
    if number>=0 and number<MAX_CLIENTS then
      state.sortedTeamPlayers=state.sortedTeamPlayers+[number];ci=state.clients[number];ci.location=integer(args,base+1);ci.health=integer(args,base+2);ci.armor=integer(args,base+3);ci.curWeapon=integer(args,base+4);ci.powerups=integer(args,base+5)
    end if
  end for
  return len(state.sortedTeamPlayers)
end function

// CG_ParseServerinfo
function parseServerinfo(state)
  text=state.configstrings[CS_SERVERINFO];state.gametype=atoi(info.value(text,"g_gametype"));state.dmflags=atoi(info.value(text,"dmflags"));state.teamflags=atoi(info.value(text,"teamflags"));state.fraglimit=atoi(info.value(text,"fraglimit"));state.capturelimit=atoi(info.value(text,"capturelimit"));state.timelimit=atoi(info.value(text,"timelimit"));state.maxclients=atoi(info.value(text,"sv_maxclients"));state.mapname="maps/"+info.value(text,"mapname")+".bsp";state.redTeam=info.value(text,"g_redTeam");state.blueTeam=info.value(text,"g_blueTeam")
  effect=result(true);add(effect,"cvar","set","g_gametype",str(state.gametype),0,true);add(effect,"cvar","set","g_redTeam",state.redTeam,0,true);add(effect,"cvar","set","g_blueTeam",state.blueTeam,0,true);return effect
end function

// CG_ParseWarmup
function parseWarmup(state)
  warmup=atoi(state.configstrings[CS_WARMUP]);state.warmupCount=-1;effect=result(true)
  if warmup>0 and state.warmup<=0 then kind="prepare";if state.gametype>=GT_CTF then kind="prepare-team" end if;add(effect,"audio",kind,"","",0,true) end if
  state.warmup=warmup;return effect
end function

// CG_SetConfigValues
function setConfigValues(state)
  state.scores1=atoi(state.configstrings[CS_SCORES1]);state.scores2=atoi(state.configstrings[CS_SCORES2]);state.levelStartTime=atoi(state.configstrings[CS_LEVEL_START_TIME]);flags=state.configstrings[CS_FLAGSTATUS]
  if state.gametype==GT_CTF and len(flags)>=2 then state.redflag=atoi(strings.substr(flags,0,1));state.blueflag=atoi(strings.substr(flags,1,1))
  else if state.gametype==GT_1FCTF and len(flags)>=1 then state.flagStatus=atoi(strings.substr(flags,0,1)) end if
  state.warmup=atoi(state.configstrings[CS_WARMUP]);return void
end function

// CG_ShaderStateChanged
function shaderStateChanged(state,emit)
  effect=result(true);text=state.configstrings[CS_SHADERSTATE];at=0
  while at<len(text)
    equal=strings.indexOf(text,"=",at);if equal<0 then break end if;colon=strings.indexOf(text,":",equal+1);if colon<0 then break end if;mark=strings.indexOf(text,"@",colon+1);if mark<0 then break end if
    oldName=strings.substr(text,at,equal-at);newName=strings.substr(text,equal+1,colon-equal-1);offset=strings.substr(text,colon+1,mark-colon-1);add(effect,"renderer","remap-shader",oldName,newName,atoi(offset),emit);at=mark+1
  end while
  return effect
end function

// CG_ConfigStringModified. The engine has already integrated the new value.
function configStringModified(state,num,value,emit)
  effect=result(true);if num<0 or num>=len(state.configstrings) then return error(7820,"cg_servercmds: bad configstring index") end if;state.configstrings[num]=value
  if num==CS_MUSIC then add(effect,"audio","start-music",value,"",0,emit)
  else if num==CS_SERVERINFO then nested=parseServerinfo(state);effect.actions=effect.actions+nested.actions
  else if num==CS_WARMUP then nested=parseWarmup(state);effect.actions=effect.actions+nested.actions
  else if num==CS_SCORES1 then state.scores1=atoi(value)
  else if num==CS_SCORES2 then state.scores2=atoi(value)
  else if num==CS_LEVEL_START_TIME then state.levelStartTime=atoi(value)
  else if num==CS_VOTE_TIME then state.voteTime=atoi(value);state.voteModified=true
  else if num==CS_VOTE_YES then state.voteYes=atoi(value);state.voteModified=true
  else if num==CS_VOTE_NO then state.voteNo=atoi(value);state.voteModified=true
  else if num==CS_VOTE_STRING then state.voteString=value;add(effect,"audio","vote-now","","",0,emit)
  else if num>=CS_TEAMVOTE_TIME and num<=CS_TEAMVOTE_TIME+1 then slot=num-CS_TEAMVOTE_TIME;state.teamVoteTime[slot]=atoi(value);state.teamVoteModified[slot]=true
  else if num>=CS_TEAMVOTE_YES and num<=CS_TEAMVOTE_YES+1 then slot=num-CS_TEAMVOTE_YES;state.teamVoteYes[slot]=atoi(value);state.teamVoteModified[slot]=true
  else if num>=CS_TEAMVOTE_NO and num<=CS_TEAMVOTE_NO+1 then slot=num-CS_TEAMVOTE_NO;state.teamVoteNo[slot]=atoi(value);state.teamVoteModified[slot]=true
  else if num>=CS_TEAMVOTE_STRING and num<=CS_TEAMVOTE_STRING+1 then slot=num-CS_TEAMVOTE_STRING;state.teamVoteString[slot]=value;add(effect,"audio","vote-now","","",0,emit)
  else if num==CS_INTERMISSION then state.intermissionStarted=atoi(value)!=0
  else if num>=CS_MODELS and num<CS_MODELS+MAX_MODELS then add(effect,"renderer","register-model",value,"",num-CS_MODELS,emit)
  else if num>=CS_SOUNDS and num<CS_SOUNDS+MAX_MODELS then if len(value)==0 or strings.substr(value,0,1)!="*" then add(effect,"audio","register-sound",value,"",num-CS_SOUNDS,emit) end if
  else if num>=CS_PLAYERS and num<CS_PLAYERS+MAX_CLIENTS then add(effect,"state","new-client-info",value,"",num-CS_PLAYERS,emit);add(effect,"state","build-spectator-string","","",0,emit)
  else if num==CS_FLAGSTATUS then if state.gametype==GT_CTF and len(value)>=2 then state.redflag=atoi(strings.substr(value,0,1));state.blueflag=atoi(strings.substr(value,1,1)) else if state.gametype==GT_1FCTF and len(value)>=1 then state.flagStatus=atoi(strings.substr(value,0,1)) end if
  else if num==CS_SHADERSTATE then nested=shaderStateChanged(state,emit);effect.actions=effect.actions+nested.actions end if
  return effect
end function

function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
// CG_AddToTeamChat, including color carry and last-space wrapping.
function addToTeamChat(state,text)
  height=state.teamChatHeight;if height>TEAMCHAT_HEIGHT then height=TEAMCHAT_HEIGHT end if
  if height<=0 or state.teamChatTime<=0 then state.teamChatPos=0;state.teamLastChatPos=0;return 0 end if
  data=bytes(text);line=[];lastColor=55;lastSpace=-1;visible=0;at=0;added=0
  while at<len(data)
    if visible>TEAMCHAT_WIDTH-1 then
      carry=[]
      if lastSpace>=0 then carry=slice(line,lastSpace+1,len(line)-lastSpace-1);line=slice(line,0,lastSpace) end if
      state.teamChatMsgs[state.teamChatPos%height]=decode(bytes(line));state.teamChatMsgTimes[state.teamChatPos%height]=state.time;state.teamChatPos=state.teamChatPos+1;added=added+1;line=[94,lastColor]+carry;visible=len(carry);lastSpace=-1
    end if
    if isColor(data,at) then line=line+[data[at],data[at+1]];lastColor=data[at+1];at=at+2
    else
      if data[at]==32 then lastSpace=len(line) end if;line=line+[data[at]];visible=visible+1;at=at+1
    end if
  end while
  state.teamChatMsgs[state.teamChatPos%height]=decode(bytes(line));state.teamChatMsgTimes[state.teamChatPos%height]=state.time;state.teamChatPos=state.teamChatPos+1;added=added+1;if state.teamChatPos-state.teamLastChatPos>height then state.teamLastChatPos=state.teamChatPos-height end if;return added
end function

// CG_MapRestart
function mapRestart(state,emit)
  effect=result(true);state.fraglimitWarnings=0;state.timelimitWarnings=0;state.intermissionStarted=false;state.voteTime=0;state.mapRestart=true
  for each kind in ["init-local-entities","init-mark-polys","clear-particles"] add(effect,"state",kind,"","",0,emit) end for
  add(effect,"audio","start-music","","",0,emit);add(effect,"audio","clear-looping","","",1,emit)
  if state.warmup==0 then add(effect,"audio","fight","","",0,emit);add(effect,"hud","center-print","FIGHT!","120",32,emit) end if
  add(effect,"cvar","set","cg_thirdPerson","0",0,emit);return effect
end function

// COM_ParseExt subset used by .voice and .vc files.
function voiceTokens(text)
  data=bytes(text);tokens=[];at=0
  while at<len(data)
    while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if
    if at+1<len(data) and data[at]==47 and data[at+1]==47 then while at<len(data) and data[at]!=10 at=at+1 end while
    else if at+1<len(data) and data[at]==47 and data[at+1]==42 then at=at+2;while at+1<len(data) and not (data[at]==42 and data[at+1]==47) at=at+1 end while;at=at+2
    else if data[at]==34 then at=at+1;start=at;while at<len(data) and data[at]!=34 at=at+1 end while;tokens=tokens+[decode(slice(data,start,at-start))];if at<len(data) then at=at+1 end if
    else start=at;while at<len(data) and data[at]>32 and data[at]!=123 and data[at]!=125 at=at+1 end while;if at==start then tokens=tokens+[decode(slice(data,at,1))];at=at+1 else tokens=tokens+[decode(slice(data,start,at-start))] end if end if
  end while
  return tokens
end function

// CG_ParseVoiceChats. soundFn(path,compress) may reject an unavailable sound.
function parseVoiceChats(filename,text,maxVoiceChats,soundFn,compress)
  tokens=voiceTokens(text);if len(tokens)==0 then return VoiceList(filename,GENDER_MALE,[]) end if
  key=strings.toLowerAscii(tokens[0]);gender=-1;if key=="male" then gender=GENDER_MALE else if key=="female" then gender=GENDER_FEMALE else if key=="neuter" then gender=GENDER_NEUTER end if;if gender<0 then return error(7821,"expected gender not found in voice chat file: "+filename) end if
  list=VoiceList(filename,gender,[]);at=1
  while at<len(tokens) and len(list.chats)<maxVoiceChats
    id=tokens[at];at=at+1;if at>=len(tokens) or tokens[at]!="{" then return error(7822,"expected { in voice chat file: "+filename) end if;at=at+1;variants=[]
    while at<len(tokens) and tokens[at]!="}" and len(variants)<MAX_VOICESOUNDS
      path=tokens[at];at=at+1;if at>=len(tokens) then break end if;chat=tokens[at];at=at+1;sound=path;if soundFn!=void then sound=soundFn(path,compress) end if;if sound!=void and sound!=0 and sound!="" then variants=variants+[VoiceVariant(sound,chat)] end if
    end while
    while at<len(tokens) and tokens[at]!="}" at=at+1 end while;if at<len(tokens) then at=at+1 end if;list.chats=list.chats+[VoiceChat(id,variants)]
  end while
  return list
end function

// CG_LoadVoiceChats
function loadVoiceChats(state,files,soundFn,compress)
  state.voiceLists=[];for each item in files if len(state.voiceLists)>=MAX_VOICEFILES then break end if;parsed=parseVoiceChats(item[0],item[1],MAX_VOICECHATS,soundFn,compress);if not (parsed is error) then state.voiceLists=state.voiceLists+[parsed] end if end for;return len(state.voiceLists)
end function

// CG_HeadModelVoiceChats
function headModelVoiceChats(state,text)
  tokens=voiceTokens(text);if len(tokens)==0 then return -1 end if;for index=0 to len(state.voiceLists)-1 if strings.equalsIgnoreCaseAscii(tokens[0],state.voiceLists[index].name) then return index end if end for;return -1
end function

// CG_GetVoiceChat. cursor is an injected [0,1) random value.
function getVoiceChat(list,id,cursor)
  for each chat in list.chats
    if strings.equalsIgnoreCaseAscii(id,chat.id) and len(chat.variants)>0 then index=numeric.trunc32(cursor*len(chat.variants));if index>=len(chat.variants) then index=len(chat.variants)-1 end if;if index<0 then index=0 end if;return chat.variants[index] end if
  end for
  return void
end function

function cacheHead(state,name,index)
  for each pair in state.headVoices if strings.equalsIgnoreCaseAscii(pair.headmodel,name) then pair.voiceChatNum=index;return void end if end for
  if len(state.headVoices)<MAX_HEADMODELS then state.headVoices=state.headVoices+[HeadVoice(name,index)] end if;return void
end function
// CG_VoiceChatListForClient. vcFiles contains [path,text] pairs.
function voiceChatListForClient(state,clientNum,vcFiles)
  if clientNum<0 or clientNum>=MAX_CLIENTS then clientNum=0 end if;ci=state.clients[clientNum];base=ci.headModelName;if len(base)>0 and strings.substr(base,0,1)=="*" then base=strings.substr(base,1,len(base)-1) end if
  candidates=[base+"/"+ci.headSkinName,base]
  for each head in candidates
    for each pair in state.headVoices if strings.equalsIgnoreCaseAscii(pair.headmodel,head) and pair.voiceChatNum>=0 and pair.voiceChatNum<len(state.voiceLists) then return state.voiceLists[pair.voiceChatNum] end if end for
    wanted="scripts/"+head+".vc";for each file in vcFiles if strings.equalsIgnoreCaseAscii(file[0],wanted) then index=headModelVoiceChats(state,file[1]);if index>=0 then cacheHead(state,head,index);return state.voiceLists[index] end if end if end for
  end for
  gender=ci.gender;for attempt=0 to 1 for index=0 to len(state.voiceLists)-1 if state.voiceLists[index].gender==gender then cacheHead(state,base,index);return state.voiceLists[index] end if end for;if gender==GENDER_MALE then break end if;gender=GENDER_MALE end for
  if len(state.voiceLists)==0 then return void end if;cacheHead(state,base,0);return state.voiceLists[0]
end function

// CG_PlayVoiceChat
function playVoiceChat(state,vchat,emit)
  effect=result(true);if state.intermissionStarted then return effect end if
  if not state.noVoiceChats then add(effect,"audio","voice",vchat.sound,"",vchat.clientNum,emit);if vchat.clientNum!=state.localClientNum then task=validOrder(vchat.cmd);if task>0 then state.acceptOrderTime=state.time+5000;state.acceptVoice=vchat.cmd;state.acceptTask=task;state.acceptLeader=vchat.clientNum end if;add(effect,"hud","response-head","","",vchat.clientNum,emit) end if end if
  if not vchat.voiceOnly and not state.noVoiceText then addToTeamChat(state,vchat.message);add(effect,"console","print",vchat.message+"\n","",0,emit) end if;return effect
end function

// CG_PlayBufferedVoiceChats
function playBufferedVoiceChats(state,emit)
  effect=result(true);if state.voiceChatTime<state.time and state.voiceChatBufferOut!=state.voiceChatBufferIn then value=state.voiceBuffer[state.voiceChatBufferOut];if value!=void then nested=playVoiceChat(state,value,emit);effect.actions=effect.actions+nested.actions;state.voiceBuffer[state.voiceChatBufferOut]=void;state.voiceChatBufferOut=(state.voiceChatBufferOut+1)%MAX_VOICECHATBUFFER;state.voiceChatTime=state.time+1000 end if end if;return effect
end function

// CG_AddBufferedVoiceChat
function addBufferedVoiceChat(state,vchat,emit)
  effect=result(true);if state.intermissionStarted then return effect end if;state.voiceBuffer[state.voiceChatBufferIn]=vchat;state.voiceChatBufferIn=(state.voiceChatBufferIn+1)%MAX_VOICECHATBUFFER
  if state.voiceChatBufferIn==state.voiceChatBufferOut then nested=playVoiceChat(state,state.voiceBuffer[state.voiceChatBufferOut],emit);effect.actions=effect.actions+nested.actions;state.voiceChatBufferOut=(state.voiceChatBufferOut+1)%MAX_VOICECHATBUFFER end if;return effect
end function

// CG_VoiceChatLocal
function voiceChatLocal(state,mode,voiceOnly,clientNum,color,cmd,vcFiles,emit)
  effect=result(true);if state.intermissionStarted then return effect end if;if clientNum<0 or clientNum>=MAX_CLIENTS then clientNum=0 end if;state.currentVoiceClient=clientNum;list=voiceChatListForClient(state,clientNum,vcFiles);if list==void then return effect end if;variant=getVoiceChat(list,cmd,state.randomCursor);if variant==void or (mode!=SAY_TEAM and state.teamChatsOnly) then return effect end if
  name=state.clients[clientNum].name;prefix=name+": ";if mode==SAY_TELL then prefix="["+name+"]: " else if mode==SAY_TEAM then prefix="("+name+"): " end if;message=prefix+"^"+str(color)+variant.chat;vchat=BufferedVoice(clientNum,variant.sound,voiceOnly,cmd,message);return addBufferedVoiceChat(state,vchat,emit)
end function

// CG_VoiceChat
function voiceChat(state,mode,args,vcFiles,emit)
  cmd=arg(args,4);key=strings.toLowerAscii(cmd);if state.noTaunt and (key=="kill_insult" or key=="taunt" or key=="death_insult" or key=="kill_guantlet" or key=="praise") then return result(true) end if
  return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)
end function

// CG_RemoveChatEscapeChar
function removeChatEscapeChar(text) data=bytes(text);effect=[];for each value in data if value!=25 then effect=effect+[value] end if end for;return decode(bytes(effect)) end function

// CG_ServerCommand
function serverCommand(state,args,vcFiles,emit)
  effect=result(true);cmd=arg(args,0);if cmd=="" then return effect end if
  if cmd=="cp" then add(effect,"hud","center-print",arg(args,1),"144",16,emit)
  else if cmd=="cs" then num=integer(args,1);value="";if num>=0 and num<len(state.configstrings) then value=state.configstrings[num] end if;nested=configStringModified(state,num,value,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="print" then add(effect,"console","print",arg(args,1),"",0,emit)
  else if cmd=="chat" then if not state.teamChatsOnly then add(effect,"audio","talk","","",0,emit);add(effect,"console","print",removeChatEscapeChar(arg(args,1))+"\n","",0,emit) end if
  else if cmd=="tchat" then text=removeChatEscapeChar(arg(args,1));add(effect,"audio","talk","","",0,emit);addToTeamChat(state,text);add(effect,"console","print",text+"\n","",0,emit)
  else if cmd=="vchat" then nested=voiceChat(state,SAY_ALL,args,vcFiles,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="vtchat" then nested=voiceChat(state,SAY_TEAM,args,vcFiles,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="vtell" then nested=voiceChat(state,SAY_TELL,args,vcFiles,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="scores" then parseScores(state,args)
  else if cmd=="tinfo" then parseTeamInfo(state,args)
  else if cmd=="map_restart" then nested=mapRestart(state,emit);effect.actions=effect.actions+nested.actions
  else if strings.equalsIgnoreCaseAscii(cmd,"remapShader") then if len(args)==4 then add(effect,"renderer","remap-shader",arg(args,1),arg(args,2),atoi(arg(args,3)),emit) end if
  else if cmd=="loaddefered" then add(effect,"state","load-deferred-players","","",0,emit)
  else if cmd=="clientLevelShot" then state.levelShot=true
  else add(effect,"console","print","Unknown client game command: "+cmd+"\n","",0,emit) end if
  return effect
end function

// CG_ExecuteNewServerCommands. commands contains [sequence,argv] records.
function executeNewServerCommands(state,latestSequence,commands,vcFiles,emit)
  effect=result(true)
  while state.serverCommandSequence<latestSequence
    state.serverCommandSequence=state.serverCommandSequence+1;found=void
    for each item in commands if item[0]==state.serverCommandSequence then found=item[1];break end if end for
    if found!=void then nested=serverCommand(state,found,vcFiles,emit);effect.actions=effect.actions+nested.actions end if
  end while
  return effect
end function

// Cmd_Argv compatibility name retained for the original candidate inventory.
function cmdArgv(args,index) return arg(args,index) end function
