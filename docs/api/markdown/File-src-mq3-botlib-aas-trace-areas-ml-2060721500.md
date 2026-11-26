# `src/mq3/botlib/aas_trace_areas.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_trace_areas`](Package-mq3-botlib-aas-trace-areas-55676880.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-aas-trace-areas-copy-function-copy-value-src-mq3-botlib-aas-trace-areas-ml-1572631073"></a>
### copy

```ml
function copy(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas trace areas.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_trace_areas.ml#L30)

<a id="function-function-mq3-botlib-aas-trace-areas-dot-function-dot-a-b-src-mq3-botlib-aas-trace-areas-ml-803666653"></a>
### dot

```ml
function dot(a, b)
```

Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_trace_areas.ml#L34)

- [mq3.botlib.aas_trace_areas.Result](Type-mq3-botlib-aas-trace-areas-result-1579758851.md) — struct
- [mq3.botlib.aas_trace_areas.Segment](Type-mq3-botlib-aas-trace-areas-segment-148974843.md) — struct
<a id="function-function-mq3-botlib-aas-trace-areas-trace-function-trace-runtime-start-finish-maximum-src-mq3-botlib-aas-trace-areas-ml-642350025"></a>
### trace

```ml
function trace(runtime, start, finish, maximum)
```

Trace a line segment through AAS areas and retain the crossed area numbers and intersection points.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS trace areas runtime; accesses `initialized` and `map`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_trace_areas.ml#L41)
