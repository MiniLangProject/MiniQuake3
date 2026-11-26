// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named code/game/g_mem.c surface.
package mq3.game.g_mem
import mq3.game.memory as memory

/// Byte capacity of the fixed game-module allocation pool.
const POOLSIZE = 262144

/// Forward `G_Alloc` to `mq3.game.memory.allocate` and return the delegated result.
/// @param level Game-level state; accesses `memoryState`. May update `level.memoryState` in place.
/// @param size Size or capacity supplied to the buffer operation.
function G_Alloc(level,size) return memory.allocate(level,size) end function
/// Forward `G_InitMemory` to `mq3.game.memory.init` and return the delegated result.
/// @param level Game-level state; accesses `memoryState`. May update `level.memoryState` in place.
function G_InitMemory(level) return memory.init(level) end function
/// Forward `Svcmd_GameMem_f` to `mq3.game.memory.status` and return the delegated result.
/// @param level Game-level state; accesses `memoryState`. May update `level.memoryState` in place.
function Svcmd_GameMem_f(level) return memory.status(level) end function
