import mq3.renderer.tr_curve_runtime as curve
import mq3.renderer.bsp_render_data as render

function req(ok,message) if not ok then return error(7731,message) end if;return 1 end function
function near(a,b) return a-b<0.0002 and b-a<0.0002 end function
function makeVertex(x,y,z,c) return render.RenderVertex([x,y,z],[x*0.1,y*0.1],[x*0.2,y*0.2],[0.0,0.0,0.0],[c,c+1,c+2,255],[255,255,255,255],[0.0,0.0],0.0,-1) end function
function plane(width,height)
  values=[];for row=0 to height-1 for column=0 to width-1 values=values+[makeVertex(column,row,0.0,10+row*width+column)] end for end for;return values
end function
function main(args)
  count=0
  a=makeVertex(0.0,2.0,4.0,10);b=makeVertex(2.0,4.0,6.0,21);v=curve.LerpDrawVert(a,b)
  count=count+req(v.position==[1.0,3.0,5.0] and near(v.baseUV[0],0.1) and near(v.baseUV[1],0.3),"LerpDrawVert floats")
  count=count+req(v.color==[15,16,17,255],"LerpDrawVert byte truncation")
  ctrl=plane(3,2);transposed=curve.Transpose(3,2,ctrl);count=count+req(len(transposed)==6 and transposed[0]==ctrl[0] and transposed[1]==ctrl[3] and transposed[4]==ctrl[2],"Transpose rectangular")
  inverted=curve.InvertCtrl(3,2,ctrl);count=count+req(inverted[0]==ctrl[2] and inverted[2]==ctrl[0] and inverted[3]==ctrl[5],"InvertCtrl rows")
  errors=curve.InvertErrorTable([[1.0,2.0,3.0],[10.0,20.0,30.0,40.0]],3,4);count=count+req(errors[0][0]==40.0 and errors[0][3]==10.0 and errors[1][0]==1.0 and errors[1][2]==3.0,"InvertErrorTable axes")
  curved=plane(3,3);curved[4]=makeVertex(1.0,1.0,8.0,14);onCurve=curve.PutPointsOnCurve(curved,3,3);count=count+req(near(onCurve[4].position[2],2.0),"PutPointsOnCurve two-axis midpoint")
  normals=curve.MakeMeshNormals(3,3,plane(3,3));middle=normals[4].normal;count=count+req(near(middle[0],0.0) and near(middle[1],0.0) and (near(middle[2],1.0) or near(middle[2],-1.0)),"MakeMeshNormals planar")
  repeated=plane(3,3);repeated[1]=repeated[0];repeated[2]=repeated[0];repeated=curve.MakeMeshNormals(3,3,repeated);count=count+req(len(repeated)==9,"MakeMeshNormals degenerate search")
  table=[[0.0,1.0,2.0],[0.0,3.0,4.0]];grid=curve.R_CreateSurfaceGridMesh(3,3,plane(3,3),table)
  count=count+req(grid.surfaceType==curve.SF_GRID and grid.width==3 and grid.height==3 and len(grid.verts)==9,"R_CreateSurfaceGridMesh shape")
  count=count+req(grid.meshBounds==[[0,0,0.0],[2,2,0.0]] and grid.localOrigin==[1.0,1.0,0.0],"grid bounds and origin")
  count=count+req(near(grid.meshRadius,1.4142135) and grid.lodOrigin==grid.localOrigin and near(grid.lodRadius,grid.meshRadius),"grid radius and LOD group")
  count=count+req(grid.widthLodError==[0.0,1.0,2.0] and grid.heightLodError==[0.0,3.0,4.0],"grid LOD copies")
  flat=curve.R_SubdividePatchToGrid(3,3,plane(3,3),4.0);count=count+req(flat.width==2 and flat.height==2 and len(flat.verts)==4,"collinear patch reduction")
  control=plane(3,3);control[1]=makeVertex(1.0,0.0,12.0,11);control[4]=makeVertex(1.0,1.0,12.0,14);control[7]=makeVertex(1.0,2.0,12.0,17);fine=curve.R_SubdividePatchToGrid(3,3,control,1.0)
  count=count+req(fine.width>3 and fine.width<=curve.MAX_GRID_SIZE,"adaptive patch subdivision")
  count=count+req(len(fine.widthLodError)==fine.width and len(fine.heightLodError)==fine.height,"subdivision LOD tables")
  count=count+req(fine.width>=fine.height,"longest strip orientation")
  originalOrigin=grid.lodOrigin;originalRadius=grid.lodRadius;columnGrid=curve.R_GridInsertColumn(grid,1,1,[9.0,8.0,7.0],0.25)
  count=count+req(columnGrid.width==4 and columnGrid.height==3 and columnGrid.verts[1+columnGrid.width].position==[9.0,8.0,7.0],"R_GridInsertColumn point")
  count=count+req(columnGrid.widthLodError[1]==0.25 and columnGrid.lodOrigin==originalOrigin and columnGrid.lodRadius==originalRadius,"column LOD preservation")
  count=count+req(grid.freed and grid.verts==[],"column replacement frees old grid")
  rowGrid=curve.R_GridInsertRow(columnGrid,1,2,[6.0,5.0,4.0],0.5)
  count=count+req(rowGrid.width==4 and rowGrid.height==4 and rowGrid.verts[1*4+2].position==[6.0,5.0,4.0],"R_GridInsertRow point")
  count=count+req(rowGrid.heightLodError[1]==0.5 and columnGrid.freed,"row LOD and replacement free")
  count=count+req(try(curve.R_GridInsertColumn(rowGrid,0,0,[0.0,0.0,0.0],1.0)) is error,"invalid boundary column rejected")
  count=count+req(try(curve.R_SubdividePatchToGrid(2,3,plane(2,3),4.0)) is error,"invalid patch rejected")
  count=count+req(curve.R_FreeSurfaceGridMesh(rowGrid) and rowGrid.freed and rowGrid.widthLodError==[] and rowGrid.heightLodError==[],"R_FreeSurfaceGridMesh")
  count=count+req(not curve.R_FreeSurfaceGridMesh(void),"free null is harmless")
  maxCtrl=plane(65,2);maxErrors=[array(65,0.0),array(2,0.0)];maxGrid=curve.R_CreateSurfaceGridMesh(65,2,maxCtrl,maxErrors);count=count+req(curve.R_GridInsertColumn(maxGrid,1,0,[0.0,0.0,0.0],1.0)==void,"MAX_GRID_SIZE insertion ceiling")
  print("PASS: "+str(count)+" complete tr_curve contracts");return 0
end function
