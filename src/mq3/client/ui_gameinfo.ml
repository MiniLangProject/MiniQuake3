// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_gameinfo.c.  Files and cvars are
// explicit state so the same code serves the native host and deterministic tests.
package mq3.client.ui_gameinfo

import mq3.shared.parser as parser
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as numeric
import std.string as strings

const POOLSIZE=131072
const MAX_ARENAS=1024
const MAX_BOTS=1024
const MAX_ARENAS_TEXT=8192
const MAX_BOTS_TEXT=8192
const ARENAS_PER_TIER=4
const AWARD_PERFECT=5

const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4

/// Stores UI gameinfo game info record, including `allocPoint`, `outOfMemory`, `arenas`, `bots`, `numSinglePlayerArenas`, `numSpecialSinglePlayerArenas` and additional values.
struct GameInfo allocPoint outOfMemory arenas bots numSinglePlayerArenas numSpecialSinglePlayerArenas cvars writes diagnostics demoversion levelMenuReinitialized end struct
/// Stores UI gameinfo best score record, including `score`, `skill`.
struct BestScore score skill end struct

/// Creates a `mq3.client.ui_gameinfo.GameInfo` record. Initializes the record with the defaults written in this constructor.
function create()
  return GameInfo(0,false,[],[],0,0,[],[],[],false,false)
end function

/// Evaluates UI gameinfo `cvar` and returns `value.cvars[index][1]`, `""` according to its guard/selection conditions.
/// @param value Record read through `value.cvars`.
/// @param name Name used to select or register the corresponding UI gameinfo resource.
function cvar(value,name)
  if len(value.cvars)>0 then for index=0 to len(value.cvars)-1 if value.cvars[index][0]==name then return value.cvars[index][1] end if end for end if;return ""
end function
/// Updates `value.cvars`, `value.writes` during UI gameinfo `setCvar`.
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.cvars`, `value.writes`.
/// @param name Name used to select or register the corresponding UI gameinfo resource.
/// @param text Text consumed or emitted by `setCvar` in the UI gameinfo path.
function setCvar(value,name,text)
  next=[];for each pair in value.cvars if pair[0]!=name then next=next+[pair] end if end for;value.cvars=next+[[name,text]];value.writes=value.writes+[[name,text]];return value
end function
/// Updates `value.diagnostics` during UI gameinfo `diagnostic`.
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.diagnostics`.
/// @param text Text consumed or emitted by `diagnostic` in the UI gameinfo path.
function diagnostic(value,text) value.diagnostics=value.diagnostics+[text];return void end function

// UI_Alloc
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.outOfMemory`, `value.allocPoint`.
/// @param size Value tested by `value.allocPoint+size>POOLSIZE` before the calculation continues.
function UI_Alloc(value,size)
  if value.allocPoint+size>POOLSIZE then value.outOfMemory=true;return void end if;offset=value.allocPoint;value.allocPoint=value.allocPoint+((size+31)&(~31));return offset+1
end function

// UI_InitMemory
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.allocPoint`, `value.outOfMemory`.
function UI_InitMemory(value) value.allocPoint=0;value.outOfMemory=false;return value end function

// UI_ParseInfos
/// @param value Value used by `if token!="{" then diagnostic(value,"Missing { in info file\n")`.
/// @param text Text consumed or emitted by `UI_ParseInfos` in the UI gameinfo path.
/// @param max Value used by `if len(parsed)==max then diagnostic(value,"Max infos exceeded\n")`.
function UI_ParseInfos(value,text,max)
  parsed=[];scan=parser.create(text)
  while true
    token=parser.parseExt(scan,true);if token is error then return token end if;if token=="" then break end if
    if token!="{" then diagnostic(value,"Missing { in info file\n");break end if
    if len(parsed)==max then diagnostic(value,"Max infos exceeded\n");break end if
    current=""
    while true
      key=parser.parseExt(scan,true);if key is error then return key end if
      if key=="" then diagnostic(value,"Unexpected end of info file\n");break end if
      if key=="}" then break end if
      item=parser.parseExt(scan,false);if item is error then return item end if;if item=="" then item="<NULL>" end if
      current=info.setValue(current,key,item,void,void);if current is error then return current end if
    end while
    allocation=UI_Alloc(value,len(bytes(current))+5+len(bytes(str(MAX_ARENAS)))+1)
    if allocation!=void then parsed=parsed+[current] end if
  end while
  return parsed
