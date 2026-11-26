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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `router` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L39)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-dispatchcached-function-dispatchcached-state-router-cache-vm-base-op-src-mq3-botlib-aas-route-extra-syscalls-ml-1263350555"></a>
### dispatchCached

```ml
function dispatchCached(state, router, cache, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `router` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L26)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L14)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writealternativegoals-function-writealternativegoals-vm-address-values-maximum-src-mq3-botlib-aas-route-extra-syscalls-ml-1491914231"></a>
### writeAlternativeGoals

```ml
function writeAlternativeGoals(vm, address, values, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L21)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writepredictroute-function-writepredictroute-vm-address-value-src-mq3-botlib-aas-route-extra-syscalls-ml-1046895008"></a>
### writePredictRoute

```ml
function writePredictRoute(vm, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L18)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writeu16-function-writeu16-data-address-value-src-mq3-botlib-aas-route-extra-syscalls-ml-1220806107"></a>
### writeU16

```ml
function writeU16(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L13)

<a id="function-function-mq3-botlib-aas-route-extra-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-route-extra-syscalls-ml-1975953999"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extra_syscalls.ml#L12)
