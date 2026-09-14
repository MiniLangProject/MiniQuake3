// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Iterative AAS_TraceAreas traversal from be_aas_sample.c.
package mq3.botlib.aas_trace_areas

import mq3.format.aas as aas
import std.array as arrays

struct Segment start finish nodeNum planeNum end struct
struct Result areas points end struct

function copy(value) return [value[0],value[1],value[2]] end function
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function

function trace(runtime,start,finish,maximum)
  if runtime==void or not runtime.initialized or runtime.map==void or maximum<=0 then return Result([],[]) end if
  if start==void or finish==void or len(start)!=3 or len(finish)!=3 then return error(7531,"invalid AAS trace-area line") end if
  stack=[Segment(copy(start),copy(finish),1,0)];areas=[];points=[];visits=0;limit=127
  while len(stack)>0 and len(areas)<maximum
    index=len(stack)-1;segment=stack[index];stack=arrays.slice(stack,0,index);nodeNum=segment.nodeNum;visits=visits+1
    if visits>runtime.map.counts[aas.LUMP_NODES]*4+127 then return error(7531,"cyclic AAS trace-area tree") end if
    if nodeNum<0 then areas=areas+[0-nodeNum];points=points+[copy(segment.start)];continue end if
    if nodeNum==0 then continue end if
    if nodeNum>=runtime.map.counts[aas.LUMP_NODES] then return error(7531,"AAS trace-area node outside map") end if
    node=aas.node(runtime.map,nodeNum);if node is error then return node end if
    plane=aas.plane(runtime.map,node.planeNum);if plane is error then return plane end if
    front=dot(segment.start,plane.normal)-plane.dist;back=dot(segment.finish,plane.normal)-plane.dist
    if front>0.0 and back>0.0 then stack=stack+[Segment(segment.start,segment.finish,node.children[0],segment.planeNum)]
    else if front<=0.0 and back<=0.0 then stack=stack+[Segment(segment.start,segment.finish,node.children[1],segment.planeNum)]
    else
      fraction=front/(front-back);if fraction<0.0 then fraction=0.0 else if fraction>1.0 then fraction=1.0 end if
      middle=[];for axis=0 to 2 middle=middle+[segment.start[axis]+(segment.finish[axis]-segment.start[axis])*fraction] end for
      side=0;if front<0.0 then side=1 end if
      // Push the far side first: the LIFO traversal must return areas in line order.
      stack=stack+[Segment(copy(middle),segment.finish,node.children[1-side],node.planeNum),Segment(segment.start,copy(middle),node.children[side],segment.planeNum)]
      if len(stack)>limit then return error(7531,"AAS trace-area stack overflow") end if
    end if
  end while
  return Result(areas,points)
end function
