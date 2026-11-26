# `src/mq3/renderer/surface_trails.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_trails`](Package-mq3-renderer-surface-trails-1723018796.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-surface-trails-add-function-add-a-b-src-mq3-renderer-surface-trails-ml-831012429"></a>
### add

```ml
function add(a, b)
```

Returns `[numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]` for `mq3.renderer.surface_trails.add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L43)

<a id="function-function-mq3-renderer-surface-trails-fail-function-fail-message-src-mq3-renderer-surface-trails-ml-1189106719"></a>
### fail

```ml
function fail(message)
```

Creates error `7697` with message `"surface trails: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7697,"surface trails: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L29)

<a id="function-function-mq3-renderer-surface-trails-lightning-function-lightning-start-finish-vieworigin-color-src-mq3-renderer-surface-trails-ml-1952416787"></a>
### lightning

```ml
function lightning(start, finish, viewOrigin, color)
```

Builds `mq3.renderer.surface_trails.Submission` using `mq3.shared.math.VectorNormalize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `finish` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `color` | `dynamic` | — | Value forwarded as `color` to `mq3.renderer.surface_trails.railCoreRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L188)

<a id="function-function-mq3-renderer-surface-trails-makenormalvectors-function-makenormalvectors-forward-src-mq3-renderer-surface-trails-ml-452319043"></a>
### makeNormalVectors

```ml
function makeNormalVectors(forward)
```

Computes `makeNormalVectors` from `[right,qmath.CrossProduct(right,forward)]` using `mq3.compat.numeric.fneg`, `mq3.shared.math.DotProduct`, `mq3.shared.math.VectorMA`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `forward` | `dynamic` | — | Argument 2 supplied to `mq3.shared.math.DotProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L78)

<a id="function-function-mq3-renderer-surface-trails-matrixmultiply-function-matrixmultiply-a-b-src-mq3-renderer-surface-trails-ml-2046813871"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

Builds `result[i]` in `mq3.renderer.surface_trails.matrixMultiply`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Nested indexed data; outer entries read at `i`. |
| `b` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L165)

<a id="function-function-mq3-renderer-surface-trails-perpendicularvector-function-perpendicularvector-source-src-mq3-renderer-surface-trails-ml-166650751"></a>
### perpendicularVector

```ml
function perpendicularVector(source)
```

Builds `temporary[position]` in `mq3.renderer.surface_trails.perpendicularVector`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L155)

<a id="function-function-mq3-renderer-surface-trails-quarter-function-quarter-value-src-mq3-renderer-surface-trails-ml-186267113"></a>
### quarter

```ml
function quarter(value)
```

Calls `mq3.compat.numeric.trunc32` with `(numeric.fmul(value,0.25))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L52)

<a id="function-function-mq3-renderer-surface-trails-quartercolor-function-quartercolor-color-src-mq3-renderer-surface-trails-ml-1927920703"></a>
### quarterColor

```ml
function quarterColor(color)
```

Returns `[quarter(color[0]),quarter(color[1]),quarter(color[2]),color[3]]` for `mq3.renderer.surface_trails.quarterColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L55)

<a id="function-function-mq3-renderer-surface-trails-railcore-function-railcore-start-finish-vieworigin-spanwidth-color-src-mq3-renderer-surface-trails-ml-1873738987"></a>
### railCore

```ml
function railCore(start, finish, viewOrigin, spanWidth, color)
```

Computes `railCore` from `railCoreRaw(start,finish,right,lengthValue,spanWidth,color)` using `mq3.renderer.surface_trails.valid3`, `mq3.renderer.surface_trails.subtract`, `mq3.compat.numeric.trunc32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `finish` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `spanWidth` | `dynamic` | — | Value forwarded as `spanWidth` to `mq3.renderer.surface_trails.railCoreRaw`. |
| `color` | `dynamic` | — | Value forwarded as `color` to `mq3.renderer.surface_trails.railCoreRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L122)

<a id="function-function-mq3-renderer-surface-trails-railcoreraw-function-railcoreraw-start-finish-up-lengthvalue-spanwidth-color-src-mq3-renderer-surface-trails-ml-1939559870"></a>
### railCoreRaw

```ml
function railCoreRaw(start, finish, up, lengthValue, spanWidth, color)
```

Direct equivalent of DoRailCore. len is the integral result retained by the original caller after VectorNormalize's float return is converted to int.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `finish` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `up` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `lengthValue` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `spanWidth` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `color` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.validColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L65)

<a id="function-function-mq3-renderer-surface-trails-raildiscs-function-raildiscs-numsegments-start-direction-right-up-spanwidth-color-src-mq3-renderer-surface-trails-ml-1548511497"></a>
### railDiscs

```ml
function railDiscs(numSegments, start, direction, right, up, spanWidth, color)
```

Direct equivalent of DoRailDiscs, retaining its one-segment shortening for shots long enough to contain more than one nominal segment.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numSegments` | `dynamic` | — | Input tested by `numSegments>1`. |
| `start` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `direction` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `right` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `up` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `spanWidth` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `color` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.validColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L93)

