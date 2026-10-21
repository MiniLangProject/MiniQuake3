import mq3.renderer.surface_beam as beam
import mq3.compat.numeric as numeric
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=digits[(value>>(i*4))&15]+textValue end for;return textValue end function
function emit(name,origin,oldOrigin)
  value=beam.build(origin,oldOrigin);line=name+"|V"+str(len(value.vertices));for each vertex in value.vertices line=line+"|"+hex32(numeric.floatBits(vertex.xyz[0]))+","+hex32(numeric.floatBits(vertex.xyz[1]))+","+hex32(numeric.floatBits(vertex.xyz[2])) end for;print(line)
end function
function main(args) emit("diagonal",[10.0,-4.0,2.0],[34.0,8.0,14.0]);emit("zero",[1.0,2.0,3.0],[1.0,2.0,3.0]);return 0 end function
