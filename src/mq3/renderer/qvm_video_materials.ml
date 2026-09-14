// SPDX-License-Identifier: GPL-2.0-or-later
// Connects shader videoMap stages to the cinematic runtime's scratch images.
package mq3.renderer.qvm_video_materials

import mq3.client.cinematic_runtime as cinematics
import mq3.compat.numeric as n
import mq3.renderer.playable_materials as materials

const SCRATCH_WIDTH=256
const SCRATCH_HEIGHT=256

struct Binding path handle slot end struct
struct Upload path handle slot pixels width height end struct
struct State cinematics firstScratchSlot scratchSlotCount bindings failedBindings end struct

function fail(message) return error(7694,"QVM video materials: "+message) end function
function create(cinematicState,firstScratchSlot,scratchSlotCount)
  if cinematicState==void or firstScratchSlot<0 or scratchSlotCount<=0 or scratchSlotCount>cinematics.MAX_HANDLES then return fail("invalid cinematic state or scratch slot range") end if
  return State(cinematicState,firstScratchSlot,scratchSlotCount,[],0)
end function
function bindingFor(state,path)
  for each binding in state.bindings if stringEqualsIgnoreCaseAscii(binding.path,path) then return binding end if end for
  return void
end function
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
function bindStages(state,stages,now)
  if stages==void then return fail("stages are required") end if
  count=0;for each stage in stages bound=bindStage(state,stage,now);if bound is error then return bound end if;if bound then count=count+1 end if end for;return count
end function
// Catalog is intentionally structural: both qvm_scene_materials.Catalog and
// qvm_2d_batch.Catalog expose materials[*].stages.
function bindCatalog(state,catalog,now)
  if catalog==void then return fail("material catalog is required") end if
  count=0;for each material in catalog.materials bound=bindStages(state,material.stages,now);if bound is error then return bound end if;count=count+bound end for;return count
end function

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
function close(state)
  if state!=void then for each binding in state.bindings cinematics.stop(state.cinematics,binding.handle) end for;state.bindings=[] end if
  return void
end function