<a id="function-function-mq3-renderer-surface-trails-railrings-function-railrings-start-finish-segmentlength-spanwidth-color-src-mq3-renderer-surface-trails-ml-1149449777"></a>
### railRings

```ml
function railRings(start, finish, segmentLength, spanWidth, color)
```

Computes `railRings` from `railDiscs(segments,start,step,basis[0],basis[1],spanWidth,color)` using `mq3.renderer.surface_trails.valid3`, `mq3.renderer.surface_trails.subtract`, `mq3.compat.numeric.trunc32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `finish` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `segmentLength` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `spanWidth` | `dynamic` | — | Value forwarded as `spanWidth` to `mq3.renderer.surface_trails.railDiscs`. |
| `color` | `dynamic` | — | Value forwarded as `color` to `mq3.renderer.surface_trails.railDiscs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L145)

<a id="function-function-mq3-renderer-surface-trails-ringcount-function-ringcount-start-finish-segmentlength-src-mq3-renderer-surface-trails-ml-453353358"></a>
### ringCount

```ml
function ringCount(start, finish, segmentLength)
```

Computes `ringCount` from `numeric.trunc32(numeric.fdiv(lengthValue,numeric.f32(segmentLength)))` using `mq3.renderer.surface_trails.valid3`, `mq3.renderer.surface_trails.subtract`, `mq3.compat.numeric.trunc32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `finish` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`. |
| `segmentLength` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L134)

<a id="function-function-mq3-renderer-surface-trails-rotatearoundvector-function-rotatearoundvector-direction-point-degrees-src-mq3-renderer-surface-trails-ml-289058154"></a>
### rotateAroundVector

```ml
function rotateAroundVector(direction, point, degrees)
```

Builds an orthogonal basis and rotates a point around the supplied direction by an angle in degrees.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Value forwarded as `source` to `mq3.renderer.surface_trails.perpendicularVector`. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `degrees` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L174)

- [mq3.renderer.surface_trails.Submission](Type-mq3-renderer-surface-trails-submission-173069698.md) — struct
<a id="function-function-mq3-renderer-surface-trails-subtract-function-subtract-a-b-src-mq3-renderer-surface-trails-ml-1572854171"></a>
### subtract

```ml
function subtract(a, b)
```

Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.surface_trails.subtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L39)

<a id="function-function-mq3-renderer-surface-trails-valid3-function-valid3-value-src-mq3-renderer-surface-trails-ml-215534521"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.surface_trails.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L32)

<a id="function-function-mq3-renderer-surface-trails-validcolor-function-validcolor-value-src-mq3-renderer-surface-trails-ml-1955680861"></a>
### validColor

```ml
function validColor(value)
```

Computes `value!=void and len(value)==4` for `mq3.renderer.surface_trails.validColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L35)

<a id="function-function-mq3-renderer-surface-trails-vertex-function-vertex-point-u-v-color-src-mq3-renderer-surface-trails-ml-1229419560"></a>
### vertex

```ml
function vertex(point, u, v, color)
```

Constructs `mq3.renderer.surface_trails.Vertex` with `uv` = `[numeric.f32(u),numeric.f32(v)]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Initial value for `mq3.renderer.surface_trails.Vertex.xyz`. |
| `u` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `v` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `color` | `dynamic` | — | Initial value for `mq3.renderer.surface_trails.Vertex.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L49)

- [mq3.renderer.surface_trails.Vertex](Type-mq3-renderer-surface-trails-vertex-1307026004.md) — struct
