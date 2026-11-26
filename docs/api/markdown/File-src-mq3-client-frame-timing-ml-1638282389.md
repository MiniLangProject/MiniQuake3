# `src/mq3/client/frame_timing.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.frame_timing`](Package-mq3-client-frame-timing-1249966285.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-frame-timing-elapsed-function-elapsed-started-finished-src-mq3-client-frame-timing-ml-1282847619"></a>
### elapsed

```ml
function elapsed(started, finished)
```

Computes `(finished-started)&0xffffffff` for frame timing `elapsed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `started` | `dynamic` | — | Value used by `return (finished-started)&0xffffffff`. |
| `finished` | `dynamic` | — | Value used by `return (finished-started)&0xffffffff`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L14)

<a id="function-function-mq3-client-frame-timing-histogram-function-histogram-src-mq3-client-frame-timing-ml-1049621914"></a>
### histogram

```ml
function histogram()
```

Creates an array from `OVERFLOW_MS+1, 0` for frame timing `histogram`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L10)

<a id="constant-constant-mq3-client-frame-timing-overflow-ms-const-overflow-ms-60000-src-mq3-client-frame-timing-ml-2064893699"></a>
### OVERFLOW_MS

```ml
const OVERFLOW_MS = 60000
```

Exact millisecond buckets through 59,999 ms. The final bucket is explicitly reported as a lower bound; an arbitrarily long pause is never called 60 s.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L8)

<a id="function-function-mq3-client-frame-timing-percentile-function-percentile-bins-count-percent-src-mq3-client-frame-timing-ml-1812578084"></a>
### percentile

```ml
function percentile(bins, count, percent)
```

Calls `mq3.compat.numeric.trunc32` from frame timing `percentile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bins` | `dynamic` | — | Sequence read at `bins[index]`. |
| `count` | `dynamic` | — | Value tested by `count<1` before the calculation continues. |
| `percent` | `dynamic` | — | Value used by `if percent<1 or percent>100 then return error(7790,"invalid frame percentile") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L37)

<a id="function-function-mq3-client-frame-timing-record-function-record-bins-milliseconds-src-mq3-client-frame-timing-ml-457851186"></a>
### record

```ml
function record(bins, milliseconds)
```

Updates `bins[bucket]` during frame timing `record`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bins` | `dynamic` | — | Mutable sequence; this routine writes `bins[bucket]`. |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L27)

<a id="function-function-mq3-client-frame-timing-remaining-function-remaining-started-finished-budget-src-mq3-client-frame-timing-ml-1375372798"></a>
### remaining

```ml
function remaining(started, finished, budget)
```

Calls `mq3.client.frame_timing.elapsed` from frame timing `remaining`. The final path returns `budget-used`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `started` | `dynamic` | — | Value used by `used=elapsed(started,finished)`. |
| `finished` | `dynamic` | — | Value used by `used=elapsed(started,finished)`. |
| `budget` | `dynamic` | — | Value used by `if used>=budget then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L19)
