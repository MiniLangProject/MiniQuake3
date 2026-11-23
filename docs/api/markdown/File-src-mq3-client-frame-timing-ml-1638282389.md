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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `started` | `dynamic` | — |  |
| `finished` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L10)

<a id="function-function-mq3-client-frame-timing-histogram-function-histogram-src-mq3-client-frame-timing-ml-1049621914"></a>
### histogram

```ml
function histogram()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L9)

<a id="constant-constant-mq3-client-frame-timing-overflow-ms-const-overflow-ms-60000-src-mq3-client-frame-timing-ml-2064893699"></a>
### OVERFLOW_MS

```ml
const OVERFLOW_MS = 60000
```

Exact millisecond buckets through 59,999 ms. The final bucket is explicitly reported as a lower bound; an arbitrarily long pause is never called 60 s.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L8)

<a id="function-function-mq3-client-frame-timing-percentile-function-percentile-bins-count-percent-src-mq3-client-frame-timing-ml-1812578084"></a>
### percentile

```ml
function percentile(bins, count, percent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bins` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `percent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L22)

<a id="function-function-mq3-client-frame-timing-record-function-record-bins-milliseconds-src-mq3-client-frame-timing-ml-457851186"></a>
### record

```ml
function record(bins, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bins` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L16)

<a id="function-function-mq3-client-frame-timing-remaining-function-remaining-started-finished-budget-src-mq3-client-frame-timing-ml-1375372798"></a>
### remaining

```ml
function remaining(started, finished, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `started` | `dynamic` | — |  |
| `finished` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame_timing.ml#L11)