end function

// UI_LoadArenasFromFile
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.arenas`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param text Text consumed or emitted by `UI_LoadArenasFromFile` in the UI gameinfo path.
function UI_LoadArenasFromFile(value,filename,text)
  if text==void then diagnostic(value,"^1file not found: "+filename+"\n");return 0 end if
  if len(bytes(text))>=MAX_ARENAS_TEXT then diagnostic(value,"^1file too large: "+filename);return 0 end if
  available=MAX_ARENAS-len(value.arenas);if available<=0 then return 0 end if
  parsed=UI_ParseInfos(value,text,available);if parsed is error then return parsed end if;value.arenas=value.arenas+parsed;return len(parsed)
end function

/// Computes `strings.indexOf(text,part,0)>=0` for UI gameinfo `has`.
/// @param text Text consumed or emitted by `has` in the UI gameinfo path.
/// @param part Value used by `return strings.indexOf(text,part,0)>=0`.
function has(text,part) return strings.indexOf(text,part,0)>=0 end function
/// Compares two UI gameinfo names using ASCII case-insensitive equality.
/// @param left Argument 1 of `std.string.equalsIgnoreCaseAscii`.
/// @param right Argument 2 of `std.string.equalsIgnoreCaseAscii`.
function same(left,right) return strings.equalsIgnoreCaseAscii(left,right) end function

// UI_LoadArenas
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.arenas`, `value.arenas[index]`, `value.numSinglePlayerArenas`, `value.numSpecialSinglePlayerArenas`.
/// @param primaryName Value used by `UI_LoadArenasFromFile(value,primaryName,primaryText)`.
/// @param primaryText Value used by `UI_LoadArenasFromFile(value,primaryName,primaryText)`.
/// @param additionalFiles Value used by `for each entry in additionalFiles UI_LoadArenasFromFile(value,entry[0],entry[1]) end for`.
function UI_LoadArenas(value,primaryName,primaryText,additionalFiles)
  value.arenas=[];UI_LoadArenasFromFile(value,primaryName,primaryText)
  for each entry in additionalFiles UI_LoadArenasFromFile(value,entry[0],entry[1]) end for
  diagnostic(value,str(len(value.arenas))+" arenas parsed\n");if value.outOfMemory then diagnostic(value,"^3WARNING: not anough memory in pool to load all arenas\n") end if
  if len(value.arenas)>0 then for index=0 to len(value.arenas)-1 value.arenas[index]=info.setValue(value.arenas[index],"num",str(index),void,void) end for end if
  value.numSinglePlayerArenas=0;value.numSpecialSinglePlayerArenas=0
  for each arena in value.arenas type=info.value(arena,"type");if type!="" and has(type,"single") then if info.value(arena,"special")!="" then value.numSpecialSinglePlayerArenas=value.numSpecialSinglePlayerArenas+1 else value.numSinglePlayerArenas=value.numSinglePlayerArenas+1 end if end if end for
  remainder=value.numSinglePlayerArenas%ARENAS_PER_TIER;if remainder!=0 then value.numSinglePlayerArenas=value.numSinglePlayerArenas-remainder;diagnostic(value,str(remainder)+" arenas ignored to make count divisible by "+str(ARENAS_PER_TIER)+"\n") end if
  singleNumber=0;specialNumber=value.numSinglePlayerArenas;otherNumber=specialNumber+value.numSpecialSinglePlayerArenas
  if len(value.arenas)>0 then for index=0 to len(value.arenas)-1
    arena=value.arenas[index];type=info.value(arena,"type")
    if type!="" and has(type,"single") then
      if info.value(arena,"special")!="" then arena=info.setValue(arena,"num",str(specialNumber),void,void);specialNumber=specialNumber+1
      else arena=info.setValue(arena,"num",str(singleNumber),void,void);singleNumber=singleNumber+1 end if
    else arena=info.setValue(arena,"num",str(otherNumber),void,void);otherNumber=otherNumber+1 end if
    value.arenas[index]=arena
  end for end if
  return len(value.arenas)
end function

