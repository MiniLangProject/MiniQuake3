import mq3.compat.numeric as n
import mq3.shared.math as q
function main(args)
  bits = toNumber(args[0])
  number = n.bitsFloat(bits)
  print typeof(number)
  print "toFloat " + str(toFloat(number))
  print "direct " + str(n.mq3_float_bits(number))
  print "number " + str(number) + " bits " + str(n.floatBits(number))
  x2 = n.fmul(number, 0.5)
  i = 0x5f3759df - (n.i32(n.floatBits(number)) >> 1)
  y = n.bitsFloat(i)
  print "x2 " + str(x2) + " i " + str(i) + " y " + str(y)
  prod = n.fmul(x2, y)
  print "prod " + str(prod)
  prod2 = n.fmul(prod,y)
  print "prod2 " + str(prod2)
  sub = n.fsub(1.5, prod2)
  print "sub " + str(sub)
  print "rsqrt " + str(q.Q_rsqrt(number))
  return 0
end function
