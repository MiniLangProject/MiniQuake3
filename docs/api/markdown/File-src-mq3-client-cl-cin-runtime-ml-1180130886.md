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

Adapts `mq3.video.roq_video.writeBlock` to engine client cin runtime `blit2_32`, returning its result for `buffer, width, height, x, y, 2, pixels`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.writeBlock`. |
| `width` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.writeBlock`. |
| `height` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.writeBlock`. |
| `x` | `dynamic` | — | Argument 4 of `mq3.video.roq_video.writeBlock`. |
| `y` | `dynamic` | — | Argument 5 of `mq3.video.roq_video.writeBlock`. |
| `pixels` | `dynamic` | — | Argument 7 of `mq3.video.roq_video.writeBlock`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L194)

<a id="function-function-mq3-client-cl-cin-runtime-blit4-32-function-blit4-32-buffer-width-height-x-y-pixels-src-mq3-client-cl-cin-runtime-ml-566772815"></a>
### blit4_32

```ml
function blit4_32(buffer, width, height, x, y, pixels)
```

Adapts `mq3.video.roq_video.writeBlock` to engine client cin runtime `blit4_32`, returning its result for `buffer, width, height, x, y, 4, pixels`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.writeBlock`. |
| `width` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.writeBlock`. |
| `height` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.writeBlock`. |
| `x` | `dynamic` | — | Argument 4 of `mq3.video.roq_video.writeBlock`. |
| `y` | `dynamic` | — | Argument 5 of `mq3.video.roq_video.writeBlock`. |
| `pixels` | `dynamic` | — | Argument 7 of `mq3.video.roq_video.writeBlock`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L202)

<a id="function-function-mq3-client-cl-cin-runtime-blit8-32-function-blit8-32-buffer-width-height-x-y-pixels-src-mq3-client-cl-cin-runtime-ml-643632007"></a>
### blit8_32

```ml
function blit8_32(buffer, width, height, x, y, pixels)
```

Adapts `mq3.video.roq_video.writeBlock` to engine client cin runtime `blit8_32`, returning its result for `buffer, width, height, x, y, 8, pixels`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.writeBlock`. |
| `width` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.writeBlock`. |
| `height` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.writeBlock`. |
| `x` | `dynamic` | — | Argument 4 of `mq3.video.roq_video.writeBlock`. |
| `y` | `dynamic` | — | Argument 5 of `mq3.video.roq_video.writeBlock`. |
| `pixels` | `dynamic` | — | Argument 7 of `mq3.video.roq_video.writeBlock`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L210)

<a id="function-function-mq3-client-cl-cin-runtime-blitvqquad32fs-function-blitvqquad32fs-decoder-input-destination-previous-x-y-xoff-yoff-src-mq3-client-cl-cin-runtime-ml-1738287479"></a>
### blitVQQuad32fs

```ml
function blitVQQuad32fs(decoder, input, destination, previous, x, y, xoff, yoff)
```

Adapts `mq3.video.roq_video.decodeSmall` to engine client cin runtime `blitVQQuad32fs`, returning its result for `decoder, input, destination, previous, x, y, xoff, yoff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.decodeSmall`. |
| `input` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.decodeSmall`. |
| `destination` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.decodeSmall`. |
| `previous` | `dynamic` | — | Argument 4 of `mq3.video.roq_video.decodeSmall`. |
| `x` | `dynamic` | — | Argument 5 of `mq3.video.roq_video.decodeSmall`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.video.roq_video.decodeSmall`. |
| `xoff` | `dynamic` | — | Argument 7 of `mq3.video.roq_video.decodeSmall`. |
| `yoff` | `dynamic` | — | Argument 8 of `mq3.video.roq_video.decodeSmall`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L242)

<a id="function-function-mq3-client-cl-cin-runtime-cin-closeallvideos-function-cin-closeallvideos-state-src-mq3-client-cl-cin-runtime-ml-2035583277"></a>
### CIN_CloseAllVideos

```ml
function CIN_CloseAllVideos(state)
```

