// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Front-end draw-surface key packing, ring admission, and ordering from
// renderer/tr_main.c (R_AddDrawSurf, R_DecomposeSort, qsortFast).
package mq3.renderer.draw_surfs
import mq3.compat.numeric as n
import std.sort as sort

/// Maximum number of shader records registered by the renderer.
const MAX_SHADERS=16384
/// Capacity of the draw-surface ring used when queuing scene geometry.
const MAX_DRAWSURFS=65536
/// Bit position of the shader index in a packed draw-surface sort key.
const QSORT_SHADERNUM_SHIFT=17
/// Bit position of the entity number in a packed draw-surface sort key.
const QSORT_ENTITYNUM_SHIFT=7
/// Bit position of the fog number in a packed draw-surface sort key.
const QSORT_FOGNUM_SHIFT=2

/// Data record for `mq3.renderer.draw_surfs.SortFields`; groups `shaderIndex`, `entityNum`, `fogNum`, `dlightMap`.
struct SortFields
  /// Index of the resolved shader in the renderer's shader table.
  shaderIndex
  /// Entity number encoded into the packed draw-surface sort key.
  entityNum
  /// Fog volume number encoded or used by the draw surface.
  fogNum
  /// Dynamic-light state encoded into the draw-surface sort key.
  dlightMap
end struct
/// Data record for `mq3.renderer.draw_surfs.DrawSurf`; groups `sort`, `surface`, `ordinal`.
struct DrawSurf
  /// Packed draw-order key containing the shader, entity, fog, and dynamic-light selectors.
  sort
  /// Surface record, handle, or identifier associated with the drawing operation.
  surface
  /// Original insertion order used to keep equal sort keys stable.
  ordinal
end struct
/// Data record for `mq3.renderer.draw_surfs.Queue`; groups `drawSurfs`, `capacity`, `numDrawSurfs`, `nextOrdinal`.
struct Queue
  /// Surfaces queued for ordering and drawing.
  drawSurfs
  /// Maximum number of draw-surface records retained in the queue.
  capacity
  /// Number of draw surfaces currently queued.
  numDrawSurfs
  /// Insertion-order number assigned to the next queued surface.
  nextOrdinal
end struct

/// Creates error `7340` with message `"draw surfaces: "+message`.
/// @param message Input used in the result expression `error(7340,"draw surfaces: "+message)`.
function fail(message) return error(7340,"draw surfaces: "+message) end function

/// Computes `capacity>0 and capacity<=MAX_DRAWSURFS and (capacity&(capacity-1))==0` for `mq3.renderer.draw_surfs.validCapacity`.
/// @param capacity Input used in the result expression `capacity>0 and capacity<=MAX_DRAWSURFS and (capacity&(capacity-1))==0`.
function validCapacity(capacity)
  return capacity>0 and capacity<=MAX_DRAWSURFS and (capacity&(capacity-1))==0
end function

/// Builds `mq3.renderer.draw_surfs.Queue` for `mq3.renderer.draw_surfs.create`.
/// @param capacity Initial value for `mq3.renderer.draw_surfs.Queue.capacity`.
function create(capacity)
  if not validCapacity(capacity) then return fail("capacity must be a power of two up to 65536") end if
  return Queue(array(capacity,void),capacity,0,0)
end function

/// Calls `mq3.renderer.draw_surfs.create` with `(MAX_DRAWSURFS)` and returns its result.
function createDefault() return create(MAX_DRAWSURFS) end function

