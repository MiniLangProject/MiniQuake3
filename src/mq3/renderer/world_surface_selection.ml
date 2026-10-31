// SPDX-License-Identifier: GPL-2.0-or-later
// Camera-driven BSP46 world-surface selection for the playable renderer.
package mq3.renderer.world_surface_selection

import mq3.compat.numeric as n
import mq3.client.playable_viewer as viewer
import mq3.renderer.bsp_render_data as render
import std.ds.list as lists
import std.sort as sorting

const NODE_STRIDE=36
const PLANE_STRIDE=16
const LEAF_STRIDE=48
const FACE_STRIDE=104
const DEFAULT_HORIZONTAL_FOV=100.0
const DEFAULT_NEAR_DISTANCE=1.0
const DEFAULT_FAR_DISTANCE=8192.0
const DEFAULT_TRIANGLE_BUDGET=12000

struct SelectionConfig width height horizontalFov nearDistance farDistance triangleBudget backfaceCull patchError runtime end struct
struct Candidate faceIndex triangleCount distanceSquared importance end struct
struct Selection faceIndexes candidateCount selectedSurfaceCount estimatedTriangleCount pvsUsed cameraLeaf cameraCluster rejectedPvs rejectedFrustum rejectedBackface rejectedDistance rejectedBudget end struct
struct PreparedWorld selection renderData end struct
struct WorldCache map faceCenters faceRadii faceTriangleCounts faceKinds faceNormals faceTextureIndexes twoSidedTextureFlags trianglesByFace patchError totalTriangleCount end struct

function fail(text) return error(7490,"World surface selection: "+text) end function
function validMap(map)
  return map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17
end function
function i32(map,offset)
  value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value
end function
function f32(map,offset)
  value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value)
end function
function config(width,height,horizontalFov,nearDistance,farDistance,triangleBudget,backfaceCull,patchError)
  if width<=0 or height<=0 then return fail("viewport must be positive") end if
  if horizontalFov<=0.0 or horizontalFov>=179.0 then return fail("field of view must be between zero and 179 degrees") end if
  if nearDistance<=0.0 or farDistance<=nearDistance then return fail("invalid distance range") end if
  if triangleBudget<0 then return fail("negative triangle budget") end if
  if patchError<=0.0 then return fail("non-positive patch error") end if
  return SelectionConfig(width,height,n.f32(horizontalFov),n.f32(nearDistance),n.f32(farDistance),triangleBudget,backfaceCull,n.f32(patchError),void)
end function
function defaults(width,height) return config(width,height,DEFAULT_HORIZONTAL_FOV,DEFAULT_NEAR_DISTANCE,DEFAULT_FAR_DISTANCE,DEFAULT_TRIANGLE_BUDGET,true,render.DEFAULT_PATCH_ERROR) end function

// This is CM_PointLeafnum's BSP walk, kept here so selection needs no loaded
// collision world. Negative children encode leaves as -1-leafIndex.
function pointLeaf(map,point)
  if map.counts[3]<=0 then return 0 end if
  node=0;guard=0
  while node>=0
    if node>=map.counts[3] or guard>map.counts[3] then return fail("invalid BSP node tree") end if
    offset=map.offsets[3]+node*NODE_STRIDE;plane=i32(map,offset);if plane is error or plane<0 or plane>=map.counts[2] then return fail("invalid node plane") end if
    planeOffset=map.offsets[2]+plane*PLANE_STRIDE
    distance=f32(map,planeOffset)*point[0]+f32(map,planeOffset+4)*point[1]+f32(map,planeOffset+8)*point[2]-f32(map,planeOffset+12)
    if distance>=0.0 then node=i32(map,offset+4) else node=i32(map,offset+8) end if
    if node is error then return node end if
    guard=guard+1
  end while
  leaf=-1-node;if leaf<0 or leaf>=map.counts[4] then return fail("invalid node leaf") end if;return leaf
end function

function pvsContains(map,cluster,other)
  if map.lengths[16]==0 then return true end if
  clusters=i32(map,map.offsets[16]);rowBytes=i32(map,map.offsets[16]+4)
  if clusters is error or rowBytes is error or cluster<0 or cluster>=clusters or other<0 or other>=clusters then return false end if
  return (map.data[map.offsets[16]+8+cluster*rowBytes+(other>>3)]&(1<<(other&7)))!=0
