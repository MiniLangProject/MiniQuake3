import mq3.renderer.tr_main_runtime as tr
import mq3.compat.numeric as numeric
function hex32(v) digits=bytes("0123456789abcdef");result="";for i=0 to 7 shift=(7-i)*4;result=result+decode(bytes([digits[(v>>shift)&15]])) end for;return result end function
function emit(name,matrix) text=name;for each value in matrix text=text+"|"+hex32(numeric.floatBits(value)) end for;print(text) end function
function main(args)
 identity=tr.identityMatrix();affine=[2.0,0.0,0.0,0.0,0.0,3.0,0.0,0.0,0.0,0.0,4.0,0.0,5.0,6.0,7.0,1.0];mixed=[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0]
 emit("I",tr.myGlMultMatrix(identity,affine));emit("A",tr.myGlMultMatrix(affine,mixed));emit("M",tr.myGlMultMatrix(mixed,affine));return 0
end function