/// Validates shader/entity/fog/lightmap ranges and packs them into a draw-surface sort key.
/// @param shaderIndex Input tested by `shaderIndex<0 or shaderIndex>=MAX_SHADERS`.
/// @param entityNum Input tested by `entityNum<0 or entityNum>1023`.
/// @param fogNum Input tested by `fogNum<0 or fogNum>31`.
/// @param dlightMap Input tested by `dlightMap<0 or dlightMap>3`.
function pack(shaderIndex,entityNum,fogNum,dlightMap)
  if shaderIndex<0 or shaderIndex>=MAX_SHADERS then return fail("shader index out of range") end if
  if entityNum<0 or entityNum>1023 then return fail("entity index out of range") end if
  if fogNum<0 or fogNum>31 then return fail("fog index out of range") end if
  if dlightMap<0 or dlightMap>3 then return fail("dlight map out of range") end if
  return n.u32((shaderIndex<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap)
end function

/// Builds `mq3.renderer.draw_surfs.SortFields` for `mq3.renderer.draw_surfs.decompose`.
/// @param sortKey Argument 1 supplied to `mq3.compat.numeric.u32`.
function decompose(sortKey)
  key=n.u32(sortKey)
  return SortFields((key>>QSORT_SHADERNUM_SHIFT)&(MAX_SHADERS-1),(key>>QSORT_ENTITYNUM_SHIFT)&1023,(key>>QSORT_FOGNUM_SHIFT)&31,key&3)
end function

/// Updates `queue.drawSurfs[index]`, `queue.numDrawSurfs`, `queue.nextOrdinal` in `mq3.renderer.draw_surfs.add`; returns `index`.
/// @param queue Mutable record or buffer; this call updates `queue.drawSurfs[index]`, `queue.numDrawSurfs`, `queue.nextOrdinal`.
/// @param surface Value used for `mq3.renderer.draw_surfs.DrawSurf.surface`.
/// @param shaderIndex Value forwarded as `shaderIndex` to `mq3.renderer.draw_surfs.pack`.
/// @param entityNum Value forwarded as `entityNum` to `mq3.renderer.draw_surfs.pack`.
/// @param fogNum Value forwarded as `fogNum` to `mq3.renderer.draw_surfs.pack`.
/// @param dlightMap Value forwarded as `dlightMap` to `mq3.renderer.draw_surfs.pack`.
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

/// Returns `queue.capacity` from `mq3.renderer.draw_surfs.count`; earlier branches return `queue.numDrawSurfs`.
/// @param queue Record providing `queue.numDrawSurfs`, `queue.capacity`.
function count(queue)
  if queue.numDrawSurfs<queue.capacity then return queue.numDrawSurfs end if
  return queue.capacity
end function

/// Builds `result[index]` in `mq3.renderer.draw_surfs.values`; returns `result`.
/// @param queue Record providing `queue.drawSurfs`.
function values(queue)
  if queue==void then return fail("missing queue") end if
  limit=count(queue);result=array(limit,void)
  for index=0 to limit-1 result[index]=queue.drawSurfs[index] end for
  return result
end function

// Deterministic stable insertion ordering by the same unsigned packed key.
// Baseq3 only specifies key ordering; retaining tie order makes repeated
// submissions reproducible without changing renderer batching semantics.
/// @param drawSurfs Argument 3 supplied to `copyArray`.
function sortStable(drawSurfs)
  if drawSurfs==void then return fail("missing surface list") end if
  result=array(len(drawSurfs),void);if len(drawSurfs)>0 then copyArray(result,0,drawSurfs,0,len(drawSurfs)) end if
  for each item in result if item==void then return fail("empty draw surface") end if end for
  sort.sortBy(result,drawSurfLess)
  return result
end function

/// Returns `left.ordinal<right.ordinal` from `mq3.renderer.draw_surfs.drawSurfLess`; earlier branches return `true`, `false`.
/// @param left Record providing `left.sort`, `left.ordinal`.
/// @param right Record providing `right.sort`, `right.ordinal`.
function drawSurfLess(left,right)
  a=n.u32(left.sort);b=n.u32(right.sort);if a<b then return true else if a>b then return false end if
  return left.ordinal<right.ordinal
end function

/// Updates `queue.drawSurfs[index]` in `mq3.renderer.draw_surfs.sortQueue`; returns `list`.
/// @param queue Mutable record or buffer; this call updates `queue.drawSurfs[index]`.
function sortQueue(queue)
  list=values(queue);if list is error then return list end if
  list=sortStable(list);if list is error then return list end if
  for index=0 to len(list)-1 queue.drawSurfs[index]=list[index] end for
  return list
end function
