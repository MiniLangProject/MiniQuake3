// SPDX-License-Identifier: GPL-2.0-or-later
// Camera-driven BSP46 world-surface selection for the playable renderer.
package mq3.renderer.world_surface_selection

import mq3.compat.numeric as n
import mq3.client.playable_viewer as viewer
import mq3.renderer.bsp_render_data as render
import mq3.shared.math as qmath
import std.ds.list as lists
import std.sort as sorting
import mq3.renderer.native_world_selection as nativeWorld
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.world_patch_lod as patchLod
import mq3.platform.playable_window as window

const NODE_STRIDE=36
const PLANE_STRIDE=16
const LEAF_STRIDE=48
const FACE_STRIDE=104
const DEFAULT_HORIZONTAL_FOV=100.0
const DEFAULT_NEAR_DISTANCE=1.0
const DEFAULT_FAR_DISTANCE=8192.0
const DEFAULT_TRIANGLE_BUDGET=12000
const CULL_FRONT=0
const CULL_TWO_SIDED=1
const CULL_BACK=2
const FACE_PLANE_EPSILON=8.0

struct SelectionConfig width height horizontalFov nearDistance farDistance triangleBudget backfaceCull patchError runtime verticalFov areaMask lodCurveError end struct
struct Candidate faceIndex triangleCount distanceSquared importance end struct
struct Selection faceIndexes candidateCount selectedSurfaceCount estimatedTriangleCount pvsUsed cameraLeaf cameraCluster rejectedPvs rejectedFrustum rejectedBackface rejectedDistance rejectedBudget end struct
struct PreparedWorld selection renderData end struct
struct Frustum slopeX slopeY radiusScaleX radiusScaleY end struct
struct WorldCache map faceCenters faceRadii faceTriangleCounts faceKinds faceNormals faceTextureIndexes cullModes trianglesByFace patchError totalTriangleCount pvsFaces pvsRejected pvsClusterCount nativeFaces nativeVisible nativeOutput nativePrevious nativeSelected areaMask patches end struct

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
  return SelectionConfig(width,height,n.f32(horizontalFov),n.f32(nearDistance),n.f32(farDistance),triangleBudget,backfaceCull,n.f32(patchError),void,void,void,void)
end function
function defaults(width,height) return config(width,height,DEFAULT_HORIZONTAL_FOV,DEFAULT_NEAR_DISTANCE,DEFAULT_FAR_DISTANCE,DEFAULT_TRIANGLE_BUDGET,true,render.DEFAULT_PATCH_ERROR) end function
function setView(cfg,refdef)
  cfg.horizontalFov=refdef.fovX;cfg.verticalFov=refdef.fovY;cfg.runtime=refdef.viewaxis;cfg.areaMask=refdef.areaMask
  return cfg
end function
function forView(cfg,refdef)
  return SelectionConfig(cfg.width,cfg.height,refdef.fovX,cfg.nearDistance,cfg.farDistance,cfg.triangleBudget,cfg.backfaceCull,cfg.patchError,refdef.viewaxis,refdef.fovY,refdef.areaMask,cfg.lodCurveError)
end function

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
  if map.lengths[16]<8 or map.offsets[16]<0 or map.offsets[16]+map.lengths[16]>len(map.data) then return false end if
  clusters=i32(map,map.offsets[16]);rowBytes=i32(map,map.offsets[16]+4)
  if clusters is error or rowBytes is error or rowBytes<=0 or cluster<0 or cluster>=clusters or other<0 or other>=clusters then return false end if
  if rowBytes<n.quotient(clusters+7,8) or 8+clusters*rowBytes>map.lengths[16] then return false end if
  at=map.offsets[16]+8+cluster*rowBytes+(other>>3)
  if at<map.offsets[16]+8 or at>=map.offsets[16]+map.lengths[16] then return false end if
  return (map.data[at]&(1<<(other&7)))!=0
end function
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function

function faceTriangleCount(map,faceOffset,patchError)
  kind=i32(map,faceOffset+8);numMesh=i32(map,faceOffset+24)
  if kind==render.MST_PLANAR or kind==render.MST_TRIANGLE_SOUP then return n.quotient(numMesh,3) end if
  if kind!=render.MST_PATCH then return 0 end if
  firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);width=i32(map,faceOffset+96);height=i32(map,faceOffset+100)
  if width<3 or height<3 or width>render.MAX_PATCH_SIZE or height>render.MAX_PATCH_SIZE or width%2==0 or height%2==0 or width*height!=numVerts then return fail("invalid patch control grid") end if
  control=array(numVerts,void);for index=0 to numVerts-1 value=render.vertex(map,firstVert+index);if value is error then return value end if;control[index]=value end for
  grid=render.subdividePatch(control,width,height,patchError);if grid is error then return grid end if
  return (grid[1]-1)*(grid[2]-1)*2
