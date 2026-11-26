import mq3.compat.numeric as n
import mq3.format.bsp as bsp
import mq3.client.playable_viewer as viewer
import mq3.renderer.bsp_render_data as render
import mq3.renderer.world_surface_selection as selection

function require(ok,text) if not ok then return error(7491,text) end if;return 1 end function
function putI(data,offset,value) return n.writeU32(data,offset,value) end function
function putF(data,offset,value) return n.writeU32(data,offset,n.floatBits(value)) end function
function fixture()
  data=bytes(4096,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[1]=0;lengths[1]=72;counts[1]=1
  offsets[2]=80;lengths[2]=16;counts[2]=1;putF(data,80,1.0);putF(data,92,0.0)
  offsets[3]=100;lengths[3]=36;counts[3]=1;putI(data,100,0);putI(data,104,0xffffffff);putI(data,108,0xfffffffe)
  offsets[4]=160;lengths[4]=96;counts[4]=2
  putI(data,160,0);putI(data,160+32,0);putI(data,160+36,5)
  putI(data,208,1);putI(data,208+32,5);putI(data,208+36,1)
  offsets[5]=280;lengths[5]=24;counts[5]=6;for i=0 to 5 putI(data,280+i*4,i) end for
  offsets[7]=1920;lengths[7]=40;counts[7]=1;putI(data,1920+24,0);putI(data,1920+28,6)
  offsets[10]=320;lengths[10]=18*44;counts[10]=18
  centers=[[100.0,0.0,0.0],[20.0,0.0,0.0],[-20.0,0.0,0.0],[20.0,100.0,0.0],[30.0,0.0,0.0],[25.0,0.0,0.0]]
  for face=0 to 5
    x=centers[face][0];y=centers[face][1];z=centers[face][2];points=[[x,y-1.0,z-1.0],[x,y+1.0,z-1.0],[x,y,z+1.0]]
    for corner=0 to 2 off=320+(face*3+corner)*44;for axis=0 to 2 putF(data,off+axis*4,points[corner][axis]) end for;data[off+40]=255;data[off+41]=255;data[off+42]=255;data[off+43]=255 end for
  end for
  offsets[11]=1120;lengths[11]=72;counts[11]=18;for i=0 to 17 putI(data,1120+i*4,i%3) end for
  offsets[13]=1280;lengths[13]=624;counts[13]=6
  for face=0 to 5
    off=1280+face*104;putI(data,off,0);putI(data,off+8,render.MST_PLANAR);putI(data,off+12,face*3);putI(data,off+16,3);putI(data,off+20,face*3);putI(data,off+24,3);putI(data,off+28,0xffffffff)
    normal=-1.0;if face==4 then normal=1.0 end if;putF(data,off+84,normal)
  end for
  offsets[16]=2000;lengths[16]=10;counts[16]=10;putI(data,2000,2);putI(data,2004,1);data[2008]=1;data[2009]=2
  return bsp.BSP(data,offsets,lengths,counts)
end function
function patchFixture()
  data=bytes(1024,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  counts[1]=1;offsets[1]=0;lengths[1]=72
  counts[10]=9;offsets[10]=72;lengths[10]=396
  for row=0 to 2 for column=0 to 2
    index=row*3+column;at=72+index*44;putF(data,at,column*1.0);putF(data,at+4,row*1.0)
    height=0.0;if row==1 and column==1 then height=32.0 end if;putF(data,at+8,height)
  end for end for
  counts[13]=1;offsets[13]=480;lengths[13]=104
  offsets[7]=600;lengths[7]=40;counts[7]=1;putI(data,600+24,0);putI(data,600+28,1)
  putI(data,480,0);putI(data,488,render.MST_PATCH);putI(data,492,0);putI(data,496,9);putI(data,508,-1);putI(data,576,3);putI(data,580,3)
  return bsp.BSP(data,offsets,lengths,counts)
end function

function main(args)
  c=0;map=fixture();camera=viewer.camera([10.0,0.0,0.0],0.0,0.0,0.0,0.0)
  noVis=fixture();noVis.lengths[16]=0;c=c+require(selection.pvsContains(noVis,0,1),"absent visibility lump keeps no-vis fallback")
  shortVis=fixture();shortVis.lengths[16]=8;c=c+require(not selection.pvsContains(shortVis,0,0),"truncated PVS row is rejected")
  wideVis=fixture();putI(wideVis.data,2004,100);c=c+require(not selection.pvsContains(wideVis,0,0),"out-of-lump PVS row is rejected")
  cfg=selection.config(800,600,90.0,1.0,200.0,1,true,render.DEFAULT_PATCH_ERROR)
  chosen=selection.choose(map,camera,cfg)
  c=c+require(chosen.pvsUsed and chosen.cameraLeaf==0 and chosen.cameraCluster==0,"camera leaf and PVS")
  c=c+require(chosen.rejectedPvs==1,"invisible leaf rejected")
  c=c+require(chosen.rejectedFrustum==2,"behind and side surfaces rejected")
  c=c+require(chosen.rejectedBackface==1,"planar backface rejected")
  c=c+require(chosen.candidateCount==2,"two visible candidates")
  c=c+require(chosen.faceIndexes==[1],"near surface wins one-triangle budget")
  c=c+require(chosen.estimatedTriangleCount==1 and chosen.rejectedBudget==1,"exact triangle budget accounting")
  cfg=selection.config(800,600,90.0,1.0,200.0,2,true,render.DEFAULT_PATCH_ERROR);chosen=selection.choose(map,camera,cfg)
  c=c+require(chosen.faceIndexes==[1,0],"stable relevance order replaces BSP order")
  c=c+require(chosen.selectedSurfaceCount==2 and chosen.estimatedTriangleCount==2,"larger configurable budget")
  prepared=selection.prepare(map,camera,cfg)
  c=c+require(prepared.selection.faceIndexes==[1,0],"prepared selection retained")
  c=c+require(len(prepared.renderData.triangles)==2 and not prepared.renderData.truncated,"render-data integration")
  cache=selection.buildCache(map,render.DEFAULT_PATCH_ERROR)
  c=c+require(cache.totalTriangleCount==6 and len(cache.trianglesByFace[5])==1,"one-time complete geometry cache")
  inlineLeaf=fixture();putI(inlineLeaf.data,inlineLeaf.offsets[7]+28,5)
  inlineVisible=selection.visibleFaces(inlineLeaf,0,false,void);inlineCache=selection.buildCache(inlineLeaf,render.DEFAULT_PATCH_ERROR)
  c=c+require(len(inlineVisible[0])==5 and inlineCache.totalTriangleCount==5 and len(inlineCache.trianglesByFace[5])==0,"leaf marks must not submit the moving inline model as static world")
  c=c+require(cache.faceCenters[0][0]==100.0 and cache.faceCenters[0][1]==0.0 and cache.faceRadii[0]>1.33 and cache.faceRadii[0]<1.34,"cached face centroid and radius retain exact geometry")
  patchMap=patchFixture();patchReference=render.extractRetainedWithPatchError(patchMap,[0],8192,render.DEFAULT_PATCH_ERROR)
  patchCache=selection.buildCache(patchMap,render.DEFAULT_PATCH_ERROR)
  c=c+require(patchCache.totalTriangleCount==patchReference.triangleCount and len(patchCache.trianglesByFace[0])==len(patchReference.triangles),"patch cache uses complete extracted triangle count")
  c=c+require(patchCache.trianglesByFace[0][0].vertices[0].position==patchReference.triangles[0].vertices[0].position and patchCache.trianglesByFace[0][len(patchReference.triangles)-1].triangleIndex==patchReference.triangles[len(patchReference.triangles)-1].triangleIndex,"patch cache preserves tessellation order and vertices")
  lodCache=selection.buildCacheForPatches(patchMap,render.DEFAULT_PATCH_ERROR,true);if lodCache is error then return lodCache end if
  lodCfg=selection.defaults(800,600);lodCfg.lodCurveError=250.0
  picked=selection.Selection([0],1,1,lodCache.totalTriangleCount,false,0,0,0,0,0,0,0)
  nearPatch=selection.choosePatchLod(lodCache,picked,viewer.camera([-2.0,0.0,0.0],0.0,0.0,0.0,0.0),lodCfg)
  c=c+require(nearPatch.faceIndexes==[0] and nearPatch.estimatedTriangleCount==patchReference.triangleCount,"near curves keep full retained tessellation")
  farPatch=selection.choosePatchLod(lodCache,picked,viewer.camera([-8192.0,0.0,0.0],0.0,0.0,0.0,0.0),lodCfg)
  c=c+require(farPatch.faceIndexes[0]>0 and farPatch.estimatedTriangleCount<patchReference.triangleCount,"distant curves gather a coarser retained mesh using the original LOD threshold")
  cachedChoice=selection.chooseCached(cache,camera,cfg)
  c=c+require(cachedChoice.faceIndexes==[1,0],"cached camera selection matches direct selection")
  cached=selection.prepareCached(cache,camera,cfg)
  c=c+require(cached.renderData.triangles[0].faceIndex==cache.trianglesByFace[1][0].faceIndex,"cached face geometry reused")
  c=c+require(len(cached.renderData.triangles)==2 and cached.renderData.triangles[1].faceIndex==0,"cached render stream follows priority")
  retained=selection.prepareCachedRetained(cache,camera,cfg,cached)
  c=c+require(retained.renderData==cached.renderData and retained.selection!=cached.selection,"unchanged face set retains flattened geometry while refreshing selection")
  portalCached=selection.preparePortalCached(cache,camera,[-10.0,0.0,0.0],cfg)
  c=c+require(portalCached.selection.cameraLeaf==1 and portalCached.selection.cameraCluster==1,"portal PVS uses marker origin")
  c=c+require(portalCached.selection.faceIndexes==[5] and portalCached.renderData.triangles[0].faceIndex==5,"portal frustum retains camera while PVS changes")
  c=c+require(selection.sameFaces(cached.selection.faceIndexes,[1,0]),"equal retained face selection")
  c=c+require(not selection.sameFaces(cached.selection.faceIndexes,[0,1]) and not selection.sameFaces(cached.selection.faceIndexes,[1]),"changed retained face selection")
  c=c+require(try(selection.setTwoSidedTextures(cache,[])) is error,"two-sided shader table length guarded")
  selection.setTwoSidedTextures(cache,[true]);twoSidedChoice=selection.chooseCached(cache,camera,cfg)
  c=c+require(twoSidedChoice.faceIndexes==[1,4] and twoSidedChoice.rejectedBackface==0,"two-sided shader keeps reverse-facing planar surface")
  selection.setTwoSidedTextures(cache,[false])
  unlimited=selection.config(800,600,90.0,1.0,200.0,cache.totalTriangleCount,true,render.DEFAULT_PATCH_ERROR)
  nearPlane=viewer.camera([26.0,0.0,0.0],0.0,0.0,0.0,0.0)
  nearDirect=selection.choose(map,nearPlane,unlimited);nearNative=selection.chooseCached(cache,nearPlane,unlimited)
  c=c+require(selection.contains(nearDirect.faceIndexes,4) and selection.contains(nearNative.faceIndexes,4),"front culling preserves the original eight-unit plane tolerance in both paths")
  selection.setCullModes(cache,[selection.CULL_BACK]);backCamera=viewer.camera([40.0,0.0,0.0],180.0,0.0,0.0,0.0)
  backNative=selection.chooseCached(cache,backCamera,unlimited)
  c=c+require(backNative.rejectedBackface>0 and not selection.contains(backNative.faceIndexes,4),"back culling rejects positive signed distances beyond eight units")
  areaMap=fixture();putI(areaMap.data,212,1);areaMap.data[2008]=3
  areaCache=selection.buildCache(areaMap,render.DEFAULT_PATCH_ERROR);unlimited.areaMask=bytes(32,0)
  open=selection.chooseCached(areaCache,camera,unlimited);unlimited.areaMask=bytes(32,0);unlimited.areaMask[0]=2
  closed=selection.chooseCached(areaCache,camera,unlimited);closedDirect=selection.choose(areaMap,camera,unlimited)
  c=c+require(selection.contains(open.faceIndexes,5) and not selection.contains(closed.faceIndexes,5) and not selection.contains(closedDirect.faceIndexes,5),"area masking invalidates cached PVS and suppresses the closed area")
  unlimited.areaMask=bytes(32,0);reopened=selection.chooseCached(areaCache,camera,unlimited)
  c=c+require(selection.contains(reopened.faceIndexes,5),"reopened area returns to cached native face selection")
  wrongError=selection.config(800,600,90.0,1.0,200.0,2,true,2.0)
  c=c+require(try(selection.chooseCached(cache,camera,wrongError)) is error,"cache patch error guarded")
  cfg=selection.config(800,600,90.0,1.0,200.0,3,false,render.DEFAULT_PATCH_ERROR);chosen=selection.choose(map,camera,cfg)
  c=c+require(chosen.faceIndexes==[1,4,0],"backface culling configurable")
  cfg=selection.config(800,600,90.0,1.0,50.0,4,true,render.DEFAULT_PATCH_ERROR);chosen=selection.choose(map,camera,cfg)
  c=c+require(chosen.faceIndexes==[1] and chosen.rejectedDistance==2,"far distance culling")
  noPvs=fixture();noPvs.lengths[16]=0;chosen=selection.choose(noPvs,camera,selection.config(800,600,90.0,1.0,200.0,4,true,render.DEFAULT_PATCH_ERROR))
  c=c+require(not chosen.pvsUsed and chosen.faceIndexes==[1,5,0],"all leaves fallback without PVS")
  zero=selection.choose(map,camera,selection.config(800,600,90.0,1.0,200.0,0,true,render.DEFAULT_PATCH_ERROR))
  c=c+require(len(zero.faceIndexes)==0 and zero.rejectedBudget==2,"zero budget")
  c=c+require(try(selection.config(0,600,90.0,1.0,200.0,1,true,4.0)) is error,"positive viewport")
  c=c+require(try(selection.config(800,600,180.0,1.0,200.0,1,true,4.0)) is error,"valid field of view")
  c=c+require(try(selection.config(800,600,90.0,0.0,200.0,1,true,4.0)) is error,"positive near distance")
  c=c+require(try(selection.config(800,600,90.0,10.0,10.0,1,true,4.0)) is error,"ordered distance range")
  c=c+require(try(selection.config(800,600,90.0,1.0,200.0,-1,true,4.0)) is error,"non-negative budget")
  c=c+require(try(selection.config(800,600,90.0,1.0,200.0,1,true,0.0)) is error,"positive patch error")
  frustumConfig=selection.config(800,600,90.0,1.0,200.0,10,false,render.DEFAULT_PATCH_ERROR)
  c=c+require(selection.visibleInFrustum([11.2,0.0,10.0],1.0,frustumConfig),"sphere crossing horizontal side plane stays visible")
  c=c+require(selection.visibleInFrustum([0.0,8.6,10.0],1.0,frustumConfig),"sphere crossing vertical side plane stays visible")
  c=c+require(not selection.visibleInFrustum([11.5,0.0,10.0],1.0,frustumConfig) and not selection.visibleInFrustum([0.0,8.8,10.0],1.0,frustumConfig),"sphere entirely outside side planes is rejected")
  frustumConfig.verticalFov=90.0
  c=c+require(selection.visibleInFrustum([0.0,9.0,10.0],0.0,frustumConfig),"independent refdef vertical FOV holds the tall view")
  axes=viewer.cameraBasis(camera);c=c+require(selection.viewPointAxes(camera,[40.0,5.0,3.0],axes)==viewer.viewPoint(camera,[40.0,5.0,3.0]),"prepared camera keeps binary32 view transform")
  completeConfig=selection.config(800,600,90.0,1.0,200.0,cache.totalTriangleCount,false,render.DEFAULT_PATCH_ERROR);complete=selection.chooseCached(cache,camera,completeConfig)
  c=c+require(complete.rejectedBudget==0,"complete world capacity never drops visible occluders")
  completeConfig.runtime=[[1.0,0.0,0.0],[0.0,0.0,1.0],[0.0,-1.0,0.0]];rolled=selection.chooseCached(cache,camera,completeConfig)
  c=c+require(rolled.rejectedBudget==0 and len(rolled.faceIndexes)>0,"refdef axes support rolled world selection")
  print("PASS: "+str(c)+" world-surface-selection contracts");return 0
end function
