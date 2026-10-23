import mq3.shared.q_shared_header as h
import mq3.compat.numeric as n
function main(args)
  f=n.f32(1.2345);a=[1.25,-2.5,3.75];b=[-4.0,5.5,6.25];cross=h.CrossProduct(a,b);inverse=[1.25,-2.5,3.75];fast=[3.0,4.0,12.0];h.VectorInverse(inverse);h.VectorNormalizeFast(fast)
  print("endian "+str(h.BigShort(0x1234))+" "+str(h.LittleShort(0x1234))+" "+str(h.BigLong(0x12345678))+" "+str(h.LittleLong(0x12345678))+" "+str(n.floatBits(h.BigFloat(f)))+" "+str(n.floatBits(h.LittleFloat(f))))
  print("cross "+str(n.floatBits(cross[0]))+" "+str(n.floatBits(cross[1]))+" "+str(n.floatBits(cross[2])))
  print("metric "+str(n.floatBits(h.VectorLength(a)))+" "+str(n.floatBits(h.VectorLengthSquared(a)))+" "+str(n.floatBits(h.Distance(a,b)))+" "+str(n.floatBits(h.DistanceSquared(a,b)))+" "+str(n.floatBits(h.Q_fabs(-3.5))))
  equal=0;if h.VectorCompare(a,a) then equal=1 end if
  print("misc "+str(equal)+" "+str(n.floatBits(h.Q_rsqrt(9.0)))+" "+str(n.floatBits(inverse[0]))+" "+str(n.floatBits(inverse[1]))+" "+str(n.floatBits(inverse[2]))+" "+str(n.floatBits(fast[0]))+" "+str(n.floatBits(fast[1]))+" "+str(n.floatBits(fast[2])))
  return 0
end function
