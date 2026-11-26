// SPDX-License-Identifier: GPL-2.0-or-later
// Pure numerical filter for the unlimited-budget retained world path.
package mq3.renderer.native_world_selection
import mq3.compat.numeric as n
/// Stores bounds, normal, kind, and triangle count in one 72-byte native world-face record.
/// @param records Writable packed world-face array with 72-byte records.
/// @param bytes Total capacity of records in bytes.
/// @param index Zero-based record index; (index + 1) * 72 must fit.
/// @param kind BSP face kind stored without reinterpretation.
/// @param triangles Nonnegative triangle count for this face.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @param z Z component of the position.
/// @param radius Bounding-sphere radius stored for this face.
/// @param nx X component of the face normal.
/// @param ny Y component of the face normal.
/// @param nz Z component of the face normal.
/// @returns 1 when written; 0 for invalid pointers, record bounds, or triangle count.
extern function storeNative(records as ptr,bytes as i32,index as i32,kind as i32,triangles as i32,x as double,y as double,z as double,radius as double,nx as double,ny as double,nz as double) from "miniquake3_qvm.dll" symbol "mq3_world_store_face" returns i32
/// Writes the culling mode at byte offset 64 of a 72-byte native world-face record.
/// @param records Writable packed world-face array with 72-byte records.
/// @param bytes Total capacity of records in bytes.
/// @param index Zero-based face-record index.
/// @param mode Cull selector: 0 front-side convention, 1 two-sided, or 2 reversed convention.
/// @returns 1 when written; 0 for an invalid record or a mode outside 0..2.
extern function cullModeNative(records as ptr,bytes as i32,index as i32,mode as i32) from "miniquake3_qvm.dll" symbol "mq3_world_set_cull_mode" returns i32
/// Filters visible BSP face indices by distance, frustum, and backface tests, then updates selection statistics and history.
/// @param records Read-only 72-byte world-face records.
/// @param recordBytes Size of the packed face-record buffer in bytes.
/// @param faceCount Number of 72-byte face records available for selection.
/// @param visible Packed 32-bit visible face indices.
/// @param visibleBytes Size of the packed visible-index buffer in bytes.
/// @param visibleCount Number of 32-bit face indices in the visible buffer.
/// @param output Writable selection record: 32-byte statistics header followed by 32-bit selected indices.
/// @param outputBytes Capacity of the native output buffer in bytes.
/// @param previous Writable prior-selection record used to detect unchanged selections and then replaced with the current result.
/// @param previousBytes Capacity of the previous-selection buffer in bytes.
/// @param x X component of the position.
/// @param y Y component of the position.
/// @param z Z component of the position.
/// @param fx X component of the camera forward axis.
/// @param fy Y component of the camera forward axis.
/// @param fz Z component of the camera forward axis.
/// @param rx X component of the camera right axis.
/// @param ry Y component of the camera right axis.
/// @param rz Z component of the camera right axis.
/// @param ux X component of the camera up axis.
/// @param uy Y component of the camera up axis.
/// @param uz Z component of the camera up axis.
/// @param nearDistance Near clipping distance in camera-space units.
/// @param farDistance Far clipping distance in camera-space units.
/// @param slopeX Horizontal frustum slope used by the sphere-plane test.
/// @param slopeY Vertical frustum slope used by the sphere-plane test.
/// @param radiusScaleX Horizontal frustum-plane normal length used to expand by radius.
/// @param radiusScaleY Vertical frustum-plane normal length used to expand by radius.
/// @param backfaceCull Nonzero enables per-face backface rejection.
/// @returns 1 when selection completes; 0 for invalid buffers/indices or triangle-count overflow.
extern function filterNative(records as ptr,recordBytes as i32,faceCount as i32,visible as ptr,visibleBytes as i32,visibleCount as i32,output as ptr,outputBytes as i32,previous as ptr,previousBytes as i32,x as double,y as double,z as double,fx as double,fy as double,fz as double,rx as double,ry as double,rz as double,ux as double,uy as double,uz as double,nearDistance as double,farDistance as double,slopeX as double,slopeY as double,radiusScaleX as double,radiusScaleY as double,backfaceCull as i32) from "miniquake3_qvm.dll" symbol "mq3_world_filter" returns i32
/// Calls `mq3.renderer.native_world_selection.storeNative` with `(nativeBytesPtr(records),len(records),index,kind,triangles,center[0],center[1],center[2],radius,normal[0],normal[1],normal[2])` and returns its result.
/// @param records Input used in the result expression `storeNative(nativeBytesPtr(records),len(records),index,kind,triangles,center[0],center[1],center[2],radius,normal[0],normal[1],normal[2])`.
/// @param index Value forwarded as `index` to `mq3.renderer.native_world_selection.storeNative`.
/// @param kind Value forwarded as `kind` to `mq3.renderer.native_world_selection.storeNative`.
/// @param triangles Value forwarded as `triangles` to `mq3.renderer.native_world_selection.storeNative`.
/// @param center Three-component vector read at indices 0, 1, and 2.
/// @param radius Value forwarded as `radius` to `mq3.renderer.native_world_selection.storeNative`.
/// @param normal Three-component vector read at indices 0, 1, and 2.
function store(records,index,kind,triangles,center,radius,normal) return storeNative(nativeBytesPtr(records),len(records),index,kind,triangles,center[0],center[1],center[2],radius,normal[0],normal[1],normal[2]) end function
/// Calls `mq3.renderer.native_world_selection.cullModeNative` with `(nativeBytesPtr(records),len(records),index,mode)` and returns its result.
/// @param records Input used in the result expression `cullModeNative(nativeBytesPtr(records),len(records),index,mode)`.
/// @param index Value forwarded as `index` to `mq3.renderer.native_world_selection.cullModeNative`.
/// @param mode Value forwarded as `mode` to `mq3.renderer.native_world_selection.cullModeNative`.
function setCullMode(records,index,mode) return cullModeNative(nativeBytesPtr(records),len(records),index,mode) end function
/// Returns `result` from `mq3.renderer.native_world_selection.packIndexes`.
/// @param indexes Indexed input read at `index`.
function packIndexes(indexes)
  result=bytes(len(indexes)*4,0);if len(indexes)>0 then for index=0 to len(indexes)-1 n.writeU32(result,index*4,indexes[index]) end for end if;return result
