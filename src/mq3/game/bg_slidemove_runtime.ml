// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/bg_slidemove.c.
package mq3.game.bg_slidemove_runtime
import mq3.game.movement as movement

function PM_SlideMove(state,gravity) return movement.slideMove(state,gravity) end function
function PM_StepSlideMove(state,gravity) return movement.stepSlideMove(state,gravity) end function
