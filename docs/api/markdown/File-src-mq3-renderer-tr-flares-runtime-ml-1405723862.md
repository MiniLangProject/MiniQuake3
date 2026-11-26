# `src/mq3/renderer/tr_flares_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_flares_runtime`](Package-mq3-renderer-tr-flares-runtime-914339066.md)

Reachable from entry: **no**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/playable_flares.ml` as `playable` → [src/mq3/renderer/playable_flares.ml](File-src-mq3-renderer-playable-flares-ml-2125885383.md)
- `std/array.ml` as `arrays` → `../../a7594a0c0299/MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-flares-runtime-activeflare-function-activeflare-state-surface-src-mq3-renderer-tr-flares-runtime-ml-604773562"></a>
### activeFlare

```ml
function activeFlare(state, surface)
```

Returns `void` from `mq3.renderer.tr_flares_runtime.activeFlare`; earlier branches return `flare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.active`, `state.slots`, `state.frameSceneNum`, `state.isPortal`. |
| `surface` | `dynamic` | — | Input tested by `flare.surface==surface and flare.frameSceneNum==state.frameSceneNum and flare.inPortal==state.isPortal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L129)

<a id="function-function-mq3-renderer-tr-flares-runtime-allocate-function-allocate-state-surface-src-mq3-renderer-tr-flares-runtime-ml-320287386"></a>
### allocate

```ml
function allocate(state, surface)
```

Updates `state.inactive`, `state.active` in `mq3.renderer.tr_flares_runtime.allocate`; returns `flare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inactive`, `state.active`. |
| `surface` | `dynamic` | — | Value assigned to `flare.surface`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L135)

<a id="function-function-mq3-renderer-tr-flares-runtime-colorbyte-function-colorbyte-value-src-mq3-renderer-tr-flares-runtime-ml-1741583931"></a>
### colorByte

```ml
function colorByte(value)
```

Calls `mq3.renderer.playable_flares.colorByte` with `(value)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_flares.colorByte`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L171)

<a id="function-function-mq3-renderer-tr-flares-runtime-create-function-create-projection-area-fogcatalog-src-mq3-renderer-tr-flares-runtime-ml-125099955"></a>
### create

```ml
function create(projection, area, fogCatalog)
```

Returns `state` from `mq3.renderer.tr_flares_runtime.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Value used for `mq3.renderer.tr_flares_runtime.State.projection`. |
| `area` | `dynamic` | — | Value used for `mq3.renderer.tr_flares_runtime.State.area`. |
| `fogCatalog` | `dynamic` | — | Value used for `mq3.renderer.tr_flares_runtime.State.fogCatalog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L117)

<a id="function-function-mq3-renderer-tr-flares-runtime-emptyflare-function-emptyflare-slot-src-mq3-renderer-tr-flares-runtime-ml-1947585210"></a>
### emptyFlare

```ml
function emptyFlare(slot)
```

Constructs `mq3.renderer.tr_flares_runtime.Flare` with `addedFrame` = `0`, `inPortal` = `false`, `frameSceneNum` = `0`, `surface` = `void` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Initial value for `mq3.renderer.tr_flares_runtime.Flare.slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L112)

<a id="function-function-mq3-renderer-tr-flares-runtime-fail-function-fail-message-src-mq3-renderer-tr-flares-runtime-ml-883384895"></a>
### fail

```ml
function fail(message)
```

