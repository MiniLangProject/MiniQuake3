# `src/mq3/botlib/aas_query_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_query_syscalls`](Package-mq3-botlib-aas-query-syscalls-713717739.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_entities.ml` as `aasEntities` → [src/mq3/botlib/aas_entities.ml](File-src-mq3-botlib-aas-entities-ml-525847367.md)
- `mq3/botlib/aas_trace_areas.ml` as `traceAreas` → [src/mq3/botlib/aas_trace_areas.ml](File-src-mq3-botlib-aas-trace-areas-ml-2060721500.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="constant-constant-mq3-botlib-aas-query-syscalls-aas-entityinfo-size-const-aas-entityinfo-size-140-src-mq3-botlib-aas-query-syscalls-ml-1770497300"></a>
### AAS_ENTITYINFO_SIZE

```ml
const AAS_ENTITYINFO_SIZE = 140
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L12)

<a id="constant-constant-mq3-botlib-aas-query-syscalls-bot-entitystate-size-const-bot-entitystate-size-112-src-mq3-botlib-aas-query-syscalls-ml-1657180063"></a>
### BOT_ENTITYSTATE_SIZE

```ml
const BOT_ENTITYSTATE_SIZE = 112
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L11)

<a id="function-function-mq3-botlib-aas-query-syscalls-entityinfo-function-entityinfo-state-vm-number-address-src-mq3-botlib-aas-query-syscalls-ml-2102955209"></a>
### entityInfo

```ml
function entityInfo(state, vm, number, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L22)

<a id="function-function-mq3-botlib-aas-query-syscalls-readentitystate-function-readentitystate-vm-address-src-mq3-botlib-aas-query-syscalls-ml-1488503795"></a>
### readEntityState

```ml
function readEntityState(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L17)

<a id="function-function-mq3-botlib-aas-query-syscalls-trace-function-trace-runtime-vm-base-src-mq3-botlib-aas-query-syscalls-ml-1402662882"></a>
### trace

```ml
function trace(runtime, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L31)

<a id="function-function-mq3-botlib-aas-query-syscalls-vector-function-vector-data-address-src-mq3-botlib-aas-query-syscalls-ml-886072484"></a>
### vector

```ml
function vector(data, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L14)

<a id="function-function-mq3-botlib-aas-query-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-query-syscalls-ml-1813390055"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_query_syscalls.ml#L15)
