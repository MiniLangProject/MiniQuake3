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
| `runtime` | `dynamic` | — | AAS runtime; accesses `map` and `disabled`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L48)

<a id="function-function-mq3-botlib-aas-syscalls-bboxareas-function-bboxareas-runtime-vm-minsaddress-maxsaddress-areasaddress-maximum-src-mq3-botlib-aas-syscalls-ml-2003160277"></a>
### bboxAreas

```ml
function bboxAreas(runtime, vm, minsAddress, maxsAddress, areasAddress, maximum)
```

Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.botlib.aas_runtime.bboxAreas` and `mq3.vm.syscall_common.pointer` while evaluating `bboxAreas`. Return paths include `len(areas)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `initialized` and `map`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `minsAddress` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `maxsAddress` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `areasAddress` | `dynamic` | — | Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L30)

<a id="function-function-mq3-botlib-aas-syscalls-bspfloat-function-bspfloat-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-1887293831"></a>
### bspFloat

```ml
function bspFloat(entities, vm, base)
```

Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bspValue` while evaluating `bspFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L115)

<a id="function-function-mq3-botlib-aas-syscalls-bspint-function-bspint-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-1244771343"></a>
### bspInt

```ml
function bspInt(entities, vm, base)
```

Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bspValue` while evaluating `bspInt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L123)

<a id="function-function-mq3-botlib-aas-syscalls-bspstring-function-bspstring-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-1268428919"></a>
### bspString

```ml
function bspString(entities, vm, base)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.vm.syscall_common.writeBuffer` while evaluating `bspString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L96)

<a id="function-function-mq3-botlib-aas-syscalls-bspvalue-function-bspvalue-entities-entity-key-src-mq3-botlib-aas-syscalls-ml-155645431"></a>
### bspValue

```ml
function bspValue(entities, entity, key)
```

Forward `bspValue` to `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L89)

<a id="function-function-mq3-botlib-aas-syscalls-bspvector-function-bspvector-entities-vm-base-src-mq3-botlib-aas-syscalls-ml-58488935"></a>
### bspVector

```ml
function bspVector(entities, vm, base)
```

Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bspValue` while evaluating `bspVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L106)

<a id="function-function-mq3-botlib-aas-syscalls-dispatch-function-dispatch-runtime-router-entities-vm-base-op-src-mq3-botlib-aas-syscalls-ml-326814161"></a>
### dispatch

```ml
function dispatch(runtime, router, entities, vm, base, op)
```

Forward `dispatch` to `mq3.botlib.aas_syscalls.dispatchCached` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS syscalls runtime; accesses `initialized`. |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L160)

<a id="function-function-mq3-botlib-aas-syscalls-dispatchcached-function-dispatchcached-runtime-router-routecache-entities-vm-base-op-src-mq3-botlib-aas-syscalls-ml-129273396"></a>
### dispatchCached

```ml
function dispatchCached(runtime, router, routeCache, entities, vm, base, op)
```

Apply `mq3.botlib.aas_runtime.enableRoutingArea`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bboxAreas` while evaluating `dispatchCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS syscalls runtime; accesses `initialized`. |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `routeCache` | `dynamic` | — | Routing cache state; accesses `router`, `routeIndex`, `hits`, `serial` and `routeLru` and related fields. May update `routeCache.hits`, `routeCache.serial` and `routeCache.misses` and additional fields in place. |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L136)

<a id="function-function-mq3-botlib-aas-syscalls-entitystate-function-entitystate-entities-src-mq3-botlib-aas-syscalls-ml-1085236867"></a>
### entityState

```ml
function entityState(entities)
```

Create a `mq3.botlib.aas_bspq3.State` record, initializing `loaded` as `true`, `numEntities` as `len(entities)` and `entities` from `entities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L80)

<a id="function-function-mq3-botlib-aas-syscalls-nextbspentity-function-nextbspentity-entities-current-src-mq3-botlib-aas-syscalls-ml-1108385734"></a>
### nextBspEntity

```ml
function nextBspEntity(entities, current)
```

Forward `nextBspEntity` to `mq3.botlib.aas_bspq3.AAS_NextBSPEntity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_bspq3.State.entities`. |
| `current` | `dynamic` | — | Operand used to evaluate the returned expression `entity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L84)

<a id="function-function-mq3-botlib-aas-syscalls-pointareanum-function-pointareanum-runtime-vm-address-src-mq3-botlib-aas-syscalls-ml-755793999"></a>
### pointAreaNum

```ml
function pointAreaNum(runtime, vm, address)
```

Apply `mq3.vm.syscall_common.readFloatVector` and `mq3.botlib.aas_runtime.pointAreaNum` while evaluating `pointAreaNum`. Return paths include `aasRuntime.pointAreaNum(runtime,point)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `runtime.nodeCache[nodeNum]` and `runtime.planeCache[node.planeNum]` in place. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L73)

<a id="function-function-mq3-botlib-aas-syscalls-presencetypeboundingbox-function-presencetypeboundingbox-vm-presencetype-minsaddress-maxsaddress-src-mq3-botlib-aas-syscalls-ml-883719276"></a>
### presenceTypeBoundingBox

```ml
function presenceTypeBoundingBox(vm, presenceType, minsAddress, maxsAddress)
```

Apply `mq3.botlib.aas_runtime.presenceTypeBoundingBox`, `mq3.vm.syscall_common.pointer` and `mq3.botlib.aas_syscalls.writeVector` while evaluating `presenceTypeBoundingBox`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `minsAddress` | `dynamic` | — | Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`. |
| `maxsAddress` | `dynamic` | — | Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L62)

<a id="function-function-mq3-botlib-aas-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-syscalls-ml-1798033401"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for aas syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_syscalls.ml#L18)
