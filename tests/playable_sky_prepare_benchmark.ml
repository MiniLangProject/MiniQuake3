// Isolate sky command preparation without rasterization, textures or a window.
import std.time as time
import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials

const FRAMES=60
function main(args)
  image=materials.Image(1,1,bytes([128,192,255,255]))
  layers=[sky.Layer("first",image,0,2.0,2.0,0.05,0.1,false),sky.Layer("second",image,1,3.0,2.0,0.05,0.06,true)]
  catalog=sky.Catalog(layers,0,2,"benchmark",512.0,void)
  camera=viewer.camera([10.0,20.0,30.0],37.0,-11.0,0.0,0.0);basis=viewer.cameraBasis(camera)
  started=time.ticks()
  for frame=0 to FRAMES-1 reference=sky.buildBatchPrepared(catalog,basis,0,0,1280,720,1000+frame*16);if reference is error then return reference end if end for
  referenceMs=time.ticks()-started
  warmup=sky.retainedBatchPrepared(catalog,basis,0,0,1280,720,1000);if warmup is error then return warmup end if
  started=time.ticks()
  for frame=0 to FRAMES-1 retained=sky.retainedBatchPrepared(catalog,basis,0,0,1280,720,1000+frame*16);if retained is error then return retained end if end for
  retainedMs=time.ticks()-started
  started=time.ticks()
  for frame=0 to FRAMES-1
    camera.yaw=37.0+frame*0.25;moving=sky.retainedBatchPrepared(catalog,viewer.cameraBasis(camera),0,0,1280,720,1000+frame*16);if moving is error then return moving end if
  end for
  movingMs=time.ticks()-started
  print "Sky preparation benchmark: frames="+str(FRAMES)+" originalMs="+str(referenceMs/FRAMES)+" retainedMs="+str(retainedMs/FRAMES)+" movingMs="+str(movingMs/FRAMES)+" cacheSlots="+str(len(catalog.cache.entries))
  return 0
end function
