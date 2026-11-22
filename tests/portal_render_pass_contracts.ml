import mq3.renderer.portal_render_pass as pass
import mq3.renderer.portal_clip as clip
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.bsp_render_data as render
import mq3.renderer.qvm_scene_geometry as scene

struct PortalTestMaterial textureIndex sort end struct
struct PortalTestCatalog materials end struct
struct ClipWorld trianglesByFace faceKinds end struct
struct ClipSelection faceIndexes selectedSurfaceCount end struct
struct Marker reType origin oldorigin axis oldframe frame skinNum end struct
struct Context events end struct
function req(value,label) if not value then return error(7704,"portal render contract: "+label) end if;return 1 end function
function makeRenderVertex(x,u,color) return render.RenderVertex([x,0.0,0.0],[u,0.0],[u,1.0],[1.0,0.0,0.0],color,[255,255,255,255],[0.0,0.0],0.0,0) end function
function makeRenderTriangle(a,b,c,texture,face) return render.RenderTriangle([a,b,c],texture,2,3,face,7) end function
function drawPortal(context,value) context.events=context.events+["portal"];return 2 end function
function clearDepth(context) context.events=context.events+["clear"] end function
function drawMain(context) context.events=context.events+["main"];return 3 end function
function compareClip(cache,world,faces,normal,dist)
  chosen=ClipSelection(faces,len(faces))
  cached=clip.clipSelection(cache,chosen,normal,dist);if cached is error then return cached end if
  input=selection.cachedRenderData(world,chosen);reference=clip.clipRenderData(input,normal,dist)
  if cached.surfaceCount!=reference.surfaceCount or cached.triangleCount!=reference.triangleCount or cached.patchSurfaceCount!=reference.patchSurfaceCount then return false end if
  index=0
  for each a in cached.triangles
    b=reference.triangles[index];index=index+1
    if a.faceIndex!=b.faceIndex or a.triangleIndex!=b.triangleIndex or a.textureIndex!=b.textureIndex or a.lightmapIndex!=b.lightmapIndex or a.fogIndex!=b.fogIndex then return false end if
    for corner=0 to 2
      x=a.vertices[corner];y=b.vertices[corner]
      if x.position!=y.position or x.normal!=y.normal or x.color!=y.color or x.baseUV!=y.baseUV or x.lightmapUV!=y.lightmapUV or x.sourceIndex!=y.sourceIndex then return false end if
    end for
  end for
  return true