Updates `state.currentHandle` during engine client cin runtime `CIN_CloseAllVideos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L77)

<a id="function-function-mq3-client-cl-cin-runtime-cin-drawcinematic-function-cin-drawcinematic-state-handle-src-mq3-client-cl-cin-runtime-ml-1042272519"></a>
### CIN_DrawCinematic

```ml
function CIN_DrawCinematic(state, handle)
```

Adapts `mq3.client.cinematic_runtime.draw` to engine client cin runtime `CIN_DrawCinematic`, returning its result for `state.runtime, handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.runtime`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.cinematic_runtime.draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L57)

<a id="function-function-mq3-client-cl-cin-runtime-cin-handleforvideo-function-cin-handleforvideo-state-name-src-mq3-client-cl-cin-runtime-ml-729492714"></a>
### CIN_HandleForVideo

```ml
function CIN_HandleForVideo(state, name)
```

Calls `stringEqualsIgnoreCaseAscii`, `mq3.client.cinematic_runtime.pathFor` from engine client cin runtime `CIN_HandleForVideo`. The final path returns `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.runtime.handles`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding engine client cin runtime resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L34)

<a id="function-function-mq3-client-cl-cin-runtime-cin-playcinematic-function-cin-playcinematic-state-name-x-y-width-height-bits-now-src-mq3-client-cl-cin-runtime-ml-226803760"></a>
### CIN_PlayCinematic

```ml
function CIN_PlayCinematic(state, name, x, y, width, height, bits, now)
```

Updates `state.currentHandle` during engine client cin runtime `CIN_PlayCinematic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding engine client cin runtime resource. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `CIN_PlayCinematic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `CIN_PlayCinematic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `CIN_PlayCinematic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `CIN_PlayCinematic`. |
| `bits` | `dynamic` | — | Value used by `handle=cinematic.play(state.runtime,name,x,y,width,height,bits,now)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L44)

<a id="function-function-mq3-client-cl-cin-runtime-cin-runcinematic-function-cin-runcinematic-state-handle-now-src-mq3-client-cl-cin-runtime-ml-1470213577"></a>
### CIN_RunCinematic

```ml
function CIN_RunCinematic(state, handle, now)
```

Adapts `mq3.client.cinematic_runtime.run` to engine client cin runtime `CIN_RunCinematic`, returning its result for `state.runtime, handle, now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.runtime`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.cinematic_runtime.run`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.cinematic_runtime.run`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L53)

<a id="function-function-mq3-client-cl-cin-runtime-cin-setextents-function-cin-setextents-state-handle-x-y-width-height-src-mq3-client-cl-cin-runtime-ml-1428924339"></a>
### CIN_SetExtents

```ml
function CIN_SetExtents(state, handle, x, y, width, height)
```

Adapts `mq3.client.cinematic_runtime.setExtents` to engine client cin runtime `CIN_SetExtents`, returning its result for `state.runtime, handle, x, y, width, height`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.runtime`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.cinematic_runtime.setExtents`. |
| `x` | `dynamic` | — | Argument 3 of `mq3.client.cinematic_runtime.setExtents`. |
| `y` | `dynamic` | — | Argument 4 of `mq3.client.cinematic_runtime.setExtents`. |
| `width` | `dynamic` | — | Argument 5 of `mq3.client.cinematic_runtime.setExtents`. |
| `height` | `dynamic` | — | Argument 6 of `mq3.client.cinematic_runtime.setExtents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L69)

<a id="function-function-mq3-client-cl-cin-runtime-cin-setlooping-function-cin-setlooping-state-handle-looping-src-mq3-client-cl-cin-runtime-ml-1800888071"></a>
### CIN_SetLooping

```ml
function CIN_SetLooping(state, handle, looping)
```

Updates `state.runtime.handles[handle].looping` during engine client cin runtime `CIN_SetLooping`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.runtime.handles[handle].looping`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `CIN_SetLooping`. |
| `looping` | `dynamic` | — | Value used by `state.runtime.handles[handle].looping=looping`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L74)

<a id="function-function-mq3-client-cl-cin-runtime-cin-stopcinematic-function-cin-stopcinematic-state-handle-src-mq3-client-cl-cin-runtime-ml-1836897487"></a>
### CIN_StopCinematic

```ml
function CIN_StopCinematic(state, handle)
```

Updates `state.currentHandle` during engine client cin runtime `CIN_StopCinematic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `CIN_StopCinematic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L48)

