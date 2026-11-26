// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native port of code/server/sv_rankings.c. The extinct GRank network API is
// represented by typed asynchronous requests and explicit callbacks.
package mq3.server.rankings

import std.string as strings
import mq3.compat.numeric as n

/// Quake ranking-client status indicating new.
const QGR_STATUS_NEW=0
/// Quake ranking-client status indicating spectator.
const QGR_STATUS_SPECTATOR=1
/// Quake ranking-client status indicating active.
const QGR_STATUS_ACTIVE=2
/// Quake ranking-client status indicating validating.
const QGR_STATUS_VALIDATING=3
/// Quake ranking-client status indicating pending.
const QGR_STATUS_PENDING=4
/// Quake ranking-client status indicating leaving.
const QGR_STATUS_LEAVING=5
/// Quake ranking-client status indicating no user.
const QGR_STATUS_NO_USER=6
/// Quake ranking-client status indicating bad password.
const QGR_STATUS_BAD_PASSWORD=7
/// Quake ranking-client status indicating user exists.
const QGR_STATUS_USER_EXISTS=8
/// Quake ranking-client status indicating no membership.
const QGR_STATUS_NO_MEMBERSHIP=9
/// Quake ranking-client status indicating timeout.
const QGR_STATUS_TIMEOUT=10
/// Quake ranking-client status indicating an invalid user.
const QGR_STATUS_INVALIDUSER=11
/// Quake ranking-client status indicating error.
const QGR_STATUS_ERROR=12

/// Legacy global-ranking service status indicating ok.
const GR_STATUS_OK=0
/// Legacy global-ranking service status indicating error.
const GR_STATUS_ERROR=1
/// Legacy global-ranking service status indicating invalid parameters.
const GR_STATUS_BADPARAMS=2
/// Legacy global-ranking service status indicating network.
const GR_STATUS_NETWORK=3
/// Legacy global-ranking service status indicating a missing user account.
const GR_STATUS_NOUSER=4
/// Legacy global-ranking service status indicating an incorrect password.
const GR_STATUS_BADPASSWORD=5
/// Legacy global-ranking service status indicating an invalid game.
const GR_STATUS_BADGAME=6
/// Legacy global-ranking service status indicating pending.
const GR_STATUS_PENDING=7
/// Legacy global-ranking service status indicating an invalid domain.
const GR_STATUS_BADDOMAIN=8
/// Legacy global-ranking service status indicating a locked domain.
const GR_STATUS_DOMAINLOCK=9
/// Legacy global-ranking service status indicating timeout.
const GR_STATUS_TIMEOUT=10
/// Legacy global-ranking service status indicating an invalid user.
const GR_STATUS_INVALIDUSER=11
/// Legacy global-ranking service status indicating an invalid service context.
const GR_STATUS_INVALIDCONTEXT=12
/// Legacy global-ranking service status indicating an invalid league.
const GR_STATUS_BADLEAGUE=13

/// Game identifier supplied to the legacy ranking service.
const GR_GAMEKEY="Quake III Arena"
/// Alphabet used by the ranking service's six-bit text encoding.
const ASCII_ENCODING="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]"

/// RankedPlayer record for server.rankings, containing `context`, `gameId`, `match`, `playerId`, `token`, `status`, and 3 further fields.
struct RankedPlayer
  /// Open ranking-service context handle owned by this player, or zero after cleanup.
  context
  /// Ranking-service game identifier associated with the player.
  gameId
  /// Ranking-service match handle associated with the player.
  match
  /// Persistent player identifier returned by the ranking service.
  playerId
  /// Authentication token returned by the ranking service.
  token
  /// Current ranking-client authentication or participation status.
  status
  /// Status retained after the player leaves the ranked match.
  finalStatus
  /// Rank value assigned to the player by the ranking service.
  rank
  /// Player name registered with the ranking service.
  name
