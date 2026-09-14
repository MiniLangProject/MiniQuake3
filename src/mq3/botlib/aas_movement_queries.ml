// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Small complete movement queries from be_aas_move.c.
package mq3.botlib.aas_movement_queries

const CONTENTS_LAVA=8
const CONTENTS_SLIME=16
const CONTENTS_WATER=32

function swimming(context,pointContentsFn,origin)
  if pointContentsFn==void or origin==void or len(origin)!=3 then return false end if
  test=[origin[0],origin[1],origin[2]-2.0]
  return (pointContentsFn(context,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0
end function