// Start-server type matcher fed by the arena type strings loaded here.
/// @param text Text consumed or emitted by `GametypeBits` in the UI gameinfo path.
function GametypeBits(text)
  bits=0;scan=parser.create(text)
  while true token=parser.parseExt(scan,false);if token is error then return token end if;if token=="" then break end if;if same(token,"ffa") then bits=bits|(1<<GT_FFA) else if same(token,"tourney") then bits=bits|(1<<GT_TOURNAMENT) else if same(token,"single") then bits=bits|(1<<GT_SINGLE_PLAYER) else if same(token,"team") then bits=bits|(1<<GT_TEAM) else if same(token,"ctf") then bits=bits|(1<<GT_CTF) end if end while
  return bits
end function

// UI_GetArenaInfoByNumber
/// @param value Record read through `value.arenas`.
/// @param num Value used by `if num<0 or num>=len(value.arenas) then diagnostic(value,"^1Invalid arena number: "+str(num)+"\n")`.
function UI_GetArenaInfoByNumber(value,num)
  if num<0 or num>=len(value.arenas) then diagnostic(value,"^1Invalid arena number: "+str(num)+"\n");return void end if
  for each arena in value.arenas text=info.value(arena,"num");if text!="" and numbers.atoi(text)==num then return arena end if end for;return void
end function

// UI_GetArenaInfoByMap
/// @param value Record read through `value.arenas`.
/// @param map map record passed to the UI gameinfo helper calls.
function UI_GetArenaInfoByMap(value,map)
  for each arena in value.arenas if same(info.value(arena,"map"),map) then return arena end if end for;return void
end function

// UI_GetSpecialArenaInfo
/// @param value Record read through `value.arenas`.
/// @param tag Value used by `for each arena in value.arenas if same(info.value(arena,"special"),tag) then return arena end if end for`.
function UI_GetSpecialArenaInfo(value,tag)
  for each arena in value.arenas if same(info.value(arena,"special"),tag) then return arena end if end for;return void
end function

// UI_LoadBotsFromFile
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.bots`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param text Text consumed or emitted by `UI_LoadBotsFromFile` in the UI gameinfo path.
function UI_LoadBotsFromFile(value,filename,text)
  if text==void then diagnostic(value,"^1file not found: "+filename+"\n");return 0 end if
  if len(bytes(text))>=MAX_BOTS_TEXT then diagnostic(value,"^1file too large: "+filename);return 0 end if
  available=MAX_BOTS-len(value.bots);if available<=0 then return 0 end if;parsed=UI_ParseInfos(value,text,available);if parsed is error then return parsed end if;value.bots=value.bots+parsed;if value.outOfMemory then diagnostic(value,"^3WARNING: not anough memory in pool to load all bots\n") end if;return len(parsed)
end function

// UI_LoadBots
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.bots`.
/// @param primaryName Value used by `UI_LoadBotsFromFile(value,primaryName,primaryText)`.
/// @param primaryText Value used by `UI_LoadBotsFromFile(value,primaryName,primaryText)`.
/// @param additionalFiles Value used by `for each entry in additionalFiles UI_LoadBotsFromFile(value,entry[0],entry[1]) end for`.
function UI_LoadBots(value,primaryName,primaryText,additionalFiles)
  value.bots=[];UI_LoadBotsFromFile(value,primaryName,primaryText);for each entry in additionalFiles UI_LoadBotsFromFile(value,entry[0],entry[1]) end for;diagnostic(value,str(len(value.bots))+" bots parsed\n");return len(value.bots)
end function

// UI_GetBotInfoByNumber
/// @param value Record read through `value.bots`.
/// @param num Value used by `if num<0 or num>=len(value.bots) then diagnostic(value,"^1Invalid bot number: "+str(num)+"\n")`.
function UI_GetBotInfoByNumber(value,num)
  if num<0 or num>=len(value.bots) then diagnostic(value,"^1Invalid bot number: "+str(num)+"\n");return void end if;return value.bots[num]
end function

// UI_GetBotInfoByName
/// @param value Record read through `value.bots`.
/// @param name Name used to select or register the corresponding UI gameinfo resource.
function UI_GetBotInfoByName(value,name)
  for each bot in value.bots if same(info.value(bot,"name"),name) then return bot end if end for;return void
end function

// UI_GetBestScore
/// @param value Record read through `value.arenas`.
/// @param level Value used by `if level<0 or level>len(value.arenas) then return BestScore(0,0) end if`.
function UI_GetBestScore(value,level)
  if level<0 or level>len(value.arenas) then return BestScore(0,0) end if;best=0;bestSkill=0;key="l"+str(level)
  for skill=1 to 5 score=numbers.atoi(info.value(cvar(value,"g_spScores"+str(skill)),key));if score>=1 and score<=8 and (best==0 or score<=best) then best=score;bestSkill=skill end if end for;return BestScore(best,bestSkill)