end function

function faceBounds(map,faceOffset)
  first=i32(map,faceOffset+12);count=i32(map,faceOffset+16)
  if first is error or count is error or first<0 or count<=0 or first+count>map.counts[10] then return fail("invalid face vertex range") end if
  center=[0.0,0.0,0.0];positions=array(count,void)
  for index=0 to count-1 value=render.vertex(map,first+index);if value is error then return value end if;positions[index]=value.position;for axis=0 to 2 center[axis]=center[axis]+value.position[axis] end for end for
  for axis=0 to 2 center[axis]=center[axis]/count end for
  radiusSquared=0.0
  for each position in positions sum=0.0;for axis=0 to 2 delta=position[axis]-center[axis];sum=sum+delta*delta end for;if sum>radiusSquared then radiusSquared=sum end if end for
  return [center,n.fsqrt(radiusSquared)]
end function

function prepareFrustum(cfg)
  focal=viewer.focalLength(cfg.width,cfg.horizontalFov);if focal is error then return focal end if
  sx=cfg.width/(2.0*focal);sy=cfg.height/(2.0*focal)
  if cfg.verticalFov!=void then
    verticalFocal=viewer.focalLength(cfg.height,cfg.verticalFov);if verticalFocal is error then return verticalFocal end if
    sy=cfg.height/(2.0*verticalFocal)
  end if
  return Frustum(sx,sy,n.fsqrt(1.0+sx*sx),n.fsqrt(1.0+sy*sy))
end function
function visibleInPreparedFrustum(local,radius,cfg,frustum)
  if local[2]+radius<cfg.nearDistance or local[2]-radius>cfg.farDistance then return false end if
  // x +/- z*tan(fov/2) is an unnormalised plane equation. Expand its
  // bound by radius*|normal|; using radius alone drops visible wall edges.
  horizontal=local[2]*frustum.slopeX+radius*frustum.radiusScaleX
  vertical=local[2]*frustum.slopeY+radius*frustum.radiusScaleY
  return local[0]>=0.0-horizontal and local[0]<=horizontal and local[1]>=0.0-vertical and local[1]<=vertical
end function
function visibleInFrustum(local,radius,cfg)
  frustum=prepareFrustum(cfg);if frustum is error then return false end if
  return visibleInPreparedFrustum(local,radius,cfg,frustum)
end function
function viewPointAxes(camera,point,axes)
  delta=[n.fsub(point[0],camera.position[0]),n.fsub(point[1],camera.position[1]),n.fsub(point[2],camera.position[2])]
  return [qmath.DotProduct(delta,axes[1]),qmath.DotProduct(delta,axes[2]),qmath.DotProduct(delta,axes[0])]
end function
function before(a,b)
  if a.importance<b.importance then return true end if
  if a.importance>b.importance then return false end if
  return a.faceIndex<b.faceIndex
end function
function preparePatches(patches,byFace,counts,nativeFaces,centers,radii,normals)
  patchLod.stitch(patches);coarseCount=0;coarseTriangles=0
  for each patch in patches
    allAxes=patchLod.axes(patch.grid);patch.variants=allAxes
    full=patchLod.triangles(patch,allAxes[len(allAxes)-1],patch.face);if full is error then return full end if
    byFace[patch.face]=full;counts[patch.face]=len(full)
    stored=nativeWorld.store(nativeFaces,patch.face,render.MST_PATCH,len(full),centers[patch.face],radii[patch.face],normals[patch.face]);if stored!=1 then return fail("native patch cache rejected input") end if
    coarseCount=coarseCount+len(allAxes)-1
    if len(allAxes)>1 then for index=0 to len(allAxes)-2
      axis=allAxes[index];coarseTriangles=coarseTriangles+(len(axis.columns)-1)*(len(axis.rows)-1)*2
    end for end if
  end for
  total=0;for each count in counts total=total+count end for
  // A large custom map can still use its fine mesh without capping visible
  // faces simply because an optional retained LOD cache would exceed storage.
  if total+coarseTriangles>window.TRIANGLE_BATCH_MAX_COUNT then coarseCount=0 end if
  return coarseCount
