// Preserve propagated errors from the hot Win32 batch writers.
import mq3.platform.playable_window as window

function main(args)
  data=bytes(128,0);position=[1.25,2.5,3.75];uv=[0.125,0.875];lightmapUV=[0.25,0.75]
  if not (try(window.writeBatchPositionVertex(data,120,position,uv,lightmapUV,1.0)) is error) then return 2 end if
  batch=window.createTriangleBatch(1);if batch is error then return batch end if
  if not (try(window.updateStageVertex(batch,999,0,position,uv,[255,128,64,255])) is error) then return 3 end if
  if not (try(window.writeBatchColor(data,127,[1,2,3,4])) is error) then return 4 end if
  if data[127]!=1 then return 5 end if
  print "PASS: propagated native/byte-boundary errors"
  return 0
end function
