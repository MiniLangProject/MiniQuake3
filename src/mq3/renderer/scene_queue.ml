// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// RE_ClearScene and scene submission primitives from tr_scene.c.
package mq3.renderer.scene_queue
import std.array as arrays
import mq3.compat.numeric as n

const MAX_DLIGHTS=32
const ENTITYNUM_WORLD=1022
const RT_MAX_REF_ENTITY_TYPE=8
const GLHW_RIVA128=2
const GLHW_RAGEPRO=3
const GLHW_PERMEDIA2=4

struct PolyVert xyz st modulate end struct
struct Poly hShader verts fogIndex end struct
struct RefEntity reType payload lightingCalculated end struct
struct DecodedRefEntity reType renderfx hModel lightingOrigin shadowPlane axis nonNormalizedAxes origin frame oldorigin oldframe backlerp skinNum customSkin customShader shaderRGBA shaderTexCoord shaderTime radius rotation end struct
struct DLight origin radius color additive end struct
struct View entities dlights polys end struct
struct State registered hardwareType worldLoaded fogBounds maxPolys maxPolyVerts entities dlights polys numPolyVerts firstSceneEntity firstSceneDlight firstScenePoly diagnosticFn context end struct

function create(maxPolys,maxPolyVerts)
  if maxPolys<0 or maxPolyVerts<0 then return error(3470,"scene queue: negative capacity") end if
  return State(false,0,false,[],maxPolys,maxPolyVerts,[],[],[],0,0,0,0,void,void)
end function
function diagnostic(state,text) if state.diagnosticFn!=void then context=state.context;state.diagnosticFn(context,text) end if;return void end function
function vector3(value,label) if value==void or len(value)!=3 then return error(3471,"scene queue: invalid "+label) end if;return [value[0],value[1],value[2]] end function
function color4(value) if value==void or len(value)!=4 then return error(3471,"scene queue: invalid vertex color") end if;return [value[0],value[1],value[2],value[3]] end function
function tex2(value) if value==void or len(value)!=2 then return error(3471,"scene queue: invalid texture coordinate") end if;return [value[0],value[1]] end function
function vertex(value) return PolyVert(vector3(value.xyz,"vertex"),tex2(value.st),color4(value.modulate)) end function

function toggleFrame(state)
  state.entities=[];state.dlights=[];state.polys=[];state.numPolyVerts=0
  state.firstSceneEntity=0;state.firstSceneDlight=0;state.firstScenePoly=0;return void
end function
function clearScene(state)
  state.firstSceneDlight=len(state.dlights);state.firstSceneEntity=len(state.entities);state.firstScenePoly=len(state.polys);return void
end function

function fogForVertices(state,vertices)
  if not state.worldLoaded or len(state.fogBounds)<=1 then return 0 end if
  mins=vector3(vertices[0].xyz,"vertex");maxs=[mins[0],mins[1],mins[2]]
  if len(vertices)>1 then for index=1 to len(vertices)-1 for axis=0 to 2 if vertices[index].xyz[axis]<mins[axis] then mins[axis]=vertices[index].xyz[axis] end if;if vertices[index].xyz[axis]>maxs[axis] then maxs[axis]=vertices[index].xyz[axis] end if end for end for end if
  for index=1 to len(state.fogBounds)-1
    fog=state.fogBounds[index]
    if maxs[0]>=fog[0][0] and maxs[1]>=fog[0][1] and maxs[2]>=fog[0][2] and mins[0]<=fog[1][0] and mins[1]<=fog[1][1] and mins[2]<=fog[1][2] then return index end if
  end for
  return 0
end function

function addPolys(state,hShader,numVerts,vertices,numPolys)
  if not state.registered then return 0 end if
  if hShader==0 then diagnostic(state,"NULL poly shader");return 0 end if
  if numVerts<=0 or numPolys<0 or len(vertices)<numVerts*numPolys then return error(3471,"scene queue: invalid polygon input") end if
  added=0
  for polyIndex=0 to numPolys-1
    if state.numPolyVerts+numVerts>state.maxPolyVerts or len(state.polys)>=state.maxPolys then diagnostic(state,"poly capacity reached");return added end if
    copied=[]
    for index=0 to numVerts-1 copied=copied+[vertex(vertices[polyIndex*numVerts+index])] end for
    if state.hardwareType==GLHW_RAGEPRO then copied[0].modulate=[255,255,255,255] end if
    fog=fogForVertices(state,copied);state.polys=state.polys+[Poly(hShader,copied,fog)];state.numPolyVerts=state.numPolyVerts+numVerts;added=added+1
  end for
  return added
end function

function addEntity(state,reType,payload)
  if not state.registered then return false end if
  if len(state.entities)>=ENTITYNUM_WORLD then return false end if
  if reType<0 or reType>=RT_MAX_REF_ENTITY_TYPE then return error(3471,"scene queue: bad reType "+str(reType)) end if
  state.entities=state.entities+[RefEntity(reType,payload,false)];return true
end function

// QVM refEntity_t is a fixed 140-byte 32-bit ABI record from tr_types.h.
function payloadVector(payload,offset)
  return [n.bitsFloat(n.readI32(payload,offset)),n.bitsFloat(n.readI32(payload,offset+4)),n.bitsFloat(n.readI32(payload,offset+8))]
end function
function decodeEntity(value)
  if value==void or typeof(value.payload)!="bytes" or len(value.payload)!=140 then return error(3471,"scene queue: invalid refEntity payload") end if
  data=value.payload;axes=[]
  for row=0 to 2 axes=axes+[payloadVector(data,28+row*12)] end for
  return DecodedRefEntity(value.reType,n.readI32(data,4),n.readI32(data,8),payloadVector(data,12),n.bitsFloat(n.readI32(data,24)),axes,n.readI32(data,64)!=0,payloadVector(data,68),n.readI32(data,80),payloadVector(data,84),n.readI32(data,96),n.bitsFloat(n.readI32(data,100)),n.readI32(data,104),n.readI32(data,108),n.readI32(data,112),[data[116],data[117],data[118],data[119]],[n.bitsFloat(n.readI32(data,120)),n.bitsFloat(n.readI32(data,124))],n.bitsFloat(n.readI32(data,128)),n.bitsFloat(n.readI32(data,132)),n.bitsFloat(n.readI32(data,136)))
end function

function addDynamicLight(state,origin,intensity,r,g,b,additive)
  if not state.registered or len(state.dlights)>=MAX_DLIGHTS or intensity<=0 then return false end if
  if state.hardwareType==GLHW_RIVA128 or state.hardwareType==GLHW_PERMEDIA2 then return false end if
  state.dlights=state.dlights+[DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive)];return true
end function
function addLight(state,origin,intensity,r,g,b) return addDynamicLight(state,origin,intensity,r,g,b,false) end function
function addAdditiveLight(state,origin,intensity,r,g,b) return addDynamicLight(state,origin,intensity,r,g,b,true) end function

function sceneEntities(state) return arrays.slice(state.entities,state.firstSceneEntity,len(state.entities)-state.firstSceneEntity) end function
function sceneLights(state) return arrays.slice(state.dlights,state.firstSceneDlight,len(state.dlights)-state.firstSceneDlight) end function
function scenePolys(state) return arrays.slice(state.polys,state.firstScenePoly,len(state.polys)-state.firstScenePoly) end function
function finishScene(state)
  value=View(sceneEntities(state),sceneLights(state),scenePolys(state))
  state.firstSceneEntity=len(state.entities);state.firstSceneDlight=len(state.dlights);state.firstScenePoly=len(state.polys);return value
end function
