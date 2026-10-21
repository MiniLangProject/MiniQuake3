// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Static AAS_TraceClientBBox traversal from code/botlib/be_aas_sample.c.
package mq3.botlib.aas_client_trace

import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.array as arrays

const TRACEPLANE_EPSILON=0.125
const TRACE_STACK_SIZE=127

struct Segment start finish nodeNum planeNum end struct
struct Trace startsolid fraction endpos ent lastarea area planenum normal end struct

function fail(message) return error(7542,"AAS client trace: "+message) end function
function copy(value) return [value[0],value[1],value[2]] end function
function sub(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
function dot(a,b) return n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2])) end function
function length(value) return n.fsqrt(dot(value,value)) end function
function scale(value,amount) return [n.fmul(value[0],amount),n.fmul(value[1],amount),n.fmul(value[2],amount)] end function
function add(a,b) return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])] end function
function empty() return Trace(false,0.0,[0.0,0.0,0.0],0,0,0,0,[0.0,0.0,0.0]) end function

function hit(runtime,start,finish,segment,nodeNum,planenum,lastarea)
  result=empty();direction=sub(finish,start);distance=length(direction)
  same=segment.start[0]==start[0] and segment.start[1]==start[1] and segment.start[2]==start[2]
  if same then result.startsolid=true;result.fraction=0.0;direction=[0.0,0.0,0.0]
  else
    travelled=length(sub(segment.start,start));if distance>0.0 then result.fraction=n.fdiv(travelled,distance) end if
    normalized=[0.0,0.0,0.0];if distance>0.0 then normalized=scale(direction,n.fdiv(1.0,distance)) end if
    segment.start=add(segment.start,scale(normalized,-0.125))
  end if
  result.endpos=copy(segment.start);result.lastarea=lastarea;result.area=nodeNum;result.planenum=planenum
  if planenum>=0 and planenum<runtime.map.counts[aas.LUMP_PLANES] then
    plane=aas.plane(runtime.map,planenum);if plane is error then return plane end if
    if dot(direction,plane.normal)>0.0 then result.planenum=planenum^1;plane=aas.plane(runtime.map,result.planenum);if plane is error then return plane end if end if
    result.normal=copy(plane.normal)
  end if
  return result
end function

function trace(runtime,start,finish,presenceType)
  if runtime==void or not runtime.initialized or runtime.map==void then return empty() end if
  if start==void or finish==void or len(start)!=3 or len(finish)!=3 then return fail("invalid trace line") end if
  if runtime.map.counts[aas.LUMP_NODES]<2 then return fail("AAS node root missing") end if
  stack=[Segment(copy(start),copy(finish),1,0)];lastarea=0;visits=0;limit=runtime.map.counts[aas.LUMP_NODES]*4+TRACE_STACK_SIZE
  while len(stack)>0
    index=len(stack)-1;segment=stack[index];stack=arrays.slice(stack,0,index);nodeNum=segment.nodeNum;visits=visits+1
    if visits>limit then return fail("cyclic AAS node tree") end if
    if nodeNum<0 then
      areaNum=0-nodeNum;if areaNum<=0 or areaNum>=runtime.map.counts[aas.LUMP_AREAS] then return fail("area outside map") end if
      settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return settings end if
      if (settings.presenceType&presenceType)==0 then return hit(runtime,start,finish,segment,areaNum,segment.planeNum,lastarea) end if
      lastarea=areaNum;continue
    end if
    if nodeNum==0 then return hit(runtime,start,finish,segment,0,segment.planeNum,lastarea) end if
    if nodeNum>=runtime.map.counts[aas.LUMP_NODES] then return fail("node outside map") end if
    node=aas.node(runtime.map,nodeNum);if node is error then return node end if;plane=aas.plane(runtime.map,node.planeNum);if plane is error then return plane end if
    front=n.fsub(dot(segment.start,plane.normal),plane.dist);back=n.fsub(dot(segment.finish,plane.normal),plane.dist)
    if front>=0.0 and back>=0.0 then stack=stack+[Segment(segment.start,segment.finish,node.children[0],segment.planeNum)]
    else if front<0.0 and back<0.0 then stack=stack+[Segment(segment.start,segment.finish,node.children[1],segment.planeNum)]
    else
      if front==back then front=n.fsub(front,0.001) end if
      numerator=n.fsub(front,TRACEPLANE_EPSILON);if front<0.0 then numerator=n.fadd(front,TRACEPLANE_EPSILON) end if
      fraction=n.fdiv(numerator,n.fsub(front,back));if fraction<0.0 then fraction=0.001 else if fraction>1.0 then fraction=0.999 end if
      middle=[];for axis=0 to 2 middle=middle+[n.fadd(segment.start[axis],n.fmul(n.fsub(segment.finish[axis],segment.start[axis]),fraction))] end for
      side=0;if front<0.0 then side=1 end if
      stack=stack+[Segment(copy(middle),segment.finish,node.children[1-side],node.planeNum),Segment(segment.start,copy(middle),node.children[side],segment.planeNum)]
      if len(stack)>=TRACE_STACK_SIZE then return fail("trace stack overflow") end if
    end if
  end while
  return Trace(false,1.0,copy(finish),0,lastarea,0,0,[0.0,0.0,0.0])
end function
