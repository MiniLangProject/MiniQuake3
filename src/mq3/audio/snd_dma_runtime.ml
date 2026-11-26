// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/client/snd_dma.c state adapter over the native mixer modules.
package mq3.audio.snd_dma_runtime
import mq3.audio.snd_channels as channels
import mq3.audio.snd_spatialize as spatial
import mq3.audio.snd_loop_channels as loops
import mq3.audio.snd_raw_stream as raw
import mq3.compat.numeric as n

const MAX_GENTITIES=1024
const MAX_SFX=4096
const MAX_QPATH=64
/// Sfx record for audio.snd_dma_runtime, containing `handle`, `soundName`, `soundLength`, `soundData`, `defaultSound`, `inMemory`, and 2 further fields.
struct Sfx handle soundName soundLength soundData defaultSound inMemory soundCompressed lastTimeUsed end struct
/// Loop record for audio.snd_dma_runtime, containing `entity`, `origin`, `velocity`, `handle`, `realLoop`, `active`.
struct Loop entity origin velocity handle realLoop active end struct
/// Services record for audio.snd_dma_runtime, containing `initDmaFn`, `shutdownDmaFn`, `loadFn`, `startFn`, `localFn`, `paintFn`, and 4 further fields.
struct Services initDmaFn shutdownDmaFn loadFn startFn localFn paintFn musicFn stopMusicFn diagnosticFn context end struct
/// State record for audio.snd_dma_runtime, containing `services`, `started`, `muted`, `registered`, `soundTime`, `paintedTime`, and 14 further fields.
struct State services started muted registered soundTime paintedTime channels rawStream knownSfx loops origins listenerEntity listenerOrigin listenerAxis inWater backgroundIntro backgroundLoop backgroundActive nextHandle outputRate end struct

/// Create `mq3.audio.snd_dma_runtime.Services` with initDmaFn=void; shutdownDmaFn=void; loadFn=void; startFn=void; localFn=void; paintFn=void; musicFn=void; stopMusicFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void,void,void,void,void,void,void,void) end function
/// Compute audio.snd_dma_runtime.identityAxis as `[[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]`.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Create snd dma runtime in audio.snd_dma_runtime.
/// @param host Initial `services` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.State` record.
/// @param outputRate Initial `outputRate` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.State` record.
function create(host,outputRate)
 if host==void then host=services() end if;if outputRate<=0 then outputRate=22050 end if
 return State(host,false,true,false,0,0,channels.create(),raw.create(outputRate),[],[],array(MAX_GENTITIES,void),0,[0.0,0.0,0.0],identityAxis(),false,"","",false,1,outputRate)
end function
/// Compute lower in audio.snd_dma_runtime; the normal completion returns `decode(data)`.
/// @param value Value used in `bytes(value)`.
function lower(value) data=bytes(value);for i=0 to len(data)-1 if data[i]>=65 and data[i]<=90 then data[i]=data[i]+32 end if end for;return decode(data) end function
/// Compute audio.snd_dma_runtime.same as `(lower(a) == lower(b))`.
/// @param a Value passed as `value` to `mq3.audio.snd_dma_runtime.lower`.
/// @param b Value passed as `value` to `mq3.audio.snd_dma_runtime.lower`.
function same(a,b) return lower(a)==lower(b) end function
/// Compute audio.snd_dma_runtime.copy3 as `[value[0], value[1], value[2]]`.
/// @param value Value used in `value[0]` and `value[1]`.
function copy3(value) return [value[0],value[1],value[2]] end function
/// Compute diagnostic in audio.snd_dma_runtime.
/// @param state Record exposing `services`.
/// @param text Text used in `state.services.diagnosticFn(state.services.context, text)`.
function diagnostic(state,text) if state!=void and state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,text) end if;return void end function

