# `src/mq3/renderer/qvm_video_materials.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_video_materials`](Package-mq3-renderer-qvm-video-materials-376260372.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cinematic_runtime.ml` as `cinematics` → [src/mq3/client/cinematic_runtime.ml](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)

## Declarations

<a id="function-function-mq3-renderer-qvm-video-materials-bindcatalog-function-bindcatalog-state-catalog-now-src-mq3-renderer-qvm-video-materials-ml-1888203686"></a>
### bindCatalog

```ml
function bindCatalog(state, catalog, now)
```

Catalog is intentionally structural: both qvm_scene_materials.Catalog and qvm_2d_batch.Catalog expose materials[*].stages.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L45)

- [mq3.renderer.qvm_video_materials.Binding](Type-mq3-renderer-qvm-video-materials-binding-1368471411.md) — struct
<a id="function-function-mq3-renderer-qvm-video-materials-bindingfor-function-bindingfor-state-path-src-mq3-renderer-qvm-video-materials-ml-1828604228"></a>
### bindingFor

```ml
function bindingFor(state, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L21)

<a id="function-function-mq3-renderer-qvm-video-materials-bindstage-function-bindstage-state-stage-now-src-mq3-renderer-qvm-video-materials-ml-1848578709"></a>
### bindStage

```ml
function bindStage(state, stage, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L25)

<a id="function-function-mq3-renderer-qvm-video-materials-bindstages-function-bindstages-state-stages-now-src-mq3-renderer-qvm-video-materials-ml-119984940"></a>
### bindStages

```ml
function bindStages(state, stages, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stages` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L39)

<a id="function-function-mq3-renderer-qvm-video-materials-close-function-close-state-src-mq3-renderer-qvm-video-materials-ml-514153837"></a>
### close

```ml
function close(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L74)

<a id="function-function-mq3-renderer-qvm-video-materials-create-function-create-cinematicstate-firstscratchslot-scratchslotcount-src-mq3-renderer-qvm-video-materials-ml-793977623"></a>
### create

```ml
function create(cinematicState, firstScratchSlot, scratchSlotCount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cinematicState` | `dynamic` | — |  |
| `firstScratchSlot` | `dynamic` | — |  |
| `scratchSlotCount` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L17)

<a id="function-function-mq3-renderer-qvm-video-materials-fail-function-fail-message-src-mq3-renderer-qvm-video-materials-ml-56022007"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L16)

<a id="constant-constant-mq3-renderer-qvm-video-materials-scratch-height-const-scratch-height-256-src-mq3-renderer-qvm-video-materials-ml-1501043290"></a>
### SCRATCH_HEIGHT

```ml
const SCRATCH_HEIGHT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L10)

<a id="constant-constant-mq3-renderer-qvm-video-materials-scratch-width-const-scratch-width-256-src-mq3-renderer-qvm-video-materials-ml-651760916"></a>
### SCRATCH_WIDTH

```ml
const SCRATCH_WIDTH = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L9)

<a id="function-function-mq3-renderer-qvm-video-materials-scratchpixels-function-scratchpixels-frame-src-mq3-renderer-qvm-video-materials-ml-904312751"></a>
### scratchPixels

```ml
function scratchPixels(frame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frame` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L50)

- [mq3.renderer.qvm_video_materials.State](Type-mq3-renderer-qvm-video-materials-state-845008115.md) — struct
<a id="function-function-mq3-renderer-qvm-video-materials-update-function-update-state-now-src-mq3-renderer-qvm-video-materials-ml-1174890167"></a>
### update

```ml
function update(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L64)

- [mq3.renderer.qvm_video_materials.Upload](Type-mq3-renderer-qvm-video-materials-upload-1782071811.md) — struct
