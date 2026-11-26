// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// DirectSound DMA lifecycle and circular-buffer semantics from code/win32/win_snd.c.
package mq3.platform.win_snd

/// Byte capacity of the DirectSound secondary playback buffer.
const SECONDARY_BUFFER_SIZE=65536
/// DirectSound result code indicating success.
const DS_OK=0
/// DirectSound error indicating that the playback buffer must be restored.
const DSERR_BUFFERLOST=-1
/// DirectSound error indicating that an operation is invalid in the current state.
const DSERR_INVALIDCALL=-2
/// DirectSound error indicating an invalid parameter.
const DSERR_INVALIDPARAM=-3
/// DirectSound error indicating that the requested cooperative priority level is required.
const DSERR_PRIOLEVELNEEDED=-4

/// Data record for `mq3.platform.win_snd.Action`; groups `boundary`, `kind`, `size`, `dispatched`.
struct Action
  /// Host operation boundary at which this platform action is dispatched.
  boundary
  /// DirectSound lifecycle or buffer operation represented by this dispatch request.
  kind
  /// Configured size or capacity used by the enclosing operation.
  size
  /// Whether the recorded action was delivered to its host implementation.
  dispatched
end struct
/// Data record for `mq3.platform.win_snd.Dma`; groups `channels`, `samplebits`, `speed`, `samples`, `submissionChunk`, `bufferValid`.
struct Dma
  /// Number of interleaved channels in the DMA audio stream.
  channels
  /// Number of bits stored for each audio sample.
  samplebits
  /// DMA audio sample rate in samples per second.
  speed
  /// Number of sample slots in the DMA sound buffer.
  samples
  /// Minimum number of samples submitted to the sound backend at once.
  submissionChunk
  /// Whether the DMA sound buffer is valid and accessible.
  bufferValid
end struct
/// Data record for `mq3.platform.win_snd.State`; groups `dsoundInit`, `sample16`, `sndBufSize`, `lockSize`, `hasDS`, `hasDSBuf`, and 11 further fields.
struct State
  /// Whether DirectSound initialization has completed.
  dsoundInit
  /// Whether DMA samples use sixteen-bit storage.
  sample16
  /// Size in bytes of the allocated DirectSound buffer.
  sndBufSize
  /// Size in bytes of the region currently locked for mixing.
  lockSize
  /// Whether a DirectSound interface is available.
  hasDS
  /// Whether a DirectSound secondary buffer is available.
  hasDSBuf
  /// Whether a DirectSound primary buffer is available.
  hasPrimary
  /// Whether the DirectSound library has loaded.
  dllLoaded
  /// Whether COM initialization was performed by the sound backend.
  coInitialized
  /// Whether the sound buffer is currently playing.
  playing
  /// Whether DirectSound reported that the sound buffer must be restored.
  bufferLost
  /// Whether the sound buffer is currently locked for writes.
  bufferLocked
  /// Audio DMA format and buffer information exposed to the mixer.
  dma
  /// Platform operations recorded for dispatch or inspection.
  actions
  /// Messages captured from diagnostic print operations.
  prints
  /// Errors recorded by this subsystem or its host callbacks.
  errors
  /// Whether the real platform backend is active for action dispatch.
  retailActive
end struct

/// Constructs `mq3.platform.win_snd.State` with `dsoundInit` = `false`, `sample16` = `0`, `sndBufSize` = `0`, `lockSize` = `0` and the supplied remaining values.
/// @param retailActive Initial value for `mq3.platform.win_snd.State.retailActive`.
function create(retailActive)
  return State(false,0,0,0,false,false,false,false,false,false,false,false,Dma(0,0,0,0,0,false),[],[],[],retailActive)
end function
/// Updates `state.actions` in `mq3.platform.win_snd.emit`; returns `value`.
/// @param state Mutable record or buffer; this call updates `state.actions`.
/// @param kind Value used for `mq3.platform.win_snd.Action.kind`.
/// @param size Value used for `mq3.platform.win_snd.Action.size`.
function emit(state,kind,size) value=Action("directsound",kind,size,not state.retailActive);state.actions=state.actions+[value];return value end function
/// Updates `state.prints` in `mq3.platform.win_snd.note`; returns `text`.
/// @param state Mutable record or buffer; this call updates `state.prints`.
/// @param text Input used by `state.prints=state.prints+[text]`.
function note(state,text) state.prints=state.prints+[text];return text end function
/// Updates `state.errors` in `mq3.platform.win_snd.fail`; returns `false`.
/// @param state Mutable record or buffer; this call updates `state.errors`.
/// @param text Input used by `state.errors=state.errors+[text]`.
function fail(state,text) state.errors=state.errors+[text];return false end function