/// Apply `mq3.compat.numeric.i32` for f get little long in audio.snd_dma_runtime.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function FGetLittleLong(data,offset) if data==void or offset<0 or offset+4>len(data) then return 0 end if;return n.i32(data[offset]|(data[offset+1]<<8)|(data[offset+2]<<16)|(data[offset+3]<<24)) end function
/// Compute f get little short in audio.snd_dma_runtime; the normal completion returns `n.i16((data[offset] | (data[(offset + 1)] << 8)))`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function FGetLittleShort(data,offset) if data==void or offset<0 or offset+2>len(data) then return 0 end if;return n.i16(data[offset]|(data[offset+1]<<8)) end function
/// Compute hash sfx name in audio.snd_dma_runtime; the normal completion returns `(hash & 127)`.
/// @param name Name used in `bytes(name)` and `(name == void)`.
function S_HashSFXName(name) if name==void then return 0 end if;data=bytes(name);hash=0;i=0;while i<len(data) letter=data[i];if letter>=65 and letter<=90 then letter=letter+32 end if;if letter==46 then break end if;if letter==92 then letter=47 end if;hash=hash+letter*(i+119);i=i+1 end while;return hash&127 end function
/// Find name in audio.snd_dma_runtime; the normal completion returns `sound`.
///
/// Direct state writes: `state.nextHandle`, `state.knownSfx`.
/// @param state Record exposing `knownSfx`, `nextHandle`. Updated in place: `nextHandle`, `knownSfx`.
/// @param name B passed as `b` to `mq3.audio.snd_dma_runtime.same`.
function S_FindName(state,name)
 if state==void or name==void or name=="" or len(bytes(name))>=MAX_QPATH then return void end if
 for each sound in state.knownSfx if same(sound.soundName,name) then return sound end if end for
 if len(state.knownSfx)>=MAX_SFX then return void end if;sound=Sfx(state.nextHandle,name,0,void,false,false,false,0);state.nextHandle=state.nextHandle+1;state.knownSfx=state.knownSfx+[sound];return sound
end function
/// Update `sound.soundLength`, `sound.soundData`, `sound.defaultSound`, `sound.inMemory` in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `sound.soundLength`, `sound.soundData`, `sound.defaultSound`, `sound.inMemory`.
/// @param sound Record exposing `soundData`. Updated in place: `soundLength`, `soundData`, `defaultSound`, `inMemory`.
function S_DefaultSound(sound) if sound==void then return false end if;sound.soundLength=512;sound.soundData=array(512,0);for i=0 to 511 sound.soundData[i]=i end for;sound.defaultSound=true;sound.inMemory=true;return true end function
/// Update `sound.soundData`, `sound.soundLength`, `sound.defaultSound`, `sound.inMemory` in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `sound.soundData`, `sound.soundLength`, `sound.defaultSound`, `sound.inMemory`.
/// @param state Record exposing `services`.
/// @param sound Record exposing `soundName`. Updated in place: `soundData`, `soundLength`, `defaultSound`, `inMemory`.
function S_memoryLoad(state,sound)
 if state==void or sound==void then return false end if;loaded=void;if state.services.loadFn!=void then loaded=state.services.loadFn(state.services.context,sound.soundName) end if
 if loaded==void then S_DefaultSound(sound);return false end if;sound.soundData=loaded;if typeof(loaded)=="bytes" then sound.soundLength=len(loaded) else sound.soundLength=len(loaded) end if;sound.defaultSound=false;sound.inMemory=true;return true
