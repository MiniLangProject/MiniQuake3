# `src/mq3/client/cl_cin_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_cin_runtime`](Package-mq3-client-cl-cin-runtime-2099513192.md)

Reachable from entry: **no**

## Imports

- `mq3/client/cinematic_runtime.ml` as `cinematic` → [src/mq3/client/cinematic_runtime.ml](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)
- `mq3/format/roq.ml` as `roq` → [src/mq3/format/roq.ml](File-src-mq3-format-roq-ml-406347091.md)
- `mq3/video/roq_video.ml` as `video` → [src/mq3/video/roq_video.ml](File-src-mq3-video-roq-video-ml-1067140839.md)

## Declarations

<a id="function-function-mq3-client-cl-cin-runtime-blit2-32-function-blit2-32-buffer-width-height-x-y-pixels-src-mq3-client-cl-cin-runtime-ml-2131232655"></a>
### blit2_32

```ml
function blit2_32(buffer, width, height, x, y, pixels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `pixels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L53)

<a id="function-function-mq3-client-cl-cin-runtime-blit4-32-function-blit4-32-buffer-width-height-x-y-pixels-src-mq3-client-cl-cin-runtime-ml-566772815"></a>
### blit4_32

```ml
function blit4_32(buffer, width, height, x, y, pixels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `pixels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L54)

<a id="function-function-mq3-client-cl-cin-runtime-blit8-32-function-blit8-32-buffer-width-height-x-y-pixels-src-mq3-client-cl-cin-runtime-ml-643632007"></a>
### blit8_32

```ml
function blit8_32(buffer, width, height, x, y, pixels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `pixels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L55)

<a id="function-function-mq3-client-cl-cin-runtime-blitvqquad32fs-function-blitvqquad32fs-decoder-input-destination-previous-x-y-xoff-yoff-src-mq3-client-cl-cin-runtime-ml-1738287479"></a>
### blitVQQuad32fs

```ml
function blitVQQuad32fs(decoder, input, destination, previous, x, y, xoff, yoff)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `input` | `dynamic` | — |  |
| `destination` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `xoff` | `dynamic` | — |  |
| `yoff` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L58)

<a id="function-function-mq3-client-cl-cin-runtime-cin-closeallvideos-function-cin-closeallvideos-state-src-mq3-client-cl-cin-runtime-ml-2035583277"></a>
### CIN_CloseAllVideos

```ml
function CIN_CloseAllVideos(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L21)

<a id="function-function-mq3-client-cl-cin-runtime-cin-drawcinematic-function-cin-drawcinematic-state-handle-src-mq3-client-cl-cin-runtime-ml-1042272519"></a>
### CIN_DrawCinematic

```ml
function CIN_DrawCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L17)

<a id="function-function-mq3-client-cl-cin-runtime-cin-handleforvideo-function-cin-handleforvideo-state-name-src-mq3-client-cl-cin-runtime-ml-729492714"></a>
### CIN_HandleForVideo

```ml
function CIN_HandleForVideo(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L13)

<a id="function-function-mq3-client-cl-cin-runtime-cin-playcinematic-function-cin-playcinematic-state-name-x-y-width-height-bits-now-src-mq3-client-cl-cin-runtime-ml-226803760"></a>
### CIN_PlayCinematic

```ml
function CIN_PlayCinematic(state, name, x, y, width, height, bits, now)
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L14)

<a id="function-function-mq3-client-cl-cin-runtime-cin-runcinematic-function-cin-runcinematic-state-handle-now-src-mq3-client-cl-cin-runtime-ml-1470213577"></a>
### CIN_RunCinematic

```ml
function CIN_RunCinematic(state, handle, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L16)

<a id="function-function-mq3-client-cl-cin-runtime-cin-setextents-function-cin-setextents-state-handle-x-y-width-height-src-mq3-client-cl-cin-runtime-ml-1428924339"></a>
### CIN_SetExtents

```ml
function CIN_SetExtents(state, handle, x, y, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L19)

<a id="function-function-mq3-client-cl-cin-runtime-cin-setlooping-function-cin-setlooping-state-handle-looping-src-mq3-client-cl-cin-runtime-ml-1800888071"></a>
### CIN_SetLooping

```ml
function CIN_SetLooping(state, handle, looping)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `looping` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L20)

