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

Calls `mq3.renderer.surface_entities.addQuadStampExt` with `(origin,left,up,color,viewForward,0.0,0.0,1.0,1.0,currentVertexes,currentIndexes,maxVertexes,maxIndexes)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `left` | `dynamic` | — | Value forwarded as `left` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `up` | `dynamic` | — | Value forwarded as `up` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `color` | `dynamic` | — | Value forwarded as `color` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `viewForward` | `dynamic` | — | Value forwarded as `viewForward` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `currentVertexes` | `dynamic` | — | Value forwarded as `currentVertexes` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `currentIndexes` | `dynamic` | — | Value forwarded as `currentIndexes` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `maxVertexes` | `dynamic` | — | Value forwarded as `maxVertexes` to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `maxIndexes` | `dynamic` | — | Value forwarded as `maxIndexes` to `mq3.renderer.surface_entities.addQuadStampExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L120)

<a id="function-function-mq3-renderer-surface-entities-addquadstampext-function-addquadstampext-origin-left-up-color-viewforward-s1-t1-s2-t2-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-entities-ml-364475863"></a>
### addQuadStampExt

```ml
function addQuadStampExt(origin, left, up, color, viewForward, s1, t1, s2, t2, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

RB_AddQuadStampExt emits two triangles. RB_CheckOverflow flushes even when the resulting count exactly reaches a SHADER_MAX_* sentinel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `left` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `up` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `color` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.byteColor`. |
| `viewForward` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `s1` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `t1` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `s2` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `t2` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `currentVertexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `currentIndexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `maxVertexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `maxIndexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L91)

<a id="function-function-mq3-renderer-surface-entities-bytecolor-function-bytecolor-value-src-mq3-renderer-surface-entities-ml-156425295"></a>
### byteColor

```ml
function byteColor(value)
```

Validates four RGBA components in the byte range and returns their masked byte values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Indexed input read at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L48)

<a id="constant-constant-mq3-renderer-surface-entities-pi-const-pi-3-141593-src-mq3-renderer-surface-entities-ml-1385727875"></a>
### PI

```ml
const PI = 3.141593
```

Ratio of a circle's circumference to its diameter, used for angle conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L10)

- [mq3.renderer.surface_entities.Submission](Type-mq3-renderer-surface-entities-submission-617997860.md) — struct
<a id="function-function-mq3-renderer-surface-entities-surfacesprite-function-surfacesprite-origin-radius-rotation-color-viewleft-viewup-viewforward-ismirror-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-entities-ml-332203652"></a>
### surfaceSprite

```ml
function surfaceSprite(origin, radius, rotation, color, viewLeft, viewUp, viewForward, isMirror, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

RB_SurfaceSprite rotates the camera-facing left/up basis around the view axis, mirrors left for mirror views, then uses the standard quad stamp.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `radius` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `rotation` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `color` | `dynamic` | — | Value forwarded as `color` to `mq3.renderer.surface_entities.addQuadStamp`. |
| `viewLeft` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `viewUp` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `viewForward` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`. |
| `isMirror` | `dynamic` | — | Input tested by `isMirror`. |
| `currentVertexes` | `dynamic` | — | Value forwarded as `currentVertexes` to `mq3.renderer.surface_entities.addQuadStamp`. |
| `currentIndexes` | `dynamic` | — | Value forwarded as `currentIndexes` to `mq3.renderer.surface_entities.addQuadStamp`. |
| `maxVertexes` | `dynamic` | — | Value forwarded as `maxVertexes` to `mq3.renderer.surface_entities.addQuadStamp`. |
| `maxIndexes` | `dynamic` | — | Value forwarded as `maxIndexes` to `mq3.renderer.surface_entities.addQuadStamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L138)

<a id="function-function-mq3-renderer-surface-entities-valid3-function-valid3-value-src-mq3-renderer-surface-entities-ml-693347057"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.surface_entities.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L45)

<a id="function-function-mq3-renderer-surface-entities-vecadd-function-vecadd-a-b-src-mq3-renderer-surface-entities-ml-1135128959"></a>
### vecAdd

```ml
function vecAdd(a, b)
```

Returns `[numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]` for `mq3.renderer.surface_entities.vecAdd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L66)

<a id="function-function-mq3-renderer-surface-entities-vecscale-function-vecscale-value-scale-src-mq3-renderer-surface-entities-ml-765590081"></a>
### vecScale

```ml
function vecScale(value, scale)
```

Returns `[numeric.fmul(value[0],scale),numeric.fmul(value[1],scale),numeric.fmul(value[2],scale)]` for `mq3.renderer.surface_entities.vecScale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `scale` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L60)

<a id="function-function-mq3-renderer-surface-entities-vecsub-function-vecsub-a-b-src-mq3-renderer-surface-entities-ml-2011145759"></a>
### vecSub

```ml
function vecSub(a, b)
```

Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.surface_entities.vecSub`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L72)

- [mq3.renderer.surface_entities.Vertex](Type-mq3-renderer-surface-entities-vertex-1719953646.md) — struct