end function
/// Test free oldest sound in audio.snd_dma_runtime; the normal completion returns `true`.
/// @param state Record exposing `knownSfx`.
function S_FreeOldestSound(state) oldest=void;for each sound in state.knownSfx if sound.inMemory and (oldest==void or sound.lastTimeUsed<oldest.lastTimeUsed) then oldest=sound end if end for;if oldest==void then return false end if;oldest.soundData=void;oldest.inMemory=false;return true end function
/// Register sound in audio.snd_dma_runtime; the normal completion returns `sound.handle`.
/// @param state Record exposing `started`.
/// @param name Name passed as `name` to `mq3.audio.snd_dma_runtime.S_FindName`.
/// @param compressed Reserved argument; this implementation does not read its value.
function S_RegisterSound(state,name,compressed) if state==void or not state.started or name==void or len(bytes(name))>=MAX_QPATH then return 0 end if;sound=S_FindName(state,name);if sound==void then return 0 end if;if sound.soundData==void then sound.soundCompressed=false;S_memoryLoad(state,sound) end if;if sound.defaultSound then return 0 end if;return sound.handle end function
/// Begin registration in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.muted`, `state.registered`.
/// @param state Record exposing `knownSfx`. Updated in place: `muted`, `registered`.
function S_BeginRegistration(state) if state==void then return false end if;state.muted=false;state.registered=true;if len(state.knownSfx)==0 then S_RegisterSound(state,"sound/feedback/hit.wav",false) end if;return true end function
/// Update `state.started`, `state.muted`, `state.soundTime`, `state.paintedTime` in audio.snd_dma_runtime; the normal completion returns `ok`.
///
/// Direct state writes: `state.started`, `state.muted`, `state.soundTime`, `state.paintedTime`.
/// @param state Record exposing `services`, `outputRate`. Updated in place: `started`, `muted`, `soundTime`, `paintedTime`.
function S_Init(state) if state==void then return false end if;ok=true;if state.services.initDmaFn!=void then ok=state.services.initDmaFn(state.services.context,state.outputRate) end if;state.started=ok;state.muted=ok;state.soundTime=0;state.paintedTime=0;S_ChannelSetup(state);S_StopAllSounds(state);return ok end function
/// Update `state.started`, `state.muted` in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.started`, `state.muted`.
/// @param state Record exposing `started`, `services`. Updated in place: `started`, `muted`.
function S_Shutdown(state) if state==void or not state.started then return false end if;if state.services.shutdownDmaFn!=void then state.services.shutdownDmaFn(state.services.context) end if;state.started=false;state.muted=true;return true end function
/// Update `state.muted` in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.muted`.
/// @param state Updated in place: `muted`.
function S_DisableSounds(state) S_StopAllSounds(state);state.muted=true;return true end function
/// Update `state.channels` in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.channels`.
/// @param state Updated in place: `channels`.
function S_ChannelSetup(state) state.channels=channels.create();return true end function
/// Return `mq3.audio.snd_channels.start(state.channels, entity, handle, entityChannel)` from `audio.snd_dma_runtime.S_ChannelMalloc`.
/// @param state Record exposing `channels`.
/// @param entity Entity passed as `entity` to `mq3.audio.snd_channels.start`.
/// @param handle Handle passed as `handle` to `mq3.audio.snd_channels.start`.
/// @param entityChannel Entchannel passed as `entchannel` to `mq3.audio.snd_channels.start`.
function S_ChannelMalloc(state,entity,handle,entityChannel) return channels.start(state.channels,entity,handle,entityChannel) end function
/// Return `mq3.audio.snd_channels.release(state.channels, slot)` from `audio.snd_dma_runtime.S_ChannelFree`.
/// @param state Record exposing `channels`.
/// @param slot Slot passed as `slot` to `mq3.audio.snd_channels.release`.
function S_ChannelFree(state,slot) return channels.release(state.channels,slot) end function
/// Return `mq3.audio.snd_channels.activeCount(state.channels)` from `audio.snd_dma_runtime.S_ChannelSetupResult`.
/// @param state Record exposing `channels`.
function S_ChannelSetupResult(state) return channels.activeCount(state.channels) end function

