// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for renderer/tr_world.c.
package mq3.renderer.tr_world_runtime
import mq3.renderer.world_surface_selection as selection

/// Bounds classification indicating that the object lies entirely inside the view frustum.
const CULL_IN=0
/// Bounds classification indicating that the object intersects the view frustum.
const CULL_CLIP=1
/// Bounds classification indicating that the object lies entirely outside the view frustum.
const CULL_OUT=2
/// Negative marker identifying an internal BSP node rather than a leaf.
const CONTENTS_NODE=-1
/// Contents bit identifying solid collision geometry.
const CONTENTS_SOLID=1
/// Cull type that keeps the front-facing side of a surface.
const CT_FRONT_SIDED=0
/// Cull type that keeps the back-facing side of a surface.
const CT_BACK_SIDED=1
/// Cull type that renders both sides of a surface.
const CT_TWO_SIDED=2

/// Data record for `mq3.renderer.tr_world_runtime.Plane`; groups `normal`, `dist`.
struct Plane
  /// World partition-plane normal used during BSP traversal and surface culling.
  normal
  /// Signed plane distance measured along its normal.
  dist
end struct
/// Data record for `mq3.renderer.tr_world_runtime.Dlight`; groups `origin`, `radius`.
struct Dlight
  /// Dynamic-light center used to classify BSP nodes and affected world surfaces.
  origin
  /// Radius used for the light, sprite, beam, or bounded object.
  radius
end struct
/// Data record for `mq3.renderer.tr_world_runtime.Surface`; groups `kind`, `bounds`, `localOrigin`, `meshRadius`, `plane`, `cullType`, and 3 further fields.
struct Surface
  /// World-surface category used to choose bounds culling and dynamic-light intersection rules.
  kind
  /// Minimum and maximum corners enclosing the object or surface.
  bounds
  /// Center of the mesh's local-space bounding sphere.
  localOrigin
  /// Radius of the mesh's local-space bounding sphere.
  meshRadius
  /// Splitting or clipping plane associated with the BSP node or surface.
  plane
  /// Front-face, back-face, or two-sided surface-culling rule.
  cullType
  /// Generation number used to avoid processing a surface twice in one view.
  viewCount
  /// Index of the fog volume affecting the surface or primitive.
  fogIndex
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
end struct
/// Data record for `mq3.renderer.tr_world_runtime.Node`; groups `contents`, `mins`, `maxs`, `plane`, `children`, `parent`, and 4 further fields.
struct Node
  /// BSP node marker or collision-content bits for this record.
  contents
  /// Minimum horizontal texture coordinate reached on the clipped sky face.
  mins
  /// Maximum horizontal texture coordinate reached on the clipped sky face.
  maxs
  /// Splitting or clipping plane associated with the BSP node or surface.
  plane
  /// Child node or leaf references of the BSP partition.
  children
  /// Parent node in the BSP hierarchy.
  parent
  /// Visibility cluster containing the BSP leaf.
  cluster
  /// BSP area number used when applying area-visibility masking.
  area
  /// Surface references associated with the BSP leaf.
  marks
  /// Visibility generation in which the BSP node was marked visible.
  visframe
end struct
/// Data record for `mq3.renderer.tr_world_runtime.World`; groups `nodes`, `planes`, `surfaces`, `vis`, `novis`, `numClusters`, and 3 further fields.
struct World
  /// Nodes and leaves of the BSP hierarchy.
  nodes
  /// Planes defining BSP partitions or clipping boundaries.
  planes
  /// Surface records owned by the world, model, or drawing group.
  surfaces
  /// Packed potentially-visible-cluster data for the world.
  vis
  /// Fallback visibility mask used when no valid PVS data is available.
  novis
  /// Number of clusters represented by the visibility table.
  numClusters
  /// Number of bytes in one potentially-visible-cluster bitset.
  clusterBytes
  /// Current visibility-marking generation.
  visCount
  /// Visibility cluster used by the current world view.
  viewCluster
