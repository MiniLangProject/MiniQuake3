// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native port of code/server/sv_rankings.c. The extinct GRank network API is
// represented by typed asynchronous requests and explicit callbacks.
package mq3.server.rankings

import std.string as strings
import mq3.compat.numeric as n

const QGR_STATUS_NEW=0
const QGR_STATUS_SPECTATOR=1
const QGR_STATUS_ACTIVE=2
const QGR_STATUS_VALIDATING=3
const QGR_STATUS_PENDING=4
const QGR_STATUS_LEAVING=5
const QGR_STATUS_NO_USER=6
const QGR_STATUS_BAD_PASSWORD=7
const QGR_STATUS_USER_EXISTS=8
const QGR_STATUS_NO_MEMBERSHIP=9
const QGR_STATUS_TIMEOUT=10
const QGR_STATUS_INVALIDUSER=11
const QGR_STATUS_ERROR=12

const GR_STATUS_OK=0
const GR_STATUS_ERROR=1
const GR_STATUS_BADPARAMS=2
const GR_STATUS_NETWORK=3
const GR_STATUS_NOUSER=4
const GR_STATUS_BADPASSWORD=5
const GR_STATUS_BADGAME=6
const GR_STATUS_PENDING=7
const GR_STATUS_BADDOMAIN=8
const GR_STATUS_DOMAINLOCK=9
const GR_STATUS_TIMEOUT=10
const GR_STATUS_INVALIDUSER=11
const GR_STATUS_INVALIDCONTEXT=12
const GR_STATUS_BADLEAGUE=13

const GR_GAMEKEY="Quake III Arena"
const ASCII_ENCODING="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]"

struct RankedPlayer context gameId match playerId token status finalStatus rank name end struct
struct Request kind context player index gameId username password email payload end struct
struct Report text index1 index2 key intValue strValue accum context match user1 user2 end struct
struct State enabled singlePlayer officialGameKey gametype leagueName maxclients active contexts serverContext serverMatch gameKey gameId players quitting nextContext nextMatch requests reports configstring cvars errors backendFn end struct

function player() return RankedPlayer(0,0,0,0,[],QGR_STATUS_NEW,QGR_STATUS_NEW,0,"") end function
function create(maxclients)
  players=[];for i=0 to maxclients-1 players=players+[player()] end for
  return State(true,false,GR_GAMEKEY,0,"",maxclients,false,0,0,0,"",0,players,false,1,100,[],[],"",[],[],void)
end function
function least(value,maximum) if value<maximum then return value end if;return maximum end function
function emit(state,kind,context,index,payload)
  request=Request(kind,context,void,index,state.gameId,"","","",payload);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;return request
end function
function gameKeyFor(state,key)
  if key!=state.officialGameKey then return key end if
  if state.gametype==0 then return "Q3 Free For All" else if state.gametype==1 then return "Q3 Tournament" else if state.gametype==3 then return "Q3 Team Deathmatch" else if state.gametype==4 then return "Q3 Capture the Flag" else if state.gametype==5 then return "Q3 One Flag CTF" else if state.gametype==6 then return "Q3 Overload" else if state.gametype==7 then return "Q3 Harvester" end if;return key
end function
function context(state) value=state.nextContext;state.nextContext=state.nextContext+1;state.contexts=state.contexts+1;return value end function

// SV_RankBegin
function SV_RankBegin(state,gamekey)
  if not state.enabled or state.singlePlayer then state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]];return void end if
  state.gameKey=gameKeyFor(state,gamekey);state.serverContext=context(state);emit(state,"new-game",state.serverContext,-1,state.leagueName);return void
end function
// SV_RankEnd
function SV_RankEnd(state)
  if not state.active then for i=0 to state.maxclients-1 if state.players[i].context!=0 then SV_RankCloseContext(state,i) end if end for;if state.serverContext!=0 then SV_RankCloseContext(state,-1) end if;return void end if
  for i=0 to state.maxclients-1 if state.players[i].status==QGR_STATUS_ACTIVE then SV_RankUserLogout(state,i) end if end for;emit(state,"send-reports",state.serverContext,-1,void);state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]];return void
end function
// SV_RankPoll
function SV_RankPoll(state) emit(state,"poll",0,-1,void);return void end function
// SV_RankCheckInit
function SV_RankCheckInit(state) return state.contexts>0 end function
// SV_RankActive
function SV_RankActive(state) return state.active end function
// SV_RankUserStatus
function SV_RankUserStatus(state,index) if not state.active then return QGR_STATUS_ERROR end if;return state.players[index].status end function
// SV_RankUserGrank
function SV_RankUserGrank(state,index) if not state.active then return 0 end if;return state.players[index].rank end function
// SV_RankUserReset
function SV_RankUserReset(state,index)
  if not state.active then return void end if;value=state.players[index].status;if value==QGR_STATUS_SPECTATOR or value==QGR_STATUS_NO_USER or value==QGR_STATUS_BAD_PASSWORD or value==QGR_STATUS_USER_EXISTS or value==QGR_STATUS_NO_MEMBERSHIP or value==QGR_STATUS_TIMEOUT or value==QGR_STATUS_ERROR then state.players[index].status=QGR_STATUS_NEW end if;return void
