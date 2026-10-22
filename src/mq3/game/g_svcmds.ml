// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_svcmds.c surface over the productive server runtimes.
package mq3.game.g_svcmds
import mq3.game.ip_filters as filters
import mq3.game.server_commands as commands

function StringToFilter(level,text,filter) return filters.stringToFilter(level,text,filter) end function
function UpdateIPBans(level) return filters.updateBans(level) end function
function G_FilterPacket(level,address) return filters.filterPacket(level,address) end function
function AddIP(level,address) return filters.addIP(level,address) end function
function G_ProcessIPBans(level) return filters.processBans(level) end function
function Svcmd_AddIP_f(level,argv) return filters.addCommand(level,argv) end function
function Svcmd_RemoveIP_f(level,argv) return filters.removeCommand(level,argv) end function
function Svcmd_EntityList_f(level) return commands.entityList(level) end function
function ClientForString(level,text) return commands.clientForString(level,text) end function
function Svcmd_ForceTeam_f(level,argv) return commands.forceTeam(level,argv) end function
function ConsoleCommand(level,argv) return commands.command(level,argv) end function
