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
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.qvm_video_materials.bindStages`. |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.qvm_video_materials.bindStages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L101)

- [mq3.renderer.qvm_video_materials.Binding](Type-mq3-renderer-qvm-video-materials-binding-1368471411.md) — struct
<a id="function-function-mq3-renderer-qvm-video-materials-bindingfor-function-bindingfor-state-path-src-mq3-renderer-qvm-video-materials-ml-1828604228"></a>
### bindingFor

```ml
function bindingFor(state, path)
```

Returns `void` from `mq3.renderer.qvm_video_materials.bindingFor`; earlier branches return `binding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.bindings`. |
| `path` | `dynamic` | — | Argument 2 supplied to `stringEqualsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L66)

<a id="function-function-mq3-renderer-qvm-video-materials-bindstage-function-bindstage-state-stage-now-src-mq3-renderer-qvm-video-materials-ml-1848578709"></a>
### bindStage

```ml
function bindStage(state, stage, now)
```

Updates `state.failedBindings`, `state.bindings`, `stage.slots` in `mq3.renderer.qvm_video_materials.bindStage`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.failedBindings`, `state.bindings`. |
| `stage` | `dynamic` | — | Mutable record or buffer; this call updates `stage.slots`. |
| `now` | `dynamic` | — | Argument 8 supplied to `mq3.client.cinematic_runtime.play`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L74)

<a id="function-function-mq3-renderer-qvm-video-materials-bindstages-function-bindstages-state-stages-now-src-mq3-renderer-qvm-video-materials-ml-119984940"></a>
### bindStages

```ml
function bindStages(state, stages, now)
```

Registers video-backed material stages and returns how many stage bindings were created.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.qvm_video_materials.bindStage`. |
| `stages` | `dynamic` | — | Sequence traversed as `stage` while producing this result. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.qvm_video_materials.bindStage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L92)

<a id="function-function-mq3-renderer-qvm-video-materials-close-function-close-state-src-mq3-renderer-qvm-video-materials-ml-514153837"></a>
### close

```ml
function close(state)
```

Updates `state.bindings` in `mq3.renderer.qvm_video_materials.close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L137)

<a id="function-function-mq3-renderer-qvm-video-materials-create-function-create-cinematicstate-firstscratchslot-scratchslotcount-src-mq3-renderer-qvm-video-materials-ml-793977623"></a>
### create

```ml
function create(cinematicState, firstScratchSlot, scratchSlotCount)
```

Builds `mq3.renderer.qvm_video_materials.State` for `mq3.renderer.qvm_video_materials.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cinematicState` | `dynamic` | — | Initial value for `mq3.renderer.qvm_video_materials.State.cinematics`. |
| `firstScratchSlot` | `dynamic` | — | Initial value for `mq3.renderer.qvm_video_materials.State.firstScratchSlot`. |
| `scratchSlotCount` | `dynamic` | — | Initial value for `mq3.renderer.qvm_video_materials.State.scratchSlotCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L59)

<a id="function-function-mq3-renderer-qvm-video-materials-fail-function-fail-message-src-mq3-renderer-qvm-video-materials-ml-56022007"></a>
### fail

```ml
function fail(message)
```

Creates error `7694` with message `"QVM video materials: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7694,"QVM video materials: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L54)

<a id="constant-constant-mq3-renderer-qvm-video-materials-scratch-height-const-scratch-height-256-src-mq3-renderer-qvm-video-materials-ml-1501043290"></a>
### SCRATCH_HEIGHT

```ml
const SCRATCH_HEIGHT = 256
```

Height in pixels of a scratch texture used for cinematic frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L12)

<a id="constant-constant-mq3-renderer-qvm-video-materials-scratch-width-const-scratch-width-256-src-mq3-renderer-qvm-video-materials-ml-651760916"></a>
### SCRATCH_WIDTH

```ml
const SCRATCH_WIDTH = 256
```

Width in pixels of a scratch texture used for cinematic frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L10)

<a id="function-function-mq3-renderer-qvm-video-materials-scratchpixels-function-scratchpixels-frame-src-mq3-renderer-qvm-video-materials-ml-904312751"></a>
### scratchPixels

```ml
function scratchPixels(frame)
```

Builds `output[target]`, `output[target+1]`, `output[target+2]`, `output[target+3]` in `mq3.renderer.qvm_video_materials.scratchPixels`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frame` | `dynamic` | — | Record providing `frame.width`, `frame.height`, `frame.pixels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L108)

- [mq3.renderer.qvm_video_materials.State](Type-mq3-renderer-qvm-video-materials-state-845008115.md) — struct
<a id="function-function-mq3-renderer-qvm-video-materials-update-function-update-state-now-src-mq3-renderer-qvm-video-materials-ml-1174890167"></a>
### update

```ml
function update(state, now)
```

Advances bound cinematics and returns resized scratch-texture uploads for dirty video frames.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.bindings`, `state.cinematics`. |
| `now` | `dynamic` | — | Argument 3 supplied to `mq3.client.cinematic_runtime.run`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L125)

- [mq3.renderer.qvm_video_materials.Upload](Type-mq3-renderer-qvm-video-materials-upload-1782071811.md) — struct
