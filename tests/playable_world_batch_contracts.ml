import mq3.renderer.playable_world_batch as worldBatch
import mq3.client.playable_viewer as viewer
import mq3.compat.numeric as numeric
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser

struct Vertex position baseUV lightmapUV normal color end struct
struct Triangle vertices textureIndex lightmapIndex end struct
struct RenderData triangles end struct

function require(condition,message) if not condition then return error(7491,message) end if;return 1 end function
function v(x,y,z,u,v,lu,lv,r,g,b) return Vertex([x,y,z],[u,v],[lu,lv],[0.0,1.0,0.0],[r,g,b,255]) end function

function main(args)
  a=v(10.0,-2.0,1.0,0.0,0.25,0.5,0.75,255,128,32)
  b=v(12.0,2.0,1.0,1.0,0.25,0.75,0.75,64,96,128)
  c=v(11.0,0.0,4.0,0.5,1.0,0.625,1.0,10,20,30)
  textured=Triangle([a,b,c],1,7)
  fallback=Triangle([a,c,b],0,9)
  sky=Triangle([a,b,c],2,11)
  batch=worldBatch.build(RenderData([textured,fallback,sky]),[-1,81,-1],[false,false,true]);if batch is error then return batch end if
  count=0
  count=count+require(batch.sourceTriangles==3 and batch.drawableTriangles==2 and batch.skippedSky==1,"world filtering counts")
  count=count+require(batch.commands.count==2 and len(batch.commands.data)==348,"retained command capacity")
  count=count+require(numeric.readI32(batch.commands.data,0)==81 and numeric.readI32(batch.commands.data,4)==7,"base and lightmap slots retained")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.commands.data,20))==10.0 and numeric.bitsFloat(numeric.readU32(batch.commands.data,32))==0.0,"world position and base UV retained")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.commands.data,40))==0.5 and numeric.bitsFloat(numeric.readU32(batch.commands.data,44))==0.75,"lightmap UV retained")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.commands.data,48))==numeric.f32((255+128+32)/(255.0*3.0)),"vertex color light retained")
  count=count+require(numeric.readI32(batch.commands.data,116)==9 and numeric.readI32(batch.commands.data,120)==-1,"lightmap-only fallback normalized")
  camera=viewer.camera([0.0,0.0,0.0],0.0,0.0,0.0,0.0)
  projection=viewer.prepareProjection(camera,640,480,90.0,1.0);if projection is error then return projection end if
  count=count+require(worldBatch.draw(batch,projection)==2,"one-call projected submission")
  empty=worldBatch.build(RenderData([]),[],[]);if empty is error then return empty end if
  count=count+require(empty.drawableTriangles==0 and worldBatch.draw(empty,projection)==0,"empty world batch")
  image=materials.Image(1,1,bytes([255,128,32,255]))
  staticStage=materials.RuntimeStage(["base"],[image],[81],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave())
  effectStage=materials.RuntimeStage(["fx0","fx1"],[image,image],[90,91],2.0,[materials.UvMod("scroll",0.25,-0.5,0.0,0.0,shaderParser.blankWave())],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"texture","wave",shaderParser.Wave(5,0.0,1.0,0.0,1.0))
  material=materials.Material(1,"shader","base",image,81,[staticStage,effectStage])
  catalog=materials.Catalog([material],0,1,1,3,1,1)
  staged=worldBatch.buildMaterials(RenderData([textured,fallback,sky]),catalog,[false,false,true]);if staged is error then return staged end if
  count=count+require(staged.sourceTriangles==3 and staged.drawableTriangles==2 and staged.skippedSky==1,"material filtering counts")
  count=count+require(staged.base.count==2 and len(staged.passes)==1 and staged.emittedTriangles==3,"retained material passes")
  count=count+require(staged.animatedPasses==1 and staged.uvModifiedPasses==1 and staged.blendedPasses==1 and staged.generatorPasses==1,"effect pass counts")
  alphaStage=materials.RuntimeStage(["cutout"],[image],[93],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_GE128,"texture","identitylighting",shaderParser.blankWave())
  count=count+require(worldBatch.dynamicStage(alphaStage),"alpha test receives an isolated retained pass")
  filterStage=materials.RuntimeStage(["filter"],[image],[94],0.0,[],materials.BLEND_FILTER,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave())
  count=count+require(worldBatch.dynamicStage(filterStage),"multiplicative blend receives an isolated retained pass")
  filterCatalog=materials.Catalog([materials.Material(1,"filter","filter",image,94,[filterStage])],0,1,1,1,0,1)
  filterBatch=worldBatch.buildMaterials(RenderData([textured]),filterCatalog,[false,false,false])
  count=count+require(filterBatch.filterPasses==1 and len(filterBatch.passes)==1,"multiplicative material pass counted and retained")
  count=count+require(staged.base.data==batch.commands.data,"single-stage byte parity")
  pass=staged.passes[0];count=count+require(pass.stage.blend==materials.BLEND_ADD and pass.depthEqual,"blend and depth policy")
  slot=worldBatch.updatePass(pass,500);count=count+require(slot==91 and numeric.readI32(pass.commands.data,0)==91,"animated slot update")
  count=count+require(numeric.bitsFloat(numeric.readU32(pass.commands.data,32))==numeric.f32(0.125) and numeric.bitsFloat(numeric.readU32(pass.commands.data,36))==numeric.f32(1.0),"tcMod scroll update")
  count=count+require(numeric.bitsFloat(numeric.readU32(pass.commands.data,48))==numeric.f32(127/255.0),"rgbGen wave updates retained vertex light")
  count=count+require(worldBatch.drawMaterials(staged,projection,500)==3,"material pass submission")
  count=count+require(worldBatch.uploadMaterials(catalog)==3 and worldBatch.releaseMaterials(catalog)==3,"all animated stage slots managed")
  rotateStage=materials.RuntimeStage(["rotate"],[void],[92],0.0,[materials.UvMod("rotate",90.0,0.0,0.0,0.0,shaderParser.blankWave())],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave())
  expected=materials.transformUV(rotateStage,[1.0,0.5],1000);actual=worldBatch.applyAffine(worldBatch.affineFor(rotateStage,1000),[1.0,0.5])
  count=count+require(actual[0]>expected[0]-0.000001 and actual[0]<expected[0]+0.000001 and actual[1]>expected[1]-0.000001 and actual[1]<expected[1]+0.000001,"tcMod rotate affine")
  scaleStage=materials.RuntimeStage(["scale"],[void],[93],0.0,[materials.UvMod("scroll",0.25,0.5,0.0,0.0,shaderParser.blankWave()),materials.UvMod("scale",2.0,0.5,0.0,0.0,shaderParser.blankWave())],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave())
  expectedScale=materials.transformUV(scaleStage,[0.25,0.75],1000);actualScale=worldBatch.applyAffine(worldBatch.affineFor(scaleStage,1000),[0.25,0.75])
  count=count+require(actualScale==expectedScale and actualScale==[1.0,0.625],"ordered scroll and scale affine")
  stretchWave=shaderParser.Wave(1,0.8,0.2,0.0,0.2);stretchStage=materials.RuntimeStage(["stretch"],[void],[94],0.0,[materials.UvMod("stretch",0.0,0.0,0.0,0.0,stretchWave)],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave())
  expectedStretch=materials.transformUV(stretchStage,[0.25,0.75],0);actualStretch=worldBatch.applyAffine(worldBatch.affineFor(stretchStage,0),[0.25,0.75])
  count=count+require(actualStretch[0]>expectedStretch[0]-0.000001 and actualStretch[0]<expectedStretch[0]+0.000001 and actualStretch[1]>expectedStretch[1]-0.000001 and actualStretch[1]<expectedStretch[1]+0.000001,"stretch affine matches material transform")
  turbStage=materials.RuntimeStage(["turb"],[image],[95],0.0,[materials.UvMod("turb",0.0,0.2,0.0,0.1,shaderParser.blankWave())],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave())
  turbCatalog=materials.Catalog([materials.Material(1,"turb","turb",image,95,[turbStage])],0,1,1,1,0,1)
  turbBatch=worldBatch.buildMaterials(RenderData([textured]),turbCatalog,[false,false,false]);turbPass=turbBatch.passes[0]
  count=count+require(turbBatch.turbulentPasses==1,"turbulent material pass counted")
  environmentStage=materials.RuntimeStage(["environment"],[image],[96],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"environment","identitylighting",shaderParser.blankWave())
  environmentCatalog=materials.Catalog([materials.Material(1,"environment","environment",image,96,[environmentStage])],0,1,1,1,0,1)
  environmentBatch=worldBatch.buildMaterials(RenderData([textured]),environmentCatalog,[false,false,false]);environmentPass=environmentBatch.passes[0]
  count=count+require(worldBatch.dynamicStage(environmentStage) and len(environmentPass.sourceNormals)==1,"environment stage retains BSP normals in a dynamic pass")
  worldBatch.updatePassView(environmentPass,[10.0,-1.0,1.0],0);environmentU=numeric.bitsFloat(numeric.readU32(environmentPass.commands.data,32));environmentV=numeric.bitsFloat(numeric.readU32(environmentPass.commands.data,36))
  count=count+require(environmentU>0.9999 and environmentV>0.4999 and environmentV<0.5001,"environment pass follows the camera-relative reflection coordinates")
  count=count+require(worldBatch.hasTurbulence(turbStage) and turbPass.sourcePositions[0][0]==a.position,"turbulent pass retains world positions")
  worldBatch.updatePass(turbPass,0);expectedTurb=materials.transformUVAt(turbStage,a.baseUV,a.position,0);actualTurb=numeric.bitsFloat(numeric.readU32(turbPass.commands.data,32))
  count=count+require(actualTurb>expectedTurb[0]-0.000001 and actualTurb<expectedTurb[0]+0.000001,"turbulent pass writes position-dependent UV")
  print("PASS: "+str(count)+" playable world batch contracts")
  return 0
end function
