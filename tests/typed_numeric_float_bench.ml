// Identical workload across baseline and typed MiniLang numeric wrappers.
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=2 then return 2 end if
  operation=args[0];iterations=toNumber(args[1]);value=1.25
  if iterations<1 then return 2 end if
  if operation=="f32" then
    for i=0 to iterations-1 value=numeric.f32(value+0.125) end for
  else if operation=="fadd" then
    for i=0 to iterations-1 value=numeric.fadd(value,0.125) end for
  else if operation=="fsub" then
    for i=0 to iterations-1 value=numeric.fsub(value,0.0625) end for
  else if operation=="fmul" then
    for i=0 to iterations-1 value=numeric.fmul(value,1.0000001192092896) end for
  else if operation=="floatBits" then
    for i=0 to iterations-1 value=numeric.bitsFloat(numeric.floatBits(value)) end for
  else if operation=="types" then
    values=[numeric.f32(7),numeric.fadd(3,4),numeric.fsub(3,4),numeric.fmul(3,4),numeric.fdiv(4,2),numeric.fsqrt(4),numeric.dot3(1,2,3,4,5,6),numeric.bitsFloat(0),numeric.fneg(0)]
    for each item in values if typeof(item)!="float" then return 5 end if end for
    if typeof(numeric.floatBits(0))!="int" or typeof(numeric.trunc32(7))!="int" then return 6 end if
    print "checksum=tags-pass"
    return 0
  else if operation=="errors" then
    first=try(numeric.f32("bad"));second=try(numeric.fsub("bad",1))
    third=try(numeric.floatBits("bad"))
    if not (first is error and second is error and third is error) then return 3 end if
    print "checksum="+str(first.code)+":"+str(second.code)+":"+str(third.code)
    return 0
  else return 2 end if
  if typeof(value)!="float" then return 4 end if
  print "checksum="+str(numeric.floatBits(value))
  return 0
end function
