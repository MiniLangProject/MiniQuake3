// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.bsp_render_data as render
import mq3.client.playable_viewer as viewer
import mq3.format.bsp as bsp
import std.fs as fs
import std.time as time
function same(a,b)
  return selection.sameFaces(a.faceIndexes,b.faceIndexes) and a.candidateCount==b.candidateCount and a.selectedSurfaceCount==b.selectedSurfaceCount and a.estimatedTriangleCount==b.estimatedTriangleCount and a.pvsUsed==b.pvsUsed and a.cameraLeaf==b.cameraLeaf and a.cameraCluster==b.cameraCluster and a.rejectedPvs==b.rejectedPvs and a.rejectedFrustum==b.rejectedFrustum and a.rejectedBackface==b.rejectedBackface and a.rejectedDistance==b.rejectedDistance and a.rejectedBudget==b.rejectedBudget
end function
function main(args)
  map=bsp.load(fs.readAllBytes(args[0]));cache=selection.buildCache(map,render.DEFAULT_PATCH_ERROR);if cache is error then return cache end if
  cfg=selection.defaults(1280,720);cfg.triangleBudget=cache.totalTriangleCount;nativeFaces=cache.nativeFaces;flags=array(map.counts[1],false)
  for index=0 to len(flags)-1 flags[index]=index%5==0 end for;selection.setTwoSidedTextures(cache,flags)
  count=0;positions=[[216.0,1328.0,64.0],[0.0,0.0,0.0],[100.0,-100.0,200.0],[600.0,700.0,100.0],[-800.0,-400.0,48.0],[2500.0,2500.0,800.0],[-40.0,1200.0,100.0],[800.0,1400.0,-100.0]]
  fast=void;reference=void;held=void;heldFaces=void
  for profile=0 to 2
    cfg.backfaceCull=profile!=1;cfg.farDistance=8192.0;if profile==2 then cfg.farDistance=512.0 end if
    for each position in positions for angle=0 to 15
      camera=viewer.camera(position,angle*22.5,(angle%5-2)*15.0,0.0,0.0)
      fast=selection.chooseCached(cache,camera,cfg);if fast is error then return fast end if
      if held==void then held=fast;heldFaces=array(len(fast.faceIndexes),0);if len(heldFaces)>0 then copyArray(heldFaces,0,fast.faceIndexes,0,len(heldFaces)) end if end if
      cache.nativeFaces=void;reference=selection.chooseCached(cache,camera,cfg);cache.nativeFaces=nativeFaces;if reference is error then return reference end if
      if not same(fast,reference) then
        print "fast candidates="+str(fast.candidateCount)+" selected="+str(fast.selectedSurfaceCount)+" triangles="+str(fast.estimatedTriangleCount)+" frustum="+str(fast.rejectedFrustum)+" back="+str(fast.rejectedBackface)+" distance="+str(fast.rejectedDistance)
        print "ref candidates="+str(reference.candidateCount)+" selected="+str(reference.selectedSurfaceCount)+" triangles="+str(reference.estimatedTriangleCount)+" frustum="+str(reference.rejectedFrustum)+" back="+str(reference.rejectedBackface)+" distance="+str(reference.rejectedDistance)
        print "fast faces="+str(fast.faceIndexes);print "reference faces="+str(reference.faceIndexes)
        return error(7491,"native world filter changed selection at case "+str(count))
      end if
      count=count+1
    end for end for
  end for
  if not selection.sameFaces(held.faceIndexes,heldFaces) then return error(7491,"native selection mutated an older returned face array") end if
  if nativeBytesPtr(cache.nativeOutput)==nativeBytesPtr(cache.nativePrevious) then return error(7491,"native selection comparison/output storage aliases") end if
  cfg.backfaceCull=true;cfg.farDistance=8192.0;camera=viewer.camera(positions[0],45.0,0.0,0.0,0.0);frames=200
  started=time.ticks();for frame=0 to frames-1 fast=selection.chooseCached(cache,camera,cfg) end for;nativeMs=time.ticks()-started
  cache.nativeFaces=void;started=time.ticks();for frame=0 to frames-1 reference=selection.chooseCached(cache,camera,cfg) end for;managedMs=time.ticks()-started;cache.nativeFaces=nativeFaces
  if not same(fast,reference) then return error(7491,"native retained selection changed") end if
  print "PASS: "+str(count)+" native world-selection differential cases; frames="+str(frames)+" native_ms="+str(nativeMs)+" managed_ms="+str(managedMs);return 0
end function
