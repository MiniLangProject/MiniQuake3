// Exact-byte-buffer workload for readU32/readI32/writeU32 contract trials.
// Keep this fixture unchanged between A/B builds; only numeric.ml varies.
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=2 then print "usage: typed_numeric_io_bench <readU32|readI32|writeU32|errors> <iterations>";return 2 end if
  operation=args[0];iterations=toNumber(args[1]);data=bytes(1024,0)
  if iterations<1 then return 2 end if
  for slot=0 to 255
    numeric.writeU32(data,slot*4,slot*1664525)
  end for
  if operation=="errors" then
    before=numeric.readU32(data,0)
    if not (try(numeric.readU32(data,-1)) is error) then return 3 end if
    if not (try(numeric.readU32(data,1021)) is error) then return 4 end if
    if not (try(numeric.readI32(data,1021)) is error) then return 5 end if
    if not (try(numeric.writeU32(data,-1,9)) is error) then return 6 end if
    if not (try(numeric.writeU32(data,1021,9)) is error) then return 7 end if
    if numeric.readU32(data,0)!=before then return 8 end if
    print "checksum=errors-pass"
    return 0
  end if
  checksum=0
  if operation=="readU32" then
    for index=0 to iterations-1
      checksum=(checksum+numeric.readU32(data,(index*4)&1020))&0xffffffff
    end for
  end if
  if operation=="readI32" then
    for index=0 to iterations-1
      checksum=(checksum+numeric.readI32(data,(index*4)&1020))&0xffffffff
    end for
  end if
  if operation=="writeU32" then
    for index=0 to iterations-1
      numeric.writeU32(data,(index*4)&1020,(index*1664525)&0xffffffff)
    end for
    for slot=0 to 255
      checksum=(checksum+numeric.readU32(data,slot*4))&0xffffffff
    end for
  end if
  if operation!="readU32" and operation!="readI32" and operation!="writeU32" then return 2 end if
  print "checksum="+str(checksum)
  return 0
end function
