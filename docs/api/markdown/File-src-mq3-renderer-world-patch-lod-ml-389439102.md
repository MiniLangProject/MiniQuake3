# `src/mq3/renderer/world_patch_lod.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.world_patch_lod`](Package-mq3-renderer-world-patch-lod-218549522.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/bsp_render_data.ml` as `render` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/patch_stitch.ml` as `patchStitch` → [src/mq3/renderer/patch_stitch.ml](File-src-mq3-renderer-patch-stitch-ml-2036325899.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/sort.ml` as `sorting` → `../MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-world-patch-lod-addthresholds-function-addthresholds-values-size-thresholds-src-mq3-renderer-world-patch-lod-ml-800538089"></a>
### addThresholds

```ml
function addThresholds(values, size, thresholds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `thresholds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L59)

<a id="function-function-mq3-renderer-world-patch-lod-axes-function-axes-grid-src-mq3-renderer-world-patch-lod-ml-568581798"></a>
### axes

```ml
function axes(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L70)

<a id="function-function-mq3-renderer-world-patch-lod-before-function-before-left-right-src-mq3-renderer-world-patch-lod-ml-2121927533"></a>
### before

```ml
function before(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L58)

<a id="function-function-mq3-renderer-world-patch-lod-fail-function-fail-message-src-mq3-renderer-world-patch-lod-ml-1632018331"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L18)

<a id="function-function-mq3-renderer-world-patch-lod-read-function-read-map-face-faceoffset-texture-patcherror-src-mq3-renderer-world-patch-lod-ml-1523984734"></a>
### read

```ml
function read(map, face, faceOffset, texture, patchError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `face` | `dynamic` | — |  |
| `faceOffset` | `dynamic` | — |  |
| `texture` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L20)

<a id="function-function-mq3-renderer-world-patch-lod-select-function-select-patch-position-forward-curveerror-src-mq3-renderer-world-patch-lod-ml-106502577"></a>
### select

```ml
function select(patch, position, forward, curveError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `curveError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L94)

<a id="function-function-mq3-renderer-world-patch-lod-selectaxis-function-selectaxis-size-errors-threshold-src-mq3-renderer-world-patch-lod-ml-1045499209"></a>
### selectAxis

```ml
function selectAxis(size, errors, threshold)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — |  |
| `errors` | `dynamic` | — |  |
| `threshold` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L64)

<a id="function-function-mq3-renderer-world-patch-lod-stitch-function-stitch-patches-src-mq3-renderer-world-patch-lod-ml-1605984232"></a>
### stitch

```ml
function stitch(patches)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patches` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L35)

<a id="function-function-mq3-renderer-world-patch-lod-triangles-function-triangles-patch-variant-face-src-mq3-renderer-world-patch-lod-ml-348996474"></a>
### triangles

```ml
function triangles(patch, variant, face)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — |  |
| `variant` | `dynamic` | — |  |
| `face` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_patch_lod.ml#L85)

- [mq3.renderer.world_patch_lod.WorldLodAxis](Type-mq3-renderer-world-patch-lod-worldlodaxis-27998858.md) — struct
- [mq3.renderer.world_patch_lod.WorldLodPatch](Type-mq3-renderer-world-patch-lod-worldlodpatch-841667267.md) — struct
- [mq3.renderer.world_patch_lod.WorldLodVariant](Type-mq3-renderer-world-patch-lod-worldlodvariant-1151902800.md) — struct
- [mq3.renderer.world_patch_lod.WorldPatchGrid](Type-mq3-renderer-world-patch-lod-worldpatchgrid-852917366.md) — struct
