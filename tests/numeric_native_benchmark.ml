// SPDX-License-Identifier: GPL-2.0-or-later
// End-to-end MiniLang primitive cost; the software algorithms remain separate.
import mq3.compat.numeric as n
extern function counter(output as bytes) from "kernel32.dll" symbol "QueryPerformanceCounter" returns i32
extern function frequency(output as bytes) from "kernel32.dll" symbol "QueryPerformanceFrequency" returns i32
function u64(data) return n.readU32(data,0)+n.readU32(data,4)*4294967296 end function
function elapsed(buffer,started,rate) counter(buffer);return (u64(buffer)-started)*1000.0/rate end function
function nativeOp(op,a,b)
  if op==0 then return n.fadd(a,b) end if
  if op==1 then return n.fsub(a,b) end if
  if op==2 then return n.fmul(a,b) end if
  if op==3 then return n.fdiv(a,b) end if
  return n.fsqrt(a)
end function
function softwareOp(op,a,b)
  if op==0 then return n.bitsFloat(n.addBits(n.floatBits(a),n.floatBits(b))) end if
  if op==1 then return n.bitsFloat(n.subBits(n.floatBits(a),n.floatBits(b))) end if
  if op==2 then return n.bitsFloat(n.mulBits(n.floatBits(a),n.floatBits(b))) end if
  if op==3 then return n.bitsFloat(n.divBits(n.floatBits(a),n.floatBits(b))) end if
  return n.bitsFloat(n.sqrtBits(n.floatBits(a)))
end function
function main(args)
  count=100000;values=array(256,0.0);others=array(256,0.0)
  for index=0 to 255 values[index]=n.bitsFloat(0x3e800001+index*123457);others[index]=n.bitsFloat(0x3f000003+index*31919) end for
  buffer=bytes(8,0);frequency(buffer);rate=u64(buffer);names=["add","sub","mul","div","sqrt"]
  for op=0 to 4
    checksumSoftware=0;checksumNative=0
    counter(buffer);started=u64(buffer)
    for index=0 to count-1 slot=index&255;checksumSoftware=checksumSoftware^n.floatBits(softwareOp(op,values[slot],others[slot])) end for
    softwareMs=elapsed(buffer,started,rate)
    counter(buffer);started=u64(buffer)
    for index=0 to count-1 slot=index&255;checksumNative=checksumNative^n.floatBits(nativeOp(op,values[slot],others[slot])) end for
    nativeMs=elapsed(buffer,started,rate)
    if checksumSoftware!=checksumNative then return error(490,"binary32 benchmark result mismatch") end if
    print "Binary32 "+names[op]+": calls="+str(count)+" softwareMs="+str(softwareMs)+" nativeMs="+str(nativeMs)+" speedup="+str(softwareMs/nativeMs)
  end for
  return 0
end function
