# `src/mq3/botlib/aas_client_trace.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_client_trace`](Package-mq3-botlib-aas-client-trace-1437753389.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-aas-client-trace-add-function-add-a-b-src-mq3-botlib-aas-client-trace-ml-2020624695"></a>
### add

```ml
function add(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L22)

<a id="function-function-mq3-botlib-aas-client-trace-copy-function-copy-value-src-mq3-botlib-aas-client-trace-ml-1189074405"></a>
### copy

```ml
function copy(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L17)

<a id="function-function-mq3-botlib-aas-client-trace-dot-function-dot-a-b-src-mq3-botlib-aas-client-trace-ml-308670499"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L19)

<a id="function-function-mq3-botlib-aas-client-trace-empty-function-empty-src-mq3-botlib-aas-client-trace-ml-281566996"></a>
### empty

```ml
function empty()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L23)

<a id="function-function-mq3-botlib-aas-client-trace-fail-function-fail-message-src-mq3-botlib-aas-client-trace-ml-1044286339"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L16)

<a id="function-function-mq3-botlib-aas-client-trace-hit-function-hit-runtime-start-finish-segment-nodenum-planenum-lastarea-src-mq3-botlib-aas-client-trace-ml-1432746739"></a>
### hit

```ml
function hit(runtime, start, finish, segment, nodeNum, planenum, lastarea)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `segment` | `dynamic` | — |  |
| `nodeNum` | `dynamic` | — |  |
| `planenum` | `dynamic` | — |  |
| `lastarea` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L25)

<a id="function-function-mq3-botlib-aas-client-trace-length-function-length-value-src-mq3-botlib-aas-client-trace-ml-356061929"></a>
### length

```ml
function length(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L20)

<a id="function-function-mq3-botlib-aas-client-trace-scale-function-scale-value-amount-src-mq3-botlib-aas-client-trace-ml-1721523597"></a>
### scale

```ml
function scale(value, amount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L21)

- [mq3.botlib.aas_client_trace.Segment](Type-mq3-botlib-aas-client-trace-segment-775879010.md) — struct
<a id="function-function-mq3-botlib-aas-client-trace-sub-function-sub-a-b-src-mq3-botlib-aas-client-trace-ml-2024218593"></a>
### sub

```ml
function sub(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L18)

<a id="function-function-mq3-botlib-aas-client-trace-trace-function-trace-runtime-start-finish-presencetype-src-mq3-botlib-aas-client-trace-ml-139957774"></a>
### trace

```ml
function trace(runtime, start, finish, presenceType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L43)

- [mq3.botlib.aas_client_trace.Trace](Type-mq3-botlib-aas-client-trace-trace-964334042.md) — struct
<a id="constant-constant-mq3-botlib-aas-client-trace-trace-stack-size-const-trace-stack-size-127-src-mq3-botlib-aas-client-trace-ml-1086353703"></a>
### TRACE_STACK_SIZE

```ml
const TRACE_STACK_SIZE = 127
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L11)

<a id="constant-constant-mq3-botlib-aas-client-trace-traceplane-epsilon-const-traceplane-epsilon-0-125-src-mq3-botlib-aas-client-trace-ml-103936643"></a>
### TRACEPLANE_EPSILON

```ml
const TRACEPLANE_EPSILON = 0.125
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L10)
