// SPDX-License-Identifier: GPL-2.0-or-later
// Checked MD3 version 15 asset reader. All offsets are relative to their
// containing header as specified by code/qcommon/qfiles.h.
package mq3.format.md3

import mq3.compat.numeric as n
import mq3.renderer.surface_md3 as md3Mesh

const MD3_IDENT=0x33504449
const MD3_VERSION=15
const HEADER_SIZE=108
const FRAME_SIZE=56
const TAG_SIZE=112
const SURFACE_SIZE=108
const TRIANGLE_SIZE=12
const SHADER_SIZE=68
const ST_SIZE=8
const VERTEX_SIZE=8

const MAX_FRAMES=1024
const MAX_TAGS=256
const MAX_SURFACES=128
const MAX_SHADERS=256
const MAX_VERTS=4096
const MAX_TRIANGLES=8192

struct Frame mins maxs localOrigin radius name end struct
struct Tag name origin axis end struct
struct Surface name shaders mesh end struct
struct Model name flags numFrames numTags numSurfaces numSkins frames tags surfaces bounds end struct
struct RenderTriangle positions texCoords normals surfaceIndex shaderName end struct

function fail(message) return error(7500,"MD3: "+message) end function
function span(offset,size,limit)
  if offset<0 or size<0 or offset>limit or size>limit-offset then return fail("section outside file") end if
  return true
end function
function i32(data,offset)
  value=n.readI32(data,offset);if value is error then return fail("truncated integer") end if;return value
end function
function u16(data,offset)
  if offset<0 or offset+2>len(data) then return fail("truncated word") end if
  return data[offset]|(data[offset+1]<<8)
end function
function f32(data,offset)
  value=n.readU32(data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value)
end function
function vec3(data,offset) return [f32(data,offset),f32(data,offset+4),f32(data,offset+8)] end function
function fixedString(data,offset,capacity)
  check=span(offset,capacity,len(data));if check is error then return check end if
  count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while
  return decode(slice(data,offset,count))
end function

