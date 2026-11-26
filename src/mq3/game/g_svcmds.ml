// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_svcmds.c surface over the productive server runtimes.
package mq3.game.g_svcmds
import mq3.game.ip_filters as filters
import mq3.game.server_commands as commands

/// Forward `StringToFilter` to `mq3.game.ip_filters.stringToFilter` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
/// @param filter Filter record; accesses `mask` and `compare`. May update `filter.mask` and `filter.compare` in place.
function StringToFilter(level,text,filter) return filters.stringToFilter(level,text,filter) end function
/// Forward `UpdateIPBans` to `mq3.game.ip_filters.updateBans` and return the delegated result.
/// @param level Game-level state; accesses `cvarSetFn`.
function UpdateIPBans(level) return filters.updateBans(level) end function
/// Forward `G_FilterPacket` to `mq3.game.ip_filters.filterPacket` and return the delegated result.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
/// @param address Address within the VM memory or native data buffer.
function G_FilterPacket(level,address) return filters.filterPacket(level,address) end function
/// Forward `AddIP` to `mq3.game.ip_filters.addIP` and return the delegated result.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
/// @param address Address within the VM memory or native data buffer.
function AddIP(level,address) return filters.addIP(level,address) end function
/// Forward `G_ProcessIPBans` to `mq3.game.ip_filters.processBans` and return the delegated result.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
function G_ProcessIPBans(level) return filters.processBans(level) end function
/// Forward `Svcmd_AddIP_f` to `mq3.game.ip_filters.addCommand` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param argv Command argument strings in their original order.
function Svcmd_AddIP_f(level,argv) return filters.addCommand(level,argv) end function
/// Forward `Svcmd_RemoveIP_f` to `mq3.game.ip_filters.removeCommand` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param argv Command argument strings in their original order.
function Svcmd_RemoveIP_f(level,argv) return filters.removeCommand(level,argv) end function
/// Forward `Svcmd_EntityList_f` to `mq3.game.server_commands.entityList` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
function Svcmd_EntityList_f(level) return commands.entityList(level) end function
/// Forward `ClientForString` to `mq3.game.server_commands.clientForString` and return the delegated result.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param text Text to parse, format or deliver.
function ClientForString(level,text) return commands.clientForString(level,text) end function
/// Forward `Svcmd_ForceTeam_f` to `mq3.game.server_commands.forceTeam` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param argv Command argument strings in their original order.
function Svcmd_ForceTeam_f(level,argv) return commands.forceTeam(level,argv) end function
/// Forward `ConsoleCommand` to `mq3.game.server_commands.command` and return the delegated result.
/// @param level Game-level state; accesses `consoleCommandFn`, `dedicated` and `serverCommandFn`.
/// @param argv Command argument strings in their original order.
function ConsoleCommand(level,argv) return commands.command(level,argv) end function
