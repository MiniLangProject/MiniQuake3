// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic BSP46 wireframe extraction for the first interactive preview.
package mq3.renderer.bsp_preview
import mq3.compat.numeric as n

const MST_PLANAR = 1
const MST_TRIANGLE_SOUP = 3

/// Data record for `mq3.renderer.bsp_preview.Line`; groups `a`, `b`, `face`, `triangle`.
struct Line a b face triangle end struct
/// Data record for `mq3.renderer.bsp_preview.Preview`; groups `lines`, `surfaceCount`, `triangleCount`, `truncated`.
struct Preview lines surfaceCount triangleCount truncated end struct

/// Creates error `7404` with message `"BSP preview: "+text`.
/// @param text Input used in the result expression `error(7404,"BSP preview: "+text)`.
function fail(text) return error(7404,"BSP preview: "+text) end function
/// Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17` for `mq3.renderer.bsp_preview.validMap`.
/// @param map Record providing `map.data`, `map.offsets`, `map.counts`.
function validMap(map)
  return map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17
end function
/// Computes `recordRange` from `map.offsets[lump]+index*stride`.
/// @param map Record providing `map.counts`, `map.offsets`, `map.data`.
/// @param lump Input tested by `index<0 or index>=map.counts[lump]`.
/// @param index Input tested by `index<0 or index>=map.counts[lump]`.
/// @param stride Input used by `offset=map.offsets[lump]+index*stride`.
function recordRange(map,lump,index,stride)
  if index<0 or index>=map.counts[lump] then return fail("record index outside lump") end if
  offset=map.offsets[lump]+index*stride
  if offset<0 or offset+stride>len(map.data) then return fail("record outside BSP data") end if
  return offset
end function
/// Returns `value` from `mq3.renderer.bsp_preview.i32`; earlier branches return `fail("truncated integer")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function i32(map,offset)
  value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value
end function
/// Computes `point` from `[n.bitsFloat(x),n.bitsFloat(y),n.bitsFloat(z)]` using `mq3.renderer.bsp_preview.recordRange`, `mq3.compat.numeric.readU32`, `mq3.compat.numeric.bitsFloat`.
/// @param map Record providing `map.data`.
/// @param index Value forwarded as `index` to `mq3.renderer.bsp_preview.recordRange`.
function point(map,index)
  offset=recordRange(map,10,index,44);if offset is error then return offset end if
  x=n.readU32(map.data,offset);y=n.readU32(map.data,offset+4);z=n.readU32(map.data,offset+8)
  if x is error or y is error or z is error then return fail("truncated vertex") end if
  return [n.bitsFloat(x),n.bitsFloat(y),n.bitsFloat(z)]
end function
/// Returns `false` from `mq3.renderer.bsp_preview.contains`; earlier branches return `true`.
/// @param values Sequence traversed as `value` while producing this result.
/// @param wanted Input used by `for each value in values if value==wanted then return true`.
function contains(values,wanted)
  for each value in values if value==wanted then return true end if end for
  return false
end function

// Resolve the face list referenced by a set of visible BSP leaves. The result
// retains first occurrence order and removes faces shared by several leaves.
/// @param map Record providing `map.counts`.
/// @param leafIndexes Sequence traversed as `leafIndex` while producing this result.
function visibleFaces(map,leafIndexes)
  if not validMap(map) then return fail("invalid BSP object") end if
  if leafIndexes==void then return fail("missing leaf list") end if
  result=[]
  for each leafIndex in leafIndexes
    offset=recordRange(map,4,leafIndex,48);if offset is error then return offset end if
    first=i32(map,offset+32);count=i32(map,offset+36)
    if first is error or count is error or first<0 or count<0 or first+count>map.counts[5] then return fail("leaf surface range outside lump") end if
    for slot=first to first+count-1
      entry=recordRange(map,5,slot,4);if entry is error then return entry end if
      face=i32(map,entry);if face is error or face<0 or face>=map.counts[13] then return fail("leaf references invalid face") end if
      if not contains(result,face) then result=result+[face] end if
    end for
  end for
  return result
end function