end function

// UI_SetBestScore
/// @param value Value used by `skill=numbers.atoi(cvar(value,"g_spSkill"))`.
/// @param level Value used by `key="l"+str(level)`.
/// @param score Value used by `if score<1 or score>8 then return false end if`.
function UI_SetBestScore(value,level,score)
  if score<1 or score>8 then return false end if;skill=numbers.atoi(cvar(value,"g_spSkill"));if skill<1 or skill>5 then return false end if;name="g_spScores"+str(skill);scores=cvar(value,name);key="l"+str(level);old=numbers.atoi(info.value(scores,key));if old!=0 and old<=score then return false end if;scores=info.setValue(scores,key,str(score),void,void);setCvar(value,name,scores);return true
end function

// UI_LogAwardData
/// @param value Value used by `if award>AWARD_PERFECT then diagnostic(value,"^1Bad award "+str(award)+" in UI_LogAwardData\n")`.
/// @param award Value used by `if award>AWARD_PERFECT then diagnostic(value,"^1Bad award "+str(award)+" in UI_LogAwardData\n")`.
/// @param data Value used by `if data==0 then return false end if`.
function UI_LogAwardData(value,award,data)
  if data==0 then return false end if;if award>AWARD_PERFECT then diagnostic(value,"^1Bad award "+str(award)+" in UI_LogAwardData\n");return false end if;key="a"+str(award);awards=cvar(value,"g_spAwards");old=numbers.atoi(info.value(awards,key));awards=info.setValue(awards,key,str(old+data),void,void);setCvar(value,"g_spAwards",awards);return true
end function

// UI_GetAwardLevel
/// @param value Argument 1 of `mq3.compat.textnumbers.atoi`; passed as `info.value(cvar(value,"g_spAwards"),"a"+str(award))`.
/// @param award Argument 1 of `mq3.compat.textnumbers.atoi`; passed as `info.value(cvar(value,"g_spAwards"),"a"+str(award))`.
function UI_GetAwardLevel(value,award) return numbers.atoi(info.value(cvar(value,"g_spAwards"),"a"+str(award))) end function

// UI_TierCompleted
/// @param value Value tested by `tier==UI_GetNumSPTiers(value)`, `training!=void and levelWon==numbers.atoi(info.value(training,"num"))` and additional values before the calculation continues.
/// @param levelWon Value used by `tier=numeric.trunc32(levelWon/ARENAS_PER_TIER)`.
function UI_TierCompleted(value,levelWon)
  tier=numeric.trunc32(levelWon/ARENAS_PER_TIER);level=tier*ARENAS_PER_TIER
  if tier==UI_GetNumSPTiers(value) then training=UI_GetSpecialArenaInfo(value,"training");if training!=void and levelWon==numbers.atoi(info.value(training,"num")) then return 0 end if;finalArena=UI_GetSpecialArenaInfo(value,"final");if finalArena==void or levelWon==numbers.atoi(info.value(finalArena,"num")) then return tier+1 end if;return -1 end if
  for offset=0 to ARENAS_PER_TIER-1 best=UI_GetBestScore(value,level+offset);if best.score!=1 then return -1 end if end for;return tier+1
end function

// UI_ShowTierVideo
/// @param value Value tested by `numbers.atoi(info.value(videos,key))!=0` before the calculation continues.
/// @param tier Value used by `if tier<=0 then return false end if`.
function UI_ShowTierVideo(value,tier)
  if tier<=0 then return false end if;videos=cvar(value,"g_spVideos");key="tier"+str(tier);if numbers.atoi(info.value(videos,key))!=0 then return false end if;videos=info.setValue(videos,key,"1",void,void);setCvar(value,"g_spVideos",videos);return true
end function

// UI_CanShowTierVideo
/// @param value Record read through `value.demoversion`.
/// @param tier Value used by `if tier==0 then return false end if`.
function UI_CanShowTierVideo(value,tier)
  if tier==0 then return false end if;if value.demoversion and tier!=8 then return false end if;return numbers.atoi(info.value(cvar(value,"g_spVideos"),"tier"+str(tier)))!=0
end function

