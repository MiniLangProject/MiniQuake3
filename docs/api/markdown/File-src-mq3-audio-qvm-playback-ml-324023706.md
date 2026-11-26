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

Add loop in audio.qvm_playback; the normal completion returns `true`.

Direct state writes: `state.loops`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`, `listener`. Updated in place: `loops`. |
| `command` | `dynamic` | — | Record exposing `entity`, `handle`, `origin`, `velocity`, `flag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L153)

<a id="function-function-mq3-audio-qvm-playback-addvoice-function-addvoice-state-command-localsound-src-mq3-audio-qvm-playback-ml-1758157648"></a>
### addVoice

```ml
function addVoice(state, command, localSound)
```

Add voice in audio.qvm_playback; the normal completion returns `true`.

Direct state writes: `state.nextVoice`, `state.voices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `listener`, `channels`, `voices`, `nextVoice`. Updated in place: `nextVoice`, `voices`. |
| `command` | `dynamic` | — | Record exposing `handle`, `entity`, `channel`, `origin`. |
| `localSound` | `dynamic` | — | Initial `localSound` field stored in the returned or constructed `mq3.audio.qvm_playback.Voice` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L136)

<a id="function-function-mq3-audio-qvm-playback-apply-function-apply-state-commands-src-mq3-audio-qvm-playback-ml-461914009"></a>
### apply

```ml
function apply(state, commands)
```

Return `mq3.audio.qvm_playback.applyFrom(state, commands, 0)` from `audio.qvm_playback.apply`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.qvm_playback.applyFrom`. |
| `commands` | `dynamic` | — | Commands passed as `commands` to `mq3.audio.qvm_playback.applyFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L273)

<a id="function-function-mq3-audio-qvm-playback-applyfrom-function-applyfrom-state-commands-start-src-mq3-audio-qvm-playback-ml-638805327"></a>
### applyFrom

```ml
function applyFrom(state, commands, start)
```

Apply from in audio.qvm_playback; the normal completion returns `ApplyResult(applied, missing, ignored)`.

Direct state writes: `state.music`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `music`. |
| `commands` | `dynamic` | — | Commands used in `len(commands)` and `(commands == void)`. |
| `start` | `dynamic` | — | Start used in `(start < 0)` and `(start > len(commands))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L242)

- [mq3.audio.qvm_playback.ApplyResult](Type-mq3-audio-qvm-playback-applyresult-735207379.md) — struct
<a id="function-function-mq3-audio-qvm-playback-cachedmono-function-cachedmono-state-clip-src-mq3-audio-qvm-playback-ml-1134498517"></a>
### cachedMono

```ml
function cachedMono(state, clip)
```

Update `state.monoHandles` in audio.qvm_playback; the normal completion returns `samples`.

Direct state writes: `state.monoHandles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `monoHandles`, `monoCache`. Updated in place: `monoHandles`. |
| `clip` | `dynamic` | — | Record exposing `compressed`, `handle`, `sound`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L100)

- [mq3.audio.qvm_playback.Chunk](Type-mq3-audio-qvm-playback-chunk-1612025479.md) — struct
<a id="function-function-mq3-audio-qvm-playback-clearloops-function-clearloops-state-killall-src-mq3-audio-qvm-playback-ml-134434408"></a>
### clearLoops

```ml
function clearLoops(state, killAll)
```

Clear loops in audio.qvm_playback; updates `state.loops`.

Direct state writes: `state.loops`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`. Updated in place: `loops`. |
| `killAll` | `dynamic` | — | Kill all operand used by `clearLoops`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L179)

<a id="function-function-mq3-audio-qvm-playback-clipforhandle-function-clipforhandle-state-handle-src-mq3-audio-qvm-playback-ml-1323685387"></a>
### clipForHandle

```ml
function clipForHandle(state, handle)
```

Update `state.clipHandles` in audio.qvm_playback; the normal completion returns `clip`.