end function
/// Runs native world-face selection using cached bounds, visible face indices, camera axes, and frustum settings.
/// @param cache Record providing `cache.nativeFaces`, `cache.map`, `cache.nativeOutput`, `cache.nativePrevious`.
/// @param visible Packed little-endian 32-bit visible face indices.
/// @param camera Record providing `camera.position`.
/// @param cfg Record providing `cfg.backfaceCull`, `cfg.nearDistance`, `cfg.farDistance`.
/// @param axes Nested indexed data; outer entries read at `0`, `1`, `2`.
/// @param frustum Record providing `frustum.slopeX`, `frustum.slopeY`, `frustum.radiusScaleX`, `frustum.radiusScaleY`.
function filter(cache,visible,camera,cfg,axes,frustum)
  cull=0;if cfg.backfaceCull then cull=1 end if
  return filterNative(nativeBytesPtr(cache.nativeFaces),len(cache.nativeFaces),cache.map.counts[13],nativeBytesPtr(visible),len(visible),len(visible)/4,nativeBytesPtr(cache.nativeOutput),len(cache.nativeOutput),nativeBytesPtr(cache.nativePrevious),len(cache.nativePrevious),camera.position[0],camera.position[1],camera.position[2],axes[0][0],axes[0][1],axes[0][2],axes[1][0],axes[1][1],axes[1][2],axes[2][0],axes[2][1],axes[2][2],cfg.nearDistance,cfg.farDistance,frustum.slopeX,frustum.slopeY,frustum.radiusScaleX,frustum.radiusScaleY,cull)
end function
