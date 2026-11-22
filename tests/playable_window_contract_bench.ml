// Isolated contract benchmark for the packed Win32 triangle-buffer writers.
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=2 then return 2 end if
  operation=args[0];iterations=toNumber(args[1]);if iterations<1 then return 2 end if
  data=bytes(128,0);checksum=0
  if operation=="i32" then
    for index=0 to iterations-1
      window.writeBatchI32(data,(index&15)*4,index*1664525-2147483648)
      if (index&255)==0 then checksum=(checksum+numeric.readI32(data,(index&15)*4))&0xffffffff end if
    end for
  else if operation=="color" then
    color=[0,-20,300,0]
    for index=0 to iterations-1
      color[0]=index&255;color[3]=(index>>2)&255
      window.writeBatchColor(data,(index&7)*4,color)
      if (index&255)==0 then checksum=(checksum+data[(index&7)*4]+data[(index&7)*4+1]+data[(index&7)*4+2]+data[(index&7)*4+3])&0xffffffff end if
    end for
  else if operation=="position" then
    position=[1.25,2.5,3.75];uv=[0.125,0.875];lightmapUV=[0.25,0.75]
    for index=0 to iterations-1
      position[0]=(index&255)*0.125
      window.writeBatchPositionVertex(data,20,position,uv,lightmapUV,1.0)
      if (index&255)==0 then checksum=(checksum+data[20]+data[21]+data[22]+data[23])&0xffffffff end if
    end for
  else if operation=="stage" then
    batch=window.createTriangleBatch(1);position=[1.25,2.5,3.75];uv=[0.125,0.875];color=[255,128,64,255]
    if batch is error then return batch end if
    for index=0 to iterations-1
      position[0]=(index&255)*0.125;color[0]=index&255
      window.updateStageVertex(batch,0,0,position,uv,color)
      if (index&255)==0 then checksum=(checksum+batch.data[20]+batch.data[21]+batch.data[22]+batch.data[23])&0xffffffff end if
    end for
    data=batch.data
  else if operation=="errors" then
    // The nested writeU32 error propagates through the wrapper.
    if not (try(window.writeBatchI32(data,126,123)) is error) then return 3 end if
    if numeric.readU32(data,124)!=0 then return 4 end if
    print "checksum=errors-pass";return 0
  else return 2 end if
  for index=0 to 127 checksum=(checksum+data[index])&0xffffffff end for
  print "checksum="+str(checksum)
  return 0
end function