Direct state writes: `state.clipHandles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `clipHandles`, `catalog`. Updated in place: `clipHandles`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.qvm_sound_assets.clipForHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L64)

<a id="function-function-mq3-audio-qvm-playback-consume-function-consume-state-commands-src-mq3-audio-qvm-playback-ml-946021513"></a>
### consume

```ml
function consume(state, commands)
```

Update `state.commandCursor` in audio.qvm_playback; the normal completion returns `result`.

Direct state writes: `state.commandCursor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `commandCursor`. Updated in place: `commandCursor`. |
| `commands` | `dynamic` | — | Commands passed as `commands` to `mq3.audio.qvm_playback.applyFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L280)

<a id="function-function-mq3-audio-qvm-playback-copyorigin-function-copyorigin-origin-src-mq3-audio-qvm-playback-ml-89678826"></a>
### copyOrigin

```ml
function copyOrigin(origin)
```

Compute audio.qvm_playback.copyOrigin as `[origin[0], origin[1], origin[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Origin used in `origin[0]` and `origin[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L93)

<a id="function-function-mq3-audio-qvm-playback-create-function-create-catalog-outputrate-chunkframes-src-mq3-audio-qvm-playback-ml-307653205"></a>
### create

```ml
function create(catalog, outputRate, chunkFrames)
```

Create qvm playback in audio.qvm_playback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record exposing `clips`. |
| `outputRate` | `dynamic` | — | Output rate passed as `outputRate` to `mq3.audio.snd_raw_stream.create`. |
| `chunkFrames` | `dynamic` | — | Initial `chunkFrames` field stored in the returned or constructed `mq3.audio.qvm_playback.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L49)

<a id="function-function-mq3-audio-qvm-playback-defaultaxis-function-defaultaxis-src-mq3-audio-qvm-playback-ml-1072121772"></a>
### defaultAxis

```ml
function defaultAxis()
```

Compute audio.qvm_playback.defaultAxis as `[[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L43)

<a id="function-function-mq3-audio-qvm-playback-entityorigin-function-entityorigin-state-entity-src-mq3-audio-qvm-playback-ml-77468830"></a>
### entityOrigin

```ml
function entityOrigin(state, entity)
```

Compute entity origin in audio.qvm_playback; the normal completion returns `[0.0, 0.0, 0.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `entityOrigins`. |
| `entity` | `dynamic` | — | Zero-based index into `state.entityOrigins`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L125)

<a id="function-function-mq3-audio-qvm-playback-fail-function-fail-message-src-mq3-audio-qvm-playback-ml-1645920433"></a>
### fail

```ml
function fail(message)
```

Create the audio.qvm_playback error for `fail` with 7651 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("QVM playback: " + message)` and `error(7651, ("QVM playback: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L41)

<a id="function-function-mq3-audio-qvm-playback-hascompressedsources-function-hascompressedsources-state-src-mq3-audio-qvm-playback-ml-150827347"></a>
### hasCompressedSources

```ml
function hasCompressedSources(state)
```

Test compressed sources in audio.qvm_playback; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `voices`, `loops`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L471)

- [mq3.audio.qvm_playback.Listener](Type-mq3-audio-qvm-playback-listener-1057660462.md) — struct
<a id="function-function-mq3-audio-qvm-playback-loopbyentity-function-loopbyentity-state-entity-src-mq3-audio-qvm-playback-ml-1896973342"></a>
### loopByEntity

```ml
function loopByEntity(state, entity)
```

Compute loop by entity in audio.qvm_playback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`. |
| `entity` | `dynamic` | — | Entity used in `(sourceLoop.entity == entity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L314)

- [mq3.audio.qvm_playback.LoopSource](Type-mq3-audio-qvm-playback-loopsource-1361245797.md) — struct
<a id="constant-constant-mq3-audio-qvm-playback-max-entities-const-max-entities-1024-src-mq3-audio-qvm-playback-ml-1314032354"></a>
### MAX_ENTITIES

```ml
const MAX_ENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L20)

<a id="constant-constant-mq3-audio-qvm-playback-max-loops-const-max-loops-1024-src-mq3-audio-qvm-playback-ml-1741773076"></a>
### MAX_LOOPS

```ml
const MAX_LOOPS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L22)

<a id="constant-constant-mq3-audio-qvm-playback-max-voices-const-max-voices-96-src-mq3-audio-qvm-playback-ml-991642406"></a>
### MAX_VOICES

```ml
const MAX_VOICES = 96
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L21)

<a id="function-function-mq3-audio-qvm-playback-mixmusic-function-mixmusic-state-music-leftmix-rightmix-src-mq3-audio-qvm-playback-ml-744687743"></a>
### mixMusic

```ml
function mixMusic(state, music, leftMix, rightMix)
```

Mix music in audio.qvm_playback; the normal completion returns `active`.

Direct state writes: `music.cursor`, `music.inIntro`, `music.active`, `leftMix elements`, `rightMix elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `chunkFrames`, `outputRate`. |
| `music` | `dynamic` | — | Record exposing `cursor`, `inIntro`, `active`, `loopSound`, `introSound`. Updated in place: `cursor`, `inIntro`, `active`. |
| `leftMix` | `dynamic` | — | Mutable sequence written at `frame`. |
| `rightMix` | `dynamic` | — | Mutable sequence written at `frame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L363)

<a id="function-function-mq3-audio-qvm-playback-mixsource-function-mixsource-state-sound-cursor-looping-gains-leftmix-rightmix-src-mq3-audio-qvm-playback-ml-1176732825"></a>
### mixSource

```ml
function mixSource(state, sound, cursor, looping, gains, leftMix, rightMix)
```

Mix source in audio.qvm_playback; the normal completion returns `[phase, active]`.

Direct state writes: `leftMix elements`, `rightMix elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `outputRate`, `chunkFrames`. |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`, `sampleRate`. |
| `cursor` | `dynamic` | — | Cursor operand used by `mixSource`; its reads are shown in the implementation. |
| `looping` | `dynamic` | — | Looping operand used by `mixSource`; its reads are shown in the implementation. |
| `gains` | `dynamic` | — | Record exposing `left`, `right`. |
| `leftMix` | `dynamic` | — | Mutable sequence written at `frame`. |
| `rightMix` | `dynamic` | — | Mutable sequence written at `frame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L329)

