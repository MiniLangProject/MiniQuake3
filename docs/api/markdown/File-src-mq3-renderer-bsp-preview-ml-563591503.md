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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `maxLines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L102)

<a id="function-function-mq3-renderer-bsp-preview-alreadyemitted-function-alreadyemitted-keys-left-right-src-mq3-renderer-bsp-preview-ml-454105795"></a>
### alreadyEmitted

```ml
function alreadyEmitted(keys, left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L55)

<a id="function-function-mq3-renderer-bsp-preview-contains-function-contains-values-wanted-src-mq3-renderer-bsp-preview-ml-228448965"></a>
### contains

```ml
function contains(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L31)

<a id="function-function-mq3-renderer-bsp-preview-fail-function-fail-text-src-mq3-renderer-bsp-preview-ml-715785191"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L12)

<a id="function-function-mq3-renderer-bsp-preview-i32-function-i32-map-offset-src-mq3-renderer-bsp-preview-ml-1430128459"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L22)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L25)

- [mq3.renderer.bsp_preview.Preview](Type-mq3-renderer-bsp-preview-preview-860941003.md) — struct
<a id="function-function-mq3-renderer-bsp-preview-recordrange-function-recordrange-map-lump-index-stride-src-mq3-renderer-bsp-preview-ml-813750517"></a>
### recordRange

```ml
function recordRange(map, lump, index, stride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `stride` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L16)

<a id="function-function-mq3-renderer-bsp-preview-validmap-function-validmap-map-src-mq3-renderer-bsp-preview-ml-1884392990"></a>
### validMap

```ml
function validMap(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L13)

<a id="function-function-mq3-renderer-bsp-preview-visiblefaces-function-visiblefaces-map-leafindexes-src-mq3-renderer-bsp-preview-ml-2051796588"></a>
### visibleFaces

```ml
function visibleFaces(map, leafIndexes)
```

Resolve the face list referenced by a set of visible BSP leaves. The result retains first occurrence order and removes faces shared by several leaves.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `leafIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L38)

<a id="function-function-mq3-renderer-bsp-preview-visiblewireframe-function-visiblewireframe-map-leafindexes-maxlines-src-mq3-renderer-bsp-preview-ml-384264523"></a>
### visibleWireframe

```ml
function visibleWireframe(map, leafIndexes, maxLines)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `leafIndexes` | `dynamic` | — |  |
| `maxLines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L108)

<a id="function-function-mq3-renderer-bsp-preview-wireframe-function-wireframe-map-faceindexes-maxlines-src-mq3-renderer-bsp-preview-ml-2044402834"></a>
### wireframe

```ml
function wireframe(map, faceIndexes, maxLines)
```

Faces use meshvert indexes relative to firstVert, exactly like srfSurfaceFace_t and srfTriangles_t. Shared triangle edges are emitted once.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceIndexes` | `dynamic` | — |  |
| `maxLines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_preview.ml#L63)
