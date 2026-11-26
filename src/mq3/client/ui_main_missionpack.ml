// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic runtime port of Team Arena code/ui/ui_main.c.
package mq3.client.ui_main_missionpack
import std.string as strings
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as n

/// UI VM entry-point ordinal used to query the UI VM interface version.
const UI_GETAPIVERSION=0
/// UI VM entry-point ordinal used to initialize the UI VM.
const UI_INIT=1
/// UI VM entry-point ordinal used to shut down the UI VM.
const UI_SHUTDOWN=2
/// UI VM entry-point ordinal used to deliver a key event to the UI.
const UI_KEY_EVENT=3
/// UI VM entry-point ordinal used to deliver pointer motion to the UI.
const UI_MOUSE_EVENT=4
/// UI VM entry-point ordinal used to advance and render the UI.
const UI_REFRESH=5
/// UI VM entry-point ordinal used to query whether the UI covers the game view.
const UI_IS_FULLSCREEN=6
/// UI VM entry-point ordinal used to select the active UI menu.
const UI_SET_ACTIVE_MENU=7
/// UI VM entry-point ordinal used to handle a UI console command.
const UI_CONSOLE_COMMAND=8
/// UI VM entry-point ordinal used to render the connection-progress screen.
const UI_DRAW_CONNECT_SCREEN=9
/// UI VM entry-point ordinal used to query whether the UI requires a unique product key.
const UI_HASUNIQUECDKEY=10
/// UI virtual-machine interface version expected by the engine.
const UI_API_VERSION=6
/// Chat routing mode that sends the message to all players.
const SAY_ALL=0
/// Native game-type identifier selecting free-for-all deathmatch.
const GT_FFA=0
/// Native game-type value for one-on-one tournament play, used when filtering arenas and servers and
/// selecting Missionpack game modes.
const GT_TOURNAMENT=1
/// Native game-type value for single-player arena progression, used when filtering arenas and servers
/// and selecting Missionpack game modes.
const GT_SINGLE_PLAYER=2
/// Native game-type value for team deathmatch, used when filtering arenas and servers and selecting
/// Missionpack game modes.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when filtering arenas and servers and selecting
/// Missionpack game modes.
const GT_CTF=4
/// Native game-type identifier selecting one-flag capture the flag.
const GT_1FCTF=5
/// Native game-type identifier selecting Overload.
const GT_OBELISK=6
/// Native game-type identifier selecting Harvester.
const GT_HARVESTER=7
/// Server-browser source selector for the local server list.
const AS_LOCAL=0
/// Server-browser source selector for the mplayer server list.
const AS_MPLAYER=1
/// Server-browser source selector for the global server list.
const AS_GLOBAL=2
/// Server-browser source selector for the favorites server list.
const AS_FAVORITES=3
/// Menu data-feeder identifier supplying the heads list.
const FEEDER_HEADS=0
/// Menu data-feeder identifier supplying the maps list.
const FEEDER_MAPS=1
/// Menu data-feeder identifier supplying the servers list.
const FEEDER_SERVERS=2
/// Menu data-feeder identifier supplying the allmaps list.
const FEEDER_ALLMAPS=4
/// Menu data-feeder identifier supplying the player list list.
const FEEDER_PLAYER_LIST=7
/// Menu data-feeder identifier supplying the team list list.
const FEEDER_TEAM_LIST=8
/// Menu data-feeder identifier supplying the mods list.
const FEEDER_MODS=9
/// Menu data-feeder identifier supplying the demos list.
const FEEDER_DEMOS=10
/// Menu data-feeder identifier supplying the q3 heads list.
const FEEDER_Q3HEADS=12
/// Menu data-feeder identifier supplying the serverstatus list.
const FEEDER_SERVERSTATUS=13
/// Menu data-feeder identifier supplying the findplayer list.
const FEEDER_FINDPLAYER=14
/// Menu data-feeder identifier supplying the cinematics list.
const FEEDER_CINEMATICS=15
/// Engine key code for the mouse1 input, used by menu and client key-event handling.
const K_MOUSE1=178
/// Engine key code for the mouse2 input, used by menu and client key-event handling.
const K_MOUSE2=179
/// Owner-draw visibility flag requiring that the local player is the team leader.
const UI_SHOW_LEADER=1
/// Owner-draw visibility flag requiring that the local player is not the team leader.
const UI_SHOW_NOTLEADER=2
/// Owner-draw visibility flag requiring that the server browser displays the favorites source.
const UI_SHOW_FAVORITESERVERS=4
/// Owner-draw visibility flag requiring that the game mode has no teams.
const UI_SHOW_ANYNONTEAMGAME=8
/// Owner-draw visibility flag requiring that the game mode uses teams.
const UI_SHOW_ANYTEAMGAME=16
/// Owner-draw visibility flag requiring that the latest result established a new high score.
const UI_SHOW_NEWHIGHSCORE=32
/// Owner-draw visibility flag requiring that a recorded demo is available for the selected content.
const UI_SHOW_DEMOAVAILABLE=64
/// Owner-draw visibility flag requiring that the latest result established a new best completion time.
const UI_SHOW_NEWBESTTIME=128
/// Owner-draw visibility flag requiring that the selected game mode is free-for-all.
const UI_SHOW_FFA=256
/// Owner-draw visibility flag requiring that the selected game mode is not free-for-all.
const UI_SHOW_NOTFFA=512
/// Owner-draw visibility flag requiring that the selected network game mode has no teams.
const UI_SHOW_NETANYNONTEAMGAME=1024
/// Owner-draw visibility flag requiring that the selected network game mode uses teams.
const UI_SHOW_NETANYTEAMGAME=2048
/// Owner-draw visibility flag requiring that the server browser is not displaying favorites.
const UI_SHOW_NOTFAVORITESERVERS=4096

/// Stores UI main missionpack rectangle, including `x`, `y`, `w`, `h`.
struct Rect
  /// Horizontal position of the rectangle's origin in UI layout coordinates.
  x
  /// Vertical position of the rectangle's origin in UI layout coordinates.
  y
  /// Width of the rectangular display region.
  w
  /// Height of the rectangular display region.
  h
end struct
/// Stores UI main missionpack queued engine action, including `boundary`, `kind`, `name`, `text`, `values`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while running scripted Missionpack menus and
  /// updating browser or game selections.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while running scripted
  /// Missionpack menus and updating browser or game selections.
  kind
  /// Cvar, asset, menu-script target, or command named by a Missionpack UI host action.
  name
  /// Missionpack UI text argument used for displayed content, cvar values, menu scripts, and bot or
  /// server commands.
  text
  /// When constructing this record, `emit` supplies `values` for this member.
  values
  /// True when this request is marked for native dispatch while running scripted Missionpack menus and
  /// updating browser or game selections; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI main missionpack map info record, including `mapLoadName`, `mapName`, `imageName`, `typeBits`, `active`, `cinematic` and additional values.
struct MapInfo
  /// When constructing this record, `mapInfo` supplies `loadName` for this member.
  mapLoadName
  /// Virtual map identifier used by Missionpack arena selection and server launch commands.
  mapName
  /// Map preview image name used by Missionpack arena-selection widgets.
  imageName
  /// When constructing this record, `mapInfo` supplies `typeBits` for this member.
  typeBits
  /// When constructing this record, `mapInfo` supplies `true` for this member.
  active
  /// When constructing this record, `mapInfo` supplies `-1` for this member.
  cinematic
  /// True while producing the menu screenshot for the current level.
  levelShot
  /// When constructing this record, `mapInfo` supplies an empty string for this member.
  opponentName
  /// When constructing this record, `mapInfo` supplies `0` for this member.
  teamMembers
  /// When constructing this record, `mapInfo` supplies `array(8,0)` for this member.
  timeToBeat
end struct
/// Stores UI main missionpack team info record, including `name`, `imageName`, `teamMembers`, `cinematic`.
struct TeamInfo
  /// Team or clan name used for selection, opponent labels, and its associated cinematic lookup.
  name
  /// Team icon image name used by Missionpack team-selection widgets.
  imageName
  /// When constructing this record, `teamInfo` supplies `members` for this member.
  teamMembers
  /// When constructing this record, `teamInfo` supplies `-1` for this member.
  cinematic
end struct
/// Stores UI main missionpack character info record, including `name`, `base`, `imageName`, `active`, `headImage`.
struct CharacterInfo
  /// Character-selection name returned by head selection and used when issuing addbot requests.
  name
  /// When constructing this record, `characterInfo` supplies `base` for this member.
  base
  /// Character portrait image name used by Missionpack roster and character widgets.
  imageName
  /// When constructing this record, `characterInfo` supplies `true` for this member.
  active
  /// Renderer resource handle used for head image; mirrors native `characterInfo.headImage`.
  headImage
end struct
/// Stores UI main missionpack alias info record, including `name`, `ai`, `action`.
struct AliasInfo
  /// Public bot alias matched without case sensitivity and translated to its associated AI profile.
  name
  /// When constructing this record, `Alias_Parse` supplies `tokens[at+2]` for this member.
  ai
  /// When constructing this record, `Alias_Parse` supplies `tokens[at+3]` for this member.
  action
end struct
/// Stores UI main missionpack server info record, including `address`, `hostname`, `mapname`, `clients`, `maxClients`, `gametype` and additional values.
struct ServerInfo
  /// When constructing this record, `serverInfo` supplies `address` for this member.
  address
  /// When constructing this record, `serverInfo` supplies `hostname` for this member.
  hostname
  /// Map name parsed from server information or selected by the client UI.
  mapname
  /// Server player count used for empty/full filtering, sorting, and the browser player column.
  clients
  /// Maximum player slots advertised or supported by the connected server.
  maxClients
  /// Game type advertised by this browser server entry, used for filtering, sorting, and mode labels.
  gametype
  /// Server latency in milliseconds used for browser sorting and display; nonpositive values are
  /// excluded by the visibility filter.
  ping
  /// When constructing this record, `serverInfo` supplies `0` for this member.
  nettype
  /// Legacy server anti-cheat status advertised to the native server browser.
  punkbuster
  /// True when the record is eligible for the current drawing or browser-display pass.
  visible
  /// When constructing this record, `serverInfo` supplies `false` for this member.
  favorite
end struct
/// Stores UI main missionpack mod info record, including `name`, `description`.
struct ModInfo
  /// Mod directory name passed to the engine when selecting this modification.
  name
  /// When constructing this record, `UI_LoadMods` supplies `description` for this member.
  description
end struct
/// Stores UI main missionpack parse result record, including `ok`, `next`.
struct ParseResult
  /// True when the operation completed successfully and its result can be consumed.
  ok
  /// When constructing this record, `Asset_Parse` supplies `at` for this member.
  next
end struct
/// Stores UI main missionpack dispatch result record, including `value`, `action`.
struct DispatchResult
  /// Return value of the Missionpack UI entry point, separate from its host-operation trace.
  value
  /// When constructing this record, `vmMain` supplies an absent (`void`) value for this member.
  action
