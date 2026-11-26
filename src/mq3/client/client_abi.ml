// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed ABI facade for code/client/client.h.
package mq3.client.client_abi
const RETRANSMIT_TIMEOUT=3000
const MAX_PARSE_ENTITIES=2048
/// Stores client ABI cl snapshot record, including `valid`, `snapFlags`, `serverTime`, `messageNum`, `deltaNum`, `ping` and additional values.
struct ClSnapshot valid snapFlags serverTime messageNum deltaNum ping areamask cmdNum ps numEntities parseEntitiesNum serverCommandNum end struct
/// Stores client ABI out packet record, including `p_cmdNumber`, `p_serverTime`, `p_realtime`.
struct OutPacket p_cmdNumber p_serverTime p_realtime end struct
/// Stores client ABI client active record, including `timeoutcount`, `snap`, `serverTime`, `oldServerTime`, `oldFrameServerTime`, `serverTimeDelta` and additional values.
struct ClientActive timeoutcount snap serverTime oldServerTime oldFrameServerTime serverTimeDelta extrapolatedSnapshot newSnapshots gameState mapname parseEntitiesNum mouseDx mouseDy mouseIndex joystickAxis cgameUserCmdValue cgameSensitivity cmds cmdNumber outPackets viewangles serverId snapshots entityBaselines parseEntities end struct
/// Stores client ABI client connection record, including `clientNum`, `lastPacketSentTime`, `lastPacketTime`, `serverAddress`, `connectTime`, `connectPacketCount` and additional values.
struct ClientConnection clientNum lastPacketSentTime lastPacketTime serverAddress connectTime connectPacketCount serverMessage challenge checksumFeed reliableSequence reliableAcknowledge reliableCommands serverMessageSequence serverCommandSequence lastExecutedServerCommand serverCommands download downloadTempName downloadName downloadNumber downloadBlock downloadCount downloadSize downloadList downloadRestart demoName spDemoRecording demorecording demoplaying demowaiting firstDemoFrameSkipped demofile timeDemoFrames timeDemoStart timeDemoBaseTime netchan end struct
/// Stores client ABI ping record, including `adr`, `start`, `time`, `info`.
struct Ping adr start time info end struct
/// Stores client ABI server info record, including `adr`, `hostName`, `mapName`, `game`, `netType`, `gameType` and additional values.
struct ServerInfo adr hostName mapName game netType gameType clients maxClients minPing maxPing ping visible punkbuster end struct
/// Stores client ABI server address record, including `ip`, `port`.
struct ServerAddress ip port end struct
/// Stores client ABI client static record, including `state`, `keyCatchers`, `cddialog`, `servername`, `rendererStarted`, `soundStarted` and additional values.
struct ClientStatic state keyCatchers cddialog servername rendererStarted soundStarted soundRegistered uiStarted cgameStarted framecount frametime realtime realFrametime numlocalservers localServers numglobalservers globalServers numGlobalServerAddresses globalServerAddresses numfavoriteservers favoriteServers nummplayerservers mplayerServers pingUpdateSource masterNum updateServer updateChallenge updateInfoString authorizeServer glconfig charSetShader whiteShader consoleShader end struct
/// Stores client ABI k button record, including `down`, `downtime`, `msec`, `active`, `wasPressed`.
struct KButton down downtime msec active wasPressed end struct
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
