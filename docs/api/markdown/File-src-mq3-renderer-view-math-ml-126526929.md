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

Transforms all eight local box corners and classifies them against the validated world-space frustum.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `i&1`, `(i>>1)&1`. |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.validateOrientation`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.view_math.validateFrustum`. |
| `noCull` | `dynamic` | — | Input tested by `noCull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L162)

<a id="function-function-mq3-renderer-view-math-culllocalpointandradius-function-culllocalpointandradius-point-radius-value-frustum-nocull-src-mq3-renderer-view-math-ml-873582862"></a>
### cullLocalPointAndRadius

```ml
function cullLocalPointAndRadius(point, radius, value, frustum, noCull)
```

Returns `cullPointAndRadius(transformed,radius,frustum,noCull)` from `mq3.renderer.view_math.cullLocalPointAndRadius`; earlier branches return `transformed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Value forwarded as `local` to `mq3.renderer.view_math.localPointToWorld`. |
| `radius` | `dynamic` | — | Value forwarded as `radius` to `mq3.renderer.view_math.cullPointAndRadius`. |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.localPointToWorld`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.view_math.cullPointAndRadius`. |
| `noCull` | `dynamic` | — | Value forwarded as `noCull` to `mq3.renderer.view_math.cullPointAndRadius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L152)

<a id="function-function-mq3-renderer-view-math-cullpointandradius-function-cullpointandradius-point-radius-frustum-nocull-src-mq3-renderer-view-math-ml-371780749"></a>
### cullPointAndRadius

```ml
function cullPointAndRadius(point, radius, frustum, noCull)
```

Validates and classifies a sphere against four frustum planes; disabled culling returns CULL_CLIP.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.valid3`. |
| `radius` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fneg`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.view_math.validateFrustum`. |
| `noCull` | `dynamic` | — | Input tested by `noCull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L131)

<a id="function-function-mq3-renderer-view-math-localnormaltoworld-function-localnormaltoworld-local-value-src-mq3-renderer-view-math-ml-428252802"></a>
### localNormalToWorld

```ml
function localNormalToWorld(local, value)
```

Transforms a local direction through the orientation basis using compatibility float arithmetic, without translation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.valid3`. |
| `value` | `dynamic` | — | Record providing `value.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L59)

<a id="function-function-mq3-renderer-view-math-localpointtoworld-function-localpointtoworld-local-value-src-mq3-renderer-view-math-ml-2069206878"></a>
### localPointToWorld

```ml
function localPointToWorld(local, value)
```

Transforms a local point through the orientation basis and adds the world-space origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Value forwarded as `local` to `mq3.renderer.view_math.localNormalToWorld`. |
| `value` | `dynamic` | — | Record providing `value.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L73)

<a id="function-function-mq3-renderer-view-math-matrixvector4-function-matrixvector4-source-matrix-src-mq3-renderer-view-math-ml-703450354"></a>
### matrixVector4

```ml
function matrixVector4(source, matrix)
```

Multiplies a four-component vector by a column-major 4-by-4 matrix using compatibility float arithmetic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `matrix` | `dynamic` | — | Indexed input read at `i`, `i+4`, `i+8`, `i+12`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L91)

<a id="function-function-mq3-renderer-view-math-orientation-function-orientation-origin-axis-src-mq3-renderer-view-math-ml-385764019"></a>
### orientation

```ml
function orientation(origin, axis)
```

