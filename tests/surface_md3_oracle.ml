import mq3.renderer.surface_md3 as mesh
import mq3.compat.numeric as numeric

function makeSurface()
  f0=[mesh.vertex(64,0,0,0x0000),mesh.vertex(0,64,0,0x0040),mesh.vertex(-64,0,64,0x4000),mesh.vertex(32,-32,96,0x4040)]
  f1=[mesh.vertex(128,64,0,0x0040),mesh.vertex(64,128,64,0x4000),mesh.vertex(-128,64,128,0x4040),mesh.vertex(96,-96,160,0x0080)]
  return mesh.surface(2,4,2,[0,1,2,2,3,0],[[0.0,1.0],[0.25,0.875],[0.5,0.75],[0.75,0.625]],[f0,f1])
end function
function hex32(v) digits=bytes("0123456789abcdef");result="";for i=0 to 7;shift=(7-i)*4;result=result+decode(bytes([digits[(v>>shift)&15]]));end for;return result end function
function emit(name,b)
  flush=0;if b.flushed then flush=1 end if
  text=name+"|V"+str(b.numVertexes)+"|I"+str(b.numIndexes)+"|F"+str(flush)+"|D"+str(b.dlightBits)
  for i=0 to len(b.xyz)-1
    text=text+"|P"+hex32(numeric.floatBits(b.xyz[i][0]))+","+hex32(numeric.floatBits(b.xyz[i][1]))+","+hex32(numeric.floatBits(b.xyz[i][2]))
    text=text+"|N"+hex32(numeric.floatBits(b.normals[i][0]))+","+hex32(numeric.floatBits(b.normals[i][1]))+","+hex32(numeric.floatBits(b.normals[i][2]))
    text=text+"|T"+hex32(numeric.floatBits(b.texCoords[i][0]))+","+hex32(numeric.floatBits(b.texCoords[i][1]))
  end for
  text=text+"|X";for i=0 to len(b.indexes)-1;if i>0 then text=text+"," end if;text=text+str(b.indexes[i]);end for
  print(text)
end function
function main(args)
  s=makeSurface();emit("direct",mesh.submit(s,1,0,0.75,2,3,16,48,13));emit("sameframe",mesh.submit(s,1,1,0.75,0,0,16,48,13));emit("overflow",mesh.submit(s,1,0,0.25,14,44,16,48,13));return 0
end function
