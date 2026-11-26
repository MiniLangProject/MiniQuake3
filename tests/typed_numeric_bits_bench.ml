// Repeated bit and binary32 wrappers for baseline/candidate compiler comparisons.
// The source and input sequence remain identical across both builds.
import mq3.compat.numeric as n

function main(args)
  if len(args)!=2 then return 2 end if
  operation=args[0];iterations=toNumber(args[1]);checksum=0
  if iterations<1 then return 2 end if
  if operation=="isNaNBits" then
    values=[0,0x7f800000,0x7fc12345,0xffc12345,0x3f800000]
    for index=0 to iterations-1
      if n.isNaNBits(values[index%5]) then checksum=checksum+index%97 end if
    end for
  else if operation=="mantissa" then
    values=[0,0x7f800000,0x7fc12345,0xffc12345,0x3f800000]
    for index=0 to iterations-1 checksum=n.u32(checksum+n.mantissa(values[index%5])) end for
  else if operation=="exponent" then
    values=[0,0x7f800000,0x7fc12345,0xffc12345,0x3f800000]
    for index=0 to iterations-1 checksum=checksum+n.exponent(values[index%5]) end for
  else if operation=="fadd" then
    value=0.0
    for index=0 to iterations-1 value=n.fadd(value,0.125);if value>=100.0 then value=0.0 end if end for
    checksum=n.floatBits(value)
  else if operation=="bitsFloat" then
    value=0x3f800000
    for index=0 to iterations-1 value=n.floatBits(n.bitsFloat(value)) end for
    checksum=value
  else if operation=="floatBits" then
    value=1.0
    for index=0 to iterations-1 checksum=n.u32(checksum+n.floatBits(value));value=n.fadd(value,0.125);if value>=2.0 then value=1.0 end if end for
  else return 2
  end if
  print "checksum="+str(checksum)
  return 0
end function
