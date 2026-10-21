import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.playable_fog as playableFog
import mq3.renderer.playable_dynamic_lights as dynamicLights
import mq3.compat.numeric as numeric

function require(condition,message) if not condition then return error(7685,"QVM scene batch: "+message) end if;return 1 end function
function sourceTriangleFx(x,color,entityColor,shaderHandle,renderfx)
  return sceneGeometry.Triangle([[x,0.0,0.0],[x,1.0,0.0],[x,0.0,1.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0]],[color,color,color],entityColor,[0.25,-0.125],1.0,0,0,shaderHandle,"","",0,0,renderfx,[[0.1,0.2],[0.3,0.4],[0.5,0.6]],3,2,false,void,void,void)
end function
function sourceTriangle(x,color,entityColor,shaderHandle) return sourceTriangleFx(x,color,entityColor,shaderHandle,0) end function
function catalogFor(triangles,materialList)
  resolved=array(len(triangles),void);index=0
  for each triangle in triangles materialIndex=-1;if len(materialList)>0 then materialIndex=0 end if;resolved[index]=sceneMaterials.ResolvedTriangle(triangle,materialIndex);index=index+1 end for
  return sceneMaterials.Catalog(resolved,materialList,[],void,0,[],[],len(triangles),0,336,void,void)
end function

