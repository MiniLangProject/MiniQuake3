# `src/mq3/audio/snd_dma_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_dma_runtime`](Package-mq3-audio-snd-dma-runtime-1768443115.md)

Reachable from entry: **no**

## Imports

- `mq3/audio/snd_channels.ml` as `channels` → [src/mq3/audio/snd_channels.ml](File-src-mq3-audio-snd-channels-ml-1574683136.md)
- `mq3/audio/snd_loop_channels.ml` as `loops` → [src/mq3/audio/snd_loop_channels.ml](File-src-mq3-audio-snd-loop-channels-ml-1602965463.md)
- `mq3/audio/snd_raw_stream.ml` as `raw` → [src/mq3/audio/snd_raw_stream.ml](File-src-mq3-audio-snd-raw-stream-ml-887602525.md)
- `mq3/audio/snd_spatialize.ml` as `spatial` → [src/mq3/audio/snd_spatialize.ml](File-src-mq3-audio-snd-spatialize-ml-2009248822.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-snd-dma-runtime-copy3-function-copy3-value-src-mq3-audio-snd-dma-runtime-ml-352082351"></a>
### copy3

```ml
function copy3(value)
```

Compute audio.snd_dma_runtime.copy3 as `[value[0], value[1], value[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `value[0]` and `value[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L138)

<a id="function-function-mq3-audio-snd-dma-runtime-create-function-create-host-outputrate-src-mq3-audio-snd-dma-runtime-ml-600227689"></a>
### create

```ml
function create(host, outputRate)
```

Create snd dma runtime in audio.snd_dma_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Initial `services` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.State` record. |
| `outputRate` | `dynamic` | — | Initial `outputRate` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L125)

<a id="function-function-mq3-audio-snd-dma-runtime-diagnostic-function-diagnostic-state-text-src-mq3-audio-snd-dma-runtime-ml-523144964"></a>
### diagnostic

```ml
function diagnostic(state, text)
```

Compute diagnostic in audio.snd_dma_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `text` | `dynamic` | — | Text used in `state.services.diagnosticFn(state.services.context, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L142)

<a id="function-function-mq3-audio-snd-dma-runtime-fgetlittlelong-function-fgetlittlelong-data-offset-src-mq3-audio-snd-dma-runtime-ml-1199503175"></a>
### FGetLittleLong

```ml
function FGetLittleLong(data, offset)
```

Apply `mq3.compat.numeric.i32` for f get little long in audio.snd_dma_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L147)

<a id="function-function-mq3-audio-snd-dma-runtime-fgetlittleshort-function-fgetlittleshort-data-offset-src-mq3-audio-snd-dma-runtime-ml-46414071"></a>
### FGetLittleShort

```ml
function FGetLittleShort(data, offset)
```

Compute f get little short in audio.snd_dma_runtime; the normal completion returns `n.i16((data[offset] | (data[(offset + 1)] << 8)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L151)

<a id="function-function-mq3-audio-snd-dma-runtime-identityaxis-function-identityaxis-src-mq3-audio-snd-dma-runtime-ml-722236480"></a>
### identityAxis

```ml
function identityAxis()
```

Compute audio.snd_dma_runtime.identityAxis as `[[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L121)

- [mq3.audio.snd_dma_runtime.Loop](Type-mq3-audio-snd-dma-runtime-loop-633949621.md) — struct
<a id="function-function-mq3-audio-snd-dma-runtime-lower-function-lower-value-src-mq3-audio-snd-dma-runtime-ml-30976109"></a>
### lower

```ml
function lower(value)
```

Compute lower in audio.snd_dma_runtime; the normal completion returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `bytes(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L131)

<a id="constant-constant-mq3-audio-snd-dma-runtime-max-gentities-const-max-gentities-1024-src-mq3-audio-snd-dma-runtime-ml-278505084"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```

Number of game-entity slots whose origins can drive spatial sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L12)

<a id="constant-constant-mq3-audio-snd-dma-runtime-max-qpath-const-max-qpath-64-src-mq3-audio-snd-dma-runtime-ml-410983707"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Maximum length of a Quake asset path in the sound registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L16)

