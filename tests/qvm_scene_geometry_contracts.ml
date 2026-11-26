import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.scene_queue as scene
import mq3.renderer.surface_md3 as mesh
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.bsp_render_data as renderData
import mq3.format.md3 as md3
import mq3.compat.numeric as n

struct Refdef viewaxis vieworg time end struct
struct LitRefdef viewaxis vieworg time flags end struct
struct CullRefdef viewaxis vieworg time fovX fovY end struct
struct FogRefdef viewaxis vieworg time fovX fovY flags end struct
struct Fog bounds end struct
struct FogCatalog fogs end struct
function req(value,label) if not value then return error(7679,"QVM scene geometry contract: "+label) end if;return 1 end function
function wf(data,at,value) n.writeU32(data,at,n.floatBits(value));return void end function
function basePayload(origin)
  data=bytes(140,0);n.writeU32(data,8,1)
  for row=0 to 2 for column=0 to 2 value=0.0;if row==column then value=1.0 end if;wf(data,28+row*12+column*4,value) end for end for
  wf(data,68,origin[0]);wf(data,72,origin[1]);wf(data,76,origin[2]);n.writeU32(data,80,0);n.writeU32(data,96,0);wf(data,100,0.0)
  data[116]=10;data[117]=20;data[118]=30;data[119]=40;wf(data,120,0.25);wf(data,124,-0.125);wf(data,128,1.0);return data
end function
function fixtureModel()
  packed=[[mesh.vertex(64,0,0,0),mesh.vertex(0,64,0,0),mesh.vertex(0,0,64,0)],[mesh.vertex(128,0,0,0),mesh.vertex(0,128,0,0),mesh.vertex(0,0,128,0)]]
  surface=md3.Surface("unit",["models/unit"],mesh.surface(2,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],packed))
  frame0=md3.Frame([-1.0,-1.0,-1.0],[1.0,1.0,1.0],[0.0,0.0,0.0],2.0,"frame0");frame1=md3.Frame([-2.0,-2.0,-2.0],[2.0,2.0,2.0],[0.0,0.0,0.0],3.0,"frame1")
  return md3.Model("unit.md3",0,2,0,1,0,[frame0,frame1],[[],[]],[surface],[[-2.0,-2.0,-2.0],[2.0,2.0,2.0]])
