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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L17)

<a id="function-function-mq3-renderer-surface-trails-fail-function-fail-message-src-mq3-renderer-surface-trails-ml-1189106719"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L13)

<a id="function-function-mq3-renderer-surface-trails-lightning-function-lightning-start-finish-vieworigin-color-src-mq3-renderer-surface-trails-ml-1952416787"></a>
### lightning

```ml
function lightning(start, finish, viewOrigin, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L108)

<a id="function-function-mq3-renderer-surface-trails-makenormalvectors-function-makenormalvectors-forward-src-mq3-renderer-surface-trails-ml-452319043"></a>
### makeNormalVectors

```ml
function makeNormalVectors(forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L35)

<a id="function-function-mq3-renderer-surface-trails-matrixmultiply-function-matrixmultiply-a-b-src-mq3-renderer-surface-trails-ml-2046813871"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L94)

<a id="function-function-mq3-renderer-surface-trails-perpendicularvector-function-perpendicularvector-source-src-mq3-renderer-surface-trails-ml-166650751"></a>
### perpendicularVector

```ml
function perpendicularVector(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L87)

<a id="function-function-mq3-renderer-surface-trails-quarter-function-quarter-value-src-mq3-renderer-surface-trails-ml-186267113"></a>
### quarter

```ml
function quarter(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L19)

<a id="function-function-mq3-renderer-surface-trails-quartercolor-function-quartercolor-color-src-mq3-renderer-surface-trails-ml-1927920703"></a>
### quarterColor

```ml
function quarterColor(color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L20)

<a id="function-function-mq3-renderer-surface-trails-railcore-function-railcore-start-finish-vieworigin-spanwidth-color-src-mq3-renderer-surface-trails-ml-1873738987"></a>
### railCore

```ml
function railCore(start, finish, viewOrigin, spanWidth, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L66)

<a id="function-function-mq3-renderer-surface-trails-railcoreraw-function-railcoreraw-start-finish-up-lengthvalue-spanwidth-color-src-mq3-renderer-surface-trails-ml-1939559870"></a>
### railCoreRaw

```ml
function railCoreRaw(start, finish, up, lengthValue, spanWidth, color)
```

Direct equivalent of DoRailCore. len is the integral result retained by the original caller after VectorNormalize's float return is converted to int.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `lengthValue` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L24)

<a id="function-function-mq3-renderer-surface-trails-raildiscs-function-raildiscs-numsegments-start-direction-right-up-spanwidth-color-src-mq3-renderer-surface-trails-ml-1548511497"></a>
### railDiscs

```ml
function railDiscs(numSegments, start, direction, right, up, spanWidth, color)
```

Direct equivalent of DoRailDiscs, retaining its one-segment shortening for shots long enough to contain more than one nominal segment.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numSegments` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L43)

<a id="function-function-mq3-renderer-surface-trails-railrings-function-railrings-start-finish-segmentlength-spanwidth-color-src-mq3-renderer-surface-trails-ml-1149449777"></a>
### railRings

```ml
function railRings(start, finish, segmentLength, spanWidth, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `segmentLength` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L79)

<a id="function-function-mq3-renderer-surface-trails-ringcount-function-ringcount-start-finish-segmentlength-src-mq3-renderer-surface-trails-ml-453353358"></a>
### ringCount

```ml
function ringCount(start, finish, segmentLength)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `segmentLength` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L74)

<a id="function-function-mq3-renderer-surface-trails-rotatearoundvector-function-rotatearoundvector-direction-point-degrees-src-mq3-renderer-surface-trails-ml-289058154"></a>
### rotateAroundVector

```ml
function rotateAroundVector(direction, point, degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L99)

- [mq3.renderer.surface_trails.Submission](Type-mq3-renderer-surface-trails-submission-173069698.md) — struct
<a id="function-function-mq3-renderer-surface-trails-subtract-function-subtract-a-b-src-mq3-renderer-surface-trails-ml-1572854171"></a>
### subtract

```ml
function subtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L16)

<a id="function-function-mq3-renderer-surface-trails-valid3-function-valid3-value-src-mq3-renderer-surface-trails-ml-215534521"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L14)

<a id="function-function-mq3-renderer-surface-trails-validcolor-function-validcolor-value-src-mq3-renderer-surface-trails-ml-1955680861"></a>
### validColor

```ml
function validColor(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L15)

<a id="function-function-mq3-renderer-surface-trails-vertex-function-vertex-point-u-v-color-src-mq3-renderer-surface-trails-ml-1229419560"></a>
### vertex

```ml
function vertex(point, u, v, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `u` | `dynamic` | — |  |
| `v` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_trails.ml#L18)

- [mq3.renderer.surface_trails.Vertex](Type-mq3-renderer-surface-trails-vertex-1307026004.md) — struct