<a id="function-function-mq3-client-cl-cin-runtime-cin-stopcinematic-function-cin-stopcinematic-state-handle-src-mq3-client-cl-cin-runtime-ml-1836897487"></a>
### CIN_StopCinematic

```ml
function CIN_StopCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L15)

<a id="function-function-mq3-client-cl-cin-runtime-cin-uploadcinematic-function-cin-uploadcinematic-state-handle-src-mq3-client-cl-cin-runtime-ml-2141892849"></a>
### CIN_UploadCinematic

```ml
function CIN_UploadCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L18)

<a id="function-function-mq3-client-cl-cin-runtime-cl-playcinematic-f-function-cl-playcinematic-f-state-args-now-src-mq3-client-cl-cin-runtime-ml-152167508"></a>
### CL_PlayCinematic_f

```ml
function CL_PlayCinematic_f(state, args, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L22)

<a id="function-function-mq3-client-cl-cin-runtime-create-function-create-runtime-src-mq3-client-cl-cin-runtime-ml-314418416"></a>
### create

```ml
function create(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L11)

<a id="function-function-mq3-client-cl-cin-runtime-decodecodebook-function-decodecodebook-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-2065010529"></a>
### decodeCodeBook

```ml
function decodeCodeBook(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L47)

<a id="function-function-mq3-client-cl-cin-runtime-initroq-function-initroq-data-src-mq3-client-cl-cin-runtime-ml-606205388"></a>
### initRoQ

```ml
function initRoQ(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L42)

<a id="function-function-mq3-client-cl-cin-runtime-monosamples-function-monosamples-data-previous-src-mq3-client-cl-cin-runtime-ml-1733188545"></a>
### monoSamples

```ml
function monoSamples(data, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L31)

<a id="function-function-mq3-client-cl-cin-runtime-move4-32-function-move4-32-destination-previous-width-height-x-y-vector-xoff-yoff-src-mq3-client-cl-cin-runtime-ml-1782117465"></a>
### move4_32

```ml
function move4_32(destination, previous, width, height, x, y, vector, xoff, yoff)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |
| `xoff` | `dynamic` | — |  |
| `yoff` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L56)

<a id="function-function-mq3-client-cl-cin-runtime-move8-32-function-move8-32-destination-previous-width-height-x-y-vector-xoff-yoff-src-mq3-client-cl-cin-runtime-ml-1084509473"></a>
### move8_32

```ml
function move8_32(destination, previous, width, height, x, y, vector, xoff, yoff)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |
| `xoff` | `dynamic` | — |  |
| `yoff` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L57)

<a id="function-function-mq3-client-cl-cin-runtime-readquadinfo-function-readquadinfo-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-734819829"></a>
### readQuadInfo

```ml
function readQuadInfo(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L46)

<a id="function-function-mq3-client-cl-cin-runtime-recursequad-function-recursequad-quads-x-y-size-minsize-src-mq3-client-cl-cin-runtime-ml-2123266547"></a>
### recurseQuad

```ml
function recurseQuad(quads, x, y, size, minSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `quads` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `minSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L52)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodemonotomono-function-rlldecodemonotomono-data-previous-src-mq3-client-cl-cin-runtime-ml-1235143395"></a>
### RllDecodeMonoToMono

```ml
function RllDecodeMonoToMono(data, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L37)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodemonotostereo-function-rlldecodemonotostereo-data-previous-src-mq3-client-cl-cin-runtime-ml-1250107113"></a>
### RllDecodeMonoToStereo

```ml
function RllDecodeMonoToStereo(data, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L38)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodestereotomono-function-rlldecodestereotomono-data-left-right-src-mq3-client-cl-cin-runtime-ml-693575657"></a>
### RllDecodeStereoToMono

```ml
function RllDecodeStereoToMono(data, left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L40)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodestereotostereo-function-rlldecodestereotostereo-data-left-right-src-mq3-client-cl-cin-runtime-ml-1604585915"></a>
### RllDecodeStereoToStereo

```ml
function RllDecodeStereoToStereo(data, left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L39)

