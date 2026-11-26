// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BotAddAvoidSpot state transition from code/botlib/be_ai_move.c.
package mq3.botlib.ai_avoid_spots

import mq3.botlib.ai_resource_pools as resources
import mq3.compat.numeric as n

const OP_ADD_AVOID_SPOT=574
const AVOID_CLEAR=0
const AVOID_ALWAYS=1
const AVOID_DONTBLOCK=2

/// Apply `mq3.botlib.ai_resource_pools.moveState` while evaluating `add`.
/// @param pools Bot resource pools; accesses `moveStates`.
/// @param moveHandle Handle identifying the allocated bot movement state.
/// @param origin World-space position as three coordinates.
/// @param radius Radius used by the spatial or damage query.
/// @param type Value used by `add` in `if type==AVOID_CLEAR then state.numAvoidSpots=0`.
function add(pools,moveHandle,origin,radius,type)
  state=resources.moveState(pools,moveHandle);if state==void then return 0 end if
  if type==AVOID_CLEAR then state.numAvoidSpots=0;return 0 end if
  if state.numAvoidSpots>=resources.MAX_AVOIDSPOTS then return 0 end if
  index=state.numAvoidSpots;spot=state.avoidSpots[index]
  spot.origin=[n.f32(origin[0]),n.f32(origin[1]),n.f32(origin[2])]
  spot.radius=n.f32(radius);spot.type=type;state.numAvoidSpots=index+1;return 0
end function