end struct
/// Stores UI main missionpack state, including `actions`, `retailActive`, `hostFn`, `initialized`, `shutdown`, `ingameLoad` and additional values.
struct State
  /// Host requests queued while running scripted Missionpack menus and updating browser or game
  /// selections, retained in request order.
  actions
  /// True when the retail QVM owns Missionpack menus and server browsing, so the native observer
  /// records requests without emitting duplicate host effects.
  retailActive
  /// Host callback for the host operation; an unset callback leaves that host operation unavailable.
  hostFn
  /// True after Missionpack UI initialization has established menu, cvar, and browser state, until UI
  /// shutdown.
  initialized
  /// When constructing this record, `create` supplies `false` for this member. Used by `_UI_Init` and
  /// `_UI_Shutdown` during subsequent processing.
  shutdown
  /// When constructing this record, `create` supplies `false` for this member. Used by `_UI_Init`
  /// during subsequent processing.
  ingameLoad
  /// Current mission-pack UI refresh time in milliseconds used for browser and menu updates.
  realtime
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// Horizontal position of the UI pointer in the menu coordinate system.
  cursorx
  /// Vertical position of the UI pointer in the menu coordinate system.
  cursory
  /// When constructing this record, `create` supplies `0` for this member. Used by `_UI_KeyEvent` and
  /// `_UI_SetActiveMenu` during subsequent processing.
  activeMenu
  /// Whether the Missionpack main menu covers the entire UI instead of appearing over the underlying
  /// game view.
  fullscreen
  /// Input-capture bitmask selecting which client subsystem currently receives key events.
  keyCatcher
  /// When constructing this record, `create` supplies `false` for this member. Used by `UI_Pause`
  /// during subsequent processing.
  paused
  /// Configuration-variable values exposed to the native UI implementation.
  cvars
  /// Missionpack UI media cache used by parsed menu definitions and owner-draw widgets.
  assets
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_Report` and `UI_ParseMenu` during subsequent processing.
  menus
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `currentMap` and `UI_DrawTierMap` during subsequent processing.
  maps
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_TeamIndexFromName` and `teamAt` during subsequent processing.
  teams
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_HeadCountByTeam` and `UI_SelectedHead` during subsequent processing.
  characters
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_AIFromName` and `UI_AIIndex` during subsequent processing.
  aliases
  /// When constructing this record, `create` supplies `games` for this member. Used by
  /// `UI_DrawGameType` and `UI_DrawNetGameType` during subsequent processing.
  gameTypes
  /// When constructing this record, `create` supplies `games` for this member. Used by
  /// `UI_DrawJoinGameType` and `UI_JoinGameType_HandleKey` during subsequent processing.
  joinGameTypes
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_ServersQsortCompare` and `UI_BuildServerDisplayList` during subsequent processing.
  servers
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_ServersSort` and `UI_InsertServerIntoDisplayList` during subsequent processing.
  displayServers
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_SortServerStatusInfo` and `UI_BuildServerStatus` during subsequent processing.
  serverStatusLines
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_BuildFindPlayerList` and `UI_FeederCount` during subsequent processing.
  foundPlayerNames
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_BuildFindPlayerList` and `UI_FeederSelection` during subsequent processing.
  foundPlayerAddresses
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_BuildPlayerList` and `UI_FeederCount` during subsequent processing.
  playerNames
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_BuildPlayerList` and `UI_DrawSelectedPlayer` during subsequent processing.
  teamNames
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.
  mods
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.
  movies
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.
  demos
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.
  q3HeadNames
  /// Image or shader resources used to draw the q3 head icon.
  q3HeadIcons
  /// When constructing this record, `create` supplies `0` for this member. Used by `currentMap` and
  /// `UI_GameType_HandleKey` during subsequent processing.
  currentMap
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawGameType`
  /// and `UI_DrawMapTimeToBeat` during subsequent processing.
  currentGameType
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawNetGameType`
  /// and `UI_OwnerDrawVisible` during subsequent processing.
  currentNetGameType
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_DrawJoinGameType` and `UI_JoinGameType_HandleKey` during subsequent processing.
  currentJoinGameType
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawClanLogo`
  /// and `UI_DrawClanCinematic` during subsequent processing.
  currentTeam
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_OpponentLeaderName` and `UI_NextOpponent` during subsequent processing.
  currentOpponent
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawBotName` and
  /// `UI_OwnerDrawWidth` during subsequent processing.
  currentBot
  /// When constructing this record, `create` supplies `2` for this member. Used by `UI_DrawSkill` and
  /// `UI_DrawBotSkill` during subsequent processing.
  currentBotSkill
  /// When constructing this record, `create` supplies `4` for this member. Used by `UI_DrawCrosshair`
  /// and `UI_Crosshair_HandleKey` during subsequent processing.
  currentCrosshair
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawNetSource`
  /// and `UI_OwnerDrawVisible` during subsequent processing.
  currentNetSource
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawNetFilter`
  /// and `UI_NetFilter_HandleKey` during subsequent processing.
  currentNetFilter
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_DrawSelectedPlayer` and `UI_SelectedPlayer_HandleKey` during subsequent processing.
  selectedPlayer
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_ServersQsortCompare` and `UI_ServersSort` during subsequent processing.
  sortKey
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_ServersQsortCompare` and `UI_RunMenuScript` during subsequent processing.
  sortDir
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `UI_UpdatePendingPings` and `UI_RunMenuScript` during subsequent processing.
  refreshActive
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_UpdatePendingPings` and `UI_DoServerRefresh` during subsequent processing.
  refreshTime
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_BuildFindPlayerList` and `UI_RunMenuScript` during subsequent processing.
  nextDisplayRefresh
  /// When constructing this record, `create` supplies `0` for this member. Used by `UI_BuildPlayerList`
  /// during subsequent processing.
  playerRefresh
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_OwnerDrawVisible` during subsequent processing.
  newHighScoreTime
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_OwnerDrawVisible` during subsequent processing.
  newBestTime
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `UI_OwnerDrawVisible` and `UI_RunMenuScript` during subsequent processing.
  demoAvailable
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_BuildServerDisplayList` and `UI_StopServerRefresh` during subsequent processing.
  numPlayersOnServers
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `UI_DrawServerMOTD` during subsequent processing.
  serverMOTD
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `UI_DrawServerRefreshDate` and `UI_OwnerDrawWidth` during subsequent processing.
  serverRefreshDate
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `UI_DrawGLInfo` during subsequent processing.
  glInfo
  /// When constructing this record, `create` supplies `widths` for this member. Used by `Font_Report`
  /// and `Text_Width` during subsequent processing.
  fontWidths
  /// When constructing this record, `create` supplies `16.0` for this member. Used by `Font_Report` and
  /// `Text_Height` during subsequent processing.
  fontHeight
  /// When constructing this record, `create` supplies `-1` for this member. Used by
  /// `UI_DrawConnectScreen` during subsequent processing.
  lastConnState
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `UI_DrawConnectScreen` during subsequent processing.
  lastLoadingText
end struct

/// Creates a `mq3.client.ui_main_missionpack.MapInfo` record. Assigns `mapLoadName` from `loadName`, `mapName` from `name`, `typeBits` from `typeBits`.
/// @param loadName Value used to initialize `MapInfo.mapLoadName`, `MapInfo.imageName`.
/// @param name Value used to initialize `MapInfo.mapName`.
/// @param typeBits Value used to initialize `MapInfo.typeBits`.
function mapInfo(loadName,name,typeBits) return MapInfo(loadName,name,"levelshots/"+loadName,typeBits,true,-1,-1,"",0,array(8,0)) end function
/// Creates a `mq3.client.ui_main_missionpack.TeamInfo` record. Assigns `name` from `name`, `imageName` from `image`, `teamMembers` from `members`.
/// @param name Value used to initialize `TeamInfo.name`.
/// @param image Value used to initialize `TeamInfo.imageName`.
/// @param members Value used to initialize `TeamInfo.teamMembers`.
function teamInfo(name,image,members) return TeamInfo(name,image,members,-1) end function
/// Creates a `mq3.client.ui_main_missionpack.CharacterInfo` record. Assigns `name` from `name`, `base` from `base`, `imageName` from `image`.
/// @param name Value used to initialize `CharacterInfo.name`.
/// @param base Value used to initialize `CharacterInfo.base`.
/// @param image Value used to initialize `CharacterInfo.imageName`.
function characterInfo(name,base,image) return CharacterInfo(name,base,image,true,-1) end function
/// Creates a `mq3.client.ui_main_missionpack.ServerInfo` record. Assigns `address` from `address`, `hostname` from `hostname`, `mapname` from `mapname`, `clients` from `clients`.
/// @param address Value used to initialize `ServerInfo.address`.
/// @param hostname Value used to initialize `ServerInfo.hostname`.
/// @param mapname Value used to initialize `ServerInfo.mapname`.
/// @param clients Value used to initialize `ServerInfo.clients`.
/// @param maxClients Value used to initialize `ServerInfo.maxClients`.
/// @param gametype Value used to initialize `ServerInfo.gametype`.
/// @param ping Value used to initialize `ServerInfo.ping`.
function serverInfo(address,hostname,mapname,clients,maxClients,gametype,ping) return ServerInfo(address,hostname,mapname,clients,maxClients,gametype,ping,0,false,true,false) end function
/// Calls `mq3.client.ui_main_missionpack.State` from UI main missionpack `create`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function create(retailActive)
  widths=array(256,8.0);games=[["Free For All",GT_FFA],["Tournament",GT_TOURNAMENT],["Single Player",GT_SINGLE_PLAYER],["Team Deathmatch",GT_TEAM],["Capture the Flag",GT_CTF],["One Flag CTF",GT_1FCTF],["Overload",GT_OBELISK],["Harvester",GT_HARVESTER]]
  return State([],retailActive,void,false,false,false,0,0,320.0,240.0,0,false,0,false,
    [],[],[],[],[],[],[],games,games,[],[],[],[],[],[],[],[],[],[],[],[],
    0,0,0,0,0,0,0,2,4,0,0,0,0,0,false,0,0,0,0,0,false,0,"","","",widths,16.0,-1,"")
end function
/// Appends a UI main missionpack action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
/// @param text Text consumed or emitted by `emit` in the UI main missionpack path.
/// @param values Value used by `action=Action(boundary,kind,name,text,values,not state.retailActive)`.
function emit(state,boundary,kind,name,text,values)
  action=Action(boundary,kind,name,text,values,not state.retailActive);state.actions=state.actions+[action]
  if not state.retailActive and state.hostFn!=void then state.hostFn(state,action) end if;return action
end function
/// Calls `std.string.toLowerAscii` from UI main missionpack `cvarIndex`. The final path returns `-1`.
/// @param state Record read through `state.cvars`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
function cvarIndex(state,name) wanted=strings.toLowerAscii(name);for i=0 to len(state.cvars)-1 if strings.toLowerAscii(state.cvars[i][0])==wanted then return i end if end for;return -1 end function
/// Calls `mq3.client.ui_main_missionpack.cvarIndex` from UI main missionpack `cvarString`. The final path returns `state.cvars[index][1]`.
/// @param state Record read through `state.cvars`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
function cvarString(state,name) index=cvarIndex(state,name);if index<0 then return "" end if;return state.cvars[index][1] end function
/// Adapts `mq3.compat.textnumbers.atof32` to UI main missionpack `cvarValue`, returning its result for `cvarString(state,name)`.
/// @param state Argument 1 of `mq3.compat.textnumbers.atof32`; passed as `cvarString(state,name)`.
/// @param name Argument 1 of `mq3.compat.textnumbers.atof32`; passed as `cvarString(state,name)`.
function cvarValue(state,name) return numbers.atof32(cvarString(state,name)) end function
/// Updates `state.cvars`, `state.cvars[index][1]` during UI main missionpack `setCvar`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.cvars`, `state.cvars[index][1]`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
/// @param value Value used by `if index<0 then state.cvars=state.cvars+[[name,str(value)]] else state.cvars[index][1]=str(value) end if`.
function setCvar(state,name,value) index=cvarIndex(state,name);if index<0 then state.cvars=state.cvars+[[name,str(value)]] else state.cvars[index][1]=str(value) end if;emit(state,"cvar","set",name,str(value),[]);return void end function
/// Clamps `value` to the inclusive bounds `minimum` and `maximum` for UI main missionpack.
/// @param value Value tested by `value<minimum`, `value>maximum` before the calculation continues.
/// @param minimum Value used by `if value<minimum then return minimum end if`.
/// @param maximum Value used by `if value>maximum then return maximum end if`.
function clamp(value,minimum,maximum) if value<minimum then return minimum end if;if value>maximum then return maximum end if;return value end function
/// Computes `key==K_MOUSE2 or key==134 or key==132` for UI main missionpack `leftKey`.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function leftKey(key) return key==K_MOUSE2 or key==134 or key==132 end function
/// Calls `mq3.client.ui_main_missionpack.leftKey` from UI main missionpack `direction`. The final path returns `1`.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function direction(key) if leftKey(key) then return -1 end if;return 1 end function
/// Calls `mq3.client.ui_main_missionpack.direction` from UI main missionpack `cycle`. The final path returns `value`.
/// @param value Value tested by `value<0`, `value>=count` before the calculation continues.
/// @param count Value tested by `count<=0`, `value>=count` before the calculation continues.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function cycle(value,count,key) if count<=0 then return 0 end if;value=value+direction(key);if value<0 then value=count-1 else if value>=count then value=0 end if;return value end function
/// Evaluates UI main missionpack `visibleColor` and returns `index+1<len(data) and data[index]==94 and data[index+1]!=94` according to its guard/selection conditions.
/// @param text Text consumed or emitted by `visibleColor` in the UI main missionpack path.
/// @param index Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`.
function visibleColor(text,index) data=bytes(text);return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
/// Evaluates UI main missionpack `containsValue` and returns `true`, `false` according to its guard/selection conditions.
/// @param values Value used by `for each value in values if value==wanted then return true end if end for`.
/// @param wanted Value used by `for each value in values if value==wanted then return true end if end for`.
function containsValue(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function

// AssetCache / Asset_Parse
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.assets`.
function AssetCache(state)
  names=["gradientbar","scrollbar","scrollbar_arrowup","scrollbar_arrowdown","scrollbar_thumb","slider2","sliderbutt_1","menu_enter","menu_exit","menu_buzz","menu_null"]
  for each name in names if not containsValue(state.assets,name) then state.assets=state.assets+[name];emit(state,"renderer","register-shader",name,"",[]) end if end for;return len(state.assets)
end function
/// Updates `state.assets` during UI main missionpack `Asset_Parse`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.assets`.
/// @param tokens Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`.
/// @param start Value used by `at=start`.
function Asset_Parse(state,tokens,start)
  at=start;if at<len(tokens) and tokens[at]=="{" then at=at+1 end if
  while at<len(tokens) and tokens[at]!="}"
    key=strings.toLowerAscii(tokens[at]);at=at+1;if at>=len(tokens) then return ParseResult(false,at) end if
    value=tokens[at];at=at+1
    if key=="font" or key=="smallfont" or key=="bigfont" then if at>=len(tokens) then return ParseResult(false,at) end if;size=numbers.atoi(tokens[at]);at=at+1;state.assets=state.assets+[key+"="+value+":"+str(size)];emit(state,"renderer","register-font",value,"",[size])
    else if key=="shadowcolor" then if at+2>=len(tokens) then return ParseResult(false,at) end if;color=[numbers.atof32(value),numbers.atof32(tokens[at]),numbers.atof32(tokens[at+1]),numbers.atof32(tokens[at+2])];at=at+3;state.assets=state.assets+[key+"="+str(color)];emit(state,"renderer","asset-color",key,"",color)
    else state.assets=state.assets+[key+"="+value];if strings.indexOf(key,"sound",0)>=0 then emit(state,"audio","register",value,"",[]) else if key=="gradientbar" or key=="cursor" then emit(state,"renderer","register-shader",value,"",[]) else emit(state,"ui","asset-value",key,value,[]) end if end if
  end while
  if at<len(tokens) and tokens[at]=="}" then at=at+1;return ParseResult(true,at) end if;return ParseResult(false,at)
end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `Font_Report`, returning its result for `state, "ui", "font-report", "Font_Report", "", [len(state.fontWidths),state.fontHeight]`.
/// @param state Record read through `state.fontWidths`, `state.fontHeight`.
function Font_Report(state) return emit(state,"ui","font-report","Font_Report","",[len(state.fontWidths),state.fontHeight]) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_Report`, returning its result for `state, "ui", "report", "UI_Report", "", [len(state.menus),len(state.assets)]`.
/// @param state Record read through `state.menus`, `state.assets`.
function UI_Report(state) return emit(state,"ui","report","UI_Report","",[len(state.menus),len(state.assets)]) end function

// Text_Width / Text_Height / paint paths preserve color escapes and limits.
/// @param state Record read through `state.fontWidths`.
/// @param text Text consumed or emitted by `Text_Width` in the UI main missionpack path.
/// @param scale Value used by `width=width+state.fontWidths[code]*scale`.
/// @param limit Upper limit applied while collecting or rendering the result.
function Text_Width(state,text,scale,limit)
  if text==void then return 0 end if;data=bytes(text);width=0.0;count=0;at=0
  while at<len(data) and (limit<=0 or count<limit)
    if visibleColor(text,at) then at=at+2;continue end if;code=data[at]&255;width=width+state.fontWidths[code]*scale;count=count+1;at=at+1
  end while;return n.trunc32(width)
end function
/// Calls `mq3.compat.numeric.trunc32` from UI main missionpack `Text_Height`. The final path returns `n.trunc32(state.fontHeight*scale)`.
/// @param state Record read through `state.fontHeight`.
/// @param text Text consumed or emitted by `Text_Height` in the UI main missionpack path.
/// @param scale Value used by `return n.trunc32(state.fontHeight*scale)`.
/// @param limit Accepted for compatibility with `Text_Height`; the current implementation does not read it.
function Text_Height(state,text,scale,limit) if text==void or text=="" then return 0 end if;return n.trunc32(state.fontHeight*scale) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `Text_PaintChar`, returning its result for `state, "renderer", "glyph", str(hShader), "", [x,y,width,height,scale,s,t,s2,t2]`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param x Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param y Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param width Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param height Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param scale Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param s Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param t Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param s2 Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param t2 Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`.
/// @param hShader Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(hShader)`.
function Text_PaintChar(state,x,y,width,height,scale,s,t,s2,t2,hShader) return emit(state,"renderer","glyph",str(hShader),"",[x,y,width,height,scale,s,t,s2,t2]) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `Text_Paint`, returning its result for `state, "renderer", "text", str(style), text, [x,y,scale,color,adjust,limit]`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param x Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`.
/// @param y Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`.
/// @param scale Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`.
/// @param color Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`.
/// @param text Argument 5 of `mq3.client.ui_main_missionpack.emit`.
/// @param adjust Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`.
/// @param limit Upper limit applied while collecting or rendering the result. Forwarded to `mq3.client.ui_main_missionpack.emit`.
/// @param style Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(style)`.
function Text_Paint(state,x,y,scale,color,text,adjust,limit,style) return emit(state,"renderer","text",str(style),text,[x,y,scale,color,adjust,limit]) end function
/// Calls `mq3.client.ui_main_missionpack.Text_Paint`, `mq3.client.ui_main_missionpack.emit`, `mq3.client.ui_main_missionpack.Text_Width` and additional helpers from UI main missionpack `Text_PaintWithCursor`. The final path returns `action`.
/// @param state Shared UI main missionpack state passed to the helper calls in `Text_PaintWithCursor`.
/// @param x Horizontal coordinate in the coordinate space used by `Text_PaintWithCursor`.
/// @param y Vertical coordinate in the coordinate space used by `Text_PaintWithCursor`.
/// @param scale Value used by `action=Text_Paint(state,x,y,scale,color,text,0.0,limit,style)`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param text Text consumed or emitted by `Text_PaintWithCursor` in the UI main missionpack path.
/// @param cursorPos Value used by `if cursorPos>=0 then emit(state,"renderer","cursor",cursor,"",[x+Text_Width(state,strings.substr(text,0,cursorPos),scale,0),y,scale,color]) en...`.
/// @param cursor Value used by `if cursorPos>=0 then emit(state,"renderer","cursor",cursor,"",[x+Text_Width(state,strings.substr(text,0,cursorPos),scale,0),y,scale,color]) en...`.
/// @param limit Upper limit applied while collecting or rendering the result.
/// @param style Value used by `action=Text_Paint(state,x,y,scale,color,text,0.0,limit,style)`.
function Text_PaintWithCursor(state,x,y,scale,color,text,cursorPos,cursor,limit,style) action=Text_Paint(state,x,y,scale,color,text,0.0,limit,style);if cursorPos>=0 then emit(state,"renderer","cursor",cursor,"",[x+Text_Width(state,strings.substr(text,0,cursorPos),scale,0),y,scale,color]) end if;return action end function
/// Updates `maxX[0]` during UI main missionpack `Text_Paint_Limit`.
/// @param state Shared UI main missionpack state passed to the helper calls in `Text_Paint_Limit`.
/// @param maxX Mutable sequence; this routine writes `maxX[0]`.
/// @param x Horizontal coordinate in the coordinate space used by `Text_Paint_Limit`.
/// @param y Vertical coordinate in the coordinate space used by `Text_Paint_Limit`.
/// @param scale Value used by `width=Text_Width(state,text,scale,limit)`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param text Text consumed or emitted by `Text_Paint_Limit` in the UI main missionpack path.
/// @param adjust Value used by `Text_Paint(state,x,y,scale,color,text,adjust,limit,0)`.
/// @param limit Upper limit applied while collecting or rendering the result.
function Text_Paint_Limit(state,maxX,x,y,scale,color,text,adjust,limit) width=Text_Width(state,text,scale,limit);available=maxX[0]-x;if width>available then width=n.trunc32(available) end if;Text_Paint(state,x,y,scale,color,text,adjust,limit,0);maxX[0]=x+width;return width end function
/// Adapts `mq3.client.ui_main_missionpack.Text_Paint` to UI main missionpack `Text_PaintCenter`, returning its result for `state, x-Text_Width(state,text,scale,0)/2.0, y, scale, color, text, 0.0, 0, 6`.
/// @param state Argument 1, 2 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `state`, `x-Text_Width(state,text,scale,0)/2.0`.
/// @param x Argument 2 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `x-Text_Width(state,text,scale,0)/2.0`.
/// @param y Argument 3 of `mq3.client.ui_main_missionpack.Text_Paint`.
/// @param scale Argument 2, 4 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `x-Text_Width(state,text,scale,0)/2.0`, `scale`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.Text_Paint`.
/// @param text Argument 2, 6 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `x-Text_Width(state,text,scale,0)/2.0`, `text`.
/// @param adjust Accepted for compatibility with `Text_PaintCenter`; the current implementation does not read it.
function Text_PaintCenter(state,x,y,scale,color,text,adjust) return Text_Paint(state,x-Text_Width(state,text,scale,0)/2.0,y,scale,color,text,0.0,0,6) end function
/// Calls `std.string.split`, `mq3.client.ui_main_missionpack.Text_Width`, `mq3.client.ui_main_missionpack.Text_PaintCenter` from UI main missionpack `Text_PaintCenter_AutoWrapped`. The final path returns `rows`.
/// @param state Shared UI main missionpack state passed to the helper calls in `Text_PaintCenter_AutoWrapped`.
/// @param x Horizontal coordinate in the coordinate space used by `Text_PaintCenter_AutoWrapped`.
/// @param y Vertical coordinate in the coordinate space used by `Text_PaintCenter_AutoWrapped`.
/// @param xmax Value used by `if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust)`.
/// @param ystep Value used by `if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust)`.
/// @param scale Value tested by `line!="" and Text_Width(state,candidate,scale,0)>xmax` before the calculation continues.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param text Text consumed or emitted by `Text_PaintCenter_AutoWrapped` in the UI main missionpack path.
/// @param adjust Value used by `if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust)`.
function Text_PaintCenter_AutoWrapped(state,x,y,xmax,ystep,scale,color,text,adjust)
  words=strings.split(text," ");line="";rows=0
  for each word in words candidate=word;if line!="" then candidate=line+" "+word end if;if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust);rows=rows+1;line=word else line=candidate end if end for
  if line!="" then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust);rows=rows+1 end if;return rows
end function

/// Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `_UI_DrawSides`.
/// @param state Shared UI main missionpack state passed to the helper calls in `_UI_DrawSides`.
/// @param x Horizontal coordinate in the coordinate space used by `_UI_DrawSides`.
/// @param y Vertical coordinate in the coordinate space used by `_UI_DrawSides`.
/// @param w Width in the coordinate space used by `_UI_DrawSides`.
/// @param h Height in the coordinate space used by `_UI_DrawSides`.
/// @param size Value used by `emit(state,"renderer","rect-sides","white","",[x,y,w,h,size])`.
function _UI_DrawSides(state,x,y,w,h,size) emit(state,"renderer","rect-sides","white","",[x,y,w,h,size]);return void end function
/// Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `_UI_DrawTopBottom`.
/// @param state Shared UI main missionpack state passed to the helper calls in `_UI_DrawTopBottom`.
/// @param x Horizontal coordinate in the coordinate space used by `_UI_DrawTopBottom`.
/// @param y Vertical coordinate in the coordinate space used by `_UI_DrawTopBottom`.
/// @param w Width in the coordinate space used by `_UI_DrawTopBottom`.
/// @param h Height in the coordinate space used by `_UI_DrawTopBottom`.
/// @param size Value used by `emit(state,"renderer","rect-top-bottom","white","",[x,y,w,h,size])`.
function _UI_DrawTopBottom(state,x,y,w,h,size) emit(state,"renderer","rect-top-bottom","white","",[x,y,w,h,size]);return void end function
/// Calls `mq3.client.ui_main_missionpack._UI_DrawSides`, `mq3.client.ui_main_missionpack._UI_DrawTopBottom`, `mq3.client.ui_main_missionpack.emit` from UI main missionpack `_UI_DrawRect`. The final path returns `emit(state,"renderer","set-color","","",[void])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `_UI_DrawRect`.
/// @param x Horizontal coordinate in the coordinate space used by `_UI_DrawRect`.
/// @param y Vertical coordinate in the coordinate space used by `_UI_DrawRect`.
/// @param width Width in the coordinate space used by `_UI_DrawRect`.
/// @param height Height in the coordinate space used by `_UI_DrawRect`.
/// @param size Value used by `_UI_DrawSides(state,x,y,width,height,size)`.
/// @param color Accepted for compatibility with `_UI_DrawRect`; the current implementation does not read it.
function _UI_DrawRect(state,x,y,width,height,size,color) _UI_DrawSides(state,x,y,width,height,size);_UI_DrawTopBottom(state,x,y,width,height,size);return emit(state,"renderer","set-color","","",[void]) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_DrawCenteredPic`, returning its result for `state, "renderer", "pic", str(image), "", [320-w/2.0,240-h/2.0,w,h]`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param image Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(image)`.
/// @param w Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[320-w/2.0,240-h/2.0,w,h]`.
/// @param h Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[320-w/2.0,240-h/2.0,w,h]`.
function UI_DrawCenteredPic(state,image,w,h) return emit(state,"renderer","pic",str(image),"",[320-w/2.0,240-h/2.0,w,h]) end function
/// Calls `mq3.client.ui_main_missionpack.setCvar`, `mq3.client.ui_main_missionpack.emit` from UI main missionpack `UI_ShowPostGame`. The final path returns `emit(state,"menu","activate","endofgame","",[newHigh])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_ShowPostGame`.
/// @param newHigh Value used by `return emit(state,"menu","activate","endofgame","",[newHigh])`.
function UI_ShowPostGame(state,newHigh) setCvar(state,"cg_cameraOrbit","0");setCvar(state,"cg_thirdPerson","0");return emit(state,"menu","activate","endofgame","",[newHigh]) end function

/// Calls `std.string.toLowerAscii`, `mq3.client.ui_main_missionpack.emit` from UI main missionpack `GetMenuBuffer`. The final path returns `""`.
/// @param state Shared UI main missionpack state passed to the helper calls in `GetMenuBuffer`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param files Value used by `for each pair in files if strings.toLowerAscii(pair[0])==strings.toLowerAscii(filename) then emit(state,"filesystem","read",filename,"",[len(b...`.
function GetMenuBuffer(state,filename,files) for each pair in files if strings.toLowerAscii(pair[0])==strings.toLowerAscii(filename) then emit(state,"filesystem","read",filename,"",[len(bytes(pair[1]))]);return pair[1] end if end for;return "" end function
/// Updates `state.menus` during UI main missionpack `UI_ParseMenu`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.menus`.
/// @param menuFile Value used by `state.menus=state.menus+[menuFile]`.
/// @param text Text consumed or emitted by `UI_ParseMenu` in the UI main missionpack path.
function UI_ParseMenu(state,menuFile,text) if text=="" then return false end if;state.menus=state.menus+[menuFile];emit(state,"menu","parse",menuFile,text,[]);return true end function
/// Calls `mq3.client.ui_main_missionpack.UI_ParseMenu`, `mq3.client.ui_main_missionpack.GetMenuBuffer`, `mq3.client.ui_main_missionpack.ParseResult` from UI main missionpack `Load_Menu`. The final path returns `ParseResult(true,at)`.
/// @param state Shared UI main missionpack state passed to the helper calls in `Load_Menu`.
/// @param tokens Sequence read at `tokens[at]`.
/// @param start Value used by `at=start`.
/// @param files Value used by `UI_ParseMenu(state,filename,GetMenuBuffer(state,filename,files)) end while`.
function Load_Menu(state,tokens,start,files) at=start;if at<len(tokens) and tokens[at]=="{" then at=at+1 end if;while at<len(tokens) and tokens[at]!="}" filename=tokens[at];at=at+1;UI_ParseMenu(state,filename,GetMenuBuffer(state,filename,files)) end while;if at<len(tokens) then at=at+1 end if;return ParseResult(true,at) end function
/// Updates `state.menus` during UI main missionpack `UI_LoadMenus`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.menus`.
/// @param menuFile Value used by `text=GetMenuBuffer(state,menuFile,files)`.
/// @param reset Value used by `if reset then state.menus=[]`.
/// @param files Value used by `text=GetMenuBuffer(state,menuFile,files)`.
function UI_LoadMenus(state,menuFile,reset,files)
  if reset then state.menus=[];emit(state,"menu","reset","","",[]) end if;text=GetMenuBuffer(state,menuFile,files);if text=="" then text=GetMenuBuffer(state,"ui/menus.txt",files) end if;if text=="" then return false end if
  tokens=tokenize(text);at=0;loaded=false;parsed=ParseResult(false,0);while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="loadmenu" then parsed=Load_Menu(state,tokens,at,files);if not parsed.ok then return false end if;at=parsed.next;loaded=true end if end while;if not loaded then return UI_ParseMenu(state,menuFile,text) end if;return true
end function
/// Updates `state.assets` during UI main missionpack `UI_Load`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.assets`.
/// @param files Value used by `return UI_LoadMenus(state,"ui/menus.txt",true,files)`.
function UI_Load(state,files) state.assets=[];AssetCache(state);return UI_LoadMenus(state,"ui/menus.txt",true,files) end function

