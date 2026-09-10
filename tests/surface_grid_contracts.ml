import mq3.renderer.surface_grid as grid

function require(ok,text) if not ok then return error(7310,text) end if;return 1 end function
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

function main(args)
  count=0;g=makeGrid();filtered=grid.submit(g,2.0,16,96,true,5)
  count=count+require(filtered.widthTable==[0,2,4],"width LOD selection")
  count=count+require(filtered.heightTable==[0,1,3,4],"height LOD selection")
  count=count+require(len(filtered.batches)==1 and filtered.flushes==0,"filtered grid fits one batch")
  b=filtered.batches[0]
  count=count+require(b.numVertexes==12 and b.numIndexes==36,"filtered counts")
  count=count+require(b.indexes[0]==0 and b.indexes[1]==3 and b.indexes[2]==1 and b.indexes[6]==1 and b.indexes[10]==4 and b.indexes[11]==5,"triangle winding")
  count=count+require(b.xyz[4]==[6.0,0.5,1.0],"selected source position")
  count=count+require(b.normals[4]==[0.0,0.0,1.0],"normal copy")
  count=count+require(b.texCoords[4]==[1.0,0.5,0.25,0.5],"both texture channels")
  count=count+require(b.colors[4]==[12,13,14,16],"packed color copy")
  count=count+require(b.vertexDlightBits[4]==5 and b.dlightBits==5,"vertex and batch dlights")
  count=count+require(filtered.numVertexes==12 and filtered.numIndexes==36 and filtered.dlightBits==5,"submission totals")

  full=grid.submit(g,20.0,16,96,false,9)
  count=count+require(full.widthTable==[0,1,2,3,4] and full.heightTable==[0,1,2,3,4],"full LOD selection")
  count=count+require(len(full.batches)==4 and full.flushes==3,"large grid splits into strips")
  count=count+require(full.batches[0].numVertexes==10 and full.batches[0].numIndexes==24,"first strip counts")
  count=count+require(full.batches[3].numVertexes==10 and full.batches[3].numIndexes==24,"last strip counts")
  count=count+require(full.batches[0].dlightBits==9 and full.batches[1].dlightBits==0,"flush resets aggregate dlights")
  count=count+require(full.batches[0].xyz[5]==full.batches[1].xyz[0],"first overlap row repeated")
  count=count+require(full.batches[2].xyz[5]==full.batches[3].xyz[0],"last overlap row repeated")
  count=count+require(full.batches[0].normals==[void,void,void,void,void,void,void,void,void,void],"unneeded normals skipped")
  count=count+require(full.batches[2].indexes[23]==9,"local batch indexes")
  count=count+require(full.numVertexes==40 and full.numIndexes==96,"split submission totals include overlaps")
  count=count+require(grid.selectAxis(5,[0.0,2.0,2.1,2.0,0.0],2.0)==[0,1,3,4],"LOD equality retained")
  count=count+require(grid.vertex([0.0,0.0,0.0],[0.0,0.0,1.0],[0.0,0.0],[0.0,0.0],[257,-1,511,256]).color==[1,255,255,0],"color byte packing")
  count=count+require(try(grid.submit(grid.grid(1,2,[0.0],[0.0,0.0],[]),1.0,16,96,true,0)) is error,"small grid rejected")
  count=count+require(try(grid.submit(grid.grid(3,2,[0.0,0.0],[0.0,0.0],[]),1.0,16,96,true,0)) is error,"LOD table mismatch rejected")
  count=count+require(try(grid.submit(grid.grid(2,2,[0.0,0.0],[0.0,0.0],[gv(0,0)]),1.0,16,96,true,0)) is error,"vertex count mismatch rejected")
  bad=grid.GridVertex([0.0],[0.0,0.0,1.0],[0.0,0.0],[0.0,0.0],[1,2,3,4])
  count=count+require(try(grid.submit(grid.grid(2,2,[0.0,0.0],[0.0,0.0],[bad,gv(0,1),gv(1,0),gv(1,1)]),1.0,16,96,true,0)) is error,"malformed vertex rejected")
  count=count+require(try(grid.submit(g,20.0,9,96,true,0)) is error,"vertex strip capacity rejected")
  count=count+require(try(grid.submit(g,20.0,16,59,true,0)) is error,"nonadvancing index capacity rejected")
  count=count+require(try(grid.submit(g,20.0,0,96,true,0)) is error,"invalid capacity rejected")
  print("PASS: "+str(count)+" surface-grid contracts")
  return 0
end function
