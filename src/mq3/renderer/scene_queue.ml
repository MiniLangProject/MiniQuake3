// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// RE_ClearScene and scene submission primitives from tr_scene.c.
package mq3.renderer.scene_queue
import std.array as arrays
import std.ds.list as lists
import mq3.compat.numeric as n
import mq3.renderer.tr_types as trtypes

/// Maximum number of dynamic lights represented by the renderer's light bit masks.
const MAX_DLIGHTS=trtypes.MAX_DLIGHTS
/// Reserved entity number identifying static world geometry.
const ENTITYNUM_WORLD=1022
/// Exclusive upper bound of valid renderer entity types; not a drawable entity kind.
const RT_MAX_REF_ENTITY_TYPE=trtypes.RT_MAX_REF_ENTITY_TYPE
/// Hardware category selecting RIVA 128 alpha-interpolation workarounds.
const GLHW_RIVA128=trtypes.GLHW_RIVA128
/// Hardware category selecting Rage Pro alpha-texture workarounds.
const GLHW_RAGEPRO=trtypes.GLHW_RAGEPRO
/// Hardware category selecting Permedia2 blending workarounds.
const GLHW_PERMEDIA2=trtypes.GLHW_PERMEDIA2

/// Data record for `mq3.renderer.scene_queue.PolyVert`; groups `xyz`, `st`, `modulate`.
struct PolyVert
  /// Three-dimensional position of this vertex.
  xyz
  /// Two-dimensional texture coordinates associated with the vertex.
  st
  /// Per-vertex RGBA color bytes that modulate the sampled texture.
  modulate
end struct
/// Data record for `mq3.renderer.scene_queue.Poly`; groups `hShader`, `verts`, `fogIndex`.
struct Poly
  /// Registered shader handle used to draw the polygon.
  hShader
  /// Submitted polygon vertices retained until the queued scene is rendered.
  verts
  /// Index of the fog volume affecting the surface or primitive.
  fogIndex
end struct
/// Data record for `mq3.renderer.scene_queue.RefEntity`; groups `reType`, `payload`, `lightingCalculated`.
struct RefEntity
  /// Renderer entity type selecting the model, sprite, beam, or portal path.
  reType
  /// Operation-specific data interpreted according to the record's command or event type.
  payload
  /// Whether entity lighting has already been computed for this frame.
  lightingCalculated
end struct
/// Data record for `mq3.renderer.scene_queue.DecodedRefEntity`; groups `reType`, `renderfx`, `hModel`, `lightingOrigin`, `shadowPlane`, `axis`, and 14 further fields.
struct DecodedRefEntity
  /// Renderer entity type selecting the model, sprite, beam, or portal path.
  reType
  /// Bit mask of entity rendering options, such as depth hack or shadow suppression.
  renderfx
  /// Registered model handle used to obtain the entity's geometry.
  hModel
  /// Alternate position used to give multipart models consistent lighting.
  lightingOrigin
  /// Plane height onto which projection shadows are placed.
  shadowPlane
  /// Entity basis decoded from the VM record, including scaling when non-normalized axes are permitted.
  axis
  /// Whether the orientation basis also contains scaling.
  nonNormalizedAxes
  /// World-space placement read from the submitted entity's VM renderer record.
  origin
  /// Current model animation-frame index.
  frame
  /// Previous entity position used by interpolation or beam geometry.
  oldorigin
  /// Previous animation frame used for interpolation.
  oldframe
  /// Interpolation weight of the previous frame: zero selects current, one selects previous.
  backlerp
  /// Model skin index selected for this entity.
  skinNum
  /// Explicit skin handle overriding the model's default skin.
  customSkin
  /// Shader handle overriding the entity's normal surface shaders.
  customShader
  /// Entity RGBA color bytes used by entity-driven shader generators.
  shaderRGBA
  /// Entity texture-coordinate offset used by entity-driven texture modifiers.
  shaderTexCoord
  /// Time offset in seconds subtracted from the view time for entity shader effects.
  shaderTime
  /// Radius used for the light, sprite, beam, or bounded object.
  radius
  /// Sprite rotation angle in degrees.
  rotation
end struct
/// Data record for `mq3.renderer.scene_queue.DLight`; groups `origin`, `radius`, `color`, `additive`.
struct DLight
  /// World-space center of a dynamic light submitted to the scene queue.
  origin
  /// Radius used for the light, sprite, beam, or bounded object.
  radius
  /// RGB contribution requested for a dynamic light added to the scene queue.
  color
  /// Whether the dynamic light contributes additively rather than modulating the surface.
  additive
end struct
/// Data record for `mq3.renderer.scene_queue.View`; groups `entities`, `dlights`, `polys`.
struct View
  /// Entity records associated with the current world, scene, or snapshot.
  entities
  /// Dynamic lights submitted to the current scene.
  dlights
  /// Polygons submitted to the current scene.
  polys
