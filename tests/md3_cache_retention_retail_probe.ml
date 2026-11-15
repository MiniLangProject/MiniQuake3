// SPDX-License-Identifier: GPL-2.0-or-later
// Same productive MD3/lighting kernels and Retail assets, two retention bounds.
import mq3.renderer.qvm_scene_geometry as retentionGeometry
import mq3.renderer.playable_light_grid as retentionLight
import mq3.format.md3 as retentionMd3
import mq3.compat.numeric as retentionNumeric
import std.fs as retentionFs
struct RetentionQuery frame oldframe backlerp origin axis end struct
struct RetentionCounts transforms vertices vectorArrays scalarFloats poseEntries packedPoseBytes end struct
function retentionRequire(ok,text) if not ok then return error(7678,"MD3 retention: "+text) end if;return 1 end function
function retentionCounts(cache)
  entries=0;vertices=0;vectors=0;floats=0;poseEntries=0;packed=0
  for each entry in cache.transforms if entry!=void then entries=entries+1;n=len(entry.positions);vertices=vertices+n;vectors=vectors+2*n+2;floats=floats+6*n;if entry.colors!=void then vectors=vectors+len(entry.colors)+1 end if end if end for
  for each entry in cache.entries if entry!=void then poseEntries=poseEntries+1;if entry.packed!=void then packed=packed+len(entry.packed) end if end if end for
  return RetentionCounts(entries,vertices,vectors,floats,poseEntries,packed)
end function
function retentionSame(a,b)
  if len(a.positions)!=len(b.positions) or len(a.normals)!=len(b.normals) or len(a.colors)!=len(b.colors) then return false end if
  for vertex=0 to len(a.positions)-1 for axis=0 to 2
    if retentionNumeric.floatBits(a.positions[vertex][axis])!=retentionNumeric.floatBits(b.positions[vertex][axis]) or retentionNumeric.floatBits(a.normals[vertex][axis])!=retentionNumeric.floatBits(b.normals[vertex][axis]) then return false end if
  end for end for
  for vertex=0 to len(a.colors)-1 for channel=0 to 3 if a.colors[vertex][channel]!=b.colors[vertex][channel] then return false end if end for end for
  return true
end function
function main(args)
  models=array(len(args),void)
  for modelIndex=0 to len(args)-1 model=retentionMd3.load(retentionFs.readAllBytes(args[modelIndex]));if model is error then return model end if;models[modelIndex]=model end for
  large=retentionGeometry.createFrameCache(void,256);small=retentionGeometry.createFrameCache(large.normalTable,32)
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];lighting=retentionLight.Sample([16.0,32.0,48.0],[80.0,90.0,100.0],[0.0,0.0,1.0],1.0)
  transforms=0;vertexComparisons=0;triangleCount=0;checksumLarge=0.0;checksumSmall=0.0;checked=0;firstLarge=void;firstSmall=void;firstValue=0.0
  for frameIndex=0 to 95
    for modelIndex=0 to len(models)-1
      model=models[modelIndex];frame=frameIndex%model.numFrames;oldFrame=(frame+model.numFrames-1)%model.numFrames;backlerp=(frameIndex%10)*0.1;if frame==oldFrame then backlerp=0.0 end if
      origin=[frameIndex*2.0+modelIndex*100.0,modelIndex*30.0,frameIndex*0.5];axis=identity;if (frameIndex&1)!=0 then axis=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]] end if
      query=RetentionQuery(frame,oldFrame,backlerp,origin,axis)
      for surfaceIndex=0 to len(model.surfaces)-1
        poseLarge=retentionGeometry.cachedFrame(large,modelIndex+1,model,surfaceIndex,frame,oldFrame,backlerp,void);if poseLarge is error then return poseLarge end if
        poseSmall=retentionGeometry.cachedFrame(small,modelIndex+1,model,surfaceIndex,frame,oldFrame,backlerp,void);if poseSmall is error then return poseSmall end if
        a=retentionGeometry.cachedTransform(large,query,modelIndex+1,surfaceIndex,poseLarge);if a is error then return a end if
        b=retentionGeometry.cachedTransform(small,query,modelIndex+1,surfaceIndex,poseSmall);if b is error then return b end if
        retentionGeometry.cachedVertexColors(a,lighting,200);retentionGeometry.cachedVertexColors(b,lighting,200)
        if not retentionSame(a,b) then return error(7678,"32-entry cache changed a Retail position/normal/color") end if
        for vertex=0 to len(a.positions)-1 checksumLarge=checksumLarge+a.positions[vertex][0]+a.normals[vertex][2]+a.colors[vertex][0];checksumSmall=checksumSmall+b.positions[vertex][0]+b.normals[vertex][2]+b.colors[vertex][0] end for
        transforms=transforms+1;vertexComparisons=vertexComparisons+len(a.positions);triangleCount=triangleCount+model.surfaces[surfaceIndex].mesh.numTriangles
        if firstLarge==void then firstLarge=a;firstSmall=b;firstValue=a.positions[0][0] end if
      end for
    end for
  end for
  a=retentionCounts(large);b=retentionCounts(small)
  checked=checked+retentionRequire(transforms==768 and large.transformMisses==768 and small.transformMisses==768,"all six Retail models/eight surfaces emitted for96 moving frames; no geometry omission")
  checked=checked+retentionRequire(checksumLarge==checksumSmall and vertexComparisons==108960 and triangleCount==101952,"all Retail vertices/normals/colors match bit-for-bit and output checksums are identical")
  checked=checked+retentionRequire(a.transforms==256 and b.transforms==32 and a.vertices==b.vertices*8 and a.vectorArrays==b.vectorArrays*8 and a.scalarFloats==b.scalarFloats*8,"32-entry ring retains one eighth of transformed vertex trees")
  checked=checked+retentionRequire(firstLarge.positions[0][0]==firstValue and firstSmall.positions[0][0]==firstValue,"ring eviction never mutates geometry retained by an earlier view")
  checked=checked+retentionRequire(large.maxEntries==256 and small.maxEntries==32 and len(large.transformIndex.links)==256 and len(small.transformIndex.links)==32,"explicit cache API still supports original256 capacity and independent32 configuration")
  print "PASS: "+str(checked)+" Retail MD3 retention contracts models="+str(len(models))+" transforms="+str(transforms)+" vertices="+str(vertexComparisons)+" triangles="+str(triangleCount)+" checksum="+str(checksumLarge)
  print "RETAINED largeEntries="+str(a.transforms)+" smallEntries="+str(b.transforms)+" largeVertices="+str(a.vertices)+" smallVertices="+str(b.vertices)+" largeArrays="+str(a.vectorArrays)+" smallArrays="+str(b.vectorArrays)+" largeFloatScalars="+str(a.scalarFloats)+" smallFloatScalars="+str(b.scalarFloats)+" largePoseBytes="+str(a.packedPoseBytes)+" smallPoseBytes="+str(b.packedPoseBytes)
  return 0
end function
