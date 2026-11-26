// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed ABI facade for code/client/client.h.
package mq3.client.client_abi
/// Connection-handshake retransmission interval in milliseconds.
const RETRANSMIT_TIMEOUT=3000
/// Capacity limit for the parse entities collection or bounded storage used by this client module.
const MAX_PARSE_ENTITIES=2048
/// Stores client ABI cl snapshot record, including `valid`, `snapFlags`, `serverTime`, `messageNum`, `deltaNum`, `ping` and additional values.
struct ClSnapshot
  /// True when the stored data passed the validation required by its consumer.
  valid
  /// Snapshot flags describing rate delay and dropped-command conditions.
  snapFlags
  /// Server simulation timestamp in milliseconds retained with the client connection snapshot.
  serverTime
  /// Incoming network-message sequence number associated with the snapshot.
  messageNum
  /// Sequence number of the earlier message used as this snapshot's delta base.
  deltaNum
  /// Packet-derived latency in milliseconds stored with the client connection snapshot.
  ping
  /// Portal-area visibility bitset associated with the current snapshot or rendered view.
  areamask
  /// Next user-command sequence number expected by the server for this snapshot.
  cmdNum
  /// Complete player-state record carried by the snapshot.
  ps
  /// Number of entity-state entries represented by the snapshot or scene.
  numEntities
  /// Absolute position in the parsed-entity ring at which this snapshot's entities begin.
  parseEntitiesNum
  /// Server-command sequence that must be executed before presenting this snapshot.
  serverCommandNum
end struct
/// Stores client ABI out packet record, including `p_cmdNumber`, `p_serverTime`, `p_realtime`.
struct OutPacket
  /// Client user-command sequence number when the outgoing packet was sent.
  p_cmdNumber
  /// Server time in the user command carried by the outgoing packet.
  p_serverTime
  /// Client realtime timestamp when the outgoing packet was sent.
  p_realtime
end struct
/// Stores client ABI client active record, including `timeoutcount`, `snap`, `serverTime`, `oldServerTime`, `oldFrameServerTime`, `serverTimeDelta` and additional values.
struct ClientActive
  /// Consecutive frames that have met the timeout condition before a disconnect is accepted.
  timeoutcount
  /// Current snapshot used as the lower endpoint of client interpolation.
  snap
  /// Current synchronized presentation time in milliseconds retained for the active client game.
  serverTime
  /// Previous client estimate of server time, retained to prevent time from moving backward.
  oldServerTime
  /// Server time from the preceding rendered frame, used to recognize restart discontinuities.
  oldFrameServerTime
  /// Offset added to client realtime to estimate current server time.
  serverTimeDelta
  /// True when a CGame frame had to extrapolate beyond the newest available snapshot.
  extrapolatedSnapshot
  /// True after parsing a new valid snapshot that has not yet been consumed.
  newSnapshots
  /// Server configuration strings and associated game-state storage.
  gameState
  /// Map name parsed from server information or selected by the client UI.
  mapname
  /// Absolute position in the parsed-entity ring at which this snapshot's entities begin.
  parseEntitiesNum
  /// Buffered horizontal mouse movement awaiting user-command generation.
  mouseDx
  /// Buffered vertical mouse movement awaiting user-command generation.
  mouseDy
  /// Compatibility member corresponding to native `clientActive_t.mouseIndex`; the original declaration
  /// is `int mouseIndex`.
  mouseIndex
  /// Latest sampled joystick-axis values used by user-command generation.
  joystickAxis
  /// Weapon-selection value supplied by CGame for inclusion in outgoing user commands.
  cgameUserCmdValue
  /// Compatibility member corresponding to native `clientActive_t.cgameSensitivity`; the original
  /// declaration is `float cgameSensitivity`.
  cgameSensitivity
  /// Ring of recent user commands retained so outgoing packets can resend earlier input.
  cmds
  /// Monotonically advancing user-command sequence number for the client.
  cmdNumber
  /// History of outgoing packet metadata used to estimate acknowledgement timing.
  outPackets
  /// Locally accumulated view angles used when constructing outgoing user commands.
  viewangles
  /// Server-instance identifier included in client messages to reject stale connections.
  serverId
  /// Snapshot history indexed by sequence number for interpolation and delta decoding.
  snapshots
  /// Baseline entity states used when delta decoding has no previous snapshot state.
  entityBaselines
  /// Parsed entity-state ring used to reconstruct snapshots from their absolute entity positions.
  parseEntities
