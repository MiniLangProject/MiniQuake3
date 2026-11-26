// Compare the same DotProduct workload with frozen baseline/current math.ml.
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=2 or args[0]!="dot" then return 2 end if
  iterations=toNumber(args[1]);if iterations<1 then return 2 end if
  a=[0.0,2.5,-3.75];b=[0.125,-4.0,7.25];sum=0.0
  for index=0 to iterations-1
    a[0]=(index&1023)*0.0009765625
    sum=sum+qmath.DotProduct(a,b)
  end for
  print "checksum="+str(numeric.floatBits(sum))
  return 0
end function