function main(args)
  count=0;white=[255,255,255,255];red=[255,32,16,255]
  catalog=catalogFor([sourceTriangle(1.0,white,white,0)],[]);prepared=sceneBatch.build(catalog);if prepared is error then return prepared end if
  catalog.triangles[0]=sceneMaterials.ResolvedTriangle(sourceTriangle(7.0,red,[12,34,56,78],0),-1)
  refreshed=sceneBatch.refresh(prepared,catalog);if refreshed is error then return refreshed end if
  fresh=sceneBatch.build(catalog);if fresh is error then return fresh end if
  count=count+require(refreshed==prepared and refreshed.batch.base.data==fresh.batch.base.data,"static refresh reuses prepared storage with fresh-build byte parity")
  count=count+require(refreshed.geometry.triangles[0].vertices[0].position[0]==7.0 and refreshed.geometry.triangles[0].vertices[0].color==red and refreshed.geometry.triangles[0].vertices[0].entityColor==[12,34,56,78] and refreshed.geometry.triangles[0].vertices[0].entityTexCoord==[0.25,-0.125] and refreshed.geometry.triangles[0].vertices[0].shaderTime==1.0,"converted vertices update entity state in place")
  count=count+require(refreshed.geometry.triangles[0].vertices[0].lightmapUV==[0.1,0.2] and refreshed.geometry.triangles[0].lightmapIndex==3 and refreshed.geometry.triangles[0].fogIndex==2,"QVM batch retains inline BSP lightmap and fog coordinates")
  volume=playableFog.Fog("fog",[0.25,0.5,0.75],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[30.0,10.0,10.0]],[0.0,0.0,0.0,0.0],false);fogCatalog=playableFog.Catalog([void,void,volume],319,playableFog.textureImage())
  attached=sceneBatch.attachFog(refreshed,fogCatalog);count=count+require(attached==1 and refreshed.batch.fogBatch.commands.count==1 and refreshed.batch.fogBatch.fogIndexes==[2],"QVM inline BSP triangle reaches the final fog overlay")
  catalog.triangles[0]=sceneMaterials.ResolvedTriangle(sourceTriangle(8.0,red,[12,34,56,78],0),-1);refogged=sceneBatch.refresh(refreshed,catalog);if refogged is error then return refogged end if;attached=sceneBatch.attachFog(refogged,fogCatalog)
  count=count+require(attached==1 and refogged.batch.fogBatch.sourcePositions[0][0][0]==8.0,"refreshed QVM geometry rebuilds fog coordinates from the current frame")

  image=materials.Image(1,1,bytes([255,255,255,255]))
  stage=materials.RuntimeStage(["fx"],[image],[336],0.0,[materials.UvMod("entitytranslate",0.0,0.0,0.0,0.0,0.0,0.0,shaderParser.blankWave())],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  material=sceneMaterials.Material(0,"fx","fx",image,336,[stage],[],false,3.0,false,false,0.0,0.0)
  dynamicCatalog=catalogFor([sourceTriangle(2.0,white,white,1)],[material]);dynamicPrepared=sceneBatch.build(dynamicCatalog);if dynamicPrepared is error then return dynamicPrepared end if
  dynamicCatalog.triangles[0]=sceneMaterials.ResolvedTriangle(sourceTriangle(9.0,red,[19,29,39,49],1),0)
  dynamicRefreshed=sceneBatch.refresh(dynamicPrepared,dynamicCatalog);if dynamicRefreshed is error then return dynamicRefreshed end if
  dynamicFresh=sceneBatch.build(dynamicCatalog);if dynamicFresh is error then return dynamicFresh end if
  count=count+require(len(dynamicRefreshed.batch.passes)==1 and dynamicRefreshed.batch.passes[0].commands.data==dynamicFresh.batch.passes[0].commands.data,"dynamic pass refresh has fresh-build byte parity")
  count=count+require(dynamicRefreshed.batch.passes[0].sourcePositions==dynamicFresh.batch.passes[0].sourcePositions and dynamicRefreshed.batch.passes[0].sourceColors==dynamicFresh.batch.passes[0].sourceColors and dynamicRefreshed.batch.passes[0].sourceEntityColors==dynamicFresh.batch.passes[0].sourceEntityColors and dynamicRefreshed.batch.passes[0].sourceEntityTexCoords==dynamicFresh.batch.passes[0].sourceEntityTexCoords and dynamicRefreshed.batch.passes[0].sourceShaderTimes==dynamicFresh.batch.passes[0].sourceShaderTimes,"dynamic pass source arrays stay synchronized")
  worldBatch.updatePass(dynamicRefreshed.batch.passes[0],3000);u=numeric.bitsFloat(numeric.readU32(dynamicRefreshed.batch.passes[0].commands.data,32));v=numeric.bitsFloat(numeric.readU32(dynamicRefreshed.batch.passes[0].commands.data,36))
  count=count+require(u==0.5 and v==0.75,"QVM entity texture translation reaches retained UVs with shader-time offset")
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];brushBounds=[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]];brushTriangle=sourceTriangle(4.0,white,white,1);brushTriangle.dynamicLight=true;brushTriangle.dynamicLightOrigin=[4.0,0.0,0.0];brushTriangle.dynamicLightAxis=identity;brushTriangle.dynamicLightBounds=brushBounds;brushCatalog=catalogFor([brushTriangle,sourceTriangle(5.0,white,white,1)],[material]);brushPrepared=sceneBatch.build(brushCatalog);if brushPrepared is error then return brushPrepared end if;lightCatalog=dynamicLights.createCatalog(318);attached=sceneBatch.attachDynamicLights(brushPrepared,brushCatalog,lightCatalog)
  count=count+require(attached==1 and len(brushPrepared.dynamicGeometry.triangles)==1 and len(brushPrepared.batch.dlightBatch.triangles)==1 and brushPrepared.batch.dlightBatch.origins[0]==[4.0,0.0,0.0],"only inline BSP geometry enters the oriented R_DlightBmodel overlay")
  movedBrush=sourceTriangle(6.0,white,white,1);movedBrush.dynamicLight=true;movedBrush.dynamicLightOrigin=[6.0,0.0,0.0];movedBrush.dynamicLightAxis=identity;movedBrush.dynamicLightBounds=brushBounds;brushCatalog.triangles[0]=sceneMaterials.ResolvedTriangle(movedBrush,0);brushRefreshed=sceneBatch.refresh(brushPrepared,brushCatalog);if brushRefreshed is error then return brushRefreshed end if;attached=sceneBatch.attachDynamicLights(brushRefreshed,brushCatalog,lightCatalog)
  count=count+require(attached==1 and brushRefreshed.batch.dlightBatch.triangles[0].vertices[0].position[0]==6.0 and brushRefreshed.batch.dlightBatch.origins[0]==[6.0,0.0,0.0],"moving brush refreshes projected geometry and local-light orientation")
  projected=dynamicLights.update(brushRefreshed.batch.dlightBatch,lightCatalog,dynamicLights.Light([6.0,0.0,0.0],8.0,[1.0,0.5,0.25],false));count=count+require(projected==1 and brushRefreshed.batch.dlightBatch.commands.count==1,"retained brush geometry produces a projected dynamic-light draw")

  depthCatalog=catalogFor([sourceTriangle(10.0,white,white,0),sourceTriangleFx(11.0,white,white,0,8)],[]);depthPrepared=sceneBatch.build(depthCatalog);if depthPrepared is error then return depthPrepared end if
  count=count+require(depthPrepared.geometry.triangleCount==1 and depthPrepared.depthHackGeometry.triangleCount==1,"RF_DEPTHHACK geometry is isolated for the compressed viewmodel depth range")
  count=count+require(depthPrepared.geometry.triangles[0].vertices[0].position[0]==10.0 and depthPrepared.depthHackGeometry.triangles[0].vertices[0].position[0]==11.0,"normal and depth-hack batches retain their source geometry")
  depthCatalog.triangles[0]=sceneMaterials.ResolvedTriangle(sourceTriangleFx(12.0,red,white,0,8),-1);depthCatalog.triangles[1]=sceneMaterials.ResolvedTriangle(sourceTriangle(13.0,red,white,0),-1)
  depthRefreshed=sceneBatch.refresh(depthPrepared,depthCatalog);if depthRefreshed is error then return depthRefreshed end if
  count=count+require(depthRefreshed.geometry.triangles[0].vertices[0].position[0]==13.0 and depthRefreshed.depthHackGeometry.triangles[0].vertices[0].position[0]==12.0,"refresh follows renderfx changes without mixing depth ranges")

  larger=catalogFor([sourceTriangle(3.0,white,white,0),sourceTriangle(4.0,white,white,0)],[]);rebuilt=sceneBatch.refresh(refreshed,larger);if rebuilt is error then return rebuilt end if
  count=count+require(rebuilt.batch.base.capacity==2 and rebuilt.batch.base.count==2,"topology growth falls back to a full build")
  print("PASS: "+str(count)+" QVM scene batch contracts");return 0
end function
