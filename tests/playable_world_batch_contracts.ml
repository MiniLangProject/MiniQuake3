import mq3.renderer.playable_world_batch as worldBatch
import mq3.client.playable_viewer as viewer
import mq3.compat.numeric as numeric
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser

struct Vertex position baseUV lightmapUV normal color entityColor entityTexCoord shaderTime sourceIndex end struct
struct Triangle vertices textureIndex lightmapIndex end struct
struct RenderData triangles end struct

function require(condition,message) if not condition then return error(7491,message) end if;return 1 end function
function v(x,y,z,u,v,lu,lv,r,g,b) return Vertex([x,y,z],[u,v],[lu,lv],[0.0,1.0,0.0],[r,g,b,255],[255,255,255,255],[0.0,0.0],0.0,-1) end function

function main(args)
  a=v(10.0,-2.0,1.0,0.0,0.25,0.5,0.75,255,128,32)
  b=v(12.0,2.0,1.0,1.0,0.25,0.75,0.75,64,96,128)
  c=v(11.0,0.0,4.0,0.5,1.0,0.625,1.0,10,20,30)
  a.sourceIndex=10;b.sourceIndex=11;c.sourceIndex=12
  textured=Triangle([a,b,c],1,7)
  fallback=Triangle([a,c,b],0,9)
  sky=Triangle([a,b,c],2,11)
  count=0
  count=count+require(worldBatch.isSky(sky,[false,false,true]) and not worldBatch.isSky(Triangle([a,b,c],-1,0),[false]) and not worldBatch.isSky(Triangle([a,b,c],3,0),[false]),"sky lookup preserves positive, negative and out-of-range texture cases")
  batch=worldBatch.build(RenderData([textured,fallback,sky]),[-1,81,-1],[false,false,true]);if batch is error then return batch end if
  count=count+require(batch.sourceTriangles==3 and batch.drawableTriangles==2 and batch.skippedSky==1,"world filtering counts")
  count=count+require(batch.commands.count==2 and len(batch.commands.data)==384,"retained command capacity")
  count=count+require(numeric.readI32(batch.commands.data,0)==81 and numeric.readI32(batch.commands.data,4)==7,"base and lightmap slots retained")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.commands.data,20))==10.0 and numeric.bitsFloat(numeric.readU32(batch.commands.data,32))==0.0,"world position and base UV retained")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.commands.data,40))==0.5 and numeric.bitsFloat(numeric.readU32(batch.commands.data,44))==0.75,"lightmap UV retained")
  count=count+require(numeric.bitsFloat(numeric.readU32(batch.commands.data,48))==1.0 and batch.commands.data[116]==255 and batch.commands.data[127]==255,"lightmapped geometry avoids duplicate vertex modulation")
  count=count+require(numeric.readI32(batch.commands.data,128)==9 and numeric.readI32(batch.commands.data,132)==-1,"lightmap-only fallback normalized")
  vertexBatch=worldBatch.build(RenderData([Triangle([a,b,c],1,-1)]),[-1,81],[false,false]);count=count+require(numeric.bitsFloat(numeric.readU32(vertexBatch.commands.data,48))==1.0 and vertexBatch.commands.data[116]==255 and vertexBatch.commands.data[117]==128 and vertexBatch.commands.data[118]==32 and vertexBatch.commands.data[120]==64 and vertexBatch.commands.data[124]==10,"unlightmapped geometry retains per-vertex RGB")
  camera=viewer.camera([0.0,0.0,0.0],0.0,0.0,0.0,0.0)
  projection=viewer.prepareProjection(camera,640,480,90.0,1.0);if projection is error then return projection end if
  count=count+require(worldBatch.draw(batch,projection)==2,"one-call projected submission")
  empty=worldBatch.build(RenderData([]),[],[]);if empty is error then return empty end if
  count=count+require(empty.drawableTriangles==0 and worldBatch.draw(empty,projection)==0,"empty world batch")
  image=materials.Image(1,1,bytes([255,128,32,255]))
  staticStage=materials.RuntimeStage(["base"],[image],[81],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  effectStage=materials.RuntimeStage(["fx0","fx1"],[image,image],[90,91],2.0,[materials.UvMod("scroll",0.25,-0.5,0.0,0.0,0.0,0.0,shaderParser.blankWave())],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"texture","wave",shaderParser.Wave(5,0.0,1.0,0.0,1.0),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  material=materials.Material(1,"shader","base",image,81,[staticStage,effectStage],[],false,3.0,false,false,0.0,0.0,false)
  catalog=materials.Catalog([material],0,1,1,3,1,1)
  lookup=worldBatch.materialTable(RenderData([textured,fallback,sky]),catalog);count=count+require(len(lookup)==3 and lookup[0]==void and lookup[1]==material,"material table keeps sparse shader indexes")
  groups=worldBatch.groupedTriangles(RenderData([textured,fallback,sky]),[false,false,true],len(lookup));count=count+require(len(groups[0])==1 and len(groups[1])==1 and len(groups[2])==0 and groups[1][0]==textured,"material grouping filters sky and preserves order")
  lateMaterial=materials.Material(2,"late","base",image,81,[effectStage],[],false,9.0,false,false,0.0,0.0,false);earlyMaterial=materials.Material(0,"early","base",image,81,[effectStage],[],false,3.0,false,false,0.0,0.0,false);orderedMaterials=worldBatch.sortedMaterials([lateMaterial,material,earlyMaterial]);count=count+require(orderedMaterials[0].textureIndex==0 and orderedMaterials[1].textureIndex==1 and orderedMaterials[2].textureIndex==2,"materials sort by shader key then texture index")
  staged=worldBatch.buildMaterials(RenderData([textured,fallback,sky]),catalog,[false,false,true]);if staged is error then return staged end if
  count=count+require(staged.sourceTriangles==3 and staged.drawableTriangles==2 and staged.skippedSky==1,"material filtering counts")
  count=count+require(staged.base.count==2 and len(staged.passes)==1 and staged.emittedTriangles==3,"retained material passes")
  count=count+require(staged.animatedPasses==1 and staged.uvModifiedPasses==1 and staged.blendedPasses==1 and staged.generatorPasses==1,"effect pass counts")
  alphaStage=materials.RuntimeStage(["cutout"],[image],[93],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_GE128,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  count=count+require(worldBatch.dynamicStage(alphaStage),"alpha test receives an isolated retained pass")
  equalStage=materials.RuntimeStage(["equal"],[image],[93],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,true,256.0,[]);count=count+require(worldBatch.dynamicStage(equalStage),"explicit equal depth function receives a retained pass")
  noWriteStage=materials.RuntimeStage(["no-write"],[image],[93],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[]);count=count+require(worldBatch.dynamicStage(noWriteStage),"opaque stage without depth writes receives a retained pass")
  decalMaterial=materials.Material(1,"decal","base",image,81,[staticStage],[],false,4.0,true,false,0.0,0.0,false);decalBatch=worldBatch.buildMaterials(RenderData([textured]),materials.Catalog([decalMaterial],0,1,1,1,0,0),[false,false,false])
  count=count+require(decalBatch.base.count==0 and len(decalBatch.passes)==1 and decalBatch.passes[0].polygonOffset and decalBatch.polygonOffsetPasses==1,"polygon-offset material receives an isolated biased pass")
  filterStage=materials.RuntimeStage(["filter"],[image],[94],0.0,[],materials.BLEND_FILTER,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  count=count+require(worldBatch.dynamicStage(filterStage),"multiplicative blend receives an isolated retained pass")
  filterCatalog=materials.Catalog([materials.Material(1,"filter","filter",image,94,[filterStage],[],false,9.0,false,false,0.0,0.0,false)],0,1,1,1,0,1)
  filterBatch=worldBatch.buildMaterials(RenderData([textured]),filterCatalog,[false,false,false])
  count=count+require(filterBatch.filterPasses==1 and len(filterBatch.passes)==1,"multiplicative material pass counted and retained")
  filterPass=filterBatch.passes[0]
  count=count+require(not worldBatch.passChanges(filterPass,void) and worldBatch.passChanges(staged.passes[0],void),"retained pass cache distinguishes static render state from animated vertex data")
  worldBatch.updatePass(filterPass,0);filterSerial=filterPass.cacheSerial;worldBatch.updatePass(filterPass,1000)
  count=count+require(filterPass.initialized and filterPass.cacheSerial==filterSerial,"static retained pass preserves prepared vertex bytes across frames")
  clampStage=materials.RuntimeStage(["clamp"],[image],[94],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,true,true,false,256.0,[])
  clampBatch=worldBatch.buildMaterials(RenderData([textured]),materials.Catalog([materials.Material(1,"clamp","clamp",image,94,[clampStage],[],false,3.0,false,false,0.0,0.0,false)],0,1,1,1,0,1),[false,false,false])
  count=count+require(worldBatch.dynamicStage(clampStage) and clampBatch.clampedPasses==1,"clamped sampling receives an isolated retained pass")
  lightmapStage=materials.RuntimeStage([],[],[],0.0,[],materials.BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA,materials.ALPHA_TEST_NONE,"lightmap","identity",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],true,false,false,false,256.0,[])
  lightmapCatalog=materials.Catalog([materials.Material(1,"lightmapped","base",image,81,[staticStage,lightmapStage],[],false,3.0,false,false,0.0,0.0,false)],0,1,1,1,0,1)
  lightmapBatch=worldBatch.buildMaterials(RenderData([textured]),lightmapCatalog,[false,false,false]);lightmapPass=lightmapBatch.passes[0]
  count=count+require(numeric.readI32(lightmapBatch.base.data,4)==-1 and numeric.readI32(lightmapPass.commands.data,0)==7 and lightmapPass.sourceUvs[0][0]==a.lightmapUV and lightmapPass.sourceDeformUvs[0][0]==a.baseUV,"explicit lightmap stage keeps sampling and deformation UVs separate")
  worldBatch.updatePass(lightmapPass,0);count=count+require(lightmapBatch.destinationAlphaPasses==1 and numeric.readI32(lightmapPass.commands.data,0)==7 and numeric.bitsFloat(numeric.readU32(lightmapPass.commands.data,32))==0.5,"lightmap pass retains slot and lightmap UV during updates")
  count=count+require(worldBatch.uploadMaterials(lightmapCatalog)==1 and worldBatch.releaseMaterials(lightmapCatalog)==1,"BSP lightmap stages consume no material texture uploads")
  count=count+require(staged.base.data==batch.commands.data,"single-stage byte parity")
  pass=staged.passes[0];count=count+require(pass.stage.blend==materials.BLEND_ADD and not pass.stage.depthWrite and pass.depthEqual,"blend and depth policy")
  slot=worldBatch.updatePass(pass,500);count=count+require(slot==91 and numeric.readI32(pass.commands.data,0)==91,"animated slot update")
  count=count+require(numeric.bitsFloat(numeric.readU32(pass.commands.data,32))==numeric.f32(0.125) and numeric.bitsFloat(numeric.readU32(pass.commands.data,36))==numeric.f32(1.0),"tcMod scroll update")
  count=count+require(numeric.bitsFloat(numeric.readU32(pass.commands.data,48))==1.0 and pass.commands.data[116]==127 and pass.commands.data[117]==127 and pass.commands.data[118]==127,"rgbGen wave updates retained vertex RGB")
  ta=v(10.0,-2.0,1.0,0.0,0.25,0.5,0.75,255,128,32);tb=v(12.0,2.0,1.0,1.0,0.25,0.75,0.75,64,96,128);tc=v(11.0,0.0,4.0,0.5,1.0,0.625,1.0,10,20,30);ta.sourceIndex=30;tb.sourceIndex=31;tc.sourceIndex=32
  ua=v(10.0,-2.0,1.0,0.0,0.25,0.5,0.75,255,128,32);ub=v(12.0,2.0,1.0,1.0,0.25,0.75,0.75,64,96,128);uc=v(11.0,0.0,4.0,0.5,1.0,0.625,1.0,10,20,30);ua.shaderTime=0.25;ub.shaderTime=0.25;uc.shaderTime=0.25;ua.sourceIndex=40;ub.sourceIndex=41;uc.sourceIndex=42
  timedMove=shaderParser.Deform("move",0.0,shaderParser.Wave(4,0.0,1.0,0.0,1.0),[1.0,0.0,0.0],0.0,0.0,0.0);timedMaterial=materials.Material(1,"timed","timed",image,81,[effectStage],[timedMove],false,3.0,false,false,0.0,0.0,false)
  timedBatch=worldBatch.buildMaterials(RenderData([Triangle([ta,tb,tc],1,-1),Triangle([ua,ub,uc],1,-1)]),materials.Catalog([timedMaterial],0,1,1,1,0,1),[false,false,false]);timedPass=timedBatch.passes[0];worldBatch.updatePass(timedPass,1500)
  count=count+require(numeric.readI32(timedPass.commands.data,0)==91 and numeric.readI32(timedPass.commands.data,128)==90,"entity shaderTime selects each triangle's animated image frame")
  count=count+require(timedPass.commands.data[116]==127 and timedPass.commands.data[244]==191,"entity shaderTime offsets rgbGen wave evaluation")
  firstTimedX=numeric.bitsFloat(numeric.readU32(timedPass.commands.data,20));secondTimedX=numeric.bitsFloat(numeric.readU32(timedPass.commands.data,148));secondTimedU=numeric.bitsFloat(numeric.readU32(timedPass.commands.data,160))
  count=count+require(firstTimedX>10.499 and firstTimedX<10.501 and secondTimedX>10.249 and secondTimedX<10.251 and secondTimedU>0.3124 and secondTimedU<0.3126,"entity shaderTime offsets deforms and ordinary tcMods through one backend clock")
  timedPass.sourceShaderTimes[0][1]=0.25
  worldBatch.updatePass(timedPass,1500)
  cornerX=numeric.bitsFloat(numeric.readU32(timedPass.commands.data,52))
  count=count+require(cornerX==12.25 and timedPass.commands.data[120]==191 and timedPass.commands.data[116]==127,"a corner with its own shader time keeps its own deformation and wave color")
  offsetMaterial=materials.Material(1,"offset","offset",image,81,[effectStage],[timedMove],false,3.0,false,false,0.25,0.0,false);offsetBatch=worldBatch.buildMaterials(RenderData([Triangle([ta,tb,tc],1,-1)]),materials.Catalog([offsetMaterial],0,1,1,1,0,1),[false,false,false]);offsetPass=offsetBatch.passes[0];worldBatch.updatePass(offsetPass,1500);offsetX=numeric.bitsFloat(numeric.readU32(offsetPass.commands.data,20))
  count=count+require(numeric.readI32(offsetPass.commands.data,0)==90 and offsetPass.commands.data[116]==191 and offsetX>10.249 and offsetX<10.251,"shader remap timeOffset shifts animated images, waves and deforms together")
  offsetMaterial.timeOffset=0.75;refreshedOffset=worldBatch.refreshMaterials(offsetBatch,RenderData([Triangle([ta,tb,tc],1,-1)]),materials.Catalog([offsetMaterial],0,1,1,1,0,1),[false,false,false]);worldBatch.updatePass(offsetPass,1500);refreshedOffsetX=numeric.bitsFloat(numeric.readU32(offsetPass.commands.data,20))
  count=count+require(refreshedOffset==offsetBatch and offsetPass.timeOffset==0.75 and numeric.readI32(offsetPass.commands.data,0)==91 and refreshedOffsetX>10.749 and refreshedOffsetX<10.751,"retained refresh adopts a changed same-handle shader timeOffset")
  clampedMaterial=materials.Material(1,"clamped-time","clamped-time",image,81,[effectStage],[timedMove],false,3.0,false,false,0.0,0.75,false);clampedBatch=worldBatch.buildMaterials(RenderData([Triangle([ta,tb,tc],1,-1)]),materials.Catalog([clampedMaterial],0,1,1,1,0,1),[false,false,false]);clampedPass=clampedBatch.passes[0];worldBatch.updatePass(clampedPass,1500);clampedX=numeric.bitsFloat(numeric.readU32(clampedPass.commands.data,20));clampedU=numeric.bitsFloat(numeric.readU32(clampedPass.commands.data,32))
  count=count+require(numeric.readI32(clampedPass.commands.data,0)==91 and clampedPass.commands.data[116]==63 and clampedX>10.749 and clampedX<10.751 and clampedU>0.1874 and clampedU<0.1876,"clampTime freezes every productive shader-time consumer at one phase")
  count=count+require(worldBatch.drawMaterials(staged,projection,500)==3,"material pass submission")
  count=count+require(worldBatch.uploadMaterials(catalog)==3 and worldBatch.releaseMaterials(catalog)==3,"all animated stage slots managed")
  rotateStage=materials.RuntimeStage(["rotate"],[void],[92],0.0,[materials.UvMod("rotate",90.0,0.0,0.0,0.0,0.0,0.0,shaderParser.blankWave())],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  expected=materials.transformUV(rotateStage,[1.0,0.5],1000);actual=worldBatch.applyAffine(worldBatch.affineFor(rotateStage,1000),[1.0,0.5])
  count=count+require(actual[0]>expected[0]-0.000001 and actual[0]<expected[0]+0.000001 and actual[1]>expected[1]-0.000001 and actual[1]<expected[1]+0.000001,"tcMod rotate affine")
  scaleStage=materials.RuntimeStage(["scale"],[void],[93],0.0,[materials.UvMod("scroll",0.25,0.5,0.0,0.0,0.0,0.0,shaderParser.blankWave()),materials.UvMod("scale",2.0,0.5,0.0,0.0,0.0,0.0,shaderParser.blankWave())],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  expectedScale=materials.transformUV(scaleStage,[0.25,0.75],1000);actualScale=worldBatch.applyAffine(worldBatch.affineFor(scaleStage,1000),[0.25,0.75])
  count=count+require(actualScale==expectedScale and actualScale==[1.0,0.625],"ordered scroll and scale affine")
  transformStage=materials.RuntimeStage(["transform"],[void],[93],0.0,[materials.UvMod("scale",0.5,0.5,0.0,0.0,0.0,0.0,shaderParser.blankWave()),materials.UvMod("transform",1.5,0.0,1.5,1.0,1.0,2.0,shaderParser.blankWave())],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  expectedTransform=materials.transformUV(transformStage,[0.2,0.4],0);actualTransform=worldBatch.applyAffine(worldBatch.affineFor(transformStage,0),[0.2,0.4]);count=count+require(actualTransform==expectedTransform and actualTransform[0]>1.4499 and actualTransform[0]<1.4501 and actualTransform[1]>2.1999 and actualTransform[1]<2.2001,"retained affine composes tcMod transform in declaration order")
  stretchWave=shaderParser.Wave(1,0.8,0.2,0.0,0.2);stretchStage=materials.RuntimeStage(["stretch"],[void],[94],0.0,[materials.UvMod("stretch",0.0,0.0,0.0,0.0,0.0,0.0,stretchWave)],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  expectedStretch=materials.transformUV(stretchStage,[0.25,0.75],0);actualStretch=worldBatch.applyAffine(worldBatch.affineFor(stretchStage,0),[0.25,0.75])
  count=count+require(actualStretch[0]>expectedStretch[0]-0.000001 and actualStretch[0]<expectedStretch[0]+0.000001 and actualStretch[1]>expectedStretch[1]-0.000001 and actualStretch[1]<expectedStretch[1]+0.000001,"stretch affine matches material transform")
  turbStage=materials.RuntimeStage(["turb"],[image],[95],0.0,[materials.UvMod("turb",0.0,0.2,0.0,0.1,0.0,0.0,shaderParser.blankWave())],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  turbCatalog=materials.Catalog([materials.Material(1,"turb","turb",image,95,[turbStage],[],false,3.0,false,false,0.0,0.0,false)],0,1,1,1,0,1)
  turbBatch=worldBatch.buildMaterials(RenderData([textured]),turbCatalog,[false,false,false]);turbPass=turbBatch.passes[0]
  count=count+require(turbBatch.turbulentPasses==1,"turbulent material pass counted")
  environmentStage=materials.RuntimeStage(["environment"],[image],[96],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"environment","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[])
  environmentCatalog=materials.Catalog([materials.Material(1,"environment","environment",image,96,[environmentStage],[],false,3.0,false,false,0.0,0.0,false)],0,1,1,1,0,1)
  environmentBatch=worldBatch.buildMaterials(RenderData([textured]),environmentCatalog,[false,false,false]);environmentPass=environmentBatch.passes[0]
  count=count+require(worldBatch.dynamicStage(environmentStage) and len(environmentPass.sourceNormals)==1,"environment stage retains BSP normals in a dynamic pass")
  worldBatch.updatePassView(environmentPass,[10.0,-1.0,1.0],0);environmentU=numeric.bitsFloat(numeric.readU32(environmentPass.commands.data,32));environmentV=numeric.bitsFloat(numeric.readU32(environmentPass.commands.data,36))
  count=count+require(environmentU>0.9999 and environmentV>0.4999 and environmentV<0.5001,"environment pass follows the camera-relative reflection coordinates")
  normalDeform=shaderParser.Deform("normal",0.0,shaderParser.Wave(1,0.0,0.5,0.0,0.1),[0.0,0.0,0.0],0.0,0.0,0.0);normalMaterial=materials.Material(1,"normal","environment",image,96,[environmentStage],[normalDeform],false,3.0,false,false,0.0,0.0,false)
  normalBatch=worldBatch.buildMaterials(RenderData([textured,Triangle([a,c,b],1,7)]),materials.Catalog([normalMaterial],0,1,1,1,0,1),[false,false,false]);normalPass=normalBatch.passes[0];worldBatch.updatePassView(normalPass,[10.0,-1.0,1.0],1000);normalU=numeric.bitsFloat(numeric.readU32(normalPass.commands.data,32));normalV=numeric.bitsFloat(numeric.readU32(normalPass.commands.data,36))
  cachedNormalUv=normalPass.vertexCache.uvs[0]
  count=count+require(normalPass.normalNoise!=void and normalPass.vertexCache!=void and len(normalPass.vertexCache.frames)==3 and normalPass.vertexCache.frames[0]==normalPass.cacheSerial and cachedNormalUv[0]>normalU-0.000001 and cachedNormalUv[0]<normalU+0.000001 and cachedNormalUv[1]>normalV-0.000001 and cachedNormalUv[1]<normalV+0.000001 and (normalU<0.999 or normalV<0.499 or normalV>0.501),"normal deformation caches complete shared vertices and drives environment coordinates with Quake renderer noise")
  portalStage=materials.RuntimeStage(["portal"],[image],[97],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","identity",shaderParser.blankWave(),"portal",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  portalMaterial=materials.Material(1,"portal","portal",image,97,[portalStage],[],false,9.0,false,false,0.0,0.0,false);portalBatch=worldBatch.buildMaterials(RenderData([textured]),materials.Catalog([portalMaterial],0,1,1,1,0,1),[false,false,false]);portalPass=portalBatch.passes[0]
  worldBatch.updatePassView(portalPass,a.position,0);nearAlpha=portalPass.commands.data[119];worldBatch.updatePassView(portalPass,[10.0,-2.0,-127.0],0);middleAlpha=portalPass.commands.data[119];worldBatch.updatePassView(portalPass,[10.0,-2.0,-300.0],0);farAlpha=portalPass.commands.data[119]
  count=count+require(nearAlpha==0 and middleAlpha==127 and farAlpha==255,"portal pass writes Quake camera-distance alpha into retained vertices")
  count=count+require(worldBatch.specularAlpha([-960.0,0.0,96.0],[0.0,1.0,0.0],[-960.0,100.0,96.0])==251 and worldBatch.specularAlpha([-960.0,0.0,96.0],[0.0,1.0,0.0],[-960.0,-100.0,96.0])==0,"specular alpha matches Quake's fast-normalized fourth-power highlight")
  specularStage=materials.RuntimeStage(["specular"],[image],[99],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","identity",shaderParser.blankWave(),"lightingspecular",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  specularMaterial=materials.Material(1,"specular","specular",image,99,[specularStage],[],false,9.0,false,false,0.0,0.0,false);specularBatch=worldBatch.buildMaterials(RenderData([textured]),materials.Catalog([specularMaterial],0,1,1,1,0,1),[false,false,false]);specularPass=specularBatch.passes[0];worldBatch.updatePassView(specularPass,[100.0,100.0,100.0],0)
  count=count+require(worldBatch.dynamicStage(specularStage) and specularPass.commands.data[119]==81,"lightingSpecular stage writes its view-dependent alpha into the retained pass")
  vectorStage=materials.RuntimeStage(["vector"],[image],[98],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"vector","identity",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[[0.25,0.0,1.0],[0.0,-0.5,2.0]])
  vectorMaterial=materials.Material(1,"vector","vector",image,98,[vectorStage],[],false,3.0,false,false,0.0,0.0,false);vectorBatch=worldBatch.buildMaterials(RenderData([textured]),materials.Catalog([vectorMaterial],0,1,1,1,0,1),[false,false,false]);vectorPass=vectorBatch.passes[0];worldBatch.updatePass(vectorPass,0)
  count=count+require(worldBatch.dynamicStage(vectorStage) and numeric.bitsFloat(numeric.readU32(vectorPass.commands.data,32))==3.5 and numeric.bitsFloat(numeric.readU32(vectorPass.commands.data,36))==3.0,"vector tcGen receives a retained pass and replaces BSP UVs")
  q0=v(10.0,2.0,2.0,0.0,0.0,0.0,0.0,255,255,255);q1=v(10.0,-2.0,2.0,1.0,0.0,0.0,0.0,255,255,255);q2=v(10.0,-2.0,-2.0,1.0,1.0,0.0,0.0,255,255,255);q3=v(10.0,2.0,-2.0,0.0,1.0,0.0,0.0,255,255,255)
  autosprite=shaderParser.Deform("autosprite",0.0,shaderParser.blankWave(),[0.0,0.0,0.0],0.0,0.0,0.0);spriteMaterial=materials.Material(1,"sprite","base",image,81,[staticStage],[autosprite],true,3.0,false,false,0.0,0.0,false)
  spriteBatch=worldBatch.buildMaterials(RenderData([Triangle([q0,q1,q3],1,-1),Triangle([q3,q1,q2],1,-1)]),materials.Catalog([spriteMaterial],0,1,1,1,0,0),[false,false,false]);spritePass=spriteBatch.passes[0];worldBatch.updatePassAxes(spritePass,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,0.0,1.0],0)
  spriteX=numeric.bitsFloat(numeric.readU32(spritePass.commands.data,20));spriteY=numeric.bitsFloat(numeric.readU32(spritePass.commands.data,24));spriteZ=numeric.bitsFloat(numeric.readU32(spritePass.commands.data,28));secondZ=numeric.bitsFloat(numeric.readU32(spritePass.commands.data,220))
  count=count+require(spriteX>11.999 and spriteX<12.001 and spriteY==0.0 and spriteZ>1.999 and spriteZ<2.001 and secondZ>-2.001 and secondZ<-1.999 and numeric.bitsFloat(numeric.readU32(spritePass.commands.data,32))==0.0 and numeric.bitsFloat(numeric.readU32(spritePass.commands.data,36))==0.0,"autosprite rebuilds a triangle pair with view-aligned Quake quad corners")
  r0=v(10.0,1.0,-3.0,1.0,1.0,0.0,0.0,255,255,255);r1=v(10.0,-1.0,3.0,0.0,0.0,0.0,0.0,255,255,255);r2=v(10.0,1.0,3.0,1.0,0.0,0.0,0.0,255,255,255);r3=v(10.0,-1.0,-3.0,0.0,1.0,0.0,0.0,255,255,255);r0.sourceIndex=20;r1.sourceIndex=21;r2.sourceIndex=22;r3.sourceIndex=23
  autosprite2=shaderParser.Deform("autosprite2",0.0,shaderParser.blankWave(),[0.0,0.0,0.0],0.0,0.0,0.0);sprite2Material=materials.Material(1,"sprite2","base",image,81,[staticStage],[autosprite2],true,3.0,false,false,0.0,0.0,false)
  sprite2Batch=worldBatch.buildMaterials(RenderData([Triangle([r2,r0,r1],1,-1),Triangle([r1,r0,r3],1,-1)]),materials.Catalog([sprite2Material],0,1,1,1,0,0),[false,false,false]);sprite2Pass=sprite2Batch.passes[0];worldBatch.updatePassAxes(sprite2Pass,[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],0)
  sprite2FirstY=numeric.bitsFloat(numeric.readU32(sprite2Pass.commands.data,24));sprite2SecondY=numeric.bitsFloat(numeric.readU32(sprite2Pass.commands.data,56));sprite2Top=numeric.bitsFloat(numeric.readU32(sprite2Pass.commands.data,28));sprite2U=numeric.bitsFloat(numeric.readU32(sprite2Pass.commands.data,32))
  count=count+require(sprite2FirstY==-1.0 and sprite2SecondY==-1.0 and sprite2Top==3.0 and sprite2U==1.0,"autosprite2 preserves its long axis and directed UV edge while pivoting the short axis")
  count=count+require(worldBatch.hasTurbulence(turbStage) and turbPass.sourcePositions[0][0]==a.position,"turbulent pass retains world positions")
  worldBatch.updatePass(turbPass,0);expectedTurb=materials.transformUVAt(turbStage,a.baseUV,a.position,0);actualTurb=numeric.bitsFloat(numeric.readU32(turbPass.commands.data,32))
  count=count+require(actualTurb>expectedTurb[0]-0.000001 and actualTurb<expectedTurb[0]+0.000001,"turbulent pass writes position-dependent UV")
  deform=shaderParser.Deform("wave",0.01,shaderParser.Wave(4,1.0,2.0,0.0,0.0),[0.0,0.0,0.0],0.0,0.0,0.0);deformedMaterial=materials.Material(1,"deformed","base",image,81,[staticStage],[deform],false,3.0,false,false,0.0,0.0,false)
  deformedBatch=worldBatch.buildMaterials(RenderData([textured]),materials.Catalog([deformedMaterial],0,1,1,1,0,1),[false,false,false]);deformedPass=deformedBatch.passes[0];worldBatch.updatePass(deformedPass,0)
  expectedPosition=worldBatch.deformedPosition(a.position,a.normal,a.baseUV,[deform],0);actualY=numeric.bitsFloat(numeric.readU32(deformedPass.commands.data,24))
  count=count+require(deformedBatch.base.count==0 and deformedBatch.deformedPasses==1,"deformed static stage moves into an updateable pass")
  count=count+require(actualY>expectedPosition[1]-0.000001 and actualY<expectedPosition[1]+0.000001 and actualY>-1.000001 and actualY<-0.999999,"zero-frequency wave deformation uses one shared scale")
  spatialDeform=shaderParser.Deform("wave",0.01,shaderParser.Wave(4,0.0,1.0,0.0,1.0),[0.0,0.0,0.0],0.0,0.0,0.0);spatialPosition=worldBatch.deformedPosition(a.position,a.normal,a.baseUV,[spatialDeform],0)
  count=count+require(spatialPosition[1]>-1.911 and spatialPosition[1]<-1.909,"animated wave deformation offsets lookup phase by world position")
  moveDeform=shaderParser.Deform("move",0.0,shaderParser.Wave(4,1.0,2.0,0.5,0.0),[1.0,2.0,3.0],0.0,0.0,0.0);moved=worldBatch.deformedPosition(a.position,a.normal,a.baseUV,[moveDeform],0)
  count=count+require(moved==[12.0,2.0,7.0],"move deformation applies one shared waveform displacement")
  bulgeDeform=shaderParser.Deform("bulge",0.0,shaderParser.blankWave(),[0.0,0.0,0.0],6.283185307179586,3.0,0.0);bulged=worldBatch.deformedPosition(a.position,a.normal,[0.25,0.0],[bulgeDeform],0)
  count=count+require(bulged[0]==10.0 and bulged[2]==1.0 and bulged[1]>0.999 and bulged[1]<1.001,"bulge deformation uses base U and Quake sine phase")
  print("PASS: "+str(count)+" playable world batch contracts")
  return 0
end function
