// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named code/game/g_session.c surface.
package mq3.game.g_session
import mq3.game.session as session

/// Forward `G_WriteClientSessionData` to `mq3.game.session.writeClient` and return the delegated result.
/// @param level Game-level state; accesses `clients`.
/// @param client Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields.
function G_WriteClientSessionData(level,client) return session.writeClient(level,client) end function
/// Forward `G_ReadSessionData` to `mq3.game.session.readClient` and return the delegated result.
/// @param level Game-level state; accesses `clients`.
/// @param client Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields. May update `client.team`, `client.spectatorTime` and `client.spectatorState` and additional fields in place.
function G_ReadSessionData(level,client) return session.readClient(level,client) end function
/// Forward `G_InitSessionData` to `mq3.game.session.initClient` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `teamAutoJoin`, `numNonSpectatorClients`, `maxGameClients` and `time`.
/// @param client Client state; accesses `team`, `spectatorState` and `spectatorTime`. May update `client.team`, `client.spectatorState` and `client.spectatorTime` in place.
/// @param userinfo Text to parse, format or deliver.
function G_InitSessionData(level,client,userinfo) return session.initClient(level,client,userinfo) end function
/// Forward `G_InitWorldSession` to `mq3.game.session.initWorld` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `newSession` and `gamePrintFn`. May update `level.newSession` in place.
function G_InitWorldSession(level) return session.initWorld(level) end function
/// Forward `G_WriteSessionData` to `mq3.game.session.writeWorld` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `maxclients` and `clients`.
function G_WriteSessionData(level) return session.writeWorld(level) end function