- [mq3.audio.qvm_playback.Music](Type-mq3-audio-qvm-playback-music-237700753.md) — struct
<a id="function-function-mq3-audio-qvm-playback-musicsample-function-musicsample-sound-frame-channel-src-mq3-audio-qvm-playback-ml-442861751"></a>
### musicSample

```ml
function musicSample(sound, frame, channel)
```

Compute music sample in audio.qvm_playback; the normal completion returns `spatial.signed16(sound.samples, offset)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`, `bitsPerSample`, `channels`. |
| `frame` | `dynamic` | — | Frame used in `(frame % frames)`. |
| `channel` | `dynamic` | — | Channel used in `(channel * 2)` and `(offset + channel)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L345)

<a id="function-function-mq3-audio-qvm-playback-paintmusic-function-paintmusic-state-music-paint-src-mq3-audio-qvm-playback-ml-388702800"></a>
### paintMusic

```ml
function paintMusic(state, music, paint)
```

Paint music in audio.qvm_playback; the normal completion returns `active`.

Direct state writes: `music.cursor`, `music.inIntro`, `music.active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `chunkFrames`, `outputRate`. |
| `music` | `dynamic` | — | Record exposing `cursor`, `inIntro`, `active`, `loopSound`, `introSound`. Updated in place: `cursor`, `inIntro`, `active`. |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L399)

<a id="function-function-mq3-audio-qvm-playback-paintmusicfast-function-paintmusicfast-state-music-paint-src-mq3-audio-qvm-playback-ml-1007080332"></a>
### paintMusicFast

```ml
function paintMusicFast(state, music, paint)
```

Paint music fast in audio.qvm_playback; the normal completion returns `active`.

Direct state writes: `music.cursor`, `music.inIntro`, `music.active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `chunkFrames`, `outputRate`. |
| `music` | `dynamic` | — | Record exposing `cursor`, `inIntro`, `active`, `loopSound`, `introSound`. Updated in place: `cursor`, `inIntro`, `active`. |
| `paint` | `dynamic` | — | Writable byte buffer containing interleaved signed-int32 stereo accumulators. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L483)

<a id="function-function-mq3-audio-qvm-playback-queueraw-function-queueraw-state-audio-volume-src-mq3-audio-qvm-playback-ml-1716616169"></a>
### queueRaw

```ml
function queueRaw(state, audio, volume)
```

Queue raw in audio.qvm_playback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawStream`, `loopPaintedFrames`. |
| `audio` | `dynamic` | — | Record exposing `frames`, `sampleRate`, `bitsPerSample`, `channels`, `samples`. |
| `volume` | `dynamic` | — | Volume passed as `volume` to `mq3.audio.snd_raw_stream.enqueue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L79)

<a id="function-function-mq3-audio-qvm-playback-render-function-render-state-src-mq3-audio-qvm-playback-ml-1646771407"></a>
### render

```ml
function render(state)
```

Render qvm playback in audio.qvm_playback; the normal completion returns `Chunk(output, state.chunkFrames, voiceCount, loopCount, peak, limiter)`.

Direct state writes: `state.loopPaintedFrames`, `state.voices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `chunkFrames`, `rawStream`, `loopPaintedFrames`, `music`, `voices`, `loops`, `listener` and further fields. Updated in place: `loopPaintedFrames`, `voices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L429)

<a id="function-function-mq3-audio-qvm-playback-renderfast-function-renderfast-state-src-mq3-audio-qvm-playback-ml-1369910823"></a>
### renderFast

```ml
function renderFast(state)
```

Production Windows fast path. It is deliberately additive: the exact, reference-tested MiniLang painter above remains the fallback for compressed effects and queued cinematic raw audio.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawStream`, `loopPaintedFrames`, `chunkFrames`, `music`, `voices`, `loops`, `listener` and further fields. Updated in place: `loopPaintedFrames`, `voices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L507)

<a id="function-function-mq3-audio-qvm-playback-setlistener-function-setlistener-state-command-src-mq3-audio-qvm-playback-ml-1733859714"></a>
### setListener

```ml
function setListener(state, command)
```

Set listener in audio.qvm_playback; the normal completion returns `true`.

Direct state writes: `state.listener`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`. Updated in place: `listener`. |
| `command` | `dynamic` | — | Record exposing `origin`, `axis`, `entity`, `flag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L212)

<a id="function-function-mq3-audio-qvm-playback-setposition-function-setposition-state-entity-origin-src-mq3-audio-qvm-playback-ml-1784495770"></a>
### setPosition

```ml
function setPosition(state, entity, origin)
```

Set position in audio.qvm_playback; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `entityOrigins`, `loops`. |
| `entity` | `dynamic` | — | Entity used in `(entity < 0)` and `(entity >= MAX_ENTITIES)`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.qvm_playback.validOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L200)

<a id="function-function-mq3-audio-qvm-playback-sourcegains-function-sourcegains-state-entity-origin-localsound-src-mq3-audio-qvm-playback-ml-1413147048"></a>
### sourceGains

```ml
function sourceGains(state, entity, origin, localSound)
```

Compute source gains in audio.qvm_playback; the normal completion returns `spatial.Spatial(value[0], value[1], value[2], value[3])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `listener`. |
| `entity` | `dynamic` | — | Entity used in `(entity == state.listener.entity)` and `(localSound or (entity == state.listener.entity))`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.snd_spatialize.gains`. |
| `localSound` | `dynamic` | — | Local sound used in `(localSound or (entity == state.listener.entity))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L294)