end struct
/// Data record for `mq3.renderer.tr_world_runtime.DrawSurface`; groups `surfaceIndex`, `fogIndex`, `dlighted`.
struct DrawSurface
  /// Index of the source surface within the model or world.
  surfaceIndex
  /// Index of the fog volume affecting the surface or primitive.
  fogIndex
  /// Whether dynamic lights affect the selected draw surface.
  dlighted
end struct
/// Data record for `mq3.renderer.tr_world_runtime.Traversal`; groups `draws`, `leafs`, `visBounds`.
struct Traversal
  /// Draw-surface records emitted while traversing the world.
  draws
  /// BSP leaves visited or retained by world traversal.
  leafs
  /// Bounds accumulated over the visible BSP leaves.
  visBounds
end struct
/// Data record for `mq3.renderer.tr_world_runtime.MarkResult`; groups `changed`, `cluster`, `visCount`.
struct MarkResult
  /// Whether the visibility cluster or associated visible set changed.
  changed
  /// Visibility cluster containing the BSP leaf.
  cluster
  /// Current visibility-marking generation.
  visCount
end struct

/// Creates error `7793` with message `"tr_world: "+message`.
/// @param message Input used in the result expression `error(7793,"tr_world: "+message)`.
function fail(message) return error(7793,"tr_world: "+message) end function
/// Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.tr_world_runtime.dot`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function

/// Classifies an axis-aligned box as inside, outside, or crossing one plane using extreme support corners.
/// @param bounds Nested indexed data; outer entries read at `0`, `1`.
/// @param plane Record providing `plane.normal`, `plane.dist`.
function boxOnPlaneSide(bounds,plane)
  near=[];far=[]
  for axis=0 to 2 if plane.normal[axis]>=0.0 then near=near+[bounds[0][axis]];far=far+[bounds[1][axis]] else near=near+[bounds[1][axis]];far=far+[bounds[0][axis]] end if end for
  front=dot(far,plane.normal)-plane.dist;back=dot(near,plane.normal)-plane.dist
  if back>=0.0 then return CULL_IN end if;if front<0.0 then return CULL_OUT end if;return CULL_CLIP
end function
/// Classifies a box against all frustum planes, stopping when any plane rejects it.
/// @param bounds Value forwarded as `bounds` to `mq3.renderer.tr_world_runtime.boxOnPlaneSide`.
/// @param frustum Sequence traversed as `plane` while producing this result.
function boxCull(bounds,frustum)
  clipped=false;for each plane in frustum side=boxOnPlaneSide(bounds,plane);if side==CULL_OUT then return CULL_OUT end if;if side==CULL_CLIP then clipped=true end if end for;if clipped then return CULL_CLIP end if;return CULL_IN
end function
/// Classifies a bounding sphere against all frustum planes using signed distance and radius.
/// @param origin Value forwarded as `a` to `mq3.renderer.tr_world_runtime.dot`.
/// @param radius Input tested by `distance<0.0-radius`.
/// @param frustum Sequence traversed as `plane` while producing this result.
function sphereCull(origin,radius,frustum)
  clipped=false;for each plane in frustum distance=dot(origin,plane.normal)-plane.dist;if distance<0.0-radius then return CULL_OUT end if;if distance<=radius then clipped=true end if end for;if clipped then return CULL_CLIP end if;return CULL_IN
end function

/// Computes `boxCull(surface.bounds,frustum)==CULL_OUT` for `mq3.renderer.tr_world_runtime.R_CullTriSurf`.
/// @param surface Record providing `surface.bounds`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.boxCull`.
function R_CullTriSurf(surface,frustum) return boxCull(surface.bounds,frustum)==CULL_OUT end function
/// Rejects disabled curves or patch grids whose sphere and, when needed, box lie outside the frustum.
/// @param surface Record providing `surface.localOrigin`, `surface.meshRadius`, `surface.bounds`.
/// @param noCurves Input tested by `noCurves`.
/// @param worldEntity Unused compatibility argument retained by this entry point.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.sphereCull`.
function R_CullGrid(surface,noCurves,worldEntity,frustum)
  if noCurves then return true end if
  sphere=sphereCull(surface.localOrigin,surface.meshRadius,frustum);if sphere==CULL_OUT then return true end if
  if sphere==CULL_CLIP and boxCull(surface.bounds,frustum)==CULL_OUT then return true end if
  return false
