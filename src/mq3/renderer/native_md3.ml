// SPDX-License-Identifier: GPL-2.0-or-later
// Strict binary32 bulk arithmetic for MD3 interpolation and indexed transforms.
package mq3.renderer.native_md3
import mq3.compat.numeric as n
/// Interpolates MD3 frame vertices and normals into the native packed output buffer.
/// @param fresh Read-only MD3 current-frame vertices: 8 bytes per vertex.
/// @param freshBytes Size of the current-frame vertex buffer in bytes.
/// @param old Read-only MD3 previous-frame vertices: 8 bytes per vertex.
/// @param oldBytes Size of the previous-frame vertex buffer in bytes.
/// @param table Read-only packed 1024-entry float32 sine table.
/// @param tableBytes Sine-table storage size in bytes; must equal 4096.
/// @param output Writable records containing position XYZ then normal XYZ as six float32 values.
/// @param outputBytes Capacity of the native output buffer in bytes.
/// @param count Number of vertices to interpolate; output requires count * 24 bytes.
/// @param backlerp Finite previous-frame weight in 0..1; current-frame weight is 1 - backlerp.
/// @returns 1 when interpolation succeeds; 0 for rejected native input.
extern function lerpNative(fresh as ptr,freshBytes as i32,old as ptr,oldBytes as i32,table as ptr,tableBytes as i32,output as ptr,outputBytes as i32,count as i32,backlerp as double) from "miniquake3_qvm.dll" symbol "mq3_md3_lerp" returns i32
/// Transforms packed MD3 geometry using the supplied entity transform.
/// @param input Read-only 24-byte records containing position XYZ followed by normal XYZ.
/// @param inputBytes Input-buffer length in bytes.
/// @param output Writable 24-byte transformed position/normal records.
/// @param outputBytes Capacity of the native output buffer in bytes.
/// @param count Number of position/normal records to transform.
/// @param ox X component of the entity translation.
/// @param oy Y component of the entity translation.
/// @param oz Z component of the entity translation.
/// @param a00 Component 0 of transform basis axis 0.
/// @param a01 Component 1 of transform basis axis 0.
/// @param a02 Component 2 of transform basis axis 0.
/// @param a10 Component 0 of transform basis axis 1.
/// @param a11 Component 1 of transform basis axis 1.
/// @param a12 Component 2 of transform basis axis 1.
/// @param a20 Component 0 of transform basis axis 2.
/// @param a21 Component 1 of transform basis axis 2.
/// @param a22 Component 2 of transform basis axis 2.
/// @returns 1 when transformation succeeds; 0 for rejected native input.
extern function transformNative(input as ptr,inputBytes as i32,output as ptr,outputBytes as i32,count as i32,ox as double,oy as double,oz as double,a00 as double,a01 as double,a02 as double,a10 as double,a11 as double,a12 as double,a20 as double,a21 as double,a22 as double) from "miniquake3_qvm.dll" symbol "mq3_md3_transform" returns i32
/// Packs the 1024 normal-lookup values as little-endian float32 bytes for native MD3 interpolation.
/// @param table Indexed input read at `index`.
function tableBytes(table)
  if table==void or len(table)!=1024 then return error(7359,"MD3 native normal table has wrong length") end if
  data=bytes(4096,0);for index=0 to 1023 n.writeU32(data,index*4,n.floatBits(table[index])) end for;return data
end function
/// Allocates 24-byte output records and interpolates current/previous MD3 vertices through the checked native boundary.
/// @param fresh Current-frame MD3 vertices encoded as 8-byte records.
/// @param old Previous-frame MD3 vertices encoded as 8-byte records.
/// @param table Packed 1024-entry float32 sine table used to decode MD3 normals.
/// @param count Value forwarded as `count` to `mq3.renderer.native_md3.lerpNative`.
/// @param backlerp Value forwarded as `backlerp` to `mq3.renderer.native_md3.lerpNative`.
function lerp(fresh,old,table,count,backlerp)
  output=bytes(count*24,0)
  if lerpNative(nativeBytesPtr(fresh),len(fresh),nativeBytesPtr(old),len(old),nativeBytesPtr(table),len(table),nativeBytesPtr(output),len(output),count,backlerp)!=1 then return error(7359,"MD3 native interpolation rejected input") end if;return output
end function
/// Allocates transformed position/normal records and applies the supplied three-axis orientation and translation.
/// @param input Packed position/normal records, 24 bytes per vertex.
/// @param count Value forwarded as `count` to `mq3.renderer.native_md3.transformNative`.
/// @param origin Three-component vector read at indices 0, 1, and 2.
/// @param axis Three three-component basis vectors used for position and normal transformation.
function transform(input,count,origin,axis)
  output=bytes(count*24,0)
  if transformNative(nativeBytesPtr(input),len(input),nativeBytesPtr(output),len(output),count,origin[0],origin[1],origin[2],axis[0][0],axis[0][1],axis[0][2],axis[1][0],axis[1][1],axis[1][2],axis[2][0],axis[2][1],axis[2][2])!=1 then return error(7359,"MD3 native transform rejected input") end if;return output
end function
/// Decodes 24-byte native vertex records into separate position and normal arrays.
/// @param data Argument 1 supplied to `mq3.compat.numeric.readU32`.
/// @param count Argument 1 supplied to `array`.
function unpack(data,count)
  if data==void or len(data)!=count*24 then return error(7359,"MD3 native output has wrong length") end if
  positions=array(count,void);normals=array(count,void)
  for index=0 to count-1
    at=index*24;positions[index]=[n.bitsFloat(n.readU32(data,at)),n.bitsFloat(n.readU32(data,at+4)),n.bitsFloat(n.readU32(data,at+8))];normals[index]=[n.bitsFloat(n.readU32(data,at+12)),n.bitsFloat(n.readU32(data,at+16)),n.bitsFloat(n.readU32(data,at+20))]
  end for
  return [positions,normals]
end function
