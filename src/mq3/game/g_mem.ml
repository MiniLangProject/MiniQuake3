// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named code/game/g_mem.c surface.
package mq3.game.g_mem
import mq3.game.memory as memory

const POOLSIZE = 262144

function G_Alloc(level,size) return memory.allocate(level,size) end function
function G_InitMemory(level) return memory.init(level) end function
function Svcmd_GameMem_f(level) return memory.status(level) end function
