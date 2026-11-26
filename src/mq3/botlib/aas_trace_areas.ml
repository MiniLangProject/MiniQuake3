// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Iterative AAS_TraceAreas traversal from be_aas_sample.c.
package mq3.botlib.aas_trace_areas

import mq3.format.aas as aas
import std.ds.list as lists

/// `Segment` record for aas trace areas, containing `start`, `finish`, `nodeNum` and `planeNum`.
struct Segment start finish nodeNum planeNum end struct
/// `Result` record for aas trace areas, containing `areas` and `points`.
struct Result areas points end struct

/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas trace areas.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copy(value) return [value[0],value[1],value[2]] end function
/// Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function

/// Trace a line segment through AAS areas and retain the crossed area numbers and intersection points.
/// @param runtime AAS trace areas runtime; accesses `initialized` and `map`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param maximum Upper bound applied by the operation.
function trace(runtime,start,finish,maximum)
  if runtime==void or not runtime.initialized or runtime.map==void or maximum<=0 then return Result([],[]) end if
  if start==void or finish==void or len(start)!=3 or len(finish)!=3 then return error(7531,"invalid AAS trace-area line") end if
  capacity=maximum;if capacity>32 then capacity=32 end if
  stack=lists.List.withCapacity(16);stack.add(Segment(copy(start),copy(finish),1,0));areas=lists.List.withCapacity(capacity);points=lists.List.withCapacity(capacity);visits=0;limit=127
  while not stack.isEmpty() and areas.len()<maximum
    segment=stack.pop();nodeNum=segment.nodeNum;visits=visits+1
    if visits>runtime.map.counts[aas.LUMP_NODES]*4+127 then return error(7531,"cyclic AAS trace-area tree") end if
    if nodeNum<0 then areas.add(0-nodeNum);points.add(copy(segment.start));continue end if
    if nodeNum==0 then continue end if
    if nodeNum>=runtime.map.counts[aas.LUMP_NODES] then return error(7531,"AAS trace-area node outside map") end if
    node=aas.node(runtime.map,nodeNum);if node is error then return node end if
    plane=aas.plane(runtime.map,node.planeNum);if plane is error then return plane end if
    front=dot(segment.start,plane.normal)-plane.dist;back=dot(segment.finish,plane.normal)-plane.dist
    if front>0.0 and back>0.0 then stack.add(Segment(segment.start,segment.finish,node.children[0],segment.planeNum))
    else if front<=0.0 and back<=0.0 then stack.add(Segment(segment.start,segment.finish,node.children[1],segment.planeNum))
    else
      fraction=front/(front-back);if fraction<0.0 then fraction=0.0 else if fraction>1.0 then fraction=1.0 end if
      middle=array(3,0.0);for axis=0 to 2 middle[axis]=segment.start[axis]+(segment.finish[axis]-segment.start[axis])*fraction end for
      side=0;if front<0.0 then side=1 end if
      // Push the far side first: the LIFO traversal must return areas in line order.
      stack.add(Segment(copy(middle),segment.finish,node.children[1-side],node.planeNum));stack.add(Segment(segment.start,copy(middle),node.children[side],segment.planeNum))
      if stack.len()>limit then return error(7531,"AAS trace-area stack overflow") end if
    end if
  end while
  return Result(areas.toArray(),points.toArray())
end function
