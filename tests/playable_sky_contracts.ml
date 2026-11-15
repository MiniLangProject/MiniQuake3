import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_index as shaderIndex

function require(ok,text) if not ok then return error(7611,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0 then d=0-d end if;return d<0.002 end function

function main(args)
  count=0
  count=count+require(sky.isSkyShader("textures/skies/tim_hell"),"q3dm1 sky recognized")
  count=count+require(sky.isSkyShader("TEXTURES/SKIES/TIM_HELL"),"sky recognition case insensitive")
  count=count+require(not sky.isSkyShader("textures/skies/blacksky"),"other shader retained")
  index=shaderIndex.build("textures/skies/cloudy {\n surfaceparm sky\n skyparms - 512 -\n cloudparms 512 full\n lightning\n {\n map textures/skies/cloud\n tcMod scale 2 3\n tcMod scroll .1 .2\n }\n}\ntextures/wall {\n {\n map textures/wall\n }\n}\n")
  count=count+require(sky.isSkyShaderIndexed(index,"textures/skies/cloudy"),"surfaceparm sky recognized from shader index")
  count=count+require(not sky.isSkyShaderIndexed(index,"textures/wall"),"ordinary indexed material is not a sky")
  source=materials.Image(1,1,bytes([20,40,30,255]))
  firstLayer=sky.Layer("first",source,4,2.0,2.0,0.05,0.10,false)
  secondLayer=sky.Layer("second",source,5,3.0,2.0,0.05,0.06,true)
  count=count+require(firstLayer.scaleU==2.0 and firstLayer.scrollV==0.10,"first retail shader stage")
  count=count+require(secondLayer.additive and secondLayer.scaleU==3.0 and secondLayer.scrollV==0.06,"additive retail shader stage")
  camera=viewer.camera([10.0,20.0,30.0],0.0,0.0,320.0,0.1)
  uv=sky.baseUv(camera,640,480,320.0,240.0)
  count=count+require(near(uv[0],0.0) and near(uv[1],0.5),"center ray follows camera")
  camera.yaw=90.0;uv=sky.baseUv(camera,640,480,320.0,240.0)
  count=count+require(near(uv[0],0.25),"yaw anchors sky")
  camera.yaw=0.0;camera.pitch=30.0;uv=sky.baseUv(camera,640,480,320.0,240.0)
  count=count+require(near(uv[1],0.6666667),"pitch anchors cloud sphere")
  grid=sky.baseGrid(camera,640,480)
  complete=true;for each gridVertex in grid if gridVertex==void then complete=false end if end for
  referenceUv=sky.baseUv(camera,640,480,320.0,0.0)
  count=count+require(len(grid)==(sky.GRID_ROWS+1)*(sky.GRID_COLUMNS+1) and complete and near(grid[6].uv[0],referenceUv[0]) and near(grid[6].uv[1],referenceUv[1]),"prepared grid preserves every camera sample")
  viewportGrid=sky.baseGridPrepared(viewer.cameraBasis(camera),100,50,320,240)
  count=count+require(viewportGrid[0].point.x==100 and viewportGrid[0].point.y==50 and viewportGrid[len(viewportGrid)-1].point.x==420 and viewportGrid[len(viewportGrid)-1].point.y==290,"viewport grid is offset and bounded")
  count=count+require(near(sky.unwrap(1.95,0.02),2.02),"positive seam unwrap")
  count=count+require(near(sky.unwrap(-1.95,-0.02),-2.02),"negative seam unwrap")
  layer=firstLayer
  camera.yaw=0.0;camera.pitch=0.0
  value=sky.vertex(camera,640,480,320.0,240.0,layer,1000,sky.SKY_DEPTH)
  count=count+require(near(value.uv[0],0.05) and near(value.uv[1],1.10),"tim_hell scale and scroll")
  count=count+require(value.point.depth==sky.SKY_DEPTH,"sky stays behind world")
  count=count+require(sky.GRID_COLUMNS*sky.GRID_ROWS*2==192,"bounded layer triangle count")
  catalog=sky.Catalog([firstLayer,secondLayer],4,2,"textures/skies/test",void)
  batch=sky.buildBatch(catalog,camera,640,480,1000)
  count=count+require(batch.count==384 and batch.capacity==384,"two layers share one native batch")
  count=count+require(len(batch.data)==384*128,"fixed batch allocation")
  viewportBatch=sky.buildBatchPrepared(catalog,viewer.cameraBasis(camera),100,50,320,240,1000)
  count=count+require(viewportBatch.count==384 and viewportBatch.capacity==384,"viewport sky retains fixed batching")
  basis=viewer.cameraBasis(camera);retained=sky.retainedBatchPrepared(catalog,basis,0,0,640,480,1000)
  count=count+require(retained.data==batch.data,"native retained sky is byte-identical to original MiniLang batch")
  originalAxes=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];screenAxes=viewer.refdefBasis(originalAxes)
  count=count+require(screenAxes==basis,"original refdef LEFT converts to standalone camera RIGHT exactly")
  rightRay=sky.directionPrepared(screenAxes,320.0,640,480,640.0,240.0);leftRay=sky.directionPrepared(screenAxes,320.0,640,480,0.0,240.0);upRay=sky.directionPrepared(screenAxes,320.0,640,480,320.0,0.0)
  count=count+require(rightRay[1]<0 and leftRay[1]>0,"cloud horizontal rays agree with original screen-right and screen-left")
  count=count+require(upRay[2]>0 and near(upRay[1],0),"cloud vertical ray stays upward independently of horizontal motion")
  refdefBatch=sky.retainedBatchRefdef(catalog,originalAxes,0,0,640,480,1000)
  count=count+require(refdefBatch.data==batch.data,"productive refdef cloud preparation matches standalone camera batch without mirroring")
  layerBytes=sky.GRID_COLUMNS*sky.GRID_ROWS*2*128;layerExact=true
  for layerIndex=0 to len(catalog.layers)-1 if slice(retained.data,layerIndex*layerBytes,layerBytes)!=slice(batch.data,layerIndex*layerBytes,layerBytes) then layerExact=false end if end for
  count=count+require(layerExact,"each explicit sky draw layer preserves original reference bytes")
  sameBatch=sky.retainedBatchPrepared(catalog,basis,0,0,640,480,1733);laterReference=sky.buildBatchPrepared(catalog,basis,0,0,640,480,1733)
  count=count+require(sameBatch==retained and sameBatch.data==laterReference.data,"time-only update reuses batch with exact cloud scrolling")
  exact=true
  for each sample in [[179.0,45.0,1307],[-179.0,-45.0,60001],[90.0,89.0,411],[-90.0,-89.0,120001],[37.0,-11.0,0]]
    camera.yaw=sample[0];camera.pitch=sample[1];axes=viewer.cameraBasis(camera)
    reference=sky.buildBatchPrepared(catalog,axes,100,50,320,240,sample[2]);cached=sky.retainedBatchPrepared(catalog,axes,100,50,320,240,sample[2])
    if reference.data!=cached.data then exact=false end if
  end for
  count=count+require(exact,"seams, poles, offset viewports and scroll phases match every batch byte")
  for yaw=0 to 31 camera.yaw=yaw*7.0;sky.retainedBatchPrepared(catalog,viewer.cameraBasis(camera),0,0,640,480,2000+yaw) end for
  occupied=0;for each entry in catalog.cache.entries if entry!=void then occupied=occupied+1 end if end for
  count=count+require(len(catalog.cache.entries)==sky.MAX_CACHED_VIEWS and occupied==sky.MAX_CACHED_VIEWS,"moving sky camera retains bounded cache storage")
  count=count+require(sky.updateSkyLayerNative(nativeBytesPtr(retained.data),0,0,nativeBytesPtr(catalog.cache.entries[0].source),0,sky.GRID_COLUMNS,sky.GRID_ROWS,4,2.0,2.0,0.05,0.1,1000.0,sky.SKY_DEPTH)==0,"native sky updater rejects truncated source and output")
  count=count+require(try(sky.retainedBatchPrepared(catalog,basis,0,0,0,480,0)) is error,"invalid retained sky viewport rejected")
  print("PASS: "+str(count)+" playable sky contracts");return 0
end function