<a id="function-function-mq3-client-cl-cin-runtime-cin-uploadcinematic-function-cin-uploadcinematic-state-handle-src-mq3-client-cl-cin-runtime-ml-2141892849"></a>
### CIN_UploadCinematic

```ml
function CIN_UploadCinematic(state, handle)
```

Adapts `mq3.client.cinematic_runtime.upload` to engine client cin runtime `CIN_UploadCinematic`, returning its result for `state.runtime, handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.runtime`. |
| `handle` | `dynamic` | — | Argument 2 of `mq3.client.cinematic_runtime.upload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L61)

<a id="function-function-mq3-client-cl-cin-runtime-cl-playcinematic-f-function-cl-playcinematic-f-state-args-now-src-mq3-client-cl-cin-runtime-ml-152167508"></a>
### CL_PlayCinematic_f

```ml
function CL_PlayCinematic_f(state, args, now)
```

Calls `mq3.client.cl_cin_runtime.CIN_PlayCinematic` from engine client cin runtime `CL_PlayCinematic_f`. The final path returns `CIN_PlayCinematic(state,args[1],0,0,640,480,cinematic.CIN_SYSTEM,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client cin runtime state passed to the helper calls in `CL_PlayCinematic_f`. |
| `args` | `dynamic` | — | Sequence read at `args[1]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L82)

<a id="function-function-mq3-client-cl-cin-runtime-create-function-create-runtime-src-mq3-client-cl-cin-runtime-ml-314418416"></a>
### create

```ml
function create(runtime)
```

Creates a `mq3.client.cl_cin_runtime.State` record. Assigns `runtime` from `runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Value used to initialize `State.runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L29)

<a id="function-function-mq3-client-cl-cin-runtime-decodecodebook-function-decodecodebook-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-2065010529"></a>
### decodeCodeBook

```ml
function decodeCodeBook(decoder, movie, chunk)
```

Adapts `mq3.video.roq_video.decodeCodebook` to engine client cin runtime `decodeCodeBook`, returning its result for `decoder, movie, chunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.decodeCodebook`. |
| `movie` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.decodeCodebook`. |
| `chunk` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.decodeCodebook`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L162)

<a id="function-function-mq3-client-cl-cin-runtime-initroq-function-initroq-data-src-mq3-client-cl-cin-runtime-ml-606205388"></a>
### initRoQ

```ml
function initRoQ(data)
```

Adapts `mq3.format.roq.parse` to engine client cin runtime `initRoQ`, returning its result for `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 of `mq3.format.roq.parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L143)

<a id="function-function-mq3-client-cl-cin-runtime-monosamples-function-monosamples-data-previous-src-mq3-client-cl-cin-runtime-ml-1733188545"></a>
### monoSamples

```ml
function monoSamples(data, previous)
```

Calls `mq3.format.roq.signed16`, `mq3.format.roq.squareDelta` from engine client cin runtime `monoSamples`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[i]`. |
| `previous` | `dynamic` | — | Value used by `for i=0 to len(data)-1 previous=roq.signed16(previous+roq.squareDelta(data[i]))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L112)

<a id="function-function-mq3-client-cl-cin-runtime-move4-32-function-move4-32-destination-previous-width-height-x-y-vector-xoff-yoff-src-mq3-client-cl-cin-runtime-ml-1782117465"></a>
### move4_32

```ml
function move4_32(destination, previous, width, height, x, y, vector, xoff, yoff)
```

Adapts `mq3.video.roq_video.copyMotion` to engine client cin runtime `move4_32`, returning its result for `destination, previous, width, height, x, y, 4, vector, xoff, yoff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.copyMotion`. |
| `previous` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.copyMotion`. |
| `width` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.copyMotion`. |
| `height` | `dynamic` | — | Argument 4 of `mq3.video.roq_video.copyMotion`. |
| `x` | `dynamic` | — | Argument 5 of `mq3.video.roq_video.copyMotion`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.video.roq_video.copyMotion`. |
| `vector` | `dynamic` | — | Argument 8 of `mq3.video.roq_video.copyMotion`. |
| `xoff` | `dynamic` | — | Argument 9 of `mq3.video.roq_video.copyMotion`. |
| `yoff` | `dynamic` | — | Argument 10 of `mq3.video.roq_video.copyMotion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L221)

<a id="function-function-mq3-client-cl-cin-runtime-move8-32-function-move8-32-destination-previous-width-height-x-y-vector-xoff-yoff-src-mq3-client-cl-cin-runtime-ml-1084509473"></a>
### move8_32

```ml
function move8_32(destination, previous, width, height, x, y, vector, xoff, yoff)
```

Adapts `mq3.video.roq_video.copyMotion` to engine client cin runtime `move8_32`, returning its result for `destination, previous, width, height, x, y, 8, vector, xoff, yoff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.copyMotion`. |
| `previous` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.copyMotion`. |
| `width` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.copyMotion`. |
| `height` | `dynamic` | — | Argument 4 of `mq3.video.roq_video.copyMotion`. |
| `x` | `dynamic` | — | Argument 5 of `mq3.video.roq_video.copyMotion`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.video.roq_video.copyMotion`. |
| `vector` | `dynamic` | — | Argument 8 of `mq3.video.roq_video.copyMotion`. |
| `xoff` | `dynamic` | — | Argument 9 of `mq3.video.roq_video.copyMotion`. |
| `yoff` | `dynamic` | — | Argument 10 of `mq3.video.roq_video.copyMotion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L232)

<a id="function-function-mq3-client-cl-cin-runtime-readquadinfo-function-readquadinfo-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-734819829"></a>
### readQuadInfo

```ml
function readQuadInfo(decoder, movie, chunk)
```

Adapts `mq3.video.roq_video.setInfo` to engine client cin runtime `readQuadInfo`, returning its result for `decoder, movie, chunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.setInfo`. |
| `movie` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.setInfo`. |
| `chunk` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.setInfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L157)

