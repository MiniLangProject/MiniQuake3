// SPDX-License-Identifier: GPL-2.0-or-later
// Preserve indexed MD3 stage evaluation without welding seams or entities.
import mq3.renderer.qvm_scene_geometry as idGeo
import mq3.renderer.qvm_scene_batch as idBatch
import mq3.renderer.qvm_scene_materials as idMats
import mq3.renderer.playable_materials as idMaterials
import mq3.renderer.playable_world_batch as idWorld
import mq3.renderer.shader_parser as idShader
import mq3.renderer.surface_md3 as idMesh
import mq3.renderer.scene_queue as idScene
import mq3.renderer.portal_clip as idClip
import mq3.format.md3 as idMd3
import mq3.compat.numeric as idN
struct IdRefdef viewaxis vieworg time flags end struct
function idCheck(value,label) if not value then return error(7685,"MD3 vertex identity: "+label) end if;return 1 end function
function idPayload(color)
  data=bytes(140,0);idN.writeU32(data,8,1);for axis=0 to 2 idN.writeU32(data,28+axis*16,idN.floatBits(1.0)) end for
  idN.writeU32(data,68,idN.floatBits(10.0));for channel=0 to 3 data[116+channel]=color[channel] end for
  return data
end function
function idModel()
  indexes=[0,1,2,2,1,3,4,1,2];uvs=[[0.0,0.0],[1.0,0.0],[0.0,1.0],[1.0,1.0],[0.5,0.75]]
  fresh=[idMesh.vertex(0,0,0,0),idMesh.vertex(64,0,0,0),idMesh.vertex(0,64,0,0),idMesh.vertex(64,64,0,0),idMesh.vertex(0,0,0,0x40)]
  next=[idMesh.vertex(0,0,0,0),idMesh.vertex(80,0,0,0),idMesh.vertex(0,64,32,0),idMesh.vertex(64,80,16,0),idMesh.vertex(0,0,0,0x40)]
  mesh=idMesh.surface(2,5,3,indexes,uvs,[fresh,next]);frame=idMd3.Frame([0.0,0.0,0.0],[2.0,2.0,1.0],[0.0,0.0,0.0],3.0,"fixture")
  return idMd3.Model("identity",0,2,0,2,0,[frame,frame],[[],[]],[idMd3.Surface("one",["fx"],mesh),idMd3.Surface("two",["fx"],mesh)],[[0.0,0.0,0.0],[2.0,2.0,1.0]])
end function
function idCatalog(triangles,material)
  resolved=array(len(triangles),void);for index=0 to len(triangles)-1 resolved[index]=idMats.ResolvedTriangle(triangles[index],0) end for
  return idMats.Catalog(resolved,[material],[],void,0,[],[],len(triangles),0,337,void,void,void)
end function
function idUpdate(prepared)
  for each pass in prepared.batch.passes updated=idWorld.updatePassView(pass,[14.0,-3.0,4.0],3000);if updated is error then return updated end if end for
  return true
end function
function idBytesEqual(a,b)
  if a.batch.base.data!=b.batch.base.data or len(a.batch.passes)!=len(b.batch.passes) then return false end if
  for index=0 to len(a.batch.passes)-1 if a.batch.passes[index].commands.data!=b.batch.passes[index].commands.data then return false end if end for;return true
