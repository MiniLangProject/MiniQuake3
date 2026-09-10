import mq3.renderer.view_math as view
import mq3.compat.numeric as numeric

function require(ok,text) if not ok then return error(7395,text) end if;return 1 end function
function same(a,b) return numeric.floatBits(a)==numeric.floatBits(b) end function
function same3(a,b) return same(a[0],b[0]) and same(a[1],b[1]) and same(a[2],b[2]) end function
function identity() return view.orientation([0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]) end function
function frustum()
  return [view.plane([1.0,0.0,0.0],-10.0),view.plane([-1.0,0.0,0.0],-10.0),view.plane([0.0,1.0,0.0],-10.0),view.plane([0.0,-1.0,0.0],-10.0)]
end function
function main(args)
  c=0;o=identity();f=frustum()
  c=c+require(view.CULL_IN==0 and view.CULL_CLIP==1 and view.CULL_OUT==2,"Baseq3 cull values")
  c=c+require(same3(view.localNormalToWorld([1.0,2.0,3.0],o),[1.0,2.0,3.0]),"identity normal")
  c=c+require(same3(view.localPointToWorld([1.0,2.0,3.0],o),[1.0,2.0,3.0]),"identity point")
  moved=view.orientation([4.0,-2.0,8.0],o.axis)
  c=c+require(same3(view.localPointToWorld([1.0,2.0,3.0],moved),[5.0,0.0,11.0]),"point adds origin")
  c=c+require(same3(view.localNormalToWorld([1.0,2.0,3.0],moved),[1.0,2.0,3.0]),"normal ignores origin")
  rotated=view.orientation([0.0,0.0,0.0],[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]])
  c=c+require(same3(view.localNormalToWorld([2.0,3.0,4.0],rotated),[-3.0,2.0,4.0]),"rotated normal")
  c=c+require(same3(view.worldToLocal([-3.0,2.0,4.0],rotated),[2.0,3.0,4.0]),"world projection")
  c=c+require(same3(view.worldToLocal([4.0,-2.0,8.0],moved),[4.0,-2.0,8.0]),"world projection ignores origin")
  unit=[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0]
  transformed=view.transformModelToClip([2.0,-3.0,4.0],unit,unit)
  c=c+require(same3(transformed[0],[2.0,-3.0,4.0]) and same(transformed[0][3],1.0),"identity model")
  c=c+require(same3(transformed[1],[2.0,-3.0,4.0]) and same(transformed[1][3],1.0),"identity projection")
  translation=[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,5.0,6.0,7.0,1.0]
  transformed=view.transformModelToClip([2.0,-3.0,4.0],translation,unit)
  c=c+require(same3(transformed[0],[7.0,3.0,11.0]),"model translation")
  window=view.transformClipToWindow([0.0,0.0,0.0,1.0],640,480)
  c=c+require(same3(window.normalized,[0.0,0.0,0.5]),"clip center normalized")
  c=c+require(same3(window.window,[320.0,240.0,0.5]),"clip center window")
  corner=view.transformClipToWindow([-1.0,-1.0,-1.0,1.0],641,481)
  c=c+require(same3(corner.window,[0.0,0.0,0.0]),"lower window corner")
  corner=view.transformClipToWindow([1.0,1.0,1.0,1.0],641,481)
  c=c+require(same3(corner.window,[641.0,481.0,1.0]),"upper window corner")
  rounded=view.transformClipToWindow([0.0,0.0,0.0,1.0],641,481)
  c=c+require(same3(rounded.window,[321.0,241.0,0.5]),"Baseq3 pixel rounding")
  c=c+require(view.cullPointAndRadius([0.0,0.0,0.0],1.0,f,false)==view.CULL_IN,"sphere inside")
  c=c+require(view.cullPointAndRadius([9.0,0.0,0.0],1.0,f,false)==view.CULL_CLIP,"sphere tangent clips")
  c=c+require(view.cullPointAndRadius([9.1,0.0,0.0],1.0,f,false)==view.CULL_CLIP,"sphere overlaps plane")
  c=c+require(view.cullPointAndRadius([11.1,0.0,0.0],1.0,f,false)==view.CULL_OUT,"sphere outside")
  c=c+require(view.cullPointAndRadius([50.0,0.0,0.0],1.0,f,true)==view.CULL_CLIP,"sphere nocull")
  c=c+require(view.cullLocalPointAndRadius([0.0,0.0,0.0],1.0,o,f,false)==view.CULL_IN,"local sphere inside")
  c=c+require(view.cullLocalPointAndRadius([0.0,0.0,0.0],1.0,view.orientation([12.0,0.0,0.0],o.axis),f,false)==view.CULL_OUT,"local sphere transformed")
  c=c+require(view.cullLocalBox([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],o,f,false)==view.CULL_IN,"box inside")
  c=c+require(view.cullLocalBox([[9.0,-1.0,-1.0],[11.0,1.0,1.0]],o,f,false)==view.CULL_CLIP,"box clips")
  c=c+require(view.cullLocalBox([[11.0,-1.0,-1.0],[13.0,1.0,1.0]],o,f,false)==view.CULL_OUT,"box outside")
  c=c+require(view.cullLocalBox([[11.0,-1.0,-1.0],[13.0,1.0,1.0]],o,f,true)==view.CULL_CLIP,"box nocull")
  c=c+require(view.cullLocalBox([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],view.orientation([9.5,0.0,0.0],o.axis),f,false)==view.CULL_CLIP,"translated box clips")
  c=c+require(try(view.localPointToWorld([1.0,2.0],o)) is error,"short point rejected")
  c=c+require(try(view.localNormalToWorld([1.0,2.0,3.0],void)) is error,"missing orientation rejected")
  c=c+require(try(view.transformModelToClip([0.0,0.0,0.0],[1.0],unit)) is error,"short matrix rejected")
  c=c+require(try(view.transformClipToWindow([0.0,0.0,1.0],640,480)) is error,"short clip rejected")
  c=c+require(try(view.transformClipToWindow([0.0,0.0,0.0,1.0],-1,480)) is error,"negative viewport rejected")
  c=c+require(try(view.cullPointAndRadius([0.0,0.0,0.0],-1.0,f,false)) is error,"negative radius rejected")
  c=c+require(try(view.cullPointAndRadius([0.0,0.0,0.0],1.0,[f[0]],false)) is error,"short frustum rejected")
  c=c+require(try(view.cullLocalBox([[0.0,0.0,0.0]],o,f,false)) is error,"short bounds rejected")
  print("PASS: "+str(c)+" renderer-view-math contracts");return 0
end function
