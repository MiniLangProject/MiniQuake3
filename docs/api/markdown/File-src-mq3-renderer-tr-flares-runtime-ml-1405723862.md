# `src/mq3/renderer/tr_flares_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_flares_runtime`](Package-mq3-renderer-tr-flares-runtime-914339066.md)

Reachable from entry: **no**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/playable_flares.ml` as `playable` → [src/mq3/renderer/playable_flares.ml](File-src-mq3-renderer-playable-flares-ml-2125885383.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-flares-runtime-activeflare-function-activeflare-state-surface-src-mq3-renderer-tr-flares-runtime-ml-604773562"></a>
### activeFlare

```ml
function activeFlare(state, surface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L27)

<a id="function-function-mq3-renderer-tr-flares-runtime-allocate-function-allocate-state-surface-src-mq3-renderer-tr-flares-runtime-ml-320287386"></a>
### allocate

```ml
function allocate(state, surface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L30)

<a id="function-function-mq3-renderer-tr-flares-runtime-colorbyte-function-colorbyte-value-src-mq3-renderer-tr-flares-runtime-ml-1741583931"></a>
### colorByte

```ml
function colorByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L50)

<a id="function-function-mq3-renderer-tr-flares-runtime-create-function-create-projection-area-fogcatalog-src-mq3-renderer-tr-flares-runtime-ml-125099955"></a>
### create

```ml
function create(projection, area, fogCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L20)

<a id="function-function-mq3-renderer-tr-flares-runtime-emptyflare-function-emptyflare-slot-src-mq3-renderer-tr-flares-runtime-ml-1947585210"></a>
### emptyFlare

```ml
function emptyFlare(slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L19)

<a id="function-function-mq3-renderer-tr-flares-runtime-fail-function-fail-message-src-mq3-renderer-tr-flares-runtime-ml-883384895"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L18)

- [mq3.renderer.tr_flares_runtime.Flare](Type-mq3-renderer-tr-flares-runtime-flare-1198172528.md) — struct
- [mq3.renderer.tr_flares_runtime.Light](Type-mq3-renderer-tr-flares-runtime-light-831865728.md) — struct
<a id="constant-constant-mq3-renderer-tr-flares-runtime-max-flares-const-max-flares-128-src-mq3-renderer-tr-flares-runtime-ml-1713782122"></a>
### MAX_FLARES

```ml
const MAX_FLARES = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L12)

- [mq3.renderer.tr_flares_runtime.Quad](Type-mq3-renderer-tr-flares-runtime-quad-612020883.md) — struct
<a id="function-function-mq3-renderer-tr-flares-runtime-r-clearflares-function-r-clearflares-state-src-mq3-renderer-tr-flares-runtime-ml-2071742699"></a>
### R_ClearFlares

```ml
function R_ClearFlares(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L23)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-adddlightflares-function-rb-adddlightflares-state-lights-src-mq3-renderer-tr-flares-runtime-ml-818236546"></a>
### RB_AddDlightFlares

```ml
function RB_AddDlightFlares(state, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L43)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-addflare-function-rb-addflare-state-surface-fognum-point-color-normal-src-mq3-renderer-tr-flares-runtime-ml-1759373928"></a>
### RB_AddFlare

```ml
function RB_AddFlare(state, surface, fogNum, point, color, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `fogNum` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L33)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-renderflare-function-rb-renderflare-state-flare-src-mq3-renderer-tr-flares-runtime-ml-980327179"></a>
### RB_RenderFlare

```ml
function RB_RenderFlare(state, flare)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flare` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L51)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-renderflares-function-rb-renderflares-state-depthvalues-src-mq3-renderer-tr-flares-runtime-ml-2125314450"></a>
### RB_RenderFlares

```ml
function RB_RenderFlares(state, depthValues)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `depthValues` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L61)

<a id="function-function-mq3-renderer-tr-flares-runtime-rb-testflare-function-rb-testflare-state-flare-surfacedepth-src-mq3-renderer-tr-flares-runtime-ml-1854833679"></a>
### RB_TestFlare

```ml
function RB_TestFlare(state, flare, surfaceDepth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flare` | `dynamic` | — |  |
| `surfaceDepth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L47)

<a id="function-function-mq3-renderer-tr-flares-runtime-removeactive-function-removeactive-state-index-src-mq3-renderer-tr-flares-runtime-ml-2138146215"></a>
### removeActive

```ml
function removeActive(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L58)

- [mq3.renderer.tr_flares_runtime.State](Type-mq3-renderer-tr-flares-runtime-state-1496113281.md) — struct
