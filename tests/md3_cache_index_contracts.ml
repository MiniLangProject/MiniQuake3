// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.renderer.md3_cache_index as cacheIndex
import mq3.renderer.qvm_scene_geometry as cacheGeometry
import mq3.renderer.surface_md3 as cacheMesh
import mq3.format.md3 as cacheModel
import mq3.compat.numeric as cacheNumeric
struct Query frame oldframe backlerp origin axis end struct
function cacheRequire(ok,text) if not ok then return error(7677,"MD3 cache index: "+text) end if;return 1 end function
function main(args)
  checked=0;index=cacheIndex.create(2);cacheIndex.store(index,0,0);cacheIndex.store(index,1,4)
  checked=checked+cacheRequire(cacheIndex.first(index,0)==1 and cacheIndex.next(index,1)==0,"colliding hashes keep both full-key candidate slots")
  cacheIndex.store(index,0,8);checked=checked+cacheRequire(cacheIndex.first(index,0)==0 and cacheIndex.next(index,0)==1 and cacheIndex.next(index,1)== -1,"tail eviction before same-bucket insertion keeps finite chain")
  cacheIndex.store(index,0,1);checked=checked+cacheRequire(cacheIndex.first(index,0)==1 and cacheIndex.next(index,1)== -1 and cacheIndex.first(index,1)==0,"head eviction removes stale old-bucket membership")
  cacheIndex.store(index,1,5);checked=checked+cacheRequire(cacheIndex.first(index,1)==1 and cacheIndex.next(index,1)==0,"evicted slots rejoin collision chains exactly once")
  checked=checked+cacheRequire(cacheIndex.floatKey(-0.0)==cacheIndex.floatKey(0.0),"numeric-equal signed zeros share bucket")
  vertices=[cacheMesh.vertex(64,0,0,0),cacheMesh.vertex(0,64,0,0),cacheMesh.vertex(0,0,64,0)]
  surface=cacheModel.Surface("unit",[],cacheMesh.surface(1,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[vertices]))
  frame=cacheModel.Frame([-1.0,-1.0,-1.0],[1.0,1.0,1.0],[0.0,0.0,0.0],2.0,"frame0")
  model=cacheModel.Model("unit",0,1,0,1,0,[frame],[[]],[surface],[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]])
  cache=cacheGeometry.createFrameCache(void,256);pose=cacheGeometry.cachedFrame(cache,4,model,0,0,0,0.0,void)
  reference=array(256,-1);referenceNext=0;referenceCount=0;referenceVisits=0;misses=0;hits=0;previousQuery=0;correct=true
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  for step=1 to 3000
    query=(step*17)%768;if step%7==0 then query=previousQuery end if;previousQuery=query
    found=false;if referenceCount>0 then for slot=0 to referenceCount-1 referenceVisits=referenceVisits+1;if reference[slot]==query then found=true;break end if end for end if
    if found then hits=hits+1 else misses=misses+1;reference[referenceNext]=query;referenceNext=(referenceNext+1)%256;if referenceCount<256 then referenceCount=referenceCount+1 end if end if
    origin=[query*1.0,(query%13)*1.0,0.0];axis=identity;if query%3==0 then axis=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]] end if
    decoded=Query(0,0,0.0,origin,axis);entry=cacheGeometry.cachedTransform(cache,decoded,4,0,pose)
    if entry is error then return entry end if
    if step%41==0 then baseline=cacheGeometry.cachedTransform(void,decoded,4,0,pose);if baseline is error then return baseline end if;if baseline.positions!=entry.positions or baseline.normals!=entry.normals then correct=false end if end if
  end for
  checked=checked+cacheRequire(correct and cache.transformHits==hits and cache.transformMisses==misses and cache.transformCount==256,"3000 moving poses match linear FIFO hits/evictions and uncached exact transforms")
  checked=checked+cacheRequire(cache.transformLookupSteps<referenceVisits/20,"moving misses visit hash candidates rather than every historical pose")
  checked=checked+cacheRequire(len(cache.transformIndex.heads)==512 and len(cache.transformIndex.links)==256 and len(cache.transformIndex.hashes)==256,"index storage is fixed independently of movement duration")
  before=cache.hits;for repeat=1 to 10 cacheGeometry.cachedFrame(cache,4,model,0,0,0,-0.0,void) end for
  checked=checked+cacheRequire(cache.hits==before+10 and cache.entryCount==1,"signed-zero frame queries preserve existing pose cache semantics")
  decoded=Query(0,0,0.0,[9000.0,0.0,0.0],identity);original=cacheGeometry.cachedTransform(cache,decoded,4,0,pose);decoded.origin[0]=9001.0;new=cacheGeometry.cachedTransform(cache,decoded,4,0,pose)
  checked=checked+cacheRequire(original.origin[0]==9000.0 and original.positions[0][0]==9001.0 and new.positions[0][0]==9002.0,"caller mutation cannot alter a stored transform key or make stale geometry hit")
  decoded.origin[0]=9000.0;again=cacheGeometry.cachedTransform(cache,decoded,4,0,pose)
  checked=checked+cacheRequire(again.positions==original.positions,"original immutable transform key remains queryable after caller moves")
  // Distinct double keys may hash to the same binary32 bits. The full key
  // still decides equality, not the hash, even on completely equal geometry.
  collisionCache=cacheGeometry.createFrameCache(void,2)
  left=cacheGeometry.cachedFrame(collisionCache,4,model,0,0,0,0.1,void);right=cacheGeometry.cachedFrame(collisionCache,4,model,0,0,0,0.10000000001,void)
  checked=checked+cacheRequire(collisionCache.misses==2 and left.backlerp==0.1 and right.backlerp==0.10000000001 and cacheIndex.frameHash(4,0,0,0,0.1)==cacheIndex.frameHash(4,0,0,0,0.10000000001),"binary32 hash collisions preserve distinct complete interpolation keys")
  frameCache=cacheGeometry.createFrameCache(void,16);reference=array(16,-1);referenceNext=0;referenceCount=0;expectedHits=0;expectedMisses=0;previousQuery=0;frameCorrect=true
  for step=1 to 1000
    query=(step*17)%48;if step%7==0 then query=previousQuery end if;previousQuery=query
    found=false;if referenceCount>0 then for slot=0 to referenceCount-1 if reference[slot]==query then found=true;break end if end for end if
    if found then expectedHits=expectedHits+1 else expectedMisses=expectedMisses+1;reference[referenceNext]=query;referenceNext=(referenceNext+1)%16;if referenceCount<16 then referenceCount=referenceCount+1 end if end if
    frameEntry=cacheGeometry.cachedFrame(frameCache,query,model,0,0,0,0.0,void);if frameEntry is error then return frameEntry end if;if frameEntry.modelHandle!=query then frameCorrect=false end if
  end for
  checked=checked+cacheRequire(frameCorrect and frameCache.hits==expectedHits and frameCache.misses==expectedMisses and frameCache.entryCount==16,"1000 colliding pose keys preserve complete identity and FIFO eviction semantics")
  print "PASS: "+str(checked)+" MD3 cache index contracts lookupSteps="+str(cache.transformLookupSteps)+" linearSteps="+str(referenceVisits)+" hits="+str(hits)+" misses="+str(misses)
  return 0
end function
