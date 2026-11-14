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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L27)

<a id="function-function-mq3-audio-snd-dma-runtime-create-function-create-host-outputrate-src-mq3-audio-snd-dma-runtime-ml-600227689"></a>
### create

```ml
function create(host, outputRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `outputRate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L21)

<a id="function-function-mq3-audio-snd-dma-runtime-diagnostic-function-diagnostic-state-text-src-mq3-audio-snd-dma-runtime-ml-523144964"></a>
### diagnostic

```ml
function diagnostic(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L28)

<a id="function-function-mq3-audio-snd-dma-runtime-fgetlittlelong-function-fgetlittlelong-data-offset-src-mq3-audio-snd-dma-runtime-ml-1199503175"></a>
### FGetLittleLong

```ml
function FGetLittleLong(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L30)

<a id="function-function-mq3-audio-snd-dma-runtime-fgetlittleshort-function-fgetlittleshort-data-offset-src-mq3-audio-snd-dma-runtime-ml-46414071"></a>
### FGetLittleShort

```ml
function FGetLittleShort(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L31)

<a id="function-function-mq3-audio-snd-dma-runtime-identityaxis-function-identityaxis-src-mq3-audio-snd-dma-runtime-ml-722236480"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L20)

- [mq3.audio.snd_dma_runtime.Loop](Type-mq3-audio-snd-dma-runtime-loop-633949621.md) — struct
<a id="function-function-mq3-audio-snd-dma-runtime-lower-function-lower-value-src-mq3-audio-snd-dma-runtime-ml-30976109"></a>
### lower

```ml
function lower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L25)

<a id="constant-constant-mq3-audio-snd-dma-runtime-max-gentities-const-max-gentities-1024-src-mq3-audio-snd-dma-runtime-ml-278505084"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L11)

<a id="constant-constant-mq3-audio-snd-dma-runtime-max-qpath-const-max-qpath-64-src-mq3-audio-snd-dma-runtime-ml-410983707"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L13)

<a id="constant-constant-mq3-audio-snd-dma-runtime-max-sfx-const-max-sfx-4096-src-mq3-audio-snd-dma-runtime-ml-1335007656"></a>
### MAX_SFX

```ml
const MAX_SFX = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L12)

<a id="function-function-mq3-audio-snd-dma-runtime-s-addloopingsound-function-s-addloopingsound-state-entity-origin-velocity-handle-src-mq3-audio-snd-dma-runtime-ml-1074142203"></a>
### S_AddLoopingSound

```ml
function S_AddLoopingSound(state, entity, origin, velocity, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L62)

<a id="function-function-mq3-audio-snd-dma-runtime-s-addloopsounds-function-s-addloopsounds-state-src-mq3-audio-snd-dma-runtime-ml-1237206617"></a>
### S_AddLoopSounds

```ml
function S_AddLoopSounds(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L65)

<a id="function-function-mq3-audio-snd-dma-runtime-s-addrealloopingsound-function-s-addrealloopingsound-state-entity-origin-velocity-handle-src-mq3-audio-snd-dma-runtime-ml-305990699"></a>
### S_AddRealLoopingSound

```ml
function S_AddRealLoopingSound(state, entity, origin, velocity, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L63)

<a id="function-function-mq3-audio-snd-dma-runtime-s-beginregistration-function-s-beginregistration-state-src-mq3-audio-snd-dma-runtime-ml-33701011"></a>
### S_BeginRegistration

```ml
function S_BeginRegistration(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L45)

<a id="function-function-mq3-audio-snd-dma-runtime-s-byteswaprawsamples-function-s-byteswaprawsamples-samples-width-soundchannels-data-src-mq3-audio-snd-dma-runtime-ml-1471168222"></a>
### S_ByteSwapRawSamples

```ml
function S_ByteSwapRawSamples(samples, width, soundChannels, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `soundChannels` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L71)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelfree-function-s-channelfree-state-slot-src-mq3-audio-snd-dma-runtime-ml-1253356513"></a>
### S_ChannelFree

```ml
function S_ChannelFree(state, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L51)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelmalloc-function-s-channelmalloc-state-entity-handle-entitychannel-src-mq3-audio-snd-dma-runtime-ml-1648672284"></a>
### S_ChannelMalloc

```ml
function S_ChannelMalloc(state, entity, handle, entityChannel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `entityChannel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L50)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelsetup-function-s-channelsetup-state-src-mq3-audio-snd-dma-runtime-ml-319257263"></a>
### S_ChannelSetup

```ml
function S_ChannelSetup(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L49)

<a id="function-function-mq3-audio-snd-dma-runtime-s-channelsetupresult-function-s-channelsetupresult-state-src-mq3-audio-snd-dma-runtime-ml-1878059071"></a>
### S_ChannelSetupResult

```ml
function S_ChannelSetupResult(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L52)

<a id="function-function-mq3-audio-snd-dma-runtime-s-clearloopingsounds-function-s-clearloopingsounds-state-killall-src-mq3-audio-snd-dma-runtime-ml-474918136"></a>
### S_ClearLoopingSounds

```ml
function S_ClearLoopingSounds(state, killAll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `killAll` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L57)

<a id="function-function-mq3-audio-snd-dma-runtime-s-clearsoundbuffer-function-s-clearsoundbuffer-state-src-mq3-audio-snd-dma-runtime-ml-128035391"></a>
### S_ClearSoundBuffer

```ml
function S_ClearSoundBuffer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L73)

<a id="function-function-mq3-audio-snd-dma-runtime-s-defaultsound-function-s-defaultsound-sound-src-mq3-audio-snd-dma-runtime-ml-1156804485"></a>
### S_DefaultSound

```ml
function S_DefaultSound(sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L38)

<a id="function-function-mq3-audio-snd-dma-runtime-s-disablesounds-function-s-disablesounds-state-src-mq3-audio-snd-dma-runtime-ml-746862871"></a>
### S_DisableSounds

```ml
function S_DisableSounds(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L48)

<a id="function-function-mq3-audio-snd-dma-runtime-s-findname-function-s-findname-state-name-src-mq3-audio-snd-dma-runtime-ml-116318116"></a>
### S_FindName

```ml
function S_FindName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L33)

