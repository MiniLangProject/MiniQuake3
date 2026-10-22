// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named code/game/g_session.c surface.
package mq3.game.g_session
import mq3.game.session as session

function G_WriteClientSessionData(level,client) return session.writeClient(level,client) end function
function G_ReadSessionData(level,client) return session.readClient(level,client) end function
function G_InitSessionData(level,client,userinfo) return session.initClient(level,client,userinfo) end function
function G_InitWorldSession(level) return session.initWorld(level) end function
function G_WriteSessionData(level) return session.writeWorld(level) end function
