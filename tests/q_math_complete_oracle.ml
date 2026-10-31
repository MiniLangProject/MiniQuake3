// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.fs as fs
struct Reader data offset end struct
function word(reader) value=n.readU32(reader.data,reader.offset);reader.offset=reader.offset+4;return value end function
function signed(reader) return n.i32(word(reader)) end function
function scalar(reader) return n.bitsFloat(word(reader)) end function
function same(actual,expected,label) if n.floatBits(actual)!=n.floatBits(expected) then return error(3903,label+" got="+str(actual)+" expected="+str(expected)) end if;return true end function
function exact(actual,expected,label) if actual!=expected then return error(3903,label+" got="+str(actual)+" expected="+str(expected)) end if;return true end function
function main(args)
 r=Reader(fs.readAllBytes(args[0]),0);exact(word(r),0x514d4332,"magic")
 exact(q.ClampChar(-500),signed(r),"ClampChar low");exact(q.ClampChar(500),signed(r),"ClampChar high");exact(q.ClampShort(-40000),signed(r),"ClampShort low");exact(q.ClampShort(40000),signed(r),"ClampShort high")
 exact(n.u32(q.ColorBytes3(1.0,0.5,0.0))&0x00ffffff,word(r),"ColorBytes3");exact(n.u32(q.ColorBytes4(1.0,0.5,0.0,1.0)),word(r),"ColorBytes4");exact(q.Q_log2(1),word(r),"Q_log2 1");exact(q.Q_log2(8),word(r),"Q_log2 8")
 same(q.AngleSubtract(10.0,350.0),scalar(r),"AngleSubtract");same(q.AngleMod(720.25),scalar(r),"AngleMod");same(q.AngleDelta(5.0,355.0),scalar(r),"AngleDelta");same(q.VectorLengthSquared([1.0,2.0,3.0]),scalar(r),"VectorLengthSquared");same(q.DistanceSquared([1.0,2.0,3.0],[4.0,6.0,3.0]),scalar(r),"DistanceSquared");same(q.Distance([1.0,2.0,3.0],[4.0,6.0,3.0]),scalar(r),"Distance")
 nc=q.NormalizeColor([1.0,2.0,3.0]);same(nc[0],scalar(r),"NormalizeColor max");for i=0 to 2 same(nc[1][i],scalar(r),"NormalizeColor "+str(i)) end for
 plane=q.PlaneFromPoints([0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]);exact(1,word(r),"PlaneFromPoints result");for i=0 to 3 same(plane[i],scalar(r),"PlaneFromPoints "+str(i)) end for
 cp=q.Plane([1.0,0.0,0.0],0.0,3,0);exact(q.SetPlaneSignbits(cp),word(r),"SetPlaneSignbits");exact(q.BoxOnPlaneSide([-1.0,-1.0,-1.0],[1.0,1.0,1.0],cp),word(r),"BoxOnPlaneSide")
 same(q.RadiusFromBounds([-3.0,-4.0,-12.0],[1.0,2.0,3.0]),scalar(r),"RadiusFromBounds");projected=q.ProjectPointOnPlane([1.0,2.0,3.0],[0.0,0.0,1.0]);for i=0 to 2 same(projected[i],scalar(r),"ProjectPointOnPlane "+str(i)) end for
 rotated=q.RotatePointAroundVector([0.0,0.0,1.0],[1.0,0.0,0.0],90.0);for i=0 to 2 same(rotated[i],scalar(r),"RotatePointAroundVector "+str(i)) end for
 exact(q.DirToByte(q.ByteToDir(52)),word(r),"DirToByte");direction=q.ByteToDir(52);for i=0 to 2 same(direction[i],scalar(r),"ByteToDir "+str(i)) end for
 exact(r.offset,len(r.data),"oracle consumption");print "PASS: 36 exact q_math completion observations from unchanged C";return 0
end function