end function
function main(args)
  count=0;model=idModel();state=idScene.create(2,0);state.registered=true
  sparse=idWorld.createVertexCache([[1000000,2,1000000],[2,500000,-1]])
  count=count+idCheck(len(sparse.frames)==3 and sparse.slots[0][0]==sparse.slots[0][2] and sparse.slots[0][1]==sparse.slots[1][0],"sparse BSP IDs keep shared stage slots without a maximum-sized table")
  count=count+idCheck(sparse.slots[1][2]==-1 and sparse.slots[1][1]!=sparse.slots[0][0],"sparse lookup excludes fallback IDs and keeps distinct vertices")
  scratch=idWorld.vertexIndexScratch();firstSlots=idWorld.createVertexCacheWithScratch([[10000,2,10000]],scratch);nextSlots=idWorld.createVertexCacheWithScratch([[2,10000,2]],scratch)
  count=count+idCheck(len(scratch.visited)==10001 and len(firstSlots.frames)==2 and len(nextSlots.frames)==2 and firstSlots.slots[0]==[0,1,0] and nextSlots.slots[0]==[0,1,0],"batch scratch reuses dense storage with a fresh visit serial")
  first=idPayload([200,100,50,255]);second=idPayload([50,100,200,255]);idN.writeU32(first,100,idN.floatBits(0.75));idN.writeU32(second,100,idN.floatBits(0.25));idScene.addEntity(state,0,first);idScene.addEntity(state,0,second)
  cache=idGeo.createFrameCache(void,16);refdef=IdRefdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[0.0,0.0,0.0],1000,1)
  geometry=idGeo.buildRecordsWithFrameCache(idScene.sceneEntities(state),[],["model"],[model],refdef,8192,cache,void);if geometry is error then return geometry end if
  count=count+idCheck(geometry.triangleCount==12 and geometry.sourceVertices==20,"two indexed surfaces in two coincident entities retained")
  expected=idMesh.submit(model.surfaces[0].mesh,0,0,0.75,0,0,100,100,0)
  count=count+idCheck(geometry.triangles[0].normals[0]==expected.normals[0] and cache.misses==2 and cache.hits==2,"RB_SurfaceMesh same-frame backlerp zero reaches native normals and interpolation cache")
  count=count+idCheck(geometry.triangles[0].vertexIds==[0,1,2] and geometry.triangles[1].vertexIds==[2,1,3],"original shared mesh indices remain dense")
  count=count+idCheck(geometry.triangles[0].positions[0]==geometry.triangles[2].positions[0] and geometry.triangles[0].vertexIds[0]!=geometry.triangles[2].vertexIds[0] and geometry.triangles[0].texCoords[0]!=geometry.triangles[2].texCoords[0],"coincident UV/normal seam vertices are never welded")
  count=count+idCheck(geometry.triangles[3].vertexIds==[5,6,7] and geometry.triangles[6].vertexIds==[10,11,12],"surface and entity namespaces remain separate despite identical coordinates")
  image=idMaterials.Image(1,1,bytes(4,255));stage=idMaterials.RuntimeStage(["fx"],[image],[336],0.0,[],idMaterials.BLEND_ADD,idMaterials.ALPHA_TEST_NONE,"environment","vertex",idShader.blankWave(),"lightingspecular",idShader.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  material=idMats.Material(0,"fx","fx",image,336,[stage],[],false,3.0,false,false,0.0,0.0,false);catalog=idCatalog(geometry.triangles,material);prepared=idBatch.build(catalog);if prepared is error then return prepared end if
  count=count+idCheck(prepared.geometry.triangles[1].vertices[0].sourceIndex==2 and len(prepared.batch.passes[0].vertexCache.frames)==20,"scene conversion retains dense mesh IDs into stage slots")
  saved=array(12,void);for index=0 to 11 saved[index]=geometry.triangles[index].vertexIds;geometry.triangles[index].vertexIds=void end for
  reference=idBatch.build(catalog);if reference is error then return reference end if
  for index=0 to 11 geometry.triangles[index].vertexIds=saved[index] end for
  count=count+idCheck(len(reference.batch.passes[0].vertexCache.frames)==36,"unshared negative control evaluates all triangle corners")
  idUpdate(prepared);idUpdate(reference);count=count+idCheck(idBytesEqual(prepared,reference),"shared environment UV/specular/entity color output is byte-identical to unshared evaluation")
  pass=prepared.batch.passes[0];count=count+idCheck(pass.vertexCache.slots[0][1]==pass.vertexCache.slots[1][1] and pass.vertexCache.frames[pass.vertexCache.slots[1][1]]==pass.cacheSerial,"16 repeated corners hit current stage cache instead of recomputing")
  // Same triangle count, different sharing: use the seam vertex in place of
  // vertex one on triangle one. Both coordinates and identity follow that ID.
  changed=geometry.triangles[1];seam=geometry.triangles[2];changed.vertexIds=[2,4,3];changed.positions[1]=seam.positions[0];changed.texCoords[1]=seam.texCoords[0];changed.normals[1]=seam.normals[0];changed.colors[1]=seam.colors[0]
  refreshed=idBatch.refresh(prepared,catalog);if refreshed is error then return refreshed end if;fresh=idBatch.build(catalog);if fresh is error then return fresh end if
  pass=refreshed.batch.passes[0]
  count=count+idCheck(pass.vertexCache.slots[1][1]==pass.vertexCache.slots[2][0] and pass.vertexCache.slots[1][1]!=pass.vertexCache.slots[0][1] and pass.vertexCache.frames[0]==-1,"same-size index topology rebuilds stage cache slots and epochs")
  idUpdate(refreshed);idUpdate(fresh);count=count+idCheck(idBytesEqual(refreshed,fresh),"topology refresh matches a fresh build byte for byte")
  idN.writeU32(first,80,1);idN.writeU32(second,80,1);idN.writeU32(first,100,idN.floatBits(0.5));idN.writeU32(second,100,idN.floatBits(0.5))
  animated=idGeo.buildRecordsWithFrameCacheReuse(idScene.sceneEntities(state),[],["model"],[model],refdef,8192,cache,void,geometry);if animated is error then return animated end if
  count=count+idCheck(animated==geometry and animated.triangles[0].vertexIds==[0,1,2] and animated.triangles[1].vertexIds==[2,1,3] and animated.triangles[0].positions[1][0]==11.125,"animation updates coordinates while preserving original IDs and surface bases")
  animatedCatalog=idCatalog(animated.triangles,material);animatedPrepared=idBatch.refresh(refreshed,animatedCatalog);if animatedPrepared is error then return animatedPrepared end if;animatedFresh=idBatch.build(animatedCatalog);if animatedFresh is error then return animatedFresh end if
  idUpdate(animatedPrepared);idUpdate(animatedFresh);count=count+idCheck(idBytesEqual(animatedPrepared,animatedFresh),"animated shared stages retain exact fresh-build output")
  clipped=idClip.clipScene(animated,[1.0,0.0,0.0],10.5);if clipped is error then return clipped end if
  allFallback=true;for each triangle in clipped.triangles if triangle.vertexIds!=void then allFallback=false end if end for
  count=count+idCheck(len(clipped.triangles)>0 and allFallback,"portal intersections drop mesh IDs rather than sharing invented vertices")
  mixed=idCatalog([animated.triangles[0],clipped.triangles[0],clipped.triangles[0]],material);converted=idBatch.convert(mixed)
  count=count+idCheck(converted.triangles[0].vertices[0].sourceIndex==0 and converted.triangles[1].vertices[0].sourceIndex>2 and converted.triangles[1].vertices[0].sourceIndex!=converted.triangles[2].vertices[0].sourceIndex,"fallback IDs are unique and above every retained model ID")
  plain=idGeo.triangle([[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0]],[[255,255,255,255],[255,255,255,255],[255,255,255,255]],[255,255,255,255],[0.0,0.0],0.0,0,0,0,"","",0,0,0)
  animated.triangleCount=0;idGeo.appendTriangle(animated,plain);count=count+idCheck(animated.triangles[0].vertexIds==void,"reused generic sprite/poly storage clears old MD3 identity")
  print("PASS: "+str(count)+" MD3 vertex identity contracts (20 unique vertices, 36 corners, 16 stage-cache hits)");return 0
end function
