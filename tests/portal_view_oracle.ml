import mq3.renderer.portal_view as portal
import mq3.compat.numeric as numeric
struct Entity reType origin oldorigin axis oldframe frame skinNum end struct
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=digits[(value>>(i*4))&15]+textValue end for;return textValue end function
function bits3(value) return hex32(numeric.floatBits(value[0]))+","+hex32(numeric.floatBits(value[1]))+","+hex32(numeric.floatBits(value[2])) end function
function emit(name,entity,time)
  value=portal.prepare([1.0,0.0,0.0],5.0,[entity],time,[1.0,2.0,3.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
  if value==void then print(name+"|O0|M-1");return void end if
  mirror=0;if value.mirror then mirror=1 end if;print(name+"|O1|M"+str(mirror)+"|S"+bits3(value.surface.origin)+"|C"+bits3(value.camera.origin)+"|P"+bits3(value.pvsOrigin)+"|V"+bits3(value.origin)+"|F"+bits3(value.axis[0]))
end function
function main(args)
  axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];mirror=Entity(7,[5.0,2.0,3.0],[5.0,2.0,3.0],axis,0,0,0);emit("mirror",mirror,1000)
  camera=Entity(7,[5.0,10.0,3.0],[100.0,20.0,30.0],axis,0,0,90);emit("camera",camera,1000)
  missing=Entity(7,[80.0,10.0,3.0],[100.0,20.0,30.0],axis,0,0,90);emit("missing",missing,1000);return 0
end function