end function
function main(args)
  count=0;state=scene.create(8,64);state.registered=true;state.worldLoaded=true
  modelPayload=basePayload([10.0,20.0,30.0]);scene.addEntity(state,0,modelPayload)
  spritePayload=basePayload([2.0,3.0,4.0]);n.writeU32(spritePayload,8,0);n.writeU32(spritePayload,112,9);wf(spritePayload,132,2.0);wf(spritePayload,136,0.0);scene.addEntity(state,2,spritePayload)
  verts=[scene.PolyVert([0.0,0.0,0.0],[0.0,0.0],[255,0,0,255]),scene.PolyVert([1.0,0.0,0.0],[1.0,0.0],[0,255,0,255]),scene.PolyVert([0.0,1.0,0.0],[0.0,1.0],[0,0,255,255])]
  pooledPoly=scene.Poly(7,verts,0);pooled=geometry.Geometry(array(1,void),0,0,0,0,0,0,0,0,[],0,[],0)
  firstPoly=geometry.appendPolyTriangle(pooled,pooledPoly,verts[0],verts[1],verts[2]);if firstPoly is error then return firstPoly end if
  target=pooled.triangles[0]
  count=count+req(target.positions==[verts[0].xyz,verts[1].xyz,verts[2].xyz] and target.colors==[verts[0].modulate,verts[1].modulate,verts[2].modulate] and target.shaderHandle==7 and target.lightmapIndex==-1,"direct poly append matches new triangle defaults")
  pooled.triangleCount=0;target.modelHandle=17;target.dynamicLight=true;target.fogIndex=4;target.lightmapIndex=3;target.entityIndex=9
  replaced=geometry.appendPolyTriangle(pooled,pooledPoly,verts[0],verts[1],verts[2]);if replaced is error then return replaced end if
  count=count+req(pooled.triangles[0]==target and not target.dynamicLight and target.modelHandle==0 and target.entityIndex==-1 and target.lightmapIndex==-1 and target.fogIndex==-1 and target.normals==[[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0]],"reused model triangle resets all poly metadata")
  count=count+req(target.entityColor==[255,255,255,255] and target.entityTexCoord==[0.0,0.0] and target.lightmapCoords==[[0.0,0.0],[0.0,0.0],[0.0,0.0]] and target.shaderName=="" and target.surfaceName=="" and target.renderfx==0 and target.dynamicLightOrigin==void and target.dynamicLightAxis==void and target.dynamicLightBounds==void and target.vertexIds==void,"direct poly append clears stale entity and light fields")
  pooled.triangleCount=0;verts[0].xyz[0]=9.0;reused=geometry.appendPolyTriangle(pooled,pooledPoly,verts[0],verts[1],verts[2]);if reused is error then return reused end if
  count=count+req(pooled.triangles[0]==target and target.positions[0][0]==9.0 and target.colors[1]==[0,255,0,255],"reused poly triangle follows current frame without a temporary record")
  verts[0].xyz[0]=0.0
  scene.addPolys(state,7,3,verts,1);refdef=Refdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[-5.0,4.0,2.0],1000)
  output=geometry.build(state,["model"],[fixtureModel()],refdef,8);if output is error then return output end if
  count=count+req(output.modelEntities==1 and output.spriteEntities==1 and output.polySurfaces==1,"submission counts")
  count=count+req(len(output.triangles)==4,"expanded triangle count")
  count=count+req(output.triangles[0].positions[0]==[11.0,20.0,30.0],"model entity transform")
  count=count+req(output.triangles[0].texCoords[1]==[1.0,0.0] and output.triangles[0].shaderName=="models/unit","MD3 surface material")
  count=count+req(output.triangles[0].colors==[[10,20,30,40],[10,20,30,40],[10,20,30,40]] and output.triangles[0].entityTexCoord==[0.25,-0.125] and output.triangles[0].shaderTime==1.0 and output.triangles[0].surfaceName=="unit" and output.triangles[0].modelHandle==1,"entity colors, shader coordinates, time, surface and handle")
  count=count+req(output.triangles[1].shaderHandle==9 and output.triangles[1].positions[0]==[2.0,5.0,6.0],"camera-facing sprite")
  count=count+req(output.triangles[3].shaderHandle==7 and output.triangles[3].positions[2]==[0.0,1.0,0.0] and output.triangles[3].colors==[[255,0,0,255],[0,255,0,255],[0,0,255,255]],"polygon fan retains vertex colors")
  count=count+req(output.skippedInline==0 and output.skippedUnsupported==0,"no skipped supported geometry")
  inlineVertexA=renderData.RenderVertex([1.0,0.0,0.0],[0.0,0.0],[0.1,0.2],[0.0,0.0,1.0],[10,20,30,255],[255,255,255,255],[0.0,0.0],0.0,0)
  inlineVertexB=renderData.RenderVertex([0.0,1.0,0.0],[1.0,0.0],[0.3,0.4],[0.0,0.0,1.0],[40,50,60,255],[255,255,255,255],[0.0,0.0],0.0,1)
  inlineVertexC=renderData.RenderVertex([0.0,0.0,1.0],[0.0,1.0],[0.5,0.6],[0.0,0.0,1.0],[70,80,90,255],[255,255,255,255],[0.0,0.0],0.0,2)
  inlineData=renderData.RenderData([renderData.RenderTriangle([inlineVertexA,inlineVertexB,inlineVertexC],0,3,2,7,0)],1,1,0,false,0)
  inlineState=scene.create(1,0);inlineState.registered=true;scene.addEntity(inlineState,0,basePayload([10.0,20.0,30.0]));inlineModel=[geometry.InlineModel(1,inlineData,["textures/inline"],[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],[true])]
  inlineGeometry=geometry.build(inlineState,["model"],[inlineModel],refdef,8);if inlineGeometry is error then return inlineGeometry end if
  count=count+req(len(inlineGeometry.triangles)==1 and inlineGeometry.modelEntities==1 and inlineGeometry.skippedInline==0,"inline BSP model reaches productive QVM geometry")
  count=count+req(inlineGeometry.triangles[0].positions[0]==[11.0,20.0,30.0] and inlineGeometry.triangles[0].shaderName=="textures/inline","inline BSP entity transform and shader retained")
  count=count+req(inlineGeometry.triangles[0].lightmapCoords[2]==[0.5,0.6] and inlineGeometry.triangles[0].lightmapIndex==3 and inlineGeometry.triangles[0].fogIndex==2 and inlineGeometry.triangles[0].dynamicLight and inlineGeometry.triangles[0].dynamicLightOrigin==[10.0,20.0,30.0] and inlineGeometry.triangles[0].dynamicLightAxis==[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] and inlineGeometry.triangles[0].dynamicLightBounds==[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],"inline BSP lightmap, fog and oriented dynamic-light metadata retained")
  culledState=scene.create(2,0);culledState.registered=true;scene.addEntity(culledState,0,basePayload([10.0,0.0,0.0]));scene.addEntity(culledState,0,basePayload([-10.0,0.0,0.0]));cullRefdef=CullRefdef(refdef.viewaxis,[0.0,0.0,0.0],1000,90.0,90.0);cullCache=geometry.createFrameCache(void,4)
  culledGeometry=geometry.buildRecordsWithFrameCacheReuseCulled(scene.sceneEntities(culledState),scene.scenePolys(culledState),["model"],[inlineModel],cullRefdef,8,cullCache,void,void);if culledGeometry is error then return culledGeometry end if
  count=count+req(len(culledGeometry.triangles)==1 and culledGeometry.modelEntities==1 and culledGeometry.culledInline==1,"R_AddBrushModelSurfaces frustum culls only the rear inline model")
  count=count+req(culledGeometry.triangles[0].positions[0]==[11.0,0.0,0.0],"visible inline model retains exact transformed geometry after culling")
  stencilState=scene.create(1,0);stencilState.registered=true;scene.addEntity(stencilState,0,basePayload([10.0,0.0,0.0]));stencilCache=geometry.createFrameCache(void,4)
  stencilGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadows(scene.sceneEntities(stencilState),scene.scenePolys(stencilState),["model"],[fixtureModel()],cullRefdef,8,stencilCache,void,void,2);if stencilGeometry is error then return stencilGeometry end if
  count=count+req(stencilGeometry.shadowTriangleCount==6 and stencilGeometry.shadowTriangles[0].entityIndex==0 and stencilGeometry.shadowTriangles[0].surfaceIndex==0,"cg_shadows 2 retains six stencil side triangles for an unpaired MD3 triangle")
  noShadowState=scene.create(2,0);noShadowState.registered=true;noShadowPayload=basePayload([10.0,0.0,0.0]);n.writeU32(noShadowPayload,4,64);scene.addEntity(noShadowState,0,noShadowPayload);depthHackPayload=basePayload([10.0,0.0,0.0]);n.writeU32(depthHackPayload,4,8);scene.addEntity(noShadowState,0,depthHackPayload)
  noShadowGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadows(scene.sceneEntities(noShadowState),scene.scenePolys(noShadowState),["model"],[fixtureModel()],cullRefdef,8,stencilCache,void,void,2);if noShadowGeometry is error then return noShadowGeometry end if
  count=count+req(noShadowGeometry.shadowTriangleCount==0,"RF_NOSHADOW and RF_DEPTHHACK suppress stencil shadow volumes")
  disabledStencil=geometry.buildRecordsWithFrameCacheReuseCulledShadows(scene.sceneEntities(stencilState),scene.scenePolys(stencilState),["model"],[fixtureModel()],cullRefdef,8,stencilCache,void,stencilGeometry,1);if disabledStencil is error then return disabledStencil end if
  count=count+req(disabledStencil.shadowTriangleCount==0 and len(disabledStencil.shadowTriangles)==0,"cg_shadows values other than 2 keep stencil volume storage disabled")
  fogRefdef=FogRefdef(cullRefdef.viewaxis,cullRefdef.vieworg,cullRefdef.time,cullRefdef.fovX,cullRefdef.fovY,0);fogCatalog=FogCatalog([void,Fog([[9.0,-1.0,-1.0],[11.0,1.0,1.0]])])
  fogPayload=basePayload([10.0,0.0,0.0]);n.writeU32(fogPayload,4,256);fogState=scene.create(1,0);fogState.registered=true;scene.addEntity(fogState,0,fogPayload)
  fogGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFog(scene.sceneEntities(fogState),scene.scenePolys(fogState),["model"],[fixtureModel()],fogRefdef,8,stencilCache,void,void,2,fogCatalog);if fogGeometry is error then return fogGeometry end if
  count=count+req(fogGeometry.triangleCount==1 and fogGeometry.triangles[0].fogIndex==1 and fogGeometry.shadowTriangleCount==0,"R_ComputeFogNum attributes fogged MD3 geometry and suppresses both shadow modes")
  clearPayload=basePayload([30.0,0.0,0.0]);n.writeU32(clearPayload,4,256);clearState=scene.create(1,0);clearState.registered=true;scene.addEntity(clearState,0,clearPayload);clearGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFog(scene.sceneEntities(clearState),scene.scenePolys(clearState),["model"],[fixtureModel()],fogRefdef,8,stencilCache,void,void,2,fogCatalog);if clearGeometry is error then return clearGeometry end if
  count=count+req(clearGeometry.triangleCount==1 and clearGeometry.triangles[0].fogIndex==0 and clearGeometry.shadowTriangleCount==6,"cg_shadows 2 retains clear MD3 stencil shadows with exact output capacity")
  menuRefdefFog=FogRefdef(cullRefdef.viewaxis,cullRefdef.vieworg,cullRefdef.time,cullRefdef.fovX,cullRefdef.fovY,1);menuFogGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFog(scene.sceneEntities(fogState),scene.scenePolys(fogState),["model"],[fixtureModel()],menuRefdefFog,8,stencilCache,void,void,2,fogCatalog);if menuFogGeometry is error then return menuFogGeometry end if
  count=count+req(menuFogGeometry.triangles[0].fogIndex==0 and menuFogGeometry.triangleCount==1 and menuFogGeometry.shadowTriangleCount==6,"RDF_NOWORLDMODEL disables MD3 fog selection")
  lod0=fixtureModel();lod0.surfaces[0].shaders=["models/lod0","models/lod0_alt"];lod1=fixtureModel();lod1.surfaces[0].shaders=["models/lod1"];lod2=fixtureModel();lod2.surfaces[0].shaders=["models/lod2"];lodAsset=geometry.md3Lods([lod0,lod1,lod2])
  nearLodState=scene.create(1,0);nearLodState.registered=true;scene.addEntity(nearLodState,0,basePayload([10.0,0.0,0.0]));nearLod=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(scene.sceneEntities(nearLodState),scene.scenePolys(nearLodState),["model"],[lodAsset],fogRefdef,8,stencilCache,void,void,0,void,5.0,0);if nearLod is error then return nearLod end if
  count=count+req(nearLod.triangleCount==1 and nearLod.triangles[0].shaderName=="models/lod0","R_ComputeLOD selects full-detail MD3 near the camera")
  farLodState=scene.create(1,0);farLodState.registered=true;scene.addEntity(farLodState,0,basePayload([100.0,0.0,0.0]));farLod=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(scene.sceneEntities(farLodState),scene.scenePolys(farLodState),["model"],[lodAsset],fogRefdef,8,stencilCache,void,void,0,void,5.0,0);if farLod is error then return farLod end if;biasedLod=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(scene.sceneEntities(nearLodState),scene.scenePolys(nearLodState),["model"],[lodAsset],fogRefdef,8,stencilCache,void,void,0,void,5.0,2);if biasedLod is error then return biasedLod end if
  count=count+req(farLod.triangles[0].shaderName=="models/lod2" and biasedLod.triangles[0].shaderName=="models/lod2","projected radius and r_lodbias select the low-detail MD3")
  skinnedPayload=basePayload([10.0,0.0,0.0]);n.writeU32(skinnedPayload,104,1);skinnedState=scene.create(1,0);skinnedState.registered=true;scene.addEntity(skinnedState,0,skinnedPayload);skinned=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(scene.sceneEntities(skinnedState),scene.scenePolys(skinnedState),["model"],[lodAsset],fogRefdef,8,stencilCache,void,void,0,void,5.0,0);if skinned is error then return skinned end if
  count=count+req(skinned.triangles[0].shaderName=="models/lod0_alt","R_AddMD3Surfaces applies skinNum modulo the selected surface shaders")
  rearLodState=scene.create(1,0);rearLodState.registered=true;scene.addEntity(rearLodState,0,basePayload([-10.0,0.0,0.0]));rearLod=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(scene.sceneEntities(rearLodState),scene.scenePolys(rearLodState),["model"],[lodAsset],fogRefdef,8,stencilCache,void,void,0,void,5.0,0);if rearLod is error then return rearLod end if
  count=count+req(rearLod.triangleCount==0 and rearLod.modelEntities==0,"R_CullModel rejects an MD3 wholly behind the view frustum")
  bad=scene.create(1,0);bad.registered=true;n.writeU32(modelPayload,80,2);scene.addEntity(bad,0,modelPayload)
  repaired=geometry.build(bad,["model"],[fixtureModel()],refdef,8);if repaired is error then return repaired end if
  count=count+req(repaired.triangles[0].positions[0]==[11.0,20.0,30.0],"invalid animation repairs both frames to zero")
  wrapped=scene.create(1,0);wrapped.registered=true;wrapPayload=basePayload([10.0,20.0,30.0]);n.writeU32(wrapPayload,4,512);n.writeU32(wrapPayload,80,3);n.writeU32(wrapPayload,96,2);scene.addEntity(wrapped,0,wrapPayload)
  wrappedGeometry=geometry.build(wrapped,["model"],[fixtureModel()],refdef,8);if wrappedGeometry is error then return wrappedGeometry end if
  count=count+req(wrappedGeometry.triangles[0].positions[0]==[12.0,20.0,30.0],"RF_WRAP_FRAMES reaches wrapped animation pose")
  projected=geometry.projectionShadowPoint([2.0,1.0,4.0],1.0,[0.0,0.0,1.0]);count=count+req(projected==[2.0,1.0,1.0],"projection shadow reaches the submitted plane")
  shallow=geometry.projectionShadowPoint([2.0,1.0,4.0],1.0,[1.0,0.0,0.1]);count=count+req(shallow==[-4.0,1.0,1.0],"projection shadow clamps shallow light directions like RB_ProjectionShadowDeform")
  oriented=geometry.projectionShadowPointOriented([2.0,1.0,4.0],25.0,[0.2,0.3,0.9327379],[10.0,20.0,30.0],[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]])
  count=count+req(oriented[2]==25.0 and oriented[0]<8.0 and oriented[1]<20.0,"projection shadow preserves original entity-local deformation for rotated axes")
  count=count+req(try(geometry.projectionShadowPointOriented([0.0,0.0,0.0],0.0,[0.0,0.0,1.0],[0.0,0.0,0.0],[[1.0,0.0,0.0]])) is error,"projection shadow rejects incomplete entity axes")
  shadowState=scene.create(1,0);shadowState.registered=true;shadowPayload=basePayload([10.0,20.0,30.0]);n.writeU32(shadowPayload,4,256);wf(shadowPayload,24,25.0);scene.addEntity(shadowState,0,shadowPayload)
  shadowRefdef=FogRefdef(cullRefdef.viewaxis,[0.0,20.0,30.0],cullRefdef.time,cullRefdef.fovX,cullRefdef.fovY,0);shadowGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFog(scene.sceneEntities(shadowState),scene.scenePolys(shadowState),["model"],[fixtureModel()],shadowRefdef,8,stencilCache,void,void,3,void);if shadowGeometry is error then return shadowGeometry end if
  count=count+req(len(shadowGeometry.triangles)==2 and shadowGeometry.triangles[1].shaderName==geometry.PROJECTION_SHADOW_SHADER,"RF_SHADOW_PLANE emits a productive projected draw surface")
  count=count+req(shadowGeometry.triangles[1].positions[0][2]==25.0 and shadowGeometry.triangles[1].colors[0]==[0,0,0,102],"projected QVM shadow uses the original plane and translucent black")
  tiltedState=scene.create(1,0);tiltedState.registered=true;tiltedPayload=basePayload([10.0,20.0,30.0]);n.writeU32(tiltedPayload,4,256);wf(tiltedPayload,24,25.0);wf(tiltedPayload,28,1.0);wf(tiltedPayload,32,0.0);wf(tiltedPayload,36,0.0);wf(tiltedPayload,40,0.0);wf(tiltedPayload,44,0.70710677);wf(tiltedPayload,48,0.70710677);wf(tiltedPayload,52,0.0);wf(tiltedPayload,56,-0.70710677);wf(tiltedPayload,60,0.70710677);scene.addEntity(tiltedState,0,tiltedPayload)
  tiltedGeometry=geometry.buildRecordsWithFrameCacheReuseCulledShadowsFog(scene.sceneEntities(tiltedState),scene.scenePolys(tiltedState),["model"],[fixtureModel()],shadowRefdef,8,stencilCache,void,void,3,void);if tiltedGeometry is error then return tiltedGeometry end if;tiltedExpected=geometry.projectionShadowPointOriented([1.0,0.0,0.0],25.0,[0.4285714286,0.2857142857,0.8571428571],[10.0,20.0,30.0],[[1.0,0.0,0.0],[0.0,0.70710677,0.70710677],[0.0,-0.70710677,0.70710677]])
  tiltedActual=tiltedGeometry.triangles[1].positions[0];tiltedDelta=0.0;for axisIndex=0 to 2 difference=tiltedActual[axisIndex]-tiltedExpected[axisIndex];tiltedDelta=tiltedDelta+difference*difference end for
  count=count+req(tiltedDelta<0.00000001 and tiltedActual[2]>24.999 and tiltedActual[2]<25.001,"productive RF_SHADOW_PLANE path deforms animated MD3 vertices in entity-local coordinates")
  effects=scene.create(4,0);effects.registered=true
  railPayload=basePayload([64.0,0.0,0.0]);wf(railPayload,84,0.0);wf(railPayload,88,0.0);wf(railPayload,92,0.0);n.writeU32(railPayload,112,21);scene.addEntity(effects,4,railPayload)
  ringsPayload=basePayload([128.0,0.0,0.0]);wf(ringsPayload,84,0.0);wf(ringsPayload,88,0.0);wf(ringsPayload,92,0.0);n.writeU32(ringsPayload,112,22);scene.addEntity(effects,5,ringsPayload)
  boltPayload=basePayload([0.0,0.0,0.0]);wf(boltPayload,84,10.0);wf(boltPayload,88,10.0);wf(boltPayload,92,10.0);n.writeU32(boltPayload,112,23);scene.addEntity(effects,6,boltPayload)
  beamPayload=basePayload([10.0,-4.0,2.0]);wf(beamPayload,84,34.0);wf(beamPayload,88,8.0);wf(beamPayload,92,14.0);scene.addEntity(effects,3,beamPayload)
  portalPayload=basePayload([5.0,0.0,0.0]);wf(portalPayload,84,100.0);wf(portalPayload,88,20.0);wf(portalPayload,92,30.0);scene.addEntity(effects,7,portalPayload)
  effectGeometry=geometry.build(effects,[],[],refdef,8);if effectGeometry is error then return effectGeometry end if
  count=count+req(len(effectGeometry.triangles)==28,"rail core, three rail rings, four lightning planes and beam prism expand")
  count=count+req(effectGeometry.triangles[0].shaderHandle==21 and effectGeometry.triangles[2].shaderHandle==22 and effectGeometry.triangles[8].shaderHandle==23,"trail custom shaders retained")
  count=count+req(effectGeometry.triangles[0].colors[0]==[2,5,7,40] and effectGeometry.triangles[0].colors[1]==[10,20,30,40],"rail-core leading RGB falloff reaches QVM geometry")
  count=count+req(effectGeometry.triangles[16].shaderName=="$mq3/beam" and effectGeometry.triangles[16].shaderHandle==0,"beam selects built-in material")
  count=count+req(effectGeometry.triangles[16].colors==[[255,0,0,255],[255,0,0,255],[255,0,0,255]],"beam retains original immediate red")
  count=count+req(effectGeometry.triangles[16].positions[0]!=effectGeometry.triangles[16].positions[1],"beam prism reaches productive positions")
  count=count+req(len(effectGeometry.portals)==1 and effectGeometry.portals[0].oldorigin==[100.0,20.0,30.0] and effectGeometry.skippedUnsupported==0,"portal marker retained without placeholder geometry")
  portalView=geometry.portalViewForPlane(effectGeometry,[1.0,0.0,0.0],5.0,refdef);if portalView is error then return portalView end if
  count=count+req(portalView!=void and portalView.camera.origin==[100.0,20.0,30.0] and not portalView.mirror,"retained QVM marker drives portal camera view")
  personal=scene.create(2,0);personal.registered=true;personalModel=basePayload([0.0,0.0,0.0]);n.writeU32(personalModel,4,2);scene.addEntity(personal,0,personalModel);personalSprite=basePayload([0.0,0.0,0.0]);n.writeU32(personalSprite,4,2);n.writeU32(personalSprite,8,0);wf(personalSprite,132,2.0);scene.addEntity(personal,2,personalSprite)
  primaryPersonal=geometry.build(personal,["model"],[fixtureModel()],refdef,8);if primaryPersonal is error then return primaryPersonal end if
  count=count+req(len(primaryPersonal.triangles)==0 and primaryPersonal.modelEntities==0 and primaryPersonal.spriteEntities==0,"RF_THIRD_PERSON hidden in primary view")
  portalPersonal=geometry.buildPortalRecords(scene.sceneEntities(personal),scene.scenePolys(personal),["model"],[fixtureModel()],refdef,8,void,void,void);if portalPersonal is error then return portalPersonal end if
  count=count+req(len(portalPersonal.triangles)==3 and portalPersonal.modelEntities==1 and portalPersonal.spriteEntities==1,"RF_THIRD_PERSON visible in portal view")
  firstPerson=scene.create(1,0);firstPerson.registered=true;firstPayload=basePayload([0.0,0.0,0.0]);n.writeU32(firstPayload,4,4);scene.addEntity(firstPerson,0,firstPayload);portalFirst=geometry.buildPortalRecords(scene.sceneEntities(firstPerson),scene.scenePolys(firstPerson),["model"],[fixtureModel()],refdef,8,void,void,void)
  count=count+req(len(portalFirst.triangles)==0,"RF_FIRST_PERSON hidden from portal view")
  empty=geometry.buildRecordsWithFrameCache([],[],[],[],refdef,8,geometry.createFrameCache(void,8),void)
  count=count+req(not (empty is error) and len(empty.triangles)==0,"empty views keep an empty model plan")
  count=count+req(try(geometry.build(state,["model"],[fixtureModel()],refdef,-1)) is error,"negative triangle limit rejected")
  count=count+req(try(geometry.createFrameCache(void,0)) is error,"frame cache capacity validated")
  cachedState=scene.create(2,0);cachedState.registered=true;cachedState.worldLoaded=true;cachedA=basePayload([1.0,2.0,3.0]);cachedB=basePayload([4.0,5.0,6.0]);scene.addEntity(cachedState,0,cachedA);scene.addEntity(cachedState,0,cachedB)
  cache=geometry.createFrameCache(void,8);cached=geometry.buildRecordsWithFrameCache(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],refdef,8,cache,void);if cached is error then return cached end if
  count=count+req(len(cached.triangles)==2 and cached.triangles[0].positions[0]==[2.0,2.0,3.0] and cached.triangles[1].positions[0]==[5.0,5.0,6.0],"cached geometry remains entity-local")
  count=count+req(cache.misses==1 and cache.hits==1,"equal model frames share interpolation")
  count=count+req(cached.sourceVertices==6 and cached.vertexTransforms==6,"unique surface vertices transformed once per entity")
  count=count+req(cache.transformMisses==2 and cache.transformHits==0,"different entity transforms receive distinct cache entries")
  repeated=geometry.buildRecordsWithFrameCache(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],refdef,8,cache,void);if repeated is error then return repeated end if
  same=len(repeated.triangles)==len(cached.triangles) and repeated.triangles[0].positions==cached.triangles[0].positions and repeated.triangles[0].normals==cached.triangles[0].normals and repeated.triangles[1].positions==cached.triangles[1].positions and repeated.triangles[1].texCoords==cached.triangles[1].texCoords
  count=count+req(cache.misses==1 and cache.hits==3 and same,"persistent cache is bit-identical")
  count=count+req(cache.transformMisses==2 and cache.transformHits==2,"persistent transform cache reuses both entities")
  reused=geometry.buildRecordsWithFrameCacheReuse(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],refdef,8,cache,void,repeated);if reused is error then return reused end if
  count=count+req(reused==repeated and reused.triangles[0].positions[0]==[2.0,2.0,3.0] and reused.triangles[1].positions[0]==[5.0,5.0,6.0],"retained geometry storage preserves exact model output")
  transform=geometry.TransformEntry(1,0,0,0,0.0,[0.0,0.0,0.0],refdef.viewaxis,[[0.0,0.0,0.0]],[[1.0,0.0,0.0]],void,void,void,-1,void)
  sampleA=lightGrid.Sample([10.0,20.0,30.0],[100.0,0.0,0.0],[1.0,0.0,0.0],1.0);colorsA=geometry.cachedVertexColors(transform,sampleA,200);colorsAgain=geometry.cachedVertexColors(transform,sampleA,200)
  count=count+req(colorsA==[[110,20,30,200]] and colorsAgain==colorsA,"identical entity lighting reuses byte-identical vertex colors")
  sampleB=lightGrid.Sample([20.0,20.0,30.0],[0.0,0.0,0.0],[1.0,0.0,0.0],1.0);colorsB=geometry.cachedVertexColors(transform,sampleB,201)
  count=count+req(colorsB==[[20,20,30,201]] and colorsA==[[110,20,30,200]],"changed lighting creates new colors without mutating an older view")
  invalidGrid=lightGrid.Grid(bytes(1,0),0,1,[0.0,0.0,0.0],[1.0,1.0,1.0],[1.0,1.0,1.0],[1,1,1],false,[]);menuRefdef=LitRefdef(refdef.viewaxis,refdef.vieworg,refdef.time,1)
  menuLit=geometry.buildRecordsCachedLit(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],menuRefdef,8,void,invalidGrid);if menuLit is error then return menuLit end if
  count=count+req(menuLit.triangles[0].colors[0]==[255,255,255,40],"RDF_NOWORLDMODEL reaches Baseq3 fallback entity lighting in QVM geometry")
  print "PASS: "+str(count)+" QVM scene geometry contracts";return 0
end function