end struct
/// Request record for server.rankings, containing `kind`, `context`, `player`, `index`, `gameId`, `username`, and 3 further fields.
struct Request
  /// Ranking-service operation requested by this record.
  kind
  /// Ranking-service context handle to which this asynchronous account request belongs.
  context
  /// Player record or identifier targeted by the request.
  player
  /// Local player-slot index associated with the request.
  index
  /// Ranking-service game identifier supplied with the request.
  gameId
  /// Account name supplied to the ranking-service request.
  username
  /// Account password supplied to the ranking-service authentication request.
  password
  /// Email address supplied when registering a ranking account.
  email
  /// Additional operation-specific data supplied to the ranking backend.
  payload
end struct
/// Report record for server.rankings, containing `text`, `index1`, `index2`, `key`, `intValue`, `strValue`, and 5 further fields.
struct Report
  /// Textual diagnostic or report data sent to the ranking backend.
  text
  /// Local slot of the first player associated with the reported statistic.
  index1
  /// Local slot of the second player associated with the reported statistic.
  index2
  /// Statistic identifier used by the ranking service.
  key
  /// Integer value reported for the statistic.
  intValue
  /// Text value reported for the statistic.
  strValue
  /// True when the service should accumulate rather than replace the statistic.
  accum
  /// Ranking-service context handle receiving this accumulated match-statistic report.
  context
  /// Ranking-service match handle receiving the report.
  match
  /// Service user identifier for the first reported player.
  user1
  /// Service user identifier for the second reported player.
  user2
end struct
/// State record for server.rankings, containing `enabled`, `singlePlayer`, `officialGameKey`, `gametype`, `leagueName`, `maxclients`, and 16 further fields.
struct State
  /// True while ranking-service integration is enabled.
  enabled
  /// True when the ranked session is configured for single-player behavior.
  singlePlayer
  /// Game key identifying the official ranking-service integration.
  officialGameKey
  /// Game-mode identifier used when applying mode-specific rules.
  gametype
  /// League selected for the ranking-service session.
  leagueName
  /// Number of player ranking contexts allocated for server client slots.
  maxclients
  /// True while this entry participates in the active runtime.
  active
  /// Allocated ranking-service context records.
  contexts
  /// Ranking context owned by the server.
  serverContext
  /// Ranking-service match handle owned by the server.
  serverMatch
  /// Game key supplied to the ranking-service backend.
  gameKey
  /// Game identifier returned for the active ranking session.
  gameId
  /// Local player records and their ranking authentication state.
  players
  /// True while ranking contexts are being closed for shutdown.
  quitting
  /// Identifier assigned to the next managed ranking context.
  nextContext
  /// Identifier assigned to the next managed ranking match.
  nextMatch
  /// Pending or recorded requests sent to the ranking backend.
  requests
  /// Statistics and textual reports emitted for the ranking backend.
  reports
  /// Ranking status text published to connected clients.
  configstring
  /// Configuration-variable registry consulted by this subsystem.
  cvars
  /// Ranking-service failures collected during operation.
  errors
  /// Host callback that submits a request to the external ranking-service backend.
  backendFn
end struct

/// Create `mq3.server.rankings.RankedPlayer` with context=0; gameId=0; match=0; playerId=0; token=[]; status=QGR_STATUS_NEW; finalStatus=QGR_STATUS_NEW; rank=0; name="".
function player() return RankedPlayer(0,0,0,0,[],QGR_STATUS_NEW,QGR_STATUS_NEW,0,"") end function
/// Create rankings in server.rankings.
/// @param maxclients Initial `maxclients` field stored in the returned or constructed `mq3.server.rankings.State` record.
function create(maxclients)
  players=[];for i=0 to maxclients-1 players=players+[player()] end for
  return State(true,false,GR_GAMEKEY,0,"",maxclients,false,0,0,0,"",0,players,false,1,100,[],[],"",[],[],void)
end function
/// Compute least in server.rankings; the normal completion returns `maximum`.
/// @param value Value used in `(value < maximum)`.
/// @param maximum Maximum used in `(value < maximum)`.
function least(value,maximum) if value<maximum then return value end if;return maximum end function
/// Emit rankings in server.rankings; the normal completion returns `request`.
///
/// Direct state writes: `state.requests`.
/// @param state Record exposing `gameId`, `requests`, `backendFn`. Updated in place: `requests`.
/// @param kind Initial `kind` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param index Initial `index` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param payload Initial `payload` field stored in the returned or constructed `mq3.server.rankings.Request` record.
function emit(state,kind,context,index,payload)
  request=Request(kind,context,void,index,state.gameId,"","","",payload);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;return request