end struct
/// Stores client ABI client connection record, including `clientNum`, `lastPacketSentTime`, `lastPacketTime`, `serverAddress`, `connectTime`, `connectPacketCount` and additional values.
struct ClientConnection
  /// Server-assigned local client slot retained for the current connection.
  clientNum
  /// Client timestamp of the latest outgoing packet, used to schedule retransmission.
  lastPacketSentTime
  /// Client timestamp of the latest received server packet, used to detect timeouts.
  lastPacketTime
  /// Network endpoint of the server selected for this connection.
  serverAddress
  /// Timestamp of the most recent connection attempt or handshake retransmission.
  connectTime
  /// Number of connection-handshake packets sent, also used by progress displays.
  connectPacketCount
  /// Status or error text received during the server connection handshake.
  serverMessage
  /// Server-issued challenge token used to validate the connection handshake.
  challenge
  /// Server-provided seed used when calculating the client's content checksums.
  checksumFeed
  /// Sequence number assigned to the latest queued reliable command.
  reliableSequence
  /// Highest reliable-command sequence acknowledged as executed by the peer.
  reliableAcknowledge
  /// Ring of reliable command strings awaiting acknowledgement or execution.
  reliableCommands
  /// Highest server network-message sequence observed by the client.
  serverMessageSequence
  /// Latest reliable server-command sequence received on this client connection.
  serverCommandSequence
  /// Highest server-command sequence already retrieved or executed by the client.
  lastExecutedServerCommand
  /// Reliable server commands retained for ordered execution by the client.
  serverCommands
  /// Compatibility member corresponding to native `clientConnection_t.download`; the original
  /// declaration is `fileHandle_t download`.
  download
  /// Compatibility member corresponding to native `clientConnection_t.downloadTempName`; the original
  /// declaration is `char downloadTempName[MAX_OSPATH]`.
  downloadTempName
  /// Compatibility member corresponding to native `clientConnection_t.downloadName`; the original
  /// declaration is `char downloadName[MAX_OSPATH]`.
  downloadName
  /// Compatibility member corresponding to native `clientConnection_t.downloadNumber`; the original
  /// declaration is `int downloadNumber`.
  downloadNumber
  /// Download-block number the client is currently waiting to receive.
  downloadBlock
  /// Number of bytes accumulated for the active download.
  downloadCount
  /// Expected total size in bytes of the active download.
  downloadSize
  /// Package names queued for download from the connected server.
  downloadList
  /// True when a completed package download requires a filesystem restart.
  downloadRestart
  /// Virtual demo filename associated with the current recording or playback operation.
  demoName
  /// Compatibility member corresponding to native `clientConnection_t.spDemoRecording`; the original
  /// declaration is `qboolean spDemoRecording`.
  spDemoRecording
  /// Compatibility member corresponding to native `clientConnection_t.demorecording`; the original
  /// declaration is `qboolean demorecording`.
  demorecording
  /// Compatibility member corresponding to native `clientConnection_t.demoplaying`; the original
  /// declaration is `qboolean demoplaying`.
  demoplaying
  /// True until a full snapshot permits demo recording to begin safely.
  demowaiting
  /// Compatibility member corresponding to native `clientConnection_t.firstDemoFrameSkipped`; the
  /// original declaration is `qboolean firstDemoFrameSkipped`.
  firstDemoFrameSkipped
  /// Compatibility member corresponding to native `clientConnection_t.demofile`; the original
  /// declaration is `fileHandle_t demofile`.
  demofile
  /// Number of frames rendered during the timed-demo measurement.
  timeDemoFrames
  /// Client realtime timestamp at the beginning of the timed-demo measurement.
  timeDemoStart
  /// Base server time from which fixed-step timed-demo frames are calculated.
  timeDemoBaseTime
  /// Compatibility member corresponding to native `clientConnection_t.netchan`; the original
  /// declaration is `netchan_t netchan`.
  netchan
