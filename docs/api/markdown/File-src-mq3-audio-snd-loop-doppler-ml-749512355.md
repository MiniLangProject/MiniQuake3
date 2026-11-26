# `src/mq3/audio/snd_loop_doppler.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_loop_doppler`](Package-mq3-audio-snd-loop-doppler-1330970771.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-snd-loop-doppler-distancesquared-function-distancesquared-left-right-src-mq3-audio-snd-loop-doppler-ml-1871833961"></a>
### distanceSquared

```ml
function distanceSquared(left, right)
```

Compute distance squared in audio.snd_loop_doppler; the normal completion returns `n.fadd(n.fadd(n.fmul(x, x), n.fmul(y, y)), n.fmul(z, z))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `left[0]` and `left[1]`. |
| `right` | `dynamic` | — | Right used in `right[0]` and `right[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L17)

- [mq3.audio.snd_loop_doppler.Doppler](Type-mq3-audio-snd-loop-doppler-doppler-1792889869.md) — struct
<a id="function-function-mq3-audio-snd-loop-doppler-update-function-update-listenerorigin-origin-velocity-previousscale-consecutive-enabled-src-mq3-audio-snd-loop-doppler-ml-1829418103"></a>
### update

```ml
function update(listenerOrigin, origin, velocity, previousScale, consecutive, enabled)
```

Update snd loop doppler in audio.snd_loop_doppler; the normal completion returns `Doppler(true, scale, old)`.

Validation failures include `loop Doppler: invalid vector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `listenerOrigin` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_loop_doppler.validVector`. |
| `origin` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_loop_doppler.validVector`. |
| `velocity` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_loop_doppler.validVector`. |
| `previousScale` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `consecutive` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `enabled` | `dynamic` | — | Enabled used in `(not enabled or (distanceSquared(velocity, [0.0, 0.0, 0.0]) <= 0.0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L31)

<a id="function-function-mq3-audio-snd-loop-doppler-validvector-function-validvector-value-src-mq3-audio-snd-loop-doppler-ml-1452154107"></a>
### validVector

```ml
function validVector(value)
```

Compute audio.snd_loop_doppler.validVector as `((value != void) and (len(value) == 3))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `len(value)` and `(value != void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L13)