end function
/// Compute game key for in server.rankings; the normal completion returns `key`.
/// @param state Record exposing `officialGameKey`, `gametype`.
/// @param key Key used in `(key != state.officialGameKey)`.
function gameKeyFor(state,key)
  if key!=state.officialGameKey then return key end if
  if state.gametype==0 then return "Q3 Free For All" else if state.gametype==1 then return "Q3 Tournament" else if state.gametype==3 then return "Q3 Team Deathmatch" else if state.gametype==4 then return "Q3 Capture the Flag" else if state.gametype==5 then return "Q3 One Flag CTF" else if state.gametype==6 then return "Q3 Overload" else if state.gametype==7 then return "Q3 Harvester" end if;return key
end function
/// Update `state.nextContext`, `state.contexts` in server.rankings; the normal completion returns `value`.
///
/// Direct state writes: `state.nextContext`, `state.contexts`.
/// @param state Record exposing `nextContext`, `contexts`. Updated in place: `nextContext`, `contexts`.
function context(state) value=state.nextContext;state.nextContext=state.nextContext+1;state.contexts=state.contexts+1;return value end function

// SV_RankBegin
/// @param state Record exposing `enabled`, `singlePlayer`, `cvars`, `serverContext`, `leagueName`. Updated in place: `active`, `cvars`, `gameKey`, `serverContext`.
/// @param gamekey Key passed as `key` to `mq3.server.rankings.gameKeyFor`.
function SV_RankBegin(state,gamekey)
  if not state.enabled or state.singlePlayer then state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]];return void end if
  state.gameKey=gameKeyFor(state,gamekey);state.serverContext=context(state);emit(state,"new-game",state.serverContext,-1,state.leagueName);return void
end function
// SV_RankEnd
/// @param state Record exposing `active`, `maxclients`, `players`, `serverContext`, `cvars`. Updated in place: `active`, `cvars`.
function SV_RankEnd(state)
  if not state.active then for i=0 to state.maxclients-1 if state.players[i].context!=0 then SV_RankCloseContext(state,i) end if end for;if state.serverContext!=0 then SV_RankCloseContext(state,-1) end if;return void end if
  for i=0 to state.maxclients-1 if state.players[i].status==QGR_STATUS_ACTIVE then SV_RankUserLogout(state,i) end if end for;emit(state,"send-reports",state.serverContext,-1,void);state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]];return void
end function
// SV_RankPoll
/// @param state State passed as `state` to `mq3.server.rankings.emit`.
function SV_RankPoll(state) emit(state,"poll",0,-1,void);return void end function
// SV_RankCheckInit
/// @param state Record exposing `contexts`.
function SV_RankCheckInit(state) return state.contexts>0 end function
// SV_RankActive
/// @param state Record exposing `active`.
function SV_RankActive(state) return state.active end function
// SV_RankUserStatus
/// @param state Record exposing `active`, `players`.
/// @param index Zero-based index into `state.players`.
function SV_RankUserStatus(state,index) if not state.active then return QGR_STATUS_ERROR end if;return state.players[index].status end function
// SV_RankUserGrank
/// @param state Record exposing `active`, `players`.
/// @param index Zero-based index into `state.players`.
function SV_RankUserGrank(state,index) if not state.active then return 0 end if;return state.players[index].rank end function
// SV_RankUserReset
/// @param state Record exposing `active`, `players`.
/// @param index Zero-based index into `state.players`.
function SV_RankUserReset(state,index)
  if not state.active then return void end if;value=state.players[index].status;if value==QGR_STATUS_SPECTATOR or value==QGR_STATUS_NO_USER or value==QGR_STATUS_BAD_PASSWORD or value==QGR_STATUS_USER_EXISTS or value==QGR_STATUS_NO_MEMBERSHIP or value==QGR_STATUS_TIMEOUT or value==QGR_STATUS_ERROR then state.players[index].status=QGR_STATUS_NEW end if;return void