<a id="constant-constant-mq3-audio-snd-dma-runtime-max-sfx-const-max-sfx-4096-src-mq3-audio-snd-dma-runtime-ml-1335007656"></a>
### MAX_SFX

```ml
const MAX_SFX = 4096
```

Maximum number of registered sound-effect descriptors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L14)

<a id="function-function-mq3-audio-snd-dma-runtime-s-addloopingsound-function-s-addloopingsound-state-entity-origin-velocity-handle-src-mq3-audio-snd-dma-runtime-ml-1074142203"></a>
### S_AddLoopingSound

```ml
function S_AddLoopingSound(state, entity, origin, velocity, handle)
```

Return `mq3.audio.snd_dma_runtime.setLoop(state, entity, origin, velocity, handle, false)` from `audio.snd_dma_runtime.S_AddLoopingSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `velocity` | `dynamic` | — | Velocity passed as `velocity` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.snd_dma_runtime.setLoop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L268)

<a id="function-function-mq3-audio-snd-dma-runtime-s-addloopsounds-function-s-addloopsounds-state-src-mq3-audio-snd-dma-runtime-ml-1237206617"></a>
### S_AddLoopSounds

```ml
function S_AddLoopSounds(state)
```

Add loop sounds in audio.snd_dma_runtime; the normal completion returns `loops.build(entries, state.listenerOrigin, state.listenerAxis)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`, `listenerOrigin`, `listenerAxis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L284)

<a id="function-function-mq3-audio-snd-dma-runtime-s-addrealloopingsound-function-s-addrealloopingsound-state-entity-origin-velocity-handle-src-mq3-audio-snd-dma-runtime-ml-305990699"></a>
### S_AddRealLoopingSound

```ml
function S_AddRealLoopingSound(state, entity, origin, velocity, handle)
```

Return `mq3.audio.snd_dma_runtime.setLoop(state, entity, origin, velocity, handle, true)` from `audio.snd_dma_runtime.S_AddRealLoopingSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `velocity` | `dynamic` | — | Velocity passed as `velocity` to `mq3.audio.snd_dma_runtime.setLoop`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.snd_dma_runtime.setLoop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L275)

<a id="function-function-mq3-audio-snd-dma-runtime-s-beginregistration-function-s-beginregistration-state-src-mq3-audio-snd-dma-runtime-ml-33701011"></a>
### S_BeginRegistration

```ml
function S_BeginRegistration(state)
```

Begin registration in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.muted`, `state.registered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `knownSfx`. Updated in place: `muted`, `registered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L191)

<a id="function-function-mq3-audio-snd-dma-runtime-s-byteswaprawsamples-function-s-byteswaprawsamples-samples-width-soundchannels-data-src-mq3-audio-snd-dma-runtime-ml-1471168222"></a>
### S_ByteSwapRawSamples

```ml
function S_ByteSwapRawSamples(samples, width, soundChannels, data)
```

Compute audio.snd_dma_runtime.S_ByteSwapRawSamples as `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `width` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `soundChannels` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `data` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L313)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelfree-function-s-channelfree-state-slot-src-mq3-audio-snd-dma-runtime-ml-1253356513"></a>
### S_ChannelFree

```ml
function S_ChannelFree(state, slot)
```

Return `mq3.audio.snd_channels.release(state.channels, slot)` from `audio.snd_dma_runtime.S_ChannelFree`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`. |
| `slot` | `dynamic` | — | Slot passed as `slot` to `mq3.audio.snd_channels.release`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L221)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelmalloc-function-s-channelmalloc-state-entity-handle-entitychannel-src-mq3-audio-snd-dma-runtime-ml-1648672284"></a>
### S_ChannelMalloc

```ml
function S_ChannelMalloc(state, entity, handle, entityChannel)
```

Return `mq3.audio.snd_channels.start(state.channels, entity, handle, entityChannel)` from `audio.snd_dma_runtime.S_ChannelMalloc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_channels.start`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.snd_channels.start`. |
| `entityChannel` | `dynamic` | — | Entchannel passed as `entchannel` to `mq3.audio.snd_channels.start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L217)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelsetup-function-s-channelsetup-state-src-mq3-audio-snd-dma-runtime-ml-319257263"></a>
### S_ChannelSetup