end function
// SV_RankUserSpectate
function SV_RankUserSpectate(state,index) if state.active then state.players[index].status=QGR_STATUS_SPECTATOR end if;return void end function
function beginUser(state,index,kind,username,password,email)
  p=state.players[index];if not state.active then p.status=QGR_STATUS_ERROR;return void end if;if p.status==QGR_STATUS_ACTIVE then return void end if;p.context=context(state);p.status=QGR_STATUS_PENDING;p.finalStatus=QGR_STATUS_NEW;request=Request(kind,p.context,p,index,state.gameId,username,password,email,void);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;return void
end function
// SV_RankUserCreate
function SV_RankUserCreate(state,index,username,password,email) return beginUser(state,index,"create-user",username,password,email) end function
// SV_RankUserLogin
function SV_RankUserLogin(state,index,username,password) return beginUser(state,index,"login-user",username,password,"") end function

// SV_RankAsciiEncode
function SV_RankAsciiEncode(source)
  output=[];i=0;while i<len(source) b0=source[i]&255;b1=0;b2=0;if i+1<len(source) then b1=source[i+1]&255 end if;if i+2<len(source) then b2=source[i+2]&255 end if;values=[b0>>2,((b0<<4)|(b1>>4))&63,((b1<<2)|(b2>>6))&63,b2&63];chars=4;if i+2>=len(source) then chars=n.trunc32(((len(source)-i)*4)/3.0)+1 end if;for j=0 to chars-1 output=output+[bytes(ASCII_ENCODING)[values[j]]] end for;i=i+3 end while;return decode(bytes(output))
end function
// SV_RankAsciiDecode
function SV_RankAsciiDecode(source)
  inverse=array(256,255);alphabet=bytes(ASCII_ENCODING);for i=0 to 63 inverse[alphabet[i]]=i end for;input=bytes(source);output=[]
  i=0;while i<len(input) values=[0,0,0,0];for j=0 to 3 if i+j<len(input) then values[j]=inverse[input[i+j]];if values[j]==255 then return [] end if end if end for;decoded=[(values[0]<<2)|(values[1]>>4),((values[1]<<4)|(values[2]>>2))&255,((values[2]<<6)|values[3])&255];count=3;if i+3>=len(input) then count=n.trunc32(((len(input)-i)*3)/4.0) end if;for j=0 to count-1 output=output+[decoded[j]] end for;i=i+4
  end while;return output
end function
// SV_RankEncodeGameID
function SV_RankEncodeGameID(gameId,length)
  if length<12 then return "" end if;data=[];value=gameId;for i=0 to 7 data=data+[value&255];value=value>>8 end for;return SV_RankAsciiEncode(data)
end function
// SV_RankDecodePlayerID
function SV_RankDecodePlayerID(value)
  data=SV_RankAsciiDecode(value);result=0;limit=least(len(data),8);for i=0 to limit-1 result=result|(data[i]<<(8*i)) end for;return result
end function
// SV_RankDecodePlayerKey
function SV_RankDecodePlayerKey(value) return SV_RankAsciiDecode(value) end function

// SV_RankUserValidate
function SV_RankUserValidate(state,index,playerId,key,tokenLength,rank,name)
  p=state.players[index];if not state.active then p.status=QGR_STATUS_ERROR;return false end if
  if playerId!=void and key!=void then p.context=context(state);p.playerId=SV_RankDecodePlayerID(playerId);p.token=SV_RankDecodePlayerKey(key);p.name=name;for i=0 to state.maxclients-1 if i!=index and state.players[i].status==QGR_STATUS_ACTIVE and state.players[i].name==name then p.status=QGR_STATUS_NO_USER;p.finalStatus=QGR_STATUS_NEW;p.rank=0;return false end if end for;emit(state,"validate",p.context,index,[tokenLength,p.playerId,p.token]) end if
  p.status=QGR_STATUS_ACTIVE;p.finalStatus=QGR_STATUS_NEW;p.rank=rank;return true
end function
// SV_RankUserLogout
function SV_RankUserLogout(state,index) if not state.active or state.players[index].context==0 then return void end if;p=state.players[index];p.status=QGR_STATUS_PENDING;p.finalStatus=QGR_STATUS_NEW;emit(state,"send-reports",p.context,index,void);return void end function

function reportTarget(state,index)
  if index==-1 then return [state.serverContext,state.serverMatch,0] end if;p=state.players[index];if p.status!=QGR_STATUS_ACTIVE then return void end if;return [p.context,p.match,p.playerId]
