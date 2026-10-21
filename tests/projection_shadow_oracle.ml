import mq3.renderer.qvm_scene_geometry as geometry
import mq3.compat.numeric as numeric

function rounded(value)
  if value>=0.0 then return numeric.trunc32(value*10000.0+0.5) end if
  return numeric.trunc32(value*10000.0-0.5)
end function
function emit(name,point,plane,light,origin,axis)
  projected=geometry.projectionShadowPointOriented(point,plane,light,origin,axis)
  print(name+"|"+str(rounded(projected[0]))+","+str(rounded(projected[1]))+","+str(rounded(projected[2])))
end function
function main(args)
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];point=[2.0,1.0,4.0];zero=[0.0,0.0,0.0];origin=[10.0,20.0,30.0]
  emit("identity",point,1.0,[0.0,0.0,1.0],zero,identity)
  emit("shallow",point,1.0,[1.0,0.0,0.1],zero,identity)
  emit("yaw",point,25.0,[0.2,0.3,0.9327379],origin,[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]])
  emit("tilt",point,25.0,[0.2,0.3,0.9327379],origin,[[1.0,0.0,0.0],[0.0,0.70710677,0.70710677],[0.0,-0.70710677,0.70710677]])
  emit("scaled",point,25.0,[0.2,0.3,0.9327379],origin,[[2.0,0.0,0.0],[0.0,1.5,0.0],[0.0,0.0,0.5]])
  return 0
end function