/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `draw`, returning its result for `state, "renderer", "owner-draw", name, text, [rect.x,rect.y,rect.w,rect.h]+values`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param name Argument 4 of `mq3.client.ui_main_missionpack.emit`.
/// @param rect Record read through `rect.x`, `rect.y`, `rect.w`, `rect.h`.
/// @param text Argument 5 of `mq3.client.ui_main_missionpack.emit`.
/// @param values Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[rect.x,rect.y,rect.w,rect.h]+values`.
function draw(state,name,rect,text,values) return emit(state,"renderer","owner-draw",name,text,[rect.x,rect.y,rect.w,rect.h]+values) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawHandicap`, returning its result for `state, "handicap", rect, cvarString(state,"handicap"), [scale,color,textStyle]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"handicap")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawHandicap(state,rect,scale,color,textStyle) return draw(state,"handicap",rect,cvarString(state,"handicap"),[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawClanName`, returning its result for `state, "clan-name", rect, cvarString(state,"ui_teamName"), [scale,color,textStyle]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawClanName(state,rect,scale,color,textStyle) return draw(state,"clan-name",rect,cvarString(state,"ui_teamName"),[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawGameType`. The final path returns `draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
/// @param state Record read through `state.currentGameType`, `state.gameTypes`.
/// @param rect Value used by `return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
function UI_DrawGameType(state,rect,scale,color,textStyle) index=clamp(state.currentGameType,0,len(state.gameTypes)-1);return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawNetGameType`. The final path returns `draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
/// @param state Record read through `state.currentNetGameType`, `state.gameTypes`.
/// @param rect Value used by `return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.
function UI_DrawNetGameType(state,rect,scale,color,textStyle) index=clamp(state.currentNetGameType,0,len(state.gameTypes)-1);return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawJoinGameType`. The final path returns `draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`.
/// @param state Record read through `state.currentJoinGameType`, `state.joinGameTypes`.
/// @param rect Value used by `return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`.
function UI_DrawJoinGameType(state,rect,scale,color,textStyle) index=clamp(state.currentJoinGameType,0,len(state.joinGameTypes)-1);return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle]) end function
/// Calls `std.string.toLowerAscii` from UI main missionpack `UI_TeamIndexFromName`. The final path returns `0`.
/// @param state Record read through `state.teams`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
function UI_TeamIndexFromName(state,name) for i=0 to len(state.teams)-1 if strings.toLowerAscii(state.teams[i].name)==strings.toLowerAscii(name) then return i end if end for;return 0 end function
/// Calls `mq3.client.ui_main_missionpack.clamp` from UI main missionpack `teamAt`. The final path returns `state.teams[clamp(index,0,len(state.teams)-1)]`.
/// @param state Record read through `state.teams`.
/// @param index Value used by `return state.teams[clamp(index,0,len(state.teams)-1)]`.
function teamAt(state,index) if len(state.teams)==0 then return void end if;return state.teams[clamp(index,0,len(state.teams)-1)] end function
/// Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawClanLogo`. The final path returns `draw(state,"clan-logo",rect,team.imageName,[scale,color])`.
/// @param state Record read through `state.currentTeam`.
/// @param rect Value used by `return draw(state,"clan-logo",rect,team.imageName,[scale,color])`.
/// @param scale Value used by `return draw(state,"clan-logo",rect,team.imageName,[scale,color])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
function UI_DrawClanLogo(state,rect,scale,color) team=teamAt(state,state.currentTeam);if team==void then return void end if;return draw(state,"clan-logo",rect,team.imageName,[scale,color]) end function
/// Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.UI_PlayCinematic`, `mq3.client.ui_main_missionpack.UI_DrawCinematic` from UI main missionpack `UI_DrawClanCinematic`. The final path returns `UI_DrawCinematic(state,team.cinematic,rect.x,rect.y,rect.w,rect.h)`.
/// @param state Record read through `state.currentTeam`.
/// @param rect Record read through `rect.x`, `rect.y`, `rect.w`, `rect.h`.
/// @param scale Accepted for compatibility with `UI_DrawClanCinematic`; the current implementation does not read it.
/// @param color Accepted for compatibility with `UI_DrawClanCinematic`; the current implementation does not read it.
function UI_DrawClanCinematic(state,rect,scale,color) team=teamAt(state,state.currentTeam);if team==void then return void end if;if team.cinematic<0 then team.cinematic=UI_PlayCinematic(state,team.name,rect.x,rect.y,rect.w,rect.h) end if;return UI_DrawCinematic(state,team.cinematic,rect.x,rect.y,rect.w,rect.h) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPreviewCinematic`, returning its result for `state, "preview-cinematic", rect, cvarString(state,"ui_previewMovie"), [scale,color]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_previewMovie")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
function UI_DrawPreviewCinematic(state,rect,scale,color) return draw(state,"preview-cinematic",rect,cvarString(state,"ui_previewMovie"),[scale,color]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawSkill`, returning its result for `state, "skill", rect, str(state.currentBotSkill), [scale,color,textStyle]`.
/// @param state Record read through `state.currentBotSkill`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawSkill(state,rect,scale,color,textStyle) return draw(state,"skill",rect,str(state.currentBotSkill),[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.cvarString`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawTeamName`. The final path returns `draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_DrawTeamName`.
/// @param rect Value used by `return draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`.
/// @param scale Value used by `return draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param blue Blue color component.
/// @param textStyle Value used by `return draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`.
function UI_DrawTeamName(state,rect,scale,color,blue,textStyle) name=cvarString(state,"ui_redteam");if blue then name=cvarString(state,"ui_blueteam") end if;return draw(state,"team-name",rect,name,[scale,color,blue,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.draw`, `mq3.client.ui_main_missionpack.cvarString` from UI main missionpack `UI_DrawTeamMember`. The final path returns `draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_DrawTeamMember`.
/// @param rect Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param blue Blue color component.
/// @param num Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`.
/// @param textStyle Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`.
function UI_DrawTeamMember(state,rect,scale,color,blue,num,textStyle) prefix="ui_redteam";if blue then prefix="ui_blueteam" end if;return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawEffects`, returning its result for `state, "effects", rect, cvarString(state,"color1"), [scale,color]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"color1")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
function UI_DrawEffects(state,rect,scale,color) return draw(state,"effects",rect,cvarString(state,"color1"),[scale,color]) end function
/// Calls `mq3.client.ui_main_missionpack.clamp` from UI main missionpack `currentMap`. The final path returns `state.maps[clamp(state.currentMap,0,len(state.maps)-1)]`.
/// @param state Record read through `state.maps`, `state.currentMap`.
function currentMap(state) if len(state.maps)==0 then return void end if;return state.maps[clamp(state.currentMap,0,len(state.maps)-1)] end function
/// Updates `state.assets` during UI main missionpack `UI_DrawMapPreview`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.assets`.
/// @param rect Value used by `return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot])`.
/// @param scale Value used by `return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param net Value used by `return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot])`.
function UI_DrawMapPreview(state,rect,scale,color,net) map=currentMap(state);if map==void then return void end if;if map.levelShot<0 then map.levelShot=len(state.assets)+1;state.assets=state.assets+[map.imageName];emit(state,"renderer","register-shader",map.imageName,"",[]) end if;return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot]) end function
/// Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawMapTimeToBeat`. The final path returns `draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`.
/// @param state Record read through `state.currentGameType`.
/// @param rect Value used by `return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`.
function UI_DrawMapTimeToBeat(state,rect,scale,color,textStyle) map=currentMap(state);if map==void then return void end if;game=clamp(state.currentGameType,0,7);seconds=map.timeToBeat[game];return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `UI_PlayCinematic`. The final path returns `len(state.actions)`.
/// @param state Record read through `state.actions`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
/// @param x Horizontal coordinate in the coordinate space used by `UI_PlayCinematic`.
/// @param y Vertical coordinate in the coordinate space used by `UI_PlayCinematic`.
/// @param w Width in the coordinate space used by `UI_PlayCinematic`.
/// @param h Height in the coordinate space used by `UI_PlayCinematic`.
function UI_PlayCinematic(state,name,x,y,w,h) emit(state,"cinematic","play",name,"",[x,y,w,h]);return len(state.actions) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_StopCinematic`, returning its result for `state, "cinematic", "stop", str(handle), "", []`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param handle Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(handle)`.
function UI_StopCinematic(state,handle) return emit(state,"cinematic","stop",str(handle),"",[]) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_DrawCinematic`, returning its result for `state, "cinematic", "draw", str(handle), "", [x,y,w,h]`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param handle Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(handle)`.
/// @param x Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`.
/// @param y Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`.
/// @param w Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`.
/// @param h Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`.
function UI_DrawCinematic(state,handle,x,y,w,h) return emit(state,"cinematic","draw",str(handle),"",[x,y,w,h]) end function
/// Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_RunCinematicFrame`, returning its result for `state, "cinematic", "run", str(handle), "", []`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.emit`.
/// @param handle Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(handle)`.
function UI_RunCinematicFrame(state,handle) return emit(state,"cinematic","run",str(handle),"",[]) end function
/// Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.UI_PlayCinematic`, `mq3.client.ui_main_missionpack.UI_RunCinematicFrame` and additional helpers from UI main missionpack `UI_DrawMapCinematic`. The final path returns `UI_DrawCinematic(state,map.cinematic,rect.x,rect.y,rect.w,rect.h)`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_DrawMapCinematic`.
/// @param rect Record read through `rect.x`, `rect.y`, `rect.w`, `rect.h`.
/// @param scale Accepted for compatibility with `UI_DrawMapCinematic`; the current implementation does not read it.
/// @param color Accepted for compatibility with `UI_DrawMapCinematic`; the current implementation does not read it.
/// @param net Accepted for compatibility with `UI_DrawMapCinematic`; the current implementation does not read it.
function UI_DrawMapCinematic(state,rect,scale,color,net) map=currentMap(state);if map==void then return void end if;if map.cinematic<0 then map.cinematic=UI_PlayCinematic(state,map.mapLoadName,rect.x,rect.y,rect.w,rect.h) end if;UI_RunCinematicFrame(state,map.cinematic);return UI_DrawCinematic(state,map.cinematic,rect.x,rect.y,rect.w,rect.h) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerModel`, returning its result for `state, "player-model", rect, cvarString(state,"model"), []`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"model")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
function UI_DrawPlayerModel(state,rect) return draw(state,"player-model",rect,cvarString(state,"model"),[]) end function
/// Calls `mq3.client.ui_main_missionpack.draw`, `mq3.client.ui_main_missionpack.clamp` from UI main missionpack `UI_DrawNetSource`. The final path returns `draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`.
/// @param state Record read through `state.currentNetSource`.
/// @param rect Value used by `return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`.
function UI_DrawNetSource(state,rect,scale,color,textStyle) sources=["Local","MPlayer","Internet","Favorites"];return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.UI_DrawMapPreview` to UI main missionpack `UI_DrawNetMapPreview`, returning its result for `state, rect, scale, color, true`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`.
/// @param rect Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`.
/// @param scale Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`.
/// @param color Argument 4 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`.
function UI_DrawNetMapPreview(state,rect,scale,color) return UI_DrawMapPreview(state,rect,scale,color,true) end function
/// Adapts `mq3.client.ui_main_missionpack.UI_DrawMapCinematic` to UI main missionpack `UI_DrawNetMapCinematic`, returning its result for `state, rect, scale, color, true`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`.
/// @param rect Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`.
/// @param scale Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`.
/// @param color Argument 4 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`.
function UI_DrawNetMapCinematic(state,rect,scale,color) return UI_DrawMapCinematic(state,rect,scale,color,true) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawNetFilter`, returning its result for `state, "net-filter", rect, str(state.currentNetFilter), [scale,color,textStyle]`.
/// @param state Record read through `state.currentNetFilter`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawNetFilter(state,rect,scale,color,textStyle) return draw(state,"net-filter",rect,str(state.currentNetFilter),[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawTier`, returning its result for `state, "tier", rect, cvarString(state,"ui_currentTier"), [scale,color,textStyle]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_currentTier")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawTier(state,rect,scale,color,textStyle) return draw(state,"tier",rect,cvarString(state,"ui_currentTier"),[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawTierMap`. The final path returns `draw(state,"tier-map",rect,state.maps[index].imageName,[index])`.
/// @param state Record read through `state.maps`.
/// @param rect Value used by `return draw(state,"tier-map",rect,state.maps[index].imageName,[index])`.
/// @param index Value tested by `index<0 or index>=len(state.maps)` before the calculation continues.
function UI_DrawTierMap(state,rect,index) if index<0 or index>=len(state.maps) then return void end if;return draw(state,"tier-map",rect,state.maps[index].imageName,[index]) end function
/// Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawTierMapName`. The final path returns `draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_DrawTierMapName`.
/// @param rect Value used by `return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`.
function UI_DrawTierMapName(state,rect,scale,color,textStyle) map=currentMap(state);if map==void then return void end if;return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.UI_DrawGameType` to UI main missionpack `UI_DrawTierGameType`, returning its result for `state, rect, scale, color, textStyle`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawGameType`.
/// @param rect Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawGameType`.
/// @param scale Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawGameType`.
/// @param color Argument 4 of `mq3.client.ui_main_missionpack.UI_DrawGameType`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.UI_DrawGameType`.
function UI_DrawTierGameType(state,rect,scale,color,textStyle) return UI_DrawGameType(state,rect,scale,color,textStyle) end function
/// Calls `mq3.client.ui_main_missionpack.teamAt` from UI main missionpack `UI_OpponentLeaderName`. The final path returns `team.teamMembers[0]`.
/// @param state Record read through `state.currentOpponent`.
function UI_OpponentLeaderName(state) team=teamAt(state,state.currentOpponent);if team==void or len(team.teamMembers)==0 then return "" end if;return team.teamMembers[0] end function
/// Calls `std.string.toLowerAscii` from UI main missionpack `UI_AIFromName`. The final path returns `name`.
/// @param state Record read through `state.aliases`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
function UI_AIFromName(state,name) for each alias in state.aliases if strings.toLowerAscii(alias.name)==strings.toLowerAscii(name) then return alias.ai end if end for;return name end function
/// Calls `std.string.toLowerAscii` from UI main missionpack `UI_AIIndex`. The final path returns `0`.
/// @param state Record read through `state.aliases`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
function UI_AIIndex(state,name) for i=0 to len(state.aliases)-1 if strings.toLowerAscii(state.aliases[i].name)==strings.toLowerAscii(name) then return i end if end for;return 0 end function
/// Adapts `mq3.client.ui_main_missionpack.UI_AIIndex` to UI main missionpack `UI_AIIndexFromName`, returning its result for `state, name`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_AIIndex`.
/// @param name Argument 2 of `mq3.client.ui_main_missionpack.UI_AIIndex`.
function UI_AIIndexFromName(state,name) return UI_AIIndex(state,name) end function
/// Adapts `mq3.client.ui_main_missionpack.UI_AIFromName` to UI main missionpack `UI_OpponentLeaderHead`, returning its result for `state, UI_OpponentLeaderName(state)`.
/// @param state Argument 1, 2 of `mq3.client.ui_main_missionpack.UI_AIFromName`; passed as `state`, `UI_OpponentLeaderName(state)`.
function UI_OpponentLeaderHead(state) return UI_AIFromName(state,UI_OpponentLeaderName(state)) end function
/// Computes `UI_OpponentLeaderHead(state)+"/default"` for UI main missionpack `UI_OpponentLeaderModel`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_OpponentLeaderModel`.
function UI_OpponentLeaderModel(state) return UI_OpponentLeaderHead(state)+"/default" end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawOpponent`, returning its result for `state, "opponent", rect, UI_OpponentLeaderModel(state), []`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `UI_OpponentLeaderModel(state)`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
function UI_DrawOpponent(state,rect) return draw(state,"opponent",rect,UI_OpponentLeaderModel(state),[]) end function
/// Updates `state.currentOpponent` during UI main missionpack `UI_NextOpponent`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentOpponent`.
function UI_NextOpponent(state) state.currentOpponent=cycle(state.currentOpponent,len(state.teams),K_MOUSE1);return state.currentOpponent end function
/// Updates `state.currentOpponent` during UI main missionpack `UI_PriorOpponent`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentOpponent`.
function UI_PriorOpponent(state) state.currentOpponent=cycle(state.currentOpponent,len(state.teams),K_MOUSE2);return state.currentOpponent end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerLogo`, returning its result for `state, "player-logo", rect, cvarString(state,"ui_teamName"), [color]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[color]`.
function UI_DrawPlayerLogo(state,rect,color) return draw(state,"player-logo",rect,cvarString(state,"ui_teamName"),[color]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerLogoMetal`, returning its result for `state, "player-logo-metal", rect, cvarString(state,"ui_teamName"), [color]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[color]`.
function UI_DrawPlayerLogoMetal(state,rect,color) return draw(state,"player-logo-metal",rect,cvarString(state,"ui_teamName"),[color]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerLogoName`, returning its result for `state, "player-logo-name", rect, cvarString(state,"ui_teamName"), [color]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[color]`.
function UI_DrawPlayerLogoName(state,rect,color) return draw(state,"player-logo-name",rect,cvarString(state,"ui_teamName"),[color]) end function
/// Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawOpponentLogo`. The final path returns `draw(state,"opponent-logo",rect,team.name,[color])`.
/// @param state Record read through `state.currentOpponent`.
/// @param rect Value used by `return draw(state,"opponent-logo",rect,team.name,[color])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
function UI_DrawOpponentLogo(state,rect,color) team=teamAt(state,state.currentOpponent);if team==void then return void end if;return draw(state,"opponent-logo",rect,team.name,[color]) end function
/// Adapts `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo` to UI main missionpack `UI_DrawOpponentLogoMetal`, returning its result for `state, rect, color`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`.
/// @param rect Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`.
/// @param color Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`.
function UI_DrawOpponentLogoMetal(state,rect,color) return UI_DrawOpponentLogo(state,rect,color) end function
/// Adapts `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo` to UI main missionpack `UI_DrawOpponentLogoName`, returning its result for `state, rect, color`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`.
/// @param rect Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`.
/// @param color Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`.
function UI_DrawOpponentLogoName(state,rect,color) return UI_DrawOpponentLogo(state,rect,color) end function
/// Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawAllMapsSelection`. The final path returns `draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_DrawAllMapsSelection`.
/// @param rect Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`.
/// @param scale Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`.
/// @param net Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`.
function UI_DrawAllMapsSelection(state,rect,scale,color,textStyle,net) map=currentMap(state);if map==void then return void end if;return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net]) end function
/// Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawOpponentName`. The final path returns `draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`.
/// @param state Record read through `state.currentOpponent`.
/// @param rect Value used by `return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`.
function UI_DrawOpponentName(state,rect,scale,color,textStyle) team=teamAt(state,state.currentOpponent);if team==void then return void end if;return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle]) end function
/// Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawBotName`. The final path returns `draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`.
/// @param state Record read through `state.aliases`, `state.currentBot`.
/// @param rect Value used by `return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`.
function UI_DrawBotName(state,rect,scale,color,textStyle) if len(state.aliases)==0 then return void end if;alias=state.aliases[clamp(state.currentBot,0,len(state.aliases)-1)];return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawBotSkill`, returning its result for `state, "bot-skill", rect, str(state.currentBotSkill), [scale,color,textStyle]`.
/// @param state Record read through `state.currentBotSkill`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawBotSkill(state,rect,scale,color,textStyle) return draw(state,"bot-skill",rect,str(state.currentBotSkill),[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawRedBlue`, returning its result for `state, "red-blue", rect, cvarString(state,"ui_redblue"), [scale,color,textStyle]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_redblue")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawRedBlue(state,rect,scale,color,textStyle) return draw(state,"red-blue",rect,cvarString(state,"ui_redblue"),[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawCrosshair`, returning its result for `state, "crosshair", rect, "gfx/2d/crosshair"+str(state.currentCrosshair), [scale,color]`.
/// @param state Record read through `state.currentCrosshair`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
function UI_DrawCrosshair(state,rect,scale,color) return draw(state,"crosshair",rect,"gfx/2d/crosshair"+str(state.currentCrosshair),[scale,color]) end function
/// Updates `state.playerNames`, `state.teamNames`, `state.playerRefresh` during UI main missionpack `UI_BuildPlayerList`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.playerNames`, `state.teamNames`, `state.playerRefresh`.
/// @param names Sequence read at `names[i]`.
/// @param teams Sequence read at `teams[i]`.
/// @param ownTeam Value used by `for i=0 to len(names)-1 if i<len(teams) and teams[i]==ownTeam then state.teamNames=state.teamNames+[names[i]] end if end for`.
function UI_BuildPlayerList(state,names,teams,ownTeam) state.playerNames=names;state.teamNames=[];for i=0 to len(names)-1 if i<len(teams) and teams[i]==ownTeam then state.teamNames=state.teamNames+[names[i]] end if end for;state.playerRefresh=state.realtime+3000;return len(state.playerNames) end function
/// Calls `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawSelectedPlayer`. The final path returns `draw(state,"selected-player",rect,name,[scale,color,textStyle])`.
/// @param state Record read through `state.selectedPlayer`, `state.teamNames`.
/// @param rect Value used by `return draw(state,"selected-player",rect,name,[scale,color,textStyle])`.
/// @param scale Value used by `return draw(state,"selected-player",rect,name,[scale,color,textStyle])`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param textStyle Value used by `return draw(state,"selected-player",rect,name,[scale,color,textStyle])`.
function UI_DrawSelectedPlayer(state,rect,scale,color,textStyle) name="Everyone";if state.selectedPlayer>=0 and state.selectedPlayer<len(state.teamNames) then name=state.teamNames[state.selectedPlayer] end if;return draw(state,"selected-player",rect,name,[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawServerRefreshDate`, returning its result for `state, "server-refresh-date", rect, state.serverRefreshDate, [scale,color,textStyle]`.
/// @param state Record read through `state.serverRefreshDate`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawServerRefreshDate(state,rect,scale,color,textStyle) return draw(state,"server-refresh-date",rect,state.serverRefreshDate,[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawServerMOTD`, returning its result for `state, "server-motd", rect, state.serverMOTD, [scale,color]`.
/// @param state Record read through `state.serverMOTD`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`.
function UI_DrawServerMOTD(state,rect,scale,color) return draw(state,"server-motd",rect,state.serverMOTD,[scale,color]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawKeyBindStatus`, returning its result for `state, "keybind-status", rect, cvarString(state,"ui_bindStatus"), [scale,color,textStyle]`.
/// @param state Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_bindStatus")`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawKeyBindStatus(state,rect,scale,color,textStyle) return draw(state,"keybind-status",rect,cvarString(state,"ui_bindStatus"),[scale,color,textStyle]) end function
/// Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawGLInfo`, returning its result for `state, "gl-info", rect, state.glInfo, [scale,color,textStyle]`.
/// @param state Record read through `state.glInfo`.
/// @param rect Argument 3 of `mq3.client.ui_main_missionpack.draw`.
/// @param scale Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param color Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
/// @param textStyle Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`.
function UI_DrawGLInfo(state,rect,scale,color,textStyle) return draw(state,"gl-info",rect,state.glInfo,[scale,color,textStyle]) end function

/// Calls `mq3.client.ui_main_missionpack.Text_Width`, `mq3.client.ui_main_missionpack.cvarString`, `mq3.client.ui_main_missionpack.clamp` and additional helpers from UI main missionpack `UI_OwnerDrawWidth`. The final path returns `0`.
/// @param state Record read through `state.currentGameType`, `state.gameTypes`, `state.currentOpponent`, `state.aliases` and additional values.
/// @param ownerDraw Value used by `if ownerDraw==200 then return Text_Width(state,cvarString(state,"handicap"),scale,0)`.
/// @param scale Value used by `if ownerDraw==200 then return Text_Width(state,cvarString(state,"handicap"),scale,0)`.
function UI_OwnerDrawWidth(state,ownerDraw,scale)
  if ownerDraw==200 then return Text_Width(state,cvarString(state,"handicap"),scale,0)
  else if ownerDraw==203 then return Text_Width(state,cvarString(state,"ui_teamName"),scale,0)
  else if ownerDraw==205 then index=clamp(state.currentGameType,0,len(state.gameTypes)-1);return Text_Width(state,state.gameTypes[index][0],scale,0)
  else if ownerDraw==237 then team=teamAt(state,state.currentOpponent);if team!=void then return Text_Width(state,team.name,scale,0) end if
  else if ownerDraw==239 and len(state.aliases)>0 then return Text_Width(state,state.aliases[clamp(state.currentBot,0,len(state.aliases)-1)].name,scale,0)
  else if ownerDraw==247 then return Text_Width(state,state.serverRefreshDate,scale,0) end if;return 0
end function
/// Adapts `mq3.client.ui_main_missionpack.UI_OwnerDrawWidth` to UI main missionpack `UI_OwnerDraw_Width`, returning its result for `state, ownerDraw, 0.4`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_OwnerDrawWidth`.
/// @param ownerDraw Argument 2 of `mq3.client.ui_main_missionpack.UI_OwnerDrawWidth`.
function UI_OwnerDraw_Width(state,ownerDraw) return UI_OwnerDrawWidth(state,ownerDraw,0.4) end function
/// Calls `mq3.client.ui_main_missionpack.Rect`, `mq3.client.ui_main_missionpack.UI_OwnerDrawVisible`, `mq3.client.ui_main_missionpack.UI_DrawHandicap` and additional helpers from UI main missionpack `UI_OwnerDraw`. The final path returns `draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_OwnerDraw`.
/// @param x Horizontal coordinate in the coordinate space used by `UI_OwnerDraw`.
/// @param y Vertical coordinate in the coordinate space used by `UI_OwnerDraw`.
/// @param w Width in the coordinate space used by `UI_OwnerDraw`.
/// @param h Height in the coordinate space used by `UI_OwnerDraw`.
/// @param text_x Accepted for compatibility with `UI_OwnerDraw`; the current implementation does not read it.
/// @param text_y Accepted for compatibility with `UI_OwnerDraw`; the current implementation does not read it.
/// @param ownerDraw Value used by `if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)`.
/// @param ownerDrawFlags Value used by `if not UI_OwnerDrawVisible(state,ownerDrawFlags) then return void end if`.
/// @param align Value used by `return draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])`.
/// @param special Value used by `return draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])`.
/// @param scale Value used by `if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)`.
/// @param color Color value used by the UI main missionpack drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param textStyle Value used by `if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)`.
function UI_OwnerDraw(state,x,y,w,h,text_x,text_y,ownerDraw,ownerDrawFlags,align,special,scale,color,shader,textStyle)
  rect=Rect(x,y,w,h)
  if not UI_OwnerDrawVisible(state,ownerDrawFlags) then return void end if
  if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)
  else if ownerDraw==201 then return UI_DrawEffects(state,rect,scale,color)
  else if ownerDraw==202 then return UI_DrawPlayerModel(state,rect)
  else if ownerDraw==203 then return UI_DrawClanName(state,rect,scale,color,textStyle)
  else if ownerDraw==204 then return UI_DrawClanLogo(state,rect,scale,color)
  else if ownerDraw==205 then return UI_DrawGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==206 then return UI_DrawMapPreview(state,rect,scale,color,false)
  else if ownerDraw==207 then return UI_DrawSkill(state,rect,scale,color,textStyle)
  else if ownerDraw==208 then return UI_DrawTeamName(state,rect,scale,color,true,textStyle)
  else if ownerDraw==209 then return UI_DrawTeamName(state,rect,scale,color,false,textStyle)
  else if ownerDraw>=210 and ownerDraw<=214 then return UI_DrawTeamMember(state,rect,scale,color,true,ownerDraw-209,textStyle)
  else if ownerDraw>=215 and ownerDraw<=219 then return UI_DrawTeamMember(state,rect,scale,color,false,ownerDraw-214,textStyle)
  else if ownerDraw==220 then return UI_DrawNetSource(state,rect,scale,color,textStyle)
  else if ownerDraw==221 then return UI_DrawNetMapPreview(state,rect,scale,color)
  else if ownerDraw==222 then return UI_DrawNetFilter(state,rect,scale,color,textStyle)
  else if ownerDraw==223 then return UI_DrawTier(state,rect,scale,color,textStyle)
  else if ownerDraw==224 then return UI_DrawOpponent(state,rect)
  else if ownerDraw>=225 and ownerDraw<=227 then return UI_DrawTierMap(state,rect,ownerDraw-225)
  else if ownerDraw==228 then return UI_DrawPlayerLogo(state,rect,color)
  else if ownerDraw==229 then return UI_DrawOpponentLogo(state,rect,color)
  else if ownerDraw==230 then return UI_DrawPlayerLogoMetal(state,rect,color)
  else if ownerDraw==231 then return UI_DrawOpponentLogoMetal(state,rect,color)
  else if ownerDraw==232 then return UI_DrawPlayerLogoName(state,rect,color)
  else if ownerDraw==233 then return UI_DrawOpponentLogoName(state,rect,color)
  else if ownerDraw==234 then return UI_DrawTierMapName(state,rect,scale,color,textStyle)
  else if ownerDraw==235 then return UI_DrawTierGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==236 or ownerDraw==256 then return UI_DrawAllMapsSelection(state,rect,scale,color,textStyle,ownerDraw==256)
  else if ownerDraw==237 then return UI_DrawOpponentName(state,rect,scale,color,textStyle)
  else if ownerDraw==239 then return UI_DrawBotName(state,rect,scale,color,textStyle)
  else if ownerDraw==240 then return UI_DrawBotSkill(state,rect,scale,color,textStyle)
  else if ownerDraw==241 then return UI_DrawRedBlue(state,rect,scale,color,textStyle)
  else if ownerDraw==242 then return UI_DrawCrosshair(state,rect,scale,color)
  else if ownerDraw==243 then return UI_DrawSelectedPlayer(state,rect,scale,color,textStyle)
  else if ownerDraw==244 then return UI_DrawMapCinematic(state,rect,scale,color,false)
  else if ownerDraw==245 then return UI_DrawNetGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==246 then return UI_DrawNetMapCinematic(state,rect,scale,color)
  else if ownerDraw==247 then return UI_DrawServerRefreshDate(state,rect,scale,color,textStyle)
  else if ownerDraw==248 then return UI_DrawServerMOTD(state,rect,scale,color)
  else if ownerDraw==249 then return UI_DrawGLInfo(state,rect,scale,color,textStyle)
  else if ownerDraw==250 then return UI_DrawKeyBindStatus(state,rect,scale,color,textStyle)
  else if ownerDraw==251 then return UI_DrawClanCinematic(state,rect,scale,color)
  else if ownerDraw==252 then return UI_DrawMapTimeToBeat(state,rect,scale,color,textStyle)
  else if ownerDraw==253 then return UI_DrawJoinGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==254 then return UI_DrawPreviewCinematic(state,rect,scale,color) end if
  return draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])
end function
/// Evaluates UI main missionpack `UI_OwnerDrawVisible` and returns `false`, `true` according to its guard/selection conditions.
/// @param state Record read through `state.currentNetSource`, `state.realtime`, `state.newHighScoreTime`, `state.newBestTime` and additional values.
/// @param flags Value used by `if (flags&UI_SHOW_FAVORITESERVERS)!=0 and state.currentNetSource!=AS_FAVORITES then return false end if`.
function UI_OwnerDrawVisible(state,flags)
  if (flags&UI_SHOW_FAVORITESERVERS)!=0 and state.currentNetSource!=AS_FAVORITES then return false end if
  if (flags&UI_SHOW_NOTFAVORITESERVERS)!=0 and state.currentNetSource==AS_FAVORITES then return false end if
  if (flags&UI_SHOW_NEWHIGHSCORE)!=0 and state.realtime>state.newHighScoreTime then return false end if
  if (flags&UI_SHOW_NEWBESTTIME)!=0 and state.realtime>state.newBestTime then return false end if
  if (flags&UI_SHOW_DEMOAVAILABLE)!=0 and not state.demoAvailable then return false end if
  game=state.currentGameType;if (flags&UI_SHOW_FFA)!=0 and game!=GT_FFA then return false end if;if (flags&UI_SHOW_NOTFFA)!=0 and game==GT_FFA then return false end if
  if (flags&UI_SHOW_ANYTEAMGAME)!=0 and game<GT_TEAM then return false end if;if (flags&UI_SHOW_ANYNONTEAMGAME)!=0 and game>=GT_TEAM then return false end if
  if (flags&UI_SHOW_NETANYTEAMGAME)!=0 and state.currentNetGameType<GT_TEAM then return false end if;if (flags&UI_SHOW_NETANYNONTEAMGAME)!=0 and state.currentNetGameType>=GT_TEAM then return false end if
  return true
end function

/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.direction` and additional helpers from UI main missionpack `UI_Handicap_HandleKey`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_Handicap_HandleKey`.
/// @param flags Accepted for compatibility with `UI_Handicap_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_Handicap_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_Handicap_HandleKey(state,flags,special,key) value=n.trunc32(cvarValue(state,"handicap"));value=value-direction(key)*5;if value>100 then value=5 else if value<5 then value=100 end if;setCvar(state,"handicap",value);return true end function
/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.cycle` and additional helpers from UI main missionpack `UI_Effects_HandleKey`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_Effects_HandleKey`.
/// @param flags Accepted for compatibility with `UI_Effects_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_Effects_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_Effects_HandleKey(state,flags,special,key) value=n.trunc32(cvarValue(state,"color1"));value=cycle(value-1,7,key)+1;setCvar(state,"color1",value);return true end function
/// Updates `state.currentTeam` during UI main missionpack `UI_ClanName_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentTeam`.
/// @param flags Accepted for compatibility with `UI_ClanName_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_ClanName_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_ClanName_HandleKey(state,flags,special,key) state.currentTeam=cycle(state.currentTeam,len(state.teams),key);if len(state.teams)>0 then setCvar(state,"ui_teamName",state.teams[state.currentTeam].name) end if;return true end function
/// Updates `state.currentGameType`, `state.currentMap` during UI main missionpack `UI_GameType_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentGameType`, `state.currentMap`.
/// @param flags Accepted for compatibility with `UI_GameType_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_GameType_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
/// @param resetMap Value used by `if resetMap then state.currentMap=0 end if`.
function UI_GameType_HandleKey(state,flags,special,key,resetMap) state.currentGameType=cycle(state.currentGameType,len(state.gameTypes),key);if resetMap then state.currentMap=0 end if;setCvar(state,"ui_gameType",state.currentGameType);return true end function
/// Updates `state.currentNetGameType`, `state.currentMap` during UI main missionpack `UI_NetGameType_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentNetGameType`, `state.currentMap`.
/// @param flags Accepted for compatibility with `UI_NetGameType_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_NetGameType_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_NetGameType_HandleKey(state,flags,special,key) state.currentNetGameType=cycle(state.currentNetGameType,len(state.gameTypes),key);state.currentMap=0;setCvar(state,"ui_netGameType",state.currentNetGameType);return true end function
/// Updates `state.currentJoinGameType` during UI main missionpack `UI_JoinGameType_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentJoinGameType`.
/// @param flags Accepted for compatibility with `UI_JoinGameType_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_JoinGameType_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_JoinGameType_HandleKey(state,flags,special,key) state.currentJoinGameType=cycle(state.currentJoinGameType,len(state.joinGameTypes),key);setCvar(state,"ui_joinGameType",state.currentJoinGameType);return true end function
/// Updates `state.currentBotSkill` during UI main missionpack `UI_Skill_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentBotSkill`.
/// @param flags Accepted for compatibility with `UI_Skill_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_Skill_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_Skill_HandleKey(state,flags,special,key) state.currentBotSkill=cycle(state.currentBotSkill-1,5,key)+1;setCvar(state,"g_spSkill",state.currentBotSkill);return true end function
/// Updates `state.currentOpponent`, `state.currentTeam` during UI main missionpack `UI_TeamName_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentOpponent`, `state.currentTeam`.
/// @param flags Accepted for compatibility with `UI_TeamName_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_TeamName_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
/// @param blue Blue color component.
function UI_TeamName_HandleKey(state,flags,special,key,blue) index=state.currentTeam;if blue then index=state.currentOpponent end if;index=cycle(index,len(state.teams),key);if blue then state.currentOpponent=index;setCvar(state,"ui_blueTeam",state.teams[index].name) else state.currentTeam=index;setCvar(state,"ui_redTeam",state.teams[index].name) end if;return true end function
/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.cycle` and additional helpers from UI main missionpack `UI_TeamMember_HandleKey`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_TeamMember_HandleKey`.
/// @param flags Accepted for compatibility with `UI_TeamMember_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_TeamMember_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
/// @param blue Blue color component.
/// @param num Value used by `value=n.trunc32(cvarValue(state,prefix+str(num)))`.
function UI_TeamMember_HandleKey(state,flags,special,key,blue,num) prefix="ui_redteam";if blue then prefix="ui_blueteam" end if;value=n.trunc32(cvarValue(state,prefix+str(num)));value=cycle(value,6,key);setCvar(state,prefix+str(num),value);return true end function
/// Updates `state.currentNetSource` during UI main missionpack `UI_NetSource_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentNetSource`.
/// @param flags Accepted for compatibility with `UI_NetSource_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_NetSource_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_NetSource_HandleKey(state,flags,special,key) state.currentNetSource=cycle(state.currentNetSource,4,key);setCvar(state,"ui_netSource",state.currentNetSource);UI_StartServerRefresh(state,true);return true end function
/// Updates `state.currentNetFilter` during UI main missionpack `UI_NetFilter_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentNetFilter`.
/// @param flags Accepted for compatibility with `UI_NetFilter_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_NetFilter_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_NetFilter_HandleKey(state,flags,special,key) state.currentNetFilter=cycle(state.currentNetFilter,len(state.gameTypes)+1,key);setCvar(state,"ui_serverFilterType",state.currentNetFilter);return true end function
/// Calls `mq3.client.ui_main_missionpack.direction`, `mq3.client.ui_main_missionpack.UI_PriorOpponent`, `mq3.client.ui_main_missionpack.UI_NextOpponent` and additional helpers from UI main missionpack `UI_OpponentName_HandleKey`.
/// @param state Record read through `state.teams`, `state.currentOpponent`.
/// @param flags Accepted for compatibility with `UI_OpponentName_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_OpponentName_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_OpponentName_HandleKey(state,flags,special,key) if direction(key)<0 then UI_PriorOpponent(state) else UI_NextOpponent(state) end if;if len(state.teams)>0 then setCvar(state,"ui_opponentName",state.teams[state.currentOpponent].name) end if;return true end function
/// Updates `state.currentBot` during UI main missionpack `UI_BotName_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentBot`.
/// @param flags Accepted for compatibility with `UI_BotName_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_BotName_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_BotName_HandleKey(state,flags,special,key) state.currentBot=cycle(state.currentBot,len(state.aliases),key);return true end function
/// Updates `state.currentBotSkill` during UI main missionpack `UI_BotSkill_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentBotSkill`.
/// @param flags Accepted for compatibility with `UI_BotSkill_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_BotSkill_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_BotSkill_HandleKey(state,flags,special,key) state.currentBotSkill=cycle(state.currentBotSkill-1,5,key)+1;return true end function
/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.setCvar` from UI main missionpack `UI_RedBlue_HandleKey`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_RedBlue_HandleKey`.
/// @param flags Accepted for compatibility with `UI_RedBlue_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_RedBlue_HandleKey`; the current implementation does not read it.
/// @param key Accepted for compatibility with `UI_RedBlue_HandleKey`; the current implementation does not read it.
function UI_RedBlue_HandleKey(state,flags,special,key) value=n.trunc32(cvarValue(state,"ui_redblue"));value=1-value;setCvar(state,"ui_redblue",value);return true end function
/// Updates `state.currentCrosshair` during UI main missionpack `UI_Crosshair_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentCrosshair`.
/// @param flags Accepted for compatibility with `UI_Crosshair_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_Crosshair_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_Crosshair_HandleKey(state,flags,special,key) state.currentCrosshair=cycle(state.currentCrosshair,10,key);setCvar(state,"cg_drawCrosshair",state.currentCrosshair);return true end function
/// Updates `state.selectedPlayer` during UI main missionpack `UI_SelectedPlayer_HandleKey`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.selectedPlayer`.
/// @param flags Accepted for compatibility with `UI_SelectedPlayer_HandleKey`; the current implementation does not read it.
/// @param special Accepted for compatibility with `UI_SelectedPlayer_HandleKey`; the current implementation does not read it.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_SelectedPlayer_HandleKey(state,flags,special,key) state.selectedPlayer=cycle(state.selectedPlayer,len(state.teamNames)+1,key);setCvar(state,"cg_selectedPlayer",state.selectedPlayer);return true end function
/// Calls `mq3.client.ui_main_missionpack.UI_Handicap_HandleKey`, `mq3.client.ui_main_missionpack.UI_Effects_HandleKey`, `mq3.client.ui_main_missionpack.UI_ClanName_HandleKey` and additional helpers from UI main missionpack `UI_OwnerDrawHandleKey`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_OwnerDrawHandleKey`.
/// @param ownerDraw Value used by `if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,fla...`.
/// @param flags Value used by `if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,fla...`.
/// @param special Value used by `if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,fla...`.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
function UI_OwnerDrawHandleKey(state,ownerDraw,flags,special,key)
  if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,flags,special,key) else if ownerDraw==203 then return UI_ClanName_HandleKey(state,flags,special,key) else if ownerDraw==205 then return UI_GameType_HandleKey(state,flags,special,key,true) else if ownerDraw==207 then return UI_Skill_HandleKey(state,flags,special,key) else if ownerDraw==220 then return UI_NetSource_HandleKey(state,flags,special,key) else if ownerDraw==222 then return UI_NetFilter_HandleKey(state,flags,special,key) else if ownerDraw==237 then return UI_OpponentName_HandleKey(state,flags,special,key) else if ownerDraw==239 then return UI_BotName_HandleKey(state,flags,special,key) else if ownerDraw==240 then return UI_BotSkill_HandleKey(state,flags,special,key) else if ownerDraw==241 then return UI_RedBlue_HandleKey(state,flags,special,key) else if ownerDraw==242 then return UI_Crosshair_HandleKey(state,flags,special,key) else if ownerDraw==243 then return UI_SelectedPlayer_HandleKey(state,flags,special,key) else if ownerDraw==245 then return UI_NetGameType_HandleKey(state,flags,special,key) else if ownerDraw==253 then return UI_JoinGameType_HandleKey(state,flags,special,key) end if;return false
