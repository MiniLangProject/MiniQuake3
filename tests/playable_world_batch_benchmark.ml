import mq3.renderer.playable_world_batch as worldBatch
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window

const TRIANGLES=1700
const FRAMES=200

struct Vertex position baseUV lightmapUV normal color entityColor entityTexCoord shaderTime sourceIndex end struct
struct Triangle vertices textureIndex lightmapIndex end struct
struct RenderData triangles end struct

function makeVertex(x,y,z) return Vertex([x,y,z],[0.0,0.0],[0.0,0.0],[0.0,0.0,1.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,-1) end function
function main(args)
  triangles=[]
  for index=0 to TRIANGLES-1
    // Degenerate geometry isolates MiniLang/native boundary and projection cost.
    a=makeVertex(10.0,index%8,0.0);triangles=triangles+[Triangle([a,a,a],0,-1)]
  end for
  batch=worldBatch.build(RenderData(triangles),[-1],[false]);if batch is error then return batch end if
  camera=viewer.camera([0.0,0.0,0.0],0.0,0.0,0.0,0.0)
  projection=viewer.prepareProjection(camera,640,480,90.0,1.0);if projection is error then return projection end if
  opened=window.open(640,480);if opened is error then return opened end if
  started=window.milliseconds()
  for frame=0 to FRAMES-1
    for each triangle in triangles
      a=viewer.projectPrepared(projection,triangle.vertices[0].position)
      b=viewer.projectPrepared(projection,triangle.vertices[1].position)
      c=viewer.projectPrepared(projection,triangle.vertices[2].position)
      window.drawTriangle(-1,a,triangle.vertices[0].lightmapUV,1.0,b,triangle.vertices[1].lightmapUV,1.0,c,triangle.vertices[2].lightmapUV,1.0,255,255,255)
    end for
  end for
  legacy=window.milliseconds()-started
  started=window.milliseconds()
  for frame=0 to FRAMES-1 drawn=worldBatch.draw(batch,projection);if drawn is error then window.shutdown();return drawn end if end for
  batched=window.milliseconds()-started
  window.shutdown()
  print("world batch benchmark: triangles="+str(TRIANGLES)+" frames="+str(FRAMES)+" legacy_calls="+str(TRIANGLES*FRAMES)+" batch_calls="+str(FRAMES)+" legacy_ms="+str(legacy)+" batch_ms="+str(batched))
  return 0
end function
