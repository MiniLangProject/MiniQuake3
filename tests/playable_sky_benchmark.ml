import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_window as window

const WIDTH=640
const HEIGHT=480
const FRAMES=40

function image(seed)
  pixels=bytes(256*256*4,0)
  for index=0 to 256*256-1
    offset=index*4
    pixels[offset]=(index+seed)%256
    pixels[offset+1]=(index*3+seed)%256
    pixels[offset+2]=(index*7+seed)%256
    pixels[offset+3]=192
  end for
  return materials.Image(256,256,pixels)
end function

function main(args)
  opened=window.open(WIDTH,HEIGHT);if opened is error then return opened end if
  first=image(17);second=image(83)
  catalog=sky.Catalog([sky.Layer("first",first,0,2.0,2.0,0.05,0.10,false),sky.Layer("second",second,1,3.0,2.0,0.05,0.06,true)],0,2,"benchmark")
  uploaded=sky.upload(catalog);if uploaded is error then window.shutdown();return uploaded end if
  camera=viewer.camera([10.0,20.0,30.0],37.0,-11.0,320.0,0.1)
  window.beginFrame(7,10,16);warmup=sky.draw(catalog,camera,WIDTH,HEIGHT,1000);if warmup is error then window.shutdown();return warmup end if
  started=window.milliseconds()
  triangles=0
  for frame=0 to FRAMES-1
    window.beginFrame(7,10,16)
    drawn=sky.draw(catalog,camera,WIDTH,HEIGHT,1000+frame*16);if drawn is error then window.shutdown();return drawn end if
    triangles=triangles+drawn
  end for
  elapsed=window.milliseconds()-started
  sky.release(catalog);window.shutdown()
  print("playable sky benchmark: frames="+str(FRAMES)+" triangles="+str(triangles)+" elapsed_ms="+str(elapsed)+" us_per_frame="+str(elapsed*1000/FRAMES))
  return 0
end function
