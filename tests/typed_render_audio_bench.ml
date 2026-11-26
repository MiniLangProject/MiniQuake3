// Alternating baseline/candidate benchmark for profiled shader and PCM helpers.
import mq3.renderer.playable_materials as materials
import mq3.audio.snd_mem_resample as pcm
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=2 then return 2 end if
  operation=args[0];iterations=toNumber(args[1]);if iterations<1 then return 2 end if
  if operation=="shader" then
    total=0.0
    for index=0 to iterations-1
      total=total+materials.shaderMilliseconds(index&65535,0.125,0.25,1.5)
    end for
    print "checksum="+str(numeric.floatBits(total))
    return 0
  end if
  data=bytes(1024,0);total=0
  if operation=="pcm-read" then
    for index=0 to 1023 data[index]=index&255 end for
    for index=0 to iterations-1
      total=(total+pcm.signed16(data,(index&511)*2))&0xffffffff
    end for
  else if operation=="pcm-write" then
    for index=0 to iterations-1
      pcm.write16(data,(index&511)*2,(index&65535)-32768)
      if (index&255)==0 then total=(total+data[(index&511)*2])&0xffffffff end if
    end for
  else if operation=="pcm-both" then
    for index=0 to iterations-1
      offset=(index&511)*2
      pcm.write16(data,offset,(index&65535)-32768)
      total=(total+pcm.signed16(data,offset))&0xffffffff
    end for
  else return 2 end if
  for index=0 to 1023 total=(total+data[index])&0xffffffff end for
  print "checksum="+str(total)
  return 0
end function
