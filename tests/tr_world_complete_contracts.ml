import mq3.renderer.tr_world_runtime as world

function req(ok,label) if not ok then return error(7794,"tr_world contract: "+label) end if;return 1 end function
function face(bounds,cull) return world.Surface("face",bounds,[0.0,0.0,0.0],2.0,world.Plane([1.0,0.0,0.0],0.0),cull,-1,2,0) end function
function grid(bounds) return world.Surface("grid",bounds,[0.0,0.0,0.0],2.0,world.Plane([0.0,0.0,1.0],0.0),world.CT_TWO_SIDED,-1,1,0) end function
function tri(bounds) return world.Surface("triangles",bounds,[0.0,0.0,0.0],2.0,world.Plane([0.0,0.0,1.0],0.0),world.CT_TWO_SIDED,-1,0,0) end function
function fixture()
  distant=grid([[8.0,-1.0,-1.0],[12.0,1.0,1.0]]);distant.localOrigin=[10.0,0.0,0.0];surfaces=[face([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],world.CT_TWO_SIDED),distant]
  nodes=[world.Node(world.CONTENTS_NODE,[-20.0,-20.0,-20.0],[20.0,20.0,20.0],0,[1,2],-1,-1,-1,[],-1),world.Node(0,[0.0,-4.0,-4.0],[20.0,4.0,4.0],-1,[] ,0,0,0,[0,1],-1),world.Node(0,[-20.0,-4.0,-4.0],[0.0,4.0,4.0],-1,[],0,1,1,[0],-1)]
  return world.World(nodes,[world.Plane([1.0,0.0,0.0],0.0)],surfaces,bytes([1,2]),bytes([255]),2,1,0,-2)
