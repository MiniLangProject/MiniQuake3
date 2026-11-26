# `src/mq3/renderer/bsp_preview.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.bsp_preview`](Package-mq3-renderer-bsp-preview-613410149.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-bsp-preview-allfaces-function-allfaces-map-maxlines-src-mq3-renderer-bsp-preview-ml-1059204981"></a>
### allFaces

```ml
function allFaces(map, maxLines)
```

Returns `wireframe(map,indexes,maxLines)` from `mq3.renderer.bsp_preview.allFaces`; earlier branches return `fail("invalid BSP object")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `maxLines` | `dynamic` | — | Value forwarded as `maxLines` to `mq3.renderer.bsp_preview.wireframe`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L134)

<a id="function-function-mq3-renderer-bsp-preview-alreadyemitted-function-alreadyemitted-keys-left-right-src-mq3-renderer-bsp-preview-ml-454105795"></a>
### alreadyEmitted

```ml
function alreadyEmitted(keys, left, right)
```

Returns `false` from `mq3.renderer.bsp_preview.alreadyEmitted`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | `dynamic` | — | Sequence traversed as `key` while producing this result. |
| `left` | `dynamic` | — | Input used by `low=left`. |
| `right` | `dynamic` | — | Input used by `high=right`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L81)

<a id="function-function-mq3-renderer-bsp-preview-contains-function-contains-values-wanted-src-mq3-renderer-bsp-preview-ml-228448965"></a>
### contains

```ml
function contains(values, wanted)
```

Returns `false` from `mq3.renderer.bsp_preview.contains`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `wanted` | `dynamic` | — | Input used by `for each value in values if value==wanted then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L51)

<a id="function-function-mq3-renderer-bsp-preview-fail-function-fail-text-src-mq3-renderer-bsp-preview-ml-715785191"></a>
### fail

```ml
function fail(text)
```

Creates error `7404` with message `"BSP preview: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7404,"BSP preview: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L16)

<a id="function-function-mq3-renderer-bsp-preview-i32-function-i32-map-offset-src-mq3-renderer-bsp-preview-ml-1430128459"></a>
### i32

```ml
function i32(map, offset)
```

Returns `value` from `mq3.renderer.bsp_preview.i32`; earlier branches return `fail("truncated integer")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L36)

- [mq3.renderer.bsp_preview.Line](Type-mq3-renderer-bsp-preview-line-1089291819.md) — struct
<a id="constant-constant-mq3-renderer-bsp-preview-mst-planar-const-mst-planar-1-src-mq3-renderer-bsp-preview-ml-1305323108"></a>
### MST_PLANAR

```ml
const MST_PLANAR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L6)

<a id="constant-constant-mq3-renderer-bsp-preview-mst-triangle-soup-const-mst-triangle-soup-3-src-mq3-renderer-bsp-preview-ml-37564862"></a>
### MST_TRIANGLE_SOUP

```ml
const MST_TRIANGLE_SOUP = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L7)

<a id="function-function-mq3-renderer-bsp-preview-point-function-point-map-index-src-mq3-renderer-bsp-preview-ml-282830504"></a>
### point

```ml
function point(map, index)
```

Computes `point` from `[n.bitsFloat(x),n.bitsFloat(y),n.bitsFloat(z)]` using `mq3.renderer.bsp_preview.recordRange`, `mq3.compat.numeric.readU32`, `mq3.compat.numeric.bitsFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.bsp_preview.recordRange`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L42)

- [mq3.renderer.bsp_preview.Preview](Type-mq3-renderer-bsp-preview-preview-860941003.md) — struct
<a id="function-function-mq3-renderer-bsp-preview-recordrange-function-recordrange-map-lump-index-stride-src-mq3-renderer-bsp-preview-ml-813750517"></a>
### recordRange

```ml
function recordRange(map, lump, index, stride)
```

Computes `recordRange` from `map.offsets[lump]+index*stride`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`. |
| `lump` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[lump]`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[lump]`. |
| `stride` | `dynamic` | — | Input used by `offset=map.offsets[lump]+index*stride`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L27)

<a id="function-function-mq3-renderer-bsp-preview-validmap-function-validmap-map-src-mq3-renderer-bsp-preview-ml-1884392990"></a>
### validMap

```ml
function validMap(map)
```

Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17` for `mq3.renderer.bsp_preview.validMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`, `map.counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L19)

<a id="function-function-mq3-renderer-bsp-preview-visiblefaces-function-visiblefaces-map-leafindexes-src-mq3-renderer-bsp-preview-ml-2051796588"></a>
### visibleFaces

```ml
function visibleFaces(map, leafIndexes)
```

Resolve the face list referenced by a set of visible BSP leaves. The result retains first occurrence order and removes faces shared by several leaves.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `leafIndexes` | `dynamic` | — | Sequence traversed as `leafIndex` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L60)

<a id="function-function-mq3-renderer-bsp-preview-visiblewireframe-function-visiblewireframe-map-leafindexes-maxlines-src-mq3-renderer-bsp-preview-ml-384264523"></a>
### visibleWireframe

```ml
function visibleWireframe(map, leafIndexes, maxLines)
```

Returns `wireframe(map,faces,maxLines)` from `mq3.renderer.bsp_preview.visibleWireframe`; earlier branches return `faces`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_preview.visibleFaces`. |
| `leafIndexes` | `dynamic` | — | Value forwarded as `leafIndexes` to `mq3.renderer.bsp_preview.visibleFaces`. |
| `maxLines` | `dynamic` | — | Value forwarded as `maxLines` to `mq3.renderer.bsp_preview.wireframe`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L144)

<a id="function-function-mq3-renderer-bsp-preview-wireframe-function-wireframe-map-faceindexes-maxlines-src-mq3-renderer-bsp-preview-ml-2044402834"></a>
### wireframe

```ml
function wireframe(map, faceIndexes, maxLines)
```

Faces use meshvert indexes relative to firstVert, exactly like srfSurfaceFace_t and srfTriangles_t. Shared triangle edges are emitted once.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `faceIndexes` | `dynamic` | — | Sequence traversed as `faceIndex` while producing this result. |
| `maxLines` | `dynamic` | — | Input tested by `maxLines<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L92)