end function

function buildCache(map,patchError) return buildCacheForPatches(map,patchError,false) end function
function buildCacheForPatches(map,patchError,withVariants)
  if not validMap(map) then return fail("invalid BSP object") end if
  if patchError<=0.0 then return fail("non-positive patch error") end if
  centers=array(map.counts[13],void);radii=array(map.counts[13],0.0);counts=array(map.counts[13],0);kinds=array(map.counts[13],0);normals=array(map.counts[13],void);textureIndexes=array(map.counts[13],-1);byFace=array(map.counts[13],void)
  nativeFaces=bytes(map.counts[13]*72,0)
  patchList=lists.List.new();patches=void
  for faceIndex=0 to map.counts[13]-1
    byFace[faceIndex]=[];offset=map.offsets[13]+faceIndex*FACE_STRIDE;textureIndexes[faceIndex]=i32(map,offset);kind=i32(map,offset+8);kinds[faceIndex]=kind
    if kind==render.MST_PATCH then
      noDraw=render.patchNoDraw(map,textureIndexes[faceIndex]);if noDraw is error then return noDraw end if
      if noDraw then continue end if
    end if
    if kind==render.MST_PLANAR or kind==render.MST_PATCH or kind==render.MST_TRIANGLE_SOUP then
      bounds=faceBounds(map,offset);if bounds is error then return bounds end if;centers[faceIndex]=bounds[0];radii[faceIndex]=bounds[1]
      // Patch extraction already subdivides the control grid. Reuse its
      // triangle count instead of running the same subdivision twice.
      amount=0;faceData=void
      normals[faceIndex]=[f32(map,offset+84),f32(map,offset+88),f32(map,offset+92)]
      if kind==render.MST_PATCH then
        if withVariants then
          patch=patchLod.read(map,faceIndex,offset,textureIndexes[faceIndex],patchError);if patch is error then return patch end if
          patchList.add(patch);continue
        end if
        patchLimit=(render.MAX_GRID_SIZE-1)*(render.MAX_GRID_SIZE-1)*2
        faceData=render.extractRetainedWithPatchError(map,[faceIndex],patchLimit,patchError);if faceData is error then return faceData end if
        if faceData.truncated then return fail("patch exceeded renderer grid limit") end if
        amount=faceData.triangleCount
      else
        amount=faceTriangleCount(map,offset,patchError);if amount is error then return amount end if
        faceData=render.extractRetainedWithPatchError(map,[faceIndex],amount,patchError);if faceData is error then return faceData end if
      end if
      counts[faceIndex]=amount
      stored=nativeWorld.store(nativeFaces,faceIndex,kind,amount,centers[faceIndex],radii[faceIndex],normals[faceIndex]);if stored!=1 then return fail("native face cache rejected input") end if
      // Extract each face into its final bucket.  The former whole-map
      // extraction repeatedly appended to one ever-growing immutable array,
      // turning startup into quadratic copying on retail maps.
      byFace[faceIndex]=faceData.triangles
    end if
  end for
  if patchList.len()>0 then
    all=patchList.toArray();coarse=preparePatches(all,byFace,counts,nativeFaces,centers,radii,normals);if coarse is error then return coarse end if
    if coarse>0 then
      // Variant records use synthetic face IDs. BSP PVS, distance checks,
      // and native culling still run over the original surface IDs only.
      rawFaces=map.counts[13];expanded=rawFaces+coarse
      extendedFaces=array(expanded,void);copyArray(extendedFaces,0,byFace,0,rawFaces);byFace=extendedFaces
      extendedKinds=array(expanded,render.MST_PATCH);copyArray(extendedKinds,0,kinds,0,rawFaces);kinds=extendedKinds
      extendedTextures=array(expanded,-1);copyArray(extendedTextures,0,textureIndexes,0,rawFaces);textureIndexes=extendedTextures
      patches=array(rawFaces,void);variantFace=rawFaces
      for each patch in all
        axes=patch.variants;last=len(axes)-1
        if last>0 then
          variants=array(len(axes),void)
          for index=0 to last-1
            data=patchLod.triangles(patch,axes[index],variantFace);if data is error then return data end if
            byFace[variantFace]=data;textureIndexes[variantFace]=patch.texture
            variants[index]=patchLod.WorldLodVariant(axes[index].minimum,variantFace);variantFace=variantFace+1
          end for
          variants[last]=patchLod.WorldLodVariant(axes[last].minimum,patch.face)
          patch.variants=variants;patches[patch.face]=patch
        end if
      end for
    end if
  end if
  totalTriangles=0;for each count in counts totalTriangles=totalTriangles+count end for
  clusterCount=0;if map.lengths[16]>=8 then clusterCount=i32(map,map.offsets[16]);if clusterCount is error or clusterCount<0 then return fail("invalid visibility cluster count") end if end if
  // One extra slot caches the no-vis fallback shared by every leaf.
  return WorldCache(map,centers,radii,counts,kinds,normals,textureIndexes,array(map.counts[1],CULL_FRONT),byFace,n.f32(patchError),totalTriangles,array(clusterCount+1,void),array(clusterCount+1,0),clusterCount,nativeFaces,array(clusterCount+1,void),bytes(32+map.counts[13]*4,0),bytes(32+map.counts[13]*4,0),[],void,patches)