end function
// SV_RankUserSpectate
/// @param state Record exposing `active`, `players`.
/// @param index Zero-based index into `state.players`.
function SV_RankUserSpectate(state,index) if state.active then state.players[index].status=QGR_STATUS_SPECTATOR end if;return void end function
/// Begin user in server.rankings; updates `state.requests`.
///
/// Direct state writes: `state.requests`.
/// @param state Record exposing `players`, `active`, `gameId`, `requests`, `backendFn`. Updated in place: `requests`.
/// @param index Initial `index` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param kind Initial `kind` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param username Initial `username` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param password Initial `password` field stored in the returned or constructed `mq3.server.rankings.Request` record.
/// @param email Initial `email` field stored in the returned or constructed `mq3.server.rankings.Request` record.
function beginUser(state,index,kind,username,password,email)
  p=state.players[index];if not state.active then p.status=QGR_STATUS_ERROR;return void end if;if p.status==QGR_STATUS_ACTIVE then return void end if;p.context=context(state);p.status=QGR_STATUS_PENDING;p.finalStatus=QGR_STATUS_NEW;request=Request(kind,p.context,p,index,state.gameId,username,password,email,void);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;return void
end function
// SV_RankUserCreate
/// @param state State passed as `state` to `mq3.server.rankings.beginUser`.
/// @param index Index passed as `index` to `mq3.server.rankings.beginUser`.
/// @param username Username passed as `username` to `mq3.server.rankings.beginUser`.
/// @param password Password passed as `password` to `mq3.server.rankings.beginUser`.
/// @param email Email passed as `email` to `mq3.server.rankings.beginUser`.
function SV_RankUserCreate(state,index,username,password,email) return beginUser(state,index,"create-user",username,password,email) end function
// SV_RankUserLogin
/// @param state State passed as `state` to `mq3.server.rankings.beginUser`.
/// @param index Index passed as `index` to `mq3.server.rankings.beginUser`.
/// @param username Username passed as `username` to `mq3.server.rankings.beginUser`.
/// @param password Password passed as `password` to `mq3.server.rankings.beginUser`.
function SV_RankUserLogin(state,index,username,password) return beginUser(state,index,"login-user",username,password,"") end function

// SV_RankAsciiEncode
/// @param source Source used in `source[i]` and `len(source)`.
function SV_RankAsciiEncode(source)
  output=[];i=0;while i<len(source) b0=source[i]&255;b1=0;b2=0;if i+1<len(source) then b1=source[i+1]&255 end if;if i+2<len(source) then b2=source[i+2]&255 end if;values=[b0>>2,((b0<<4)|(b1>>4))&63,((b1<<2)|(b2>>6))&63,b2&63];chars=4;if i+2>=len(source) then chars=n.trunc32(((len(source)-i)*4)/3.0)+1 end if;for j=0 to chars-1 output=output+[bytes(ASCII_ENCODING)[values[j]]] end for;i=i+3 end while;return decode(bytes(output))
end function
// SV_RankAsciiDecode
/// @param source Source used in `bytes(source)`.
function SV_RankAsciiDecode(source)
  inverse=array(256,255);alphabet=bytes(ASCII_ENCODING);for i=0 to 63 inverse[alphabet[i]]=i end for;input=bytes(source);output=[]
  i=0;while i<len(input) values=[0,0,0,0];for j=0 to 3 if i+j<len(input) then values[j]=inverse[input[i+j]];if values[j]==255 then return [] end if end if end for;decoded=[(values[0]<<2)|(values[1]>>4),((values[1]<<4)|(values[2]>>2))&255,((values[2]<<6)|values[3])&255];count=3;if i+3>=len(input) then count=n.trunc32(((len(input)-i)*3)/4.0) end if;for j=0 to count-1 output=output+[decoded[j]] end for;i=i+4
  end while;return output
