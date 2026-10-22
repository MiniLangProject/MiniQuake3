// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.shared.math as q
import mq3.compat.numeric as n

function check(condition,label)
  if not condition then return error(3902,label) end if
  return true
end function
function close(a,b,tolerance,label) return check(q.Q_fabs(a-b)<=tolerance,label) end function
function vectorClose(a,b,tolerance,label)
  check(len(a)==len(b),label+" length")
  for i=0 to len(a)-1 close(a[i],b[i],tolerance,label+" "+str(i)) end for
  return true
end function
function main(args)
  check(q.ClampChar(-500)==-128,"ClampChar low");check(q.ClampChar(500)==127,"ClampChar high");check(q.ClampShort(-40000)==-32768,"ClampShort low");check(q.ClampShort(40000)==32767,"ClampShort high")
  check(q.VectorCompare([1.0,2.0,3.0],[1.0,2.0,3.0]),"VectorCompare yes");check(not q.VectorCompare([1.0,2.0,3.0],[1.0,2.0,4.0]),"VectorCompare no")
  close(q.VectorLengthSquared([2.0,3.0,6.0]),49.0,0.00001,"VectorLengthSquared");close(q.Distance([0.0,0.0,0.0],[2.0,3.0,6.0]),7.0,0.00001,"Distance");close(q.DistanceSquared([1.0,2.0,3.0],[4.0,6.0,3.0]),25.0,0.00001,"DistanceSquared")
  inv=[1.0,-2.0,3.0];q.VectorInverse(inv);vectorClose(inv,[-1.0,2.0,-3.0],0.0,"VectorInverse")
  fast=[1.0,0.0,0.0];q.VectorNormalizeFast(fast);close(fast[0],q.Q_rsqrt(1.0),0.000001,"VectorNormalizeFast")
  check(q.ByteToDir(-1)==[0.0,0.0,0.0],"ByteToDir invalid");check(q.DirToByte(q.ByteToDir(52))==52,"direction roundtrip")
  check(q.ColorBytes3(1.0,0.5,0.0)==0x00007fff,"ColorBytes3");check(n.u32(q.ColorBytes4(1.0,0.5,0.0,1.0))==0xff007fff,"ColorBytes4")
  normalized=q.NormalizeColor([2.0,1.0,0.5]);close(normalized[0],2.0,0.0,"NormalizeColor max");vectorClose(normalized[1],[1.0,0.5,0.25],0.0,"NormalizeColor vector")
  plane=q.PlaneFromPoints([0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]);check(plane!=void,"PlaneFromPoints valid");close(q.Q_fabs(plane[2]),1.0,0.00001,"PlaneFromPoints normal");check(q.PlaneFromPoints([0.0,0.0,0.0],[1.0,0.0,0.0],[2.0,0.0,0.0])==void,"PlaneFromPoints degenerate")
  identity=q.AxisClear();vectorClose(q.VectorRotate([2.0,3.0,4.0],identity),[2.0,3.0,4.0],0.0,"VectorRotate")
  copied=q.AxisCopy(identity);check(copied==identity,"AxisCopy");check(q.AnglesToAxis([0.0,0.0,0.0])==identity,"AnglesToAxis")
  matrix=q.MatrixMultiply([[1.0,2.0,3.0],[4.0,5.0,6.0],[7.0,8.0,9.0]],identity);check(matrix==[[1.0,2.0,3.0],[4.0,5.0,6.0],[7.0,8.0,9.0]],"MatrixMultiply")
  vectorClose(q.ProjectPointOnPlane([1.0,2.0,3.0],[0.0,0.0,1.0]),[1.0,2.0,0.0],0.00001,"ProjectPointOnPlane")
  perpendicular=q.PerpendicularVector([1.0,0.0,0.0]);close(q.DotProduct(perpendicular,[1.0,0.0,0.0]),0.0,0.00001,"PerpendicularVector")
  normals=q.MakeNormalVectors([1.0,0.0,0.0]);close(q.DotProduct(normals[0],[1.0,0.0,0.0]),0.0,0.00001,"MakeNormalVectors right");close(q.DotProduct(normals[1],[1.0,0.0,0.0]),0.0,0.00001,"MakeNormalVectors up")
  vectorClose(q.RotatePointAroundVector([0.0,0.0,1.0],[1.0,0.0,0.0],90.0),[0.0,1.0,0.0],0.0001,"RotatePointAroundVector")
  rotated=q.RotateAroundDirection([[0.0,0.0,1.0],[0.0,0.0,0.0],[0.0,0.0,0.0]],90.0);close(q.DotProduct(rotated[0],rotated[1]),0.0,0.0001,"RotateAroundDirection")
  close(q.AngleSubtract(10.0,350.0),20.0,0.0,"AngleSubtract");check(q.AnglesSubtract([10.0,20.0,30.0],[350.0,30.0,20.0])==[20.0,-10.0,10.0],"AnglesSubtract");close(q.AngleMod(720.25),0.2471923828125,0.000001,"AngleMod");close(q.AngleDelta(5.0,355.0),10.0,0.01,"AngleDelta")
  p=q.Plane([-1.0,2.0,-3.0],4.0,3,0);check(q.SetPlaneSignbits(p)==5,"SetPlaneSignbits");check(q.BoxOnPlaneSide2([-1.0,-1.0,-1.0],[1.0,1.0,1.0],q.Plane([1.0,0.0,0.0],0.0,3,0))==3,"BoxOnPlaneSide2");check(q.BoxOnPlaneSide([-1.0,-1.0,-1.0],[1.0,1.0,1.0],q.Plane([1.0,0.0,0.0],2.0,0,0))==2,"BoxOnPlaneSide axial")
  close(q.RadiusFromBounds([-3.0,-4.0,-12.0],[1.0,2.0,3.0]),13.0,0.00001,"RadiusFromBounds");bounds=q.ClearBounds();q.AddPointToBounds([2.0,-4.0,8.0],bounds[0],bounds[1]);q.AddPointToBounds([-3.0,5.0,1.0],bounds[0],bounds[1]);check(bounds==[[-3.0,-4.0,1.0],[2.0,5.0,8.0]],"bounds")
  check(q._DotProduct([1.0,2.0,3.0],[4.0,5.0,6.0])==32.0,"_DotProduct");check(q._VectorAdd([1.0,2.0,3.0],[4.0,5.0,6.0])==[5.0,7.0,9.0],"_VectorAdd");check(q._VectorSubtract([4.0,5.0,6.0],[1.0,2.0,3.0])==[3.0,3.0,3.0],"_VectorSubtract");check(q._VectorCopy([1.0,2.0,3.0])==[1.0,2.0,3.0],"_VectorCopy");check(q._VectorScale([1.0,2.0,3.0],2.0)==[2.0,4.0,6.0],"_VectorScale");check(q._VectorMA([1.0,2.0,3.0],2.0,[4.0,5.0,6.0])==[9.0,12.0,15.0],"_VectorMA");check(q.Vector4Scale([1.0,2.0,3.0,4.0],0.5)==[0.5,1.0,1.5,2.0],"Vector4Scale")
  check(q.Q_log2(1)==0 and q.Q_log2(8)==3,"Q_log2");check(q.PlaneTypeForNormal([1.0,0.0,0.0])==0 and q.PlaneTypeForNormal([0.2,0.3,0.4])==3,"PlaneTypeForNormal")
  print "PASS: 51 complete q_math runtime contracts"
  return 0
end function