```ml
function S_ChannelSetup(state)
```

Update `state.channels` in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.channels`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `channels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L211)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelsetupresult-function-s-channelsetupresult-state-src-mq3-audio-snd-dma-runtime-ml-1878059071"></a>
### S_ChannelSetupResult

```ml
function S_ChannelSetupResult(state)
```

Return `mq3.audio.snd_channels.activeCount(state.channels)` from `audio.snd_dma_runtime.S_ChannelSetupResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L224)

<a id="function-function-mq3-audio-snd-dma-runtime-s-clearloopingsounds-function-s-clearloopingsounds-state-killall-src-mq3-audio-snd-dma-runtime-ml-474918136"></a>
### S_ClearLoopingSounds

```ml
function S_ClearLoopingSounds(state, killAll)
```

Clear looping sounds in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.loops`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`. Updated in place: `loops`. |
| `killAll` | `dynamic` | — | Kill all operand used by `S_ClearLoopingSounds`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L248)

<a id="function-function-mq3-audio-snd-dma-runtime-s-clearsoundbuffer-function-s-clearsoundbuffer-state-src-mq3-audio-snd-dma-runtime-ml-128035391"></a>
### S_ClearSoundBuffer

```ml
function S_ClearSoundBuffer(state)
```

Clear sound buffer in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.rawStream`, `state.soundTime`, `state.paintedTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `outputRate`. Updated in place: `rawStream`, `soundTime`, `paintedTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L327)

<a id="function-function-mq3-audio-snd-dma-runtime-s-defaultsound-function-s-defaultsound-sound-src-mq3-audio-snd-dma-runtime-ml-1156804485"></a>
### S_DefaultSound

```ml
function S_DefaultSound(sound)
```

Update `sound.soundLength`, `sound.soundData`, `sound.defaultSound`, `sound.inMemory` in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `sound.soundLength`, `sound.soundData`, `sound.defaultSound`, `sound.inMemory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record exposing `soundData`. Updated in place: `soundLength`, `soundData`, `defaultSound`, `inMemory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L169)

<a id="function-function-mq3-audio-snd-dma-runtime-s-disablesounds-function-s-disablesounds-state-src-mq3-audio-snd-dma-runtime-ml-746862871"></a>
### S_DisableSounds

```ml
function S_DisableSounds(state)
```

Update `state.muted` in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.muted`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `muted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L206)

<a id="function-function-mq3-audio-snd-dma-runtime-s-findname-function-s-findname-state-name-src-mq3-audio-snd-dma-runtime-ml-116318116"></a>
### S_FindName

```ml
function S_FindName(state, name)
```

Find name in audio.snd_dma_runtime; the normal completion returns `sound`.

Direct state writes: `state.nextHandle`, `state.knownSfx`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `knownSfx`, `nextHandle`. Updated in place: `nextHandle`, `knownSfx`. |
| `name` | `dynamic` | — | B passed as `b` to `mq3.audio.snd_dma_runtime.same`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L160)

<a id="function-function-mq3-audio-snd-dma-runtime-s-findwavchunk-function-s-findwavchunk-data-offset-chunk-src-mq3-audio-snd-dma-runtime-ml-1361978670"></a>
### S_FindWavChunk

```ml
function S_FindWavChunk(data, offset, chunk)
```

Find wav chunk in audio.snd_dma_runtime; the normal completion returns `[length, (offset + 8)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_dma_runtime.FGetLittleLong`. |
| `offset` | `dynamic` | — | Offset used in `(offset < 0)` and `(offset + 8)`. |
| `chunk` | `dynamic` | — | Chunk used in `(name != chunk)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L352)

<a id="function-function-mq3-audio-snd-dma-runtime-s-freeoldestsound-function-s-freeoldestsound-state-src-mq3-audio-snd-dma-runtime-ml-1838252507"></a>
### S_FreeOldestSound

```ml
function S_FreeOldestSound(state)
```

Test free oldest sound in audio.snd_dma_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `knownSfx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L181)

<a id="function-function-mq3-audio-snd-dma-runtime-s-getrawsamplepointer-function-s-getrawsamplepointer-state-src-mq3-audio-snd-dma-runtime-ml-186607305"></a>
### S_GetRawSamplePointer

