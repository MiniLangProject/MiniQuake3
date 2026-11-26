# `src/mq3/vm/cgame_collision_cache.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.cgame_collision_cache`](Package-mq3-vm-cgame-collision-cache-812282980.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `std/ds/hashmap.ml` as `maps` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/hashmap.ml` — external dependency

## Declarations

<a id="function-function-mq3-vm-cgame-collision-cache-aliasesarguments-function-aliasesarguments-vm-base-index-count-src-mq3-vm-cgame-collision-cache-ml-2018379515"></a>
### aliasesArguments

```ml
function aliasesArguments(vm, base, index, count)
```

Compute aliases arguments in vm.cgame_collision_cache; the normal completion returns `((at < (base + 32)) and (base < (at + count)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `mask`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |
| `count` | `dynamic` | — | Count used in `(count <= 0)` and `(at + count)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L112)

<a id="function-function-mq3-vm-cgame-collision-cache-bind-function-bind-memo-context-src-mq3-vm-cgame-collision-cache-ml-574837661"></a>
### bind

```ml
function bind(memo, context)
```

Update `memo.world`, `memo.map`, `memo.mapData`, `memo.mapDataPointer` in vm.cgame_collision_cache; the normal completion returns `true`.

Direct state writes: `memo.world`, `memo.map`, `memo.mapData`, `memo.mapDataPointer`, `memo.checksum`, `memo.name`, `memo.patchesReady`, `memo.playerCurveClip`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — | Record exposing `world`, `map`, `mapDataPointer`, `checksum`, `name`, `patchesReady`, `playerCurveClip`. Updated in place: `world`, `map`, `mapData`, `mapDataPointer`, `checksum`, `name` and further fields. |
| `context` | `dynamic` | — | Record exposing `collisionWorld`, `markMap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L79)

<a id="function-function-mq3-vm-cgame-collision-cache-capturemarks-function-capturemarks-vm-base-count-maxpoints-maxfragments-src-mq3-vm-cgame-collision-cache-ml-1902556435"></a>
### captureMarks

```ml
function captureMarks(vm, base, count, maxPoints, maxFragments)
```

Compute capture marks in vm.cgame_collision_cache; the normal completion returns `stored`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `count` | `dynamic` | — | Value passed as `value` to `mq3.compat.numeric.writeU32`. |
| `maxPoints` | `dynamic` | — | Max points used in `(maxPoints * 12)` and `common.pointer(vm, common.argument(vm, base, 5), (maxPoints * 12), "mark point output")`. |
| `maxFragments` | `dynamic` | — | Max fragments used in `(maxFragments * 8)` and `common.pointer(vm, common.argument(vm, base, 7), (maxFragments * 8), "mark fragment output")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L166)

<a id="function-function-mq3-vm-cgame-collision-cache-clear-function-clear-memo-src-mq3-vm-cgame-collision-cache-ml-974434526"></a>
### clear

```ml
function clear(memo)
```

Clear cgame collision cache in vm.cgame_collision_cache; updates `memo.invalidations`.

Direct state writes: `memo.invalidations`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — | Record exposing `traces`, `marks`, `invalidations`. Updated in place: `invalidations`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L70)

<a id="function-function-mq3-vm-cgame-collision-cache-create-function-create-src-mq3-vm-cgame-collision-cache-ml-443650822"></a>
### create

```ml
function create()
```

Create `mq3.vm.cgame_collision_cache.Memo` with enabled=true; world=void; map=void; mapData=void; 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L65)

<a id="function-function-mq3-vm-cgame-collision-cache-fifo-function-fifo-capacity-src-mq3-vm-cgame-collision-cache-ml-1666314406"></a>
### fifo

```ml
function fifo(capacity)
```

Create `mq3.vm.cgame_collision_cache.Fifo` with table=maps.HashMap.withCapacity((capacity * 2)); keys=array(capacity, void); next=0; used=0; capacity=capacity; hits=0; misses=0; evictions=0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Initial `capacity` field stored in the returned or constructed `mq3.vm.cgame_collision_cache.Fifo` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L63)

- [mq3.vm.cgame_collision_cache.Fifo](Type-mq3-vm-cgame-collision-cache-fifo-1421891328.md) — struct
<a id="constant-constant-mq3-vm-cgame-collision-cache-mark-capacity-const-mark-capacity-32-src-mq3-vm-cgame-collision-cache-ml-1867604904"></a>
### MARK_CAPACITY

```ml
const MARK_CAPACITY = 32
```

Maximum number of mark-fragment results retained in the client-game FIFO cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L12)

<a id="function-function-mq3-vm-cgame-collision-cache-markfragments-function-markfragments-memo-context-vm-base-reference-src-mq3-vm-cgame-collision-cache-ml-1064793248"></a>
### markFragments

```ml
function markFragments(memo, context, vm, base, reference)
```

Compute mark fragments in vm.cgame_collision_cache; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — | Record exposing `enabled`, `marks`. |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.vm.cgame_collision_cache.bind`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `reference` | `dynamic` | — | Reference used in `reference(context, vm, base)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L196)

