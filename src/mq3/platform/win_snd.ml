// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// DirectSound DMA lifecycle and circular-buffer semantics from code/win32/win_snd.c.
package mq3.platform.win_snd

const SECONDARY_BUFFER_SIZE=65536
const DS_OK=0
const DSERR_BUFFERLOST=-1
const DSERR_INVALIDCALL=-2
const DSERR_INVALIDPARAM=-3
const DSERR_PRIOLEVELNEEDED=-4

struct Action boundary kind size dispatched end struct
struct Dma channels samplebits speed samples submissionChunk bufferValid end struct
struct State dsoundInit sample16 sndBufSize lockSize hasDS hasDSBuf hasPrimary dllLoaded coInitialized playing bufferLost bufferLocked dma actions prints errors retailActive end struct

function create(retailActive)
  return State(false,0,0,0,false,false,false,false,false,false,false,false,Dma(0,0,0,0,0,false),[],[],[],retailActive)
end function
function emit(state,kind,size) value=Action("directsound",kind,size,not state.retailActive);state.actions=state.actions+[value];return value end function
function note(state,text) state.prints=state.prints+[text];return text end function
function fail(state,text) state.errors=state.errors+[text];return false end function

// DSoundError
function DSoundError(errorCode)
  if errorCode==DSERR_BUFFERLOST then return "DSERR_BUFFERLOST" end if
  if errorCode==DSERR_INVALIDCALL then return "DSERR_INVALIDCALLS" end if
  if errorCode==DSERR_INVALIDPARAM then return "DSERR_INVALIDPARAM" end if
  if errorCode==DSERR_PRIOLEVELNEEDED then return "DSERR_PRIOLEVELNEEDED" end if
  return "unknown"
end function

// SNDDMA_Shutdown
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
function SNDDMA_Init(state,use8Available,legacyAvailable,priorityOk,hardwareBufferOk,softwareBufferOk,playOk,capsOk,returnedBufferBytes)
  state.dma=Dma(0,0,0,0,0,false);state.dsoundInit=false;state.coInitialized=true
  if not SNDDMA_InitDS(state,use8Available,legacyAvailable,priorityOk,hardwareBufferOk,softwareBufferOk,playOk,capsOk,returnedBufferBytes) then return false end if
  state.dsoundInit=true;note(state,"Completed successfully\n");return true
end function

// SNDDMA_GetDMAPos (the inventory extractor calls this candidate `position`).
function SNDDMA_GetDMAPos(state,readCursor)
  if not state.dsoundInit then return 0 end if
  return (readCursor>>state.sample16)&(state.dma.samples-1)
end function

// SNDDMA_BeginPainting
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
function SNDDMA_Submit(state)
  if state.hasDSBuf then emit(state,"unlock-buffer",state.lockSize);state.bufferLocked=false end if
  return void
end function

// SNDDMA_Activate
function SNDDMA_Activate(state,priorityOk)
  if not state.hasDS then return false end if
  if not priorityOk then fail(state,"sound SetCooperativeLevel failed\n");SNDDMA_Shutdown(state);return false end if
  emit(state,"set-priority",0);return true
end function
