import mq3.renderer.surface_grid as grid

function gv(row,col)
  n=row*10+col
  return grid.vertex([n/2.0,row/2.0,col/2.0],[0.0,0.0,1.0],[col/2.0,row/2.0],[row/4.0,col/4.0],[n,n+1,n+2,260+n])
end function
function makeGrid()
  verts=[]
  for row=0 to 4
    for col=0 to 4
      verts=verts+[gv(row,col)]
    end for
  end for
  return grid.grid(5,5,[0.0,10.0,1.0,10.0,0.0],[0.0,0.0,5.0,0.0,0.0],verts)
end function
function emit(name,b)
  sx=0;sy=0;sz=0;sn=0;s0=0;s1=0;l0=0;l1=0;c0=0;c1=0;c2=0;c3=0;dl=0;ix=0
  for i=0 to b.numVertexes-1
    sx=sx+b.xyz[i][0]*2;sy=sy+b.xyz[i][1]*2;sz=sz+b.xyz[i][2]*2
    if b.normals[i]!=void then sn=sn+b.normals[i][2]*2 end if
    s0=s0+b.texCoords[i][0]*2;s1=s1+b.texCoords[i][1]*2;l0=l0+b.texCoords[i][2]*4;l1=l1+b.texCoords[i][3]*4
    c0=c0+b.colors[i][0];c1=c1+b.colors[i][1];c2=c2+b.colors[i][2];c3=c3+b.colors[i][3];dl=dl+b.vertexDlightBits[i]
  end for
  for i=0 to b.numIndexes-1
    ix=ix+b.indexes[i]
  end for
  print(name+"|V"+str(b.numVertexes)+"|I"+str(b.numIndexes)+"|D"+str(b.dlightBits)+"|P"+str(sx)+","+str(sy)+","+str(sz)+"|N"+str(sn)+"|T"+str(s0)+","+str(s1)+","+str(l0)+","+str(l1)+"|C"+str(c0)+","+str(c1)+","+str(c2)+","+str(c3)+"|L"+str(dl)+"|X"+str(ix)+"|E"+str(b.xyz[0][0]*2)+","+str(b.xyz[b.numVertexes-1][0]*2))
end function
function main(args)
  g=makeGrid();filtered=grid.submit(g,2.0,16,96,true,5)
  for i=0 to len(filtered.batches)-1
    emit("filtered"+str(i),filtered.batches[i])
  end for
  full=grid.submit(g,20.0,16,96,true,9)
  for i=0 to len(full.batches)-1
    emit("full"+str(i),full.batches[i])
  end for
  return 0
end function