end struct
/// Data record for `mq3.renderer.scene_queue.State`; groups `registered`, `hardwareType`, `worldLoaded`, `fogBounds`, `maxPolys`, `maxPolyVerts`, and 9 further fields.
struct State
  /// Whether the subsystem has completed resource registration.
  registered
  /// Detected graphics-hardware family used to select compatibility behavior.
  hardwareType
  /// Whether a world map is available to the renderer.
  worldLoaded
  /// World-space bounds of fog volumes used to classify submitted polygons.
  fogBounds
  /// Maximum number of polygons accepted by the scene buffer.
  maxPolys
  /// Maximum number of polygon vertices accepted by the scene buffer.
  maxPolyVerts
  /// Entity records associated with the current world, scene, or snapshot.
  entities
  /// Dynamic lights submitted to the current scene.
  dlights
  /// Polygons submitted to the current scene.
  polys
  /// Number of polygon vertices currently stored in the scene.
  numPolyVerts
  /// First entity belonging to the current scene within the shared frame buffer.
  firstSceneEntity
  /// First dynamic light belonging to the current scene within the shared frame buffer.
  firstSceneDlight
  /// First polygon belonging to the current scene within the shared frame buffer.
  firstScenePoly
  /// Host callback used to perform diagnostic operations for this subsystem.
  diagnosticFn
  /// Host state supplied when reporting invalid or rejected scene submissions.
  context
end struct

/// Builds `mq3.renderer.scene_queue.State` for `mq3.renderer.scene_queue.create`.
/// @param maxPolys Initial value for `mq3.renderer.scene_queue.State.maxPolys`.
/// @param maxPolyVerts Initial value for `mq3.renderer.scene_queue.State.maxPolyVerts`.
function create(maxPolys,maxPolyVerts)
  if maxPolys<0 or maxPolyVerts<0 then return error(3470,"scene queue: negative capacity") end if
  initialPolys=maxPolys;if initialPolys>64 then initialPolys=64 end if
  return State(false,0,false,[],maxPolys,maxPolyVerts,lists.List.withCapacity(128),lists.List.withCapacity(MAX_DLIGHTS),lists.List.withCapacity(initialPolys),0,0,0,0,void,void)
end function
/// Returns `void` from `mq3.renderer.scene_queue.diagnostic`.
/// @param state Record providing `state.diagnosticFn`, `state.context`.
/// @param text Argument 2 supplied to `state.diagnosticFn`.
function diagnostic(state,text) if state.diagnosticFn!=void then context=state.context;state.diagnosticFn(context,text) end if;return void end function
/// Returns `[value[0],value[1],value[2]]` from `mq3.renderer.scene_queue.vector3`; earlier branches return `error(3471,"scene queue: invalid "+label)`.
/// @param value Three-component vector read at indices 0, 1, and 2.
/// @param label Input tested by `value==void or len(value)!=3`.
function vector3(value,label) if value==void or len(value)!=3 then return error(3471,"scene queue: invalid "+label) end if;return [value[0],value[1],value[2]] end function
/// Returns `[value[0],value[1],value[2],value[3]]` from `mq3.renderer.scene_queue.color4`; earlier branches return `error(3471,"scene queue: invalid vertex color")`.
/// @param value Indexed input read at `0`, `1`, `2`, `3`.
function color4(value) if value==void or len(value)!=4 then return error(3471,"scene queue: invalid vertex color") end if;return [value[0],value[1],value[2],value[3]] end function
/// Returns `[value[0],value[1]]` from `mq3.renderer.scene_queue.tex2`; earlier branches return `error(3471,"scene queue: invalid texture coordinate")`.
/// @param value Indexed input read at `0`, `1`.
function tex2(value) if value==void or len(value)!=2 then return error(3471,"scene queue: invalid texture coordinate") end if;return [value[0],value[1]] end function
/// Constructs `mq3.renderer.scene_queue.PolyVert` with `xyz` = `vector3(value.xyz,"vertex")`, `st` = `tex2(value.st)`, `modulate` = `color4(value.modulate)`.
/// @param value Record providing `value.xyz`, `value.st`, `value.modulate`.
function vertex(value) return PolyVert(vector3(value.xyz,"vertex"),tex2(value.st),color4(value.modulate)) end function

/// Updates `state.numPolyVerts`, `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly` in `mq3.renderer.scene_queue.toggleFrame`.
/// @param state Mutable record or buffer; this call updates `state.numPolyVerts`, `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly`.
function toggleFrame(state)
  state.entities.clear();state.dlights.clear();state.polys.clear();state.numPolyVerts=0
  state.firstSceneEntity=0;state.firstSceneDlight=0;state.firstScenePoly=0;return void
