import mq3.audio.snd_dma_runtime as s

struct Context initialized shutdowns starts locals music stops paints loads end struct
function req(ok,message) if not ok then return error(7664,message) end if;return 1 end function
function initDma(context,rate) context.initialized=rate;return true end function
function shutdownDma(context) context.shutdowns=context.shutdowns+1;return void end function
function loadSound(context,name) context.loads=context.loads+[name];if name=="sound/live.wav" then return bytes([1,2,3,4]) end if;return void end function
function startSound(context,origin,entity,channel,handle) context.starts=context.starts+[[entity,channel,handle]];return void end function
function localSound(context,handle,channel) context.locals=context.locals+[[handle,channel]];return void end function
function paint(context,state) context.paints=context.paints+1;return void end function
function music(context,intro,trackLoop) context.music=context.music+[[intro,trackLoop]];return void end function
function stopMusic(context) context.stops=context.stops+1;return void end function
function fixture()
 context=Context(0,0,[],[],[],0,0,[])
 host=s.services();host.context=context;host.initDmaFn=initDma;host.shutdownDmaFn=shutdownDma;host.loadFn=loadSound;host.startFn=startSound;host.localFn=localSound;host.paintFn=paint;host.musicFn=music;host.stopMusicFn=stopMusic
 return [s.create(host,22050),context]
end function
function main(args)
 count=0;pair=fixture();state=pair[0];context=pair[1]
 count=count+req(s.S_HashSFXName("Sound\\Weapons.ogg")==s.S_HashSFXName("sound/weapons.wav"),"hash normalization")
 count=count+req(s.FGetLittleLong(bytes([120,86,52,18]),0)==305419896,"little long")
 count=count+req(s.FGetLittleShort(bytes([52,18]),0)==4660,"little short")
 count=count+req(s.S_Init(state) and state.started and state.muted and context.initialized==22050,"DMA init")
 count=count+req(s.S_BeginRegistration(state) and not state.muted and state.registered,"registration unmutes")
 missing=s.S_RegisterSound(state,"sound/missing.wav",false);count=count+req(missing==0,"missing asset uses default sound")
 handle=s.S_RegisterSound(state,"sound/live.wav",false);count=count+req(handle>0 and len(context.loads)==3,"host asset load")
 count=count+req(s.S_RegisterSound(state,"SOUND/LIVE.WAV",false)==handle,"case-insensitive sound reuse")
 count=count+req(s.S_StartSound(state,[1.0,2.0,3.0],7,2,handle) and len(context.starts)==1,"one-shot starts through host")
 count=count+req(s.S_StartLocalSound(state,handle,4) and context.locals==[[handle,4]],"local sound through host")
 count=count+req(s.S_UpdateEntityPosition(state,7,[4.0,5.0,6.0]) and state.origins[7]==[4.0,5.0,6.0],"entity position")
 count=count+req(s.S_AddLoopingSound(state,7,[4.0,5.0,6.0],[1.0,0.0,0.0],handle) and len(state.loops)==1,"ordinary loop")
 count=count+req(s.S_AddRealLoopingSound(state,8,[8.0,0.0,0.0],[0.0,0.0,0.0],handle) and len(s.S_AddLoopSounds(state))==1,"real loop groups by sound")
 count=count+req(s.S_StopLoopingSound(state,7) and len(state.loops)==1,"loop stop by entity")
 count=count+req(s.S_ClearLoopingSounds(state,false) and len(state.loops)==1,"real loop survives non-kill clear")
 count=count+req(s.S_Respatialize(state,8,[0.0,0.0,0.0],s.identityAxis(),false) and state.listenerEntity==8,"listener update")
 count=count+req(s.S_RawSamples(state,2,22050,2,2,bytes([1,0,2,0,3,0,4,0]),1.0)==2 and state.rawStream.rawEnd==2,"stereo PCM stream")
 count=count+req(s.S_Update_(state,100) and state.soundTime==2205 and context.paints==1,"sound clock and paint callback")
 chunk=s.S_FindWavChunk(bytes([100,97,116,97,3,0,0,0,1,2,3,0]),0,"data");count=count+req(chunk==[4,8],"RIFF chunk padding")
 count=count+req(s.S_StartBackgroundTrack(state,"music/intro.wav","music/loop.wav") and context.music==[["music/intro.wav","music/loop.wav"]],"music start")
 count=count+req(s.S_UpdateBackgroundTrack(state) and s.S_StopBackgroundTrack(state) and context.stops==1,"music update and stop")
 count=count+req(len(s.S_SoundList_f(state))>=3 and len(s.S_SoundInfo_f(state))==6,"sound diagnostics")
 count=count+req(s.S_StopAllSounds(state) and len(state.loops)==0 and state.rawStream.rawEnd==0,"stop all clears playback")
 count=count+req(s.S_DisableSounds(state) and state.muted,"disable sounds")
 count=count+req(s.S_Shutdown(state) and context.shutdowns==1 and not state.started,"DMA shutdown")
 print("PASS: "+str(count)+" snd dma runtime contracts");return 0
end function
