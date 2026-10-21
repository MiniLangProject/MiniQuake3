import mq3.client.cgame_view as view
import mq3.compat.numeric as n
function bits(value) return str(n.u32(n.floatBits(value))) end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  s=view.create();a=view.testModelNextFrame(s);b=view.testModelPrevFrame(s);c=view.testModelPrevFrame(s);d=view.testModelNextSkin(s);e=view.testModelPrevSkin(s);f=view.testModelPrevSkin(s);print("cycles|"+str(a)+"|"+str(b)+"|"+str(c)+"|"+str(d)+"|"+str(e)+"|"+str(f))
  s.vidWidth=801;s.vidHeight=601;s.viewsize=10;view.calcVrect(s);print("vrect-low|"+str(s.viewsize)+"|"+str(s.refdef.x)+"|"+str(s.refdef.y)+"|"+str(s.refdef.width)+"|"+str(s.refdef.height))
  s.viewsize=120;view.calcVrect(s);print("vrect-high|"+str(s.viewsize)+"|"+str(s.refdef.x)+"|"+str(s.refdef.y)+"|"+str(s.refdef.width)+"|"+str(s.refdef.height))
  s.time=1000;view.zoomDown(s);a=s.zoomed;b=s.zoomTime;view.zoomDown(s);s.time=1100;view.zoomUp(s);print("zoom|"+str(flag(a))+"|"+str(b)+"|"+str(flag(s.zoomed))+"|"+str(s.zoomTime))
  s.predicted.pm_type=0;s.refdef.width=640;s.refdef.height=480;s.fov=200.0;s.zoomFov=0.5;s.time=2000;s.zoomTime=0;s.zoomed=false;s.contents=0;a=view.calcFov(s);print("fov-clamp|"+str(flag(a))+"|"+bits(s.refdef.fovX)+"|"+bits(s.refdef.fovY)+"|"+bits(s.zoomSensitivity))
  s.fov=90.0;s.zoomFov=30.0;s.zoomed=true;s.zoomTime=2000;s.time=2075;a=view.calcFov(s);print("fov-zoom|"+str(flag(a))+"|"+bits(s.refdef.fovX)+"|"+bits(s.refdef.fovY)+"|"+bits(s.zoomSensitivity))
  s.zoomed=false;s.soundBuffer=array(view.MAX_SOUNDBUFFER,0);s.soundBufferIn=0;s.soundBufferOut=0;s.soundTime=0;s.time=1000;view.addBufferedSound(s,0);view.addBufferedSound(s,11);view.addBufferedSound(s,12);a=view.playBufferedSounds(s,false);b=s.soundTime;s.time=1200;view.playBufferedSounds(s,false);c=len(s.audio);s.time=1800;view.playBufferedSounds(s,false);print("buffer|"+str(a)+"|"+str(b)+"|"+str(c)+"|"+str(s.audio[len(s.audio)-1].sound)+"|"+str(s.soundBufferIn)+"|"+str(s.soundBufferOut));return 0
end function
