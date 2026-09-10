import mq3.client.playable_fps_title as fps
import mq3.platform.playable_window as window

function require(ok,message) if not ok then return error(7591,message) end if;return 1 end function

function main(args)
  count=0;value=void;s=fps.create("q3dm1",100)
  count=count+require(fps.initialTitle(s)=="MiniQuake3 | -- FPS | q3dm1","initial title identifies map")
  count=count+require(fps.frame(s,116)==void and s.frameCount==1,"first frame is only sampled")
  for i=2 to 30 value=fps.frame(s,100+i*16) end for
  count=count+require(value==void and s.frameCount==30,"title is not touched every frame")
  value=fps.frame(s,600)
  count=count+require(value=="MiniQuake3 | 62 FPS | q3dm1","half-second sample is rounded")
  count=count+require(s.smoothedFps==62 and s.frameCount==0 and s.sampleStart==600,"measurement window resets")
  for i=1 to 30 value=fps.frame(s,600+i*16) end for
  count=count+require(value==void,"short second window remains quiet")
  value=fps.frame(s,1100)
  count=count+require(value==void and s.smoothedFps==62,"unchanged caption avoids native update")
  for i=1 to 15 value=fps.frame(s,1100+i*32) end for
  value=fps.frame(s,1600)
  count=count+require(value=="MiniQuake3 | 55 FPS | q3dm1","new sample is exponentially smoothed")
  count=count+require(fps.title("q3dm17",144)=="MiniQuake3 | 144 FPS | q3dm17","title formatting")
  count=count+require(try(fps.create("",0)) is error and try(fps.create("map",-1)) is error,"invalid creation rejected")
  count=count+require(try(fps.frame(void,0)) is error and try(fps.frame(s,1599)) is error,"missing state and reversed time rejected")
  count=count+require(try(fps.initialTitle(void)) is error,"missing initial state rejected")
  count=count+require(not window.setTitle("MiniQuake3 | 60 FPS | q3dm1"),"native title update is safe before window creation")
  count=count+require(try(window.setTitle(7)) is error and try(window.setTitle("")) is error,"window title boundary validates input")
  print("PASS: "+str(count)+" playable FPS-title contracts");return 0
end function
