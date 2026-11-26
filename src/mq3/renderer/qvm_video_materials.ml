// SPDX-License-Identifier: GPL-2.0-or-later
// Connects shader videoMap stages to the cinematic runtime's scratch images.
package mq3.renderer.qvm_video_materials

import mq3.client.cinematic_runtime as cinematics
import mq3.compat.numeric as n
import mq3.renderer.playable_materials as materials

/// Width in pixels of a scratch texture used for cinematic frames.
const SCRATCH_WIDTH=256
/// Height in pixels of a scratch texture used for cinematic frames.
const SCRATCH_HEIGHT=256

/// Data record for `mq3.renderer.qvm_video_materials.Binding`; groups `path`, `handle`, `slot`.
struct Binding
  /// Filesystem or virtual asset path associated with this record.
  path
  /// Resource handle used to identify the registered or opened object.
  handle
  /// Texture slot reserved for this image in the native drawing backend.
  slot
end struct
/// Data record for `mq3.renderer.qvm_video_materials.Upload`; groups `path`, `handle`, `slot`, `pixels`, `width`, `height`.
struct Upload
  /// Filesystem or virtual asset path associated with this record.
  path
  /// Resource handle used to identify the registered or opened object.
  handle
  /// Texture slot reserved for this image in the native drawing backend.
  slot
  /// Decoded pixel data for the image or upload.
  pixels
  /// Width in pixels of the cinematic frame submitted for texture upload.
  width
  /// Height in pixels of the cinematic frame submitted for texture upload.
  height
end struct
/// Data record for `mq3.renderer.qvm_video_materials.State`; groups `cinematics`, `firstScratchSlot`, `scratchSlotCount`, `bindings`, `failedBindings`.
struct State
  /// Active cinematic handles, decoded frames, and playback state.
  cinematics
  /// First texture slot reserved for cinematic frame uploads.
  firstScratchSlot
  /// Number of texture slots reserved for cinematic frame uploads.
  scratchSlotCount
  /// Bindings associating names or handles with their backing resources.
  bindings
  /// Cinematic or texture bindings that failed to initialize.
  failedBindings
end struct

/// Creates error `7694` with message `"QVM video materials: "+message`.
/// @param message Input used in the result expression `error(7694,"QVM video materials: "+message)`.
function fail(message) return error(7694,"QVM video materials: "+message) end function
/// Builds `mq3.renderer.qvm_video_materials.State` for `mq3.renderer.qvm_video_materials.create`.
/// @param cinematicState Initial value for `mq3.renderer.qvm_video_materials.State.cinematics`.
/// @param firstScratchSlot Initial value for `mq3.renderer.qvm_video_materials.State.firstScratchSlot`.
/// @param scratchSlotCount Initial value for `mq3.renderer.qvm_video_materials.State.scratchSlotCount`.
function create(cinematicState,firstScratchSlot,scratchSlotCount)
  if cinematicState==void or firstScratchSlot<0 or scratchSlotCount<=0 or scratchSlotCount>cinematics.MAX_HANDLES then return fail("invalid cinematic state or scratch slot range") end if
  return State(cinematicState,firstScratchSlot,scratchSlotCount,[],0)
end function
/// Returns `void` from `mq3.renderer.qvm_video_materials.bindingFor`; earlier branches return `binding`.
/// @param state Record providing `state.bindings`.
/// @param path Argument 2 supplied to `stringEqualsIgnoreCaseAscii`.
function bindingFor(state,path)
  for each binding in state.bindings if stringEqualsIgnoreCaseAscii(binding.path,path) then return binding end if end for
  return void
