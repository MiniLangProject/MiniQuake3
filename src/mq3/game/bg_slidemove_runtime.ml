// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/bg_slidemove.c.
package mq3.game.bg_slidemove_runtime
import mq3.game.movement as movement

/// Forward `PM_SlideMove` to `mq3.game.movement.slideMove` and return the delegated result.
/// @param state Movement state; accesses `velocity`, `gravity`, `frametime`, `groundPlane` and `groundNormal` and related fields. May update `state.velocity[2]`, `state.velocity` and `state.origin` and additional fields in place.
/// @param gravity Value used by `slideMove` in `if gravity then`.
function PM_SlideMove(state,gravity) return movement.slideMove(state,gravity) end function
/// Forward `PM_StepSlideMove` to `mq3.game.movement.stepSlideMove` and return the delegated result.
/// @param state Movement state; accesses `origin`, `velocity` and `traceFn`. May update `state.origin` and `state.velocity` in place.
/// @param gravity Value used by `slideMove` in `if gravity then`.
function PM_StepSlideMove(state,gravity) return movement.stepSlideMove(state,gravity) end function
