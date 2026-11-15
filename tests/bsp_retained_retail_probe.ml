// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.tests.frozen_bsp_render_data as retainedFrozen
import mq3.renderer.bsp_render_data as retainedRender
import mq3.renderer.world_surface_selection as retainedWorld
import mq3.compat.numeric as retainedNumeric
import mq3.format.bsp as retainedBsp
import std.fs as retainedFs
import std.string as retainedStrings
struct RetainedStats maps faces patches triangles comparisons oldRefs uniqueVertices malformed end struct
function retainedCheck(ok,text) if not ok then return error(7417,"retained BSP: "+text) end if;return 1 end function
function putI(data,offset,value) return retainedNumeric.writeU32(data,offset,value) end function
function putF(data,offset,value) return retainedNumeric.writeU32(data,offset,retainedNumeric.floatBits(value)) end function
function fixture()
  data=bytes(51000,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[1]=0;counts[1]=2;lengths[1]=144
  firstName=bytes("textures/zero");for i=0 to len(firstName)-1 data[i]=firstName[i] end for;secondName=bytes("textures/one");for i=0 to len(secondName)-1 data[72+i]=secondName[i] end for;putI(data,136,0x20000)
  offsets[10]=160;counts[10]=14;lengths[10]=616
  positions=[[0.0,0.0,0.0],[2.0,0.0,0.0],[2.0,2.0,0.0],[0.0,2.0,0.0],[0.0,0.0,3.0],[0.0,0.0,0.0],[1.0,0.0,0.0],[2.0,0.0,0.0],[0.0,1.0,0.0],[1.0,1.0,32.0],[2.0,1.0,0.0],[0.0,2.0,0.0],[1.0,2.0,0.0],[2.0,2.0,0.0]]
  for i=0 to 13
    off=160+i*44
    for axis=0 to 2 putF(data,off+axis*4,positions[i][axis]) end for
    putF(data,off+12,i+0.125);putF(data,off+16,i+0.25);putF(data,off+20,i+0.5);putF(data,off+24,i+0.75)
    putF(data,off+28,0.0);putF(data,off+32,0.0);putF(data,off+36,1.0)
    data[off+40]=10+i;data[off+41]=20+i;data[off+42]=30+i;data[off+43]=40+i
  end for
  offsets[11]=800;counts[11]=9;lengths[11]=36
  mesh=[0,1,2,0,2,3,0,1,4];for i=0 to 8 putI(data,800+i*4,mesh[i]) end for
  offsets[13]=900;counts[13]=3;lengths[13]=312
  putI(data,900,1);putI(data,900+8,1);putI(data,900+12,0);putI(data,900+16,4);putI(data,900+20,0);putI(data,900+24,6);putI(data,900+28,0)
  putI(data,1004,0);putI(data,1004+8,3);putI(data,1004+12,0);putI(data,1004+16,5);putI(data,1004+20,6);putI(data,1004+24,3);putI(data,1004+28,0xffffffff)
  putI(data,1108,0);putI(data,1108+8,2);putI(data,1108+12,5);putI(data,1108+16,9);putI(data,1108+20,0);putI(data,1108+24,0);putI(data,1108+28,0);putI(data,1108+96,3);putI(data,1108+100,3)
  offsets[14]=1300;counts[14]=1;lengths[14]=49152
  data[1300]=1;data[1301]=2;data[1302]=3;data[1300+49149]=251;data[1300+49150]=252;data[1300+49151]=253
  offsets[7]=50500;counts[7]=1;lengths[7]=40;putF(data,50500,-8.0);putF(data,50504,-4.0);putF(data,50508,-2.0);putF(data,50512,8.0);putF(data,50516,4.0);putF(data,50520,2.0);putI(data,50500+24,0);putI(data,50500+28,2)
  return retainedBsp.BSP(data,offsets,lengths,counts)
end function

function retainedArray(a,b,floatValues)
  if len(a)!=len(b) then return false end if
  if len(a)>0 then for index=0 to len(a)-1
    if floatValues and retainedNumeric.floatBits(a[index])!=retainedNumeric.floatBits(b[index]) then return false end if
    if not floatValues and a[index]!=b[index] then return false end if
  end for end if;return true
end function
function retainedVertex(a,b)
  return retainedArray(a.position,b.position,true) and retainedArray(a.baseUV,b.baseUV,true) and retainedArray(a.lightmapUV,b.lightmapUV,true) and retainedArray(a.normal,b.normal,true) and retainedArray(a.color,b.color,false) and retainedArray(a.entityColor,b.entityColor,false) and retainedArray(a.entityTexCoord,b.entityTexCoord,true) and retainedNumeric.floatBits(a.shaderTime)==retainedNumeric.floatBits(b.shaderTime) and a.sourceIndex==b.sourceIndex
end function
function retainedEqual(a,b)
  if a.surfaceCount!=b.surfaceCount or a.triangleCount!=b.triangleCount or a.skippedSurfaceCount!=b.skippedSurfaceCount or a.truncated!=b.truncated or a.patchSurfaceCount!=b.patchSurfaceCount or len(a.triangles)!=len(b.triangles) then return false end if
  for each pair in [[a.triangles,b.triangles]]
    if len(pair[0])>0 then for index=0 to len(pair[0])-1
      x=pair[0][index];y=pair[1][index]
      if x.textureIndex!=y.textureIndex or x.lightmapIndex!=y.lightmapIndex or x.fogIndex!=y.fogIndex or x.faceIndex!=y.faceIndex or x.triangleIndex!=y.triangleIndex or len(x.vertices)!=3 or len(y.vertices)!=3 then return false end if
      for corner=0 to 2 if not retainedVertex(x.vertices[corner],y.vertices[corner]) then return false end if end for
    end for end if
  end for;return true
end function
// Test-only marker traversal proves actual shared object identity. Restore all
// markers immediately; no application consumer may mutate retained vertices.
function retainedObjectCount(triangles)
  count=0
  for each triangle in triangles for each vertex in triangle.vertices if vertex.sourceIndex>=0 then vertex.sourceIndex=0-vertex.sourceIndex-2;count=count+1 end if end for end for
  for each triangle in triangles for each vertex in triangle.vertices if vertex.sourceIndex< -1 then vertex.sourceIndex=0-vertex.sourceIndex-2 end if end for end for
  return count
end function
function retainedBad(map,faces,budget)
  a=try(retainedFrozen.extractWithPatchError(map,faces,budget,4.0));b=try(retainedRender.extractWithPatchError(map,faces,budget,4.0));c=try(retainedRender.extractRetainedWithPatchError(map,faces,budget,4.0))
  if not(a is error) or not(b is error) or not(c is error) then return error(7417,"malformed tail hidden by triangle budget") end if
  if a.message!=b.message or a.message!=c.message then return error(7417,"malformed validation diagnostics changed") end if
  return 1
end function
function retainedFixtureTests()
  checked=0;map=fixture();old=retainedFrozen.extract(map,[0,1,2],1000);plain=retainedRender.extract(map,[0,1,2],1000);shared=retainedRender.extractRetainedWithPatchError(map,[0,1,2],1000,4.0)
  checked=checked+retainedCheck(retainedEqual(old,plain) and retainedEqual(old,shared),"planar/soup/curvedpatch full vertex fields match frozen extractor")
  plain.triangles[0].vertices[0].position[0]=99.0;old.triangles[0].vertices[0].position[0]=99.0
  checked=checked+retainedCheck(plain.triangles[1].vertices[0].position[0]==0.0 and old.triangles[1].vertices[0].position[0]==0.0,"public current and frozen extraction preserve independent mutable corners")
  shared.triangles[0].vertices[0].position[0]=99.0
  checked=checked+retainedCheck(shared.triangles[1].vertices[0].position[0]==99.0 and shared.triangles[2].vertices[0].position[0]==0.0,"private sharing is per face, never across faces referencing same source index")
  shared.triangles[0].vertices[0].position[0]=0.0
  checked=checked+retainedCheck(retainedObjectCount([shared.triangles[0],shared.triangles[1],shared.triangles[2]])==7 and retainedObjectCount([plain.triangles[0],plain.triangles[1],plain.triangles[2]])==9,"private planar/soup objects deduplicate only within each face")
  for each budget in [0,1,2,3,1000]
    a=retainedFrozen.extract(map,[1,0,1,2],budget);b=retainedRender.extract(map,[1,0,1,2],budget);c=retainedRender.extractRetainedWithPatchError(map,[1,0,1,2],budget,4.0)
    checked=checked+retainedCheck(retainedEqual(a,b) and retainedEqual(a,c),"caller order/duplicates and zero/small/full budgets unchanged")
  end for
  for each budget in [0,1,2,1000]
    bad=fixture();putI(bad.data,820,4);checked=checked+retainedBad(bad,[0],budget)
    bad=fixture();putI(bad.data,1024,9);checked=checked+retainedBad(bad,[0,1],budget)
    bad=fixture();bad.offsets[10]=50980;checked=checked+retainedBad(bad,[0],budget)
    bad=fixture();putI(bad.data,1204,4);checked=checked+retainedBad(bad,[0,2],budget)
  end for
  return checked
end function
function main(args)
  checked=retainedFixtureTests();if checked is error then return checked end if
  stats=RetainedStats(0,0,0,0,0,0,0,16)
  for each path in retainedStrings.split(retainedFs.readAllText(args[0]),"\n")
    if path=="" then continue end if;map=retainedBsp.load(retainedFs.readAllBytes(path));if map is error then return map end if
    stats.maps=stats.maps+1
    for face=0 to map.counts[13]-1
      for each budget in [0,1,1000000]
        old=retainedFrozen.extractWithPatchError(map,[face],budget,4.0);if old is error then return old end if
        plain=retainedRender.extractWithPatchError(map,[face],budget,4.0);if plain is error then return plain end if
        shared=retainedRender.extractRetainedWithPatchError(map,[face],budget,4.0);if shared is error then return shared end if
        if not retainedEqual(old,plain) or not retainedEqual(old,shared) then return error(7417,"Retail field/order/budget mismatch "+path+" face="+str(face)+" budget="+str(budget)) end if
        stats.comparisons=stats.comparisons+1
        if budget==1000000 then
          stats.faces=stats.faces+1;stats.triangles=stats.triangles+old.triangleCount;stats.patches=stats.patches+old.patchSurfaceCount
          kind=retainedNumeric.readI32(map.data,map.offsets[13]+face*104+8)
          if kind==1 or kind==3 then stats.oldRefs=stats.oldRefs+retainedObjectCount(old.triangles);stats.uniqueVertices=stats.uniqueVertices+retainedObjectCount(shared.triangles) end if
        end if
      end for
    end for
    if retainedStrings.endsWith(path,"q3dm1.bsp") then
      cache=retainedWorld.buildCache(map,4.0);if cache is error then return cache end if;refs=0;unique=0
      for face=0 to map.counts[13]-1
        kind=cache.faceKinds[face]
        if kind==1 or kind==3 then refs=refs+len(cache.trianglesByFace[face])*3;unique=unique+retainedObjectCount(cache.trianglesByFace[face]) end if
      end for
      checked=checked+retainedCheck(refs==24225 and unique==12061,"actual productive q3dm1 world cache drops12164 duplicated RenderVertex objects and85148 attribute arrays")
      print "Q3DM1 references="+str(refs)+" uniqueObjects="+str(unique)+" removedVertices="+str(refs-unique)+" removedAttributeArrays="+str((refs-unique)*7)
    end if
  end for
  print "PASS: retained BSP checks="+str(checked)+" maps="+str(stats.maps)+" faces="+str(stats.faces)+" patches="+str(stats.patches)+" triangles="+str(stats.triangles)+" comparisons="+str(stats.comparisons)+" planarSoupCorners="+str(stats.oldRefs)+" planarSoupObjects="+str(stats.uniqueVertices)+" malformedBudgetCases="+str(stats.malformed)+" publicAliasesPreserved=true privateFaceSharing=true"
  return 0
end function