end function

function setCullModes(cache,modes)
  if cache==void or modes==void or len(modes)!=cache.map.counts[1] then return fail("cull mode table does not match BSP shaders") end if
  cache.cullModes=modes
  if cache.nativeFaces!=void and cache.map.counts[13]>0 then
    for index=0 to cache.map.counts[13]-1
      texture=cache.faceTextureIndexes[index];mode=CULL_FRONT
      if texture>=0 and texture<len(modes) then mode=modes[texture] end if
      if nativeWorld.setCullMode(cache.nativeFaces,index,mode)!=1 then return fail("native face flags rejected input") end if
    end for
  end if
  return cache
end function

function setTwoSidedTextures(cache,flags)
  if cache==void or flags==void or len(flags)!=cache.map.counts[1] then return fail("two-sided texture table does not match BSP shaders") end if
  modes=array(len(flags),CULL_FRONT)
  if len(flags)>0 then for index=0 to len(flags)-1 if flags[index] then modes[index]=CULL_TWO_SIDED end if end for end if
  return setCullModes(cache,modes)
end function

function setIndexedCulling(cache,index)
  modes=array(cache.map.counts[1],CULL_FRONT)
  if len(modes)==0 then return setCullModes(cache,modes) end if
  for textureIndex=0 to len(modes)-1
    name=materials.shaderName(cache.map,textureIndex);if name is error then return name end if
    shader=try(shaderParser.parseIndexed(index,name));if shader==void or shader is error then continue end if
    if shader.cull=="twoSided" then modes[textureIndex]=CULL_TWO_SIDED else if shader.cull=="back" then modes[textureIndex]=CULL_BACK end if
  end for
  return setCullModes(cache,modes)
end function

function equalAreaMask(left,right)
  if left==void or right==void then return left==right end if
  if len(left)!=len(right) then return false end if
  if len(left)==0 then return true end if
  for index=0 to len(left)-1 if left[index]!=right[index] then return false end if end for
  return true
end function

function visibleFaces(map,cameraCluster,pvsUsed,areaMask)
  faceList=lists.List.withCapacity(map.counts[13]);seenFaces=array(map.counts[13],false);rejectedPvs=0
  for leafIndex=0 to map.counts[4]-1
    leafOffset=map.offsets[4]+leafIndex*LEAF_STRIDE;cluster=i32(map,leafOffset)
    leafVisible=true;if pvsUsed then leafVisible=pvsContains(map,cameraCluster,cluster) end if
    if areaMask!=void and cameraCluster>=0 then
      area=i32(map,leafOffset+4);if area is error then return area end if
      if area>=0 and (area>>3)<len(areaMask) and (areaMask[area>>3]&(1<<(area&7)))!=0 then leafVisible=false end if
    end if
    if leafVisible then
      first=i32(map,leafOffset+32);count=i32(map,leafOffset+36)
      if first<0 or count<0 or first+count>map.counts[5] then return fail("invalid leaf surface range") end if
      if count>0 then for slot=first to first+count-1 face=i32(map,map.offsets[5]+slot*4);if face<0 or face>=map.counts[13] then return fail("invalid leaf face") end if;if not seenFaces[face] then faceList.add(face);seenFaces[face]=true end if end for end if
    else rejectedPvs=rejectedPvs+1
    end if
  end for
  return [faceList.toArray(),rejectedPvs]
end function