Constructs `mq3.renderer.view_math.Orientation` from `origin`, `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.view_math.Orientation.origin`. |
| `axis` | `dynamic` | — | Initial value for `mq3.renderer.view_math.Orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L28)

- [mq3.renderer.view_math.Orientation](Type-mq3-renderer-view-math-orientation-1941990111.md) — struct
<a id="function-function-mq3-renderer-view-math-plane-function-plane-normal-dist-src-mq3-renderer-view-math-ml-209118715"></a>
### plane

```ml
function plane(normal, dist)
```

Constructs `mq3.renderer.view_math.Plane` with `dist` = `numeric.f32(dist)` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Initial value for `mq3.renderer.view_math.Plane.normal`. |
| `dist` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L24)

- [mq3.renderer.view_math.Plane](Type-mq3-renderer-view-math-plane-284088611.md) — struct
<a id="function-function-mq3-renderer-view-math-setupfrustum-function-setupfrustum-origin-axis-fovx-fovy-src-mq3-renderer-view-math-ml-1424550098"></a>
### setupFrustum

```ml
function setupFrustum(origin, axis, fovX, fovY)
```

R_SetupFrustum constructs the four side planes from the current refdef. Quake's view axes are forward, left and up, so the signed cosine terms intentionally follow the original renderer rather than a right-vector API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.view_math.orientation`. |
| `axis` | `dynamic` | — | Value forwarded as `axis` to `mq3.renderer.view_math.orientation`. |
| `fovX` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fdiv`. |
| `fovY` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fdiv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L193)

<a id="function-function-mq3-renderer-view-math-transformcliptowindow-function-transformcliptowindow-clip-viewportwidth-viewportheight-src-mq3-renderer-view-math-ml-557816541"></a>
### transformClipToWindow

```ml
function transformClipToWindow(clip, viewportWidth, viewportHeight)
```

Builds `mq3.renderer.view_math.ClipWindow` for `mq3.renderer.view_math.transformClipToWindow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.valid4`. |
| `viewportWidth` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.fmul`. |
| `viewportHeight` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L115)

<a id="function-function-mq3-renderer-view-math-transformmodeltoclip-function-transformmodeltoclip-source-modelmatrix-projectionmatrix-src-mq3-renderer-view-math-ml-2025318329"></a>
### transformModelToClip

```ml
function transformModelToClip(source, modelMatrix, projectionMatrix)
```

Computes `transformModelToClip` from `[eye,matrixVector4(eye,projectionMatrix)]` using `mq3.renderer.view_math.valid3`, `mq3.renderer.view_math.matrixVector4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.valid3`. |
| `modelMatrix` | `dynamic` | — | Value forwarded as `matrix` to `mq3.renderer.view_math.matrixVector4`. |
| `projectionMatrix` | `dynamic` | — | Value forwarded as `matrix` to `mq3.renderer.view_math.matrixVector4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L104)

<a id="function-function-mq3-renderer-view-math-valid3-function-valid3-value-src-mq3-renderer-view-math-ml-1362406791"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.view_math.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L31)

<a id="function-function-mq3-renderer-view-math-valid4-function-valid4-value-src-mq3-renderer-view-math-ml-1804441623"></a>
### valid4

```ml
function valid4(value)
```

Computes `value!=void and len(value)==4` for `mq3.renderer.view_math.valid4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L34)

<a id="function-function-mq3-renderer-view-math-validatefrustum-function-validatefrustum-frustum-src-mq3-renderer-view-math-ml-1624148410"></a>
### validateFrustum

```ml
function validateFrustum(frustum)
```

Requires four nonmissing frustum planes with three-component normals.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frustum` | `dynamic` | — | Indexed input read at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L48)

<a id="function-function-mq3-renderer-view-math-validateorientation-function-validateorientation-value-src-mq3-renderer-view-math-ml-2120474111"></a>
### validateOrientation

```ml
function validateOrientation(value)
```

Checks a renderer orientation's three-component origin and three three-component basis axes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.origin`, `value.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L38)

<a id="function-function-mq3-renderer-view-math-worldtolocal-function-worldtolocal-world-value-src-mq3-renderer-view-math-ml-1321034873"></a>
### worldToLocal

```ml
function worldToLocal(world, value)
```

Baseq3's R_WorldToLocal projects the supplied vector onto the axes. The caller subtracts the origin when a position rather than a vector is used.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.view_math.valid3`. |
| `value` | `dynamic` | — | Record providing `value.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L82)
