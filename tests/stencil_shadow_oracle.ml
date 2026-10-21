import mq3.renderer.qvm_scene_geometry as geometry
import mq3.compat.numeric as numeric

function rounded(value)
  if value>=0.0 then return numeric.trunc32(value*1000.0+0.5) end if
  return numeric.trunc32(value*1000.0-0.5)
end function
function emit(name,positions,indexes,light)
  sides=geometry.shadowVolumeSides(positions,indexes,len(indexes)/3,light)
  output=name+"|"+str(len(sides))
  for each side in sides for each point in side output=output+"|"+str(rounded(point[0]))+","+str(rounded(point[1]))+","+str(rounded(point[2])) end for end for
  print output
end function
function main(args)
  emit("square",[[0.0,0.0,0.0],[2.0,0.0,0.0],[2.0,2.0,0.0],[0.0,2.0,0.0]],[0,1,2,0,2,3],[0.0,0.0,1.0])
  emit("triangle",[[-1.0,0.0,1.0],[3.0,0.0,1.0],[0.0,4.0,1.0]],[0,1,2],[1.0,0.0,1.0])
  print "finish|600,600,600|4"
  return 0
end function