<a id="function-function-mq3-audio-qvm-playback-sourcevolumes-function-sourcevolumes-state-entity-origin-localsound-src-mq3-audio-qvm-playback-ml-1231283674"></a>
### sourceVolumes

```ml
function sourceVolumes(state, entity, origin, localSound)
```

Compute source volumes in audio.qvm_playback; the normal completion returns `[value.left, value.right]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `listener`. |
| `entity` | `dynamic` | — | Entity used in `(entity == state.listener.entity)` and `(localSound or (entity == state.listener.entity))`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.snd_spatialize.spatialize`. |
| `localSound` | `dynamic` | — | Local sound used in `(localSound or (entity == state.listener.entity))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L305)

<a id="function-function-mq3-audio-qvm-playback-startmusic-function-startmusic-state-intro-trackloop-src-mq3-audio-qvm-playback-ml-1513180938"></a>
### startMusic

```ml
function startMusic(state, intro, trackLoop)
```

Start music in audio.qvm_playback; the normal completion returns `true`.

Direct state writes: `state.music`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `catalog`. Updated in place: `music`. |
| `intro` | `dynamic` | — | Path passed as `path` to `mq3.audio.qvm_sound_assets.ensurePath`. |
| `trackLoop` | `dynamic` | — | Track loop operand used by `startMusic`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L225)

- [mq3.audio.qvm_playback.State](Type-mq3-audio-qvm-playback-state-887669543.md) — struct
<a id="function-function-mq3-audio-qvm-playback-stoploop-function-stoploop-state-entity-src-mq3-audio-qvm-playback-ml-815501138"></a>
### stopLoop

```ml
function stopLoop(state, entity)
```

Stop loop in audio.qvm_playback; the normal completion returns `found`.

Direct state writes: `state.loops`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loops`. Updated in place: `loops`. |
| `entity` | `dynamic` | — | Entity used in `(sourceLoop.entity == entity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L190)

<a id="function-function-mq3-audio-qvm-playback-validorigin-function-validorigin-origin-src-mq3-audio-qvm-playback-ml-335252890"></a>
### validOrigin

```ml
function validOrigin(origin)
```

Compute audio.qvm_playback.validOrigin as `((origin != void) and (len(origin) == 3))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Origin used in `len(origin)` and `(origin != void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L87)

<a id="function-function-mq3-audio-qvm-playback-validsoundentity-function-validsoundentity-entity-src-mq3-audio-qvm-playback-ml-1094715125"></a>
### validSoundEntity

```ml
function validSoundEntity(entity)
```

Return `mq3.audio.snd_public.validEntity(entity)` from `audio.qvm_playback.validSoundEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.audio.snd_public.validEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L90)

- [mq3.audio.qvm_playback.Voice](Type-mq3-audio-qvm-playback-voice-1400706100.md) — struct
