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

function main(args)
  c=0;map=fixture();camera=viewer.camera([10.0,0.0,0.0],0.0,0.0,0.0,0.0)
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
  cachedChoice=selection.chooseCached(cache,camera,cfg)
  c=c+require(cachedChoice.faceIndexes==[1,0],"cached camera selection matches direct selection")
  cached=selection.prepareCached(cache,camera,cfg)
  c=c+require(cached.renderData.triangles[0].faceIndex==cache.trianglesByFace[1][0].faceIndex,"cached face geometry reused")
  c=c+require(len(cached.renderData.triangles)==2 and cached.renderData.triangles[1].faceIndex==0,"cached render stream follows priority")
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
  print("PASS: "+str(c)+" world-surface-selection contracts");return 0
end function
