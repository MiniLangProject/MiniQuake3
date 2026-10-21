import mq3.renderer.surface_trails as trails
import mq3.compat.numeric as numeric
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=digits[(value>>(i*4))&15]+textValue end for;return textValue end function
function emit(name,value)
  line=name+"|V"+str(len(value.vertices))+"|I"+str(len(value.indexes))
  for each vertex in value.vertices line=line+"|"+hex32(numeric.floatBits(vertex.xyz[0]))+","+hex32(numeric.floatBits(vertex.xyz[1]))+","+hex32(numeric.floatBits(vertex.xyz[2]))+";"+hex32(numeric.floatBits(vertex.uv[0]))+","+hex32(numeric.floatBits(vertex.uv[1]))+";"+str(vertex.color[0])+","+str(vertex.color[1])+","+str(vertex.color[2]) end for
  line=line+"|X";for i=0 to len(value.indexes)-1 if i>0 then line=line+"," end if;line=line+str(value.indexes[i]) end for;print(line)
end function
function main(args)
  color=[200,100,50,230];emit("core",trails.railCoreRaw([1.0,2.0,3.0],[9.0,-2.0,7.0],[0.0,0.6,0.8],9,6.0,color))
  emit("rings",trails.railDiscs(3,[1.0,2.0,3.0],[8.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],16.0,color));return 0
end function