end function
/// Returns the fixed `0.0` value for UI main missionpack `UI_GetValue`.
/// @param state Accepted for compatibility with `UI_GetValue`; the current implementation does not read it.
/// @param ownerDraw Accepted for compatibility with `UI_GetValue`; the current implementation does not read it.
function UI_GetValue(state,ownerDraw) return 0.0 end function

/// Calls `std.string.toLowerAscii` from UI main missionpack `compareText`. The final path returns `0`.
/// @param left Value used by `a=bytes(strings.toLowerAscii(left))`.
/// @param right Value used by `b=bytes(strings.toLowerAscii(right))`.
function compareText(left,right) a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));count=len(a);if len(b)<count then count=len(b) end if;for i=0 to count-1 if a[i]<b[i] then return -1 else if a[i]>b[i] then return 1 end if end for;if len(a)<len(b) then return -1 else if len(a)>len(b) then return 1 end if;return 0 end function
/// Calls `mq3.client.ui_main_missionpack.compareText` from UI main missionpack `UI_ServersQsortCompare`. The final path returns `result`.
/// @param state Record read through `state.servers`, `state.sortKey`, `state.sortDir`.
/// @param leftIndex Value used by `left=state.servers[leftIndex]`.
/// @param rightIndex Value used by `right=state.servers[rightIndex]`.
function UI_ServersQsortCompare(state,leftIndex,rightIndex)
  left=state.servers[leftIndex];right=state.servers[rightIndex];result=0
  if state.sortKey==0 then result=compareText(left.hostname,right.hostname)
  else if state.sortKey==1 then result=compareText(left.mapname,right.mapname)
  else if state.sortKey==2 then result=left.clients-right.clients
  else if state.sortKey==3 then result=left.gametype-right.gametype
  else if state.sortKey==4 then result=left.ping-right.ping
  else if state.sortKey==5 then result=left.punkbuster-right.punkbuster end if
  if state.sortDir!=0 then result=0-result end if;return result
end function
/// Updates `state.sortKey`, `state.displayServers` during UI main missionpack `UI_ServersSort`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.sortKey`, `state.displayServers`.
/// @param column Value assigned to `state.sortKey`.
/// @param force Value used by `if not force and state.sortKey==column then return false end if`.
function UI_ServersSort(state,column,force)
  if not force and state.sortKey==column then return false end if;state.sortKey=column
  sorted=[];for each index in state.displayServers inserted=false;next=[];for each old in sorted if not inserted and UI_ServersQsortCompare(state,index,old)<0 then next=next+[index];inserted=true end if;next=next+[old] end for;if not inserted then next=next+[index] end if;sorted=next end for;state.displayServers=sorted;return true
end function
/// Updates `state.displayServers` during UI main missionpack `UI_InsertServerIntoDisplayList`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.displayServers`.
/// @param num Value used by `if containsValue(state.displayServers,num) then return false end if`.
/// @param position Value used by `position=clamp(position,0,len(state.displayServers))`.
function UI_InsertServerIntoDisplayList(state,num,position) if containsValue(state.displayServers,num) then return false end if;position=clamp(position,0,len(state.displayServers));result=[];inserted=false;if len(state.displayServers)>0 then for i=0 to len(state.displayServers)-1 if i==position then result=result+[num];inserted=true end if;result=result+[state.displayServers[i]] end for end if;if not inserted then result=result+[num] end if;state.displayServers=result;return true end function
/// Updates `state.displayServers` during UI main missionpack `UI_RemoveServerFromDisplayList`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.displayServers`.
/// @param num Value used by `for each value in state.displayServers if value==num then removed=true else result=result+[value] end if end for`.
function UI_RemoveServerFromDisplayList(state,num) result=[];removed=false;for each value in state.displayServers if value==num then removed=true else result=result+[value] end if end for;state.displayServers=result;return removed end function
/// Calls `mq3.client.ui_main_missionpack.UI_ServersQsortCompare`, `mq3.client.ui_main_missionpack.UI_InsertServerIntoDisplayList` from UI main missionpack `UI_BinaryServerInsertion`. The final path returns `UI_InsertServerIntoDisplayList(state,num,low)`.
/// @param state Record read through `state.displayServers`.
/// @param num Value used by `if UI_ServersQsortCompare(state,num,state.displayServers[mid])<0 then high=mid else low=mid+1 end if end while`.
function UI_BinaryServerInsertion(state,num) low=0;high=len(state.displayServers);while low<high mid=(low+high)>>1;if UI_ServersQsortCompare(state,num,state.displayServers[mid])<0 then high=mid else low=mid+1 end if end while;return UI_InsertServerIntoDisplayList(state,num,low) end function
/// Calls `mq3.compat.textnumbers.atoi`, `mq3.client.ui_main_missionpack.cvarString` from UI main missionpack `serverPasses`.
/// @param state Record read through `state.currentNetSource`, `state.currentNetFilter`.
/// @param server Record read through `server.visible`, `server.ping`, `server.favorite`, `server.clients` and additional values.
function serverPasses(state,server)
  if not server.visible or server.ping<=0 then return false end if
  if state.currentNetSource==AS_FAVORITES and not server.favorite then return false end if
  if numbers.atoi(cvarString(state,"ui_browserShowEmpty"))==0 and server.clients==0 then return false end if
  if numbers.atoi(cvarString(state,"ui_browserShowFull"))==0 and server.clients>=server.maxClients then return false end if
  if state.currentNetFilter>0 and server.gametype!=state.currentNetFilter-1 then return false end if;return true
end function
/// Updates `state.displayServers`, `state.numPlayersOnServers` during UI main missionpack `UI_BuildServerDisplayList`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.displayServers`, `state.numPlayersOnServers`.
/// @param force Value used by `if force then state.displayServers=[]`.
function UI_BuildServerDisplayList(state,force)
  if force then state.displayServers=[];state.numPlayersOnServers=0 end if
  for index=0 to len(state.servers)-1 server=state.servers[index];passes=serverPasses(state,server);shown=containsValue(state.displayServers,index);if passes and not shown then UI_BinaryServerInsertion(state,index);state.numPlayersOnServers=state.numPlayersOnServers+server.clients else if not passes and shown then UI_RemoveServerFromDisplayList(state,index) end if end for
  return len(state.displayServers)
end function
/// Updates `state.serverStatusLines` during UI main missionpack `UI_SortServerStatusInfo`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.serverStatusLines`.
/// @param rows Value used by `for each row in rows if len(row)>=2 and (row[0]=="Address" or row[0]=="Name" or row[0]=="Game name" or row[0]=="Game type") then keys=keys+[ro...`.
function UI_SortServerStatusInfo(state,rows)
  keys=[];values=[];for each row in rows if len(row)>=2 and (row[0]=="Address" or row[0]=="Name" or row[0]=="Game name" or row[0]=="Game type") then keys=keys+[row] else values=values+[row] end if end for
  sorted=[];for each row in values inserted=false;next=[];for each old in sorted if not inserted and compareText(row[0],old[0])<0 then next=next+[row];inserted=true end if;next=next+[old] end for;if not inserted then next=next+[row] end if;sorted=next end for;state.serverStatusLines=keys+sorted;return state.serverStatusLines