```ml
function S_GetRawSamplePointer(state)
```

Get raw sample pointer in audio.snd_dma_runtime; the normal completion returns `state.rawStream`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawStream`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L307)

<a id="function-function-mq3-audio-snd-dma-runtime-s-getsoundtime-function-s-getsoundtime-state-src-mq3-audio-snd-dma-runtime-ml-1608390107"></a>
### S_GetSoundtime

```ml
function S_GetSoundtime(state)
```

Get soundtime in audio.snd_dma_runtime; the normal completion returns `state.soundTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `soundTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L304)

<a id="function-function-mq3-audio-snd-dma-runtime-s-hashsfxname-function-s-hashsfxname-name-src-mq3-audio-snd-dma-runtime-ml-793160779"></a>
### S_HashSFXName

```ml
function S_HashSFXName(name)
```

Compute hash sfx name in audio.snd_dma_runtime; the normal completion returns `(hash & 127)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)` and `(name == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L154)

<a id="function-function-mq3-audio-snd-dma-runtime-s-init-function-s-init-state-src-mq3-audio-snd-dma-runtime-ml-1570856655"></a>
### S_Init

```ml
function S_Init(state)
```

Update `state.started`, `state.muted`, `state.soundTime`, `state.paintedTime` in audio.snd_dma_runtime; the normal completion returns `ok`.

Direct state writes: `state.started`, `state.muted`, `state.soundTime`, `state.paintedTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`, `outputRate`. Updated in place: `started`, `muted`, `soundTime`, `paintedTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L196)

<a id="function-function-mq3-audio-snd-dma-runtime-s-memoryload-function-s-memoryload-state-sound-src-mq3-audio-snd-dma-runtime-ml-1149268888"></a>
### S_memoryLoad

```ml
function S_memoryLoad(state, sound)
```

Update `sound.soundData`, `sound.soundLength`, `sound.defaultSound`, `sound.inMemory` in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `sound.soundData`, `sound.soundLength`, `sound.defaultSound`, `sound.inMemory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `sound` | `dynamic` | — | Record exposing `soundName`. Updated in place: `soundData`, `soundLength`, `defaultSound`, `inMemory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L175)

<a id="function-function-mq3-audio-snd-dma-runtime-s-music-f-function-s-music-f-state-intro-trackloop-src-mq3-audio-snd-dma-runtime-ml-223702572"></a>
### S_Music_f

```ml
function S_Music_f(state, intro, trackLoop)
```

Return `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack(state, intro, trackLoop)` from `audio.snd_dma_runtime.S_Music_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack`. |
| `intro` | `dynamic` | — | Intro passed as `intro` to `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack`. |
| `trackLoop` | `dynamic` | — | Track loop passed as `trackLoop` to `mq3.audio.snd_dma_runtime.S_StartBackgroundTrack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L376)

<a id="function-function-mq3-audio-snd-dma-runtime-s-play-f-function-s-play-f-state-names-src-mq3-audio-snd-dma-runtime-ml-1142794983"></a>
### S_Play_f

```ml
function S_Play_f(state, names)
```

Compute play f in audio.snd_dma_runtime; the normal completion returns `played`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.snd_dma_runtime.S_RegisterSound`. |
| `names` | `dynamic` | — | Names used in `(names == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L371)

<a id="function-function-mq3-audio-snd-dma-runtime-s-rawsamples-function-s-rawsamples-state-samples-rate-width-soundchannels-data-volume-src-mq3-audio-snd-dma-runtime-ml-565745515"></a>
### S_RawSamples

```ml
function S_RawSamples(state, samples, rate, width, soundChannels, data, volume)
```

Compute raw samples in audio.snd_dma_runtime; the normal completion returns `raw.enqueue(state.rawStream, samples, rate, width, soundChannels, data, volume)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`, `muted`, `rawStream`, `soundTime`. |
| `samples` | `dynamic` | — | Samples passed as `samples` to `mq3.audio.snd_raw_stream.enqueue`. |
| `rate` | `dynamic` | — | Rate passed as `rate` to `mq3.audio.snd_raw_stream.enqueue`. |
| `width` | `dynamic` | — | Width passed as `width` to `mq3.audio.snd_raw_stream.enqueue`. |
| `soundChannels` | `dynamic` | — | Channels passed as `channels` to `mq3.audio.snd_raw_stream.enqueue`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_raw_stream.enqueue`. |
| `volume` | `dynamic` | — | Volume passed as `volume` to `mq3.audio.snd_raw_stream.enqueue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L322)

