# `src/mq3/vm/cgame_collision_cache.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.cgame_collision_cache`](Package-mq3-vm-cgame-collision-cache-812282980.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency

## Declarations

<a id="function-function-mq3-vm-cgame-collision-cache-aliasesarguments-function-aliasesarguments-vm-base-index-count-src-mq3-vm-cgame-collision-cache-ml-2018379515"></a>
### aliasesArguments

```ml
function aliasesArguments(vm, base, index, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L37)

<a id="function-function-mq3-vm-cgame-collision-cache-bind-function-bind-memo-context-src-mq3-vm-cgame-collision-cache-ml-574837661"></a>
### bind

```ml
function bind(memo, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L20)

<a id="function-function-mq3-vm-cgame-collision-cache-capturemarks-function-capturemarks-vm-base-count-maxpoints-maxfragments-src-mq3-vm-cgame-collision-cache-ml-1902556435"></a>
### captureMarks

```ml
function captureMarks(vm, base, count, maxPoints, maxFragments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `maxPoints` | `dynamic` | — |  |
| `maxFragments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L66)

<a id="function-function-mq3-vm-cgame-collision-cache-clear-function-clear-memo-src-mq3-vm-cgame-collision-cache-ml-974434526"></a>
### clear

```ml
function clear(memo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L16)

<a id="function-function-mq3-vm-cgame-collision-cache-create-function-create-src-mq3-vm-cgame-collision-cache-ml-443650822"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L15)

<a id="function-function-mq3-vm-cgame-collision-cache-fifo-function-fifo-capacity-src-mq3-vm-cgame-collision-cache-ml-1666314406"></a>
### fifo

```ml
function fifo(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L14)

- [mq3.vm.cgame_collision_cache.Fifo](Type-mq3-vm-cgame-collision-cache-fifo-1421891328.md) — struct
<a id="constant-constant-mq3-vm-cgame-collision-cache-mark-capacity-const-mark-capacity-32-src-mq3-vm-cgame-collision-cache-ml-1867604904"></a>
### MARK_CAPACITY

```ml
const MARK_CAPACITY = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L10)

<a id="function-function-mq3-vm-cgame-collision-cache-markfragments-function-markfragments-memo-context-vm-base-reference-src-mq3-vm-cgame-collision-cache-ml-1064793248"></a>
### markFragments

```ml
function markFragments(memo, context, vm, base, reference)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `reference` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L84)

<a id="function-function-mq3-vm-cgame-collision-cache-markkey-function-markkey-vm-base-count-maxpoints-maxfragments-src-mq3-vm-cgame-collision-cache-ml-307834335"></a>
### markKey

```ml
function markKey(vm, base, count, maxPoints, maxFragments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `maxPoints` | `dynamic` | — |  |
| `maxFragments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L62)

<a id="constant-constant-mq3-vm-cgame-collision-cache-max-mark-bytes-const-max-mark-bytes-65536-src-mq3-vm-cgame-collision-cache-ml-873289458"></a>
### MAX_MARK_BYTES

```ml
const MAX_MARK_BYTES = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L11)

- [mq3.vm.cgame_collision_cache.Memo](Type-mq3-vm-cgame-collision-cache-memo-960623596.md) — struct
<a id="function-function-mq3-vm-cgame-collision-cache-publishmarks-function-publishmarks-vm-base-stored-maxpoints-maxfragments-src-mq3-vm-cgame-collision-cache-ml-431772567"></a>
### publishMarks

```ml
function publishMarks(vm, base, stored, maxPoints, maxFragments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `stored` | `dynamic` | — |  |
| `maxPoints` | `dynamic` | — |  |
| `maxFragments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L77)

<a id="function-function-mq3-vm-cgame-collision-cache-remember-function-remember-cache-key-value-src-mq3-vm-cgame-collision-cache-ml-711153600"></a>
### remember

```ml
function remember(cache, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L30)

<a id="function-function-mq3-vm-cgame-collision-cache-trace-function-trace-memo-context-vm-base-capsule-transformed-reference-src-mq3-vm-cgame-collision-cache-ml-1667131642"></a>
### trace

```ml
function trace(memo, context, vm, base, capsule, transformed, reference)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `transformed` | `dynamic` | — |  |
| `reference` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L48)

<a id="constant-constant-mq3-vm-cgame-collision-cache-trace-capacity-const-trace-capacity-64-src-mq3-vm-cgame-collision-cache-ml-922031013"></a>
### TRACE_CAPACITY

```ml
const TRACE_CAPACITY = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L9)

<a id="function-function-mq3-vm-cgame-collision-cache-tracekey-function-tracekey-vm-base-capsule-world-src-mq3-vm-cgame-collision-cache-ml-1226749665"></a>
### traceKey

```ml
function traceKey(vm, base, capsule, world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L41)

<a id="function-function-mq3-vm-cgame-collision-cache-vectorbytes-function-vectorbytes-vm-address-target-offset-src-mq3-vm-cgame-collision-cache-ml-1803010661"></a>
### vectorBytes

```ml
function vectorBytes(vm, address, target, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L34)
