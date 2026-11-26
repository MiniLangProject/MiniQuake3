# `src/mq3/client/cinematic_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cinematic_runtime`](Package-mq3-client-cinematic-runtime-764937389.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/format/roq.ml` as `roq` → [src/mq3/format/roq.ml](File-src-mq3-format-roq-ml-406347091.md)
- `mq3/video/roq_video.ml` as `video` → [src/mq3/video/roq_video.ml](File-src-mq3-video-roq-video-ml-1067140839.md)
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-client-cinematic-runtime-cin-hold-const-cin-hold-4-src-mq3-client-cinematic-runtime-ml-805334629"></a>
### CIN_HOLD

```ml
const CIN_HOLD = 4
```

Cinematic playback flag selecting hold behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L24)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-loop-const-cin-loop-2-src-mq3-client-cinematic-runtime-ml-796553261"></a>
### CIN_LOOP

```ml
const CIN_LOOP = 2
```

Cinematic playback flag selecting loop behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L22)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-shader-const-cin-shader-16-src-mq3-client-cinematic-runtime-ml-326863408"></a>
### CIN_SHADER

```ml
const CIN_SHADER = 16
```

Cinematic playback flag selecting shader behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L28)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-silent-const-cin-silent-8-src-mq3-client-cinematic-runtime-ml-1353583029"></a>
### CIN_SILENT

```ml
const CIN_SILENT = 8
```

Cinematic playback flag selecting silent behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L26)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-system-const-cin-system-1-src-mq3-client-cinematic-runtime-ml-1463872342"></a>
### CIN_SYSTEM

```ml
const CIN_SYSTEM = 1
```

Cinematic playback flag selecting system behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L20)

- [mq3.client.cinematic_runtime.Clip](Type-mq3-client-cinematic-runtime-clip-1278602487.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-closeall-function-closeall-state-src-mq3-client-cinematic-runtime-ml-1095697911"></a>
### closeAll

```ml
function closeAll(state)
```

Updates `state.drawQueue` during cinematic runtime `closeAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable cinematic runtime record/storage; this routine assigns `state.drawQueue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L284)

<a id="function-function-mq3-client-cinematic-runtime-create-function-create-archive-src-mq3-client-cinematic-runtime-ml-33781950"></a>
### create

```ml
function create(archive)
```

Calls `mq3.client.cinematic_runtime.State`, `std.ds.list.List.withCapacity` from cinematic runtime `create`. The final path returns `State(archive,array(MAX_HANDLES,void),lists.List.withCapacity(16))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L154)

<a id="function-function-mq3-client-cinematic-runtime-discarddraws-function-discarddraws-state-src-mq3-client-cinematic-runtime-ml-2064515291"></a>
### discardDraws

```ml
function discardDraws(state)
```

Calls `state.drawQueue.clear` from cinematic runtime `discardDraws`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.drawQueue.clear`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L275)

<a id="function-function-mq3-client-cinematic-runtime-draw-function-draw-state-handle-src-mq3-client-cinematic-runtime-ml-1438765113"></a>
### draw

```ml
function draw(state, handle)
```

Calls `mq3.client.cinematic_runtime.validHandle`, `mq3.client.cinematic_runtime.Draw`, `state.drawQueue.add` from cinematic runtime `draw`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`, `state.drawQueue.add`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L244)

- [mq3.client.cinematic_runtime.Draw](Type-mq3-client-cinematic-runtime-draw-320421191.md) — struct
- [mq3.client.cinematic_runtime.Extents](Type-mq3-client-cinematic-runtime-extents-627808258.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-fail-function-fail-message-src-mq3-client-cinematic-runtime-ml-385513105"></a>
### fail

```ml
function fail(message)
```

Creates the cinematic runtime error `7692` with diagnostic text `"cinematic runtime: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"cinematic runtime: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L151)

<a id="function-function-mq3-client-cinematic-runtime-finishclip-function-finishclip-clip-now-src-mq3-client-cinematic-runtime-ml-843846026"></a>
### finishClip

```ml
function finishClip(clip, now)
```

Updates `clip.status` during cinematic runtime `finishClip`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — | Mutable cinematic runtime record/storage; this routine assigns `clip.status`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L197)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-eof-const-fmv-eof-2-src-mq3-client-cinematic-runtime-ml-334524569"></a>
### FMV_EOF

```ml
const FMV_EOF = 2
```

Cinematic decoder state indicating eof.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L16)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-idle-const-fmv-idle-0-src-mq3-client-cinematic-runtime-ml-1771096529"></a>
### FMV_IDLE

```ml
const FMV_IDLE = 0
```

Cinematic decoder state indicating idle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L12)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-looped-const-fmv-looped-5-src-mq3-client-cinematic-runtime-ml-1594400428"></a>
### FMV_LOOPED

```ml
const FMV_LOOPED = 5
```

Cinematic decoder state indicating looped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L18)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-play-const-fmv-play-1-src-mq3-client-cinematic-runtime-ml-1029229506"></a>
### FMV_PLAY

```ml
const FMV_PLAY = 1
```

Cinematic decoder state indicating play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L14)

<a id="function-function-mq3-client-cinematic-runtime-freehandle-function-freehandle-state-src-mq3-client-cinematic-runtime-ml-817051347"></a>
### freeHandle

```ml
function freeHandle(state)
```

Evaluates cinematic runtime `freeHandle` and returns `index`, `-1` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L167)

<a id="constant-constant-mq3-client-cinematic-runtime-max-handles-const-max-handles-16-src-mq3-client-cinematic-runtime-ml-1347476870"></a>
### MAX_HANDLES

```ml
const MAX_HANDLES = 16
```

Capacity limit for the handles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L30)

