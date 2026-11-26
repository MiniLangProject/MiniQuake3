# `src/mq3/renderer/surface_beam.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_beam`](Package-mq3-renderer-surface-beam-207989894.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/surface_trails.ml` as `trails` → [src/mq3/renderer/surface_trails.ml](File-src-mq3-renderer-surface-trails-ml-312199158.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-surface-beam-add-function-add-a-b-src-mq3-renderer-surface-beam-ml-958204705"></a>
### add

```ml
function add(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L16)

<a id="function-function-mq3-renderer-surface-beam-build-function-build-origin-oldorigin-src-mq3-renderer-surface-beam-ml-801556617"></a>
### build

```ml
function build(origin, oldOrigin)
```

Baseq3 emits a closed six-sided triangle strip through immediate OpenGL. Positions intentionally remain relative to zero because R_RotateForEntity uses the world orientation for every non-model entity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `oldOrigin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L21)

<a id="function-function-mq3-renderer-surface-beam-fail-function-fail-message-src-mq3-renderer-surface-beam-ml-1168489179"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L13)

- [mq3.renderer.surface_beam.Submission](Type-mq3-renderer-surface-beam-submission-530799788.md) — struct
<a id="function-function-mq3-renderer-surface-beam-subtract-function-subtract-a-b-src-mq3-renderer-surface-beam-ml-440446203"></a>
### subtract

```ml
function subtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L15)

<a id="function-function-mq3-renderer-surface-beam-valid3-function-valid3-value-src-mq3-renderer-surface-beam-ml-1721876057"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L14)

- [mq3.renderer.surface_beam.Vertex](Type-mq3-renderer-surface-beam-vertex-1363885814.md) — struct
