// SPDX-License-Identifier: GPL-2.0-or-later
// Adapts original QVM refEntity/poly geometry to the native multi-pass batch.
package mq3.renderer.qvm_scene_batch

import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.playable_world_batch as worldBatch

struct Prepared geometry batch end struct

function fail(message) return error(7681,"QVM scene batch: "+message) end function
function convertedVertex(triangle,corner,sourceIndex)
  return renderData.RenderVertex(triangle.positions[corner],triangle.texCoords[corner],[0.0,0.0],triangle.normals[corner],triangle.colors[corner],sourceIndex)
end function
function convert(catalog)
  if catalog==void or catalog.triangles==void then return fail("material catalog is required") end if
  triangles=array(len(catalog.triangles),void);triangleIndex=0
  for each resolved in catalog.triangles
    source=resolved.triangle;base=triangleIndex*3
    vertices=[convertedVertex(source,0,base),convertedVertex(source,1,base+1),convertedVertex(source,2,base+2)]
    triangles[triangleIndex]=renderData.RenderTriangle(vertices,resolved.materialIndex,-1,-1,-1,triangleIndex);triangleIndex=triangleIndex+1
  end for
  return renderData.RenderData(triangles,0,len(triangles),0,false,0)
end function
function build(catalog)
  geometry=convert(catalog);if geometry is error then return geometry end if
  skyFlags=array(len(catalog.materials),false);batch=worldBatch.buildMaterials(geometry,catalog,skyFlags);if batch is error then return batch end if
  return Prepared(geometry,batch)
end function
function upload(catalog) return worldBatch.uploadMaterials(catalog) end function
function release(catalog) return worldBatch.releaseMaterials(catalog) end function
function draw(prepared,projection,nowMilliseconds)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  return worldBatch.drawMaterials(prepared.batch,projection,nowMilliseconds)
end function
function drawViewport(prepared,projection,area,nowMilliseconds)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  return worldBatch.drawMaterialsViewport(prepared.batch,projection,nowMilliseconds,area)
end function