end struct
/// Stores client ABI ping record, including `adr`, `start`, `time`, `info`.
struct Ping
  /// Compatibility member corresponding to native `ping_t.adr`; the original declaration is `netadr_t
  /// adr`.
  adr
  /// Compatibility member corresponding to native `ping_t.start`; the original declaration is `int
  /// start`.
  start
  /// Ping timing value used to record latency or completion of the browser request.
  time
  /// Compatibility member corresponding to native `ping_t.info`; the original declaration is `char
  /// info[MAX_INFO_STRING]`.
  info
end struct
/// Stores client ABI server info record, including `adr`, `hostName`, `mapName`, `game`, `netType`, `gameType` and additional values.
struct ServerInfo
  /// Compatibility member corresponding to native `serverInfo_t.adr`; the original declaration is
  /// `netadr_t adr`.
  adr
  /// Compatibility member corresponding to native `serverInfo_t.hostName`; the original declaration is
  /// `char hostName[MAX_NAME_LENGTH]`.
  hostName
  /// Advertised map name stored in the native server-browser compatibility entry.
  mapName
  /// Compatibility member corresponding to native `serverInfo_t.game`; the original declaration is
  /// `char game[MAX_NAME_LENGTH]`.
  game
  /// Compatibility member corresponding to native `serverInfo_t.netType`; the original declaration is
  /// `int netType`.
  netType
  /// Compatibility member corresponding to native `serverInfo_t.gameType`; the original declaration is
  /// `int gameType`.
  gameType
  /// Reported connected-client count stored in the server-browser ABI record.
  clients
  /// Maximum player slots advertised or supported by the connected server.
  maxClients
  /// Compatibility member corresponding to native `serverInfo_t.minPing`; the original declaration is
  /// `int minPing`.
  minPing
  /// Maximum acceptable server-browser latency in milliseconds.
  maxPing
  /// Server-query latency in milliseconds retained in the server-browser ABI record.
  ping
  /// True when the record is eligible for the current drawing or browser-display pass.
  visible
  /// Legacy server anti-cheat status advertised to the native server browser.
  punkbuster
end struct
/// Stores client ABI server address record, including `ip`, `port`.
struct ServerAddress
  /// Compatibility member corresponding to native `serverAddress_t.ip`; the original declaration is
  /// `byte ip[4]`.
  ip
  /// Compatibility member corresponding to native `serverAddress_t.port`; the original declaration is
  /// `unsigned short port`.
  port