end function
/// Updates `state.firstSceneDlight`, `state.firstSceneEntity`, `state.firstScenePoly` in `mq3.renderer.scene_queue.clearScene`.
/// @param state Mutable record or buffer; this call updates `state.firstSceneDlight`, `state.firstSceneEntity`, `state.firstScenePoly`.
function clearScene(state)
  state.firstSceneDlight=state.dlights.len();state.firstSceneEntity=state.entities.len();state.firstScenePoly=state.polys.len();return void
end function

/// Builds `mins[axis]`, `maxs[axis]` in `mq3.renderer.scene_queue.fogForVertices`; returns `0`.
/// @param state Record providing `state.worldLoaded`, `state.fogBounds`.
/// @param vertices Indexed input read at `0`, `index`.
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

/// Updates `state.numPolyVerts` in `mq3.renderer.scene_queue.addPolysInternal`; returns `added`.
/// @param state Mutable record or buffer; this call updates `state.numPolyVerts`.
/// @param hShader Value used for `mq3.renderer.scene_queue.Poly.hShader`.
/// @param numVerts Argument 1 supplied to `array`.
/// @param vertices Indexed input read at `polyIndex*numVerts+index`.
/// @param numPolys Input tested by `numVerts<=0 or numPolys<0 or len(vertices)<numVerts*numPolys`.
/// @param ownedVertices Input tested by `not ownedVertices or numPolys!=1`.
function addPolysInternal(state,hShader,numVerts,vertices,numPolys,ownedVertices)
  if not state.registered then return 0 end if
  if hShader==0 then diagnostic(state,"NULL poly shader");return 0 end if
  if numVerts<=0 or numPolys<0 or len(vertices)<numVerts*numPolys then return error(3471,"scene queue: invalid polygon input") end if
  if numPolys==0 then return 0 end if
  added=0
  for polyIndex=0 to numPolys-1
    if state.numPolyVerts+numVerts>state.maxPolyVerts or state.polys.len()>=state.maxPolys then diagnostic(state,"poly capacity reached");return added end if
    copied=vertices
    if not ownedVertices or numPolys!=1 then
      copied=array(numVerts,void)
      for index=0 to numVerts-1
        value=vertices[polyIndex*numVerts+index]
        if ownedVertices then copied[index]=value else copied[index]=vertex(value) end if
      end for
    end if
    if state.hardwareType==GLHW_RAGEPRO then copied[0].modulate=[255,255,255,255] end if
    fog=fogForVertices(state,copied);state.polys.add(Poly(hShader,copied,fog));state.numPolyVerts=state.numPolyVerts+numVerts;added=added+1
  end for
  return added
end function
/// Calls `mq3.renderer.scene_queue.addPolysInternal` with `(state,hShader,numVerts,vertices,numPolys,false)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param hShader Value forwarded as `hShader` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param numVerts Value forwarded as `numVerts` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param vertices Value forwarded as `vertices` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param numPolys Value forwarded as `numPolys` to `mq3.renderer.scene_queue.addPolysInternal`.
function addPolys(state,hShader,numVerts,vertices,numPolys) return addPolysInternal(state,hShader,numVerts,vertices,numPolys,false) end function
// The QVM bridge freshly decodes these vertices and transfers ownership to
// the frame queue. Avoid copying every vector/color a second time.
/// @param state Value forwarded as `state` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param hShader Value forwarded as `hShader` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param numVerts Value forwarded as `numVerts` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param vertices Value forwarded as `vertices` to `mq3.renderer.scene_queue.addPolysInternal`.
/// @param numPolys Value forwarded as `numPolys` to `mq3.renderer.scene_queue.addPolysInternal`.
function addPolysDecoded(state,hShader,numVerts,vertices,numPolys) return addPolysInternal(state,hShader,numVerts,vertices,numPolys,true) end function

/// Appends a validated entity while the scene is registered and entity capacity remains available.
/// @param state Record providing `state.registered`, `state.entities`.
/// @param reType Argument 1 supplied to `mq3.renderer.tr_types.validRefEntityType`.
/// @param payload Value used for `mq3.renderer.scene_queue.RefEntity.payload`.
function addEntity(state,reType,payload)
  if not state.registered then return false end if
  if state.entities.len()>=ENTITYNUM_WORLD then return false end if
  if not trtypes.validRefEntityType(reType) then return error(3471,"scene queue: bad reType "+str(reType)) end if
  state.entities.add(RefEntity(reType,payload,false));return true
end function

// QVM refEntity_t is a fixed 140-byte 32-bit ABI record from tr_types.h.
/// @param payload Argument 1 supplied to `mq3.compat.numeric.readI32`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function payloadVector(payload,offset)
  return [n.bitsFloat(n.readI32(payload,offset)),n.bitsFloat(n.readI32(payload,offset+4)),n.bitsFloat(n.readI32(payload,offset+8))]
