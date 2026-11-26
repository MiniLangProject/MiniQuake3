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

Returns `[numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]` for `mq3.renderer.surface_beam.add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L28)

<a id="function-function-mq3-renderer-surface-beam-build-function-build-origin-oldorigin-src-mq3-renderer-surface-beam-ml-801556617"></a>
### build

```ml
function build(origin, oldOrigin)
```

Baseq3 emits a closed six-sided triangle strip through immediate OpenGL. Positions intentionally remain relative to zero because R_RotateForEntity uses the world orientation for every non-model entity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_beam.valid3`. |
| `oldOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_beam.valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L35)

<a id="function-function-mq3-renderer-surface-beam-fail-function-fail-message-src-mq3-renderer-surface-beam-ml-1168489179"></a>
### fail

```ml
function fail(message)
```

Creates error `7699` with message `"surface beam: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7699,"surface beam: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L17)

- [mq3.renderer.surface_beam.Submission](Type-mq3-renderer-surface-beam-submission-530799788.md) — struct
<a id="function-function-mq3-renderer-surface-beam-subtract-function-subtract-a-b-src-mq3-renderer-surface-beam-ml-440446203"></a>
### subtract

```ml
function subtract(a, b)
```

Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.surface_beam.subtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L24)

<a id="function-function-mq3-renderer-surface-beam-valid3-function-valid3-value-src-mq3-renderer-surface-beam-ml-1721876057"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.surface_beam.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_beam.ml#L20)

- [mq3.renderer.surface_beam.Vertex](Type-mq3-renderer-surface-beam-vertex-1363885814.md) — struct