end function
/// Calls `std.string.split`, `mq3.client.ui_main_missionpack.UI_SortServerStatusInfo` from UI main missionpack `UI_GetServerStatusInfo`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_GetServerStatusInfo`.
/// @param address Value used by `if address=="" or statusText=="" then return false end if`.
/// @param statusText Value used by `if address=="" or statusText=="" then return false end if`.
function UI_GetServerStatusInfo(state,address,statusText)
  if address=="" or statusText=="" then return false end if;rows=[["Address",address,"",""]];lines=strings.split(statusText,"\n");for each line in lines fields=strings.split(line,"\t");if len(fields)>=2 then row=[fields[0],fields[1],"",""];if len(fields)>=4 then row=fields end if;rows=rows+[row] end if end for;UI_SortServerStatusInfo(state,rows);return true
end function
/// Calls `std.string.indexOf`, `std.string.toLowerAscii` from UI main missionpack `stristr`. The final path returns `strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0)`.
/// @param text Text consumed or emitted by `stristr` in the UI main missionpack path.
/// @param needle Value used by `if needle=="" then return 0 end if`.
function stristr(text,needle) if needle=="" then return 0 end if;return strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0) end function
/// Updates `state.foundPlayerNames`, `state.foundPlayerAddresses`, `state.nextDisplayRefresh` during UI main missionpack `UI_BuildFindPlayerList`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.foundPlayerNames`, `state.foundPlayerAddresses`, `state.nextDisplayRefresh`.
/// @param force Value used by `if not force and state.realtime<state.nextDisplayRefresh then return len(state.foundPlayerNames) end if`.
function UI_BuildFindPlayerList(state,force)
  if not force and state.realtime<state.nextDisplayRefresh then return len(state.foundPlayerNames) end if;wanted=strings.toLowerAscii(cvarString(state,"ui_findPlayer"));state.foundPlayerNames=[];state.foundPlayerAddresses=[]
  if wanted=="" then return 0 end if
  for each server in state.servers if strings.indexOf(strings.toLowerAscii(server.hostname),wanted,0)>=0 then state.foundPlayerNames=state.foundPlayerNames+[server.hostname];state.foundPlayerAddresses=state.foundPlayerAddresses+[server.address] end if end for;state.nextDisplayRefresh=state.realtime+1000;return len(state.foundPlayerNames)
end function
/// Updates `state.serverStatusLines` during UI main missionpack `UI_BuildServerStatus`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.serverStatusLines`.
/// @param force Accepted for compatibility with `UI_BuildServerStatus`; the current implementation does not read it.
function UI_BuildServerStatus(state,force) if len(state.displayServers)==0 then state.serverStatusLines=[];return false end if;index=state.displayServers[clamp(n.trunc32(cvarValue(state,"ui_serverStatusIndex")),0,len(state.displayServers)-1)];server=state.servers[index];state.serverStatusLines=[["Address",server.address,"",""],["Name",server.hostname,"",""],["Map",server.mapname,"",""]];return true end function

/// Updates `state.currentMap` during UI main missionpack `UI_MapCountByGameType`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`.
/// @param singlePlayer Accepted for compatibility with `UI_MapCountByGameType`; the current implementation does not read it.
function UI_MapCountByGameType(state,singlePlayer)
  bit=1<<state.currentGameType;count=0;for each map in state.maps map.active=(map.typeBits&bit)!=0;if map.active then count=count+1 end if end for;if state.currentMap>=count then state.currentMap=0 end if;return count
end function
/// Evaluates UI main missionpack `UI_HeadCountByTeam` and returns `count` according to its guard/selection conditions.
/// @param state Record read through `state.characters`.
function UI_HeadCountByTeam(state) count=0;for each character in state.characters character.active=true;if character.active then count=count+1 end if end for;return count end function
/// Updates `actual[0]` during UI main missionpack `UI_SelectedMap`.
/// @param state Record read through `state.maps`.
/// @param index Value tested by `count==index` before the calculation continues.
/// @param actual Mutable sequence; this routine writes `actual[0]`.
function UI_SelectedMap(state,index,actual) count=0;actual[0]=0;for i=0 to len(state.maps)-1 if state.maps[i].active then if count==index then actual[0]=i;return state.maps[i].mapName end if;count=count+1 end if end for;return "" end function
/// Updates `actual[0]` during UI main missionpack `UI_SelectedHead`.
/// @param state Record read through `state.characters`.
/// @param index Value tested by `count==index` before the calculation continues.
/// @param actual Mutable sequence; this routine writes `actual[0]`.
function UI_SelectedHead(state,index,actual) count=0;actual[0]=0;for i=0 to len(state.characters)-1 if state.characters[i].active then if count==index then actual[0]=i;return state.characters[i].name end if;count=count+1 end if end for;return "" end function
/// Converts an actual map index to its position among active maps, returning zero when no active entry matches.
/// @param state Record read through `state.maps`.
/// @param actual Value used by `for i=0 to len(state.maps)-1 if state.maps[i].active then if i==actual then return count end if`.
function UI_GetIndexFromSelection(state,actual) count=0;for i=0 to len(state.maps)-1 if state.maps[i].active then if i==actual then return count end if;count=count+1 end if end for;return 0 end function
/// Updates `state.refreshActive`, `state.refreshTime` during UI main missionpack `UI_UpdatePendingPings`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.refreshActive`, `state.refreshTime`.
function UI_UpdatePendingPings(state) emit(state,"lan","reset-pings",str(state.currentNetSource),"",[]);state.refreshActive=true;state.refreshTime=state.realtime+1000;return void end function
/// Calls `mq3.client.ui_main_missionpack.UI_HeadCountByTeam`, `mq3.client.ui_main_missionpack.UI_MapCountByGameType` from UI main missionpack `UI_FeederCount`. The final path returns `0`.
/// @param state Record read through `state.q3HeadNames`, `state.movies`, `state.displayServers`, `state.serverStatusLines` and additional values.
/// @param feederID Value used by `if feederID==FEEDER_HEADS then return UI_HeadCountByTeam(state) else if feederID==FEEDER_Q3HEADS then return len(state.q3HeadNames) else if fe...`.
function UI_FeederCount(state,feederID)
  if feederID==FEEDER_HEADS then return UI_HeadCountByTeam(state) else if feederID==FEEDER_Q3HEADS then return len(state.q3HeadNames) else if feederID==FEEDER_CINEMATICS then return len(state.movies) else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then return UI_MapCountByGameType(state,feederID==FEEDER_MAPS) else if feederID==FEEDER_SERVERS then return len(state.displayServers) else if feederID==FEEDER_SERVERSTATUS then return len(state.serverStatusLines) else if feederID==FEEDER_FINDPLAYER then return len(state.foundPlayerNames) else if feederID==FEEDER_PLAYER_LIST then return len(state.playerNames) else if feederID==FEEDER_TEAM_LIST then return len(state.teamNames) else if feederID==FEEDER_MODS then return len(state.mods) else if feederID==FEEDER_DEMOS then return len(state.demos) end if;return 0
end function
/// Calls `mq3.client.ui_main_missionpack.UI_SelectedHead`, `mq3.client.ui_main_missionpack.UI_SelectedMap` from UI main missionpack `UI_FeederItemText`. The final path returns `""`.
/// @param state Record read through `state.q3HeadNames`, `state.displayServers`, `state.servers`, `state.gameTypes` and additional values.
/// @param feederID Value used by `if feederID==FEEDER_HEADS then actual=[0]`.
/// @param index Value tested by `feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadNames)`, `feederID==FEEDER_SERVERS and index>=0 and index<len(state.displayServers)` and additional values before the calculation continues.
/// @param column Value used by `if column==0 then if server.ping<=0 then return server.address end if`.
function UI_FeederItemText(state,feederID,index,column)
  if feederID==FEEDER_HEADS then actual=[0];return UI_SelectedHead(state,index,actual) else if feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadNames) then return state.q3HeadNames[index] else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then actual=[0];return UI_SelectedMap(state,index,actual)
  else if feederID==FEEDER_SERVERS and index>=0 and index<len(state.displayServers) then server=state.servers[state.displayServers[index]];if column==0 then if server.ping<=0 then return server.address end if;return server.hostname else if column==1 then return server.mapname else if column==2 then return str(server.clients)+" ("+str(server.maxClients)+")" else if column==3 then if server.gametype>=0 and server.gametype<len(state.gameTypes) then return state.gameTypes[server.gametype][0] end if;return "Unknown" else if column==4 then if server.ping<=0 then return "..." end if;return str(server.ping) else if column==5 then if server.punkbuster then return "Yes" end if;return "No" end if
  else if feederID==FEEDER_SERVERSTATUS and index>=0 and index<len(state.serverStatusLines) and column>=0 and column<len(state.serverStatusLines[index]) then return state.serverStatusLines[index][column] else if feederID==FEEDER_FINDPLAYER and index>=0 and index<len(state.foundPlayerNames) then return state.foundPlayerNames[index] else if feederID==FEEDER_PLAYER_LIST and index>=0 and index<len(state.playerNames) then return state.playerNames[index] else if feederID==FEEDER_TEAM_LIST and index>=0 and index<len(state.teamNames) then return state.teamNames[index] else if feederID==FEEDER_MODS and index>=0 and index<len(state.mods) then if state.mods[index].description!="" then return state.mods[index].description end if;return state.mods[index].name else if feederID==FEEDER_CINEMATICS and index>=0 and index<len(state.movies) then return state.movies[index] else if feederID==FEEDER_DEMOS and index>=0 and index<len(state.demos) then return state.demos[index] end if;return ""
end function
/// Updates `state.assets` during UI main missionpack `UI_FeederItemImage`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.assets`.
/// @param feederID Value used by `if feederID==FEEDER_HEADS then actual=[0]`.
/// @param index Value tested by `else if feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadIcons)` before the calculation continues.
function UI_FeederItemImage(state,feederID,index)
  if feederID==FEEDER_HEADS then actual=[0];UI_SelectedHead(state,index,actual);if actual[0]<len(state.characters) then character=state.characters[actual[0]];if character.headImage<0 then character.headImage=len(state.assets)+1;state.assets=state.assets+[character.imageName];emit(state,"renderer","register-shader",character.imageName,"",[]) end if;return character.headImage end if else if feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadIcons) then return state.q3HeadIcons[index] else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then actual=[0];UI_SelectedMap(state,index,actual);if actual[0]<len(state.maps) then map=state.maps[actual[0]];if map.levelShot<0 then map.levelShot=len(state.assets)+1;state.assets=state.assets+[map.imageName];emit(state,"renderer","register-shader",map.imageName,"",[]) end if;return map.levelShot end if end if;return 0
end function
/// Updates `state.currentMap`, `state.selectedPlayer` during UI main missionpack `UI_FeederSelection`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`, `state.selectedPlayer`.
/// @param feederID Value used by `if feederID==FEEDER_HEADS then actual=[0]`.
/// @param index Value assigned to `state.selectedPlayer`.
function UI_FeederSelection(state,feederID,index)
  if feederID==FEEDER_HEADS then actual=[0];UI_SelectedHead(state,index,actual);setCvar(state,"model",state.characters[actual[0]].base)
  else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then actual=[0];UI_SelectedMap(state,index,actual);state.currentMap=actual[0];setCvar(state,"ui_mapIndex",index)
  else if feederID==FEEDER_SERVERS then setCvar(state,"ui_serverStatusIndex",index);UI_BuildServerStatus(state,true)
  else if feederID==FEEDER_FINDPLAYER and index<len(state.foundPlayerAddresses) then setCvar(state,"ui_serverStatusAddress",state.foundPlayerAddresses[index])
  else if feederID==FEEDER_PLAYER_LIST or feederID==FEEDER_TEAM_LIST then state.selectedPlayer=index;setCvar(state,"cg_selectedPlayer",index)
  else if feederID==FEEDER_MODS then setCvar(state,"fs_game",state.mods[index].name)
  else if feederID==FEEDER_CINEMATICS then setCvar(state,"ui_movie",state.movies[index]) else if feederID==FEEDER_DEMOS then setCvar(state,"ui_demo",state.demos[index]) end if;return void
end function

/// Updates `state.mods` during UI main missionpack `UI_LoadMods`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.mods`.
/// @param entries Value used by `for each pair in entries if len(state.mods)>=64 then break end if`.
function UI_LoadMods(state,entries) state.mods=[];for each pair in entries if len(state.mods)>=64 then break end if;description="";if len(pair)>1 then description=pair[1] end if;state.mods=state.mods+[ModInfo(pair[0],description)] end for;return len(state.mods) end function
/// Updates `state.teams` during UI main missionpack `UI_LoadTeams`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.teams`.
/// @param entries Value used by `for each row in entries members=[]`.
function UI_LoadTeams(state,entries) state.teams=[];for each row in entries members=[];if len(row)>2 then members=row[2] end if;state.teams=state.teams+[teamInfo(row[0],row[1],members)] end for;return len(state.teams) end function
/// Calls `std.string.toLowerAscii`, `std.string.endsWith`, `std.string.substr` from UI main missionpack `stripExtension`. The final path returns `name`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
/// @param extension Value used by `suffix=strings.toLowerAscii(extension)`.
function stripExtension(name,extension) lower=strings.toLowerAscii(name);suffix=strings.toLowerAscii(extension);if strings.endsWith(lower,suffix) then return strings.substr(name,0,len(bytes(name))-len(bytes(extension))) end if;return name end function
/// Updates `state.movies` during UI main missionpack `UI_LoadMovies`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.movies`.
/// @param files Value used by `for each file in files if len(state.movies)>=64 then break end if`.
function UI_LoadMovies(state,files) state.movies=[];for each file in files if len(state.movies)>=64 then break end if;state.movies=state.movies+[strings.toUpperAscii(stripExtension(file,".roq"))] end for;return len(state.movies) end function
/// Updates `state.demos` during UI main missionpack `UI_LoadDemos`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.demos`.
/// @param files Value used by `for each file in files if len(state.demos)>=128 then break end if`.
/// @param protocol Value used by `extension=".dm_"+str(protocol)`.
function UI_LoadDemos(state,files,protocol) state.demos=[];extension=".dm_"+str(protocol);for each file in files if len(state.demos)>=128 then break end if;state.demos=state.demos+[strings.toUpperAscii(stripExtension(file,extension))] end for;return len(state.demos) end function
/// Updates `state.currentMap` during UI main missionpack `UI_SetNextMap`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`.
/// @param actual Value used by `for i=actual+1 to len(state.maps)-1 if state.maps[i].active then state.currentMap=i`.
/// @param index Value used by `emit(state,"menu","feeder-selection","skirmish","",[FEEDER_MAPS,index+1])`.
function UI_SetNextMap(state,actual,index) for i=actual+1 to len(state.maps)-1 if state.maps[i].active then state.currentMap=i;emit(state,"menu","feeder-selection","skirmish","",[FEEDER_MAPS,index+1]);return true end if end for;return false end function
/// Adapts `mq3.client.ui_main_missionpack.UI_StartSkirmish` to UI main missionpack `UI_StartSinglePlayer`, returning its result for `state, false`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_StartSkirmish`.
function UI_StartSinglePlayer(state) return UI_StartSkirmish(state,false) end function
/// Updates `state.currentMap` during UI main missionpack `UI_StartSkirmish`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`.
/// @param next Value used by `if next then actual=state.currentMap`.
function UI_StartSkirmish(state,next)
  if len(state.maps)==0 then return false end if;if next then actual=state.currentMap;if not UI_SetNextMap(state,actual,UI_GetIndexFromSelection(state,actual)) then UI_GameType_HandleKey(state,0,0,K_MOUSE1,false);state.currentMap=0 end if end if
  map=state.maps[state.currentMap];game=state.gameTypes[clamp(state.currentGameType,0,len(state.gameTypes)-1)][1];setCvar(state,"g_gametype",game);setCvar(state,"ui_scoreMap",map.mapName);setCvar(state,"ui_singlePlayerActive","1");setCvar(state,"cg_cameraOrbit","0");setCvar(state,"cg_thirdPerson","0");setCvar(state,"cg_drawTimer","1");setCvar(state,"g_doWarmup","1");setCvar(state,"g_warmup","15");setCvar(state,"sv_pure","0");setCvar(state,"g_friendlyFire","0");emit(state,"command","append","map",map.mapLoadName,[game]);return true
end function

/// Calls `mq3.client.ui_main_missionpack.cvarString`, `mq3.client.ui_main_missionpack.setCvar` from UI main missionpack `UI_SetCapFragLimits`.
/// @param state Record read through `state.currentGameType`.
/// @param uiVars Value used by `if uiVars then setCvar(state,"ui_fragLimit",frag)`.
function UI_SetCapFragLimits(state,uiVars)
  game=state.currentGameType;frag="0";capture="0";time="0";friendly="0"
  if game==GT_FFA then frag=cvarString(state,"ui_ffa_fraglimit");time=cvarString(state,"ui_ffa_timelimit")
  else if game==GT_TOURNAMENT then frag=cvarString(state,"ui_tourney_fraglimit");time=cvarString(state,"ui_tourney_timelimit")
  else if game==GT_TEAM then frag=cvarString(state,"ui_team_fraglimit");time=cvarString(state,"ui_team_timelimit");friendly=cvarString(state,"ui_team_friendly")
  else if game>=GT_CTF then capture=cvarString(state,"ui_ctf_capturelimit");time=cvarString(state,"ui_ctf_timelimit");friendly=cvarString(state,"ui_ctf_friendly") end if
  if uiVars then setCvar(state,"ui_fragLimit",frag);setCvar(state,"ui_captureLimit",capture) else setCvar(state,"fraglimit",frag);setCvar(state,"capturelimit",capture);setCvar(state,"timelimit",time);setCvar(state,"g_friendlyFire",friendly) end if;return void
