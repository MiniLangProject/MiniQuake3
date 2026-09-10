import mq3.renderer.model_tags as tags
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans

function hex32(value)
  digits="0123456789abcdef";textValue="";v=value
  for i=0 to 7 textValue=digits[(v>>(i*4))&15]+textValue end for
  return textValue
end function
function bits3(v) return hex32(numeric.floatBits(v[0]))+","+hex32(numeric.floatBits(v[1]))+","+hex32(numeric.floatBits(v[2])) end function
function emit(name,o)
  found=0;if o.found then found=1 end if
  line=name+"|"+str(found)+"|"+bits3(o.origin)
  for r=0 to 2 for c=0 to 2 line=line+","+hex32(numeric.floatBits(o.axis[r][c])) end for end for
  print(line)
end function
function rotation(angle)
  angle=numeric.f32(angle)
  c=numeric.f32(trans.cos(angle));s=numeric.f32(trans.sin(angle))
  return [[c,s,0.0],[numeric.fneg(s),c,0.0],[0.0,0.0,1.0]]
end function
function main(args)
  i=tags.identityAxis();a=tags.tag("tag_weapon",[0.0,2.0,4.0],rotation(0.0));h=tags.tag("tag_head",[1.0,1.0,1.0],rotation(0.0))
  b=tags.tag("tag_weapon",[4.0,6.0,8.0],rotation(1.5707963267948966))
  data=tags.md3([[a,h],[b,h]],[-4.0,-5.0,-6.0],[7.0,8.0,9.0]);m=tags.model(void,data)
  emit("half",tags.lerpTag(m,0,1,0.5,"tag_weapon"));emit("start",tags.lerpTag(m,0,1,0.0,"tag_weapon"))
  emit("clamp",tags.lerpTag(m,9,8,0.25,"tag_weapon"));emit("missing",tags.lerpTag(m,0,1,0.5,"missing"));emit("nomodel",tags.lerpTag(tags.model(void,void),0,0,0.0,"x"))
  x=tags.modelBounds(m);print("md3bounds|"+bits3(x[0])+","+bits3(x[1]))
  x=tags.modelBounds(tags.model([[-1.0,-2.0,-3.0],[1.0,2.0,3.0]],data));print("brushbounds|"+bits3(x[0])+","+bits3(x[1]))
  return 0
end function