end function
/// Computes `R_CullSurface` from `distance>surface.plane.dist+8.0` using `mq3.renderer.tr_world_runtime.R_CullGrid`, `mq3.renderer.tr_world_runtime.R_CullTriSurf`, `mq3.renderer.tr_world_runtime.dot`.
/// @param surface Record providing `surface.kind`, `surface.cullType`, `surface.plane`.
/// @param noCull Input tested by `noCull`.
/// @param noCurves Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_CullGrid`.
/// @param facePlaneCull Input tested by `surface.kind!="face" or surface.cullType==CT_TWO_SIDED or not facePlaneCull`.
/// @param viewOrigin Value forwarded as `a` to `mq3.renderer.tr_world_runtime.dot`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.R_CullGrid`.
function R_CullSurface(surface,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  if noCull then return false end if
  if surface.kind=="grid" then return R_CullGrid(surface,noCurves,true,frustum) end if
  if surface.kind=="triangles" then return R_CullTriSurf(surface,frustum) end if
  if surface.kind!="face" or surface.cullType==CT_TWO_SIDED or not facePlaneCull then return false end if
  distance=dot(viewOrigin,surface.plane.normal)
  if surface.cullType==CT_FRONT_SIDED then return distance<surface.plane.dist-8.0 end if
  return distance>surface.plane.dist+8.0
end function

/// Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightFace`; returns `dlightBits`.
/// @param surface Mutable record or buffer; this call updates `surface.dlightBits`.
/// @param dlightBits Value assigned to `surface.dlightBits`.
/// @param lights Indexed input read at `index`.
function R_DlightFace(surface,dlightBits,lights)
  for index=0 to len(lights)-1 if (dlightBits&(1<<index))!=0 then distance=dot(lights[index].origin,surface.plane.normal)-surface.plane.dist;if distance<0.0-lights[index].radius or distance>lights[index].radius then dlightBits=dlightBits&(~(1<<index)) end if end if end for
  surface.dlightBits=dlightBits;return dlightBits
end function
/// Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightGrid`; returns `dlightBits`.
/// @param surface Mutable record or buffer; this call updates `surface.dlightBits`.
/// @param dlightBits Value assigned to `surface.dlightBits`.
/// @param lights Indexed input read at `index`.
function R_DlightGrid(surface,dlightBits,lights)
  for index=0 to len(lights)-1
    if (dlightBits&(1<<index))!=0 then light=lights[index];b=surface.bounds
      if light.origin[0]-light.radius>b[1][0] or light.origin[0]+light.radius<b[0][0] or light.origin[1]-light.radius>b[1][1] or light.origin[1]+light.radius<b[0][1] or light.origin[2]-light.radius>b[1][2] or light.origin[2]+light.radius<b[0][2] then dlightBits=dlightBits&(~(1<<index)) end if
    end if
  end for
  surface.dlightBits=dlightBits;return dlightBits
end function
/// Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightTrisurf`; returns `dlightBits`.
/// @param surface Mutable record or buffer; this call updates `surface.dlightBits`.
/// @param dlightBits Value assigned to `surface.dlightBits`.
/// @param lights Unused compatibility argument retained by this entry point.
function R_DlightTrisurf(surface,dlightBits,lights) surface.dlightBits=dlightBits;return dlightBits end function
/// Updates `surface.dlightBits` in `mq3.renderer.tr_world_runtime.R_DlightSurface`; returns `0`.
/// @param surface Mutable record or buffer; this call updates `surface.dlightBits`.
/// @param dlightBits Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_DlightFace`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_DlightFace`.
function R_DlightSurface(surface,dlightBits,lights)
  if surface.kind=="face" then return R_DlightFace(surface,dlightBits,lights) end if
  if surface.kind=="grid" then return R_DlightGrid(surface,dlightBits,lights) end if
  if surface.kind=="triangles" then return R_DlightTrisurf(surface,dlightBits,lights) end if
  surface.dlightBits=0;return 0
end function

/// Builds `mq3.renderer.tr_world_runtime.DrawSurface` after updating `surface.viewCount`.
/// @param surface Mutable record or buffer; this call updates `surface.viewCount`.
/// @param surfaceIndex Initial value for `mq3.renderer.tr_world_runtime.DrawSurface.surfaceIndex`.
/// @param dlightBits Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_DlightSurface`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_DlightSurface`.
/// @param viewCount Value assigned to `surface.viewCount`.
/// @param noCull Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.R_CullSurface`.
/// @param noCurves Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_CullSurface`.
/// @param facePlaneCull Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.R_CullSurface`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.R_CullSurface`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.R_CullSurface`.
function R_AddWorldSurface(surface,surfaceIndex,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  if surface.viewCount==viewCount then return void end if;surface.viewCount=viewCount
  if R_CullSurface(surface,noCull,noCurves,facePlaneCull,viewOrigin,frustum) then return void end if
  lighted=false;if dlightBits!=0 then lighted=R_DlightSurface(surface,dlightBits,lights)!=0 end if
  return DrawSurface(surfaceIndex,surface.fogIndex,lighted)
end function

/// Computes `boxCull(bounds,frustum)==CULL_OUT` for `mq3.renderer.tr_world_runtime.boundsOutside`.
/// @param bounds Value forwarded as `bounds` to `mq3.renderer.tr_world_runtime.boxCull`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.boxCull`.
function boundsOutside(bounds,frustum) return boxCull(bounds,frustum)==CULL_OUT end function
/// Rejects an off-frustum brush model and collects each remaining drawable world-surface result.
/// @param surfaces Indexed input read at `index`.
/// @param surfaceIndexes Indexed input read at `index`.
/// @param bounds Value forwarded as `bounds` to `mq3.renderer.tr_world_runtime.boundsOutside`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param needDlights Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param viewCount Value forwarded as `viewCount` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param noCull Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param noCurves Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param facePlaneCull Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.boundsOutside`.
function R_AddBrushModelSurfaces(surfaces,surfaceIndexes,bounds,lights,needDlights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  if boundsOutside(bounds,frustum) then return [] end if;draws=[]
  for index=0 to len(surfaces)-1 draw=R_AddWorldSurface(surfaces[index],surfaceIndexes[index],needDlights,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum);if draw!=void then draws=draws+[draw] end if end for
  return draws
end function

/// Walks BSP child planes to locate a point's leaf, with index/cycle guards for malformed trees.
/// @param world Record providing `world.nodes`, `world.planes`.
/// @param point Value forwarded as `a` to `mq3.renderer.tr_world_runtime.dot`.
function R_PointInLeaf(world,point)
  if world==void or len(world.nodes)==0 then return fail("bad model") end if;index=0;guard=0
  while world.nodes[index].contents==CONTENTS_NODE
    node=world.nodes[index];plane=world.planes[node.plane];distance=dot(point,plane.normal)-plane.dist;if distance>0.0 then index=node.children[0] else index=node.children[1] end if
    guard=guard+1;if index<0 or index>=len(world.nodes) or guard>len(world.nodes) then return fail("invalid node tree") end if
  end while
  return index
end function
/// Returns `slice(world.vis,cluster*world.clusterBytes,world.clusterBytes)` from `mq3.renderer.tr_world_runtime.R_ClusterPVS`; earlier branches return `bytes(0)`, `world.novis`.
/// @param world Record providing `world.vis`, `world.numClusters`, `world.novis`, `world.clusterBytes`.
/// @param cluster Input tested by `world.vis==void or cluster<0 or cluster>=world.numClusters`.
function R_ClusterPVS(world,cluster)
  if world==void then return bytes(0) end if
  if world.vis==void or cluster<0 or cluster>=world.numClusters then return world.novis end if
  return slice(world.vis,cluster*world.clusterBytes,world.clusterBytes)
end function
/// Computes `R_inPVS` from `(mask[cluster>>3]&(1<<(cluster&7)))!=0` using `mq3.renderer.tr_world_runtime.R_PointInLeaf`, `mq3.renderer.tr_world_runtime.R_ClusterPVS`, `or`.
/// @param world Record providing `world.nodes`.
/// @param p1 Value forwarded as `point` to `mq3.renderer.tr_world_runtime.R_PointInLeaf`.
/// @param p2 Value forwarded as `point` to `mq3.renderer.tr_world_runtime.R_PointInLeaf`.
function R_inPVS(world,p1,p2)
  first=R_PointInLeaf(world,p1);if first is error then return first end if;mask=R_ClusterPVS(world,world.nodes[first].cluster);second=R_PointInLeaf(world,p2);if second is error then return second end if;cluster=world.nodes[second].cluster
  if cluster<0 or (cluster>>3)>=len(mask) then return false end if;return (mask[cluster>>3]&(1<<(cluster&7)))!=0
end function

/// Builds `mq3.renderer.tr_world_runtime.MarkResult` after updating `world.visCount`, `world.viewCluster`, `node.visframe`, `world.nodes[parent].visframe`.
/// @param world Mutable record or buffer; this call updates `world.visCount`, `world.viewCluster`, `world.nodes[parent].visframe`.
/// @param pvsOrigin Value forwarded as `point` to `mq3.renderer.tr_world_runtime.R_PointInLeaf`.
/// @param areaMask Indexed input read at `node.area>>3`.
/// @param lockPvs Input tested by `lockPvs`.
/// @param noVis Input tested by `noVis or cluster==-1`.
/// @param areaMaskModified Input tested by `world.viewCluster==cluster and not areaMaskModified and not showClusterModified`.
/// @param showClusterModified Input tested by `world.viewCluster==cluster and not areaMaskModified and not showClusterModified`.
function R_MarkLeaves(world,pvsOrigin,areaMask,lockPvs,noVis,areaMaskModified,showClusterModified)
  leafIndex=R_PointInLeaf(world,pvsOrigin);if leafIndex is error then return leafIndex end if;cluster=world.nodes[leafIndex].cluster
  if lockPvs then return MarkResult(false,cluster,world.visCount) end if
  if world.viewCluster==cluster and not areaMaskModified and not showClusterModified then return MarkResult(false,cluster,world.visCount) end if
  world.visCount=world.visCount+1;world.viewCluster=cluster
  if noVis or cluster==-1 then for each node in world.nodes if node.contents!=CONTENTS_SOLID then node.visframe=world.visCount end if end for;return MarkResult(true,cluster,world.visCount) end if
  mask=R_ClusterPVS(world,cluster)
  for index=0 to len(world.nodes)-1
    node=world.nodes[index];other=node.cluster
    if other<0 or other>=world.numClusters or (mask[other>>3]&(1<<(other&7)))==0 then continue end if
    if node.area>=0 and (node.area>>3)<len(areaMask) and (areaMask[node.area>>3]&(1<<(node.area&7)))!=0 then continue end if
    parent=index
    while parent>=0
      if world.nodes[parent].visframe==world.visCount then break end if;world.nodes[parent].visframe=world.visCount;parent=world.nodes[parent].parent
    end while
  end for
  return MarkResult(true,cluster,world.visCount)
end function

/// Updates `bounds[0][axis]`, `bounds[1][axis]` in `mq3.renderer.tr_world_runtime.expandBounds`; returns `bounds`.
/// @param bounds Mutable record or buffer; this call updates `bounds[0][axis]`, `bounds[1][axis]`.
/// @param mins Indexed input read at `axis`.
/// @param maxs Indexed input read at `axis`.
function expandBounds(bounds,mins,maxs) for axis=0 to 2 if mins[axis]<bounds[0][axis] then bounds[0][axis]=mins[axis] end if;if maxs[axis]>bounds[1][axis] then bounds[1][axis]=maxs[axis] end if end for;return bounds end function
/// Updates `result.leafs`, `result.draws` in `mq3.renderer.tr_world_runtime.recurseNode`; returns `result`.
/// @param world Record providing `world.nodes`, `world.visCount`, `world.surfaces`, `world.planes`.
/// @param nodeIndex Input used by `node=world.nodes[nodeIndex]`.
/// @param planeBits Input used by `bits=planeBits`.
/// @param dlightBits Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param viewCount Value forwarded as `viewCount` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param noCull Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param noCurves Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param facePlaneCull Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.R_AddWorldSurface`.
/// @param result Mutable record or buffer; this call updates `result.leafs`, `result.draws`.
function recurseNode(world,nodeIndex,planeBits,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result)
  node=world.nodes[nodeIndex];if node.visframe!=world.visCount then return result end if
  bits=planeBits;if not noCull then for planeIndex=0 to len(frustum)-1 bit=1<<planeIndex;if (bits&bit)!=0 then side=boxOnPlaneSide([node.mins,node.maxs],frustum[planeIndex]);if side==CULL_OUT then return result end if;if side==CULL_IN then bits=bits&(~bit) end if end if end for end if
  if node.contents!=CONTENTS_NODE then
    result.leafs=result.leafs+1;expandBounds(result.visBounds,node.mins,node.maxs)
    for each surfaceIndex in node.marks draw=R_AddWorldSurface(world.surfaces[surfaceIndex],surfaceIndex,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum);if draw!=void then result.draws=result.draws+[draw] end if end for;return result
  end if
  childBits=[0,0]
  for lightIndex=0 to len(lights)-1 if (dlightBits&(1<<lightIndex))!=0 then light=lights[lightIndex];distance=dot(light.origin,world.planes[node.plane].normal)-world.planes[node.plane].dist;if distance>0.0-light.radius then childBits[0]=childBits[0]|(1<<lightIndex) end if;if distance<light.radius then childBits[1]=childBits[1]|(1<<lightIndex) end if end if end for
  recurseNode(world,node.children[0],bits,childBits[0],lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result);recurseNode(world,node.children[1],bits,childBits[1],lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result);return result
end function
/// Starts BSP visibility traversal with empty draw results and expanding bounds, then recurses from the supplied node.
/// @param world Value forwarded as `world` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param nodeIndex Value forwarded as `nodeIndex` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param planeBits Value forwarded as `planeBits` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param dlightBits Value forwarded as `dlightBits` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param viewCount Value forwarded as `viewCount` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param noCull Value forwarded as `noCull` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param noCurves Value forwarded as `noCurves` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param facePlaneCull Value forwarded as `facePlaneCull` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.tr_world_runtime.recurseNode`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.tr_world_runtime.recurseNode`.
function R_RecursiveWorldNode(world,nodeIndex,planeBits,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  result=Traversal([],0,[[999999.0,999999.0,999999.0],[-999999.0,-999999.0,-999999.0]])
  return recurseNode(world,nodeIndex,planeBits,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result)
end function

// Productive world entry: the retained selector performs the same leaf/PVS,
// frustum, backface and surface de-duplication before BSP triangle expansion.
/// @param cache Argument 1 supplied to `mq3.renderer.world_surface_selection.prepareCached`.
/// @param camera Argument 2 supplied to `mq3.renderer.world_surface_selection.prepareCached`.
/// @param config Argument 3 supplied to `mq3.renderer.world_surface_selection.prepareCached`.
function R_AddWorldSurfaces(cache,camera,config) return selection.prepareCached(cache,camera,config) end function
