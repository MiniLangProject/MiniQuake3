// Preserve propagated errors from the hot Win32 batch writers.
import mq3.platform.playable_window as window

struct Projected x y depth end struct

function main(args)
  data=bytes(128,0);position=[1.25,2.5,3.75];uv=[0.125,0.875];lightmapUV=[0.25,0.75]
  if not (try(window.writeBatchPositionVertex(data,120,position,uv,lightmapUV,1.0)) is error) then return 2 end if
  batch=window.createTriangleBatch(1);if batch is error then return batch end if
  if not (try(window.updateStageVertex(batch,999,0,position,uv,[255,128,64,255])) is error) then return 3 end if
  if not (try(window.writeBatchColor(data,127,[1,2,3,4])) is error) then return 4 end if
  if data[127]!=1 then return 5 end if
  // The point-based writer packs fields separately. Use it as a byte oracle
  // for both output slots, including clamped RGBA and the lightmap UVs.
  expected=window.createTriangleBatch(2);packed=window.createTriangleBatch(2)
  a=[-4.75,0.125,99.5];b=[55.0,-18.25,31.125];c=[4.25,8.5,-16.875]
  ca=[-1,127,255,128];cb=[256,3,20,-2147483649];cc=[100,2147483649,73,0]
  for i=0 to 1
    expected=window.appendTriangleBatchColored(expected,i-1,131-i,Projected(a[0],a[1],a[2]),uv,lightmapUV,0.5,ca,Projected(b[0],b[1],b[2]),lightmapUV,uv,0.75,cb,Projected(c[0],c[1],c[2]),uv,uv,1.0,cc,16,32,64)
    packed=window.appendTriangleBatchPositionColored(packed,i-1,131-i,a,uv,lightmapUV,0.5,ca,b,lightmapUV,uv,0.75,cb,c,uv,uv,1.0,cc,16,32,64)
    if packed is error then return packed end if
  end for
  for i=0 to len(expected.data)-1
    if expected.data[i]!=packed.data[i] then return error(7489,"position triangle differs at byte "+str(i)) end if
  end for
  if packed.count!=2 or not (try(window.appendTriangleBatchPositionColored(packed,0,-1,a,uv,uv,1.0,ca,b,uv,uv,1.0,cb,c,uv,uv,1.0,cc,0,0,0)) is error) then return 6 end if
  print "PASS: propagated native/byte-boundary errors"
  return 0
end function