<a id="function-function-mq3-client-cl-cin-runtime-recursequad-function-recursequad-quads-x-y-size-minsize-src-mq3-client-cl-cin-runtime-ml-2123266547"></a>
### recurseQuad

```ml
function recurseQuad(quads, x, y, size, minSize)
```

Calls `mq3.client.cl_cin_runtime.recurseQuad` from engine client cin runtime `recurseQuad`. The final path returns `recurseQuad(quads,x+half,y+half,half,minSize)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `quads` | `dynamic` | — | Value used by `if size<=minSize then return quads+[[x,y,size]] end if`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `recurseQuad`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `recurseQuad`. |
| `size` | `dynamic` | — | Value tested by `size<=minSize` before the calculation continues. |
| `minSize` | `dynamic` | — | Value used by `if size<=minSize then return quads+[[x,y,size]] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L186)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodemonotomono-function-rlldecodemonotomono-data-previous-src-mq3-client-cl-cin-runtime-ml-1235143395"></a>
### RllDecodeMonoToMono

```ml
function RllDecodeMonoToMono(data, previous)
```

Adapts `mq3.client.cl_cin_runtime.monoSamples` to engine client cin runtime `RllDecodeMonoToMono`, returning its result for `data, previous`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 of `mq3.client.cl_cin_runtime.monoSamples`. |
| `previous` | `dynamic` | — | Argument 2 of `mq3.client.cl_cin_runtime.monoSamples`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L125)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodemonotostereo-function-rlldecodemonotostereo-data-previous-src-mq3-client-cl-cin-runtime-ml-1250107113"></a>
### RllDecodeMonoToStereo

```ml
function RllDecodeMonoToStereo(data, previous)
```