end function
/// Calls `std.string.toLowerAscii`, `mq3.client.ui_main_missionpack.setCvar`, `mq3.client.ui_main_missionpack.cvarString` and additional helpers from UI main missionpack `UI_Update`.
/// @param state Record read through `state.currentCrosshair`.
/// @param name Name used to select or register the corresponding UI main missionpack resource.
function UI_Update(state,name)
  lower=strings.toLowerAscii(name)
  if lower=="ui_setname" then setCvar(state,"name",cvarString(state,"ui_Name"))
  else if lower=="ui_setrate" then rate=cvarValue(state,"rate");if rate>=5000 then setCvar(state,"cl_maxpackets","30");setCvar(state,"cl_packetdup","1") else if rate>=4000 then setCvar(state,"cl_maxpackets","15");setCvar(state,"cl_packetdup","2") else setCvar(state,"cl_maxpackets","15");setCvar(state,"cl_packetdup","1") end if
  else if lower=="ui_getname" then setCvar(state,"ui_Name",cvarString(state,"name"))
  else if lower=="ui_setcolor" then setCvar(state,"color1",cvarString(state,"ui_effectsColor"))
  else if lower=="ui_glcustom" then preset=n.trunc32(cvarValue(state,"ui_glCustom"));if preset==0 then setCvar(state,"r_subdivisions","4");setCvar(state,"r_vertexLight","0") else if preset==1 then setCvar(state,"r_subdivisions","12");setCvar(state,"r_vertexLight","1") end if
  else if lower=="ui_mousepitch" then value=cvarValue(state,"m_pitch");if numbers.atoi(cvarString(state,"ui_mousePitch"))==0 and value<0 then value=0.0-value else if numbers.atoi(cvarString(state,"ui_mousePitch"))!=0 and value>0 then value=0.0-value end if;setCvar(state,"m_pitch",value)
  else if lower=="ui_setcrosshair" then setCvar(state,"cg_drawCrosshair",state.currentCrosshair)
  else if lower=="ui_setgametype" then UI_SetCapFragLimits(state,true) end if;return true
end function
/// Updates `state.nextDisplayRefresh`, `state.serverStatusLines`, `state.sortDir` during UI main missionpack `UI_RunMenuScript`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.nextDisplayRefresh`, `state.serverStatusLines`, `state.sortDir`.
/// @param args Sequence read at `args[0]`, `args[1]`.
function UI_RunMenuScript(state,args)
  if len(args)==0 then return false end if;command=strings.toLowerAscii(args[0])
  if command=="startserver" then
    setCvar(state,"cg_thirdPerson","0");setCvar(state,"cg_cameraOrbit","0");setCvar(state,"ui_singlePlayerActive","0");setCvar(state,"dedicated",clamp(n.trunc32(cvarValue(state,"ui_dedicated")),0,2));if len(state.maps)>0 then emit(state,"command","append","map",state.maps[clamp(state.currentMap,0,len(state.maps)-1)].mapLoadName,[]) end if
  else if command=="updatespmenu" then UI_SetCapFragLimits(state,true);UI_MapCountByGameType(state,true);setCvar(state,"ui_mapIndex",UI_GetIndexFromSelection(state,state.currentMap));emit(state,"menu","feeder-selection","skirmish","",[FEEDER_MAPS,n.trunc32(cvarValue(state,"ui_mapIndex"))])
  else if command=="resetdefaults" then emit(state,"command","append","exec","default.cfg",[]);emit(state,"command","append","cvar_restart","",[]);emit(state,"controls","defaults","","",[]);setCvar(state,"com_introPlayed","1");emit(state,"command","append","vid_restart","",[])
  else if command=="getcdkey" then emit(state,"cdkey","read","","",[])
  else if command=="verifycdkey" then key=cvarString(state,"cdkey1")+cvarString(state,"cdkey2")+cvarString(state,"cdkey3")+cvarString(state,"cdkey4");setCvar(state,"cdkey",key);emit(state,"cdkey","verify",key,cvarString(state,"cdkeychecksum"),[])
  else if command=="loadarenas" then emit(state,"gameinfo","load-arenas","","",[]);UI_MapCountByGameType(state,false);emit(state,"menu","feeder-selection","createserver","",[FEEDER_ALLMAPS,0])
  else if command=="savecontrols" then emit(state,"controls","save","","",[true])
  else if command=="loadcontrols" then emit(state,"controls","load","","",[])
  else if command=="clearerror" then setCvar(state,"com_errorMessage","")
  else if command=="loadgameinfo" then emit(state,"gameinfo","load","gameinfo.txt","",[])
  else if command=="resetscores" then emit(state,"scores","clear","","",[])
  else if command=="refreshservers" then UI_StartServerRefresh(state,true);UI_BuildServerDisplayList(state,true)
  else if command=="refreshfilter" then UI_StartServerRefresh(state,false);UI_BuildServerDisplayList(state,true)
  else if command=="runspdemo" then if state.demoAvailable and len(state.maps)>0 then emit(state,"command","append","demo",state.maps[state.currentMap].mapLoadName+"_"+str(state.currentGameType),[]) end if
  else if command=="loaddemos" then emit(state,"filesystem","list","demos","",[])
  else if command=="loadmovies" then emit(state,"filesystem","list","video","roq",[])
  else if command=="loadmods" then emit(state,"filesystem","list","$modlist","",[])
  else if command=="playmovie" then movie=cvarString(state,"ui_movie");if len(args)>1 then movie=args[1] end if;emit(state,"command","append","cinematic",movie+".roq 2",[])
  else if command=="runmod" then name=cvarString(state,"fs_game");if len(args)>1 then name=args[1] end if;setCvar(state,"fs_game",name);emit(state,"command","append","vid_restart","",[])
  else if command=="rundemo" then demo=cvarString(state,"ui_demo");if len(args)>1 then demo=args[1] end if;emit(state,"command","append","demo",demo,[])
  else if command=="quake3" then setCvar(state,"fs_game","");emit(state,"command","append","vid_restart","",[])
  else if command=="closejoin" then if state.refreshActive then UI_StopServerRefresh(state);state.nextDisplayRefresh=0;UI_BuildServerDisplayList(state,true) else emit(state,"menu","close","joinserver","",[]);emit(state,"menu","activate","main","",[]) end if
  else if command=="stoprefresh" then UI_StopServerRefresh(state);state.nextDisplayRefresh=0
  else if command=="updatefilter" then if state.currentNetSource==AS_LOCAL then UI_StartServerRefresh(state,true) end if;UI_BuildServerDisplayList(state,true);if len(state.displayServers)>0 then UI_FeederSelection(state,FEEDER_SERVERS,0) end if
  else if command=="serverstatus" then UI_BuildServerStatus(state,true)
  else if command=="foundplayerserverstatus" then UI_BuildServerStatus(state,true);emit(state,"menu","feeder-selection","","",[FEEDER_FINDPLAYER,0])
  else if command=="findplayer" then UI_BuildFindPlayerList(state,true);state.serverStatusLines=[];emit(state,"menu","feeder-selection","","",[FEEDER_FINDPLAYER,0])
  else if command=="joinserver" then setCvar(state,"cg_thirdPerson","0");setCvar(state,"cg_cameraOrbit","0");setCvar(state,"ui_singlePlayerActive","0");if len(state.displayServers)>0 then emit(state,"command","append","connect",state.servers[state.displayServers[0]].address,[]) end if
  else if command=="foundplayerjoinserver" then setCvar(state,"ui_singlePlayerActive","0");if len(state.foundPlayerAddresses)>0 then emit(state,"command","append","connect",state.foundPlayerAddresses[0],[]) end if
  else if command=="quit" then setCvar(state,"ui_singlePlayerActive","0");emit(state,"command","now","quit","",[])
  else if command=="controls" then _UI_SetActiveMenu(state,4);emit(state,"menu","activate","setup_menu2","",[])
  else if command=="leave" then emit(state,"command","append","disconnect","",[]);emit(state,"menu","activate","main","",[])
  else if command=="serversort" then if len(args)>1 then column=numbers.atoi(args[1]);if column==state.sortKey then state.sortDir=1-state.sortDir end if;UI_ServersSort(state,column,true) end if
  else if command=="nextskirmish" then return UI_StartSkirmish(state,true)
  else if command=="skirmishstart" or command=="startskirmish" then return UI_StartSkirmish(state,false)
  else if command=="closeingame" then _UI_SetActiveMenu(state,0)
  else if command=="votemap" then if len(state.maps)>0 then emit(state,"command","append","callvote map",state.maps[state.currentMap].mapLoadName,[]) end if
  else if command=="votekick" then if len(state.playerNames)>0 then emit(state,"command","append","callvote kick",state.playerNames[clamp(state.selectedPlayer,0,len(state.playerNames)-1)],[]) end if
  else if command=="votegame" then emit(state,"command","append","callvote g_gametype",str(state.currentNetGameType),[])
  else if command=="voteleader" then if len(state.teamNames)>0 then emit(state,"command","append","callteamvote leader",state.teamNames[clamp(state.selectedPlayer,0,len(state.teamNames)-1)],[]) end if
  else if command=="addbot" then if len(state.characters)>0 then emit(state,"command","append","addbot",state.characters[clamp(state.currentBot,0,len(state.characters)-1)].name,[state.currentBotSkill,numbers.atoi(cvarString(state,"ui_redblue"))]) end if
  else if command=="addfavorite" then if state.currentNetSource!=AS_FAVORITES and len(state.displayServers)>0 then state.servers[state.displayServers[0]].favorite=true;emit(state,"lan","add-favorite",state.servers[state.displayServers[0]].address,state.servers[state.displayServers[0]].hostname,[]) end if
  else if command=="deletefavorite" then if state.currentNetSource==AS_FAVORITES and len(state.displayServers)>0 then state.servers[state.displayServers[0]].favorite=false;emit(state,"lan","remove-favorite",state.servers[state.displayServers[0]].address,"",[]) end if
  else if command=="createfavorite" then if state.currentNetSource==AS_FAVORITES then emit(state,"lan","add-favorite",cvarString(state,"ui_favoriteAddress"),cvarString(state,"ui_favoriteName"),[]) end if
  else if command=="orders" or command=="voiceordersteam" or command=="voiceorders" then if len(args)>1 then emit(state,"command","append",command,args[1],[state.selectedPlayer]) end if;_UI_SetActiveMenu(state,0)
  else if command=="glcustom" then setCvar(state,"ui_glCustom","4")
  else if command=="update" then if len(args)>1 then UI_Update(state,args[1]) end if
  else if command=="setpbclstatus" then if len(args)>1 then emit(state,"punkbuster","set-client-status","","",[numbers.atoi(args[1])]) end if
  else return false end if;return true
end function

/// Evaluates UI main missionpack `parseOpen` and returns `-1`, `start+1` according to its guard/selection conditions.
/// @param tokens Sequence read at `tokens[start]`.
/// @param start Value tested by `start>=len(tokens) or tokens[start]!="{"` before the calculation continues.
function parseOpen(tokens,start) if start>=len(tokens) or tokens[start]!="{" then return -1 end if;return start+1 end function
/// Updates `state.teams` during UI main missionpack `Team_Parse`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.teams`.
/// @param tokens Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2+i]`.
/// @param start Value used by `at=parseOpen(tokens,start)`.
function Team_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if
  while at<len(tokens) and tokens[at]!="}"
    if tokens[at]!="{" or at+8>=len(tokens) then return ParseResult(false,at) end if;at=at+1;name=tokens[at];image=tokens[at+1];members=[];for i=0 to 4 members=members+[tokens[at+2+i]] end for;at=at+7;if at>=len(tokens) or tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1;state.teams=state.teams+[TeamInfo(name,image,members,-1)];emit(state,"renderer","register-team",image,"",[])
  end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
/// Updates `state.characters` during UI main missionpack `Character_Parse`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.characters`.
/// @param tokens Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`.
/// @param start Value used by `at=parseOpen(tokens,start)`.
function Character_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if
  while at<len(tokens) and tokens[at]!="}" if tokens[at]!="{" or at+3>=len(tokens) then return ParseResult(false,at) end if;name=tokens[at+1];kind=strings.toLowerAscii(tokens[at+2]);base=tokens[at+2];if kind=="female" then base="Janet" else if kind=="male" then base="James" end if;state.characters=state.characters+[CharacterInfo(name,base,"models/players/heads/"+name+"/icon_default.tga",true,-1)];at=at+3;if tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1 end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
/// Updates `state.aliases` during UI main missionpack `Alias_Parse`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.aliases`.
/// @param tokens Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`, `tokens[at+3]`.
/// @param start Value used by `at=parseOpen(tokens,start)`.
function Alias_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if
  while at<len(tokens) and tokens[at]!="}" if tokens[at]!="{" or at+4>=len(tokens) then return ParseResult(false,at) end if;state.aliases=state.aliases+[AliasInfo(tokens[at+1],tokens[at+2],tokens[at+3])];at=at+4;if tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1 end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
/// Updates `state.joinGameTypes`, `state.gameTypes` during UI main missionpack `GameType_Parse`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.joinGameTypes`, `state.gameTypes`.
/// @param tokens Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`.
/// @param start Value used by `at=parseOpen(tokens,start)`.
/// @param join Value used by `if join then state.joinGameTypes=rows else state.gameTypes=rows end if`.
function GameType_Parse(state,tokens,start,join)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if;rows=[]
  while at<len(tokens) and tokens[at]!="}" if tokens[at]!="{" or at+3>=len(tokens) then return ParseResult(false,at) end if;rows=rows+[[tokens[at+1],numbers.atoi(tokens[at+2])]];at=at+3;if tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1 end while;if join then state.joinGameTypes=rows else state.gameTypes=rows end if;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
/// Updates `state.maps` during UI main missionpack `MapList_Parse`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.maps`.
/// @param tokens Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`, `tokens[at+3]`.
/// @param start Value used by `at=parseOpen(tokens,start)`.
function MapList_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if;state.maps=[]
  while at<len(tokens) and tokens[at]!="}"
    if tokens[at]!="{" or at+5>=len(tokens) then return ParseResult(false,at) end if;at=at+1;name=tokens[at];load=tokens[at+1];members=numbers.atoi(tokens[at+2]);opponent=tokens[at+3];at=at+4;map=mapInfo(load,name,0);map.teamMembers=members;map.opponentName=opponent
    while at<len(tokens) and tokens[at]!="}" game=numbers.atoi(tokens[at]);at=at+1;if game<0 or game>=8 or at>=len(tokens) then return ParseResult(false,at) end if;map.typeBits=map.typeBits|(1<<game);map.timeToBeat[game]=numbers.atoi(tokens[at]);at=at+1 end while;if at>=len(tokens) then return ParseResult(false,at) end if;at=at+1;state.maps=state.maps+[map];emit(state,"renderer","register-shader",load+"_small","",[])
  end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
/// Calls `decode`, `slice` from UI main missionpack `tokenize`. The final path returns `result`.
/// @param text Text consumed or emitted by `tokenize` in the UI main missionpack path.
function tokenize(text)
  data=bytes(text);result=[];at=0
  while at<len(data)
    while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if
    if data[at]==47 and at+1<len(data) and data[at+1]==47 then while at<len(data) and data[at]!=10 at=at+1 end while;continue end if
    if data[at]==123 or data[at]==125 then result=result+[decode(slice(data,at,1))];at=at+1;continue end if
    if data[at]==34 then at=at+1;start=at;while at<len(data) and data[at]!=34 at=at+1 end while;result=result+[decode(slice(data,start,at-start))];if at<len(data) then at=at+1 end if;continue end if
    start=at;while at<len(data) and data[at]>32 and data[at]!=123 and data[at]!=125 at=at+1 end while;result=result+[decode(slice(data,start,at-start))]
  end while;return result
end function
/// Calls `mq3.client.ui_main_missionpack.tokenize`, `mq3.client.ui_main_missionpack.ParseResult`, `std.string.toLowerAscii` and additional helpers from UI main missionpack `UI_ParseTeamInfo`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_ParseTeamInfo`.
/// @param teamFile Value used by `emit(state,"filesystem","parse-team",teamFile,"",[])`.
/// @param text Text consumed or emitted by `UI_ParseTeamInfo` in the UI main missionpack path.
function UI_ParseTeamInfo(state,teamFile,text) tokens=tokenize(text);at=0;parsed=ParseResult(false,0);while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="teams" then parsed=Team_Parse(state,tokens,at) else if key=="characters" then parsed=Character_Parse(state,tokens,at) else if key=="aliases" then parsed=Alias_Parse(state,tokens,at) else continue end if;if not parsed.ok then return false end if;at=parsed.next end while;emit(state,"filesystem","parse-team",teamFile,"",[]);return true end function
/// Calls `mq3.client.ui_main_missionpack.tokenize`, `mq3.client.ui_main_missionpack.ParseResult`, `std.string.toLowerAscii` and additional helpers from UI main missionpack `UI_ParseGameInfo`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_ParseGameInfo`.
/// @param gameFile Value used by `emit(state,"filesystem","parse-game",gameFile,"",[])`.
/// @param text Text consumed or emitted by `UI_ParseGameInfo` in the UI main missionpack path.
function UI_ParseGameInfo(state,gameFile,text) tokens=tokenize(text);at=0;parsed=ParseResult(false,0);while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="gametypes" then parsed=GameType_Parse(state,tokens,at,false) else if key=="joingametypes" then parsed=GameType_Parse(state,tokens,at,true) else if key=="maps" then parsed=MapList_Parse(state,tokens,at) else continue end if;if not parsed.ok then return false end if;at=parsed.next end while;emit(state,"filesystem","parse-game",gameFile,"",[]);return true end function

/// Calls `mq3.compat.textnumbers.atoi`, `mq3.client.ui_main_missionpack.cvarString` from UI main missionpack `UI_GetTeamColor`. The final path returns `[0.0,0.0,1.0,1.0]`.
/// @param state Shared UI main missionpack state passed to the helper calls in `UI_GetTeamColor`.
function UI_GetTeamColor(state) if numbers.atoi(cvarString(state,"ui_redblue"))==0 then return [1.0,0.0,0.0,1.0] end if;return [0.0,0.0,1.0,1.0] end function
/// Calls `std.string.toLowerAscii`, `std.string.startsWith`, `std.string.endsWith` from UI main missionpack `UI_hasSkinForBase`.
/// @param state Record read through `state.q3HeadNames`.
/// @param base Value used by `wanted=strings.toLowerAscii(base)`.
/// @param team Value used by `suffix="/"+strings.toLowerAscii(team)`.
function UI_hasSkinForBase(state,base,team) wanted=strings.toLowerAscii(base);suffix="/"+strings.toLowerAscii(team);for each name in state.q3HeadNames lower=strings.toLowerAscii(name);if strings.startsWith(lower,wanted) and strings.endsWith(lower,suffix) then return true end if end for;return false end function
/// Updates `state.q3HeadNames`, `state.q3HeadIcons`, `state.assets` during UI main missionpack `UI_BuildQ3Model_List`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.q3HeadNames`, `state.q3HeadIcons`, `state.assets`.
/// @param icons Value used by `for each icon in icons lower=strings.toLowerAscii(icon)`.
function UI_BuildQ3Model_List(state,icons) state.q3HeadNames=[];state.q3HeadIcons=[];for each icon in icons lower=strings.toLowerAscii(icon);if strings.endsWith(lower,"icon_default.tga") or strings.indexOf(lower,"icon_",0)>=0 then state.q3HeadNames=state.q3HeadNames+[icon];state.q3HeadIcons=state.q3HeadIcons+[len(state.assets)+1];state.assets=state.assets+[icon] end if end for;return len(state.q3HeadNames) end function
/// Calls `std.string.toLowerAscii` from UI main missionpack `UI_EnglishMapName`. The final path returns `map`.
/// @param state Record read through `state.maps`.
/// @param map map record passed to the UI main missionpack helper calls.
function UI_EnglishMapName(state,map) for each value in state.maps if strings.toLowerAscii(value.mapLoadName)==strings.toLowerAscii(map) then return value.mapName end if end for;return map end function
/// Adapts `mq3.client.ui_main_missionpack.UI_LoadMenus` to UI main missionpack `UI_LoadNonIngame`, returning its result for `state, "ui/menus.txt", true, files`.
/// @param state Argument 1 of `mq3.client.ui_main_missionpack.UI_LoadMenus`.
/// @param files Argument 4 of `mq3.client.ui_main_missionpack.UI_LoadMenus`.
function UI_LoadNonIngame(state,files) return UI_LoadMenus(state,"ui/menus.txt",true,files) end function
/// Updates `state.paused` during UI main missionpack `UI_Pause`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.paused`.
/// @param value Value assigned to `state.paused`.
function UI_Pause(state,value) state.paused=value;setCvar(state,"cl_paused",value);setCvar(state,"sv_paused",value);return void end function

