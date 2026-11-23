# `src/mq3/client/cinematic_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cinematic_runtime`](Package-mq3-client-cinematic-runtime-764937389.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/format/roq.ml` as `roq` → [src/mq3/format/roq.ml](File-src-mq3-format-roq-ml-406347091.md)
- `mq3/video/roq_video.ml` as `video` → [src/mq3/video/roq_video.ml](File-src-mq3-video-roq-video-ml-1067140839.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-client-cinematic-runtime-cin-hold-const-cin-hold-4-src-mq3-client-cinematic-runtime-ml-805334629"></a>
### CIN_HOLD

```ml
const CIN_HOLD = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L17)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-loop-const-cin-loop-2-src-mq3-client-cinematic-runtime-ml-796553261"></a>
### CIN_LOOP

```ml
const CIN_LOOP = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L16)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-shader-const-cin-shader-16-src-mq3-client-cinematic-runtime-ml-326863408"></a>
### CIN_SHADER

```ml
const CIN_SHADER = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L19)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-silent-const-cin-silent-8-src-mq3-client-cinematic-runtime-ml-1353583029"></a>
### CIN_SILENT

```ml
const CIN_SILENT = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L18)

<a id="constant-constant-mq3-client-cinematic-runtime-cin-system-const-cin-system-1-src-mq3-client-cinematic-runtime-ml-1463872342"></a>
### CIN_SYSTEM

```ml
const CIN_SYSTEM = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L15)

- [mq3.client.cinematic_runtime.Clip](Type-mq3-client-cinematic-runtime-clip-1278602487.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-closeall-function-closeall-state-src-mq3-client-cinematic-runtime-ml-1095697911"></a>
### closeAll

```ml
function closeAll(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L104)

<a id="function-function-mq3-client-cinematic-runtime-create-function-create-archive-src-mq3-client-cinematic-runtime-ml-33781950"></a>
### create

```ml
function create(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L30)

<a id="function-function-mq3-client-cinematic-runtime-discarddraws-function-discarddraws-state-src-mq3-client-cinematic-runtime-ml-2064515291"></a>
### discardDraws

```ml
function discardDraws(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L100)

<a id="function-function-mq3-client-cinematic-runtime-draw-function-draw-state-handle-src-mq3-client-cinematic-runtime-ml-1438765113"></a>
### draw

```ml
function draw(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L81)

- [mq3.client.cinematic_runtime.Draw](Type-mq3-client-cinematic-runtime-draw-320421191.md) — struct
- [mq3.client.cinematic_runtime.Extents](Type-mq3-client-cinematic-runtime-extents-627808258.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-fail-function-fail-message-src-mq3-client-cinematic-runtime-ml-385513105"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L29)

<a id="function-function-mq3-client-cinematic-runtime-finishclip-function-finishclip-clip-now-src-mq3-client-cinematic-runtime-ml-843846026"></a>
### finishClip

```ml
function finishClip(clip, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L51)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-eof-const-fmv-eof-2-src-mq3-client-cinematic-runtime-ml-334524569"></a>
### FMV_EOF

```ml
const FMV_EOF = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L13)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-idle-const-fmv-idle-0-src-mq3-client-cinematic-runtime-ml-1771096529"></a>
### FMV_IDLE

```ml
const FMV_IDLE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L11)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-looped-const-fmv-looped-5-src-mq3-client-cinematic-runtime-ml-1594400428"></a>
### FMV_LOOPED

```ml
const FMV_LOOPED = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L14)

<a id="constant-constant-mq3-client-cinematic-runtime-fmv-play-const-fmv-play-1-src-mq3-client-cinematic-runtime-ml-1029229506"></a>
### FMV_PLAY

```ml
const FMV_PLAY = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L12)

<a id="function-function-mq3-client-cinematic-runtime-freehandle-function-freehandle-state-src-mq3-client-cinematic-runtime-ml-817051347"></a>
### freeHandle

```ml
function freeHandle(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L36)

<a id="constant-constant-mq3-client-cinematic-runtime-max-handles-const-max-handles-16-src-mq3-client-cinematic-runtime-ml-1347476870"></a>
### MAX_HANDLES

```ml
const MAX_HANDLES = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L20)

<a id="function-function-mq3-client-cinematic-runtime-pathfor-function-pathfor-name-src-mq3-client-cinematic-runtime-ml-326011127"></a>
### pathFor

```ml
function pathFor(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L31)

<a id="function-function-mq3-client-cinematic-runtime-play-function-play-state-name-x-y-width-height-bits-now-src-mq3-client-cinematic-runtime-ml-1607619340"></a>
### play

```ml
function play(state, name, x, y, width, height, bits, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L38)

<a id="function-function-mq3-client-cinematic-runtime-presentation-function-presentation-draw-virtualwidth-virtualheight-targetwidth-targetheight-src-mq3-client-cinematic-runtime-ml-1633123100"></a>
### presentation

```ml
function presentation(draw, virtualWidth, virtualHeight, targetWidth, targetHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `draw` | `dynamic` | — |  |
| `virtualWidth` | `dynamic` | — |  |
| `virtualHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L93)

- [mq3.client.cinematic_runtime.Presentation](Type-mq3-client-cinematic-runtime-presentation-577400981.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-resetclip-function-resetclip-clip-now-src-mq3-client-cinematic-runtime-ml-643260636"></a>
### resetClip

```ml
function resetClip(clip, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L48)

<a id="function-function-mq3-client-cinematic-runtime-run-function-run-state-handle-now-src-mq3-client-cinematic-runtime-ml-1087629371"></a>
### run

```ml
function run(state, handle, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L56)

<a id="function-function-mq3-client-cinematic-runtime-setextents-function-setextents-state-handle-x-y-width-height-src-mq3-client-cinematic-runtime-ml-1424836159"></a>
### setExtents

```ml
function setExtents(state, handle, x, y, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L77)

- [mq3.client.cinematic_runtime.State](Type-mq3-client-cinematic-runtime-state-1968655514.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-stop-function-stop-state-handle-src-mq3-client-cinematic-runtime-ml-1254885973"></a>
### stop

```ml
function stop(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L74)

<a id="function-function-mq3-client-cinematic-runtime-takeaudio-function-takeaudio-state-handle-src-mq3-client-cinematic-runtime-ml-1575632163"></a>
### takeAudio

```ml
function takeAudio(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L101)

<a id="function-function-mq3-client-cinematic-runtime-takedraws-function-takedraws-state-src-mq3-client-cinematic-runtime-ml-1657774019"></a>
### takeDraws

```ml
function takeDraws(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L99)

<a id="function-function-mq3-client-cinematic-runtime-upload-function-upload-state-handle-src-mq3-client-cinematic-runtime-ml-995088193"></a>
### upload

```ml
function upload(state, handle)
```

CIN_UploadCinematic consumes the same decoded buffer as CIN_DrawCinematic, but it must not enqueue a screen quad.  Shader stages call run() first and then consume this upload record for their stable scratch texture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L88)

- [mq3.client.cinematic_runtime.Upload](Type-mq3-client-cinematic-runtime-upload-1996100800.md) — struct
<a id="function-function-mq3-client-cinematic-runtime-validhandle-function-validhandle-state-handle-src-mq3-client-cinematic-runtime-ml-504717153"></a>
### validHandle

```ml
function validHandle(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L35)