/// Start sound in audio.snd_dma_runtime; the normal completion returns `selected.accepted`.
/// @param state Record exposing `started`, `muted`, `channels`, `services`.
/// @param origin Origin used in `state.services.startFn(state.services.context, origin, entity, entityChannel, handle)`.
/// @param entity Entity passed as `entity` to `mq3.audio.snd_channels.start`.
/// @param entityChannel Entchannel passed as `entchannel` to `mq3.audio.snd_channels.start`.
/// @param handle Handle passed as `handle` to `mq3.audio.snd_channels.start`.
function S_StartSound(state,origin,entity,entityChannel,handle) if state==void or not state.started or state.muted then return false end if;selected=channels.start(state.channels,entity,handle,entityChannel);if selected.accepted and state.services.startFn!=void then state.services.startFn(state.services.context,origin,entity,entityChannel,handle) end if;return selected.accepted end function
/// Start local sound in audio.snd_dma_runtime; the normal completion returns `true`.
/// @param state Record exposing `started`, `muted`, `services`.
/// @param handle Handle used in `state.services.localFn(state.services.context, handle, channel)`.
/// @param channel Channel used in `state.services.localFn(state.services.context, handle, channel)`.
function S_StartLocalSound(state,handle,channel) if state==void or not state.started or state.muted then return false end if;if state.services.localFn!=void then state.services.localFn(state.services.context,handle,channel) end if;return true end function
/// Update entity position in audio.snd_dma_runtime; the normal completion returns `true`.
/// @param state Record exposing `origins`, `loops`.
/// @param entity Entity used in `(entity < 0)` and `(lp.entity == entity)`.
/// @param origin Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`.
function S_UpdateEntityPosition(state,entity,origin) if state==void or entity<0 or entity>=MAX_GENTITIES or origin==void or len(origin)!=3 then return false end if;state.origins[entity]=copy3(origin);for each lp in state.loops if lp.entity==entity then lp.origin=copy3(origin) end if end for;return true end function
/// Clear looping sounds in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.loops`.
/// @param state Record exposing `loops`. Updated in place: `loops`.
/// @param killAll Kill all operand used by `S_ClearLoopingSounds`; its reads are shown in the implementation.
function S_ClearLoopingSounds(state,killAll) if state==void then return false end if;kept=[];if not killAll then for each lp in state.loops if lp.realLoop and lp.active then kept=kept+[lp] end if end for end if;state.loops=kept;return true end function
/// Set loop in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.loops`.
/// @param state Record exposing `loops`. Updated in place: `loops`.
/// @param entity Initial `entity` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.Loop` record.
/// @param origin Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`.
/// @param velocity Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`.
/// @param handle Initial `handle` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.Loop` record.
/// @param realLoop Initial `realLoop` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.Loop` record.
function setLoop(state,entity,origin,velocity,handle,realLoop)
 if state==void or entity<0 or entity>=MAX_GENTITIES or origin==void or len(origin)!=3 then return false end if;existing=void;for each lp in state.loops if lp.entity==entity then existing=lp end if end for
 if existing==void then state.loops=state.loops+[Loop(entity,copy3(origin),copy3(velocity),handle,realLoop,true)] else existing.origin=copy3(origin);existing.velocity=copy3(velocity);existing.handle=handle;existing.realLoop=realLoop;existing.active=true end if;return true
