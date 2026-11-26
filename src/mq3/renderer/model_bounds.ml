// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Model-bound selection matching renderer/tr_model.c:R_ModelBounds.
package mq3.renderer.model_bounds

/// Returns `[[0.0,0.0,0.0],[0.0,0.0,0.0]]` for `mq3.renderer.model_bounds.zero`.
function zero()
  return [[0.0,0.0,0.0],[0.0,0.0,0.0]]
end function

/// Returns `[value[0],value[1],value[2]]` from `mq3.renderer.model_bounds.vectorCopy`; earlier branches return `error(7470,"malformed MD3 frame bounds")`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function vectorCopy(value)
  if value==void or len(value)!=3 then return error(7470,"malformed MD3 frame bounds") end if
  return [value[0],value[1],value[2]]
end function

// The original renderer returns the first MD3 frame's bounds. The aggregate
// bounds cached by the asset reader are useful for culling, but are not the
// R_ModelBounds ABI and can move weapon/UI model placement for animated MD3s.
/// @param model Record providing `model.frames`.
function md3(model)
  if model==void or model.frames==void or len(model.frames)<1 then return zero() end if
  frame=model.frames[0]
  if frame==void then return error(7471,"missing first MD3 frame") end if
  mins=vectorCopy(frame.mins);if mins is error then return mins end if
  maxs=vectorCopy(frame.maxs);if maxs is error then return maxs end if
  return [mins,maxs]
end function
