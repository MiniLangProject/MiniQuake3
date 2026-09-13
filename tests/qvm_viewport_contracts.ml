import mq3.renderer.qvm_viewport as viewport

struct Refdef x y width height fovX vieworg viewaxis end struct
function require(condition,message) if not condition then return error(7692,message) end if;return 1 end function
function fixture(x,y,width,height)
  return Refdef(x,y,width,height,90.0,[1.0,2.0,3.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
end function
function main(args)
  count=0;prepared=viewport.prepare(fixture(100,50,200,100),640,480,1280,960);if prepared is error then return prepared end if
  count=count+require(prepared.area.x==200 and prepared.area.y==100 and prepared.area.width==400 and prepared.area.height==200,"refdef rectangle scales to target")
  count=count+require(prepared.projection.halfWidth==400.0 and prepared.projection.halfHeight==200.0,"projection center includes viewport origin")
  count=count+require(prepared.projection.focal>199.99 and prepared.projection.focal<200.01,"horizontal FOV uses viewport width")
  count=count+require(prepared.projection.position==[1.0,2.0,3.0] and prepared.projection.forward==[1.0,0.0,0.0],"refdef camera preserved")
  rounded=viewport.prepare(fixture(1,1,1,1),3,3,10,10);if rounded is error then return rounded end if
  count=count+require(rounded.area.x==3 and rounded.area.y==3 and rounded.area.width==3 and rounded.area.height==3,"scaled edges share deterministic rounding")
  count=count+require(try(viewport.prepare(fixture(621,0,40,10),640,480,320,240)) is error,"out-of-source rectangle rejected")
  count=count+require(try(viewport.prepare(fixture(0,0,640,480),0,480,640,480)) is error,"invalid source dimensions rejected")
  bad=fixture(0,0,640,480);bad.viewaxis=[];count=count+require(try(viewport.prepare(bad,640,480,640,480)) is error,"incomplete camera rejected")
  print("PASS: "+str(count)+" QVM viewport contracts");return 0
end function
