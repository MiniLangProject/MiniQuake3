// SPDX-License-Identifier: GPL-2.0-or-later
// Independent integer algorithms stay the oracle for the native IEEE ABI.
import mq3.compat.numeric as n
import std.fs as fs
extern function addNative(a as u32,b as u32) from "miniquake3_abi.dll" symbol "mq3_fadd_bits" returns u32
extern function subNative(a as u32,b as u32) from "miniquake3_abi.dll" symbol "mq3_fsub_bits" returns u32
extern function mulNative(a as u32,b as u32) from "miniquake3_abi.dll" symbol "mq3_fmul_bits" returns u32
extern function divNative(a as u32,b as u32) from "miniquake3_abi.dll" symbol "mq3_fdiv_bits" returns u32
extern function sqrtNative(a as u32) from "miniquake3_abi.dll" symbol "mq3_fsqrt_bits" returns u32
function main(args)
  data=fs.readAllBytes(args[0]);count=n.quotient(len(data),28)
  if count*28!=len(data) then return error(490,"malformed binary32 fixture") end if
  for index=0 to count-1
    offset=index*28;a=n.readU32(data,offset);b=n.readU32(data,offset+4)
    expected=[n.addBits(a,b),n.subBits(a,b),n.mulBits(a,b),n.divBits(a,b),n.sqrtBits(a)]
    actual=[addNative(a,b),subNative(a,b),mulNative(a,b),divNative(a,b),sqrtNative(a)]
    for op=0 to 4
      if actual[op]!=expected[op] or n.readU32(data,offset+8+op*4)!=expected[op] then print "FAIL native binary32 case="+str(index)+" op="+str(op)+" a="+str(a)+" b="+str(b)+" got="+str(actual[op])+" expected="+str(expected[op]);return 1 end if
    end for
    fa=n.bitsFloat(a);fb=n.bitsFloat(b);ca=n.floatBits(fa);cb=n.floatBits(fb)
    floatExpected=[n.addBits(ca,cb),n.subBits(ca,cb),n.mulBits(ca,cb),n.divBits(ca,cb),n.sqrtBits(ca)]
    floatActual=[n.floatBits(n.fadd(fa,fb)),n.floatBits(n.fsub(fa,fb)),n.floatBits(n.fmul(fa,fb)),n.floatBits(n.fdiv(fa,fb)),n.floatBits(n.fsqrt(fa))]
    for op=0 to 4
      if floatActual[op]!=floatExpected[op] then print "FAIL native double ABI case="+str(index)+" op="+str(op)+" a="+str(a)+" b="+str(b)+" got="+str(floatActual[op])+" expected="+str(floatExpected[op]);return 1 end if
    end for
  end for
  print "PASS: "+str(count*10)+" software/native exact binary32 results (NaN payloads, signed zeros, subnormals, ties, overflow, invalid)"
  return 0
end function