Creates error `7740` with message `"tr_flares: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7740,"tr_flares: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L109)

- [mq3.renderer.tr_flares_runtime.Flare](Type-mq3-renderer-tr-flares-runtime-flare-1198172528.md) — struct
- [mq3.renderer.tr_flares_runtime.Light](Type-mq3-renderer-tr-flares-runtime-light-831865728.md) — struct
<a id="constant-constant-mq3-renderer-tr-flares-runtime-max-flares-const-max-flares-128-src-mq3-renderer-tr-flares-runtime-ml-1713782122"></a>
### MAX_FLARES

```ml
const MAX_FLARES = 128
```

Capacity of the renderer's active and inactive flare-slot pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L13)

- [mq3.renderer.tr_flares_runtime.Quad](Type-mq3-renderer-tr-flares-runtime-quad-612020883.md) — struct
<a id="function-function-mq3-renderer-tr-flares-runtime-r-clearflares-function-r-clearflares-state-src-mq3-renderer-tr-flares-runtime-ml-2071742699"></a>
### R_ClearFlares

```ml
function R_ClearFlares(state)
```

Updates `state.slots`, `state.active`, `state.inactive` in `mq3.renderer.tr_flares_runtime.R_ClearFlares`; returns `MAX_FLARES`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.slots`, `state.active`, `state.inactive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L122)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-adddlightflares-function-rb-adddlightflares-state-lights-src-mq3-renderer-tr-flares-runtime-ml-818236546"></a>
### RB_AddDlightFlares

```ml
function RB_AddDlightFlares(state, lights)
```

Adds one fog-classified flare per dynamic light when flare rendering is enabled.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.enabled`, `state.fogCatalog`. |
| `lights` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L158)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-addflare-function-rb-addflare-state-surface-fognum-point-color-normal-src-mq3-renderer-tr-flares-runtime-ml-1759373928"></a>
### RB_AddFlare

```ml
function RB_AddFlare(state, surface, fogNum, point, color, normal)
```

Updates `state.adds` in `mq3.renderer.tr_flares_runtime.RB_AddFlare`; returns `flare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.adds`. |
| `surface` | `dynamic` | — | Value forwarded as `surface` to `mq3.renderer.tr_flares_runtime.activeFlare`. |
| `fogNum` | `dynamic` | — | Value assigned to `flare.fogNum`. |
| `point` | `dynamic` | — | Argument 2 supplied to `mq3.client.playable_viewer.projectPrepared`. |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `axis`. |
| `normal` | `dynamic` | — | Value assigned to `flare.normal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L145)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-renderflare-function-rb-renderflare-state-flare-src-mq3-renderer-tr-flares-runtime-ml-980327179"></a>
### RB_RenderFlare

```ml
function RB_RenderFlare(state, flare)
```

Builds `mq3.renderer.tr_flares_runtime.Quad` after updating `state.renders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.renders`. |
| `flare` | `dynamic` | — | Record providing `flare.color`, `flare.drawIntensity`, `flare.fogNum`, `flare.origin`, `flare.normal`, `flare.eyeZ`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L175)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-renderflares-function-rb-renderflares-state-depthvalues-src-mq3-renderer-tr-flares-runtime-ml-2125314450"></a>
### RB_RenderFlares

```ml
function RB_RenderFlares(state, depthValues)
```

Builds `flare.drawIntensity` in `mq3.renderer.tr_flares_runtime.RB_RenderFlares`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.enabled`, `state.active`, `state.slots`, `state.frameCount`, `state.frameSceneNum`, `state.isPortal`. |
| `depthValues` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L191)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-testflare-function-rb-testflare-state-flare-surfacedepth-src-mq3-renderer-tr-flares-runtime-ml-1854833679"></a>
### RB_TestFlare

```ml
function RB_TestFlare(state, flare, surfaceDepth)
```

Updates `state.tests`, `state.finishCalled` in `mq3.renderer.tr_flares_runtime.RB_TestFlare`; returns `playable.updateState(flare,visible,state.time,state.fadeRate)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.tests`, `state.finishCalled`. |
| `flare` | `dynamic` | — | Record providing `flare.eyeZ`. |
| `surfaceDepth` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_flares.visibleAtDepth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L166)

<a id="function-function-mq3-renderer-tr-flares-runtime-removeactive-function-removeactive-state-index-src-mq3-renderer-tr-flares-runtime-ml-2138146215"></a>
### removeActive

```ml
function removeActive(state, index)
```

Updates `state.active`, `state.inactive` in `mq3.renderer.tr_flares_runtime.removeActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`, `state.inactive`. |
| `index` | `dynamic` | — | Input used by `for each value in state.active if value!=index then next=next+[value]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_flares_runtime.ml#L185)

- [mq3.renderer.tr_flares_runtime.State](Type-mq3-renderer-tr-flares-runtime-state-1496113281.md) — struct
