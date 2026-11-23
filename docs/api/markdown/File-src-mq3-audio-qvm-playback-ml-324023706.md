# `src/mq3/audio/qvm_playback.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.qvm_playback`](Package-mq3-audio-qvm-playback-2071375128.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/native_paint.ml` as `nativePaint` → [src/mq3/audio/native_paint.ml](File-src-mq3-audio-native-paint-ml-953565760.md)
- `mq3/audio/qvm_sound_assets.ml` as `assets` → [src/mq3/audio/qvm_sound_assets.ml](File-src-mq3-audio-qvm-sound-assets-ml-1587569282.md)
- `mq3/audio/snd_channels.ml` as `sndChannels` → [src/mq3/audio/snd_channels.ml](File-src-mq3-audio-snd-channels-ml-1574683136.md)
- `mq3/audio/snd_loop_channels.ml` as `sndLoops` → [src/mq3/audio/snd_loop_channels.ml](File-src-mq3-audio-snd-loop-channels-ml-1602965463.md)
- `mq3/audio/snd_loop_doppler.ml` as `sndDoppler` → [src/mq3/audio/snd_loop_doppler.ml](File-src-mq3-audio-snd-loop-doppler-ml-749512355.md)
- `mq3/audio/snd_paint_pipeline.ml` as `sndPaint` → [src/mq3/audio/snd_paint_pipeline.ml](File-src-mq3-audio-snd-paint-pipeline-ml-2065386845.md)
- `mq3/audio/snd_public.ml` as `sndPublic` → [src/mq3/audio/snd_public.ml](File-src-mq3-audio-snd-public-ml-237015731.md)
- `mq3/audio/snd_raw_stream.ml` as `sndRaw` → [src/mq3/audio/snd_raw_stream.ml](File-src-mq3-audio-snd-raw-stream-ml-887602525.md)
- `mq3/audio/snd_spatialize.ml` as `sndSpatial` → [src/mq3/audio/snd_spatialize.ml](File-src-mq3-audio-snd-spatialize-ml-2009248822.md)
- `mq3/audio/spatial_mixer.ml` as `spatial` → [src/mq3/audio/spatial_mixer.ml](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-audio-qvm-playback-addloop-function-addloop-state-command-src-mq3-audio-qvm-playback-ml-2144481084"></a>
### addLoop

```ml
function addLoop(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L105)

<a id="function-function-mq3-audio-qvm-playback-addvoice-function-addvoice-state-command-localsound-src-mq3-audio-qvm-playback-ml-1758157648"></a>
### addVoice

```ml
function addVoice(state, command, localSound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `localSound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L93)

<a id="function-function-mq3-audio-qvm-playback-apply-function-apply-state-commands-src-mq3-audio-qvm-playback-ml-461914009"></a>
### apply

```ml
function apply(state, commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L191)

<a id="function-function-mq3-audio-qvm-playback-applyfrom-function-applyfrom-state-commands-start-src-mq3-audio-qvm-playback-ml-638805327"></a>
### applyFrom

```ml
function applyFrom(state, commands, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L163)

- [mq3.audio.qvm_playback.ApplyResult](Type-mq3-audio-qvm-playback-applyresult-735207379.md) — struct
<a id="function-function-mq3-audio-qvm-playback-cachedmono-function-cachedmono-state-clip-src-mq3-audio-qvm-playback-ml-1134498517"></a>
### cachedMono

```ml
function cachedMono(state, clip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clip` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L66)

- [mq3.audio.qvm_playback.Chunk](Type-mq3-audio-qvm-playback-chunk-1612025479.md) — struct
<a id="function-function-mq3-audio-qvm-playback-clearloops-function-clearloops-state-killall-src-mq3-audio-qvm-playback-ml-134434408"></a>
### clearLoops

```ml
function clearLoops(state, killAll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `killAll` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L126)

<a id="function-function-mq3-audio-qvm-playback-clipforhandle-function-clipforhandle-state-handle-src-mq3-audio-qvm-playback-ml-1323685387"></a>
### clipForHandle

```ml
function clipForHandle(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L45)

<a id="function-function-mq3-audio-qvm-playback-consume-function-consume-state-commands-src-mq3-audio-qvm-playback-ml-946021513"></a>
### consume

```ml
function consume(state, commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L193)

<a id="function-function-mq3-audio-qvm-playback-copyorigin-function-copyorigin-origin-src-mq3-audio-qvm-playback-ml-89678826"></a>
### copyOrigin

```ml
function copyOrigin(origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L64)

<a id="function-function-mq3-audio-qvm-playback-create-function-create-catalog-outputrate-chunkframes-src-mq3-audio-qvm-playback-ml-307653205"></a>
### create

```ml
function create(catalog, outputRate, chunkFrames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `outputRate` | `dynamic` | — |  |
| `chunkFrames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L35)

<a id="function-function-mq3-audio-qvm-playback-defaultaxis-function-defaultaxis-src-mq3-audio-qvm-playback-ml-1072121772"></a>
### defaultAxis

```ml
function defaultAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L33)

<a id="function-function-mq3-audio-qvm-playback-entityorigin-function-entityorigin-state-entity-src-mq3-audio-qvm-playback-ml-77468830"></a>
### entityOrigin

```ml
function entityOrigin(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L88)

<a id="function-function-mq3-audio-qvm-playback-fail-function-fail-message-src-mq3-audio-qvm-playback-ml-1645920433"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L32)

<a id="function-function-mq3-audio-qvm-playback-hascompressedsources-function-hascompressedsources-state-src-mq3-audio-qvm-playback-ml-150827347"></a>
### hasCompressedSources

```ml
function hasCompressedSources(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L338)

- [mq3.audio.qvm_playback.Listener](Type-mq3-audio-qvm-playback-listener-1057660462.md) — struct
<a id="function-function-mq3-audio-qvm-playback-loopbyentity-function-loopbyentity-state-entity-src-mq3-audio-qvm-playback-ml-1896973342"></a>
### loopByEntity

```ml
function loopByEntity(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L214)

- [mq3.audio.qvm_playback.LoopSource](Type-mq3-audio-qvm-playback-loopsource-1361245797.md) — struct
<a id="constant-constant-mq3-audio-qvm-playback-max-entities-const-max-entities-1024-src-mq3-audio-qvm-playback-ml-1314032354"></a>
### MAX_ENTITIES

```ml
const MAX_ENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L20)

<a id="constant-constant-mq3-audio-qvm-playback-max-loops-const-max-loops-1024-src-mq3-audio-qvm-playback-ml-1741773076"></a>
### MAX_LOOPS

```ml
const MAX_LOOPS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L22)

<a id="constant-constant-mq3-audio-qvm-playback-max-voices-const-max-voices-96-src-mq3-audio-qvm-playback-ml-991642406"></a>
### MAX_VOICES

```ml
const MAX_VOICES = 96
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L21)

<a id="function-function-mq3-audio-qvm-playback-mixmusic-function-mixmusic-state-music-leftmix-rightmix-src-mq3-audio-qvm-playback-ml-744687743"></a>
### mixMusic

```ml
function mixMusic(state, music, leftMix, rightMix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `music` | `dynamic` | — |  |
| `leftMix` | `dynamic` | — |  |
| `rightMix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L242)