// DSoundError
/// @param errorCode Input tested by `errorCode==DSERR_BUFFERLOST`.
function DSoundError(errorCode)
  if errorCode==DSERR_BUFFERLOST then return "DSERR_BUFFERLOST" end if
  if errorCode==DSERR_INVALIDCALL then return "DSERR_INVALIDCALLS" end if
  if errorCode==DSERR_INVALIDPARAM then return "DSERR_INVALIDPARAM" end if
  if errorCode==DSERR_PRIOLEVELNEEDED then return "DSERR_PRIOLEVELNEEDED" end if
  return "unknown"
end function

// SNDDMA_Shutdown
/// @param state Mutable record or buffer; this call updates `state.hasDS`, `state.hasDSBuf`, `state.hasPrimary`, `state.dllLoaded`, `state.dsoundInit`.
function SNDDMA_Shutdown(state)
  note(state,"Shutting down sound system\n")
  if state.hasDS then
    if state.hasDSBuf then emit(state,"stop-secondary",0);emit(state,"release-secondary",0) end if
    if state.hasPrimary and not state.hasDSBuf then emit(state,"release-primary",0) end if
    emit(state,"release-device",0)
  end if
  if state.dllLoaded then emit(state,"free-dsound-dll",0) end if
  state.hasDS=false;state.hasDSBuf=false;state.hasPrimary=false;state.dllLoaded=false;state.dsoundInit=false;state.playing=false;state.bufferLost=false;state.bufferLocked=false;state.coInitialized=false
  state.dma=Dma(0,0,0,0,0,false);return void
end function

// SNDDMA_InitDS. Capability results are supplied by the Win32 host adapter.
/// @param state Mutable record or buffer; this call updates `state.hasDS`, `state.dma.channels`, `state.dma.samplebits`, `state.dma.speed`, `state.hasPrimary`.
/// @param use8Available Input used by `use8=use8Available`.
/// @param legacyAvailable Input tested by `not use8Available and not legacyAvailable`.
/// @param priorityOk Input tested by `not priorityOk`.
/// @param hardwareBufferOk Input tested by `hardwareBufferOk`.
/// @param softwareBufferOk Input tested by `not softwareBufferOk`.
/// @param playOk Input tested by `not playOk`.
/// @param capsOk Input tested by `not capsOk`.
/// @param returnedBufferBytes Value assigned to `state.sndBufSize`.
function SNDDMA_InitDS(state,use8Available,legacyAvailable,priorityOk,hardwareBufferOk,softwareBufferOk,playOk,capsOk,returnedBufferBytes)
  note(state,"Initializing DirectSound\n")
  use8=use8Available
  if not use8Available and not legacyAvailable then SNDDMA_Shutdown(state);return false end if
  // The released CoCreateInstance path never assigns hInstDS.
  state.hasDS=true;emit(state,"create-device",0)
  if not priorityOk then fail(state,"cooperative-level");SNDDMA_Shutdown(state);return false end if
  emit(state,"set-priority",0)
  state.dma.channels=2;state.dma.samplebits=16;state.dma.speed=22050
  if hardwareBufferOk then emit(state,"create-hardware-buffer",SECONDARY_BUFFER_SIZE) else
    if not softwareBufferOk then fail(state,"create-secondary-buffer");SNDDMA_Shutdown(state);return false end if
    emit(state,"create-software-buffer",SECONDARY_BUFFER_SIZE)
  end if
  state.hasPrimary=true;state.hasDSBuf=true
  if not playOk then fail(state,"looped-play");SNDDMA_Shutdown(state);return false end if
  state.playing=true;emit(state,"play-looping",0)
  if not capsOk then fail(state,"get-caps");SNDDMA_Shutdown(state);return false end if
  state.sndBufSize=returnedBufferBytes;state.dma.samples=returnedBufferBytes/(state.dma.samplebits/8);state.dma.submissionChunk=1;state.dma.bufferValid=false;state.sample16=(state.dma.samplebits/8)-1
  // The released function immediately locks, clears and submits the whole ring.
  SNDDMA_BeginPainting(state,true,true,true,[DS_OK])
  if state.dma.bufferValid then emit(state,"clear-buffer",state.dma.samples*state.dma.samplebits/8) end if
  SNDDMA_Submit(state);return true