<a id="function-function-mq3-audio-snd-dma-runtime-s-registersound-function-s-registersound-state-name-compressed-src-mq3-audio-snd-dma-runtime-ml-814715617"></a>
### S_RegisterSound

```ml
function S_RegisterSound(state, name, compressed)
```

Register sound in audio.snd_dma_runtime; the normal completion returns `sound.handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.audio.snd_dma_runtime.S_FindName`. |
| `compressed` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L186)

<a id="function-function-mq3-audio-snd-dma-runtime-s-respatialize-function-s-respatialize-state-entity-head-axis-inwater-src-mq3-audio-snd-dma-runtime-ml-385518741"></a>
### S_Respatialize

```ml
function S_Respatialize(state, entity, head, axis, inWater)
```

Update `state.listenerEntity`, `state.listenerOrigin`, `state.listenerAxis`, `state.inWater` in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.listenerEntity`, `state.listenerOrigin`, `state.listenerAxis`, `state.inWater`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`. Updated in place: `listenerEntity`, `listenerOrigin`, `listenerAxis`, `inWater`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_channels.setListener`. |
| `head` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`. |
| `axis` | `dynamic` | — | Axis used in `(axis == void)` and `(((state == void) or (head == void)) or (axis == void))`. |
| `inWater` | `dynamic` | — | In water operand used by `S_Respatialize`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L298)

<a id="function-function-mq3-audio-snd-dma-runtime-s-scanchannelstarts-function-s-scanchannelstarts-state-src-mq3-audio-snd-dma-runtime-ml-2085054321"></a>
### S_ScanChannelStarts

```ml
function S_ScanChannelStarts(state)
```

Compute audio.snd_dma_runtime.S_ScanChannelStarts as `(channels.activeCount(state.channels) > 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L301)

<a id="function-function-mq3-audio-snd-dma-runtime-s-shutdown-function-s-shutdown-state-src-mq3-audio-snd-dma-runtime-ml-825125651"></a>
### S_Shutdown

```ml
function S_Shutdown(state)
```

Update `state.started`, `state.muted` in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.started`, `state.muted`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`, `services`. Updated in place: `started`, `muted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L201)

<a id="function-function-mq3-audio-snd-dma-runtime-s-soundinfo-f-function-s-soundinfo-f-state-src-mq3-audio-snd-dma-runtime-ml-1482407447"></a>
### S_SoundInfo_f

```ml
function S_SoundInfo_f(state)
```

Compute sound info f in audio.snd_dma_runtime; the normal completion returns `[state.started, state.muted, state.outputRate, state.soundTime, state.paintedTime, state.backgroundActive]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`, `muted`, `outputRate`, `soundTime`, `paintedTime`, `backgroundActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L379)

<a id="function-function-mq3-audio-snd-dma-runtime-s-soundlist-f-function-s-soundlist-f-state-src-mq3-audio-snd-dma-runtime-ml-1891669959"></a>
### S_SoundList_f

```ml
function S_SoundList_f(state)
```

Compute sound list f in audio.snd_dma_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `knownSfx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L382)

<a id="function-function-mq3-audio-snd-dma-runtime-s-spatializeorigin-function-s-spatializeorigin-state-origin-mastervolume-src-mq3-audio-snd-dma-runtime-ml-1899183937"></a>
### S_SpatializeOrigin

```ml
function S_SpatializeOrigin(state, origin, masterVolume)
```

