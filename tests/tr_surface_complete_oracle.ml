import mq3.renderer.tr_surface_runtime as tr
import mq3.compat.numeric as numeric
function hex32(value) digits="0123456789abcdef";result="";for i=0 to 7 result=digits[(value>>(i*4))&15]+result end for;return result end function
function emit(name,local,radius,lod,origin,orientation,viewOrigin,forward) print(name+"|"+hex32(numeric.floatBits(tr.LodErrorForVolume(local,radius,lod,origin,orientation,viewOrigin,forward)))) end function
function main(args)
 identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];zero=[0.0,0.0,0.0];point=[2.25,-3.5,4.75]
 emit("front",zero,2.0,8.0,[12.0,0.0,0.0],identity,zero,[1.0,0.0,0.0])
 emit("behind",zero,2.0,8.0,[-12.0,0.0,0.0],identity,zero,[1.0,0.0,0.0])
 emit("clamp",zero,20.0,8.0,[12.0,0.0,0.0],identity,zero,[1.0,0.0,0.0])
 emit("negative",point,2.0,-1.0,[12.0,0.0,0.0],identity,zero,[1.0,0.0,0.0])
 orientation=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]
 emit("oriented",point,1.125,13.25,[5.5,-2.0,7.0],orientation,[-10.0,3.0,1.0],[0.6,0.8,0.0]);return 0
end function