end function
/// Return `mq3.audio.snd_dma_runtime.setLoop(state, entity, origin, velocity, handle, false)` from `audio.snd_dma_runtime.S_AddLoopingSound`.
/// @param state State passed as `state` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param entity Entity passed as `entity` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param origin Origin passed as `origin` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param velocity Velocity passed as `velocity` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param handle Handle passed as `handle` to `mq3.audio.snd_dma_runtime.setLoop`.
function S_AddLoopingSound(state,entity,origin,velocity,handle) return setLoop(state,entity,origin,velocity,handle,false) end function
/// Return `mq3.audio.snd_dma_runtime.setLoop(state, entity, origin, velocity, handle, true)` from `audio.snd_dma_runtime.S_AddRealLoopingSound`.
/// @param state State passed as `state` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param entity Entity passed as `entity` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param origin Origin passed as `origin` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param velocity Velocity passed as `velocity` to `mq3.audio.snd_dma_runtime.setLoop`.
/// @param handle Handle passed as `handle` to `mq3.audio.snd_dma_runtime.setLoop`.
function S_AddRealLoopingSound(state,entity,origin,velocity,handle) return setLoop(state,entity,origin,velocity,handle,true) end function
/// Stop looping sound in audio.snd_dma_runtime; the normal completion returns `found`.
///
/// Direct state writes: `state.loops`.
/// @param state Record exposing `loops`. Updated in place: `loops`.
/// @param entity Entity used in `(lp.entity == entity)`.
function S_StopLoopingSound(state,entity) kept=[];found=false;for each lp in state.loops if lp.entity==entity then found=true else kept=kept+[lp] end if end for;state.loops=kept;return found end function
/// Add loop sounds in audio.snd_dma_runtime; the normal completion returns `loops.build(entries, state.listenerOrigin, state.listenerAxis)`.
/// @param state Record exposing `loops`, `listenerOrigin`, `listenerAxis`.
function S_AddLoopSounds(state) entries=[];for each lp in state.loops entries=entries+[loops.Entry(lp.entity,lp.handle,lp.origin,lp.realLoop,false,1.0,1.0,lp.active)] end for;return loops.build(entries,state.listenerOrigin,state.listenerAxis) end function
/// Return `mq3.audio.snd_spatialize.spatialize(origin, state.listenerOrigin, state.listenerAxis, masterVolume, 2)` from `audio.snd_dma_runtime.S_SpatializeOrigin`.
/// @param state Record exposing `listenerOrigin`, `listenerAxis`.
/// @param origin Origin passed as `origin` to `mq3.audio.snd_spatialize.spatialize`.
/// @param masterVolume Master volume passed as `masterVolume` to `mq3.audio.snd_spatialize.spatialize`.
function S_SpatializeOrigin(state,origin,masterVolume) return spatial.spatialize(origin,state.listenerOrigin,state.listenerAxis,masterVolume,2) end function
/// Update `state.listenerEntity`, `state.listenerOrigin`, `state.listenerAxis`, `state.inWater` in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.listenerEntity`, `state.listenerOrigin`, `state.listenerAxis`, `state.inWater`.
/// @param state Record exposing `channels`. Updated in place: `listenerEntity`, `listenerOrigin`, `listenerAxis`, `inWater`.
/// @param entity Entity passed as `entity` to `mq3.audio.snd_channels.setListener`.
/// @param head Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`.
/// @param axis Axis used in `(axis == void)` and `(((state == void) or (head == void)) or (axis == void))`.
/// @param inWater In water operand used by `S_Respatialize`; its reads are shown in the implementation.
function S_Respatialize(state,entity,head,axis,inWater) if state==void or head==void or axis==void then return false end if;state.listenerEntity=entity;state.listenerOrigin=copy3(head);state.listenerAxis=axis;state.inWater=inWater;channels.setListener(state.channels,entity);S_AddLoopSounds(state);return true end function
/// Compute audio.snd_dma_runtime.S_ScanChannelStarts as `(channels.activeCount(state.channels) > 0)`.
/// @param state Record exposing `channels`.
function S_ScanChannelStarts(state) return channels.activeCount(state.channels)>0 end function
/// Get soundtime in audio.snd_dma_runtime; the normal completion returns `state.soundTime`.
/// @param state Record exposing `soundTime`.
function S_GetSoundtime(state) if state==void then return 0 end if;return state.soundTime end function
/// Get raw sample pointer in audio.snd_dma_runtime; the normal completion returns `state.rawStream`.
/// @param state Record exposing `rawStream`.
function S_GetRawSamplePointer(state) if state==void then return void end if;return state.rawStream end function
/// Compute audio.snd_dma_runtime.S_ByteSwapRawSamples as `data`.
/// @param samples Reserved argument; this implementation does not read its value.
/// @param width Reserved argument; this implementation does not read its value.
/// @param soundChannels Reserved argument; this implementation does not read its value.
/// @param data Value returned unchanged by this function.
function S_ByteSwapRawSamples(samples,width,soundChannels,data) return data end function
/// Compute raw samples in audio.snd_dma_runtime; the normal completion returns `raw.enqueue(state.rawStream, samples, rate, width, soundChannels, data, volume)`.
/// @param state Record exposing `started`, `muted`, `rawStream`, `soundTime`.
/// @param samples Samples passed as `samples` to `mq3.audio.snd_raw_stream.enqueue`.
/// @param rate Rate passed as `rate` to `mq3.audio.snd_raw_stream.enqueue`.
/// @param width Width passed as `width` to `mq3.audio.snd_raw_stream.enqueue`.
/// @param soundChannels Channels passed as `channels` to `mq3.audio.snd_raw_stream.enqueue`.
/// @param data Data passed as `data` to `mq3.audio.snd_raw_stream.enqueue`.
/// @param volume Volume passed as `volume` to `mq3.audio.snd_raw_stream.enqueue`.
function S_RawSamples(state,samples,rate,width,soundChannels,data,volume) if state==void or not state.started or state.muted then return 0 end if;raw.setSoundTime(state.rawStream,state.soundTime);return raw.enqueue(state.rawStream,samples,rate,width,soundChannels,data,volume) end function
/// Clear sound buffer in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.rawStream`, `state.soundTime`, `state.paintedTime`.
/// @param state Record exposing `outputRate`. Updated in place: `rawStream`, `soundTime`, `paintedTime`.
function S_ClearSoundBuffer(state) if state==void then return false end if;state.rawStream=raw.create(state.outputRate);state.soundTime=0;state.paintedTime=0;return true end function
/// Stop all sounds in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.loops`, `state.channels`, `state.backgroundActive`.
/// @param state Updated in place: `loops`, `channels`, `backgroundActive`.
function S_StopAllSounds(state) if state==void then return false end if;state.loops=[];state.channels=channels.create();state.backgroundActive=false;S_ClearSoundBuffer(state);return true end function
/// Update snd dma runtime in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.soundTime`, `state.paintedTime`.
/// @param state Record exposing `started`, `soundTime`, `outputRate`, `paintedTime`, `services`. Updated in place: `soundTime`, `paintedTime`.
/// @param milliseconds Milliseconds used in `(milliseconds < 0)` and `(milliseconds * state.outputRate)`.
function S_Update_(state,milliseconds) if state==void or not state.started then return false end if;if milliseconds<0 then milliseconds=0 end if;state.soundTime=state.soundTime+n.quotient(milliseconds*state.outputRate,1000);if state.paintedTime<state.soundTime then state.paintedTime=state.soundTime end if;if state.services.paintFn!=void then state.services.paintFn(state.services.context,state) end if;return true end function
/// Update snd dma runtime in audio.snd_dma_runtime; the normal completion returns `S_Update_(state, milliseconds)`.
/// @param state State passed as `state` to `mq3.audio.snd_dma_runtime.S_Respatialize`.
/// @param entity Entity passed as `entity` to `mq3.audio.snd_dma_runtime.S_Respatialize`.
/// @param head Head passed as `head` to `mq3.audio.snd_dma_runtime.S_Respatialize`.
/// @param axis Axis passed as `axis` to `mq3.audio.snd_dma_runtime.S_Respatialize`.
/// @param inWater In water passed as `inWater` to `mq3.audio.snd_dma_runtime.S_Respatialize`.
/// @param milliseconds Milliseconds passed as `milliseconds` to `mq3.audio.snd_dma_runtime.S_Update_`.
function S_Update(state,entity,head,axis,inWater,milliseconds) if not S_Respatialize(state,entity,head,axis,inWater) then return false end if;return S_Update_(state,milliseconds) end function

