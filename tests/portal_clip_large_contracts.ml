// SPDX-License-Identifier: GPL-2.0-or-later
// Large mixed portal plane: retained output must match the former array path.
import mq3.renderer.portal_clip as clip
import mq3.renderer.bsp_render_data as render
import mq3.platform.playable_window as window

const INPUT_TRIANGLES=8192
function require(ok,label) if not ok then return error(7705,"large portal clip: "+label) end if;return 1 end function
function fixtureVertex(x,serial)
  return render.RenderVertex([x,serial*0.125,0.0],[x+3.0,0.25],[x+4.0,0.75],[1.0,0.0,0.0],[serial%255,100,200,255],[255,255,255,255],[0.0,0.0],0.0,serial)
end function
function originalArrayClip(source,normal,dist)
  output=[]
  for each triangle in source.triangles
    polygon=clip.clipVertices(triangle.vertices,normal,dist)
    if len(polygon)>=3 then for corner=1 to len(polygon)-2
      output=output+[render.RenderTriangle([polygon[0],polygon[corner],polygon[corner+1]],triangle.textureIndex,triangle.lightmapIndex,triangle.fogIndex,triangle.faceIndex,triangle.triangleIndex)]
    end for end if
  end for
  return output
end function
function main(args)
  inputs=array(INPUT_TRIANGLES,void)
  for index=0 to INPUT_TRIANGLES-1
    mode=index%3;a=0.0;b=0.0;c=0.0
    if mode==0 then a= -1.0;b=1.0;c=1.0
    else if mode==1 then a=1.0;b=2.0;c=3.0
    else a= -1.0;b= -2.0;c= -3.0 end if
    inputs[index]=render.RenderTriangle([fixtureVertex(a,index),fixtureVertex(b,index+1),fixtureVertex(c,index+2)],index%7,2,3,index,index)
  end for
  source=render.RenderData(inputs,INPUT_TRIANGLES,INPUT_TRIANGLES,0,false,0);normal=[1.0,0.0,0.0]
  started=window.milliseconds();fast=clip.clipRenderData(source,normal,0.0);fastMs=window.milliseconds()-started
  started=window.milliseconds();reference=originalArrayClip(source,normal,0.0);referenceMs=window.milliseconds()-started
  count=0;count=count+require(len(fast.triangles)==8193 and fast.triangleCount==8193 and len(reference)==8193,"mixed topology count")
  equal=true
  for index=0 to len(reference)-1
    a=fast.triangles[index];b=reference[index]
    if a.faceIndex!=b.faceIndex or a.textureIndex!=b.textureIndex or a.lightmapIndex!=b.lightmapIndex or a.fogIndex!=b.fogIndex then equal=false;break end if
    for corner=0 to 2
      av=a.vertices[corner];bv=b.vertices[corner]
      if av.position!=bv.position or av.baseUV!=bv.baseUV or av.lightmapUV!=bv.lightmapUV or av.normal!=bv.normal or av.color!=bv.color or av.sourceIndex!=bv.sourceIndex then equal=false;break end if
    end for
    if not equal then break end if
  end for
  count=count+require(equal,"every clipped triangle and vertex matches former array path")
  print "PORTAL_CLIP input="+str(INPUT_TRIANGLES)+" output="+str(len(reference))+" fast_ms="+str(fastMs)+" former_array_ms="+str(referenceMs)
  print "PASS: "+str(count)+" large portal clip contracts";return 0
end function
