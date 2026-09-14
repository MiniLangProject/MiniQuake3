// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer R_inPVS query from tr_world.c. Unlike server-world PVS queries,
// this intentionally does not reject points separated by closed area portals.
package mq3.renderer.pvs_query

import mq3.collision.world as collision
import mq3.collision.visibility as visibility

function inPVS(world,firstPoint,secondPoint)
  if world==void then return false end if
  firstLeaf=collision.pointLeafnum(world,firstPoint)
  firstCluster=visibility.leafCluster(world.visibility,firstLeaf)
  mask=visibility.clusterPVS(world.visibility,firstCluster)
  secondLeaf=collision.pointLeafnum(world,secondPoint)
  secondCluster=visibility.leafCluster(world.visibility,secondLeaf)
  // The original assumes renderer points resolve to valid leaves. Keep the
  // bit lookup bounded for malformed VM input and solid-only BSP leaves.
  if secondCluster<0 or (secondCluster>>3)>=len(mask) then return false end if
  return (mask[secondCluster>>3]&(1<<(secondCluster&7)))!=0
end function