<a id="function-function-mq3-audio-snd-dma-runtime-s-findwavchunk-function-s-findwavchunk-data-offset-chunk-src-mq3-audio-snd-dma-runtime-ml-1361978670"></a>
### S_FindWavChunk

```ml
function S_FindWavChunk(data, offset, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L78)

<a id="function-function-mq3-audio-snd-dma-runtime-s-freeoldestsound-function-s-freeoldestsound-state-src-mq3-audio-snd-dma-runtime-ml-1838252507"></a>
### S_FreeOldestSound

```ml
function S_FreeOldestSound(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L43)

<a id="function-function-mq3-audio-snd-dma-runtime-s-getrawsamplepointer-function-s-getrawsamplepointer-state-src-mq3-audio-snd-dma-runtime-ml-186607305"></a>
### S_GetRawSamplePointer

```ml
function S_GetRawSamplePointer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L70)

<a id="function-function-mq3-audio-snd-dma-runtime-s-getsoundtime-function-s-getsoundtime-state-src-mq3-audio-snd-dma-runtime-ml-1608390107"></a>
### S_GetSoundtime

```ml
function S_GetSoundtime(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L69)

<a id="function-function-mq3-audio-snd-dma-runtime-s-hashsfxname-function-s-hashsfxname-name-src-mq3-audio-snd-dma-runtime-ml-793160779"></a>
### S_HashSFXName

```ml
function S_HashSFXName(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L32)

<a id="function-function-mq3-audio-snd-dma-runtime-s-init-function-s-init-state-src-mq3-audio-snd-dma-runtime-ml-1570856655"></a>
### S_Init

```ml
function S_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L46)

<a id="function-function-mq3-audio-snd-dma-runtime-s-memoryload-function-s-memoryload-state-sound-src-mq3-audio-snd-dma-runtime-ml-1149268888"></a>
### S_memoryLoad

```ml
function S_memoryLoad(state, sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L39)

<a id="function-function-mq3-audio-snd-dma-runtime-s-music-f-function-s-music-f-state-intro-trackloop-src-mq3-audio-snd-dma-runtime-ml-223702572"></a>
### S_Music_f

```ml
function S_Music_f(state, intro, trackLoop)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `intro` | `dynamic` | — |  |
| `trackLoop` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L83)

<a id="function-function-mq3-audio-snd-dma-runtime-s-play-f-function-s-play-f-state-names-src-mq3-audio-snd-dma-runtime-ml-1142794983"></a>
### S_Play_f

```ml
function S_Play_f(state, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L82)

<a id="function-function-mq3-audio-snd-dma-runtime-s-rawsamples-function-s-rawsamples-state-samples-rate-width-soundchannels-data-volume-src-mq3-audio-snd-dma-runtime-ml-565745515"></a>
### S_RawSamples

```ml
function S_RawSamples(state, samples, rate, width, soundChannels, data, volume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `rate` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `soundChannels` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L72)

<a id="function-function-mq3-audio-snd-dma-runtime-s-registersound-function-s-registersound-state-name-compressed-src-mq3-audio-snd-dma-runtime-ml-814715617"></a>
### S_RegisterSound

```ml
function S_RegisterSound(state, name, compressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L44)

<a id="function-function-mq3-audio-snd-dma-runtime-s-respatialize-function-s-respatialize-state-entity-head-axis-inwater-src-mq3-audio-snd-dma-runtime-ml-385518741"></a>
### S_Respatialize

```ml
function S_Respatialize(state, entity, head, axis, inWater)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `inWater` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L67)

<a id="function-function-mq3-audio-snd-dma-runtime-s-scanchannelstarts-function-s-scanchannelstarts-state-src-mq3-audio-snd-dma-runtime-ml-2085054321"></a>
### S_ScanChannelStarts

```ml
function S_ScanChannelStarts(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L68)

<a id="function-function-mq3-audio-snd-dma-runtime-s-shutdown-function-s-shutdown-state-src-mq3-audio-snd-dma-runtime-ml-825125651"></a>
### S_Shutdown

```ml
function S_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L47)