<a id="function-function-mq3-client-cinematic-runtime-pathfor-function-pathfor-name-src-mq3-client-cinematic-runtime-ml-326011127"></a>
### pathFor

```ml
function pathFor(name)
```

Calls `std.string.replaceAll`, `std.string.indexOf` from cinematic runtime `pathFor`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding cinematic runtime resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L157)

<a id="function-function-mq3-client-cinematic-runtime-play-function-play-state-name-x-y-width-height-bits-now-src-mq3-client-cinematic-runtime-ml-1607619340"></a>
### play

```ml
function play(state, name, x, y, width, height, bits, now)
```

Updates `state.handles[handle]` during cinematic runtime `play`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable cinematic runtime record/storage; this routine assigns `state.handles[handle]`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding cinematic runtime resource. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `play`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `play`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `play`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `play`. |
| `bits` | `dynamic` | — | Value used by `if (bits&CIN_SYSTEM)==0 then for index=0 to MAX_HANDLES-1 if state.handles[index]!=void and state.handles[index].status!=FMV_EOF and stringEqu...`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L178)

<a id="function-function-mq3-client-cinematic-runtime-presentation-function-presentation-draw-virtualwidth-virtualheight-targetwidth-targetheight-src-mq3-client-cinematic-runtime-ml-1633123100"></a>
### presentation

```ml
function presentation(draw, virtualWidth, virtualHeight, targetWidth, targetHeight)
```

Calls `mq3.client.cinematic_runtime.Presentation` from cinematic runtime `presentation`. The final path returns `Presentation(draw.frame.pixels,draw.frame.width,draw.frame.height,x,y,width,height,draw.dirty)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `draw` | `dynamic` | — | Record read through `draw.extents.x`, `draw.extents.y`, `draw.extents.width`, `draw.extents.height` and additional values. |
| `virtualWidth` | `dynamic` | — | Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`. |
| `virtualHeight` | `dynamic` | — | Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`. |
| `targetWidth` | `dynamic` | — | Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`. |
| `targetHeight` | `dynamic` | — | Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L264)

- [mq3.client.cinematic_runtime.Presentation](Type-mq3-client-cinematic-runtime-presentation-577400981.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-resetclip-function-resetclip-clip-now-src-mq3-client-cinematic-runtime-ml-643260636"></a>
### resetClip

```ml
function resetClip(clip, now)
```

Updates `clip.decoder`, `clip.chunkIndex`, `clip.startTime`, `clip.lastTime` and additional values during cinematic runtime `resetClip`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — | Mutable cinematic runtime record/storage; this routine assigns `clip.decoder`, `clip.chunkIndex`, `clip.startTime`, `clip.lastTime` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L191)

<a id="function-function-mq3-client-cinematic-runtime-run-function-run-state-handle-now-src-mq3-client-cinematic-runtime-ml-1087629371"></a>
### run

```ml
function run(state, handle, now)
```

Calls `mq3.client.cinematic_runtime.validHandle`, `mq3.client.cinematic_runtime.finishClip`, `mq3.format.roq.decodeAudio` and additional helpers from cinematic runtime `run`. The final path returns `clip.status`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `run`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L206)

<a id="function-function-mq3-client-cinematic-runtime-setextents-function-setextents-state-handle-x-y-width-height-src-mq3-client-cinematic-runtime-ml-1424836159"></a>
### setExtents

```ml
function setExtents(state, handle, x, y, width, height)
```

Calls `mq3.client.cinematic_runtime.validHandle`, `mq3.client.cinematic_runtime.Extents` from cinematic runtime `setExtents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `setExtents`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `setExtents`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `setExtents`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `setExtents`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `setExtents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L237)

- [mq3.client.cinematic_runtime.State](Type-mq3-client-cinematic-runtime-state-1968655514.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-stop-function-stop-state-handle-src-mq3-client-cinematic-runtime-ml-1254885973"></a>
### stop

```ml
function stop(state, handle)
```

Updates `state.handles[handle].status` during cinematic runtime `stop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable cinematic runtime record/storage; this routine assigns `state.handles[handle].status`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `stop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L227)

<a id="function-function-mq3-client-cinematic-runtime-takeaudio-function-takeaudio-state-handle-src-mq3-client-cinematic-runtime-ml-1575632163"></a>
### takeAudio

```ml
function takeAudio(state, handle)
```

Calls `mq3.client.cinematic_runtime.validHandle`, `clip.audioQueue.toArray`, `std.ds.list.List.withCapacity` from cinematic runtime `takeAudio`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `takeAudio`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L279)

<a id="function-function-mq3-client-cinematic-runtime-takedraws-function-takedraws-state-src-mq3-client-cinematic-runtime-ml-1657774019"></a>
### takeDraws

```ml
function takeDraws(state)
```

Updates `state.drawQueue` during cinematic runtime `takeDraws`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable cinematic runtime record/storage; this routine assigns `state.drawQueue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L272)

<a id="function-function-mq3-client-cinematic-runtime-upload-function-upload-state-handle-src-mq3-client-cinematic-runtime-ml-995088193"></a>
### upload

```ml
function upload(state, handle)
```

CIN_UploadCinematic consumes the same decoded buffer as CIN_DrawCinematic, but it must not enqueue a screen quad.  Shader stages call run() first and then consume this upload record for their stable scratch texture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `upload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L253)

- [mq3.client.cinematic_runtime.Upload](Type-mq3-client-cinematic-runtime-upload-1996100800.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-validhandle-function-validhandle-state-handle-src-mq3-client-cinematic-runtime-ml-504717153"></a>
### validHandle

```ml
function validHandle(state, handle)
```

Computes `state!=void and handle>=0 and handle<MAX_HANDLES and state.handles[handle]!=void` for cinematic runtime `validHandle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.handles`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `validHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L164)