end function
/// Updates `state.failedBindings`, `state.bindings`, `stage.slots` in `mq3.renderer.qvm_video_materials.bindStage`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.failedBindings`, `state.bindings`.
/// @param stage Mutable record or buffer; this call updates `stage.slots`.
/// @param now Argument 8 supplied to `mq3.client.cinematic_runtime.play`.
function bindStage(state,stage,now)
  if state==void or stage==void or now<0 then return fail("valid state, stage and time are required") end if
  path=materials.videoName(stage);if path=="" then return false end if
  binding=bindingFor(state,path)
  if binding==void then
    handle=cinematics.play(state.cinematics,path,0,0,SCRATCH_WIDTH,SCRATCH_HEIGHT,cinematics.CIN_LOOP|cinematics.CIN_SILENT|cinematics.CIN_SHADER,now)
    if handle<0 or handle>=state.scratchSlotCount then state.failedBindings=state.failedBindings+1;return false end if
    binding=Binding(path,handle,state.firstScratchSlot+handle);state.bindings=state.bindings+[binding]
  end if
  // Runtime batches read the slot from the stage every frame.  Replacing it
  // here mirrors image[0] = tr.scratchImage[videoMapHandle].
  stage.slots=[binding.slot]
  return true
end function
/// Registers video-backed material stages and returns how many stage bindings were created.
/// @param state Value forwarded as `state` to `mq3.renderer.qvm_video_materials.bindStage`.
/// @param stages Sequence traversed as `stage` while producing this result.
/// @param now Value forwarded as `now` to `mq3.renderer.qvm_video_materials.bindStage`.
function bindStages(state,stages,now)
  if stages==void then return fail("stages are required") end if
  count=0;for each stage in stages bound=bindStage(state,stage,now);if bound is error then return bound end if;if bound then count=count+1 end if end for;return count
end function
// Catalog is intentionally structural: both qvm_scene_materials.Catalog and
// qvm_2d_batch.Catalog expose materials[*].stages.
/// @param state Value forwarded as `state` to `mq3.renderer.qvm_video_materials.bindStages`.
/// @param catalog Record providing `catalog.materials`.
/// @param now Value forwarded as `now` to `mq3.renderer.qvm_video_materials.bindStages`.
function bindCatalog(state,catalog,now)
  if catalog==void then return fail("material catalog is required") end if
  count=0;for each material in catalog.materials bound=bindStages(state,material.stages,now);if bound is error then return bound end if;count=count+bound end for;return count
end function

/// Builds `output[target]`, `output[target+1]`, `output[target+2]`, `output[target+3]` in `mq3.renderer.qvm_video_materials.scratchPixels`; returns `output`.
/// @param frame Record providing `frame.width`, `frame.height`, `frame.pixels`.
function scratchPixels(frame)
  if frame.width==SCRATCH_WIDTH and frame.height==SCRATCH_HEIGHT then return frame.pixels end if
  // CIN_UploadCinematic always presents a 256x256 scratch texture.  Modern
  // backends require a tightly packed buffer, so explicitly resample it.
  output=bytes(SCRATCH_WIDTH*SCRATCH_HEIGHT*4,0)
  for y=0 to SCRATCH_HEIGHT-1
    sourceY=n.trunc32(y*frame.height/SCRATCH_HEIGHT)
    for x=0 to SCRATCH_WIDTH-1
      sourceX=n.trunc32(x*frame.width/SCRATCH_WIDTH);source=(sourceY*frame.width+sourceX)*4;target=(y*SCRATCH_WIDTH+x)*4
      output[target]=frame.pixels[source];output[target+1]=frame.pixels[source+1];output[target+2]=frame.pixels[source+2];output[target+3]=frame.pixels[source+3]
    end for
  end for
  return output
end function
/// Advances bound cinematics and returns resized scratch-texture uploads for dirty video frames.
/// @param state Record providing `state.bindings`, `state.cinematics`.
/// @param now Argument 3 supplied to `mq3.client.cinematic_runtime.run`.
function update(state,now)
  if state==void or now<0 then return fail("valid state and time are required") end if
  result=[]
  for each binding in state.bindings
    cinematics.run(state.cinematics,binding.handle,now)
    frame=cinematics.upload(state.cinematics,binding.handle)
    if frame!=void and frame.dirty then result=result+[Upload(binding.path,binding.handle,binding.slot,scratchPixels(frame.frame),SCRATCH_WIDTH,SCRATCH_HEIGHT)] end if
  end for
  return result
end function
/// Updates `state.bindings` in `mq3.renderer.qvm_video_materials.close`.
/// @param state Mutable record or buffer; this call updates `state.bindings`.
function close(state)
  if state!=void then for each binding in state.bindings cinematics.stop(state.cinematics,binding.handle) end for;state.bindings=[] end if
  return void
end function