<a id="function-function-mq3-vm-cgame-collision-cache-markkey-function-markkey-vm-base-count-maxpoints-maxfragments-src-mq3-vm-cgame-collision-cache-ml-307834335"></a>
### markKey

```ml
function markKey(vm, base, count, maxPoints, maxFragments)
```

Compute mark key in vm.cgame_collision_cache; the normal completion returns `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `count` | `dynamic` | — | Value passed as `value` to `mq3.compat.numeric.writeU32`. |
| `maxPoints` | `dynamic` | — | Value passed as `value` to `mq3.compat.numeric.writeU32`. |
| `maxFragments` | `dynamic` | — | Value passed as `value` to `mq3.compat.numeric.writeU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L156)

<a id="constant-constant-mq3-vm-cgame-collision-cache-max-mark-bytes-const-max-mark-bytes-65536-src-mq3-vm-cgame-collision-cache-ml-873289458"></a>
### MAX_MARK_BYTES

```ml
const MAX_MARK_BYTES = 65536
```

Upper bound on mark bytes represented by mq3.vm.cgame_collision_cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L14)

- [mq3.vm.cgame_collision_cache.Memo](Type-mq3-vm-cgame-collision-cache-memo-960623596.md) — struct
<a id="function-function-mq3-vm-cgame-collision-cache-publishmarks-function-publishmarks-vm-base-stored-maxpoints-maxfragments-src-mq3-vm-cgame-collision-cache-ml-431772567"></a>
### publishMarks

```ml
function publishMarks(vm, base, stored, maxPoints, maxFragments)
```

Compute publish marks in vm.cgame_collision_cache; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `stored` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readI32`. |
| `maxPoints` | `dynamic` | — | Max points used in `(maxPoints * 12)` and `common.pointer(vm, common.argument(vm, base, 5), (maxPoints * 12), "mark point output")`. |
| `maxFragments` | `dynamic` | — | Max fragments used in `(maxFragments * 8)` and `common.pointer(vm, common.argument(vm, base, 7), (maxFragments * 8), "mark fragment output")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L183)

<a id="function-function-mq3-vm-cgame-collision-cache-remember-function-remember-cache-key-value-src-mq3-vm-cgame-collision-cache-ml-711153600"></a>
### remember

```ml
function remember(cache, key, value)
```

Update `cache.evictions`, `cache.used`, `cache.next` in vm.cgame_collision_cache.

Direct state writes: `cache.evictions`, `cache.used`, `cache.next`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record exposing `used`, `capacity`, `keys`, `next`, `table`, `evictions`. Updated in place: `evictions`, `used`, `next`. |
| `key` | `dynamic` | — | Key used in `cache.table.set(key, value)`. |
| `value` | `dynamic` | — | Value used in `cache.table.set(key, value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L95)

<a id="function-function-mq3-vm-cgame-collision-cache-trace-function-trace-memo-context-vm-base-capsule-transformed-reference-src-mq3-vm-cgame-collision-cache-ml-1667131642"></a>
### trace

```ml
function trace(memo, context, vm, base, capsule, transformed, reference)
```

Trace cgame collision cache in vm.cgame_collision_cache; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memo` | `dynamic` | — | Record exposing `enabled`, `traces`. |
| `context` | `dynamic` | — | Record exposing `collisionWorld`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.vm.cgame_collision_cache.traceKey`. |
| `transformed` | `dynamic` | — | Transformed used in `reference(context, vm, base, capsule, transformed)` and `(((memo == void) or not memo.enabled) or transformed)`. |
| `reference` | `dynamic` | — | Reference used in `reference(context, vm, base, capsule, transformed)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L136)

<a id="constant-constant-mq3-vm-cgame-collision-cache-trace-capacity-const-trace-capacity-64-src-mq3-vm-cgame-collision-cache-ml-922031013"></a>
### TRACE_CAPACITY

```ml
const TRACE_CAPACITY = 64
```

Maximum number of trace results retained in the client-game FIFO cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L10)

<a id="function-function-mq3-vm-cgame-collision-cache-tracekey-function-tracekey-vm-base-capsule-world-src-mq3-vm-cgame-collision-cache-ml-1226749665"></a>
### traceKey

```ml
function traceKey(vm, base, capsule, world)
```

Trace key in vm.cgame_collision_cache; the normal completion returns `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `capsule` | `dynamic` | — | Capsule operand used by `traceKey`; its reads are shown in the implementation. |
| `world` | `dynamic` | — | Record exposing `patchesReady`, `playerCurveClip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L121)

<a id="function-function-mq3-vm-cgame-collision-cache-vectorbytes-function-vectorbytes-vm-address-target-offset-src-mq3-vm-cgame-collision-cache-ml-1803010661"></a>
### vectorBytes

```ml
function vectorBytes(vm, address, target, offset)
```

Compute vector bytes in vm.cgame_collision_cache.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `target` | `dynamic` | — | Target used in `copyBytes(target, offset, vm.data, source, 12)`. |
| `offset` | `dynamic` | — | Offset used in `copyBytes(target, offset, vm.data, source, 12)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_collision_cache.ml#L104)