end function

// SNDDMA_Init
/// @param state Mutable record or buffer; this call updates `state.dma`, `state.dsoundInit`, `state.coInitialized`.
/// @param use8Available Value forwarded as `use8Available` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param legacyAvailable Value forwarded as `legacyAvailable` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param priorityOk Value forwarded as `priorityOk` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param hardwareBufferOk Value forwarded as `hardwareBufferOk` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param softwareBufferOk Value forwarded as `softwareBufferOk` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param playOk Value forwarded as `playOk` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param capsOk Value forwarded as `capsOk` to `mq3.platform.win_snd.SNDDMA_InitDS`.
/// @param returnedBufferBytes Value forwarded as `returnedBufferBytes` to `mq3.platform.win_snd.SNDDMA_InitDS`.
function SNDDMA_Init(state,use8Available,legacyAvailable,priorityOk,hardwareBufferOk,softwareBufferOk,playOk,capsOk,returnedBufferBytes)
  state.dma=Dma(0,0,0,0,0,false);state.dsoundInit=false;state.coInitialized=true
  if not SNDDMA_InitDS(state,use8Available,legacyAvailable,priorityOk,hardwareBufferOk,softwareBufferOk,playOk,capsOk,returnedBufferBytes) then return false end if
  state.dsoundInit=true;note(state,"Completed successfully\n");return true
end function

// SNDDMA_GetDMAPos (the inventory extractor calls this candidate `position`).
/// @param state Record providing `state.dsoundInit`, `state.sample16`, `state.dma`.
/// @param readCursor Input used in the result expression `(readCursor>>state.sample16)&(state.dma.samples-1)`.
function SNDDMA_GetDMAPos(state,readCursor)
  if not state.dsoundInit then return 0 end if
  return (readCursor>>state.sample16)&(state.dma.samples-1)
end function

// SNDDMA_BeginPainting
/// @param state Mutable record or buffer; this call updates `state.bufferLost`, `state.playing`, `state.dma.bufferValid`, `state.bufferLocked`, `state.lockSize`.
/// @param statusOk Input tested by `not statusOk`.
/// @param restoreOk Input tested by `state.bufferLost`.
/// @param restartOk Input tested by `not state.playing`.
/// @param lockResults Indexed input read at `index`.
function SNDDMA_BeginPainting(state,statusOk,restoreOk,restartOk,lockResults)
  if not state.hasDSBuf then return false end if
  if not statusOk then note(state,"Couldn't get sound buffer status\n") end if
  if state.bufferLost then if restoreOk then state.bufferLost=false;emit(state,"restore-buffer",0) end if end if
  if not state.playing then if restartOk then state.playing=true;emit(state,"play-looping",0) end if end if
  state.dma.bufferValid=false;state.bufferLocked=false;reps=0;index=0
  while index<len(lockResults)
    result=lockResults[index];index=index+1
    if result==DS_OK then state.lockSize=state.sndBufSize;state.dma.bufferValid=true;state.bufferLocked=true;emit(state,"lock-buffer",state.sndBufSize);return true end if
    if result!=DSERR_BUFFERLOST then fail(state,"lock:"+DSoundError(result));return false end if
    emit(state,"restore-buffer",0);reps=reps+1;if reps>2 then return false end if
  end while
  return false
end function

// SNDDMA_Submit
/// @param state Mutable record or buffer; this call updates `state.bufferLocked`.
function SNDDMA_Submit(state)
  if state.hasDSBuf then emit(state,"unlock-buffer",state.lockSize);state.bufferLocked=false end if
  return void
end function

// SNDDMA_Activate
/// @param state Record providing `state.hasDS`.
/// @param priorityOk Input tested by `not priorityOk`.
function SNDDMA_Activate(state,priorityOk)
  if not state.hasDS then return false end if
  if not priorityOk then fail(state,"sound SetCooperativeLevel failed\n");SNDDMA_Shutdown(state);return false end if
  emit(state,"set-priority",0);return true
end function