/// Returns `false` from `mq3.renderer.bsp_preview.alreadyEmitted`; earlier branches return `true`.
/// @param keys Sequence traversed as `key` while producing this result.
/// @param left Input used by `low=left`.
/// @param right Input used by `high=right`.
function alreadyEmitted(keys,left,right)
  low=left;high=right;if low>high then low=right;high=left end if
  for each key in keys if key[0]==low and key[1]==high then return true end if end for
  return false
end function

// Faces use meshvert indexes relative to firstVert, exactly like srfSurfaceFace_t
// and srfTriangles_t. Shared triangle edges are emitted once.
/// @param map Record providing `map.counts`.
/// @param faceIndexes Sequence traversed as `faceIndex` while producing this result.
/// @param maxLines Input tested by `maxLines<0`.
function wireframe(map,faceIndexes,maxLines)
  if not validMap(map) then return fail("invalid BSP object") end if
  if faceIndexes==void then return fail("missing face list") end if
  if maxLines<0 then return fail("negative line limit") end if
  lines=[];keys=[];surfaces=0;triangles=0;truncated=false
  for each faceIndex in faceIndexes
    faceOffset=recordRange(map,13,faceIndex,104);if faceOffset is error then return faceOffset end if
    kind=i32(map,faceOffset+8);firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);firstMesh=i32(map,faceOffset+20);numMesh=i32(map,faceOffset+24)
    if kind is error or firstVert is error or numVerts is error or firstMesh is error or numMesh is error then return fail("truncated face") end if
    if kind==MST_PLANAR or kind==MST_TRIANGLE_SOUP then
      if firstVert<0 or numVerts<0 or firstVert+numVerts>map.counts[10] then return fail("face vertex range outside lump") end if
      if firstMesh<0 or numMesh<0 or firstMesh+numMesh>map.counts[11] or numMesh%3!=0 then return fail("face meshvert range is invalid") end if
      surfaces=surfaces+1
      for triangle=0 to n.quotient(numMesh,3)-1
        indexes=[]
        for corner=0 to 2
          meshOffset=recordRange(map,11,firstMesh+triangle*3+corner,4);if meshOffset is error then return meshOffset end if
          relative=i32(map,meshOffset)
          if relative is error or relative<0 or relative>=numVerts then return fail("meshvert outside face vertices") end if
          indexes=indexes+[firstVert+relative]
        end for
        triangles=triangles+1
        pairs=[[indexes[0],indexes[1]],[indexes[1],indexes[2]],[indexes[2],indexes[0]]]
        for each pair in pairs
          if not alreadyEmitted(keys,pair[0],pair[1]) then
            if len(lines)>=maxLines then truncated=true else
              a=point(map,pair[0]);if a is error then return a end if
              b=point(map,pair[1]);if b is error then return b end if
              low=pair[0];high=pair[1];if low>high then low=pair[1];high=pair[0] end if
              keys=keys+[[low,high]];lines=lines+[Line(a,b,faceIndex,triangle)]
            end if
          end if
        end for
      end for
    end if
  end for
  return Preview(lines,surfaces,triangles,truncated)
end function

/// Returns `wireframe(map,indexes,maxLines)` from `mq3.renderer.bsp_preview.allFaces`; earlier branches return `fail("invalid BSP object")`.
/// @param map Record providing `map.counts`.
/// @param maxLines Value forwarded as `maxLines` to `mq3.renderer.bsp_preview.wireframe`.
function allFaces(map,maxLines)
  if not validMap(map) then return fail("invalid BSP object") end if
  indexes=[];for index=0 to map.counts[13]-1 indexes=indexes+[index] end for
  return wireframe(map,indexes,maxLines)
end function

/// Returns `wireframe(map,faces,maxLines)` from `mq3.renderer.bsp_preview.visibleWireframe`; earlier branches return `faces`.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_preview.visibleFaces`.
/// @param leafIndexes Value forwarded as `leafIndexes` to `mq3.renderer.bsp_preview.visibleFaces`.
/// @param maxLines Value forwarded as `maxLines` to `mq3.renderer.bsp_preview.wireframe`.
function visibleWireframe(map,leafIndexes,maxLines)
  faces=visibleFaces(map,leafIndexes);if faces is error then return faces end if
  return wireframe(map,faces,maxLines)
end function
