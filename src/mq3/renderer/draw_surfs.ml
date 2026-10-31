// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Front-end draw-surface key packing, ring admission, and ordering from
// renderer/tr_main.c (R_AddDrawSurf, R_DecomposeSort, qsortFast).
package mq3.renderer.draw_surfs
import mq3.compat.numeric as n
import std.sort as sort

const MAX_SHADERS=16384
const MAX_DRAWSURFS=65536
const QSORT_SHADERNUM_SHIFT=17
const QSORT_ENTITYNUM_SHIFT=7
const QSORT_FOGNUM_SHIFT=2

struct SortFields shaderIndex entityNum fogNum dlightMap end struct
struct DrawSurf sort surface ordinal end struct
struct Queue drawSurfs capacity numDrawSurfs nextOrdinal end struct

function fail(message) return error(7340,"draw surfaces: "+message) end function

function validCapacity(capacity)
  return capacity>0 and capacity<=MAX_DRAWSURFS and (capacity&(capacity-1))==0
end function

function create(capacity)
  if not validCapacity(capacity) then return fail("capacity must be a power of two up to 65536") end if
  return Queue(array(capacity,void),capacity,0,0)
end function

function createDefault() return create(MAX_DRAWSURFS) end function

function pack(shaderIndex,entityNum,fogNum,dlightMap)
  if shaderIndex<0 or shaderIndex>=MAX_SHADERS then return fail("shader index out of range") end if
  if entityNum<0 or entityNum>1023 then return fail("entity index out of range") end if
  if fogNum<0 or fogNum>31 then return fail("fog index out of range") end if
  if dlightMap<0 or dlightMap>3 then return fail("dlight map out of range") end if
  return n.u32((shaderIndex<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap)
end function

function decompose(sortKey)
  key=n.u32(sortKey)
  return SortFields((key>>QSORT_SHADERNUM_SHIFT)&(MAX_SHADERS-1),(key>>QSORT_ENTITYNUM_SHIFT)&1023,(key>>QSORT_FOGNUM_SHIFT)&31,key&3)
end function

function add(queue,surface,shaderIndex,entityNum,fogNum,dlightMap)
  if queue==void then return fail("missing queue") end if
  key=pack(shaderIndex,entityNum,fogNum,dlightMap)
  if key is error then return key end if
  // Baseq3 masks the monotonically increasing count instead of rejecting
  // overflow, so new surfaces replace the oldest physical ring slots.
  index=queue.numDrawSurfs&(queue.capacity-1)
  queue.drawSurfs[index]=DrawSurf(key,surface,queue.nextOrdinal)
  queue.numDrawSurfs=queue.numDrawSurfs+1;queue.nextOrdinal=queue.nextOrdinal+1
  return index
end function

function count(queue)
  if queue.numDrawSurfs<queue.capacity then return queue.numDrawSurfs end if
  return queue.capacity
end function

function values(queue)
  if queue==void then return fail("missing queue") end if
  limit=count(queue);result=array(limit,void)
  for index=0 to limit-1 result[index]=queue.drawSurfs[index] end for
  return result
end function

// Deterministic stable insertion ordering by the same unsigned packed key.
// Baseq3 only specifies key ordering; retaining tie order makes repeated
// submissions reproducible without changing renderer batching semantics.
function sortStable(drawSurfs)
  if drawSurfs==void then return fail("missing surface list") end if
  result=array(len(drawSurfs),void);if len(drawSurfs)>0 then copyArray(result,0,drawSurfs,0,len(drawSurfs)) end if
  for each item in result if item==void then return fail("empty draw surface") end if end for
  sort.sortBy(result,drawSurfLess)
  return result
end function

function drawSurfLess(left,right)
  a=n.u32(left.sort);b=n.u32(right.sort);if a<b then return true else if a>b then return false end if
  return left.ordinal<right.ordinal
end function

function sortQueue(queue)
  list=values(queue);if list is error then return list end if
  list=sortStable(list);if list is error then return list end if
  for index=0 to len(list)-1 queue.drawSurfs[index]=list[index] end for
  return list
end function
