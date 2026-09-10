import mq3.renderer.surface_mesh as mesh
import mq3.compat.numeric as numeric
function verts() r=[];for n=1 to 4;r=r+[mesh.vertex([n,n+1,n+2],[0.0,0.5,1.0],[n*0.1,n*0.2],[n*0.3,n*0.4],[n+1,n+2,n+3,250+n])];end for;return r end function
function emit(name,b)
  sx=0;sn=0;st=0;col=0;vl=0;ix=0
  for i=0 to len(b.xyz)-1
    sx=sx+numeric.trunc32(b.xyz[i][0]*10)+numeric.trunc32(b.xyz[i][1]*10)+numeric.trunc32(b.xyz[i][2]*10)
    if b.normals[i]!=void then sn=sn+numeric.trunc32(b.normals[i][0]*10)+numeric.trunc32(b.normals[i][1]*10)+numeric.trunc32(b.normals[i][2]*10) end if
    st=st+numeric.trunc32(b.texCoords[i][0]*10)+numeric.trunc32(b.texCoords[i][1]*10)+numeric.trunc32(b.texCoords[i][2]*10)+numeric.trunc32(b.texCoords[i][3]*10)
    c=b.colors[i];packed=(c[0]|(c[1]<<8)|(c[2]<<16)|(c[3]<<24));if packed>=0x80000000 then packed=packed-0x100000000 end if;col=col+packed;vl=vl+b.vertexDlightBits[i]
  end for
  for each v in b.indexes ix=ix+v end for
  f=0;if b.flushed then f=1 end if
  print(name+"|V"+str(b.numVertexes)+"|I"+str(b.numIndexes)+"|F"+str(f)+"|D"+str(b.dlightBits)+"|P"+str(sx)+"|N"+str(sn)+"|T"+str(st)+"|C"+str(col)+"|L"+str(vl)+"|X"+str(ix))
end function
function main(args)
  v=verts();idx=[0,1,2,2,3,0];tri=mesh.triangles(v,idx,[5,9]);emit("tri",mesh.submitTriangles(tri,0,true,2,3,8,18,2));emit("triOverflow",mesh.submitTriangles(tri,1,false,6,15,8,18,4));face=mesh.face([0.25,0.5,0.75],v,idx,[0,10]);emit("faceOverflow",mesh.submitFace(face,1,true,6,15,8,18,4));return 0
end function
