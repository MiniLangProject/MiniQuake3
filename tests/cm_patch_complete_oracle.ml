import mq3.collision.patchmesh as mesh
import mq3.collision.patchtrace as patchtrace
import mq3.compat.numeric as n

function u(value) return str(n.u32(n.floatBits(value))) end function
function vectorLine(prefix,vectors) line=prefix;for each vector in vectors for each value in vector line=line+","+u(value) end for end for;return line end function
function columns()
  result=array(3,void);for x=0 to 2 result[x]=array(3,void);for y=0 to 2 result[x][y]=[n.f32(x*8-8),n.f32(y*8-8),0.0] end for end for;return result
end function
function points() result=[];for y=0 to 2 for x=0 to 2 result=result+[[n.f32(x*8-8),n.f32(y*8-8),0.0]] end for end for;return result end function
function main(args)
  print("sign="+str(mesh.CM_SignbitsForNormal([-1.0,2.0,-3.0])))
  p=mesh.CM_PlaneFromPoints([0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]);print(vectorLine("plane=1",[p.normal+[p.distance]]))
  print("needs="+str(boolInt(mesh.CM_NeedsSubdivision([0.0,0.0,0.0],[0.0,100.0,0.0],[0.0,0.0,0.0])))+","+str(boolInt(mesh.CM_NeedsSubdivision([0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,2.0,0.0]))))
  divided=mesh.CM_Subdivide([0.0,0.0,0.0],[2.0,4.0,6.0],[4.0,8.0,12.0]);print(vectorLine("sub",divided))
  print("compare="+str(boolInt(mesh.CM_ComparePoints([1.0,2.0,3.0],[1.09,1.91,3.09])))+","+str(boolInt(mesh.CM_ComparePoints([1.0,2.0,3.0],[1.11,2.0,3.0]))))
  snapped=mesh.CM_SnapVector([0.00001,0.99999,0.00002]);print("snap="+u(snapped[0])+","+u(snapped[1])+","+u(snapped[2]))
  patch=mesh.Patch([],[],[[0.0,0.0,0.0],[0.0,0.0,0.0]]);index=mesh.CM_FindPlane(patch,[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]);print("find="+str(index)+","+str(len(patch.planes))+","+str(mesh.CM_PointOnPlaneSide(patch,[0.0,0.0,1.0],index))+","+str(mesh.CM_PointOnPlaneSide(patch,[0.0,0.0,-1.0],index)))
  original=patch.planes[index];reverse=mesh.plane([-original.normal[0],-original.normal[1],-original.normal[2]],0.0-original.distance);print("equal=1,"+str(mesh.CM_PlaneEqual(original,original))+",1,"+str(mesh.CM_PlaneEqual(original,reverse)))
  grid=mesh.Grid(columns(),false,false);mesh.CM_SetGridWrapWidth(grid);mesh.CM_SubdivideGridColumns(grid);mesh.CM_RemoveDegenerateColumns(grid);mesh.CM_TransposeGrid(grid);mesh.CM_SetGridWrapWidth(grid);mesh.CM_SubdivideGridColumns(grid);mesh.CM_RemoveDegenerateColumns(grid);line="grid="+str(len(grid.columns))+","+str(len(grid.columns[0]))+","+str(boolInt(grid.wrapWidth))+","+str(boolInt(grid.wrapHeight));for each column in grid.columns for each point in column for each value in point line=line+","+u(value) end for end for end for;print(line)
  generated=mesh.CM_GeneratePatchCollide(3,3,points());print(vectorLine("generate="+str(len(generated.planes))+","+str(len(generated.facets)),generated.bounds))
  clip=patchtrace.Clip(n.f32(-1),n.f32(1),false);adjusted=patchtrace.Adjusted(mesh.plane([0.0,0.0,1.0],0.0),[0.0,0.0,1.0],[0.0,0.0,-1.0]);ok=patchtrace.CM_CheckFacetPlane(adjusted,clip);print("check="+str(boolInt(ok))+","+u(clip.enter)+","+u(clip.leave)+","+str(boolInt(clip.hit)))
  debug=patchtrace.CM_ClearLevelPatches();print("clear="+str(boolInt(debug.patch==void))+","+str(boolInt(debug.facet==-1)));return 0
end function
function boolInt(value) if value then return 1 end if;return 0 end function