end function
// SV_RankEncodeGameID
/// @param gameId Game id operand used by `SV_RankEncodeGameID`; its reads are shown in the implementation.
/// @param length Length used in `(length < 12)`.
function SV_RankEncodeGameID(gameId,length)
  if length<12 then return "" end if;data=[];value=gameId;for i=0 to 7 data=data+[value&255];value=value>>8 end for;return SV_RankAsciiEncode(data)
end function
// SV_RankDecodePlayerID
/// @param value Source passed as `source` to `mq3.server.rankings.SV_RankAsciiDecode`.
function SV_RankDecodePlayerID(value)
  data=SV_RankAsciiDecode(value);result=0;limit=least(len(data),8);for i=0 to limit-1 result=result|(data[i]<<(8*i)) end for;return result
end function
// SV_RankDecodePlayerKey
/// @param value Source passed as `source` to `mq3.server.rankings.SV_RankAsciiDecode`.
function SV_RankDecodePlayerKey(value) return SV_RankAsciiDecode(value) end function

// SV_RankUserValidate
/// @param state Record exposing `players`, `active`, `maxclients`.
/// @param index Index passed as `index` to `mq3.server.rankings.emit`.
/// @param playerId Value passed as `value` to `mq3.server.rankings.SV_RankDecodePlayerID`.
/// @param key Value passed as `value` to `mq3.server.rankings.SV_RankDecodePlayerKey`.
/// @param tokenLength Token length used in `emit(state, "validate", p.context, index, [tokenLength, p.playerId, p.token])`.
/// @param rank Rank operand used by `SV_RankUserValidate`; its reads are shown in the implementation.
/// @param name Name used in `(state.players[i].name == name)`.
function SV_RankUserValidate(state,index,playerId,key,tokenLength,rank,name)
  p=state.players[index];if not state.active then p.status=QGR_STATUS_ERROR;return false end if
  if playerId!=void and key!=void then p.context=context(state);p.playerId=SV_RankDecodePlayerID(playerId);p.token=SV_RankDecodePlayerKey(key);p.name=name;for i=0 to state.maxclients-1 if i!=index and state.players[i].status==QGR_STATUS_ACTIVE and state.players[i].name==name then p.status=QGR_STATUS_NO_USER;p.finalStatus=QGR_STATUS_NEW;p.rank=0;return false end if end for;emit(state,"validate",p.context,index,[tokenLength,p.playerId,p.token]) end if
  p.status=QGR_STATUS_ACTIVE;p.finalStatus=QGR_STATUS_NEW;p.rank=rank;return true
end function
// SV_RankUserLogout
/// @param state Record exposing `active`, `players`.
/// @param index Index passed as `index` to `mq3.server.rankings.emit`.
function SV_RankUserLogout(state,index) if not state.active or state.players[index].context==0 then return void end if;p=state.players[index];p.status=QGR_STATUS_PENDING;p.finalStatus=QGR_STATUS_NEW;emit(state,"send-reports",p.context,index,void);return void end function

/// Compute report target in server.rankings; the normal completion returns `[p.context, p.match, p.playerId]`.
/// @param state Record exposing `serverContext`, `serverMatch`, `players`.
/// @param index Zero-based index into `state.players`.
function reportTarget(state,index)
  if index==-1 then return [state.serverContext,state.serverMatch,0] end if;p=state.players[index];if p.status!=QGR_STATUS_ACTIVE then return void end if;return [p.context,p.match,p.playerId]
