import mq3.renderer.view_math as view
import mq3.compat.numeric as numeric

function hex32(v) digits=bytes("0123456789abcdef");result="";for i=0 to 7;shift=(7-i)*4;result=result+decode(bytes([digits[(v>>shift)&15]]));end for;return result end function
function emit3(name,v) print(name+"|"+hex32(numeric.floatBits(v[0]))+"|"+hex32(numeric.floatBits(v[1]))+"|"+hex32(numeric.floatBits(v[2]))) end function
function setupOrientation() return view.orientation([10.0,-5.0,2.0],[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]) end function
function setupFrustum()
  return [view.plane([1.0,0.0,0.0],-10.0),view.plane([-1.0,0.0,0.0],-10.0),view.plane([0.0,1.0,0.0],-10.0),view.plane([0.0,-1.0,0.0],-10.0)]
end function
function main(args)
  value=setupOrientation();frustum=setupFrustum();p=[2.5,-3.0,4.25]
  emit3("N",view.localNormalToWorld(p,value));emit3("P",view.localPointToWorld(p,value));emit3("W",view.worldToLocal(p,value))
  model=[1.0,0.0,0.0,0.0,0.0,2.0,0.0,0.0,0.0,0.0,-1.0,0.0,3.0,-4.0,5.0,1.0]
  projection=[2.0,0.0,0.0,0.0,0.0,3.0,0.0,0.0,0.0,0.0,0.5,1.0,0.0,0.0,-2.0,0.0]
  transformed=view.transformModelToClip(p,model,projection);emit3("E",transformed[0]);clip=transformed[1]
  print("C|"+hex32(numeric.floatBits(clip[0]))+"|"+hex32(numeric.floatBits(clip[1]))+"|"+hex32(numeric.floatBits(clip[2]))+"|"+hex32(numeric.floatBits(clip[3])))
  projected=view.transformClipToWindow([-1.0,0.5,2.0,4.0],640,480);emit3("Z",projected.normalized);emit3("V",projected.window)
  print("S|"+str(view.cullPointAndRadius([0.0,0.0,0.0],1.0,frustum,false))+"|"+str(view.cullPointAndRadius([9.5,0.0,0.0],1.0,frustum,false))+"|"+str(view.cullPointAndRadius([12.0,0.0,0.0],1.0,frustum,false)))
  print("B|"+str(view.cullLocalBox([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],value,frustum,false))+"|"+str(view.cullLocalBox([[8.0,-1.0,-1.0],[12.0,1.0,1.0]],value,frustum,false))+"|"+str(view.cullLocalBox([[12.0,-1.0,-1.0],[14.0,1.0,1.0]],value,frustum,false)))
  print("L|"+str(view.cullLocalPointAndRadius([0.0,0.0,0.0],1.0,value,frustum,false)))
  print("X|"+str(view.cullPointAndRadius([0.0,0.0,0.0],1.0,frustum,true))+"|"+str(view.cullLocalBox([[12.0,-1.0,-1.0],[14.0,1.0,1.0]],value,frustum,true)))
  return 0
end function
