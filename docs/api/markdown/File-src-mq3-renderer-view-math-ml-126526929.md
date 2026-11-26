# `src/mq3/renderer/view_math.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.view_math`](Package-mq3-renderer-view-math-1512736663.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.renderer.view_math.ClipWindow](Type-mq3-renderer-view-math-clipwindow-29275461.md) — struct
<a id="constant-constant-mq3-renderer-view-math-cull-clip-const-cull-clip-1-src-mq3-renderer-view-math-ml-2057316800"></a>
### CULL_CLIP

```ml
const CULL_CLIP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L11)

<a id="constant-constant-mq3-renderer-view-math-cull-in-const-cull-in-0-src-mq3-renderer-view-math-ml-1220791251"></a>
### CULL_IN

```ml
const CULL_IN = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L10)

<a id="constant-constant-mq3-renderer-view-math-cull-out-const-cull-out-2-src-mq3-renderer-view-math-ml-1811835061"></a>
### CULL_OUT

```ml
const CULL_OUT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L12)

<a id="function-function-mq3-renderer-view-math-culllocalbox-function-culllocalbox-bounds-value-frustum-nocull-src-mq3-renderer-view-math-ml-2041496011"></a>
### cullLocalBox

```ml
function cullLocalBox(bounds, value, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L110)

<a id="function-function-mq3-renderer-view-math-culllocalpointandradius-function-culllocalpointandradius-point-radius-value-frustum-nocull-src-mq3-renderer-view-math-ml-873582862"></a>
### cullLocalPointAndRadius

```ml
function cullLocalPointAndRadius(point, radius, value, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L105)

<a id="function-function-mq3-renderer-view-math-cullpointandradius-function-cullpointandradius-point-radius-frustum-nocull-src-mq3-renderer-view-math-ml-371780749"></a>
### cullPointAndRadius

```ml
function cullPointAndRadius(point, radius, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L90)

<a id="function-function-mq3-renderer-view-math-localnormaltoworld-function-localnormaltoworld-local-value-src-mq3-renderer-view-math-ml-428252802"></a>
### localNormalToWorld

```ml
function localNormalToWorld(local, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L39)

<a id="function-function-mq3-renderer-view-math-localpointtoworld-function-localpointtoworld-local-value-src-mq3-renderer-view-math-ml-2069206878"></a>
### localPointToWorld

```ml
function localPointToWorld(local, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L50)

<a id="function-function-mq3-renderer-view-math-matrixvector4-function-matrixvector4-source-matrix-src-mq3-renderer-view-math-ml-703450354"></a>
### matrixVector4

```ml
function matrixVector4(source, matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L63)

<a id="function-function-mq3-renderer-view-math-orientation-function-orientation-origin-axis-src-mq3-renderer-view-math-ml-385764019"></a>
### orientation

```ml
function orientation(origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L19)

- [mq3.renderer.view_math.Orientation](Type-mq3-renderer-view-math-orientation-1941990111.md) — struct
<a id="function-function-mq3-renderer-view-math-plane-function-plane-normal-dist-src-mq3-renderer-view-math-ml-209118715"></a>
### plane

```ml
function plane(normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L18)

- [mq3.renderer.view_math.Plane](Type-mq3-renderer-view-math-plane-284088611.md) — struct
<a id="function-function-mq3-renderer-view-math-setupfrustum-function-setupfrustum-origin-axis-fovx-fovy-src-mq3-renderer-view-math-ml-1424550098"></a>
### setupFrustum

```ml
function setupFrustum(origin, axis, fovX, fovY)
```

R_SetupFrustum constructs the four side planes from the current refdef. Quake's view axes are forward, left and up, so the signed cosine terms intentionally follow the original renderer rather than a right-vector API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `fovX` | `dynamic` | — |  |
| `fovY` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L137)

<a id="function-function-mq3-renderer-view-math-transformcliptowindow-function-transformcliptowindow-clip-viewportwidth-viewportheight-src-mq3-renderer-view-math-ml-557816541"></a>
### transformClipToWindow

```ml
function transformClipToWindow(clip, viewportWidth, viewportHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — |  |
| `viewportWidth` | `dynamic` | — |  |
| `viewportHeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L79)

<a id="function-function-mq3-renderer-view-math-transformmodeltoclip-function-transformmodeltoclip-source-modelmatrix-projectionmatrix-src-mq3-renderer-view-math-ml-2025318329"></a>
### transformModelToClip

```ml
function transformModelToClip(source, modelMatrix, projectionMatrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `modelMatrix` | `dynamic` | — |  |
| `projectionMatrix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L72)

<a id="function-function-mq3-renderer-view-math-valid3-function-valid3-value-src-mq3-renderer-view-math-ml-1362406791"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L20)

<a id="function-function-mq3-renderer-view-math-valid4-function-valid4-value-src-mq3-renderer-view-math-ml-1804441623"></a>
### valid4

```ml
function valid4(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L21)

<a id="function-function-mq3-renderer-view-math-validatefrustum-function-validatefrustum-frustum-src-mq3-renderer-view-math-ml-1624148410"></a>
### validateFrustum

```ml
function validateFrustum(frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L31)

<a id="function-function-mq3-renderer-view-math-validateorientation-function-validateorientation-value-src-mq3-renderer-view-math-ml-2120474111"></a>
### validateOrientation

```ml
function validateOrientation(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L23)

<a id="function-function-mq3-renderer-view-math-worldtolocal-function-worldtolocal-world-value-src-mq3-renderer-view-math-ml-1321034873"></a>
### worldToLocal

```ml
function worldToLocal(world, value)
```

Baseq3's R_WorldToLocal projects the supplied vector onto the axes. The caller subtracts the origin when a position rather than a vector is used.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L57)