end function
/// Builds `mq3.renderer.scene_queue.DecodedRefEntity` for `mq3.renderer.scene_queue.decodeEntity`.
/// @param value Record providing `value.payload`, `value.reType`.
function decodeEntity(value)
  if value==void or typeof(value.payload)!="bytes" or len(value.payload)!=140 then return error(3471,"scene queue: invalid refEntity payload") end if
  data=value.payload;axes=[payloadVector(data,28),payloadVector(data,40),payloadVector(data,52)]
  return DecodedRefEntity(value.reType,n.readI32(data,4),n.readI32(data,8),payloadVector(data,12),n.bitsFloat(n.readI32(data,24)),axes,n.readI32(data,64)!=0,payloadVector(data,68),n.readI32(data,80),payloadVector(data,84),n.readI32(data,96),n.bitsFloat(n.readI32(data,100)),n.readI32(data,104),n.readI32(data,108),n.readI32(data,112),[data[116],data[117],data[118],data[119]],[n.bitsFloat(n.readI32(data,120)),n.bitsFloat(n.readI32(data,124))],n.bitsFloat(n.readI32(data,128)),n.bitsFloat(n.readI32(data,132)),n.bitsFloat(n.readI32(data,136)))
end function

/// Queues a positive-intensity dynamic light when registered, within capacity, and allowed by the hardware policy.
/// @param state Record providing `state.registered`, `state.dlights`, `state.hardwareType`.
/// @param origin Value forwarded as `value` to `mq3.renderer.scene_queue.vector3`.
/// @param intensity Value used for `mq3.renderer.scene_queue.DLight.radius`.
/// @param r Input used by `state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive))`.
/// @param g Input used by `state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive))`.
/// @param b Input used by `state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive))`.
/// @param additive Value used for `mq3.renderer.scene_queue.DLight.additive`.
function addDynamicLight(state,origin,intensity,r,g,b,additive)
  if not state.registered or state.dlights.len()>=MAX_DLIGHTS or intensity<=0 then return false end if
  if state.hardwareType==GLHW_RIVA128 or state.hardwareType==GLHW_PERMEDIA2 then return false end if
  state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive));return true
end function
/// Calls `mq3.renderer.scene_queue.addDynamicLight` with `(state,origin,intensity,r,g,b,false)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param origin Value forwarded as `origin` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param intensity Value forwarded as `intensity` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param r Value forwarded as `r` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param g Value forwarded as `g` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param b Value forwarded as `b` to `mq3.renderer.scene_queue.addDynamicLight`.
function addLight(state,origin,intensity,r,g,b) return addDynamicLight(state,origin,intensity,r,g,b,false) end function
/// Calls `mq3.renderer.scene_queue.addDynamicLight` with `(state,origin,intensity,r,g,b,true)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param origin Value forwarded as `origin` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param intensity Value forwarded as `intensity` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param r Value forwarded as `r` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param g Value forwarded as `g` to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param b Value forwarded as `b` to `mq3.renderer.scene_queue.addDynamicLight`.
function addAdditiveLight(state,origin,intensity,r,g,b) return addDynamicLight(state,origin,intensity,r,g,b,true) end function

/// Calls `std.array.slice` with `(state.entities.buf,state.firstSceneEntity,state.entities.len()-state.firstSceneEntity)` and returns its result.
/// @param state Record providing `state.entities`, `state.firstSceneEntity`.
function sceneEntities(state) return arrays.slice(state.entities.buf,state.firstSceneEntity,state.entities.len()-state.firstSceneEntity) end function
/// Calls `std.array.slice` with `(state.dlights.buf,state.firstSceneDlight,state.dlights.len()-state.firstSceneDlight)` and returns its result.
/// @param state Record providing `state.dlights`, `state.firstSceneDlight`.
function sceneLights(state) return arrays.slice(state.dlights.buf,state.firstSceneDlight,state.dlights.len()-state.firstSceneDlight) end function
/// Calls `std.array.slice` with `(state.polys.buf,state.firstScenePoly,state.polys.len()-state.firstScenePoly)` and returns its result.
/// @param state Record providing `state.polys`, `state.firstScenePoly`.
function scenePolys(state) return arrays.slice(state.polys.buf,state.firstScenePoly,state.polys.len()-state.firstScenePoly) end function
/// Updates `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly` in `mq3.renderer.scene_queue.finishScene`; returns `value`.
/// @param state Mutable record or buffer; this call updates `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly`.
function finishScene(state)
  value=View(sceneEntities(state),sceneLights(state),scenePolys(state))
  state.firstSceneEntity=state.entities.len();state.firstSceneDlight=state.dlights.len();state.firstScenePoly=state.polys.len();return value
end function
