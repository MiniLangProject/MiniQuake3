// SPDX-License-Identifier: GPL-2.0-or-later
// Pure numerical filter for the unlimited-budget retained world path.
package mq3.renderer.native_world_selection
import mq3.compat.numeric as n
extern function storeNative(records as ptr,bytes as i32,index as i32,kind as i32,triangles as i32,x as double,y as double,z as double,radius as double,nx as double,ny as double,nz as double) from "miniquake3_qvm.dll" symbol "mq3_world_store_face" returns i32
extern function cullModeNative(records as ptr,bytes as i32,index as i32,mode as i32) from "miniquake3_qvm.dll" symbol "mq3_world_set_cull_mode" returns i32
extern function filterNative(records as ptr,recordBytes as i32,faceCount as i32,visible as ptr,visibleBytes as i32,visibleCount as i32,output as ptr,outputBytes as i32,previous as ptr,previousBytes as i32,x as double,y as double,z as double,fx as double,fy as double,fz as double,rx as double,ry as double,rz as double,ux as double,uy as double,uz as double,nearDistance as double,farDistance as double,slopeX as double,slopeY as double,radiusScaleX as double,radiusScaleY as double,backfaceCull as i32) from "miniquake3_qvm.dll" symbol "mq3_world_filter" returns i32
function store(records,index,kind,triangles,center,radius,normal) return storeNative(nativeBytesPtr(records),len(records),index,kind,triangles,center[0],center[1],center[2],radius,normal[0],normal[1],normal[2]) end function
function setCullMode(records,index,mode) return cullModeNative(nativeBytesPtr(records),len(records),index,mode) end function
function packIndexes(indexes)
  result=bytes(len(indexes)*4,0);if len(indexes)>0 then for index=0 to len(indexes)-1 n.writeU32(result,index*4,indexes[index]) end for end if;return result
end function
function filter(cache,visible,camera,cfg,axes,frustum)
  cull=0;if cfg.backfaceCull then cull=1 end if
  return filterNative(nativeBytesPtr(cache.nativeFaces),len(cache.nativeFaces),cache.map.counts[13],nativeBytesPtr(visible),len(visible),len(visible)/4,nativeBytesPtr(cache.nativeOutput),len(cache.nativeOutput),nativeBytesPtr(cache.nativePrevious),len(cache.nativePrevious),camera.position[0],camera.position[1],camera.position[2],axes[0][0],axes[0][1],axes[0][2],axes[1][0],axes[1][1],axes[1][2],axes[2][0],axes[2][1],axes[2][2],cfg.nearDistance,cfg.farDistance,frustum.slopeX,frustum.slopeY,frustum.radiusScaleX,frustum.radiusScaleY,cull)
end function