function cachedVisibleFaces(cache,map,cameraCluster,pvsUsed,areaMask)
  if cache==void then return visibleFaces(map,cameraCluster,pvsUsed,areaMask) end if
  if not equalAreaMask(cache.areaMask,areaMask) then
    cache.areaMask=areaMask
    cache.pvsFaces=array(cache.pvsClusterCount+1,void);cache.nativeVisible=array(cache.pvsClusterCount+1,void)
  end if
  slot=cache.pvsClusterCount;if pvsUsed then slot=cameraCluster end if
  if slot<0 or slot>=len(cache.pvsFaces) then return visibleFaces(map,cameraCluster,pvsUsed,areaMask) end if
  if cache.pvsFaces[slot]==void then result=visibleFaces(map,cameraCluster,pvsUsed,areaMask);if result is error then return result end if;cache.pvsFaces[slot]=result[0];cache.pvsRejected[slot]=result[1] end if
  return [cache.pvsFaces[slot],cache.pvsRejected[slot]]
end function

function chooseCorePvs(map,camera,pvsOrigin,cfg,cache)
  if not validMap(map) then return fail("invalid BSP object") end if
  if camera==void or camera.position==void or len(camera.position)!=3 then return fail("invalid camera") end if
  if pvsOrigin==void or len(pvsOrigin)!=3 then return fail("invalid PVS origin") end if
  if cfg==void then return fail("missing configuration") end if
  leaf=pointLeaf(map,pvsOrigin);if leaf is error then return leaf end if
  cameraCluster=i32(map,map.offsets[4]+leaf*LEAF_STRIDE);if cameraCluster is error then return cameraCluster end if
  pvsUsed=map.lengths[16]>0 and cameraCluster>=0
  visible=cachedVisibleFaces(cache,map,cameraCluster,pvsUsed,cfg.areaMask);if visible is error then return visible end if;faceIndexes=visible[0];rejectedPvs=visible[1]
  // Camera axes and trigonometric frustum terms are invariant across all
  // candidate faces. A QVM refdef can supply its exact rolled camera axes.
  axes=cfg.runtime;if axes==void then axes=viewer.cameraBasis(camera) end if
  frustum=prepareFrustum(cfg);if frustum is error then return frustum end if
  // A budget covering the complete map cannot drop a candidate. Keep exact
  // PVS discovery/order in MiniLang and filter the retained numeric records in
  // one native pass; constrained/zero budgets retain the reference sort path.
  if cache!=void and cache.nativeFaces!=void and cfg.triangleBudget>=cache.totalTriangleCount then
    slot=cache.pvsClusterCount;if pvsUsed then slot=cameraCluster end if
    packedVisible=void
    if slot>=0 and slot<len(cache.nativeVisible) then packedVisible=cache.nativeVisible[slot] end if
    if packedVisible==void then packedVisible=nativeWorld.packIndexes(faceIndexes);if slot>=0 and slot<len(cache.nativeVisible) then cache.nativeVisible[slot]=packedVisible end if end if
    filtered=nativeWorld.filter(cache,packedVisible,camera,cfg,axes,frustum);if filtered!=1 then return fail("native face filter rejected input") end if
    data=cache.nativeOutput;selectedCount=n.readI32(data,4)
    if n.readI32(data,24)==0 then selected=array(selectedCount,0);if selectedCount>0 then for index=0 to selectedCount-1 selected[index]=n.readI32(data,32+index*4) end for end if;cache.nativeSelected=selected end if
    return Selection(cache.nativeSelected,n.readI32(data,0),selectedCount,n.readI32(data,8),pvsUsed,leaf,cameraCluster,rejectedPvs,n.readI32(data,12),n.readI32(data,16),n.readI32(data,20),0)
  end if
  candidateList=lists.List.withCapacity(len(faceIndexes));rejectedFrustum=0;rejectedBackface=0;rejectedDistance=0
  for each faceIndex in faceIndexes
    faceOffset=map.offsets[13]+faceIndex*FACE_STRIDE;kind=i32(map,faceOffset+8)
    if kind==render.MST_PATCH then
      noDraw=render.patchNoDraw(map,i32(map,faceOffset));if noDraw is error then return noDraw end if
      if noDraw then continue end if
    end if
    if kind==render.MST_PLANAR or kind==render.MST_PATCH or kind==render.MST_TRIANGLE_SOUP then
      center=[0.0,0.0,0.0];radius=0.0
      if cache==void then bounds=faceBounds(map,faceOffset);if bounds is error then return bounds end if;center=bounds[0];radius=bounds[1] else center=cache.faceCenters[faceIndex];radius=cache.faceRadii[faceIndex] end if
      local=viewPointAxes(camera,center,axes);distanceSquared=local[0]*local[0]+local[1]*local[1]+local[2]*local[2]
      if distanceSquared>(cfg.farDistance+radius)*(cfg.farDistance+radius) then rejectedDistance=rejectedDistance+1 else
        if not visibleInPreparedFrustum(local,radius,cfg,frustum) then rejectedFrustum=rejectedFrustum+1 else
          back=false;mode=CULL_FRONT
          if cache!=void then textureIndex=cache.faceTextureIndexes[faceIndex];if textureIndex>=0 and textureIndex<len(cache.cullModes) then mode=cache.cullModes[textureIndex] end if end if
          if cfg.backfaceCull and kind==render.MST_PLANAR and mode!=CULL_TWO_SIDED then
            nx=0.0;ny=0.0;nz=0.0
            if cache==void then nx=f32(map,faceOffset+84);ny=f32(map,faceOffset+88);nz=f32(map,faceOffset+92) else nx=cache.faceNormals[faceIndex][0];ny=cache.faceNormals[faceIndex][1];nz=cache.faceNormals[faceIndex][2] end if
            facing=nx*(camera.position[0]-center[0])+ny*(camera.position[1]-center[1])+nz*(camera.position[2]-center[2])
            if mode==CULL_BACK then back=facing>FACE_PLANE_EPSILON else back=facing< -FACE_PLANE_EPSILON end if
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

