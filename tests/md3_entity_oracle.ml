import mq3.renderer.md3_entity as entity
import mq3.compat.numeric as numeric

function hex32(value)
  digits="0123456789abcdef";textValue="";v=value
  for i=0 to 7 textValue=digits[(v>>(i*4))&15]+textValue end for
  return textValue
end function
function flag(value) if value then return 1 end if;return 0 end function
function emit(name,lods,x,scale,bias,frame,oldFrame,flags)
  mins=[-3.0,-4.0,0.0];maxs=[3.0,4.0,0.0];projection=array(16,0.0);projection[5]=1.0;projection[11]=-1.0
  radius=entity.radiusFromBounds(mins,maxs);projected=entity.projectRadius(radius,[numeric.f32(x),0.0,0.0],[0.0,0.0,0.0],[1.0,0.0,0.0],projection)
  lod=entity.computeLod(lods,mins,maxs,[numeric.f32(x),0.0,0.0],[0.0,0.0,0.0],[1.0,0.0,0.0],projection,numeric.f32(scale),bias)
  frames=entity.normalizeFrames(2,frame,oldFrame,flags)
  print(name+"|P"+hex32(numeric.floatBits(projected))+"|L"+str(lod)+"|F"+str(frames.frame)+","+str(frames.oldFrame)+","+str(flag(frames.wrapped))+","+str(flag(frames.repaired)))
end function
function main(args)
  emit("far",3,100.0,5.0,0,5,4,512)
  emit("middle",3,25.0,2.0,0,1,0,0)
  emit("near",3,2.0,5.0,0,2,1,512)
  emit("behind",3,-20.0,5.0,1,-1,8,512)
  emit("scale-cap",4,100.0,99.0,-1,7,6,0)
  emit("single",1,100.0,5.0,9,8,-2,0)
  return 0
end function
