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

Return a new array `[n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]` for `add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L70)

<a id="function-function-mq3-botlib-aas-client-trace-copy-function-copy-value-src-mq3-botlib-aas-client-trace-ml-1189074405"></a>
### copy

```ml
function copy(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas client trace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L51)

<a id="function-function-mq3-botlib-aas-client-trace-dot-function-dot-a-b-src-mq3-botlib-aas-client-trace-ml-308670499"></a>
### dot

```ml
function dot(a, b)
```

Return the result of `n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2]))` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L59)

<a id="function-function-mq3-botlib-aas-client-trace-empty-function-empty-src-mq3-botlib-aas-client-trace-ml-281566996"></a>
### empty

```ml
function empty()
```

Create a `mq3.botlib.aas_client_trace.Trace` record, initializing `endpos` as `[0.0,0.0,0.0]` and `normal` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L72)

<a id="function-function-mq3-botlib-aas-client-trace-fail-function-fail-message-src-mq3-botlib-aas-client-trace-ml-1044286339"></a>
### fail

```ml
function fail(message)
```

Construct error `7542` with diagnostic text `"AAS client trace: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L48)

<a id="function-function-mq3-botlib-aas-client-trace-hit-function-hit-runtime-start-finish-segment-nodenum-planenum-lastarea-src-mq3-botlib-aas-client-trace-ml-1432746739"></a>
### hit

```ml
function hit(runtime, start, finish, segment, nodeNum, planenum, lastarea)
```

Set `segment.start` to `add(segment.start,scale(normalized,-0.125))` in `mq3.botlib.aas_client_trace.hit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS client trace runtime; accesses `map`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `segment` | `dynamic` | — | Segment record; accesses `start`. May update `segment.start` in place. |
| `nodeNum` | `dynamic` | — | Value used by `hit` in `result.area=nodeNum`. |
| `planenum` | `dynamic` | — | Index of the entry to access. |
| `lastarea` | `dynamic` | — | Value used by `hit` in `result.lastarea=lastarea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L82)

<a id="function-function-mq3-botlib-aas-client-trace-length-function-length-value-src-mq3-botlib-aas-client-trace-ml-356061929"></a>
### length

```ml
function length(value)
```

Forward `length` to `mq3.compat.numeric.fsqrt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L62)

<a id="function-function-mq3-botlib-aas-client-trace-scale-function-scale-value-amount-src-mq3-botlib-aas-client-trace-ml-1721523597"></a>
### scale

```ml
function scale(value, amount)
```

Return a new array `[n.fmul(value[0],amount),n.fmul(value[1],amount),n.fmul(value[2],amount)]` for `scale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `amount` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L66)

- [mq3.botlib.aas_client_trace.Segment](Type-mq3-botlib-aas-client-trace-segment-775879010.md) — struct
<a id="function-function-mq3-botlib-aas-client-trace-sub-function-sub-a-b-src-mq3-botlib-aas-client-trace-ml-2024218593"></a>
### sub

```ml
function sub(a, b)
```

Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `sub`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L55)

<a id="function-function-mq3-botlib-aas-client-trace-trace-function-trace-runtime-start-finish-presencetype-src-mq3-botlib-aas-client-trace-ml-139957774"></a>
### trace

```ml
function trace(runtime, start, finish, presenceType)
```

Build the `mq3.botlib.aas_client_trace.Trace` result for `trace`. Return paths include `Trace(false,1.0,copy(finish),0,lastarea,0,0,[0.0,0.0,0.0])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS client trace runtime; accesses `initialized` and `map`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L105)

- [mq3.botlib.aas_client_trace.Trace](Type-mq3-botlib-aas-client-trace-trace-964334042.md) — struct
<a id="constant-constant-mq3-botlib-aas-client-trace-trace-stack-size-const-trace-stack-size-127-src-mq3-botlib-aas-client-trace-ml-1086353703"></a>
### TRACE_STACK_SIZE

```ml
const TRACE_STACK_SIZE = 127
```

Maximum number of pending nodes retained by an iterative BSP trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L13)

<a id="constant-constant-mq3-botlib-aas-client-trace-traceplane-epsilon-const-traceplane-epsilon-0-125-src-mq3-botlib-aas-client-trace-ml-103936643"></a>
### TRACEPLANE_EPSILON

```ml
const TRACEPLANE_EPSILON = 0.125
```

Distance tolerance used to position a trace safely before an impact plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L11)