Return `mq3.audio.snd_spatialize.spatialize(origin, state.listenerOrigin, state.listenerAxis, masterVolume, 2)` from `audio.snd_dma_runtime.S_SpatializeOrigin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `listenerOrigin`, `listenerAxis`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.snd_spatialize.spatialize`. |
| `masterVolume` | `dynamic` | — | Master volume passed as `masterVolume` to `mq3.audio.snd_spatialize.spatialize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L289)

<a id="function-function-mq3-audio-snd-dma-runtime-s-startbackgroundtrack-function-s-startbackgroundtrack-state-intro-trackloop-src-mq3-audio-snd-dma-runtime-ml-1959179184"></a>
### S_StartBackgroundTrack

```ml
function S_StartBackgroundTrack(state, intro, trackLoop)
```

Start background track in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.backgroundIntro`, `state.backgroundLoop`, `state.backgroundActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. Updated in place: `backgroundIntro`, `backgroundLoop`, `backgroundActive`. |
| `intro` | `dynamic` | — | Intro used in `(intro == "")` and `(intro == void)`. |
| `trackLoop` | `dynamic` | — | Track loop used in `(trackLoop == "")` and `(trackLoop == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L359)

<a id="function-function-mq3-audio-snd-dma-runtime-s-startlocalsound-function-s-startlocalsound-state-handle-channel-src-mq3-audio-snd-dma-runtime-ml-763973598"></a>
### S_StartLocalSound

```ml
function S_StartLocalSound(state, handle, channel)
```

Start local sound in audio.snd_dma_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`, `muted`, `services`. |
| `handle` | `dynamic` | — | Handle used in `state.services.localFn(state.services.context, handle, channel)`. |
| `channel` | `dynamic` | — | Channel used in `state.services.localFn(state.services.context, handle, channel)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L237)

<a id="function-function-mq3-audio-snd-dma-runtime-s-startsound-function-s-startsound-state-origin-entity-entitychannel-handle-src-mq3-audio-snd-dma-runtime-ml-750757244"></a>
### S_StartSound

```ml
function S_StartSound(state, origin, entity, entityChannel, handle)
```

Start sound in audio.snd_dma_runtime; the normal completion returns `selected.accepted`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`, `muted`, `channels`, `services`. |
| `origin` | `dynamic` | — | Origin used in `state.services.startFn(state.services.context, origin, entity, entityChannel, handle)`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_channels.start`. |
| `entityChannel` | `dynamic` | — | Entchannel passed as `entchannel` to `mq3.audio.snd_channels.start`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.snd_channels.start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L232)

<a id="function-function-mq3-audio-snd-dma-runtime-s-stopallsounds-function-s-stopallsounds-state-src-mq3-audio-snd-dma-runtime-ml-1871560233"></a>
### S_StopAllSounds

```ml
function S_StopAllSounds(state)
```

Stop all sounds in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.loops`, `state.channels`, `state.backgroundActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `loops`, `channels`, `backgroundActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L332)

<a id="function-function-mq3-audio-snd-dma-runtime-s-stopbackgroundtrack-function-s-stopbackgroundtrack-state-src-mq3-audio-snd-dma-runtime-ml-800389261"></a>
### S_StopBackgroundTrack

```ml
function S_StopBackgroundTrack(state)
```

Stop background track in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.backgroundActive`, `state.backgroundIntro`, `state.backgroundLoop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. Updated in place: `backgroundActive`, `backgroundIntro`, `backgroundLoop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L364)

<a id="function-function-mq3-audio-snd-dma-runtime-s-stoploopingsound-function-s-stoploopingsound-state-entity-src-mq3-audio-snd-dma-runtime-ml-107695732"></a>
### S_StopLoopingSound

```ml
function S_StopLoopingSound(state, entity)
```

Stop looping sound in audio.snd_dma_runtime; the normal completion returns `found`.

Direct state writes: `state.loops`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`. Updated in place: `loops`. |
| `entity` | `dynamic` | — | Entity used in `(lp.entity == entity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L281)

<a id="function-function-mq3-audio-snd-dma-runtime-s-update-function-s-update-state-entity-head-axis-inwater-milliseconds-src-mq3-audio-snd-dma-runtime-ml-1199038547"></a>
### S_Update

```ml
function S_Update(state, entity, head, axis, inWater, milliseconds)
```

