import mq3.renderer.surface_entities as entities
import mq3.compat.numeric as numeric

function hex32(value) digits=bytes("0123456789abcdef");result="";for i=0 to 7;shift=(7-i)*4;result=result+decode(bytes([digits[(value>>shift)&15]]));end for;return result end function
function emit(name,value)
  flag=0;if value.flushed then flag=1 end if
  line=name+"|V"+str(value.numVertexes)+"|I"+str(value.numIndexes)+"|F"+str(flag)
  for each v in value.vertices
    line=line+"|P"+hex32(numeric.floatBits(v.xyz[0]))+","+hex32(numeric.floatBits(v.xyz[1]))+","+hex32(numeric.floatBits(v.xyz[2]))
    line=line+"|N"+hex32(numeric.floatBits(v.normal[0]))+","+hex32(numeric.floatBits(v.normal[1]))+","+hex32(numeric.floatBits(v.normal[2]))
    line=line+"|T"+hex32(numeric.floatBits(v.tex0[0]))+","+hex32(numeric.floatBits(v.tex0[1]))+","+hex32(numeric.floatBits(v.tex1[0]))+","+hex32(numeric.floatBits(v.tex1[1]))
    line=line+"|C"+str(v.color[0])+","+str(v.color[1])+","+str(v.color[2])+","+str(v.color[3])
  end for
  line=line+"|X";for i=0 to len(value.indexes)-1 if i>0 then line=line+"," end if;line=line+str(value.indexes[i]) end for
  print(line)
end function
function sprite(name,rotation,mirror,bv,bi) emit(name,entities.surfaceSprite([10.0,20.0,30.0],2.0,rotation,[11,22,33,44],[0.0,1.0,0.0],[0.0,0.0,1.0],[1.0,0.0,0.0],mirror,bv,bi,16,48)) end function
function main(args)
  sprite("plain",0.0,false,0,0);sprite("rot90",90.0,false,0,0);sprite("mirror",0.0,true,0,0);sprite("rot33",33.0,false,2,3);sprite("overflow",15.0,true,13,43)
  emit("extended",entities.addQuadStampExt([1.0,2.0,3.0],[4.0,5.0,6.0],[-1.0,-2.0,-3.0],[250,128,1,255],[1.0,0.0,0.0],-0.25,0.125,1.5,2.0,0,0,16,48))
  return 0
end function