Calls `mq3.client.cl_cin_runtime.monoSamples` from engine client cin runtime `RllDecodeMonoToStereo`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `for each sample in monoSamples(data,previous) output=output+[[sample,sample]] end for`. |
| `previous` | `dynamic` | — | Value used by `for each sample in monoSamples(data,previous) output=output+[[sample,sample]] end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L129)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodestereotomono-function-rlldecodestereotomono-data-left-right-src-mq3-client-cl-cin-runtime-ml-693575657"></a>
### RllDecodeStereoToMono

```ml
function RllDecodeStereoToMono(data, left, right)
```

Calls `mq3.client.cl_cin_runtime.stereoSamples` from engine client cin runtime `RllDecodeStereoToMono`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for`. |
| `left` | `dynamic` | — | Value used by `for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for`. |
| `right` | `dynamic` | — | Value used by `for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L139)

<a id="function-function-mq3-client-cl-cin-runtime-rlldecodestereotostereo-function-rlldecodestereotostereo-data-left-right-src-mq3-client-cl-cin-runtime-ml-1604585915"></a>
### RllDecodeStereoToStereo

```ml
function RllDecodeStereoToStereo(data, left, right)
```

Adapts `mq3.client.cl_cin_runtime.stereoSamples` to engine client cin runtime `RllDecodeStereoToStereo`, returning its result for `data, left, right`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 of `mq3.client.cl_cin_runtime.stereoSamples`. |
| `left` | `dynamic` | — | Argument 2 of `mq3.client.cl_cin_runtime.stereoSamples`. |
| `right` | `dynamic` | — | Argument 3 of `mq3.client.cl_cin_runtime.stereoSamples`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L134)

<a id="function-function-mq3-client-cl-cin-runtime-rllsetuptable-function-rllsetuptable-src-mq3-client-cl-cin-runtime-ml-828797138"></a>
### RllSetupTable

```ml
function RllSetupTable()
```

Calls `mq3.format.roq.squareDelta` from engine client cin runtime `RllSetupTable`. The final path returns `table`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L108)

<a id="function-function-mq3-client-cl-cin-runtime-roq-genyuvtables-function-roq-genyuvtables-state-src-mq3-client-cl-cin-runtime-ml-1308410345"></a>
### ROQ_GenYUVTables

```ml
function ROQ_GenYUVTables(state)
```

Updates `state.yuvTable` during engine client cin runtime `ROQ_GenYUVTables`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.yuvTable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L96)

<a id="function-function-mq3-client-cl-cin-runtime-roq-init-function-roq-init-movie-src-mq3-client-cl-cin-runtime-ml-1420560812"></a>
### RoQ_init

```ml
function RoQ_init(movie)
```

Builds the engine client cin runtime `RoQ_init` sequence from `[movie,video.create(),0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — | Value used by `return [movie,video.create(),0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L146)

<a id="function-function-mq3-client-cl-cin-runtime-roqfetchinterlaced-function-roqfetchinterlaced-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-2005138029"></a>
### RoQFetchInterlaced

```ml
function RoQFetchInterlaced(decoder, movie, chunk)
```

Adapts `mq3.video.roq_video.process` to engine client cin runtime `RoQFetchInterlaced`, returning its result for `decoder, movie, chunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.process`. |
| `movie` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.process`. |
| `chunk` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.process`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L172)

<a id="function-function-mq3-client-cl-cin-runtime-roqinterrupt-function-roqinterrupt-decoder-movie-chunk-src-mq3-client-cl-cin-runtime-ml-275651845"></a>
### RoQInterrupt

```ml
function RoQInterrupt(decoder, movie, chunk)
```

Adapts `mq3.video.roq_video.process` to engine client cin runtime `RoQInterrupt`, returning its result for `decoder, movie, chunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.process`. |
| `movie` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.process`. |
| `chunk` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.process`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L167)

<a id="function-function-mq3-client-cl-cin-runtime-roqprepmcomp-function-roqprepmcomp-flags-src-mq3-client-cl-cin-runtime-ml-954416691"></a>
### RoQPrepMcomp

```ml
function RoQPrepMcomp(flags)
```

Evaluates engine client cin runtime `RoQPrepMcomp` and returns `[xoff,yoff]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Value used by `xoff=flags>>8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L175)

<a id="function-function-mq3-client-cl-cin-runtime-roqreset-function-roqreset-decoder-src-mq3-client-cl-cin-runtime-ml-122352584"></a>
### RoQReset

```ml
function RoQReset(decoder)
```

Updates `decoder.width`, `decoder.height`, `decoder.q2`, `decoder.q4` and additional values during engine client cin runtime `RoQReset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `decoder.width`, `decoder.height`, `decoder.q2`, `decoder.q4` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L149)

<a id="function-function-mq3-client-cl-cin-runtime-roqshutdown-function-roqshutdown-state-src-mq3-client-cl-cin-runtime-ml-164186477"></a>
### RoQShutdown