end function
function main(args)
  count=0;inside=[[world.Plane([1.0,0.0,0.0],-5.0),world.Plane([-1.0,0.0,0.0],-5.0),world.Plane([0.0,1.0,0.0],-5.0),world.Plane([0.0,-1.0,0.0],-5.0)]];frustum=inside[0]
  count=count+req(world.boxOnPlaneSide([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],world.Plane([1.0,0.0,0.0],-5.0))==world.CULL_IN,"box inside plane")
  count=count+req(world.boxOnPlaneSide([[-7.0,-1.0,-1.0],[-6.0,1.0,1.0]],world.Plane([1.0,0.0,0.0],-5.0))==world.CULL_OUT,"box outside plane")
  count=count+req(world.boxOnPlaneSide([[-6.0,-1.0,-1.0],[-4.0,1.0,1.0]],world.Plane([1.0,0.0,0.0],-5.0))==world.CULL_CLIP,"box clips plane")
  nearTri=tri([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]]);farTri=tri([[8.0,0.0,0.0],[10.0,1.0,1.0]])
  count=count+req(not world.R_CullTriSurf(nearTri,frustum) and world.R_CullTriSurf(farTri,frustum),"triangle bounds culling")
  patch=grid([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]]);count=count+req(world.R_CullGrid(patch,true,true,frustum),"curve switch culls patch")
  count=count+req(not world.R_CullGrid(patch,false,true,frustum),"visible patch sphere and box")
  outsidePatch=grid([[8.0,-1.0,-1.0],[12.0,1.0,1.0]]);outsidePatch.localOrigin=[10.0,0.0,0.0];count=count+req(world.R_CullGrid(outsidePatch,false,true,frustum),"patch sphere reject")
  front=face([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],world.CT_FRONT_SIDED);count=count+req(world.R_CullSurface(front,false,false,true,[-9.0,0.0,0.0],frustum),"front-sided epsilon cull")
  count=count+req(not world.R_CullSurface(front,false,false,true,[-8.0,0.0,0.0],frustum),"face plane epsilon boundary")
  back=face([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],world.CT_BACK_SIDED);count=count+req(world.R_CullSurface(back,false,false,true,[9.0,0.0,0.0],frustum),"back-sided epsilon cull")
  count=count+req(not world.R_CullSurface(front,true,false,true,[-100.0,0.0,0.0],frustum),"nocull bypass")
  lights=[world.Dlight([0.0,0.0,0.0],4.0),world.Dlight([8.0,0.0,0.0],2.0),world.Dlight([0.0,0.0,6.0],1.0)]
  litFace=face([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],world.CT_TWO_SIDED);count=count+req(world.R_DlightFace(litFace,7,lights)==5 and litFace.dlightBits==5,"face light-to-plane culling")
  litGrid=grid([[-2.0,-2.0,-2.0],[2.0,2.0,2.0]]);count=count+req(world.R_DlightGrid(litGrid,7,lights)==1,"grid light-to-AABB culling")
  litTri=tri([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]]);count=count+req(world.R_DlightTrisurf(litTri,5,lights)==5 and litTri.dlightBits==5,"triangle soup keeps candidate mask")
  unknown=world.Surface("flare",[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],[0.0,0.0,0.0],1.0,world.Plane([1.0,0.0,0.0],0.0),world.CT_TWO_SIDED,-1,0,4);count=count+req(world.R_DlightSurface(unknown,7,lights)==0,"unsupported surface rejects lights")
  add=world.R_AddWorldSurface(litFace,3,1,lights,2,false,false,true,[0.0,0.0,0.0],frustum);count=count+req(add.surfaceIndex==3 and add.fogIndex==2 and add.dlighted,"world surface draw record")
  count=count+req(world.R_AddWorldSurface(litFace,3,1,lights,2,false,false,true,[0.0,0.0,0.0],frustum)==void,"world surface view de-duplication")
  modelFace=face([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],world.CT_TWO_SIDED);brush=world.R_AddBrushModelSurfaces([modelFace],[7],[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],lights,1,3,false,false,true,[0.0,0.0,0.0],frustum);count=count+req(len(brush)==1 and brush[0].surfaceIndex==7,"brush model surfaces")
  count=count+req(len(world.R_AddBrushModelSurfaces([modelFace],[7],[[8.0,-1.0,-1.0],[12.0,1.0,1.0]],lights,1,4,false,false,true,[0.0,0.0,0.0],frustum))==0,"brush model local bounds reject")
  state=fixture();count=count+req(world.R_PointInLeaf(state,[2.0,0.0,0.0])==1 and world.R_PointInLeaf(state,[-2.0,0.0,0.0])==2,"point leaf BSP walk")
  count=count+req(world.R_ClusterPVS(state,0)==bytes([1]) and world.R_ClusterPVS(state,-1)==bytes([255]),"cluster visibility row and novis fallback")
  count=count+req(not world.R_inPVS(state,[2.0,0.0,0.0],[-2.0,0.0,0.0]) and world.R_inPVS(state,[2.0,0.0,0.0],[3.0,0.0,0.0]),"renderer PVS query")
  marked=world.R_MarkLeaves(state,[2.0,0.0,0.0],bytes([0]),false,false,true,false);count=count+req(marked.changed and state.visCount==1 and state.nodes[0].visframe==1 and state.nodes[1].visframe==1 and state.nodes[2].visframe!=1,"PVS leaf and parent marking")
  unchanged=world.R_MarkLeaves(state,[2.0,0.0,0.0],bytes([0]),false,false,false,false);count=count+req(not unchanged.changed and state.visCount==1,"unchanged view cluster fast path")
  areaState=fixture();world.R_MarkLeaves(areaState,[2.0,0.0,0.0],bytes([1]),false,false,true,false);count=count+req(areaState.nodes[1].visframe!=areaState.visCount,"area mask rejects closed area")
  noVisState=fixture();world.R_MarkLeaves(noVisState,[2.0,0.0,0.0],bytes([0]),false,true,true,false);count=count+req(noVisState.nodes[0].visframe==1 and noVisState.nodes[1].visframe==1 and noVisState.nodes[2].visframe==1,"novis marks all non-solid nodes")
  locked=fixture();world.R_MarkLeaves(locked,[2.0,0.0,0.0],bytes([0]),true,false,true,false);count=count+req(locked.visCount==0,"lockpvs leaves marks unchanged")
  traversalState=fixture();world.R_MarkLeaves(traversalState,[2.0,0.0,0.0],bytes([0]),false,false,true,false);walk=world.R_RecursiveWorldNode(traversalState,0,15,1,[lights[0]],7,false,false,true,[0.0,0.0,0.0],frustum);count=count+req(walk.leafs==1 and len(walk.draws)==1 and walk.draws[0].surfaceIndex==0,"recursive visible-leaf traversal and duplicate surface filtering")
  count=count+req(walk.visBounds==[[0.0,-4.0,-4.0],[20.0,4.0,4.0]],"visible bounds accumulation")
  print("PASS: "+str(count)+" complete tr_world contracts");return 0
end function
