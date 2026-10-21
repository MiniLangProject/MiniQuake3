import mq3.renderer.mark_fragments as marks
import mq3.compat.numeric as numeric

function hex32(value)
  digits="0123456789abcdef";textValue="";v=value
  for i=0 to 7 textValue=digits[(v>>(i*4))&15]+textValue end for
  return textValue
end function
function pointBits(value) return hex32(numeric.floatBits(value[0]))+","+hex32(numeric.floatBits(value[1]))+","+hex32(numeric.floatBits(value[2])) end function
function emit(name,points)
  line=name+"|"+str(len(points));for each point in points line=line+"|"+pointBits(point) end for;print(line);return void
end function
function main(args)
  square=[[-1.0,-1.0,0.0],[1.0,-1.0,0.0],[1.0,1.0,0.0],[-1.0,1.0,0.0]]
  emit("front",marks.clipPlane(square,marks.Plane([1.0,0.0,0.0],-2.0)))
  emit("back",marks.clipPlane(square,marks.Plane([1.0,0.0,0.0],2.0)))
  emit("split",marks.clipPlane(square,marks.Plane([1.0,0.0,0.0],0.0)))
  clipped=marks.clipTriangle([[-1.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]],[marks.Plane([1.0,0.0,0.0],0.0)])
  line="add|1|"+str(len(clipped))+"|0|"+str(len(clipped));for each point in clipped line=line+"|"+pointBits(point) end for;print(line)
  print("capacity|0|0")
  return 0
end function