/// Find wav chunk in audio.snd_dma_runtime; the normal completion returns `[length, (offset + 8)]`.
/// @param data Data passed as `data` to `mq3.audio.snd_dma_runtime.FGetLittleLong`.
/// @param offset Offset used in `(offset < 0)` and `(offset + 8)`.
/// @param chunk Chunk used in `(name != chunk)`.
function S_FindWavChunk(data,offset,chunk) if data==void or offset<0 or offset+8>len(data) then return [0,offset] end if;name=decode(slice(data,offset,4));length=FGetLittleLong(data,offset+4);if length<0 or length>0x0fffffff then return [0,offset+8] end if;length=(length+1)&(-2);if name!=chunk then return [0,offset+8+length] end if;return [length,offset+8] end function
/// Start background track in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.backgroundIntro`, `state.backgroundLoop`, `state.backgroundActive`.
/// @param state Record exposing `services`. Updated in place: `backgroundIntro`, `backgroundLoop`, `backgroundActive`.
/// @param intro Intro used in `(intro == "")` and `(intro == void)`.
/// @param trackLoop Track loop used in `(trackLoop == "")` and `(trackLoop == void)`.
function S_StartBackgroundTrack(state,intro,trackLoop) if state==void then return false end if;if intro==void then intro="" end if;if trackLoop==void or trackLoop=="" then trackLoop=intro end if;if intro=="" then return true end if;state.backgroundIntro=intro;state.backgroundLoop=trackLoop;state.backgroundActive=true;if state.services.musicFn!=void then state.services.musicFn(state.services.context,intro,trackLoop) end if;return true end function
/// Stop background track in audio.snd_dma_runtime; the normal completion returns `true`.
///
/// Direct state writes: `state.backgroundActive`, `state.backgroundIntro`, `state.backgroundLoop`.
/// @param state Record exposing `services`. Updated in place: `backgroundActive`, `backgroundIntro`, `backgroundLoop`.
function S_StopBackgroundTrack(state) if state==void then return false end if;state.backgroundActive=false;state.backgroundIntro="";state.backgroundLoop="";if state.services.stopMusicFn!=void then state.services.stopMusicFn(state.services.context) end if;return true end function
/// Compute audio.snd_dma_runtime.S_UpdateBackgroundTrack as `((state != void) and state.backgroundActive)`.
/// @param state Record exposing `backgroundActive`.
function S_UpdateBackgroundTrack(state) return state!=void and state.backgroundActive end function
/// Compute play f in audio.snd_dma_runtime; the normal completion returns `played`.
/// @param state State passed as `state` to `mq3.audio.snd_dma_runtime.S_RegisterSound`.
/// @param names Names used in `(names == void)`.
function S_Play_f(state,names) if names==void then return 0 end if;played=0;for each name in names path=name;if len(bytes(path))<4 or lower(decode(slice(bytes(path),len(bytes(path))-4,4)))!=".wav" then path=path+".wav" end if;handle=S_RegisterSound(state,path,false);if handle!=0 and S_StartLocalSound(state,handle,0) then played=played+1 end if end for;return played end function
/// Return `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack(state, intro, trackLoop)` from `audio.snd_dma_runtime.S_Music_f`.
/// @param state State passed as `state` to `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack`.
/// @param intro Intro passed as `intro` to `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack`.
/// @param trackLoop Track loop passed as `trackLoop` to `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack`.
function S_Music_f(state,intro,trackLoop) return S_StartBackgroundTrack(state,intro,trackLoop) end function
/// Compute sound info f in audio.snd_dma_runtime; the normal completion returns `[state.started, state.muted, state.outputRate, state.soundTime, state.paintedTime, state.backgroundActive]`.
/// @param state Record exposing `started`, `muted`, `outputRate`, `soundTime`, `paintedTime`, `backgroundActive`.
function S_SoundInfo_f(state) if state==void then return void end if;return [state.started,state.muted,state.outputRate,state.soundTime,state.paintedTime,state.backgroundActive] end function
/// Compute sound list f in audio.snd_dma_runtime; the normal completion returns `result`.
/// @param state Record exposing `knownSfx`.
function S_SoundList_f(state) if state==void then return [] end if;result=[];for each sound in state.knownSfx result=result+[[sound.handle,sound.soundLength,sound.inMemory,sound.soundName]] end for;return result end function
