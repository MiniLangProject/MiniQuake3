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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L12)

<a id="constant-constant-mq3-botlib-aas-query-syscalls-bot-entitystate-size-const-bot-entitystate-size-112-src-mq3-botlib-aas-query-syscalls-ml-1657180063"></a>
### BOT_ENTITYSTATE_SIZE

```ml
const BOT_ENTITYSTATE_SIZE = 112
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L11)

<a id="function-function-mq3-botlib-aas-query-syscalls-entityinfo-function-entityinfo-state-vm-number-address-src-mq3-botlib-aas-query-syscalls-ml-2102955209"></a>
### entityInfo

```ml
function entityInfo(state, vm, number, address)
```

Apply `mq3.vm.syscall_common.pointer`, `mq3.botlib.aas_entities.AAS_EntityInfo` and `mq3.botlib.aas_query_syscalls.writeVector` while evaluating `entityInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `number` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L37)

<a id="function-function-mq3-botlib-aas-query-syscalls-readentitystate-function-readentitystate-vm-address-src-mq3-botlib-aas-query-syscalls-ml-1488503795"></a>
### readEntityState

```ml
function readEntityState(vm, address)
```

Build the `mq3.botlib.aas_entities.EntityState` result for `readEntityState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L27)

<a id="function-function-mq3-botlib-aas-query-syscalls-trace-function-trace-runtime-vm-base-src-mq3-botlib-aas-query-syscalls-ml-1402662882"></a>
### trace

```ml
function trace(runtime, vm, base)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readFloatVector` and `mq3.botlib.aas_trace_areas.trace` while evaluating `trace`. Return paths include `len(result.areas)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS trace areas runtime; accesses `initialized` and `map`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L50)

<a id="function-function-mq3-botlib-aas-query-syscalls-vector-function-vector-data-address-src-mq3-botlib-aas-query-syscalls-ml-886072484"></a>
### vector

```ml
function vector(data, address)
```

Return a new array `[n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))]` for `vector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.readI32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L17)

<a id="function-function-mq3-botlib-aas-query-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-query-syscalls-ml-1813390055"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for aas query syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_query_syscalls.ml#L22)