end function
// SV_RankReportInt
function SV_RankReportInt(state,index1,index2,key,value,accum)
  if not state.active then return false end if;first=reportTarget(state,index1);second=reportTarget(state,index2);if first==void or second==void then return false end if;report=Report(false,index1,index2,key,value,"",accum,first[0],first[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-int",first[0],void,index1,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;if second[2]!=0 then report=Report(false,index1,index2,key,value,"",accum,second[0],second[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-int",second[0],void,index2,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if end if;return true
end function
// SV_RankReportStr
function SV_RankReportStr(state,index1,index2,key,value)
  if not state.active then return false end if;first=reportTarget(state,index1);second=reportTarget(state,index2);if first==void or second==void then return false end if;report=Report(true,index1,index2,key,0,value,false,first[0],first[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-str",first[0],void,index1,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;if second[2]!=0 then report=Report(true,index1,index2,key,0,value,false,second[0],second[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-str",second[0],void,index2,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if end if;return true
end function
// SV_RankQuit
function SV_RankQuit(state)
  state.quitting=true;attempt=0;while state.contexts>1 and attempt<68 before=state.contexts;for i=0 to state.maxclients-1 if state.players[i].context!=0 then if state.players[i].status==QGR_STATUS_ACTIVE then SV_RankUserLogout(state,i) else emit(state,"cleanup",state.players[i].context,i,void) end if end if end for;SV_RankPoll(state);attempt=attempt+1;if state.contexts==before then break end if end while;return void
end function

// SV_RankNewGameCBF
function SV_RankNewGameCBF(state,status,gameId)
  if status!=GR_STATUS_OK then SV_RankError(state,"new game: "+SV_RankStatusString(status));return void end if;state.gameId=gameId;encoded=SV_RankEncodeGameID(gameId,12);state.configstring="\\rankingsGameKey\\"+state.gameKey+"\\rankingsGameID\\"+encoded;for i=0 to state.maxclients-1 state.players[i].status=QGR_STATUS_NEW end for;state.serverMatch=state.nextMatch;state.nextMatch=state.nextMatch+1;state.active=true;state.cvars=state.cvars+[["sv_rankingsActive","1"]];return void
end function
// SV_RankUserCBF
function SV_RankUserCBF(state,index,status)
  p=state.players[index];if status==GR_STATUS_OK then emit(state,"join-game",p.context,index,state.gameId);return void end if;if status==GR_STATUS_NOUSER then p.finalStatus=QGR_STATUS_NO_USER else if status==GR_STATUS_BADPASSWORD then p.finalStatus=QGR_STATUS_BAD_PASSWORD else if status==GR_STATUS_TIMEOUT then p.finalStatus=QGR_STATUS_TIMEOUT else p.finalStatus=QGR_STATUS_ERROR end if;emit(state,"cleanup",p.context,index,void);return void
end function
// SV_RankJoinGameCBF
function SV_RankJoinGameCBF(state,index,status,playerId,token,rank)
  p=state.players[index];if status!=GR_STATUS_OK then SV_RankError(state,"join game: "+SV_RankStatusString(status));emit(state,"cleanup",p.context,index,void);return false end if;p.playerId=playerId;p.token=token;p.match=state.nextMatch;state.nextMatch=state.nextMatch+1;return SV_RankUserValidate(state,index,void,void,0,rank,p.name)
end function
// SV_RankSendReportsCBF
function SV_RankSendReportsCBF(state,index,status)
  if status!=GR_STATUS_OK then SV_RankError(state,"send reports: "+SV_RankStatusString(status)) end if;if index==-1 then emit(state,"cleanup",state.serverContext,-1,void) else emit(state,"cleanup",state.players[index].context,index,void) end if;return void
end function
// SV_RankCleanupCBF
function SV_RankCleanupCBF(state,index,status) if status!=GR_STATUS_OK then SV_RankError(state,"cleanup: "+SV_RankStatusString(status)) end if;SV_RankCloseContext(state,index);return void end function
// SV_RankCloseContext
function SV_RankCloseContext(state,index)
  if index==-1 then if state.serverContext==0 then return void end if;state.serverContext=0;state.serverMatch=0
  else p=state.players[index];if p.context==0 then return void end if;p.context=0;p.match=0;p.playerId=0;p.token=[];p.status=p.finalStatus;p.finalStatus=QGR_STATUS_NEW;p.name="" end if
  if state.contexts>0 then state.contexts=state.contexts-1 end if;if state.contexts==0 then state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]] end if;return void
end function
// SV_RankStatusString
function SV_RankStatusString(status)
  names=["GR_STATUS_OK","GR_STATUS_ERROR","GR_STATUS_BADPARAMS","GR_STATUS_NETWORK","GR_STATUS_NOUSER","GR_STATUS_BADPASSWORD","GR_STATUS_BADGAME","GR_STATUS_PENDING","GR_STATUS_BADDOMAIN","GR_STATUS_DOMAINLOCK","GR_STATUS_TIMEOUT","GR_STATUS_INVALIDUSER","GR_STATUS_INVALIDCONTEXT","GR_STATUS_BADLEAGUE"];if status>=0 and status<len(names) then return names[status] end if;return "(UNKNOWN)"
end function
// SV_RankError
function SV_RankError(state,message) state.errors=state.errors+[message];state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]];return void end function
