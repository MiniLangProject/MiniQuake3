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

/// Data record for `mq3.renderer.world_patch_lod.WorldLodPatch`; groups `face`, `texture`, `lightmap`, `fog`, `grid`, `variants`.
struct WorldLodPatch
  /// Source BSP face index identifying this patch.
  face
  /// BSP shader index assigned to the patch surface.
  texture
  /// BSP lightmap index assigned to the patch, or a negative no-lightmap selector.
  lightmap
  /// Renderer fog index for this patch; zero means no fog volume.
  fog
  /// Tessellated curved-patch grid and its detail-selection data.
  grid
  /// Cached tessellation variants for different patch detail thresholds.
  variants
end struct
/// Data record for `mq3.renderer.world_patch_lod.WorldPatchGrid`; groups `control`, `width`, `height`, `widthLodError`, `heightLodError`, `lodOrigin`, and 3 further fields.
struct WorldPatchGrid
  /// Original control-point grid retained for patch retessellation.
  control
  /// Number of columns in the patch vertex grid.
  width
  /// Number of rows in the patch vertex grid.
  height
  /// Per-column geometric error used when selecting patch detail.
  widthLodError
  /// Per-row geometric error used when selecting patch detail.
  heightLodError
  /// Reference origin used when evaluating patch level of detail.
  lodOrigin
  /// Reference radius used when evaluating patch level of detail.
  lodRadius
  /// Whether patch edge detail has been reconciled with neighboring patches.
  lodFixed
  /// Whether the patch grid has been stitched to adjacent geometry.
  lodStitched
end struct
/// Data record for `mq3.renderer.world_patch_lod.WorldLodVariant`; groups `minimum`, `face`.
struct WorldLodVariant
  /// Minimum geometric error or detail threshold represented by this variant.
  minimum
  /// Prepared face geometry for this patch level-of-detail variant.
  face
end struct
/// Data record for `mq3.renderer.world_patch_lod.WorldLodAxis`; groups `minimum`, `columns`, `rows`.
struct WorldLodAxis
  /// Minimum geometric error or detail threshold represented by this variant.
  minimum
  /// Indices of grid columns retained for this level-of-detail threshold.
  columns
  /// Indices of grid rows retained for this level-of-detail threshold.
  rows
end struct

/// Creates error `7490` with message `"World patch LOD: "+message`.
/// @param message Input used in the result expression `error(7490,"World patch LOD: "+message)`.
function fail(message) return error(7490,"World patch LOD: "+message) end function

/// Builds `mq3.renderer.world_patch_lod.WorldLodPatch` after updating `first[axis]`, `origin[axis]`.
/// @param map Record providing `map.data`, `map.counts`.
/// @param face Initial value for `mq3.renderer.world_patch_lod.WorldLodPatch.face`.
/// @param faceOffset Argument 2 supplied to `mq3.renderer.bsp_render_data.patchGrid`.
/// @param texture Initial value for `mq3.renderer.world_patch_lod.WorldLodPatch.texture`.
/// @param patchError Argument 3 supplied to `mq3.renderer.bsp_render_data.patchGrid`.
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

/// Builds `grid.control` in `mq3.renderer.world_patch_lod.stitch`; returns `true`.
/// @param patches Sequence traversed as `patch` while producing this result.
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

/// Computes `left<right` for `mq3.renderer.world_patch_lod.before`.
/// @param left Input used in the result expression `left<right`.
/// @param right Input used in the result expression `left<right`.
function before(left,right) return left<right end function
/// Collects positive interior LOD-error values into the supplied threshold list.
/// @param values Indexed input read at `index`.
/// @param size Input tested by `size>2`.
/// @param thresholds Record providing `thresholds.add`.
function addThresholds(values,size,thresholds)
  if size>2 then for index=1 to size-2
    if values[index]>0.0 then thresholds.add(values[index]) end if
  end for end if
end function
/// Returns `selected.toArray()` from `mq3.renderer.world_patch_lod.selectAxis`.
/// @param size Argument 1 supplied to `std.ds.list.List.withCapacity`.
/// @param errors Indexed input read at `index`.
/// @param threshold Input tested by `size>2`.
function selectAxis(size,errors,threshold)
  selected=lists.List.withCapacity(size);selected.add(0)
  if size>2 then for index=1 to size-2 if errors[index]<=threshold then selected.add(index) end if end for end if
  selected.add(size-1)
  return selected.toArray()
end function
/// Computes `axes` from `variants.toArray()` using `std.ds.list.List.withCapacity`, `thresholds.add`, `mq3.renderer.world_patch_lod.addThresholds`.
/// @param grid Record providing `grid.width`, `grid.height`, `grid.widthLodError`, `grid.heightLodError`.
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

/// Computes `triangles` from `result.toArray()` using `std.ds.list.List.withCapacity`, `mq3.renderer.bsp_render_data.appendPatchGrid`, `result.toArray`.
/// @param patch Record providing `patch.grid`, `patch.texture`, `patch.lightmap`, `patch.fog`.
/// @param variant Record providing `variant.columns`, `variant.rows`.
/// @param face Argument 9 supplied to `mq3.renderer.bsp_render_data.appendPatchGrid`.
function triangles(patch,variant,face)
  grid=patch.grid
  count=(len(variant.columns)-1)*(len(variant.rows)-1)*2
  result=lists.List.withCapacity(count)
  generated=render.appendPatchGrid(result,grid.control,grid.width,variant.columns,variant.rows,patch.texture,patch.lightmap,patch.fog,face,count)
  if generated[1] or generated[0]!=count then return fail("patch variant exceeded its topology bounds") end if
  return result.toArray()
end function

/// Computes `select` from `patch.variants[0].face` using `mq3.compat.numeric.fsub`, `mq3.shared.math.DotProduct`, `mq3.compat.numeric.fneg`.
/// @param patch Record providing `patch.variants`, `patch.face`, `patch.grid`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param forward Argument 2 supplied to `mq3.shared.math.DotProduct`.
/// @param curveError Argument 1 supplied to `mq3.compat.numeric.fdiv`.
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