<a id="function-function-mq3-audio-snd-dma-runtime-s-soundinfo-f-function-s-soundinfo-f-state-src-mq3-audio-snd-dma-runtime-ml-1482407447"></a>
### S_SoundInfo_f

```ml
function S_SoundInfo_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L84)

<a id="function-function-mq3-audio-snd-dma-runtime-s-soundlist-f-function-s-soundlist-f-state-src-mq3-audio-snd-dma-runtime-ml-1891669959"></a>
### S_SoundList_f

```ml
function S_SoundList_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L85)

<a id="function-function-mq3-audio-snd-dma-runtime-s-spatializeorigin-function-s-spatializeorigin-state-origin-mastervolume-src-mq3-audio-snd-dma-runtime-ml-1899183937"></a>
### S_SpatializeOrigin

```ml
function S_SpatializeOrigin(state, origin, masterVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `masterVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L66)

<a id="function-function-mq3-audio-snd-dma-runtime-s-startbackgroundtrack-function-s-startbackgroundtrack-state-intro-trackloop-src-mq3-audio-snd-dma-runtime-ml-1959179184"></a>
### S_StartBackgroundTrack

```ml
function S_StartBackgroundTrack(state, intro, trackLoop)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `intro` | `dynamic` | — |  |
| `trackLoop` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L79)

<a id="function-function-mq3-audio-snd-dma-runtime-s-startlocalsound-function-s-startlocalsound-state-handle-channel-src-mq3-audio-snd-dma-runtime-ml-763973598"></a>
### S_StartLocalSound

```ml
function S_StartLocalSound(state, handle, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L55)

<a id="function-function-mq3-audio-snd-dma-runtime-s-startsound-function-s-startsound-state-origin-entity-entitychannel-handle-src-mq3-audio-snd-dma-runtime-ml-750757244"></a>
### S_StartSound

```ml
function S_StartSound(state, origin, entity, entityChannel, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `entityChannel` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L54)

<a id="function-function-mq3-audio-snd-dma-runtime-s-stopallsounds-function-s-stopallsounds-state-src-mq3-audio-snd-dma-runtime-ml-1871560233"></a>
### S_StopAllSounds

```ml
function S_StopAllSounds(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L74)

<a id="function-function-mq3-audio-snd-dma-runtime-s-stopbackgroundtrack-function-s-stopbackgroundtrack-state-src-mq3-audio-snd-dma-runtime-ml-800389261"></a>
### S_StopBackgroundTrack

```ml
function S_StopBackgroundTrack(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L80)

<a id="function-function-mq3-audio-snd-dma-runtime-s-stoploopingsound-function-s-stoploopingsound-state-entity-src-mq3-audio-snd-dma-runtime-ml-107695732"></a>
### S_StopLoopingSound

```ml
function S_StopLoopingSound(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L64)

<a id="function-function-mq3-audio-snd-dma-runtime-s-update-function-s-update-state-entity-head-axis-inwater-milliseconds-src-mq3-audio-snd-dma-runtime-ml-1199038547"></a>
### S_Update

```ml
function S_Update(state, entity, head, axis, inWater, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `inWater` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L76)

<a id="function-function-mq3-audio-snd-dma-runtime-s-update-function-s-update-state-milliseconds-src-mq3-audio-snd-dma-runtime-ml-1285921985"></a>
### S_Update_

```ml
function S_Update_(state, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L75)

<a id="function-function-mq3-audio-snd-dma-runtime-s-updatebackgroundtrack-function-s-updatebackgroundtrack-state-src-mq3-audio-snd-dma-runtime-ml-1169575191"></a>
### S_UpdateBackgroundTrack

```ml
function S_UpdateBackgroundTrack(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L81)

<a id="function-function-mq3-audio-snd-dma-runtime-s-updateentityposition-function-s-updateentityposition-state-entity-origin-src-mq3-audio-snd-dma-runtime-ml-1039432194"></a>
### S_UpdateEntityPosition

```ml
function S_UpdateEntityPosition(state, entity, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L56)

<a id="function-function-mq3-audio-snd-dma-runtime-same-function-same-a-b-src-mq3-audio-snd-dma-runtime-ml-1991320427"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L26)

<a id="function-function-mq3-audio-snd-dma-runtime-services-function-services-src-mq3-audio-snd-dma-runtime-ml-1526253764"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L19)

- [mq3.audio.snd_dma_runtime.Services](Type-mq3-audio-snd-dma-runtime-services-1492600771.md) — struct
<a id="function-function-mq3-audio-snd-dma-runtime-setloop-function-setloop-state-entity-origin-velocity-handle-realloop-src-mq3-audio-snd-dma-runtime-ml-919558621"></a>
### setLoop

```ml
function setLoop(state, entity, origin, velocity, handle, realLoop)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `realLoop` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L58)

- [mq3.audio.snd_dma_runtime.Sfx](Type-mq3-audio-snd-dma-runtime-sfx-663027514.md) — struct
- [mq3.audio.snd_dma_runtime.State](Type-mq3-audio-snd-dma-runtime-state-3570768.md) — struct
