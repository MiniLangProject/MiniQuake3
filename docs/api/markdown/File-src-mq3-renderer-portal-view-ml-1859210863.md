# `src/mq3/renderer/portal_view.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.portal_view`](Package-mq3-renderer-portal-view-813428109.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/renderer/surface_trails.ml` as `trails` → [src/mq3/renderer/surface_trails.ml](File-src-mq3-renderer-surface-trails-ml-312199158.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-portal-view-fail-function-fail-message-src-mq3-renderer-portal-view-ml-83059057"></a>
### fail

```ml
function fail(message)
```

Creates error `7700` with message `"portal view: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7700,"portal view: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L45)

<a id="function-function-mq3-renderer-portal-view-mirrorpoint-function-mirrorpoint-input-surface-camera-src-mq3-renderer-portal-view-ml-519798500"></a>
### mirrorPoint

```ml
function mirrorPoint(input, surface, camera)
```

Maps a point from the portal surface basis into the destination camera basis and origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.portal_view.subtract`. |
| `surface` | `dynamic` | — | Record providing `surface.origin`, `surface.axis`. |
| `camera` | `dynamic` | — | Record providing `camera.axis`, `camera.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L61)

<a id="function-function-mq3-renderer-portal-view-mirrorvector-function-mirrorvector-input-surface-camera-src-mq3-renderer-portal-view-ml-289715938"></a>
### mirrorVector

```ml
function mirrorVector(input, surface, camera)
```

Returns `transformed` from `mq3.renderer.portal_view.mirrorVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |
| `surface` | `dynamic` | — | Record providing `surface.axis`. |
| `camera` | `dynamic` | — | Record providing `camera.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L70)

<a id="function-function-mq3-renderer-portal-view-negate-function-negate-value-src-mq3-renderer-portal-view-ml-288891243"></a>
### negate

```ml
function negate(value)
```

Returns `[numeric.fneg(value[0]),numeric.fneg(value[1]),numeric.fneg(value[2])]` for `mq3.renderer.portal_view.negate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L55)

- [mq3.renderer.portal_view.Orientation](Type-mq3-renderer-portal-view-orientation-274468229.md) — struct
<a id="function-function-mq3-renderer-portal-view-portalorientation-function-portalorientation-normal-dist-entities-timemilliseconds-src-mq3-renderer-portal-view-ml-1751186467"></a>
### portalOrientation

```ml
function portalOrientation(normal, dist, entities, timeMilliseconds)
```

Builds `cameraAxis[1]`, `cameraAxis[2]` in `mq3.renderer.portal_view.portalOrientation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.portal_view.valid3`. |
| `dist` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `entities` | `dynamic` | — | Indexed input read at `entityIndex`. |
| `timeMilliseconds` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fdiv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L81)

<a id="function-function-mq3-renderer-portal-view-prepare-function-prepare-normal-dist-entities-timemilliseconds-vieworigin-viewaxis-src-mq3-renderer-portal-view-ml-1100148852"></a>
### prepare

```ml
function prepare(normal, dist, entities, timeMilliseconds, viewOrigin, viewAxis)
```

Builds `mq3.renderer.portal_view.View` using `mq3.shared.math.DotProduct`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_view.portalOrientation`. |
| `dist` | `dynamic` | — | Value forwarded as `dist` to `mq3.renderer.portal_view.portalOrientation`. |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.portal_view.portalOrientation`. |
| `timeMilliseconds` | `dynamic` | — | Value forwarded as `timeMilliseconds` to `mq3.renderer.portal_view.portalOrientation`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.portal_view.valid3`. |
| `viewAxis` | `dynamic` | — | Indexed input read at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L115)

<a id="constant-constant-mq3-renderer-portal-view-rt-portalsurface-const-rt-portalsurface-7-src-mq3-renderer-portal-view-ml-1260486484"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 7
```

Renderer entity type carrying portal-view information without directly drawing geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L12)

<a id="function-function-mq3-renderer-portal-view-subtract-function-subtract-a-b-src-mq3-renderer-portal-view-ml-1613707131"></a>
### subtract

```ml
function subtract(a, b)
```

Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.portal_view.subtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L52)

<a id="function-function-mq3-renderer-portal-view-valid3-function-valid3-value-src-mq3-renderer-portal-view-ml-961817619"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.portal_view.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L48)

- [mq3.renderer.portal_view.View](Type-mq3-renderer-portal-view-view-430910756.md) — struct
