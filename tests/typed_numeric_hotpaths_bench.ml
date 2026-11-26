// Isolated integer-width workload for function-contract / inline comparisons.
// Keep this fixture identical between candidate builds; only numeric.ml varies.
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=2 then print "usage: typed_numeric_hotpaths_bench <u32|i32|add32|mul32> <iterations>";return 2 end if
  operation=args[0];iterations=toNumber(args[1]);value=0x12345678
  if iterations<1 then return 2 end if
  if operation=="u32" then
    for index=0 to iterations-1 value=numeric.u32(value+index+0x9e37) end for
  end if
  if operation=="i32" then
    for index=0 to iterations-1 value=numeric.i32(value+index+0x9e37) end for
  end if
  if operation=="add32" then
    for index=0 to iterations-1 value=numeric.add32(value,index+0x9e37) end for
  end if
  if operation=="mul32" then
    for index=0 to iterations-1 value=numeric.mul32(value,1664525) end for
  end if
  if operation!="u32" and operation!="i32" and operation!="add32" and operation!="mul32" then return 2 end if
  print "checksum="+str(value)
  return 0
end function
