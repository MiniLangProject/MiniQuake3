// SPDX-License-Identifier: GPL-2.0-or-later
// Headless retained-effect construction: preserve every input triangle while
// exposing allocation/scaling costs from 1024 through 8192 source triangles.
import mq3.platform.playable_window as timer
import mq3.renderer.playable_dynamic_lights as lights
import mq3.renderer.playable_fog as fog
struct Vertex position end struct
struct Triangle vertices textureIndex fogIndex end struct
struct RenderData triangles end struct
function main(args)
  a=Vertex([1.0,2.0,3.0]);b=Vertex([2.0,3.0,4.0]);c=Vertex([3.0,4.0,5.0]);axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];origin=[0.0,0.0,0.0];bounds=[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]];fogCatalog=fog.Catalog([void,void],1,void)
  for each count in [1024,2048,4096,8192]
    triangles=array(count,void);origins=array(count,origin);axes=array(count,axis);box=array(count,bounds)
    for index=0 to count-1 triangles[index]=Triangle([a,b,c],1,1) end for
    data=RenderData(triangles)
    started=timer.milliseconds();world=lights.build(data,[false,true]);afterWorld=timer.milliseconds()
    oriented=lights.buildOriented(data,[false,true],origins,axes,box);afterOriented=timer.milliseconds()
    fogBatch=fog.build(data,fogCatalog);finished=timer.milliseconds()
    if len(world.triangles)!=count or len(oriented.origins)!=count or fogBatch.commands.count!=count then return error(7631,"benchmark lost triangles") end if
    print "count="+str(count)+" worldMs="+str(afterWorld-started)+" orientedMs="+str(afterOriented-afterWorld)+" fogMs="+str(finished-afterOriented)
  end for
  return 0
end function
