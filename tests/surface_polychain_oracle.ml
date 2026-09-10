import mq3.renderer.surface_polychain as poly

function add(vertices,x,y,z,s,t,color)
  return vertices+[poly.vertex(x/2.0,y/2.0,z/2.0,s/2.0,t/2.0,color,color+1,color+2,color+3)]
end function
function emit(name,b,firstVertex,firstIndex)
  line=name+"|V"+str(b.numVertexes)+"|I"+str(b.numIndexes)
  for i=firstVertex to b.numVertexes-1
    p=b.xyz[i];t=b.texCoords[i];c=b.colors[i]
    line=line+"|P"+str(p[0]*2)+","+str(p[1]*2)+","+str(p[2]*2)+"|T"+str(t[0]*2)+","+str(t[1]*2)+"|C"+str(c[0])+","+str(c[1])+","+str(c[2])+","+str(c[3])
  end for
  for i=firstIndex to b.numIndexes-1 line=line+"|"+str(b.indexes[i]) end for
  print(line)
end function
function main(args)
  b=poly.create(64,256);v=[];v=add(v,0,0,0,0,0,10);v=add(v,2,0,0,2,0,20);v=add(v,0,2,0,0,2,30);poly.append(b,v);emit("tri",b,0,0)
  b=poly.create(64,256);v=[];v=add(v,-2,0,2,0,0,40);v=add(v,0,-2,2,2,0,44);v=add(v,2,0,2,4,2,48);v=add(v,0,2,2,2,4,52);v=add(v,-2,2,2,0,4,56);poly.append(b,v);emit("pent",b,0,0)
  b=poly.create(64,256);v=[];v=add(v,0,0,0,0,0,1);v=add(v,2,0,0,2,0,5);v=add(v,0,2,0,0,2,9);poly.append(b,v)
  v=[];v=add(v,4,0,0,0,0,70);v=add(v,6,0,0,2,0,74);v=add(v,6,2,0,2,2,78);v=add(v,4,2,0,0,2,82);poly.append(b,v);emit("append",b,3,3)
  return 0
end function