end function
// SV_RankReportInt
/// @param state Record exposing `active`, `reports`, `gameId`, `requests`, `backendFn`. Updated in place: `reports`, `requests`.
/// @param index1 Index passed as `index` to `mq3.server.rankings.reportTarget`.
/// @param index2 Index passed as `index` to `mq3.server.rankings.reportTarget`.
/// @param key Initial `key` field stored in the returned or constructed `mq3.server.rankings.Report` record.
/// @param value Initial `intValue` field stored in the returned or constructed `mq3.server.rankings.Report` record.
/// @param accum Initial `accum` field stored in the returned or constructed `mq3.server.rankings.Report` record.
function SV_RankReportInt(state,index1,index2,key,value,accum)
  if not state.active then return false end if;first=reportTarget(state,index1);second=reportTarget(state,index2);if first==void or second==void then return false end if;report=Report(false,index1,index2,key,value,"",accum,first[0],first[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-int",first[0],void,index1,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;if second[2]!=0 then report=Report(false,index1,index2,key,value,"",accum,second[0],second[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-int",second[0],void,index2,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if end if;return true
end function
// SV_RankReportStr
/// @param state Record exposing `active`, `reports`, `gameId`, `requests`, `backendFn`. Updated in place: `reports`, `requests`.
/// @param index1 Index passed as `index` to `mq3.server.rankings.reportTarget`.
/// @param index2 Index passed as `index` to `mq3.server.rankings.reportTarget`.
/// @param key Initial `key` field stored in the returned or constructed `mq3.server.rankings.Report` record.
/// @param value Initial `strValue` field stored in the returned or constructed `mq3.server.rankings.Report` record.
function SV_RankReportStr(state,index1,index2,key,value)
  if not state.active then return false end if;first=reportTarget(state,index1);second=reportTarget(state,index2);if first==void or second==void then return false end if;report=Report(true,index1,index2,key,0,value,false,first[0],first[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-str",first[0],void,index1,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if;if second[2]!=0 then report=Report(true,index1,index2,key,0,value,false,second[0],second[1],first[2],second[2]);state.reports=state.reports+[report];request=Request("report-str",second[0],void,index2,state.gameId,"","","",report);state.requests=state.requests+[request];if state.backendFn!=void then state.backendFn(state,request) end if end if;return true
end function
// SV_RankQuit
/// @param state Record exposing `contexts`, `maxclients`, `players`. Updated in place: `quitting`.
function SV_RankQuit(state)
  state.quitting=true;attempt=0;while state.contexts>1 and attempt<68 before=state.contexts;for i=0 to state.maxclients-1 if state.players[i].context!=0 then if state.players[i].status==QGR_STATUS_ACTIVE then SV_RankUserLogout(state,i) else emit(state,"cleanup",state.players[i].context,i,void) end if end if end for;SV_RankPoll(state);attempt=attempt+1;if state.contexts==before then break end if end while;return void
end function

// SV_RankNewGameCBF
/// @param state Record exposing `gameKey`, `maxclients`, `players`, `nextMatch`, `cvars`. Updated in place: `gameId`, `configstring`, `serverMatch`, `nextMatch`, `active`, `cvars`.
/// @param status Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`.
/// @param gameId Game id passed as `gameId` to `mq3.server.rankings.SV_RankEncodeGameID`.
function SV_RankNewGameCBF(state,status,gameId)
  if status!=GR_STATUS_OK then SV_RankError(state,"new game: "+SV_RankStatusString(status));return void end if;state.gameId=gameId;encoded=SV_RankEncodeGameID(gameId,12);state.configstring="\\rankingsGameKey\\"+state.gameKey+"\\rankingsGameID\\"+encoded;for i=0 to state.maxclients-1 state.players[i].status=QGR_STATUS_NEW end for;state.serverMatch=state.nextMatch;state.nextMatch=state.nextMatch+1;state.active=true;state.cvars=state.cvars+[["sv_rankingsActive","1"]];return void
end function
// SV_RankUserCBF
/// @param state Record exposing `players`, `gameId`.
/// @param index Index passed as `index` to `mq3.server.rankings.emit`.
/// @param status Status used in `(status == GR_STATUS_OK)` and `(status == GR_STATUS_NOUSER)`.
function SV_RankUserCBF(state,index,status)
  p=state.players[index];if status==GR_STATUS_OK then emit(state,"join-game",p.context,index,state.gameId);return void end if;if status==GR_STATUS_NOUSER then p.finalStatus=QGR_STATUS_NO_USER else if status==GR_STATUS_BADPASSWORD then p.finalStatus=QGR_STATUS_BAD_PASSWORD else if status==GR_STATUS_TIMEOUT then p.finalStatus=QGR_STATUS_TIMEOUT else p.finalStatus=QGR_STATUS_ERROR end if;emit(state,"cleanup",p.context,index,void);return void
end function
// SV_RankJoinGameCBF
/// @param state Record exposing `players`, `nextMatch`. Updated in place: `nextMatch`.
/// @param index Index passed as `index` to `mq3.server.rankings.emit`.
/// @param status Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`.
/// @param playerId Player id operand used by `SV_RankJoinGameCBF`; its reads are shown in the implementation.
/// @param token Token operand used by `SV_RankJoinGameCBF`; its reads are shown in the implementation.
/// @param rank Rank passed as `rank` to `mq3.server.rankings.SV_RankUserValidate`.
function SV_RankJoinGameCBF(state,index,status,playerId,token,rank)
  p=state.players[index];if status!=GR_STATUS_OK then SV_RankError(state,"join game: "+SV_RankStatusString(status));emit(state,"cleanup",p.context,index,void);return false end if;p.playerId=playerId;p.token=token;p.match=state.nextMatch;state.nextMatch=state.nextMatch+1;return SV_RankUserValidate(state,index,void,void,0,rank,p.name)
end function
// SV_RankSendReportsCBF
/// @param state Record exposing `serverContext`, `players`.
/// @param index Index passed as `index` to `mq3.server.rankings.emit`.
/// @param status Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`.
function SV_RankSendReportsCBF(state,index,status)
  if status!=GR_STATUS_OK then SV_RankError(state,"send reports: "+SV_RankStatusString(status)) end if;if index==-1 then emit(state,"cleanup",state.serverContext,-1,void) else emit(state,"cleanup",state.players[index].context,index,void) end if;return void
end function
// SV_RankCleanupCBF
/// @param state State passed as `state` to `mq3.server.rankings.SV_RankError`.
/// @param index Index passed as `index` to `mq3.server.rankings.SV_RankCloseContext`.
/// @param status Status passed as `status` to `mq3.server.rankings.SV_RankStatusString`.
function SV_RankCleanupCBF(state,index,status) if status!=GR_STATUS_OK then SV_RankError(state,"cleanup: "+SV_RankStatusString(status)) end if;SV_RankCloseContext(state,index);return void end function
// SV_RankCloseContext
/// @param state Record exposing `serverContext`, `players`, `contexts`, `cvars`. Updated in place: `serverContext`, `serverMatch`, `contexts`, `active`, `cvars`.
/// @param index Zero-based index into `state.players`.
function SV_RankCloseContext(state,index)
  if index==-1 then if state.serverContext==0 then return void end if;state.serverContext=0;state.serverMatch=0
  else p=state.players[index];if p.context==0 then return void end if;p.context=0;p.match=0;p.playerId=0;p.token=[];p.status=p.finalStatus;p.finalStatus=QGR_STATUS_NEW;p.name="" end if
  if state.contexts>0 then state.contexts=state.contexts-1 end if;if state.contexts==0 then state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]] end if;return void
end function
// SV_RankStatusString
/// @param status Zero-based index into `names`.
function SV_RankStatusString(status)
  names=["GR_STATUS_OK","GR_STATUS_ERROR","GR_STATUS_BADPARAMS","GR_STATUS_NETWORK","GR_STATUS_NOUSER","GR_STATUS_BADPASSWORD","GR_STATUS_BADGAME","GR_STATUS_PENDING","GR_STATUS_BADDOMAIN","GR_STATUS_DOMAINLOCK","GR_STATUS_TIMEOUT","GR_STATUS_INVALIDUSER","GR_STATUS_INVALIDCONTEXT","GR_STATUS_BADLEAGUE"];if status>=0 and status<len(names) then return names[status] end if;return "(UNKNOWN)"
end function
// SV_RankError
/// @param state Record exposing `errors`, `cvars`. Updated in place: `errors`, `active`, `cvars`.
/// @param message Message used in `(state.errors + [message])`.
function SV_RankError(state,message) state.errors=state.errors+[message];state.active=false;state.cvars=state.cvars+[["sv_rankingsActive","0"]];return void end function
