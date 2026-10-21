import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.format.md3 as md3
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_fog as fog
import mq3.renderer.md3_entity as md3Entity
import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.scene_queue as scene
import mq3.compat.numeric as n

struct Refdef viewaxis vieworg time fovX fovY flags end struct
function wf(data,at,value) n.writeU32(data,at,n.floatBits(value));return void end function
function payload(origin,renderfx)
  data=bytes(140,0);n.writeU32(data,4,renderfx);n.writeU32(data,8,1)
  for row=0 to 2 for column=0 to 2 value=0.0;if row==column then value=1.0 end if;wf(data,28+row*12+column*4,value) end for end for
  wf(data,68,origin[0]);wf(data,72,origin[1]);wf(data,76,origin[2]);data[116]=255;data[117]=255;data[118]=255;data[119]=255;return data
end function
function buildOne(model,catalog,origin,flags,shadowMode)
  state=scene.create(1,0);state.registered=true;scene.addEntity(state,0,payload(origin,256));cache=geometry.createFrameCache(void,64)
  refdef=Refdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[origin[0]-64.0,origin[1],origin[2]],0,90.0,90.0,flags)
  return geometry.buildRecordsWithFrameCacheReuseCulledShadowsFog(scene.sceneEntities(state),scene.scenePolys(state),["model"],[model],refdef,8192,cache,void,void,shadowMode,catalog)
end function
function main(args)
  if len(args)!=1 then return error(7695,"usage: md3_fog_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  map=bsp.load(pk3.read(archive,"maps/q3ctf1.bsp"));if map is error then return map end if;catalog=fog.load(map,scripts[0]);if catalog is error then return catalog end if
  model=md3.load(pk3.read(archive,"models/players/sarge/lower.md3"));if model is error then return model end if;frame=model.frames[0];volume=catalog.fogs[1]
  center=[(volume.bounds[0][0]+volume.bounds[1][0])*0.5,(volume.bounds[0][1]+volume.bounds[1][1])*0.5,(volume.bounds[0][2]+volume.bounds[1][2])*0.5]
  inside=[center[0]-frame.localOrigin[0],center[1]-frame.localOrigin[1],center[2]-frame.localOrigin[2]]
  selected=md3Entity.computeFogNum(catalog.fogs,inside,frame,false);if selected!=1 then return error(7695,"retail fog center did not select q3ctf1 fog") end if
  fogged=buildOne(model,catalog,inside,0,2);if fogged is error then return fogged end if
  if fogged.triangleCount<=0 or fogged.triangleCount!=len(fogged.triangles) or fogged.shadowTriangleCount!=0 then return error(7695,"fogged retail MD3 geometry/shadow count mismatch") end if
  for each triangle in fogged.triangles if triangle.fogIndex!=1 or triangle.shaderName==geometry.PROJECTION_SHADOW_SHADER then return error(7695,"fogged retail MD3 lost fog attribution or emitted projected shadow") end if end for
  outside=[volume.bounds[1][0]+frame.radius+128.0,volume.bounds[1][1]+frame.radius+128.0,volume.bounds[1][2]+frame.radius+128.0]
  clear=buildOne(model,catalog,outside,0,2);if clear is error then return clear end if
  if clear.triangleCount!=fogged.triangleCount or clear.shadowTriangleCount<=0 or clear.triangles[0].fogIndex!=0 then return error(7695,"clear retail MD3 did not retain stencil shadows") end if
  projected=buildOne(model,catalog,outside,0,3);if projected is error then return projected end if;if projected.triangleCount!=fogged.triangleCount*2 or projected.shadowTriangleCount!=0 then return error(7695,"clear retail MD3 did not retain projection shadows") end if
  menu=buildOne(model,catalog,inside,1,2);if menu is error then return menu end if
  if menu.triangles[0].fogIndex!=0 then return error(7695,"RDF_NOWORLDMODEL retained retail fog") end if
  print("PASS: retail MD3 fog triangles="+str(fogged.triangleCount)+" projectionTriangles="+str(projected.triangleCount)+" stencilTriangles="+str(clear.shadowTriangleCount));return 0
end function
