import mq3.renderer.tr_sky as sky
import mq3.compat.numeric as n

function quant(value)
  if value<0.0 then return n.trunc32(value*10000.0-0.5) end if
  return n.trunc32(value*10000.0+0.5)
end function
function emit(value) print(str(quant(value))) end function

function main(args)
  for axis=0 to 5
    value=sky.makeSkyVec(0.25,-0.5,axis,1024.0,0.0,1.0)
    for i=0 to 2 emit(value.xyz[i]) end for;emit(value.st[0]);emit(value.st[1])
  end for
  bounds=sky.clearSkyBox();polygon=[[10.0,-2.0,-1.0],[10.0,3.0,-1.0],[10.0,3.0,4.0],[10.0,-2.0,4.0]];emit(sky.addSkyPolygon(bounds,polygon));emit(bounds.minS[0]);emit(bounds.minT[0]);emit(bounds.maxS[0]);emit(bounds.maxT[0])
  clipped=sky.rbClipSkyPolygons([[-4.0,-2.0,1.0],[4.0,-2.0,1.0],[0.0,5.0,2.0]],[0,1,2],[0.0,0.0,0.0]);if clipped is error then return clipped end if
  for axis=0 to 5 emit(clipped.minS[axis]);emit(clipped.minT[axis]);emit(clipped.maxS[axis]);emit(clipped.maxT[axis]) end for
  table=sky.rInitSkyTexCoords(512.0);emit(table.factors[4][4][4]);emit(table.coords[4][4][4][0]);emit(table.coords[4][4][4][1])
  return 0
end function