Update snd dma runtime in audio.snd_dma_runtime; the normal completion returns `S_Update_(state, milliseconds)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.snd_dma_runtime.S_Respatialize`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_dma_runtime.S_Respatialize`. |
| `head` | `dynamic` | — | Head passed as `head` to `mq3.audio.snd_dma_runtime.S_Respatialize`. |
| `axis` | `dynamic` | — | Axis passed as `axis` to `mq3.audio.snd_dma_runtime.S_Respatialize`. |
| `inWater` | `dynamic` | — | In water passed as `inWater` to `mq3.audio.snd_dma_runtime.S_Respatialize`. |
| `milliseconds` | `dynamic` | — | Milliseconds passed as `milliseconds` to `mq3.audio.snd_dma_runtime.S_Update_`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L346)

<a id="function-function-mq3-audio-snd-dma-runtime-s-update-function-s-update-state-milliseconds-src-mq3-audio-snd-dma-runtime-ml-1285921985"></a>
### S_Update_

```ml
function S_Update_(state, milliseconds)
```

Update snd dma runtime in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.soundTime`, `state.paintedTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `started`, `soundTime`, `outputRate`, `paintedTime`, `services`. Updated in place: `soundTime`, `paintedTime`. |
| `milliseconds` | `dynamic` | — | Milliseconds used in `(milliseconds < 0)` and `(milliseconds * state.outputRate)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L338)

<a id="function-function-mq3-audio-snd-dma-runtime-s-updatebackgroundtrack-function-s-updatebackgroundtrack-state-src-mq3-audio-snd-dma-runtime-ml-1169575191"></a>
### S_UpdateBackgroundTrack

```ml
function S_UpdateBackgroundTrack(state)
```

Compute audio.snd_dma_runtime.S_UpdateBackgroundTrack as `((state != void) and state.backgroundActive)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `backgroundActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L367)

<a id="function-function-mq3-audio-snd-dma-runtime-s-updateentityposition-function-s-updateentityposition-state-entity-origin-src-mq3-audio-snd-dma-runtime-ml-1039432194"></a>
### S_UpdateEntityPosition

```ml
function S_UpdateEntityPosition(state, entity, origin)
```

Update entity position in audio.snd_dma_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `origins`, `loops`. |
| `entity` | `dynamic` | — | Entity used in `(entity < 0)` and `(lp.entity == entity)`. |
| `origin` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L242)

<a id="function-function-mq3-audio-snd-dma-runtime-same-function-same-a-b-src-mq3-audio-snd-dma-runtime-ml-1991320427"></a>
### same

```ml
function same(a, b)
```

Compute audio.snd_dma_runtime.same as `(lower(a) == lower(b))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_dma_runtime.lower`. |
| `b` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_dma_runtime.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L135)

<a id="function-function-mq3-audio-snd-dma-runtime-services-function-services-src-mq3-audio-snd-dma-runtime-ml-1526253764"></a>
### services

```ml
function services()
```

Create `mq3.audio.snd_dma_runtime.Services` with initDmaFn=void; shutdownDmaFn=void; loadFn=void; startFn=void; localFn=void; paintFn=void; musicFn=void; stopMusicFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L119)

- [mq3.audio.snd_dma_runtime.Services](Type-mq3-audio-snd-dma-runtime-services-1492600771.md) — struct
<a id="function-function-mq3-audio-snd-dma-runtime-setloop-function-setloop-state-entity-origin-velocity-handle-realloop-src-mq3-audio-snd-dma-runtime-ml-919558621"></a>
### setLoop

```ml
function setLoop(state, entity, origin, velocity, handle, realLoop)
```

Set loop in audio.snd_dma_runtime; the normal completion returns `true`.

Direct state writes: `state.loops`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`. Updated in place: `loops`. |
| `entity` | `dynamic` | — | Initial `entity` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.Loop` record. |
| `origin` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`. |
| `velocity` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_dma_runtime.copy3`. |
| `handle` | `dynamic` | — | Initial `handle` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.Loop` record. |
| `realLoop` | `dynamic` | — | Initial `realLoop` field stored in the returned or constructed `mq3.audio.snd_dma_runtime.Loop` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L258)

- [mq3.audio.snd_dma_runtime.Sfx](Type-mq3-audio-snd-dma-runtime-sfx-663027514.md) — struct
- [mq3.audio.snd_dma_runtime.State](Type-mq3-audio-snd-dma-runtime-state-3570768.md) — struct
