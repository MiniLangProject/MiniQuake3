# `src/mq3/botlib/aas_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_syscalls`](Package-mq3-botlib-aas-syscalls-1851670310.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_bspq3.ml` as `bspq3` → [src/mq3/botlib/aas_bspq3.ml](File-src-mq3-botlib-aas-bspq3-ml-738898527.md)
- `mq3/botlib/aas_routing.ml` as `aasRouting` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_routing_cache.ml` as `aasRoutingCache` → [src/mq3/botlib/aas_routing_cache.ml](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)
- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-aas-syscalls-areainfo-function-areainfo-runtime-vm-areanum-address-src-mq3-botlib-aas-syscalls-ml-1552397564"></a>
### areaInfo

```ml
function areaInfo(runtime, vm, areaNum, address)
```

aas_areainfo_t in the pinned Baseq3 be_aas.h contains four ints followed by mins, maxs and center. clusterAreaNum/reachability metadata remains an internal runtime detail and is deliberately not written into the 52-byte ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L33)

<a id="function-function-mq3-botlib-aas-syscalls-bboxareas-function-bboxareas-runtime-vm-minsaddress-maxsaddress-areasaddress-maximum-src-mq3-botlib-aas-syscalls-ml-2003160277"></a>
### bboxAreas

```ml
function bboxAreas(runtime, vm, minsAddress, maxsAddress, areasAddress, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `minsAddress` | `dynamic` | — |  |
| `maxsAddress` | `dynamic` | — |  |
| `areasAddress` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L19)

<a id="function-function-mq3-botlib-aas-syscalls-bspfloat-function-bspfloat-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-1887293831"></a>
### bspFloat

```ml
function bspFloat(entities, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L70)

<a id="function-function-mq3-botlib-aas-syscalls-bspint-function-bspint-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-1244771343"></a>
### bspInt

```ml
function bspInt(entities, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L74)

<a id="function-function-mq3-botlib-aas-syscalls-bspstring-function-bspstring-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-1268428919"></a>
### bspString

```ml
function bspString(entities, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L59)

<a id="function-function-mq3-botlib-aas-syscalls-bspvalue-function-bspvalue-entities-entity-key-src-mq3-botlib-aas-syscalls-ml-155645431"></a>
### bspValue

```ml
function bspValue(entities, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L56)

<a id="function-function-mq3-botlib-aas-syscalls-bspvector-function-bspvector-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-58488935"></a>
### bspVector

```ml
function bspVector(entities, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L65)

<a id="function-function-mq3-botlib-aas-syscalls-dispatch-function-dispatch-runtime-router-entities-vm-base-op-src-mq3-botlib-aas-syscalls-ml-326814161"></a>
### dispatch

```ml
function dispatch(runtime, router, entities, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `router` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L96)

<a id="function-function-mq3-botlib-aas-syscalls-dispatchcached-function-dispatchcached-runtime-router-routecache-entities-vm-base-op-src-mq3-botlib-aas-syscalls-ml-129273396"></a>
### dispatchCached

```ml
function dispatchCached(runtime, router, routeCache, entities, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `router` | `dynamic` | — |  |
| `routeCache` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L79)

<a id="function-function-mq3-botlib-aas-syscalls-entitystate-function-entitystate-entities-src-mq3-botlib-aas-syscalls-ml-1085236867"></a>
### entityState

```ml
function entityState(entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L54)

<a id="function-function-mq3-botlib-aas-syscalls-nextbspentity-function-nextbspentity-entities-current-src-mq3-botlib-aas-syscalls-ml-1108385734"></a>
### nextBspEntity

```ml
function nextBspEntity(entities, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L55)

<a id="function-function-mq3-botlib-aas-syscalls-pointareanum-function-pointareanum-runtime-vm-address-src-mq3-botlib-aas-syscalls-ml-755793999"></a>
### pointAreaNum

```ml
function pointAreaNum(runtime, vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L49)

<a id="function-function-mq3-botlib-aas-syscalls-presencetypeboundingbox-function-presencetypeboundingbox-vm-presencetype-minsaddress-maxsaddress-src-mq3-botlib-aas-syscalls-ml-883719276"></a>
### presenceTypeBoundingBox

```ml
function presenceTypeBoundingBox(vm, presenceType, minsAddress, maxsAddress)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `minsAddress` | `dynamic` | — |  |
| `maxsAddress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L42)

<a id="function-function-mq3-botlib-aas-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-syscalls-ml-1798033401"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_syscalls.ml#L14)
