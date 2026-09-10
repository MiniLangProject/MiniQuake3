import std.fs as fs
import mq3.format.bsp as bsp
import mq3.renderer.bsp_render_data as render
import mq3.compat.numeric as numeric

function main(args)
  if len(args)!=1 then return error(7412,"expected BSP path") end if
  map=bsp.load(fs.readAllBytes(args[0]));if map is error then return map end if
  result=render.all(map,1);if result is error then return result end if
  if result.surfaceCount<=0 or result.triangleCount<=0 then return error(7413,"map produced no render geometry") end if
  if result.patchSurfaceCount<=0 then return error(7414,"map produced no patch geometry") end if
  faceLimit=map.counts[13];if faceLimit>800 then faceLimit=800 end if
  faces=[];for index=0 to faceLimit-1 faces=faces+[index] end for
  preview=render.extract(map,faces,1000);if preview is error then return preview end if
  emittedPatch=0
  for each triangle in preview.triangles
    kind=numeric.readI32(map.data,map.offsets[13]+triangle.faceIndex*104+8)
    if kind==render.MST_PATCH then emittedPatch=emittedPatch+1 end if
  end for
  print("PASS: BSP map rendered surfaces="+str(result.surfaceCount)+" patches="+str(result.patchSurfaceCount)+" triangles="+str(result.triangleCount)+" previewPatches="+str(emittedPatch)+" skipped="+str(result.skippedSurfaceCount))
  return 0
end function