end function
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function

function faceTriangleCount(map,faceOffset,patchError)
  kind=i32(map,faceOffset+8);numMesh=i32(map,faceOffset+24)
  if kind==render.MST_PLANAR or kind==render.MST_TRIANGLE_SOUP then return n.quotient(numMesh,3) end if
  if kind!=render.MST_PATCH then return 0 end if
  firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);width=i32(map,faceOffset+96);height=i32(map,faceOffset+100)
  if width<3 or height<3 or width%2==0 or height%2==0 or width*height!=numVerts then return fail("invalid patch control grid") end if
  control=array(numVerts,void);for index=0 to numVerts-1 value=render.vertex(map,firstVert+index);if value is error then return value end if;control[index]=value end for
  grid=render.subdividePatch(control,width,height,patchError);if grid is error then return grid end if
  return (grid[1]-1)*(grid[2]-1)*2
end function

function faceBounds(map,faceOffset)
  first=i32(map,faceOffset+12);count=i32(map,faceOffset+16)
  if first is error or count is error or first<0 or count<=0 or first+count>map.counts[10] then return fail("invalid face vertex range") end if
  center=[0.0,0.0,0.0]
  for index=0 to count-1 value=render.vertex(map,first+index);if value is error then return value end if;for axis=0 to 2 center[axis]=center[axis]+value.position[axis] end for end for
  for axis=0 to 2 center[axis]=center[axis]/count end for
  radiusSquared=0.0
  for index=0 to count-1 value=render.vertex(map,first+index);sum=0.0;for axis=0 to 2 delta=value.position[axis]-center[axis];sum=sum+delta*delta end for;if sum>radiusSquared then radiusSquared=sum end if end for
  return [center,n.fsqrt(radiusSquared)]
end function

function visibleInFrustum(local,radius,cfg)
  if local[2]+radius<cfg.nearDistance or local[2]-radius>cfg.farDistance then return false end if
  focal=viewer.focalLength(cfg.width,cfg.horizontalFov);if focal is error then return false end if
  horizontal=local[2]*cfg.width/(2.0*focal)+radius
  vertical=local[2]*cfg.height/(2.0*focal)+radius
  return local[0]>=0.0-horizontal and local[0]<=horizontal and local[1]>=0.0-vertical and local[1]<=vertical
end function
function before(a,b)
  if a.importance<b.importance then return true end if
  if a.importance>b.importance then return false end if
  return a.faceIndex<b.faceIndex
end function
function buildCache(map,patchError)
  if not validMap(map) then return fail("invalid BSP object") end if
  if patchError<=0.0 then return fail("non-positive patch error") end if
  centers=array(map.counts[13],void);radii=array(map.counts[13],0.0);counts=array(map.counts[13],0);kinds=array(map.counts[13],0);normals=array(map.counts[13],void);textureIndexes=array(map.counts[13],-1);byFace=array(map.counts[13],void)
  for faceIndex=0 to map.counts[13]-1
    byFace[faceIndex]=[];offset=map.offsets[13]+faceIndex*FACE_STRIDE;textureIndexes[faceIndex]=i32(map,offset);kind=i32(map,offset+8);kinds[faceIndex]=kind
    if kind==render.MST_PLANAR or kind==render.MST_PATCH or kind==render.MST_TRIANGLE_SOUP then
      bounds=faceBounds(map,offset);if bounds is error then return bounds end if;centers[faceIndex]=bounds[0];radii[faceIndex]=bounds[1]
      amount=faceTriangleCount(map,offset,patchError);if amount is error then return amount end if;counts[faceIndex]=amount
      normals[faceIndex]=[f32(map,offset+84),f32(map,offset+88),f32(map,offset+92)]
      // Extract each face into its final bucket.  The former whole-map
      // extraction repeatedly appended to one ever-growing immutable array,
      // turning startup into quadratic copying on retail maps.
      faceData=render.extractWithPatchError(map,[faceIndex],amount,patchError);if faceData is error then return faceData end if
      byFace[faceIndex]=faceData.triangles
    end if
  end for
  totalTriangles=0;for each count in counts totalTriangles=totalTriangles+count end for
  return WorldCache(map,centers,radii,counts,kinds,normals,textureIndexes,array(map.counts[1],false),byFace,n.f32(patchError),totalTriangles)
