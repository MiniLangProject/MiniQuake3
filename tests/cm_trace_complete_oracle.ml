// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.brush as brush
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

function vector(data,offset)
  return [n.bitsFloat(n.readU32(data,offset)),n.bitsFloat(n.readU32(data,offset+4)),n.bitsFloat(n.readU32(data,offset+8))]
end function
function main(args)
  input=fs.readAllBytes(args[0]);expected=fs.readAllBytes(args[1]);count=n.quotient(len(input),44)
  if len(input)!=count*44 or len(expected)!=count*40 then return 2 end if
  for index=0 to count-1
    offset=index*44;op=n.readI32(input,offset);a=vector(input,offset+4);b=vector(input,offset+16);c=vector(input,offset+28);scalar=n.bitsFloat(n.readU32(input,offset+40));values=[]
    if op==0 then values=brush.CM_ProjectPointOntoVector(a,b,c)
    else if op==1 then values=[brush.CM_DistanceFromLineSquared(a,b,c,c)]
    else if op==2 then values=[brush.CM_VectorDistanceSquared(a,b)]
    else if op==3 then values=[brush.SquareRootFloat(scalar)]
    else if op==4 then for each row in cm.rotationMatrix(a) values=values+row end for
    else if op==5 then values=cm.rotatePoint(a,cm.rotationMatrix(b))
    else for each row in cm.transpose([a,b,c]) values=values+row end for end if
    while len(values)<10 values=values+[0.0] end while
    for field=0 to 9
      if n.floatBits(values[field])!=n.readU32(expected,index*40+field*4) then
        print "FAIL cm_trace math case "+str(index)+" op "+str(op)+" field "+str(field)+" got "+str(n.floatBits(values[field]))+" wanted "+str(n.readU32(expected,index*40+field*4));return 1
      end if
    end for
  end for
  print "PASS: "+str(count)+" unchanged-C cm_trace math cases (10 exact fields each)"
  return 0
end function
