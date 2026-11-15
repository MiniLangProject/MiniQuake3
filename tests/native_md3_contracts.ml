// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.renderer.surface_md3 as mesh
import mq3.renderer.native_md3 as nativeMd3
import mq3.renderer.view_math as viewMath
import mq3.compat.numeric as n
function checkVector(actual,wanted,label)
  for axis=0 to 2 if n.floatBits(actual[axis])!=n.floatBits(wanted[axis]) then return error(7371,label+" axis="+str(axis)+" actual="+str(n.floatBits(actual[axis]))+" expected="+str(n.floatBits(wanted[axis]))) end if end for;return 1
end function
function main(args)
  count=0;size=128;frames=[array(size,void),array(size,void)];tex=array(size,[0.0,0.0])
  for frame=0 to 1 for index=0 to size-1 frames[frame][index]=mesh.vertex((index*7919+frame*137)%65536,(index*1543-frame*217)%65536,(index*4793+frame*3571)%65536,(index*509+frame*8191)&65535) end for end for
  value=mesh.surface(2,size,0,[],tex,frames);table=mesh.normalTable();packedTable=nativeMd3.tableBytes(table)
  origin=[123.25,-400.5,0.03125];axes=[[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[[0.0,-1.0,0.0],[1.0,0.0,0.0],[0.0,0.0,1.0]],[[1.25,0.37,-0.125],[-0.5,2.0,0.75],[0.33,-0.2,0.8]]]
  for each back in [0.0,0.125,0.25,0.5,0.75,1.0,0.12345678]
    expected=mesh.lerpVertexesCached(value,1,0,back,table);packed=mesh.lerpVertexesPacked(value,1,0,back,packedTable);actual=nativeMd3.unpack(packed,size)
    for index=0 to size-1
      count=count+checkVector(actual[0][index],expected[0][index],"interpolated position")+checkVector(actual[1][index],expected[1][index],"interpolated normal")
    end for
    for each axis in axes
      transformed=nativeMd3.unpack(nativeMd3.transform(packed,size,origin,axis),size);orientation=viewMath.orientation(origin,axis)
      for index=0 to size-1
        count=count+checkVector(transformed[0][index],viewMath.localPointToWorld(expected[0][index],orientation),"world position")+checkVector(transformed[1][index],viewMath.localNormalToWorld(expected[1][index],orientation),"world normal")
      end for
    end for
  end for
  print "PASS: "+str(count)+" native MD3 exact vector contracts";return 0
end function
