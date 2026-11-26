import mq3.renderer.qvm_viewport as viewport
import mq3.client.playable_viewer as viewportCamera

struct Refdef x y width height fovX fovY vieworg viewaxis end struct
function require(condition,message) if not condition then return error(7692,message) end if;return 1 end function
function fixture(x,y,width,height)
  return Refdef(x,y,width,height,90.0,90.0,[1.0,2.0,3.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
end function
function main(args)
  count=0;prepared=viewport.prepare(fixture(100,50,200,100),640,480,1280,960);if prepared is error then return prepared end if
  count=count+require(prepared.area.x==200 and prepared.area.y==100 and prepared.area.width==400 and prepared.area.height==200,"refdef rectangle scales to target")
  count=count+require(prepared.projection.halfWidth==400.0 and prepared.projection.halfHeight==200.0,"projection center includes viewport origin")
  count=count+require(prepared.projection.focal>199.99 and prepared.projection.focal<200.01,"horizontal FOV uses viewport width")
  count=count+require(prepared.projection.verticalFocal>99.99 and prepared.projection.verticalFocal<100.01,"vertical FOV uses its own angle and viewport height")
  count=count+require(prepared.projection.position==[1.0,2.0,3.0] and prepared.projection.forward==[1.0,0.0,0.0],"refdef camera preserved")
  count=count+require(prepared.projection.right==[0.0,-1.0,0.0] and prepared.projection.up==[0.0,0.0,1.0],"AnglesToAxis left becomes screen-right; up preserved")
  screenLeft=viewportCamera.projectPrepared(prepared.projection,[11.0,3.0,3.0]);screenRight=viewportCamera.projectPrepared(prepared.projection,[11.0,1.0,3.0]);screenUp=viewportCamera.projectPrepared(prepared.projection,[11.0,2.0,4.0])
  count=count+require(screenLeft.x<prepared.projection.halfWidth and screenLeft.y==prepared.projection.halfHeight,"positive world Y lies left in original zero-angle view")
  count=count+require(screenRight.x>prepared.projection.halfWidth and screenRight.y==prepared.projection.halfHeight,"negative world Y lies right; no horizontal mirroring")
  count=count+require(screenUp.x==prepared.projection.halfWidth and screenUp.y<prepared.projection.halfHeight,"vertical world Z stays vertical rather than swapping axes")
  count=count+require(screenUp.y>189.99 and screenUp.y<190.01,"vertical offset uses the separate refdef focal length")
  turned=fixture(0,0,640,480);turned.viewaxis=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]];turnedProjection=viewport.prepare(turned,640,480,640,480)
  turnedRight=viewportCamera.projectPrepared(turnedProjection.projection,[2.0,12.0,3.0]);count=count+require(turnedRight.x>320.0 and turnedRight.y==240.0,"original yaw90 camera maps positive world X to screen-right")
  rounded=viewport.prepare(fixture(1,1,1,1),3,3,10,10);if rounded is error then return rounded end if
  count=count+require(rounded.area.x==3 and rounded.area.y==3 and rounded.area.width==3 and rounded.area.height==3,"scaled edges share deterministic rounding")
  beyond=viewport.prepare(fixture(621,0,40,10),640,480,320,240);if beyond is error then return beyond end if
  count=count+require(beyond.area.x==310 and beyond.area.width==20 and beyond.projection.halfWidth==320.0,"partially offscreen viewport retains original projection rectangle")
  controls=viewport.prepare(fixture(760,-60,480,840),1280,720,1280,720);if controls is error then return controls end if
  count=count+require(controls.area.x==760 and controls.area.y==-60 and controls.area.width==480 and controls.area.height==840,"original Controls player refdef extends above and below the framebuffer")
  count=count+require(controls.projection.halfWidth==1000.0 and controls.projection.halfHeight==360.0 and controls.projection.focal>239.99 and controls.projection.focal<240.01,"offscreen preview keeps full FOV and center rather than refitting the clipped rectangle")
  negative=viewport.prepare(fixture(-50,-30,200,100),640,480,1280,960);if negative is error then return negative end if
  count=count+require(negative.area.x==-100 and negative.area.y==-60 and negative.projection.halfWidth==100.0 and negative.projection.halfHeight==40.0,"negative viewport origins scale without losing projection offsets")
  outside=viewport.prepare(fixture(-5000,0,100,100),640,480,640,480);count=count+require(not (outside is error) and outside.area.x==-5000,"fully offscreen refdef remains a valid clipped native no-op")
  count=count+require(try(viewport.prepare(fixture(0,0,0,100),640,480,640,480)) is error,"zero viewport width remains invalid")
  count=count+require(try(viewport.prepare(fixture(0,0,100,-1),640,480,640,480)) is error,"negative viewport height remains invalid")
  count=count+require(try(viewport.prepare(fixture(2147483647,0,2,10),640,480,640,480)) is error,"native endpoint overflow rejected before scaling")
  count=count+require(try(viewport.prepare(fixture(2000000000,0,100,10),640,480,1280,960)) is error,"positive scaled edge overflow rejected before trunc32")
  count=count+require(try(viewport.prepare(fixture(-2147483648,0,100,10),640,480,1280,960)) is error,"negative scaled edge overflow rejected before trunc32")
  count=count+require(try(viewport.prepare(fixture(0,0,640,480),640,480,2147483648,480)) is error,"oversized target dimensions rejected before arithmetic")
  count=count+require(try(viewport.prepare(fixture(0,0,640,480),0,480,640,480)) is error,"invalid source dimensions rejected")
  bad=fixture(0,0,640,480);bad.viewaxis=[];count=count+require(try(viewport.prepare(bad,640,480,640,480)) is error,"incomplete camera rejected")
  print("PASS: "+str(count)+" QVM viewport contracts");return 0
end function