/// Calls `mq3.compat.numeric.quotient`, `mq3.client.ui_main_missionpack.twoDigits`, `mq3.client.ui_main_missionpack.signedQuotient` and additional helpers from UI main missionpack `UI_ReadableSize`. The final path returns `str(value)+" bytes"`.
/// @param value Value tested by `value>1073741824`, `value>1048576` and additional values before the calculation continues.
function UI_ReadableSize(value)
  if value>1073741824 then return str(n.quotient(value,1073741824))+"."+twoDigits(signedQuotient(n.mul32(value%1073741824,100),1073741824))+" GB"
  else if value>1048576 then return str(n.quotient(value,1048576))+"."+twoDigits(signedQuotient(n.mul32(value%1048576,100),1048576))+" MB"
  else if value>1024 then return str(n.quotient(value,1024))+" KB" end if;return str(value)+" bytes"
end function
/// Evaluates UI main missionpack `twoDigits` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.
/// @param value Value tested by `value<10 and value>=0` before the calculation continues.
function twoDigits(value) if value<10 and value>=0 then return "0"+str(value) end if;return str(value) end function
/// Calls `mq3.compat.numeric.quotient` from UI main missionpack `signedQuotient`. The final path returns `n.quotient(value,divisor)`.
/// @param value Value tested by `value<0` before the calculation continues.
/// @param divisor Value used by `if value<0 then return 0-n.quotient(0-value,divisor) end if`.
function signedQuotient(value,divisor) if value<0 then return 0-n.quotient(0-value,divisor) end if;return n.quotient(value,divisor) end function
/// Formats a millisecond duration as hours, minutes and seconds for the Missionpack UI.
/// @param time Value used by `seconds=n.quotient(time,1000)`.
function UI_PrintTime(time) seconds=n.quotient(time,1000);if seconds>3600 then return str(n.quotient(seconds,3600))+" hr "+str(n.quotient(seconds%3600,60))+" min" else if seconds>60 then return str(n.quotient(seconds,60))+" min "+str(seconds%60)+" sec" end if;return str(seconds)+" sec" end function
/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.compat.numeric.quotient` and additional helpers from UI main missionpack `UI_DisplayDownloadInfo`. The final path returns `[rate,remaining,text]`.
/// @param state Record read through `state.realtime`.
/// @param downloadName Value used by `text=downloadName+" "+UI_ReadableSize(count)+" of "+UI_ReadableSize(size)`.
/// @param centerPoint Value used by `emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining])`.
/// @param yStart Value used by `emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining])`.
/// @param scale Value used by `emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining])`.
function UI_DisplayDownloadInfo(state,downloadName,centerPoint,yStart,scale)
  size=n.trunc32(cvarValue(state,"cl_downloadSize"));count=n.trunc32(cvarValue(state,"cl_downloadCount"));start=n.trunc32(cvarValue(state,"cl_downloadTime"));elapsed=state.realtime-start;rate=0;if elapsed>0 then rate=n.quotient(count*1000,elapsed) end if;remaining=0;if rate>0 and size>count then remaining=n.quotient((size-count)*1000,rate) end if
  text=downloadName+" "+UI_ReadableSize(count)+" of "+UI_ReadableSize(size);emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining]);return [rate,remaining,text]
end function
/// Updates `state.lastConnState`, `state.lastLoadingText` during UI main missionpack `UI_DrawConnectScreen`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.lastConnState`, `state.lastLoadingText`.
/// @param overlay Value used by `action=emit(state,"renderer","connect-screen",connection,loading,[overlay])`.
function UI_DrawConnectScreen(state,overlay)
  connection=cvarString(state,"ui_connectState");loading=cvarString(state,"ui_loadingText");if connection!=str(state.lastConnState) or loading!=state.lastLoadingText then state.lastConnState=numbers.atoi(connection);state.lastLoadingText=loading end if
  action=emit(state,"renderer","connect-screen",connection,loading,[overlay]);download=cvarString(state,"cl_downloadName");if download!="" then UI_DisplayDownloadInfo(state,download,320.0,130.0,0.5) end if;return action
end function

/// Updates `state.refreshActive` during UI main missionpack `UI_StopServerRefresh`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.refreshActive`.
function UI_StopServerRefresh(state)
  if not state.refreshActive then return false end if;state.refreshActive=false;emit(state,"lan","refresh-stop",str(state.currentNetSource),"",[len(state.displayServers),state.numPlayersOnServers]);return true
end function
/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue` from UI main missionpack `ArenaServers_MaxPing`. The final path returns `value`.
/// @param state Shared UI main missionpack state passed to the helper calls in `ArenaServers_MaxPing`.
function ArenaServers_MaxPing(state) value=n.trunc32(cvarValue(state,"cl_maxPing"));if value<100 then value=100 end if;return value end function
/// Updates `state.refreshTime` during UI main missionpack `UI_DoServerRefresh`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.refreshTime`.
function UI_DoServerRefresh(state)
  if not state.refreshActive then return false end if;if state.realtime<state.refreshTime then return false end if;UI_BuildServerDisplayList(state,false);pending=false;for each server in state.servers if server.visible and server.ping<=0 then pending=true end if end for;if pending then state.refreshTime=state.realtime+1000;emit(state,"lan","update-pings",str(state.currentNetSource),"",[]) else UI_BuildServerDisplayList(state,true);UI_StopServerRefresh(state) end if;return true
end function
/// Updates `state.serverRefreshDate`, `state.refreshActive`, `state.nextDisplayRefresh`, `state.displayServers` and additional values during UI main missionpack `UI_StartServerRefresh`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.serverRefreshDate`, `state.refreshActive`, `state.nextDisplayRefresh`, `state.displayServers` and additional values.
/// @param full Value used by `if not full then UI_UpdatePendingPings(state)`.
function UI_StartServerRefresh(state,full)
  state.serverRefreshDate="now";setCvar(state,"ui_lastServerRefresh_"+str(state.currentNetSource),state.serverRefreshDate)
  if not full then UI_UpdatePendingPings(state);return true end if;state.refreshActive=true;state.nextDisplayRefresh=state.realtime+1000;state.displayServers=[];state.numPlayersOnServers=0;for each server in state.servers server.visible=true end for;emit(state,"lan","mark-visible",str(state.currentNetSource),"",[-1,true]);emit(state,"lan","reset-pings",str(state.currentNetSource),"",[])
  if state.currentNetSource==AS_LOCAL then emit(state,"command","now","localservers","",[]);state.refreshTime=state.realtime+1000 else state.refreshTime=state.realtime+5000;if state.currentNetSource==AS_GLOBAL or state.currentNetSource==AS_MPLAYER then emit(state,"command","now","globalservers",cvarString(state,"protocol"),[state.currentNetSource-AS_GLOBAL]) end if end if;return true
end function

/// Evaluates UI main missionpack `defaultCvars` and returns `rows` according to its guard/selection conditions.
function defaultCvars()
  rows=[["ui_ffa_fraglimit","20"],["ui_ffa_timelimit","0"],["ui_tourney_fraglimit","0"],["ui_tourney_timelimit","15"],["ui_team_fraglimit","0"],["ui_team_timelimit","20"],["ui_team_friendly","1"],["ui_ctf_capturelimit","8"],["ui_ctf_timelimit","30"],["ui_ctf_friendly","0"],["g_arenasFile",""],["g_botsFile",""],["g_spScores1",""],["g_spScores2",""],["g_spScores3",""],["g_spScores4",""],["g_spScores5",""],["g_spAwards",""],["g_spVideos",""],["g_spSkill","2"],["ui_spSelection",""]]
  rows=rows+[["ui_browserMaster","0"],["ui_browserGameType","0"],["ui_browserSortKey","4"],["ui_browserShowFull","1"],["ui_browserShowEmpty","1"],["cg_brassTime","2500"],["cg_drawCrosshair","4"],["cg_drawCrosshairNames","1"],["cg_marks","1"]];for i=1 to 16 rows=rows+[["server"+str(i),""]] end for
  rows=rows+[["ui_cdkeychecked","0"],["ui_new","0"],["ui_debug","0"],["ui_initialized","0"],["ui_teamName","Pagans"],["ui_opponentName","Stroggs"],["ui_redteam","Pagans"],["ui_blueteam","Stroggs"],["ui_dedicated","0"],["ui_gametype","3"],["ui_joinGametype","0"],["ui_netGametype","3"],["ui_actualNetGametype","3"]]
  for each prefix in ["ui_redteam","ui_blueteam"] for i=1 to 5 rows=rows+[[prefix+str(i),"0"]] end for end for
  rows=rows+[["ui_netSource","0"],["ui_menuFiles","ui/menus.txt"],["ui_currentTier","0"],["ui_currentMap","0"],["ui_currentNetMap","0"],["ui_mapIndex","0"],["ui_currentOpponent","0"],["cg_selectedPlayer","0"],["cg_selectedPlayerName",""],["ui_lastServerRefresh_0",""],["ui_lastServerRefresh_1",""],["ui_lastServerRefresh_2",""],["ui_lastServerRefresh_3",""],["ui_singlePlayerActive","0"]]
  rows=rows+[["ui_scoreAccuracy","0"],["ui_scoreImpressives","0"],["ui_scoreExcellents","0"],["ui_scoreCaptures","0"],["ui_scoreDefends","0"],["ui_scoreAssists","0"],["ui_scoreGauntlets","0"],["ui_scoreScore","0"],["ui_scorePerfect","0"],["ui_scoreTeam","0 to 0"],["ui_scoreBase","0"],["ui_scoreTime","00:00"],["ui_scoreTimeBonus","0"],["ui_scoreSkillBonus","0"],["ui_scoreShutoutBonus","0"]]
  rows=rows+[["ui_fragLimit","10"],["ui_captureLimit","5"],["ui_smallFont","0.25"],["ui_bigFont","0.4"],["ui_findPlayer","Sarge"],["ui_q3model","0"],["cg_hudFiles","ui/hud.txt"],["ui_recordSPDemo","0"],["ui_teamArenaFirstRun","0"],["g_warmup","20"],["capturelimit","8"],["ui_serverStatusTimeOut","7000"]];return rows
end function
/// Updates `state.cvars` during UI main missionpack `UI_RegisterCvars`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.cvars`.
function UI_RegisterCvars(state) state.cvars=defaultCvars();for each row in state.cvars emit(state,"cvar","register",row[0],row[1],[]) end for;return len(state.cvars) end function
/// Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `UI_UpdateCvars`. The final path returns `len(state.cvars)`.
/// @param state Record read through `state.cvars`.
function UI_UpdateCvars(state) for each row in state.cvars emit(state,"cvar","update",row[0],row[1],[]) end for;return len(state.cvars) end function

/// Updates `state.initialized`, `state.shutdown`, `state.ingameLoad`, `state.realtime` and additional values during UI main missionpack `_UI_Init`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.initialized`, `state.shutdown`, `state.ingameLoad`, `state.realtime` and additional values.
/// @param inGameLoad Value assigned to `state.ingameLoad`.
/// @param files File-name sequence by `_UI_Init`.
function _UI_Init(state,inGameLoad,files)
  state.initialized=true;state.shutdown=false;state.ingameLoad=inGameLoad;state.realtime=0;state.frametime=0;UI_RegisterCvars(state);AssetCache(state);if len(files)>0 then UI_Load(state,files) end if;setCvar(state,"ui_initialized","1");emit(state,"ui","init","_UI_Init","",[inGameLoad]);return true
end function
/// Updates `state.shutdown`, `state.initialized` during UI main missionpack `_UI_Shutdown`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.shutdown`, `state.initialized`.
function _UI_Shutdown(state) state.shutdown=true;state.initialized=false;emit(state,"ui","shutdown","_UI_Shutdown","",[]);return void end function
/// Calls `mq3.client.ui_main_missionpack.emit`, `mq3.client.ui_main_missionpack._UI_SetActiveMenu` from UI main missionpack `_UI_KeyEvent`.
/// @param state Record read through `state.activeMenu`.
/// @param key Key or control identifier used to select the corresponding UI main missionpack entry.
/// @param down Whether this event presses the key/button; false represents its release.
function _UI_KeyEvent(state,key,down) if not down then return false end if;emit(state,"input","key",str(key),"",[down]);if key==27 and state.activeMenu!=0 then _UI_SetActiveMenu(state,0) end if;return true end function
/// Updates `state.cursorx`, `state.cursory` during UI main missionpack `_UI_MouseEvent`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.cursorx`, `state.cursory`.
/// @param dx Value used by `state.cursorx=clamp(state.cursorx+dx,0.0,640.0)`.
/// @param dy Value used by `state.cursory=clamp(state.cursory+dy,0.0,480.0)`.
function _UI_MouseEvent(state,dx,dy) state.cursorx=clamp(state.cursorx+dx,0.0,640.0);state.cursory=clamp(state.cursory+dy,0.0,480.0);emit(state,"input","mouse","","",[dx,dy,state.cursorx,state.cursory]);return void end function
/// Updates `state.frametime`, `state.realtime` during UI main missionpack `_UI_Refresh`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.frametime`, `state.realtime`.
/// @param realtime Current client real-time clock in milliseconds.
function _UI_Refresh(state,realtime) state.frametime=realtime-state.realtime;state.realtime=realtime;UI_UpdateCvars(state);if state.refreshActive then UI_DoServerRefresh(state) end if;emit(state,"renderer","refresh","","",[realtime,state.frametime]);return void end function
/// Updates `state.activeMenu`, `state.fullscreen`, `state.keyCatcher` during UI main missionpack `_UI_SetActiveMenu`.
/// @param state Mutable UI main missionpack record/storage; this routine assigns `state.activeMenu`, `state.fullscreen`, `state.keyCatcher`.
/// @param menu Value assigned to `state.activeMenu`.
function _UI_SetActiveMenu(state,menu)
  state.activeMenu=menu;if menu==0 then state.fullscreen=false;state.keyCatcher=0;UI_Pause(state,false);emit(state,"menu","close-all","","",[])
  else state.fullscreen=true;state.keyCatcher=2;if menu==1 then emit(state,"menu","activate","main","",[]) else if menu==2 then emit(state,"menu","activate","needcd","",[]) else if menu==3 then emit(state,"menu","activate","badcd","",[]) else if menu==4 then UI_Pause(state,true);emit(state,"menu","activate","ingame","",[]) else if menu==5 then emit(state,"menu","activate","team","",[]) else if menu==6 then emit(state,"menu","activate","postgame","",[]) end if end if;return void
end function
/// Reads `state.fullscreen` for UI main missionpack `_UI_IsFullscreen`.
/// @param state Record read through `state.fullscreen`.
function _UI_IsFullscreen(state) return state.fullscreen end function
/// Calls `std.string.toLowerAscii`, `mq3.client.ui_main_missionpack.UI_Report`, `mq3.client.ui_main_missionpack.emit` and additional helpers from UI main missionpack `consoleCommand`.
/// @param state Shared UI main missionpack state passed to the helper calls in `consoleCommand`.
/// @param realtime Accepted for compatibility with `consoleCommand`; the current implementation does not read it.
/// @param command Value used by `lower=strings.toLowerAscii(command)`.
function consoleCommand(state,realtime,command) lower=strings.toLowerAscii(command);if lower=="ui_report" then UI_Report(state);return true else if lower=="ui_load" then emit(state,"ui","load","","",[]);return true else if lower=="ui_cache" then AssetCache(state);return true else if lower=="ui_teamorders" or lower=="ui_cdkey" then return true end if;return false end function
/// Calls `mq3.client.ui_main_missionpack.DispatchResult`, `mq3.client.ui_main_missionpack._UI_Init`, `mq3.client.ui_main_missionpack._UI_Shutdown` and additional helpers from UI main missionpack `vmMain`. The final path returns `DispatchResult(-1,void)`.
/// @param state Record read through `state.actions`.
/// @param command Value used by `if command==UI_GETAPIVERSION then return DispatchResult(UI_API_VERSION,void)`.
/// @param args Sequence read at `args[0]`, `args[1]`.
function vmMain(state,command,args)
  if command==UI_GETAPIVERSION then return DispatchResult(UI_API_VERSION,void)
  else if command==UI_INIT then _UI_Init(state,args[0],[]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_SHUTDOWN then _UI_Shutdown(state);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_KEY_EVENT then _UI_KeyEvent(state,args[0],args[1]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_MOUSE_EVENT then _UI_MouseEvent(state,args[0],args[1]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_REFRESH then _UI_Refresh(state,args[0]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_IS_FULLSCREEN then return DispatchResult(_UI_IsFullscreen(state),void)
  else if command==UI_SET_ACTIVE_MENU then _UI_SetActiveMenu(state,args[0]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_CONSOLE_COMMAND then return DispatchResult(consoleCommand(state,args[0],args[1]),void)
  else if command==UI_DRAW_CONNECT_SCREEN then UI_DrawConnectScreen(state,args[0]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_HASUNIQUECDKEY then return DispatchResult(true,void) end if;return DispatchResult(-1,void)
end function
