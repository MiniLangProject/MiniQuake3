// Retail visual regression: capture a straight-up q3dm1 sky through the
// productive retained-sky and hardware window path (MQ3_CAPTURE writes BMP).
import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.format.pk3 as pk3
import mq3.platform.playable_window as window

function main(args)
  if len(args)!=1 then return error(7616,"usage: playable_sky_zenith_capture <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=sky.load(archive,0,2);if catalog is error then return catalog end if
  opened=window.open(640,480);if opened is error then return opened end if
  uploaded=sky.upload(catalog);if uploaded is error then window.shutdown();return uploaded end if
  camera=viewer.camera([0.0,0.0,0.0],0.0,-90.0,0.0,0.0)
  window.beginFrame(0,0,0)
  drawn=sky.draw(catalog,camera,640,480,1000);if drawn is error then window.shutdown();return drawn end if
  window.present()
  sky.release(catalog);window.shutdown()
  if drawn!=sky.GRID_COLUMNS*sky.GRID_ROWS*2*2 then return error(7617,"zenith sky did not submit both retail layers") end if
  print("PASS: q3dm1 retail zenith capture triangles="+str(drawn))
  return 0
end function