// UI_GetCurrentGame
/// @param value Record read through `value.numSinglePlayerArenas`.
function UI_GetCurrentGame(value)
  training=UI_GetSpecialArenaInfo(value,"training");if training!=void then level=numbers.atoi(info.value(training,"num"));best=UI_GetBestScore(value,level);if best.score==0 or best.score>1 then return level end if end if
  for level=0 to value.numSinglePlayerArenas-1 best=UI_GetBestScore(value,level);if best.score==0 or best.score>1 then return level end if end for;finalArena=UI_GetSpecialArenaInfo(value,"final");if finalArena==void then return -1 end if;return numbers.atoi(info.value(finalArena,"num"))
end function

// UI_NewGame
/// @param value Value used by `for skill=1 to 5 setCvar(value,"g_spScores"+str(skill),"") end for`.
function UI_NewGame(value)
  for skill=1 to 5 setCvar(value,"g_spScores"+str(skill),"") end for;setCvar(value,"g_spAwards","");setCvar(value,"g_spVideos","");return value
end function

// UI_GetNumArenas / UI_GetNumSPArenas / UI_GetNumSPTiers / UI_GetNumBots
/// @param value Record read through `value.arenas`.
function UI_GetNumArenas(value) return len(value.arenas) end function
/// Reads `value.numSinglePlayerArenas` for UI gameinfo `UI_GetNumSPArenas`.
/// @param value Record read through `value.numSinglePlayerArenas`.
function UI_GetNumSPArenas(value) return value.numSinglePlayerArenas end function
/// Adapts `mq3.compat.numeric.trunc32` to UI gameinfo `UI_GetNumSPTiers`, returning its result for `value.numSinglePlayerArenas/ARENAS_PER_TIER`.
/// @param value Record read through `value.numSinglePlayerArenas`.
function UI_GetNumSPTiers(value) return numeric.trunc32(value.numSinglePlayerArenas/ARENAS_PER_TIER) end function
/// Returns the element/byte count of `value.bots` for UI gameinfo `UI_GetNumBots`.
/// @param value Record read through `value.bots`.
function UI_GetNumBots(value) return len(value.bots) end function

// UI_SPUnlock_f
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.levelMenuReinitialized`.
function UI_SPUnlock_f(value)
  scores=cvar(value,"g_spScores1");count=value.numSinglePlayerArenas+value.numSpecialSinglePlayerArenas;for level=0 to count-1 scores=info.setValue(scores,"l"+str(level),"1",void,void) end for;setCvar(value,"g_spScores1",scores);for tier=1 to 8 UI_ShowTierVideo(value,tier) end for;diagnostic(value,"All levels unlocked at skill level 1\n");value.levelMenuReinitialized=true;return value
end function

// UI_SPUnlockMedals_f
/// @param value Value used by `awards=cvar(value,"g_spAwards")`.
function UI_SPUnlockMedals_f(value)
  awards=cvar(value,"g_spAwards");for award=0 to 5 awards=info.setValue(awards,"a"+str(award),"100",void,void) end for;setCvar(value,"g_spAwards",awards);diagnostic(value,"All levels unlocked at 100\n");return value
end function

// UI_InitGameinfo
/// @param value Mutable UI gameinfo record/storage; this routine assigns `value.demoversion`.
/// @param arenaName Value used by `UI_LoadArenas(value,arenaName,arenaText,arenaFiles)`.
/// @param arenaText Value used by `UI_LoadArenas(value,arenaName,arenaText,arenaFiles)`.
/// @param arenaFiles Value used by `UI_LoadArenas(value,arenaName,arenaText,arenaFiles)`.
/// @param botName Value used by `UI_LoadBots(value,botName,botText,botFiles)`.
/// @param botText Value used by `UI_LoadBots(value,botName,botText,botFiles)`.
/// @param botFiles Value used by `UI_LoadBots(value,botName,botText,botFiles)`.
/// @param fsRestrict Value assigned to `value.demoversion`.
function UI_InitGameinfo(value,arenaName,arenaText,arenaFiles,botName,botText,botFiles,fsRestrict)
  UI_InitMemory(value);UI_LoadArenas(value,arenaName,arenaText,arenaFiles);UI_LoadBots(value,botName,botText,botFiles);value.demoversion=fsRestrict!=0 or (value.numSpecialSinglePlayerArenas==0 and value.numSinglePlayerArenas==4);return value
end function
