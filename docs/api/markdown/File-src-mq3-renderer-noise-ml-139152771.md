# `src/mq3/renderer/noise.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.noise`](Package-mq3-renderer-noise-1056432649.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-noise-create-function-create-src-mq3-renderer-noise-ml-1406859082"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L19)

<a id="function-function-mq3-renderer-noise-floornumber-function-floornumber-value-src-mq3-renderer-noise-ml-952893949"></a>
### floorNumber

```ml
function floorNumber(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L34)

<a id="function-function-mq3-renderer-noise-get4f-function-get4f-noise-x-y-z-t-src-mq3-renderer-noise-ml-292125253"></a>
### get4f

```ml
function get4f(noise, x, y, z, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L41)

<a id="function-function-mq3-renderer-noise-lerp-function-lerp-a-b-weight-src-mq3-renderer-noise-ml-1586873295"></a>
### lerp

```ml
function lerp(a, b, weight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `weight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L33)

<a id="function-function-mq3-renderer-noise-msvcrand-function-msvcrand-state-src-mq3-renderer-noise-ml-1752170887"></a>
### msvcRand

```ml
function msvcRand(state)
```

Baseq3's Windows build obtains rand() from the Microsoft C runtime.  Keep that 15-bit sequence here so normal deformations do not depend on the host.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L14)

- [mq3.renderer.noise.Noise](Type-mq3-renderer-noise-noise-244049745.md) — struct
<a id="constant-constant-mq3-renderer-noise-noise-mask-const-noise-mask-255-src-mq3-renderer-noise-ml-377580903"></a>
### NOISE_MASK

```ml
const NOISE_MASK = 255
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L8)

<a id="constant-constant-mq3-renderer-noise-noise-size-const-noise-size-256-src-mq3-renderer-noise-ml-820531424"></a>
### NOISE_SIZE

```ml
const NOISE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L7)

<a id="function-function-mq3-renderer-noise-noiseslice-function-noiseslice-noise-ix-iy-iz-it-fx-fy-fz-src-mq3-renderer-noise-ml-2007826616"></a>
### noiseSlice

```ml
function noiseSlice(noise, ix, iy, iz, it, fx, fy, fz)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — |  |
| `ix` | `dynamic` | — |  |
| `iy` | `dynamic` | — |  |
| `iz` | `dynamic` | — |  |
| `it` | `dynamic` | — |  |
| `fx` | `dynamic` | — |  |
| `fy` | `dynamic` | — |  |
| `fz` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L36)

<a id="function-function-mq3-renderer-noise-perm-function-perm-noise-value-src-mq3-renderer-noise-ml-1970121531"></a>
### perm

```ml
function perm(noise, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L28)

<a id="function-function-mq3-renderer-noise-valueat-function-valueat-noise-x-y-z-t-src-mq3-renderer-noise-ml-903823197"></a>
### valueAt

```ml
function valueAt(noise, x, y, z, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L29)
