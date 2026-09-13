import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials

function require(ok,text) if not ok then return error(7611,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0 then d=0-d end if;return d<0.002 end function

function main(args)
  count=0
  count=count+require(sky.isSkyShader("textures/skies/tim_hell"),"q3dm1 sky recognized")
  count=count+require(sky.isSkyShader("TEXTURES/SKIES/TIM_HELL"),"sky recognition case insensitive")
  count=count+require(not sky.isSkyShader("textures/skies/blacksky"),"other shader retained")
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
  count=count+require(near(sky.unwrap(1.95,0.02),2.02),"positive seam unwrap")
  count=count+require(near(sky.unwrap(-1.95,-0.02),-2.02),"negative seam unwrap")
  layer=firstLayer
  camera.yaw=0.0;camera.pitch=0.0
  value=sky.vertex(camera,640,480,320.0,240.0,layer,1000,sky.SKY_DEPTH)
  count=count+require(near(value.uv[0],0.05) and near(value.uv[1],1.10),"tim_hell scale and scroll")
  count=count+require(value.point.depth==sky.SKY_DEPTH,"sky stays behind world")
  count=count+require(sky.GRID_COLUMNS*sky.GRID_ROWS*2==192,"bounded layer triangle count")
  catalog=sky.Catalog([firstLayer,secondLayer],4,2)
  batch=sky.buildBatch(catalog,camera,640,480,1000)
  count=count+require(batch.count==384 and batch.capacity==384,"two layers share one native batch")
  count=count+require(len(batch.data)==384*128,"fixed batch allocation")
  print("PASS: "+str(count)+" playable sky contracts");return 0
end function