end function

function setTwoSidedTextures(cache,flags)
  if cache==void or flags==void or len(flags)!=cache.map.counts[1] then return fail("two-sided texture table does not match BSP shaders") end if
  cache.twoSidedTextureFlags=flags;return cache
end function

function chooseCorePvs(map,camera,pvsOrigin,cfg,cache)
  if not validMap(map) then return fail("invalid BSP object") end if
  if camera==void or camera.position==void or len(camera.position)!=3 then return fail("invalid camera") end if
  if pvsOrigin==void or len(pvsOrigin)!=3 then return fail("invalid PVS origin") end if
  if cfg==void then return fail("missing configuration") end if
  leaf=pointLeaf(map,pvsOrigin);if leaf is error then return leaf end if
  cameraCluster=i32(map,map.offsets[4]+leaf*LEAF_STRIDE);if cameraCluster is error then return cameraCluster end if
  pvsUsed=map.lengths[16]>0 and cameraCluster>=0
  faceList=lists.List.withCapacity(map.counts[13]);seenFaces=array(map.counts[13],false);rejectedPvs=0
  for leafIndex=0 to map.counts[4]-1
    leafOffset=map.offsets[4]+leafIndex*LEAF_STRIDE;cluster=i32(map,leafOffset)
    leafVisible=true;if pvsUsed then leafVisible=pvsContains(map,cameraCluster,cluster) end if
    if leafVisible then
      first=i32(map,leafOffset+32);count=i32(map,leafOffset+36)
      if first<0 or count<0 or first+count>map.counts[5] then return fail("invalid leaf surface range") end if
      if count>0 then for slot=first to first+count-1 face=i32(map,map.offsets[5]+slot*4);if face<0 or face>=map.counts[13] then return fail("invalid leaf face") end if;if not seenFaces[face] then faceList.add(face);seenFaces[face]=true end if end for end if
    else rejectedPvs=rejectedPvs+1
    end if
  end for
  candidateList=lists.List.withCapacity(faceList.len());rejectedFrustum=0;rejectedBackface=0;rejectedDistance=0
  for each faceIndex in faceList.toArray()
    faceOffset=map.offsets[13]+faceIndex*FACE_STRIDE;kind=i32(map,faceOffset+8)
    if kind==render.MST_PLANAR or kind==render.MST_PATCH or kind==render.MST_TRIANGLE_SOUP then
      center=[0.0,0.0,0.0];radius=0.0
      if cache==void then bounds=faceBounds(map,faceOffset);if bounds is error then return bounds end if;center=bounds[0];radius=bounds[1] else center=cache.faceCenters[faceIndex];radius=cache.faceRadii[faceIndex] end if
      local=viewer.viewPoint(camera,center);distanceSquared=local[0]*local[0]+local[1]*local[1]+local[2]*local[2]
      if distanceSquared>(cfg.farDistance+radius)*(cfg.farDistance+radius) then rejectedDistance=rejectedDistance+1 else
        if not visibleInFrustum(local,radius,cfg) then rejectedFrustum=rejectedFrustum+1 else
          back=false;twoSided=false
          if cache!=void then textureIndex=cache.faceTextureIndexes[faceIndex];if textureIndex>=0 and textureIndex<len(cache.twoSidedTextureFlags) then twoSided=cache.twoSidedTextureFlags[textureIndex] end if end if
          if cfg.backfaceCull and kind==render.MST_PLANAR and not twoSided then
            nx=0.0;ny=0.0;nz=0.0
            if cache==void then nx=f32(map,faceOffset+84);ny=f32(map,faceOffset+88);nz=f32(map,faceOffset+92) else nx=cache.faceNormals[faceIndex][0];ny=cache.faceNormals[faceIndex][1];nz=cache.faceNormals[faceIndex][2] end if
            back=nx*(camera.position[0]-center[0])+ny*(camera.position[1]-center[1])+nz*(camera.position[2]-center[2])<0.0
          end if
          if back then rejectedBackface=rejectedBackface+1 else
            triangles=0
            if cache==void then triangles=faceTriangleCount(map,faceOffset,cfg.patchError);if triangles is error then return triangles end if else triangles=cache.faceTriangleCounts[faceIndex] end if
            importance=distanceSquared/((radius+1.0)*(radius+1.0));candidate=Candidate(faceIndex,triangles,distanceSquared,importance)
            candidateList.add(candidate)
          end if
        end if
      end if
    end if
  end for
  candidates=candidateList.toArray()
  // The old insertion path rebuilt the complete candidate array for every
  // accepted face (quadratic copying).  A single std stable sort preserves
  // the exact importance/face-index order in O(n log n).
  if cache==void or cfg.triangleBudget<cache.totalTriangleCount then sorting.sortBy(candidates,before) end if
  selectedList=lists.List.withCapacity(len(candidates));used=0;rejectedBudget=0
  for each candidate in candidates
    if candidate.triangleCount==0 then continue end if
    if used+candidate.triangleCount<=cfg.triangleBudget then selectedList.add(candidate.faceIndex);used=used+candidate.triangleCount else rejectedBudget=rejectedBudget+1 end if
  end for
  selected=selectedList.toArray()
  return Selection(selected,len(candidates),len(selected),used,pvsUsed,leaf,cameraCluster,rejectedPvs,rejectedFrustum,rejectedBackface,rejectedDistance,rejectedBudget)