end struct
/// Stores client ABI client static record, including `state`, `keyCatchers`, `cddialog`, `servername`, `rendererStarted`, `soundStarted` and additional values.
struct ClientStatic
  /// Compatibility member corresponding to native `clientStatic_t.state`; the original declaration is
  /// `connstate_t state`.
  state
  /// Bitmask selecting which subsystems currently intercept keyboard input.
  keyCatchers
  /// True when the missing-CD dialog should be shown on the next client frame.
  cddialog
  /// Compatibility member corresponding to native `clientStatic_t.servername`; the original declaration
  /// is `char servername[MAX_OSPATH]`.
  servername
  /// Compatibility member corresponding to native `clientStatic_t.rendererStarted`; the original
  /// declaration is `qboolean rendererStarted`.
  rendererStarted
  /// Compatibility member corresponding to native `clientStatic_t.soundStarted`; the original
  /// declaration is `qboolean soundStarted`.
  soundStarted
  /// Compatibility member corresponding to native `clientStatic_t.soundRegistered`; the original
  /// declaration is `qboolean soundRegistered`.
  soundRegistered
  /// Compatibility member corresponding to native `clientStatic_t.uiStarted`; the original declaration
  /// is `qboolean uiStarted`.
  uiStarted
  /// Compatibility member corresponding to native `clientStatic_t.cgameStarted`; the original
  /// declaration is `qboolean cgameStarted`.
  cgameStarted
  /// Compatibility member corresponding to native `clientStatic_t.framecount`; the original declaration
  /// is `int framecount`.
  framecount
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// Persistent client runtime clock in milliseconds, independent of map server-time synchronization.
  realtime
  /// Compatibility member corresponding to native `clientStatic_t.realFrametime`; the original
  /// declaration is `int realFrametime`.
  realFrametime
  /// Number of valid entries discovered on the local network.
  numlocalservers
  /// Compatibility member corresponding to native `clientStatic_t.localServers`; the original
  /// declaration is `serverInfo_t localServers[MAX_OTHER_SERVERS]`.
  localServers
  /// Number of valid entries in the cached global-server list.
  numglobalservers
  /// Compatibility member corresponding to native `clientStatic_t.globalServers`; the original
  /// declaration is `serverInfo_t globalServers[MAX_GLOBAL_SERVERS]`.
  globalServers
  /// Compatibility member corresponding to native `clientStatic_t.numGlobalServerAddresses`; the
  /// original declaration is `int numGlobalServerAddresses`.
  numGlobalServerAddresses
  /// Compatibility member corresponding to native `clientStatic_t.globalServerAddresses`; the original
  /// declaration is `serverAddress_t globalServerAddresses[MAX_GLOBAL_SERVERS]`.
  globalServerAddresses
  /// Number of valid entries in the cached favorite-server list.
  numfavoriteservers
  /// Compatibility member corresponding to native `clientStatic_t.favoriteServers`; the original
  /// declaration is `serverInfo_t favoriteServers[MAX_OTHER_SERVERS]`.
  favoriteServers
  /// Compatibility member corresponding to native `clientStatic_t.nummplayerservers`; the original
  /// declaration is `int nummplayerservers`.
  nummplayerservers
  /// Compatibility member corresponding to native `clientStatic_t.mplayerServers`; the original
  /// declaration is `serverInfo_t mplayerServers[MAX_OTHER_SERVERS]`.
  mplayerServers
  /// Compatibility member corresponding to native `clientStatic_t.pingUpdateSource`; the original
  /// declaration is `int pingUpdateSource`.
  pingUpdateSource
  /// Compatibility member corresponding to native `clientStatic_t.masterNum`; the original declaration
  /// is `int masterNum`.
  masterNum
  /// Compatibility member corresponding to native `clientStatic_t.updateServer`; the original
  /// declaration is `netadr_t updateServer`.
  updateServer
  /// Compatibility member corresponding to native `clientStatic_t.updateChallenge`; the original
  /// declaration is `char updateChallenge[MAX_TOKEN_CHARS]`.
  updateChallenge
  /// Compatibility member corresponding to native `clientStatic_t.updateInfoString`; the original
  /// declaration is `char updateInfoString[MAX_INFO_STRING]`.
  updateInfoString
  /// Compatibility member corresponding to native `clientStatic_t.authorizeServer`; the original
  /// declaration is `netadr_t authorizeServer`.
  authorizeServer
  /// Renderer configuration reported by the engine for the current display.
  glconfig
  /// Shader resource selected for char set rendering.
  charSetShader
  /// Shader resource selected for white rendering.
  whiteShader
  /// Shader resource selected for console rendering.
  consoleShader
