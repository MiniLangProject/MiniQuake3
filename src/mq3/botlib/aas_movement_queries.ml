// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Small complete movement queries from be_aas_move.c.
package mq3.botlib.aas_movement_queries

/// Collision contents bit marking lava.
const CONTENTS_LAVA=8
/// Collision contents bit marking slime.
const CONTENTS_SLIME=16
/// Collision contents bit marking water.
const CONTENTS_WATER=32

/// Test whether the point contents permit swimming under the AAS movement rules.
/// @param context Context forwarded to the configured host callbacks.
/// @param pointContentsFn Operand used to evaluate the returned expression `(pointContentsFn(context,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0`.
/// @param origin World-space position as three coordinates.
function swimming(context,pointContentsFn,origin)
  if pointContentsFn==void or origin==void or len(origin)!=3 then return false end if
  test=[origin[0],origin[1],origin[2]-2.0]
  return (pointContentsFn(context,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0
end function