end function

function chooseCore(map,camera,cfg,cache) return chooseCorePvs(map,camera,camera.position,cfg,cache) end function
function choose(map,camera,cfg) return chooseCore(map,camera,cfg,void) end function
function chooseCached(cache,camera,cfg)
  if cache==void or cache.map==void then return fail("invalid world cache") end if
  if cfg.patchError!=cache.patchError then return fail("cache patch error differs from configuration") end if
  return chooseCore(cache.map,camera,cfg,cache)
end function
function choosePortalCached(cache,camera,pvsOrigin,cfg)
  if cache==void or cache.map==void then return fail("invalid world cache") end if
  if cfg.patchError!=cache.patchError then return fail("cache patch error differs from configuration") end if
  return chooseCorePvs(cache.map,camera,pvsOrigin,cfg,cache)
end function

function cachedRenderData(cache,chosen)
  if cache==void or chosen==void then return fail("cache and selection required") end if
  total=0;patches=0
  for each faceIndex in chosen.faceIndexes
    if faceIndex<0 or faceIndex>=len(cache.trianglesByFace) then return fail("selected face outside cache") end if
    total=total+len(cache.trianglesByFace[faceIndex]);if cache.faceKinds[faceIndex]==render.MST_PATCH then patches=patches+1 end if
  end for
  triangles=array(total,void);offset=0
  for each faceIndex in chosen.faceIndexes for each triangle in cache.trianglesByFace[faceIndex] triangles[offset]=triangle;offset=offset+1 end for end for
  return render.RenderData(triangles,chosen.selectedSurfaceCount,len(triangles),0,false,patches)
end function

function prepareCached(cache,camera,cfg)
  chosen=chooseCached(cache,camera,cfg);if chosen is error then return chosen end if
  return PreparedWorld(chosen,cachedRenderData(cache,chosen))
end function
function preparePortalCached(cache,camera,pvsOrigin,cfg)
  chosen=choosePortalCached(cache,camera,pvsOrigin,cfg);if chosen is error then return chosen end if
  return PreparedWorld(chosen,cachedRenderData(cache,chosen))
end function

// Camera checks run regularly, but rebuilding retained material commands is
// only necessary when the selected BSP face set actually changes.
function sameFaces(left,right)
  if left==void or right==void or len(left)!=len(right) then return false end if
  for index=0 to len(left)-1 if left[index]!=right[index] then return false end if end for
  return true
end function

function prepare(map,camera,cfg)
  chosen=choose(map,camera,cfg);if chosen is error then return chosen end if
  data=render.extractWithPatchError(map,chosen.faceIndexes,cfg.triangleBudget,cfg.patchError);if data is error then return data end if
  return PreparedWorld(chosen,data)
end function