end function
function main(args)
  count=0;white=[255,255,255,255]
  crossing=makeRenderTriangle(makeRenderVertex(-1.0,0.0,[0,0,0,0]),makeRenderVertex(1.0,1.0,white),render.RenderVertex([1.0,1.0,0.0],[1.0,1.0],[1.0,1.0],[1.0,0.0,0.0],white,white,[0.0,0.0],0.0,2),4,11)
  clipped=clip.clipRenderData(render.RenderData([crossing],1,1,0,false,0),[1.0,0.0,0.0],0.0)
  count=count+req(len(clipped.triangles)==2 and clipped.triangleCount==2,"crossing triangle becomes quad")
  count=count+req(clipped.triangles[0].textureIndex==4 and clipped.triangles[0].lightmapIndex==2 and clipped.triangles[0].fogIndex==3,"world metadata retained")
  count=count+req(clipped.triangles[0].vertices[0].position[0]==0.0,"world intersection position")
  count=count+req(clipped.triangles[0].vertices[0].baseUV[0]==0.5,"world intersection UV")
  count=count+req(clipped.triangles[0].vertices[0].color[0]==127,"world intersection color")
  inside=clip.clipRenderData(render.RenderData([makeRenderTriangle(makeRenderVertex(1.0,0.0,white),makeRenderVertex(2.0,0.0,white),makeRenderVertex(3.0,0.0,white),4,1)],1,1,0,false,0),[1.0,0.0,0.0],0.0)
  outside=clip.clipRenderData(render.RenderData([makeRenderTriangle(makeRenderVertex(-3.0,0.0,white),makeRenderVertex(-2.0,0.0,white),makeRenderVertex(-1.0,0.0,white),4,1)],1,1,0,false,0),[1.0,0.0,0.0],0.0)
  count=count+req(len(inside.triangles)==1,"inside world triangle retained")
  count=count+req(len(outside.triangles)==0,"outside world triangle rejected")
  faceWorld=ClipWorld([[crossing],[],inside.triangles],[render.MST_PATCH,0,1]);faceCache=clip.createFaceCache(faceWorld);faceNormal=[1.0,0.0,0.0]
  count=count+req(compareClip(faceCache,faceWorld,[0,1,2],faceNormal,0.0),"cold faces match clipping the flattened selection")
  count=count+req(compareClip(faceCache,faceWorld,[2,0,1,0],faceNormal,0.0),"cached faces retain selection order, repeats and patch metadata")
  count=count+req(compareClip(faceCache,faceWorld,[1],faceNormal,0.0) and compareClip(faceCache,faceWorld,[],faceNormal,0.0),"cached empty faces and empty selection")
  count=count+req(compareClip(faceCache,faceWorld,[0,2],faceNormal,2.0),"plane distance invalidates cached intersections")
  faceNormal[0]= -1.0
  count=count+req(compareClip(faceCache,faceWorld,[0,2],faceNormal,2.0),"mutating the caller's normal invalidates the plane")
  sceneTriangle=scene.Triangle([[-1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,1.0,0.0]],[[0.0,0.0],[1.0,0.0],[1.0,1.0]],[[1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0]],[[0,0,0,0],white,white],[11,22,33,44],[0.25,-0.5],2.0,9,8,7,"shader","surface",6,5,8,[[0.0,0.0],[0.5,0.0],[0.5,0.5]],4,3,true,[4.0,5.0,6.0],[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]],[[-8.0,-4.0,-2.0],[8.0,4.0,2.0]],void)
  sceneSource=scene.Geometry([sceneTriangle],1,1,0,0,0,0,3,3,[],0,[],0);sceneClipped=clip.clipScene(sceneSource,[1.0,0.0,0.0],0.0)
  count=count+req(len(sceneClipped.triangles)==2 and sceneClipped.triangleCount==2,"scene triangle clipped")
  count=count+req(sceneClipped.triangles[0].modelHandle==9 and sceneClipped.triangles[0].shaderHandle==7 and sceneClipped.triangles[0].entityTexCoord==[0.25,-0.5] and sceneClipped.triangles[0].shaderTime==2.0,"scene bindings and entity shader state retained")
  count=count+req(sceneClipped.triangles[0].entityIndex==6 and sceneClipped.triangles[0].surfaceIndex==5,"scene provenance retained")
  count=count+req(sceneClipped.triangles[0].renderfx==8 and sceneClipped.triangles[1].renderfx==8,"scene renderfx retained across clipping")
  count=count+req(sceneClipped.triangles[0].lightmapIndex==4 and sceneClipped.triangles[0].fogIndex==3 and sceneClipped.triangles[0].lightmapCoords[0][0]==0.25 and sceneClipped.triangles[0].dynamicLight and sceneClipped.triangles[0].dynamicLightOrigin==[4.0,5.0,6.0] and sceneClipped.triangles[0].dynamicLightAxis[0]==[0.0,1.0,0.0] and sceneClipped.triangles[0].dynamicLightBounds[1]==[8.0,4.0,2.0],"scene lightmap, fog and oriented dynamic-light state retained across clipping")
  count=count+req(sceneClipped.sourceVertices==3 and sceneClipped.vertexTransforms==3,"scene counters retained")
  axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  marker=Marker(7,[0.0,0.0,0.0],[0.0,0.0,0.0],axis,0,0,0)
  geometry=scene.Geometry([],0,0,0,0,0,0,0,0,[marker],0,[],0)
  sourceRefdef=pass.Refdef(10,20,640,480,90.0,70.0,[3.0,0.0,0.0],axis,1234,0,bytes(32,0))
  portalTriangle=makeRenderTriangle(render.RenderVertex([0.0,-1.0,-1.0],[0.0,0.0],[0.0,0.0],[1.0,0.0,0.0],white,white,[0.0,0.0],0.0,0),render.RenderVertex([0.0,1.0,-1.0],[1.0,0.0],[0.0,0.0],[1.0,0.0,0.0],white,white,[0.0,0.0],0.0,1),render.RenderVertex([0.0,1.0,1.0],[1.0,1.0],[0.0,0.0],[1.0,0.0,0.0],white,white,[0.0,0.0],0.0,2),2,4)
  planned=pass.prepare(render.RenderData([portalTriangle],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,1.0)]),geometry,sourceRefdef,false)
  count=count+req(planned!=void and planned.surface.faceIndex==4,"portal surface selected")
  count=count+req(planned.view.mirror and planned.refdef.vieworg==[-3.0,0.0,0.0],"mirror view prepared")
  count=count+req(planned.refdef.x==10 and planned.refdef.width==640 and planned.refdef.time==1234,"refdef timing and viewport retained")
  count=count+req(pass.prepare(render.RenderData([portalTriangle],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,3.0)]),geometry,sourceRefdef,false)==void,"ordinary material ignored")
  count=count+req(pass.prepare(render.RenderData([portalTriangle],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,1.0)]),geometry,sourceRefdef,true)==void,"recursive portal refused")
  emptyGeometry=scene.Geometry([],0,0,0,0,0,0,0,0,[],0,[],0);count=count+req(pass.prepare(render.RenderData([portalTriangle],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,1.0)]),emptyGeometry,sourceRefdef,false)==void,"missing marker skips pass")
  sourceRefdef.flags=1
  count=count+req(pass.prepare(render.RenderData([portalTriangle],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,1.0)]),geometry,sourceRefdef,false)==void,"RDF_NOWORLDMODEL HUD view cannot create a world portal even with a marker")
  sourceRefdef.flags=0
  count=count+req(pass.prepare(render.RenderData([void],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,1.0)]),emptyGeometry,sourceRefdef,false)==void,"no marker exits before inspecting world triangles")
  sourceRefdef.flags=1
  count=count+req(pass.prepare(render.RenderData([void],1,1,0,false,0),PortalTestCatalog([PortalTestMaterial(2,1.0)]),geometry,sourceRefdef,false)==void,"NOWORLDMODEL exits before inspecting world triangles")
  sourceRefdef.flags=0
  context=Context([]);services=pass.ComposeServices(drawPortal,clearDepth,drawMain,context);drawn=pass.compose(services,planned)
  count=count+req(drawn==5,"portal and main draw counts combined")
  count=count+req(context.events==["portal","clear","main"],"Baseq3 portal composition order")
  context.events=[];drawn=pass.compose(services,void);count=count+req(drawn==3 and context.events==["main"],"main-only path unchanged")
  count=count+req(try(clip.clipRenderData(void,[1.0,0.0,0.0],0.0)) is error,"clip inputs guarded")
  cache=pass.worldBatchCache();faces=[4,13];normal=[1.0,0.0,0.0]
  count=count+req(pass.cachedWorldBatch(cache,faces,normal,2.0)==void,"empty static world batch cache misses")
  pass.storeWorldBatch(cache,faces,normal,2.0,"world")
  count=count+req(pass.cachedWorldBatch(cache,[4,13],[1.0,0.0,0.0],2.0)=="world","same ordered face variants and plane reuse batch")
  count=count+req(pass.cachedWorldBatch(cache,[13,4],normal,2.0)==void,"face order invalidates batch")
  count=count+req(pass.cachedWorldBatch(cache,[4,14],normal,2.0)==void,"patch LOD face change invalidates batch")
  count=count+req(pass.cachedWorldBatch(cache,faces,[-1.0,0.0,0.0],2.0)==void,"plane orientation invalidates batch")
  count=count+req(pass.cachedWorldBatch(cache,faces,normal,3.0)==void,"plane translation invalidates batch")
  pass.storeWorldBatch(cache,[7],normal,3.0,"next world")
  count=count+req(pass.cachedWorldBatch(cache,faces,normal,2.0)==void and pass.cachedWorldBatch(cache,[7],normal,3.0)=="next world" and cache.builds==2 and cache.hits==2,"cache retains one successful world batch")
  print("PASS: "+str(count)+" portal-render contracts");return 0
end function
