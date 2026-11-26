# `src/mq3/renderer/surface_entities.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_entities`](Package-mq3-renderer-surface-entities-1679007470.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)

## Declarations

<a id="function-function-mq3-renderer-surface-entities-addquadstamp-function-addquadstamp-origin-left-up-color-viewforward-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-entities-ml-669479763"></a>
### addQuadStamp

```ml
function addQuadStamp(origin, left, up, color, viewForward, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L55)

<a id="function-function-mq3-renderer-surface-entities-addquadstampext-function-addquadstampext-origin-left-up-color-viewforward-s1-t1-s2-t2-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-entities-ml-364475863"></a>
### addQuadStampExt

```ml
function addQuadStampExt(origin, left, up, color, viewForward, s1, t1, s2, t2, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

RB_AddQuadStampExt emits two triangles. RB_CheckOverflow flushes even when the resulting count exactly reaches a SHADER_MAX_* sentinel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L36)

<a id="function-function-mq3-renderer-surface-entities-bytecolor-function-bytecolor-value-src-mq3-renderer-surface-entities-ml-156425295"></a>
### byteColor

```ml
function byteColor(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L15)

<a id="constant-constant-mq3-renderer-surface-entities-pi-const-pi-3-141593-src-mq3-renderer-surface-entities-ml-1385727875"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L9)

- [mq3.renderer.surface_entities.Submission](Type-mq3-renderer-surface-entities-submission-617997860.md) — struct
<a id="function-function-mq3-renderer-surface-entities-surfacesprite-function-surfacesprite-origin-radius-rotation-color-viewleft-viewup-viewforward-ismirror-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-entities-ml-332203652"></a>
### surfaceSprite

```ml
function surfaceSprite(origin, radius, rotation, color, viewLeft, viewUp, viewForward, isMirror, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

RB_SurfaceSprite rotates the camera-facing left/up basis around the view axis, mirrors left for mirror views, then uses the standard quad stamp.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `rotation` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `viewLeft` | `dynamic` | — |  |
| `viewUp` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `isMirror` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L61)

<a id="function-function-mq3-renderer-surface-entities-valid3-function-valid3-value-src-mq3-renderer-surface-entities-ml-693347057"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L14)

<a id="function-function-mq3-renderer-surface-entities-vecadd-function-vecadd-a-b-src-mq3-renderer-surface-entities-ml-1135128959"></a>
### vecAdd

```ml
function vecAdd(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L27)

<a id="function-function-mq3-renderer-surface-entities-vecscale-function-vecscale-value-scale-src-mq3-renderer-surface-entities-ml-765590081"></a>
### vecScale

```ml
function vecScale(value, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L24)

<a id="function-function-mq3-renderer-surface-entities-vecsub-function-vecsub-a-b-src-mq3-renderer-surface-entities-ml-2011145759"></a>
### vecSub

```ml
function vecSub(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_entities.ml#L30)

- [mq3.renderer.surface_entities.Vertex](Type-mq3-renderer-surface-entities-vertex-1719953646.md) — struct
