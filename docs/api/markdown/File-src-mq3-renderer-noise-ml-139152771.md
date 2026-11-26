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

Builds `mq3.renderer.noise.Noise` for `mq3.renderer.noise.create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L29)

<a id="function-function-mq3-renderer-noise-floornumber-function-floornumber-value-src-mq3-renderer-noise-ml-952893949"></a>
### floorNumber

```ml
function floorNumber(value)
```

Returns `integer` from `mq3.renderer.noise.floorNumber`; earlier branches return `integer-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L59)

<a id="function-function-mq3-renderer-noise-get4f-function-get4f-noise-x-y-z-t-src-mq3-renderer-noise-ml-292125253"></a>
### get4f

```ml
function get4f(noise, x, y, z, t)
```

Computes `get4f` from `lerp(noiseSlice(noise,ix,iy,iz,it,fx,fy,fz),noiseSlice(noise,ix,iy,iz,it+1,fx,fy,fz),ft)` using `mq3.renderer.noise.floorNumber`, `mq3.compat.numeric.fsub`, `mq3.renderer.noise.lerp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — | Value forwarded as `noise` to `mq3.renderer.noise.noiseSlice`. |
| `x` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.noise.floorNumber`. |
| `y` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.noise.floorNumber`. |
| `z` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.noise.floorNumber`. |
| `t` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.noise.floorNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L81)

<a id="function-function-mq3-renderer-noise-lerp-function-lerp-a-b-weight-src-mq3-renderer-noise-ml-1586873295"></a>
### lerp

```ml
function lerp(a, b, weight)
```

Calls `mq3.compat.numeric.fadd` with `(n.fmul(a,n.fsub(1.0,weight)),n.fmul(b,weight))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |
| `b` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |
| `weight` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L56)

<a id="function-function-mq3-renderer-noise-msvcrand-function-msvcrand-state-src-mq3-renderer-noise-ml-1752170887"></a>
### msvcRand

```ml
function msvcRand(state)
```

Baseq3's Windows build obtains rand() from the Microsoft C runtime.  Keep that 15-bit sequence here so normal deformations do not depend on the host.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.mul32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L23)

- [mq3.renderer.noise.Noise](Type-mq3-renderer-noise-noise-244049745.md) — struct
<a id="constant-constant-mq3-renderer-noise-noise-mask-const-noise-mask-255-src-mq3-renderer-noise-ml-377580903"></a>
### NOISE_MASK

```ml
const NOISE_MASK = 255
```

Mask that wraps indices into the power-of-two noise table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L10)

<a id="constant-constant-mq3-renderer-noise-noise-size-const-noise-size-256-src-mq3-renderer-noise-ml-820531424"></a>
### NOISE_SIZE

```ml
const NOISE_SIZE = 256
```

Number of samples in the periodic procedural-noise table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L8)

<a id="function-function-mq3-renderer-noise-noiseslice-function-noiseslice-noise-ix-iy-iz-it-fx-fy-fz-src-mq3-renderer-noise-ml-2007826616"></a>
### noiseSlice

```ml
function noiseSlice(noise, ix, iy, iz, it, fx, fy, fz)
```

Computes `noiseSlice` from `lerp(front,back,fz)` using `mq3.renderer.noise.lerp`, `mq3.renderer.noise.valueAt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — | Value forwarded as `noise` to `mq3.renderer.noise.valueAt`. |
| `ix` | `dynamic` | — | Value forwarded as `x` to `mq3.renderer.noise.valueAt`. |
| `iy` | `dynamic` | — | Value forwarded as `y` to `mq3.renderer.noise.valueAt`. |
| `iz` | `dynamic` | — | Value forwarded as `z` to `mq3.renderer.noise.valueAt`. |
| `it` | `dynamic` | — | Value forwarded as `t` to `mq3.renderer.noise.valueAt`. |
| `fx` | `dynamic` | — | Value forwarded as `weight` to `mq3.renderer.noise.lerp`. |
| `fy` | `dynamic` | — | Value forwarded as `weight` to `mq3.renderer.noise.lerp`. |
| `fz` | `dynamic` | — | Value forwarded as `weight` to `mq3.renderer.noise.lerp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L70)

<a id="function-function-mq3-renderer-noise-perm-function-perm-noise-value-src-mq3-renderer-noise-ml-1970121531"></a>
### perm

```ml
function perm(noise, value)
```

Computes `noise.permutation[value&NOISE_MASK]` for `mq3.renderer.noise.perm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — | Record providing `noise.permutation`. |
| `value` | `dynamic` | — | Input used in the result expression `noise.permutation[value&NOISE_MASK]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L41)

<a id="function-function-mq3-renderer-noise-valueat-function-valueat-noise-x-y-z-t-src-mq3-renderer-noise-ml-903823197"></a>
### valueAt

```ml
function valueAt(noise, x, y, z, t)
```

Returns `noise.table[index]` from `mq3.renderer.noise.valueAt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — | Record providing `noise.table`. |
| `x` | `dynamic` | — | Input used by `index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))`. |
| `y` | `dynamic` | — | Input used by `index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))`. |
| `z` | `dynamic` | — | Input used by `index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))`. |
| `t` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.noise.perm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/noise.ml#L48)
