# `src/mq3/botlib/aas_route_extra_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_route_extra_syscalls`](Package-mq3-botlib-aas-route-extra-syscalls-2138908331.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_route_extras.ml` as `extras` → [src/mq3/botlib/aas_route_extras.ml](File-src-mq3-botlib-aas-route-extras-ml-1580573357.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="constant-constant-mq3-botlib-aas-route-extra-syscalls-alternative-goal-size-const-alternative-goal-size-24-src-mq3-botlib-aas-route-extra-syscalls-ml-527871889"></a>
### ALTERNATIVE_GOAL_SIZE

```ml
const ALTERNATIVE_GOAL_SIZE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L11)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-dispatch-function-dispatch-state-router-vm-base-op-src-mq3-botlib-aas-route-extra-syscalls-ml-958813099"></a>
### dispatch

```ml
function dispatch(state, router, vm, base, op)
```

Forward `dispatch` to `mq3.botlib.aas_route_extra_syscalls.dispatchCached` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS route extras state; accesses `initialized` and `map`. |
| `router` | `dynamic` | — | AAS routing state; accesses `settings` and `runtime`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L72)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-dispatchcached-function-dispatchcached-state-router-cache-vm-base-op-src-mq3-botlib-aas-route-extra-syscalls-ml-1263350555"></a>
### dispatchCached

```ml
function dispatchCached(state, router, cache, vm, base, op)
```

Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_route_extras.alternativeRouteGoals` while evaluating `dispatchCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS route extras state; accesses `initialized` and `map`. |
| `router` | `dynamic` | — | AAS routing state; accesses `settings` and `runtime`. |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L53)

<a id="constant-constant-mq3-botlib-aas-route-extra-syscalls-predict-route-size-const-predict-route-size-36-src-mq3-botlib-aas-route-extra-syscalls-ml-1655132544"></a>
### PREDICT_ROUTE_SIZE

```ml
const PREDICT_ROUTE_SIZE = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L10)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-readpredictroute-function-readpredictroute-vm-address-src-mq3-botlib-aas-route-extra-syscalls-ml-301445635"></a>
### readPredictRoute

```ml
function readPredictRoute(vm, address)
```

Build the `mq3.botlib.aas_route_extras.PredictRoute` result for `readPredictRoute`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L25)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writealternativegoals-function-writealternativegoals-vm-address-values-maximum-src-mq3-botlib-aas-route-extra-syscalls-ml-1491914231"></a>
### writeAlternativeGoals

```ml
function writeAlternativeGoals(vm, address, values, maximum)
```

Apply `mq3.vm.syscall_common.pointer`, `mq3.botlib.aas_route_extra_syscalls.writeVector` and `mq3.botlib.aas_route_extra_syscalls.writeU16` while evaluating `writeAlternativeGoals`. Return paths include `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `values` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L41)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writepredictroute-function-writepredictroute-vm-address-value-src-mq3-botlib-aas-route-extra-syscalls-ml-1046895008"></a>
### writePredictRoute

```ml
function writePredictRoute(vm, address, value)
```

Apply `mq3.vm.syscall_common.pointer` and `mq3.botlib.aas_route_extra_syscalls.writeVector` while evaluating `writePredictRoute`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Value record; accesses `endPos`, `endArea`, `stopEvent`, `endContents` and `endTravelFlags` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L33)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writeu16-function-writeu16-data-address-value-src-mq3-botlib-aas-route-extra-syscalls-ml-1220806107"></a>
### writeU16

```ml
function writeU16(data, address, value)
```

Set `data[address]` to `value&255` and `data[address+1]` to `(value>>8)&255` in `mq3.botlib.aas_route_extra_syscalls.writeU16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `address` and `address+1`. Entries are written in place. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Value used by `writeU16` in `data[address]=value&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L21)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-route-extra-syscalls-ml-1975953999"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for aas route extra syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L16)