function choosePatchLod(cache,chosen,camera,cfg)
  if cfg.lodCurveError==void or cache.patches==void or len(chosen.faceIndexes)==0 then return chosen end if
  axes=cfg.runtime;if axes==void then axes=viewer.cameraBasis(camera) end if
  selected=void
  for index=0 to len(chosen.faceIndexes)-1
    face=chosen.faceIndexes[index];patch=cache.patches[face]
    if patch==void then continue end if
    variant=patchLod.select(patch,camera.position,axes[0],cfg.lodCurveError);if variant is error then return variant end if
    if variant==face then continue end if
    if selected==void then selected=array(len(chosen.faceIndexes),0);copyArray(selected,0,chosen.faceIndexes,0,len(chosen.faceIndexes)) end if
    selected[index]=variant
    chosen.estimatedTriangleCount=chosen.estimatedTriangleCount-len(cache.trianglesByFace[face])+len(cache.trianglesByFace[variant])
  end for
  if selected!=void then chosen.faceIndexes=selected end if
  return chosen
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
  chosen=choosePatchLod(cache,chosen,camera,cfg);if chosen is error then return chosen end if
  return PreparedWorld(chosen,cachedRenderData(cache,chosen))
end function
// Keep the already-flattened triangle stream when camera motion does not
// alter the visible face order. PVS/frustum metadata is still refreshed,
// while the hot frame path avoids rebuilding an identical immutable array.
function prepareCachedRetained(cache,camera,cfg,previous)
  chosen=chooseCached(cache,camera,cfg);if chosen is error then return chosen end if
  chosen=choosePatchLod(cache,chosen,camera,cfg);if chosen is error then return chosen end if
  if previous!=void and previous.selection!=void and previous.renderData!=void and sameFaces(previous.selection.faceIndexes,chosen.faceIndexes) then return PreparedWorld(chosen,previous.renderData) end if
  return PreparedWorld(chosen,cachedRenderData(cache,chosen))
end function
function preparePortalCached(cache,camera,pvsOrigin,cfg)
  chosen=choosePortalCached(cache,camera,pvsOrigin,cfg);if chosen is error then return chosen end if
  chosen=choosePatchLod(cache,chosen,camera,cfg);if chosen is error then return chosen end if
  return PreparedWorld(chosen,cachedRenderData(cache,chosen))
end function

// Camera checks run regularly, but rebuilding retained material commands is
// only necessary when the selected BSP face set actually changes.
function sameFaces(left,right)
  if left==void or right==void or len(left)!=len(right) then return false end if
  if len(left)==0 then return true end if
  for index=0 to len(left)-1 if left[index]!=right[index] then return false end if end for
  return true
end function

function prepare(map,camera,cfg)
  chosen=choose(map,camera,cfg);if chosen is error then return chosen end if
  data=render.extractWithPatchError(map,chosen.faceIndexes,cfg.triangleBudget,cfg.patchError);if data is error then return data end if
  return PreparedWorld(chosen,data)
end function
