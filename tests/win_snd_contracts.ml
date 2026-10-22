import mq3.platform.win_snd as snd
function require(ok,label) if not ok then return error(7980,"win snd contract: "+label) end if;return 1 end function
function lastKind(state) return state.actions[len(state.actions)-1].kind end function
function main(args)
  count=0;state=snd.create(false)
  count=count+require(snd.SNDDMA_Init(state,true,true,true,true,true,true,true,65536),"DirectSound 8 hardware initialization")
  count=count+require(state.dsoundInit and state.coInitialized and state.hasDS and state.hasDSBuf,"successful init owns device and buffer")
  count=count+require(state.dma.channels==2 and state.dma.samplebits==16 and state.dma.speed==22050,"released PCM format")
  count=count+require(state.dma.samples==32768 and state.dma.submissionChunk==1 and state.sample16==1,"DMA ring layout")
  count=count+require(lastKind(state)=="unlock-buffer" and not state.bufferLocked,"initial buffer clear is submitted")
  count=count+require(snd.SNDDMA_GetDMAPos(state,65534)==32767 and snd.SNDDMA_GetDMAPos(state,65536)==0,"cursor converts bytes to wrapped mono samples")
  count=count+require(snd.SNDDMA_Activate(state,true) and lastKind(state)=="set-priority","activation restores priority")
  state.bufferLost=true;state.playing=false;count=count+require(snd.SNDDMA_BeginPainting(state,true,true,true,[snd.DSERR_BUFFERLOST,snd.DS_OK]),"lost buffer restores and retries lock")
  count=count+require(state.playing and state.bufferLocked and state.dma.bufferValid,"painting returns a valid running buffer")
  snd.SNDDMA_Submit(state);count=count+require(not state.bufferLocked and lastKind(state)=="unlock-buffer","submit unlocks ring")
  snd.SNDDMA_Shutdown(state);count=count+require(not state.dsoundInit and not state.hasDS and state.dma.samples==0,"shutdown releases and clears DMA")

  fallback=snd.create(false);count=count+require(snd.SNDDMA_Init(fallback,false,true,true,false,true,true,true,32768),"legacy software fallback initializes")
  count=count+require(fallback.actions[2].kind=="create-software-buffer" and fallback.dma.samples==16384,"software buffer keeps returned caps")
  noDevice=snd.create(false);count=count+require(not snd.SNDDMA_Init(noDevice,false,false,true,true,true,true,true,65536) and not noDevice.dsoundInit,"missing DirectSound fails cleanly")
  noBuffer=snd.create(false);count=count+require(not snd.SNDDMA_Init(noBuffer,true,true,true,false,false,true,true,65536) and not noBuffer.hasDS,"both secondary-buffer paths failing shut down")
  badPlay=snd.create(false);count=count+require(not snd.SNDDMA_Init(badPlay,true,true,true,true,true,false,true,65536) and not badPlay.hasDS,"looped playback failure shuts down")
  badCaps=snd.create(false);count=count+require(not snd.SNDDMA_Init(badCaps,true,true,true,true,true,true,false,65536) and not badCaps.hasDS,"caps failure shuts down")
  unlocked=snd.create(false);count=count+require(not snd.SNDDMA_BeginPainting(unlocked,true,true,true,[snd.DS_OK]),"painting without buffer is inert")
  retries=snd.create(false);retries.hasDSBuf=true;retries.sndBufSize=65536;count=count+require(not snd.SNDDMA_BeginPainting(retries,true,true,true,[snd.DSERR_BUFFERLOST,snd.DSERR_BUFFERLOST,snd.DSERR_BUFFERLOST,snd.DS_OK]),"released retry cap is three losses")
  hard=snd.create(false);hard.hasDSBuf=true;hard.sndBufSize=65536;count=count+require(not snd.SNDDMA_BeginPainting(hard,true,true,true,[snd.DSERR_INVALIDCALL]) and len(hard.errors)==1,"non-loss lock error aborts")
  inactive=snd.create(false);count=count+require(snd.SNDDMA_GetDMAPos(inactive,1234)==0 and not snd.SNDDMA_Activate(inactive,true),"inactive device operations are inert")
  activation=snd.create(false);activation.hasDS=true;activation.hasDSBuf=true;activation.dsoundInit=true;count=count+require(not snd.SNDDMA_Activate(activation,false) and not activation.hasDS,"activation failure performs shutdown")
  mirror=snd.create(true);snd.SNDDMA_Init(mirror,true,true,true,true,true,true,true,65536);count=count+require(len(mirror.actions)>0 and not mirror.actions[0].dispatched,"Retail observer suppresses duplicate host calls")
  count=count+require(snd.DSoundError(snd.DSERR_INVALIDCALL)=="DSERR_INVALIDCALLS" and snd.DSoundError(0)=="unknown","released error strings retained")
  print("PASS: "+str(count)+" Win32 DirectSound contracts / 8 symbols");return 0
end function