function load(data)
  if data==void or typeof(data)!="bytes" or len(data)<HEADER_SIZE then return fail("truncated header") end if
  if i32(data,0)!=MD3_IDENT then return fail("invalid signature") end if
  if i32(data,4)!=MD3_VERSION then return fail("unsupported version") end if
  name=fixedString(data,8,64);flags=i32(data,72)
  numFrames=i32(data,76);numTags=i32(data,80);numSurfaces=i32(data,84);numSkins=i32(data,88)
  ofsFrames=i32(data,92);ofsTags=i32(data,96);ofsSurfaces=i32(data,100);ofsEnd=i32(data,104)
  if numFrames<1 or numFrames>MAX_FRAMES then return fail("invalid frame count") end if
  if numTags<0 or numTags>MAX_TAGS then return fail("invalid tag count") end if
  // Tag-only *_hand.md3 files are valid MD3 models used by Baseq3 to attach
  // first-person weapons. They intentionally contain no render surfaces.
  if numSurfaces<0 or numSurfaces>MAX_SURFACES then return fail("invalid surface count") end if
  if numSkins<0 or numSkins>MAX_SHADERS then return fail("invalid skin count") end if
  if ofsEnd<HEADER_SIZE or ofsEnd>len(data) then return fail("invalid file end") end if
  if ofsFrames<HEADER_SIZE or ofsTags<ofsFrames+numFrames*FRAME_SIZE or ofsSurfaces<ofsTags+numFrames*numTags*TAG_SIZE then return fail("overlapping model sections") end if
  check=span(ofsFrames,numFrames*FRAME_SIZE,ofsEnd);if check is error then return check end if
  check=span(ofsTags,numFrames*numTags*TAG_SIZE,ofsEnd);if check is error then return check end if
  if numSurfaces>0 then check=span(ofsSurfaces,SURFACE_SIZE,ofsEnd);if check is error then return check end if end if

  frames=array(numFrames,void);boundsMin=[0.0,0.0,0.0];boundsMax=[0.0,0.0,0.0]
  for frameIndex=0 to numFrames-1
    at=ofsFrames+frameIndex*FRAME_SIZE
    mins=vec3(data,at);maxs=vec3(data,at+12);origin=vec3(data,at+24)
    frame=Frame(mins,maxs,origin,f32(data,at+36),fixedString(data,at+40,16));frames[frameIndex]=frame
    if frameIndex==0 then boundsMin=mins;boundsMax=maxs else
      for axis=0 to 2 if mins[axis]<boundsMin[axis] then boundsMin[axis]=mins[axis] end if;if maxs[axis]>boundsMax[axis] then boundsMax[axis]=maxs[axis] end if end for
    end if
  end for

  tags=array(numFrames,void)
  for frameIndex=0 to numFrames-1
    entries=array(numTags,void)
    if numTags>0 then
      for tagIndex=0 to numTags-1
        at=ofsTags+(frameIndex*numTags+tagIndex)*TAG_SIZE;axis=array(3,void)
        for row=0 to 2 axis[row]=vec3(data,at+76+row*12) end for
        entries[tagIndex]=Tag(fixedString(data,at,64),vec3(data,at+64),axis)
      end for
    end if
    tags[frameIndex]=entries
  end for

  surfaces=array(numSurfaces,void);surfaceOffset=ofsSurfaces
  if numSurfaces>0 then for surfaceIndex=0 to numSurfaces-1
    check=span(surfaceOffset,SURFACE_SIZE,ofsEnd);if check is error then return fail("truncated surface header") end if
    if i32(data,surfaceOffset)!=MD3_IDENT then return fail("invalid surface signature") end if
    surfaceName=fixedString(data,surfaceOffset+4,64)
    surfaceFrames=i32(data,surfaceOffset+72);numShaders=i32(data,surfaceOffset+76);numVerts=i32(data,surfaceOffset+80);numTriangles=i32(data,surfaceOffset+84)
    ofsTriangles=i32(data,surfaceOffset+88);ofsShaders=i32(data,surfaceOffset+92);ofsSt=i32(data,surfaceOffset+96);ofsXyz=i32(data,surfaceOffset+100);surfaceEnd=i32(data,surfaceOffset+104)
    if surfaceFrames!=numFrames then return fail("surface frame count mismatch") end if
    if numShaders<0 or numShaders>MAX_SHADERS then return fail("invalid shader count") end if
    if numVerts<1 or numVerts>MAX_VERTS then return fail("invalid vertex count") end if
    if numTriangles<0 or numTriangles>MAX_TRIANGLES then return fail("invalid triangle count") end if
    if surfaceEnd<SURFACE_SIZE or surfaceEnd>ofsEnd-surfaceOffset then return fail("invalid surface end") end if
    if ofsTriangles<SURFACE_SIZE or ofsShaders<SURFACE_SIZE or ofsSt<SURFACE_SIZE or ofsXyz<SURFACE_SIZE then return fail("surface section overlaps header") end if
    check=span(ofsTriangles,numTriangles*TRIANGLE_SIZE,surfaceEnd);if check is error then return check end if
    check=span(ofsShaders,numShaders*SHADER_SIZE,surfaceEnd);if check is error then return check end if
    check=span(ofsSt,numVerts*ST_SIZE,surfaceEnd);if check is error then return check end if
    check=span(ofsXyz,numFrames*numVerts*VERTEX_SIZE,surfaceEnd);if check is error then return check end if
    triangles=array(numTriangles*3,0)
    if numTriangles>0 then
      for triangleIndex=0 to numTriangles-1
        at=surfaceOffset+ofsTriangles+triangleIndex*TRIANGLE_SIZE
        for corner=0 to 2
          index=i32(data,at+corner*4);if index<0 or index>=numVerts then return fail("triangle index outside surface") end if;triangles[triangleIndex*3+corner]=index
        end for
      end for
    end if
    shaders=array(numShaders,void)
    if numShaders>0 then for shaderIndex=0 to numShaders-1 shaders[shaderIndex]=fixedString(data,surfaceOffset+ofsShaders+shaderIndex*SHADER_SIZE,64) end for end if
    texCoords=array(numVerts,void)
    for vertexIndex=0 to numVerts-1 at=surfaceOffset+ofsSt+vertexIndex*ST_SIZE;texCoords[vertexIndex]=[f32(data,at),f32(data,at+4)] end for
    packedFrames=array(numFrames,void)
    for frameIndex=0 to numFrames-1
      packed=array(numVerts,void)
      for vertexIndex=0 to numVerts-1
        at=surfaceOffset+ofsXyz+(frameIndex*numVerts+vertexIndex)*VERTEX_SIZE
        packed[vertexIndex]=md3Mesh.vertex(u16(data,at),u16(data,at+2),u16(data,at+4),u16(data,at+6))
      end for
      packedFrames[frameIndex]=packed
    end for
    surfaces[surfaceIndex]=Surface(surfaceName,shaders,md3Mesh.surface(numFrames,numVerts,numTriangles,triangles,texCoords,packedFrames))
    surfaceOffset=surfaceOffset+surfaceEnd
  end for end if
  if surfaceOffset!=ofsEnd then return fail("surface chain does not reach file end") end if
  return Model(name,flags,numFrames,numTags,numSurfaces,numSkins,frames,tags,surfaces,[boundsMin,boundsMax])
end function

// Produces renderer-neutral animated triangles for the playable preview.
function renderTrianglesCached(model,surfaceIndex,frame,oldFrame,backlerp,maxTriangles,normalTable)
  if model==void or surfaceIndex<0 or surfaceIndex>=len(model.surfaces) then return fail("surface index outside model") end if
  if maxTriangles<0 then return fail("negative triangle limit") end if
  if maxTriangles==0 then return [] end if
  surface=model.surfaces[surfaceIndex];if surface.mesh.numTriangles==0 then return [] end if
  lerped=md3Mesh.lerpVertexesCached(surface.mesh,frame,oldFrame,backlerp,normalTable);if lerped is error then return lerped end if
  limit=surface.mesh.numTriangles;if limit>maxTriangles then limit=maxTriangles end if
  result=array(limit,void)
  if limit==0 then return result end if
  shaderName="";if len(surface.shaders)>0 then shaderName=surface.shaders[0] end if
  for triangleIndex=0 to limit-1
    positions=array(3,void);coords=array(3,void);normals=array(3,void)
    for corner=0 to 2
      index=surface.mesh.triangles[triangleIndex*3+corner];positions[corner]=lerped[0][index];coords[corner]=surface.mesh.texCoords[index];normals[corner]=lerped[1][index]
    end for
    result[triangleIndex]=RenderTriangle(positions,coords,normals,surfaceIndex,shaderName)
  end for
  return result
end function
function renderTriangles(model,surfaceIndex,frame,oldFrame,backlerp,maxTriangles) return renderTrianglesCached(model,surfaceIndex,frame,oldFrame,backlerp,maxTriangles,void) end function