```ml
function RoQShutdown(state)
```

Updates `state.currentHandle` during engine client cin runtime `RoQShutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L152)

<a id="function-function-mq3-client-cl-cin-runtime-scr-drawcinematic-function-scr-drawcinematic-state-src-mq3-client-cl-cin-runtime-ml-1698520017"></a>
### SCR_DrawCinematic

```ml
function SCR_DrawCinematic(state)
```

Updates `state.screenDraws` during engine client cin runtime `SCR_DrawCinematic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client cin runtime record/storage; this routine assigns `state.screenDraws`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L89)

<a id="function-function-mq3-client-cl-cin-runtime-scr-runcinematic-function-scr-runcinematic-state-now-src-mq3-client-cl-cin-runtime-ml-1924238719"></a>
### SCR_RunCinematic

```ml
function SCR_RunCinematic(state, now)
```

Calls `mq3.client.cl_cin_runtime.CIN_RunCinematic` from engine client cin runtime `SCR_RunCinematic`. The final path returns `CIN_RunCinematic(state,state.currentHandle,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentHandle`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L86)

<a id="function-function-mq3-client-cl-cin-runtime-scr-stopcinematic-function-scr-stopcinematic-state-src-mq3-client-cl-cin-runtime-ml-686849789"></a>
### SCR_StopCinematic

```ml
function SCR_StopCinematic(state)
```

Calls `mq3.client.cl_cin_runtime.CIN_StopCinematic` from engine client cin runtime `SCR_StopCinematic`. The final path returns `CIN_StopCinematic(state,state.currentHandle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L92)

<a id="function-function-mq3-client-cl-cin-runtime-setupquad-function-setupquad-width-height-src-mq3-client-cl-cin-runtime-ml-1422492219"></a>
### setupQuad

```ml
function setupQuad(width, height)
```

Evaluates engine client cin runtime `setupQuad` and returns `quads` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `setupQuad`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `setupQuad`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L179)

- [mq3.client.cl_cin_runtime.State](Type-mq3-client-cl-cin-runtime-state-1529430935.md) — struct
<a id="function-function-mq3-client-cl-cin-runtime-stereosamples-function-stereosamples-data-left-right-src-mq3-client-cl-cin-runtime-ml-1922516503"></a>
### stereoSamples

```ml
function stereoSamples(data, left, right)
```

Calls `mq3.format.roq.signed16`, `mq3.format.roq.squareDelta` from engine client cin runtime `stereoSamples`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[i]`, `data[i+1]`. |
| `left` | `dynamic` | — | Value used by `while i<len(data) left=roq.signed16(left+roq.squareDelta(data[i]))`. |
| `right` | `dynamic` | — | Value used by `right=roq.signed16(right+roq.squareDelta(data[i+1]))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L119)

<a id="function-function-mq3-client-cl-cin-runtime-yuv-to-rgb-function-yuv-to-rgb-y-u-v-src-mq3-client-cl-cin-runtime-ml-1663630716"></a>
### yuv_to_rgb

```ml
function yuv_to_rgb(y, u, v)
```

Adapts `mq3.video.roq_video.yuv` to engine client cin runtime `yuv_to_rgb`, returning its result for `y, u, v`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — | Argument 1 of `mq3.video.roq_video.yuv`. |
| `u` | `dynamic` | — | Argument 2 of `mq3.video.roq_video.yuv`. |
| `v` | `dynamic` | — | Argument 3 of `mq3.video.roq_video.yuv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L101)

<a id="function-function-mq3-client-cl-cin-runtime-yuv-to-rgb24-function-yuv-to-rgb24-y-u-v-src-mq3-client-cl-cin-runtime-ml-1440355100"></a>
### yuv_to_rgb24

```ml
function yuv_to_rgb24(y, u, v)
```

Calls `mq3.video.roq_video.yuv` from engine client cin runtime `yuv_to_rgb24`. The final path returns `[rgb[0],rgb[1],rgb[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `yuv_to_rgb24`. |
| `u` | `dynamic` | — | Value used by `rgb=video.yuv(y,u,v)`. |
| `v` | `dynamic` | — | Value used by `rgb=video.yuv(y,u,v)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cin_runtime.ml#L106)
