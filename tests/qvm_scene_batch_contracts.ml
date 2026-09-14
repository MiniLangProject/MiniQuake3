import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser

function require(condition,message) if not condition then return error(7685,"QVM scene batch: "+message) end if;return 1 end function
function sourceTriangle(x,color,shaderHandle)
  return sceneGeometry.Triangle([[x,0.0,0.0],[x,1.0,0.0],[x,0.0,1.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0]],[color,color,color],0,0,shaderHandle,"","",0,0)
end function
function catalogFor(triangles,materialList)
  resolved=array(len(triangles),void);index=0
  for each triangle in triangles materialIndex=-1;if len(materialList)>0 then materialIndex=0 end if;resolved[index]=sceneMaterials.ResolvedTriangle(triangle,materialIndex);index=index+1 end for
  return sceneMaterials.Catalog(resolved,materialList,[],void,0,[],[],len(triangles),0,336,void)
end function

function main(args)
  count=0;white=[255,255,255,255];red=[255,32,16,255]
  catalog=catalogFor([sourceTriangle(1.0,white,0)],[]);prepared=sceneBatch.build(catalog);if prepared is error then return prepared end if
  catalog.triangles[0]=sceneMaterials.ResolvedTriangle(sourceTriangle(7.0,red,0),-1)
  refreshed=sceneBatch.refresh(prepared,catalog);if refreshed is error then return refreshed end if
  fresh=sceneBatch.build(catalog);if fresh is error then return fresh end if
  count=count+require(refreshed==prepared and refreshed.batch.base.data==fresh.batch.base.data,"static refresh reuses prepared storage with fresh-build byte parity")
  count=count+require(refreshed.geometry.triangles[0].vertices[0].position[0]==7.0 and refreshed.geometry.triangles[0].vertices[0].color==red,"converted vertices update in place")

  image=materials.Image(1,1,bytes([255,255,255,255]))
  stage=materials.RuntimeStage(["fx"],[image],[336],0.0,[],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  material=sceneMaterials.Material(0,"fx","fx",image,336,[stage],[],false,3.0,false,false)
  dynamicCatalog=catalogFor([sourceTriangle(2.0,white,1)],[material]);dynamicPrepared=sceneBatch.build(dynamicCatalog);if dynamicPrepared is error then return dynamicPrepared end if
  dynamicCatalog.triangles[0]=sceneMaterials.ResolvedTriangle(sourceTriangle(9.0,red,1),0)
  dynamicRefreshed=sceneBatch.refresh(dynamicPrepared,dynamicCatalog);if dynamicRefreshed is error then return dynamicRefreshed end if
  dynamicFresh=sceneBatch.build(dynamicCatalog);if dynamicFresh is error then return dynamicFresh end if
  count=count+require(len(dynamicRefreshed.batch.passes)==1 and dynamicRefreshed.batch.passes[0].commands.data==dynamicFresh.batch.passes[0].commands.data,"dynamic pass refresh has fresh-build byte parity")
  count=count+require(dynamicRefreshed.batch.passes[0].sourcePositions==dynamicFresh.batch.passes[0].sourcePositions and dynamicRefreshed.batch.passes[0].sourceColors==dynamicFresh.batch.passes[0].sourceColors,"dynamic pass source arrays stay synchronized")

  larger=catalogFor([sourceTriangle(3.0,white,0),sourceTriangle(4.0,white,0)],[]);rebuilt=sceneBatch.refresh(refreshed,larger);if rebuilt is error then return rebuilt end if
  count=count+require(rebuilt.batch.base.capacity==2 and rebuilt.batch.base.count==2,"topology growth falls back to a full build")
  print("PASS: "+str(count)+" QVM scene batch contracts");return 0
end function
