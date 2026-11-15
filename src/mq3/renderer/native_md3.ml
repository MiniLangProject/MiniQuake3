// SPDX-License-Identifier: GPL-2.0-or-later
// Strict binary32 bulk arithmetic for MD3 interpolation and indexed transforms.
package mq3.renderer.native_md3
import mq3.compat.numeric as n
extern function lerpNative(fresh as ptr,freshBytes as i32,old as ptr,oldBytes as i32,table as ptr,tableBytes as i32,output as ptr,outputBytes as i32,count as i32,backlerp as double) from "miniquake3_qvm.dll" symbol "mq3_md3_lerp" returns i32
extern function transformNative(input as ptr,inputBytes as i32,output as ptr,outputBytes as i32,count as i32,ox as double,oy as double,oz as double,a00 as double,a01 as double,a02 as double,a10 as double,a11 as double,a12 as double,a20 as double,a21 as double,a22 as double) from "miniquake3_qvm.dll" symbol "mq3_md3_transform" returns i32
function tableBytes(table)
  if table==void or len(table)!=1024 then return error(7359,"MD3 native normal table has wrong length") end if
  data=bytes(4096,0);for index=0 to 1023 n.writeU32(data,index*4,n.floatBits(table[index])) end for;return data
end function
function lerp(fresh,old,table,count,backlerp)
  output=bytes(count*24,0)
  if lerpNative(nativeBytesPtr(fresh),len(fresh),nativeBytesPtr(old),len(old),nativeBytesPtr(table),len(table),nativeBytesPtr(output),len(output),count,backlerp)!=1 then return error(7359,"MD3 native interpolation rejected input") end if;return output
end function
function transform(input,count,origin,axis)
  output=bytes(count*24,0)
  if transformNative(nativeBytesPtr(input),len(input),nativeBytesPtr(output),len(output),count,origin[0],origin[1],origin[2],axis[0][0],axis[0][1],axis[0][2],axis[1][0],axis[1][1],axis[1][2],axis[2][0],axis[2][1],axis[2][2])!=1 then return error(7359,"MD3 native transform rejected input") end if;return output
end function
function unpack(data,count)
  if data==void or len(data)!=count*24 then return error(7359,"MD3 native output has wrong length") end if
  positions=array(count,void);normals=array(count,void)
  for index=0 to count-1
    at=index*24;positions[index]=[n.bitsFloat(n.readU32(data,at)),n.bitsFloat(n.readU32(data,at+4)),n.bitsFloat(n.readU32(data,at+8))];normals[index]=[n.bitsFloat(n.readU32(data,at+12)),n.bitsFloat(n.readU32(data,at+16)),n.bitsFloat(n.readU32(data,at+20))]
  end for
  return [positions,normals]
end function