<a id="function-function-mq3-client-cl-cin-runtime-rllsetuptable-function-rllsetuptable-src-mq3-client-cl-cin-runtime-ml-828797138"></a>
### RllSetupTable

```ml
function RllSetupTable()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L30)

<a id="function-function-mq3-client-cl-cin-runtime-roq-genyuvtables-function-roq-genyuvtables-state-src-mq3-client-cl-cin-runtime-ml-1308410345"></a>
### ROQ_GenYUVTables

```ml
function ROQ_GenYUVTables(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L27)

<a id="function-function-mq3-client-cl-cin-runtime-roq-init-function-roq-init-movie-src-mq3-client-cl-cin-runtime-ml-1420560812"></a>
### RoQ_init

```ml
function RoQ_init(movie)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L43)

<a id="function-function-mq3-client-cl-cin-runtime-roqfetchinterlaced-function-roqfetchinterlaced-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-2005138029"></a>
### RoQFetchInterlaced

```ml
function RoQFetchInterlaced(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L49)

<a id="function-function-mq3-client-cl-cin-runtime-roqinterrupt-function-roqinterrupt-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-275651845"></a>
### RoQInterrupt

```ml
function RoQInterrupt(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L48)

<a id="function-function-mq3-client-cl-cin-runtime-roqprepmcomp-function-roqprepmcomp-flags-src-mq3-client-cl-cin-runtime-ml-954416691"></a>
### RoQPrepMcomp

```ml
function RoQPrepMcomp(flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L50)

<a id="function-function-mq3-client-cl-cin-runtime-roqreset-function-roqreset-decoder-src-mq3-client-cl-cin-runtime-ml-122352584"></a>
### RoQReset

```ml
function RoQReset(decoder)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L44)

<a id="function-function-mq3-client-cl-cin-runtime-roqshutdown-function-roqshutdown-state-src-mq3-client-cl-cin-runtime-ml-164186477"></a>
### RoQShutdown

```ml
function RoQShutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L45)

<a id="function-function-mq3-client-cl-cin-runtime-scr-drawcinematic-function-scr-drawcinematic-state-src-mq3-client-cl-cin-runtime-ml-1698520017"></a>
### SCR_DrawCinematic

```ml
function SCR_DrawCinematic(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L24)

<a id="function-function-mq3-client-cl-cin-runtime-scr-runcinematic-function-scr-runcinematic-state-now-src-mq3-client-cl-cin-runtime-ml-1924238719"></a>
### SCR_RunCinematic

```ml
function SCR_RunCinematic(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L23)

<a id="function-function-mq3-client-cl-cin-runtime-scr-stopcinematic-function-scr-stopcinematic-state-src-mq3-client-cl-cin-runtime-ml-686849789"></a>
### SCR_StopCinematic

```ml
function SCR_StopCinematic(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L25)

<a id="function-function-mq3-client-cl-cin-runtime-setupquad-function-setupquad-width-height-src-mq3-client-cl-cin-runtime-ml-1422492219"></a>
### setupQuad

```ml
function setupQuad(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L51)

- [mq3.client.cl_cin_runtime.State](Type-mq3-client-cl-cin-runtime-state-1529430935.md) — struct
<a id="function-function-mq3-client-cl-cin-runtime-stereosamples-function-stereosamples-data-left-right-src-mq3-client-cl-cin-runtime-ml-1922516503"></a>
### stereoSamples

```ml
function stereoSamples(data, left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L34)

<a id="function-function-mq3-client-cl-cin-runtime-yuv-to-rgb-function-yuv-to-rgb-y-u-v-src-mq3-client-cl-cin-runtime-ml-1663630716"></a>
### yuv_to_rgb

```ml
function yuv_to_rgb(y, u, v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — |  |
| `u` | `dynamic` | — |  |
| `v` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L28)

<a id="function-function-mq3-client-cl-cin-runtime-yuv-to-rgb24-function-yuv-to-rgb24-y-u-v-src-mq3-client-cl-cin-runtime-ml-1440355100"></a>
### yuv_to_rgb24

```ml
function yuv_to_rgb24(y, u, v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — |  |
| `u` | `dynamic` | — |  |
| `v` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L29)
