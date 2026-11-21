// SPDX-License-Identifier: GPL-2.0-or-later
// Camera-selected BSP patch variants for the retained world renderer.
package mq3.renderer.world_patch_lod

import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.renderer.bsp_render_data as render
import mq3.renderer.patch_stitch as patchStitch
import std.ds.hashmap as maps
import std.ds.list as lists
import std.sort as sorting

struct WorldLodPatch face texture lightmap fog grid variants end struct
struct WorldPatchGrid control width height widthLodError heightLodError lodOrigin lodRadius lodFixed lodStitched end struct
struct WorldLodVariant minimum face end struct
struct WorldLodAxis minimum columns rows end struct

function fail(message) return error(7490,"World patch LOD: "+message) end function

function read(map,face,faceOffset,texture,patchError)
  data=render.patchGrid(map,faceOffset,patchError);if data is error then return data end if
  lightmap=n.readI32(map.data,faceOffset+28);fog=n.readI32(map.data,faceOffset+4)
  if lightmap is error or fog is error or lightmap< -1 or lightmap>=map.counts[14] then return fail("invalid patch lightmap or fog") end if
  first=array(3,0.0);origin=array(3,0.0)
  for axis=0 to 2
    low=n.readU32(map.data,faceOffset+60+axis*4);high=n.readU32(map.data,faceOffset+72+axis*4)
    if low is error or high is error then return fail("invalid patch LOD bounds") end if
    first[axis]=n.bitsFloat(low);origin[axis]=n.fmul(n.fadd(first[axis],n.bitsFloat(high)),0.5)
  end for
  radius=n.fsqrt(qmath.DistanceSquared(first,origin))
  grid=WorldPatchGrid(data[0],data[1],data[2],data[3],data[4],origin,radius,false,false)
  return WorldLodPatch(face,texture,lightmap,fog+1,grid,[])
end function

function stitch(patches)
  groups=maps.HashMap.new()
  for each patch in patches
    grid=patch.grid;key=bytes(16,0)
    for axis=0 to 2 n.writeU32(key,axis*4,n.floatBits(grid.lodOrigin[axis])) end for
    n.writeU32(key,12,n.floatBits(grid.lodRadius))
    group=groups.getOr(key,void)
    if group==void then group=lists.List.new();groups.set(key,group) end if
    group.add(grid)
  end for
  for each key in groups.keysArray()
    group=groups.getOr(key,void)
    if group.len()>1 then
      grids=group.toArray()
      if patchStitch.R_StitchAllPatches(grids)>0 then
        for each grid in grids grid.control=render.makeGridNormals(grid.control,grid.width,grid.height) end for
      end if
      patchStitch.R_FixSharedVertexLodError(grids)
    end if
  end for
  return true
end function

function before(left,right) return left<right end function
function addThresholds(values,size,thresholds)
  if size>2 then for index=1 to size-2
    if values[index]>0.0 then thresholds.add(values[index]) end if
  end for end if
end function
function selectAxis(size,errors,threshold)
  selected=lists.List.withCapacity(size);selected.add(0)
  if size>2 then for index=1 to size-2 if errors[index]<=threshold then selected.add(index) end if end for end if
  selected.add(size-1)
  return selected.toArray()
end function
function axes(grid)
  thresholds=lists.List.withCapacity(grid.width+grid.height);thresholds.add(0.0)
  addThresholds(grid.widthLodError,grid.width,thresholds)
  addThresholds(grid.heightLodError,grid.height,thresholds)
  ordered=thresholds.toArray();sorting.sortBy(ordered,before)
  variants=lists.List.withCapacity(len(ordered));last=-1.0
  for each minimum in ordered
    if minimum==last then continue end if
    columns=selectAxis(grid.width,grid.widthLodError,minimum)
    rows=selectAxis(grid.height,grid.heightLodError,minimum)
    variants.add(WorldLodAxis(minimum,columns,rows));last=minimum
  end for
  return variants.toArray()
end function

function triangles(patch,variant,face)
  grid=patch.grid
  count=(len(variant.columns)-1)*(len(variant.rows)-1)*2
  result=lists.List.withCapacity(count)
  generated=render.appendPatchGrid(result,grid.control,grid.width,variant.columns,variant.rows,patch.texture,patch.lightmap,patch.fog,face,count)
  if generated[1] or generated[0]!=count then return fail("patch variant exceeded its topology bounds") end if
  return result.toArray()
end function

function select(patch,position,forward,curveError)
  if len(patch.variants)==0 then return patch.face end if
  // World patches have the identity entity transform. Compare distance
  // along the view axis, matching LodErrorForVolume rather than using length.
  value=0.0
  if curveError>0.0 then
    origin=patch.grid.lodOrigin
    delta=[n.fsub(origin[0],position[0]),n.fsub(origin[1],position[1]),n.fsub(origin[2],position[2])]
    distance=qmath.DotProduct(delta,forward);if distance<0.0 then distance=n.fneg(distance) end if
    distance=n.fsub(distance,patch.grid.lodRadius);if distance<1.0 then distance=1.0 end if
    value=n.fdiv(curveError,distance)
  end if
  selected=patch.variants[0].face
  for each variant in patch.variants
    if value<variant.minimum then break end if;selected=variant.face
  end for
  return selected
end function
