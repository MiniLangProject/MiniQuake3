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

Collects positive interior LOD-error values into the supplied threshold list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Indexed input read at `index`. |
| `size` | `dynamic` | — | Input tested by `size>2`. |
| `thresholds` | `dynamic` | — | Record providing `thresholds.add`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L80)

<a id="function-function-mq3-renderer-world-patch-lod-axes-function-axes-grid-src-mq3-renderer-world-patch-lod-ml-568581798"></a>
### axes

```ml
function axes(grid)
```

Computes `axes` from `variants.toArray()` using `std.ds.list.List.withCapacity`, `thresholds.add`, `mq3.renderer.world_patch_lod.addThresholds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.width`, `grid.height`, `grid.widthLodError`, `grid.heightLodError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L97)

<a id="function-function-mq3-renderer-world-patch-lod-before-function-before-left-right-src-mq3-renderer-world-patch-lod-ml-2121927533"></a>
### before

```ml
function before(left, right)
```

Computes `left<right` for `mq3.renderer.world_patch_lod.before`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Input used in the result expression `left<right`. |
| `right` | `dynamic` | — | Input used in the result expression `left<right`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L75)

<a id="function-function-mq3-renderer-world-patch-lod-fail-function-fail-message-src-mq3-renderer-world-patch-lod-ml-1632018331"></a>
### fail

```ml
function fail(message)
```

Creates error `7490` with message `"World patch LOD: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7490,"World patch LOD: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L24)

<a id="function-function-mq3-renderer-world-patch-lod-read-function-read-map-face-faceoffset-texture-patcherror-src-mq3-renderer-world-patch-lod-ml-1523984734"></a>
### read

```ml
function read(map, face, faceOffset, texture, patchError)
```

Builds `mq3.renderer.world_patch_lod.WorldLodPatch` after updating `first[axis]`, `origin[axis]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.counts`. |
| `face` | `dynamic` | — | Initial value for `mq3.renderer.world_patch_lod.WorldLodPatch.face`. |
| `faceOffset` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.patchGrid`. |
| `texture` | `dynamic` | — | Initial value for `mq3.renderer.world_patch_lod.WorldLodPatch.texture`. |
| `patchError` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.patchGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L32)

<a id="function-function-mq3-renderer-world-patch-lod-select-function-select-patch-position-forward-curveerror-src-mq3-renderer-world-patch-lod-ml-106502577"></a>
### select

```ml
function select(patch, position, forward, curveError)
```

Computes `select` from `patch.variants[0].face` using `mq3.compat.numeric.fsub`, `mq3.shared.math.DotProduct`, `mq3.compat.numeric.fneg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record providing `patch.variants`, `patch.face`, `patch.grid`. |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `forward` | `dynamic` | — | Argument 2 supplied to `mq3.shared.math.DotProduct`. |
| `curveError` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fdiv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L130)

<a id="function-function-mq3-renderer-world-patch-lod-selectaxis-function-selectaxis-size-errors-threshold-src-mq3-renderer-world-patch-lod-ml-1045499209"></a>
### selectAxis

```ml
function selectAxis(size, errors, threshold)
```

Returns `selected.toArray()` from `mq3.renderer.world_patch_lod.selectAxis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Argument 1 supplied to `std.ds.list.List.withCapacity`. |
| `errors` | `dynamic` | — | Indexed input read at `index`. |
| `threshold` | `dynamic` | — | Input tested by `size>2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L89)

<a id="function-function-mq3-renderer-world-patch-lod-stitch-function-stitch-patches-src-mq3-renderer-world-patch-lod-ml-1605984232"></a>
### stitch

```ml
function stitch(patches)
```

Builds `grid.control` in `mq3.renderer.world_patch_lod.stitch`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patches` | `dynamic` | — | Sequence traversed as `patch` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L49)

<a id="function-function-mq3-renderer-world-patch-lod-triangles-function-triangles-patch-variant-face-src-mq3-renderer-world-patch-lod-ml-348996474"></a>
### triangles

```ml
function triangles(patch, variant, face)
```

Computes `triangles` from `result.toArray()` using `std.ds.list.List.withCapacity`, `mq3.renderer.bsp_render_data.appendPatchGrid`, `result.toArray`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patch` | `dynamic` | — | Record providing `patch.grid`, `patch.texture`, `patch.lightmap`, `patch.fog`. |
| `variant` | `dynamic` | — | Record providing `variant.columns`, `variant.rows`. |
| `face` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.bsp_render_data.appendPatchGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L116)

- [mq3.renderer.world_patch_lod.WorldLodAxis](Type-mq3-renderer-world-patch-lod-worldlodaxis-27998858.md) — struct
- [mq3.renderer.world_patch_lod.WorldLodPatch](Type-mq3-renderer-world-patch-lod-worldlodpatch-841667267.md) — struct
- [mq3.renderer.world_patch_lod.WorldLodVariant](Type-mq3-renderer-world-patch-lod-worldlodvariant-1151902800.md) — struct
- [mq3.renderer.world_patch_lod.WorldPatchGrid](Type-mq3-renderer-world-patch-lod-worldpatchgrid-852917366.md) — struct