end struct
/// Stores client ABI k button record, including `down`, `downtime`, `msec`, `active`, `wasPressed`.
struct KButton
  /// Physical keys currently holding this logical button down.
  down
  /// Timestamp at which the logical button first became pressed.
  downtime
  /// Accumulated milliseconds for which the logical button was held during the frame.
  msec
  /// True while at least one physical key holds the logical button down.
  active
  /// Latched press event retained until user-command generation consumes it.
  wasPressed
end struct
/// Lists the type names catalog for client ABI in its declared source order.
function typeNames() return ["clSnapshot_t","outPacket_t","clientActive_t","clientConnection_t","ping_t","serverInfo_t","serverAddress_t","clientStatic_t","kbutton_t"] end function
/// Lists the snapshot fields catalog for client ABI in its declared source order.
function snapshotFields() return ["valid","snapFlags","serverTime","messageNum","deltaNum","ping","areamask","cmdNum","ps","numEntities","parseEntitiesNum","serverCommandNum"] end function
/// Lists the active fields catalog for client ABI in its declared source order.
function activeFields() return ["timeoutcount","snap","serverTime","oldServerTime","oldFrameServerTime","serverTimeDelta","extrapolatedSnapshot","newSnapshots","gameState","mapname","parseEntitiesNum","mouseDx","mouseDy","mouseIndex","joystickAxis","cgameUserCmdValue","cgameSensitivity","cmds","cmdNumber","outPackets","viewangles","serverId","snapshots","entityBaselines","parseEntities"] end function
/// Lists the connection fields catalog for client ABI in its declared source order.
function connectionFields() return ["clientNum","lastPacketSentTime","lastPacketTime","serverAddress","connectTime","connectPacketCount","serverMessage","challenge","checksumFeed","reliableSequence","reliableAcknowledge","reliableCommands","serverMessageSequence","serverCommandSequence","lastExecutedServerCommand","serverCommands","download","downloadTempName","downloadName","downloadNumber","downloadBlock","downloadCount","downloadSize","downloadList","downloadRestart","demoName","spDemoRecording","demorecording","demoplaying","demowaiting","firstDemoFrameSkipped","demofile","timeDemoFrames","timeDemoStart","timeDemoBaseTime","netchan"] end function
/// Lists the static fields catalog for client ABI in its declared source order.
function staticFields() return ["state","keyCatchers","cddialog","servername","rendererStarted","soundStarted","soundRegistered","uiStarted","cgameStarted","framecount","frametime","realtime","realFrametime","numlocalservers","localServers","numglobalservers","globalServers","numGlobalServerAddresses","globalServerAddresses","numfavoriteservers","favoriteServers","nummplayerservers","mplayerServers","pingUpdateSource","masterNum","updateServer","updateChallenge","updateInfoString","authorizeServer","glconfig","charSetShader","whiteShader","consoleShader"] end function
/// Computes `snapshotFields()+["p_cmdNumber","p_serverTime","p_realtime"]+activeFields()+connectionFields()+["adr","start","time","info"]+["adr","hostName","mapName","game","netType","gameType","clients","maxCl...` for client ABI `allRecordFields`.
function allRecordFields() return snapshotFields()+["p_cmdNumber","p_serverTime","p_realtime"]+activeFields()+connectionFields()+["adr","start","time","info"]+["adr","hostName","mapName","game","netType","gameType","clients","maxClients","minPing","maxPing","ping","visible","punkbuster"]+["ip","port"]+staticFields()+["down","downtime","msec","active","wasPressed"] end function
/// Lists the declaration names catalog for client ABI in its declared source order.
function declarationNames() return ["CL_Init","CL_FlushMemory","CL_ShutdownAll","CL_AddReliableCommand","CL_StartHunkUsers","CL_Disconnect_f","CL_GetChallengePacket","CL_Vid_Restart_f","CL_Snd_Restart_f","CL_StartDemoLoop","CL_NextDemo","CL_ReadDemoMessage","CL_InitDownloads","CL_NextDownload","CL_GetPing","CL_GetPingInfo","CL_ClearPing","CL_GetPingQueueCount","CL_ShutdownRef","CL_InitRef","CL_CDKeyValidate","CL_ServerStatus","CL_InitInput","CL_SendCmd","CL_ClearState","CL_ReadPackets","CL_WritePacket","IN_CenterView","CL_VerifyCode","CL_KeyState","Key_KeynumToString","CL_SystemInfoChanged","CL_ParseServerMessage","CL_ServerInfoPacket","CL_LocalServers_f","CL_GlobalServers_f","CL_FavoriteServers_f","CL_Ping_f","CL_UpdateVisiblePings_f","Con_DrawCharacter","Con_CheckResize","Con_Init","Con_Clear_f","Con_ToggleConsole_f","Con_DrawNotify","Con_ClearNotify","Con_RunConsole","Con_DrawConsole","Con_PageUp","Con_PageDown","Con_Top","Con_Bottom","Con_Close","SCR_Init","SCR_UpdateScreen","SCR_DebugGraph","SCR_GetBigStringWidth","SCR_AdjustFrom640","SCR_FillRect","SCR_DrawPic","SCR_DrawNamedPic","SCR_DrawBigString","SCR_DrawBigStringColor","SCR_DrawSmallStringExt","SCR_DrawSmallChar","CL_PlayCinematic_f","SCR_DrawCinematic","SCR_RunCinematic","SCR_StopCinematic","CIN_PlayCinematic","CIN_StopCinematic","CIN_RunCinematic","CIN_DrawCinematic","CIN_SetExtents","CIN_SetLooping","CIN_UploadCinematic","CIN_CloseAllVideos","CL_InitCGame","CL_ShutdownCGame","CL_GameCommand","CL_CGameRendering","CL_SetCGameTime","CL_FirstSnapshot","CL_ShaderStateChanged","CL_InitUI","CL_ShutdownUI","Key_GetCatcher","Key_SetCatcher","LAN_LoadCachedServers","LAN_SaveServersToCache","CL_Netchan_Transmit","CL_Netchan_TransmitNextFragment","CL_Netchan_Process"] end function
/// Lists the external names catalog for client ABI in its declared source order.
function externalNames() return ["g_console_field_width","cl","clc","cls","cgvm","uivm","re","cl_nodelta","cl_debugMove","cl_noprint","cl_timegraph","cl_maxpackets","cl_packetdup","cl_shownet","cl_showSend","cl_timeNudge","cl_showTimeDelta","cl_freezeDemo","cl_yawspeed","cl_pitchspeed","cl_run","cl_anglespeedkey","cl_sensitivity","cl_freelook","cl_mouseAccel","cl_showMouseRate","m_pitch","m_yaw","m_forward","m_side","m_filter","cl_timedemo","cl_activeAction","cl_allowDownload","cl_conXOffset","cl_inGameVideo","in_mlook","in_klook","in_strafe","in_speed","cl_connectedToPureServer"] end function
/// Checks whether at least RETRANSMIT_TIMEOUT milliseconds have elapsed since the last connection packet.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param lastSent Value used by `return now-lastSent>=RETRANSMIT_TIMEOUT`.
function retransmitDue(now,lastSent) return now-lastSent>=RETRANSMIT_TIMEOUT end function
/// Maps a nonnegative parse-entity sequence into the MAX_PARSE_ENTITIES ring, rejecting negative sequences with error 7961.
/// @param sequence Value used by `if sequence<0 then return error(7961,"client.h: negative parse entity sequence") end if`.
function parseEntitySlot(sequence) if sequence<0 then return error(7961,"client.h: negative parse entity sequence") end if;return sequence%MAX_PARSE_ENTITIES end function
/// Accepts UDP port numbers from zero through 65,535 inclusive.
/// @param value Value used by `return value>=0 and value<=65535`.
function validServerPort(value) return value>=0 and value<=65535 end function
