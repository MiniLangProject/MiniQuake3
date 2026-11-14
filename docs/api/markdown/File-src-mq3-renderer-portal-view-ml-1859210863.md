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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L16)

<a id="function-function-mq3-renderer-portal-view-mirrorpoint-function-mirrorpoint-input-surface-camera-src-mq3-renderer-portal-view-ml-519798500"></a>
### mirrorPoint

```ml
function mirrorPoint(input, surface, camera)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L21)

<a id="function-function-mq3-renderer-portal-view-mirrorvector-function-mirrorvector-input-surface-camera-src-mq3-renderer-portal-view-ml-289715938"></a>
### mirrorVector

```ml
function mirrorVector(input, surface, camera)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L26)

<a id="function-function-mq3-renderer-portal-view-negate-function-negate-value-src-mq3-renderer-portal-view-ml-288891243"></a>
### negate

```ml
function negate(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L19)

- [mq3.renderer.portal_view.Orientation](Type-mq3-renderer-portal-view-orientation-274468229.md) — struct
<a id="function-function-mq3-renderer-portal-view-portalorientation-function-portalorientation-normal-dist-entities-timemilliseconds-src-mq3-renderer-portal-view-ml-1751186467"></a>
### portalOrientation

```ml
function portalOrientation(normal, dist, entities, timeMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `timeMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L32)

<a id="function-function-mq3-renderer-portal-view-prepare-function-prepare-normal-dist-entities-timemilliseconds-vieworigin-viewaxis-src-mq3-renderer-portal-view-ml-1100148852"></a>
### prepare

```ml
function prepare(normal, dist, entities, timeMilliseconds, viewOrigin, viewAxis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `timeMilliseconds` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `viewAxis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L59)

<a id="constant-constant-mq3-renderer-portal-view-rt-portalsurface-const-rt-portalsurface-7-src-mq3-renderer-portal-view-ml-1260486484"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L11)

<a id="function-function-mq3-renderer-portal-view-subtract-function-subtract-a-b-src-mq3-renderer-portal-view-ml-1613707131"></a>
### subtract

```ml
function subtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L18)

<a id="function-function-mq3-renderer-portal-view-valid3-function-valid3-value-src-mq3-renderer-portal-view-ml-961817619"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L17)

- [mq3.renderer.portal_view.View](Type-mq3-renderer-portal-view-view-430910756.md) — struct
