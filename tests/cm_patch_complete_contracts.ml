import mq3.collision.patchmesh as mesh
import mq3.collision.patchtrace as patchtrace
import mq3.collision.brush as brush
import mq3.compat.numeric as n

struct Work maxs mins capsule start finish radius capsuleOffset trace isPoint end struct

function req(ok,label) if not ok then return error(7752,"cm_patch: "+label) end if;return 1 end function
function gridPoints()
  result=[]
  for y=0 to 2
    for x=0 to 2 result=result+[[n.f32(x*8-8),n.f32(y*8-8),0.0]] end for
  end for
  return result
end function
function columns(points)
  result=array(3,void)
  for x=0 to 2 result[x]=array(3,void);for y=0 to 2 result[x][y]=points[y*3+x] end for end for
  return result
end function
function main(args)
  count=0
  count=count+req(mesh.CM_SignbitsForNormal([-1.0,2.0,-3.0])==5,"sign bits")
  p=mesh.CM_PlaneFromPoints([0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]);count=count+req(p!=void and p.normal[2]<0.0 and mesh.CM_PlaneFromPoints([0.0,0.0,0.0],[1.0,0.0,0.0],[2.0,0.0,0.0])==void,"plane from points")
  count=count+req(mesh.CM_NeedsSubdivision([0.0,0.0,0.0],[0.0,100.0,0.0],[0.0,0.0,0.0]) and not mesh.CM_NeedsSubdivision([0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,2.0,0.0]),"subdivision threshold")
  divided=mesh.CM_Subdivide([0.0,0.0,0.0],[2.0,4.0,6.0],[4.0,8.0,12.0]);count=count+req(divided==[[1.0,2.0,3.0],[2.0,4.0,6.0],[3.0,6.0,9.0]],"subdivide")
  count=count+req(mesh.CM_ComparePoints([1.0,2.0,3.0],[1.09,1.91,3.09]) and not mesh.CM_ComparePoints([1.0,2.0,3.0],[1.11,2.0,3.0]),"point epsilon")
  points=gridPoints();grid=mesh.Grid(columns(points),false,false);mesh.CM_SetGridWrapWidth(grid);count=count+req(not grid.wrapWidth,"grid wrap false")
  flat=mesh.Grid(columns(points),false,false);mesh.CM_SubdivideGridColumns(flat);count=count+req(len(flat.columns)==2,"flat control removal")
  duplicate=mesh.Grid([[[0.0,0.0,0.0]],[[0.05,0.0,0.0]],[[2.0,0.0,0.0]]],false,false);mesh.CM_RemoveDegenerateColumns(duplicate);count=count+req(len(duplicate.columns)==2,"degenerate removal")
  transposed=mesh.Grid([[[1.0,0.0,0.0],[2.0,0.0,0.0]],[[3.0,0.0,0.0],[4.0,0.0,0.0]],[[5.0,0.0,0.0],[6.0,0.0,0.0]]],true,false);mesh.CM_TransposeGrid(transposed);count=count+req(len(transposed.columns)==2 and len(transposed.columns[0])==3 and not transposed.wrapWidth and transposed.wrapHeight,"transpose")
  base=mesh.Patch([],[],[[0.0,0.0,0.0],[0.0,0.0,0.0]],void);a=mesh.plane([0.0,0.0,1.0],4.0);b=mesh.plane([0.0,0.0,-1.0],-4.0)
  count=count+req(mesh.CM_PlaneEqual(a,a)==0 and mesh.CM_PlaneEqual(a,b)==1,"plane equality")
  found=mesh.CM_FindPlane2(base,a);flipped=mesh.CM_FindPlane2(base,b);count=count+req(found==[0,0] and flipped==[0,1] and len(base.planes)==1,"plane interning")
  count=count+req(mesh.CM_SnapVector([0.00001,0.99999,0.00002])==[0.0,1.0,0.0],"normal snapping")
  planeIndex=mesh.CM_FindPlane(base,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]);count=count+req(planeIndex>=0 and mesh.CM_PointOnPlaneSide(base,[0.0,0.0,1.0],planeIndex)==1 and mesh.CM_PointOnPlaneSide(base,[0.0,0.0,-1.0],planeIndex)==0,"find plane and side")
  gridPlanes=[[ [[-1,-1],[-1,-1]], [[-1,-1],[-1,-1]] ],[ [[-1,-1],[-1,-1]], [[-1,-1],[-1,-1]] ]];gridPlanes[0][0]=[planeIndex,-1];count=count+req(mesh.CM_GridPlane(gridPlanes,0,0,1)==planeIndex,"grid plane fallback")
  patch=mesh.CM_GeneratePatchCollide(3,3,points);count=count+req(len(patch.planes)>0 and len(patch.facets)>0,"generate patch collide")
  direct=mesh.Patch([],[],[[0.0,0.0,0.0],[0.0,0.0,0.0]],void);directGrid=mesh.Grid(columns(points),false,false);mesh.CM_SetGridWrapWidth(directGrid);mesh.CM_SubdivideGridColumns(directGrid);mesh.CM_RemoveDegenerateColumns(directGrid);mesh.CM_TransposeGrid(directGrid);mesh.CM_SetGridWrapWidth(directGrid);mesh.CM_SubdivideGridColumns(directGrid);mesh.CM_RemoveDegenerateColumns(directGrid);direct.bounds=patch.bounds;mesh.CM_PatchCollideFromGrid(directGrid,direct);count=count+req(len(direct.planes)==len(patch.planes) and len(direct.facets)==len(patch.facets),"patch from grid")
  facet=patch.facets[0];invalid=mesh.Facet(-1,[],[],[]);count=count+req(not mesh.CM_ValidateFacet(patch,invalid),"validate facet")
  bevelFacet=mesh.Facet(facet.surface,facet.borders+[],facet.inward+[],facet.noAdjust+[]);before=len(bevelFacet.borders);mesh.CM_AddFacetBevels(patch,bevelFacet);count=count+req(len(bevelFacet.borders)>=before,"facet bevels")
  edgePlanes=array(len(directGrid.columns),void);for i=0 to len(edgePlanes)-1 edgePlanes[i]=array(len(directGrid.columns[0]),void);for j=0 to len(edgePlanes[i])-1 edgePlanes[i][j]=[0,0] end for end for
  edge=mesh.CM_EdgePlaneNum(direct,directGrid,edgePlanes,0,0,0);count=count+req(edge>=-1,"edge plane entry")
  clip=patchtrace.Clip(n.f32(-1),n.f32(1),false);adjusted=patchtrace.Adjusted(mesh.plane([0.0,0.0,1.0],0.0),[0.0,0.0,1.0],[0.0,0.0,-1.0]);count=count+req(patchtrace.CM_CheckFacetPlane(adjusted,clip) and clip.hit and clip.enter>0.0 and clip.enter<1.0,"facet plane clipping")
  pointWork=Work([0.0,0.0,0.0],[0.0,0.0,0.0],false,[0.0,0.0,8.0],[0.0,0.0,-8.0],0.0,[0.0,0.0,0.0],brush.emptyTrace(),true);patchtrace.CM_TracePointThroughPatchCollide(pointWork,patch,true);count=count+req(pointWork.trace.fraction<1.0,"point trace")
  boxWork=Work([1.0,1.0,1.0],[-1.0,-1.0,-1.0],false,[0.0,0.0,8.0],[0.0,0.0,-8.0],1.0,[0.0,0.0,0.0],brush.emptyTrace(),false);patchtrace.CM_TraceThroughPatchCollide(boxWork,patch,true);count=count+req(boxWork.trace.fraction<1.0,"box trace")
  position=Work([1.0,1.0,1.0],[-1.0,-1.0,-1.0],false,[0.0,0.0,0.0],[0.0,0.0,0.0],1.0,[0.0,0.0,0.0],brush.emptyTrace(),false);count=count+req(patchtrace.CM_PositionTestInPatchCollide(position,patch),"position test")
  debug=patchtrace.CM_ClearLevelPatches();count=count+req(len(patchtrace.CM_DrawDebugSurface(debug))==0,"clear debug patches");debug.patch=patch;debug.facet=0;count=count+req(len(patchtrace.CM_DrawDebugSurface(debug))==1,"debug winding")
  print("PASS: "+str(count)+" cm_patch complete contracts");return 0
end function