<a id="function-function-mq3-audio-qvm-playback-mixsource-function-mixsource-state-sound-cursor-looping-gains-leftmix-rightmix-src-mq3-audio-qvm-playback-ml-1176732825"></a>
### mixSource

```ml
function mixSource(state, sound, cursor, looping, gains, leftMix, rightMix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `cursor` | `dynamic` | — |  |
| `looping` | `dynamic` | — |  |
| `gains` | `dynamic` | — |  |
| `leftMix` | `dynamic` | — |  |
| `rightMix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L219)

- [mq3.audio.qvm_playback.Music](Type-mq3-audio-qvm-playback-music-237700753.md) — struct
<a id="function-function-mq3-audio-qvm-playback-musicsample-function-musicsample-sound-frame-channel-src-mq3-audio-qvm-playback-ml-442861751"></a>
### musicSample

```ml
function musicSample(sound, frame, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L231)

<a id="function-function-mq3-audio-qvm-playback-paintmusic-function-paintmusic-state-music-paint-src-mq3-audio-qvm-playback-ml-388702800"></a>
### paintMusic

```ml
function paintMusic(state, music, paint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `music` | `dynamic` | — |  |
| `paint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L272)

<a id="function-function-mq3-audio-qvm-playback-paintmusicfast-function-paintmusicfast-state-music-paint-src-mq3-audio-qvm-playback-ml-1007080332"></a>
### paintMusicFast

```ml
function paintMusicFast(state, music, paint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `music` | `dynamic` | — |  |
| `paint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L344)

<a id="function-function-mq3-audio-qvm-playback-queueraw-function-queueraw-state-audio-volume-src-mq3-audio-qvm-playback-ml-1716616169"></a>
### queueRaw

```ml
function queueRaw(state, audio, volume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `audio` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L56)

<a id="function-function-mq3-audio-qvm-playback-render-function-render-state-src-mq3-audio-qvm-playback-ml-1646771407"></a>
### render

```ml
function render(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L298)

<a id="function-function-mq3-audio-qvm-playback-renderfast-function-renderfast-state-src-mq3-audio-qvm-playback-ml-1369910823"></a>
### renderFast

```ml
function renderFast(state)
```

Production Windows fast path. It is deliberately additive: the exact, reference-tested MiniLang painter above remains the fallback for compressed effects and queued cinematic raw audio.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L367)

<a id="function-function-mq3-audio-qvm-playback-setlistener-function-setlistener-state-command-src-mq3-audio-qvm-playback-ml-1733859714"></a>
### setListener

```ml
function setListener(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L145)

<a id="function-function-mq3-audio-qvm-playback-setposition-function-setposition-state-entity-origin-src-mq3-audio-qvm-playback-ml-1784495770"></a>
### setPosition

```ml
function setPosition(state, entity, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L138)

<a id="function-function-mq3-audio-qvm-playback-sourcegains-function-sourcegains-state-entity-origin-localsound-src-mq3-audio-qvm-playback-ml-1413147048"></a>
### sourceGains

```ml
function sourceGains(state, entity, origin, localSound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `localSound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L202)

<a id="function-function-mq3-audio-qvm-playback-sourcevolumes-function-sourcevolumes-state-entity-origin-localsound-src-mq3-audio-qvm-playback-ml-1231283674"></a>
### sourceVolumes

```ml
function sourceVolumes(state, entity, origin, localSound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `localSound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L208)

<a id="function-function-mq3-audio-qvm-playback-startmusic-function-startmusic-state-intro-trackloop-src-mq3-audio-qvm-playback-ml-1513180938"></a>
### startMusic

```ml
function startMusic(state, intro, trackLoop)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `intro` | `dynamic` | — |  |
| `trackLoop` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L152)

- [mq3.audio.qvm_playback.State](Type-mq3-audio-qvm-playback-state-887669543.md) — struct
<a id="function-function-mq3-audio-qvm-playback-stoploop-function-stoploop-state-entity-src-mq3-audio-qvm-playback-ml-815501138"></a>
### stopLoop

```ml
function stopLoop(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L132)

<a id="function-function-mq3-audio-qvm-playback-validorigin-function-validorigin-origin-src-mq3-audio-qvm-playback-ml-335252890"></a>
### validOrigin

```ml
function validOrigin(origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L62)

<a id="function-function-mq3-audio-qvm-playback-validsoundentity-function-validsoundentity-entity-src-mq3-audio-qvm-playback-ml-1094715125"></a>
### validSoundEntity

```ml
function validSoundEntity(entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L63)

- [mq3.audio.qvm_playback.Voice](Type-mq3-audio-qvm-playback-voice-1400706100.md) — struct
