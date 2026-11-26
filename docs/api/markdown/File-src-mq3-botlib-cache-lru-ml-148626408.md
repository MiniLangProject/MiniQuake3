# `src/mq3/botlib/cache_lru.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.cache_lru`](Package-mq3-botlib-cache-lru-70686216.md)

Reachable from entry: **yes**

## Imports

- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-cache-lru-append-function-append-state-slot-src-mq3-botlib-cache-lru-ml-1912471729"></a>
### append

```ml
function append(state, slot)
```

Update `state.previous[slot]`, `state.next[slot]`, `state.next[state.newest]` and `state.oldest` and related state during `append`. Return paths include `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Cache lru state; accesses `previous`, `newest`, `next` and `oldest`. May update `state.previous[slot]`, `state.next[slot]` and `state.next[state.newest]` and additional fields in place. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L17)

<a id="function-function-mq3-botlib-cache-lru-clear-function-clear-state-src-mq3-botlib-cache-lru-ml-1764260091"></a>
### clear

```ml
function clear(state)
```

Reset the routing cache LRU bookkeeping and release all recorded slots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Cache lru state; accesses `count`, `keys`, `previous`, `next` and `positions` and related fields. May update `state.keys[slot]`, `state.previous[slot]` and `state.next[slot]` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L55)

<a id="function-function-mq3-botlib-cache-lru-create-function-create-capacity-src-mq3-botlib-cache-lru-ml-1126451574"></a>
### create

```ml
function create(capacity)
```

Build the `mq3.botlib.cache_lru.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L10)

<a id="function-function-mq3-botlib-cache-lru-reserve-function-reserve-state-key-src-mq3-botlib-cache-lru-ml-1080681222"></a>
### reserve

```ml
function reserve(state, key)
```

Set `state.count` to `state.count+1` and `state.keys[slot]` to `key` in `mq3.botlib.cache_lru.reserve`. Return paths include `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Cache lru state; accesses `positions`, `count`, `capacity`, `oldest` and `keys`. May update `state.count` and `state.keys[slot]` in place. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L42)

- [mq3.botlib.cache_lru.State](Type-mq3-botlib-cache-lru-state-1176927479.md) — struct
<a id="function-function-mq3-botlib-cache-lru-touch-function-touch-state-key-src-mq3-botlib-cache-lru-ml-1748647972"></a>
### touch

```ml
function touch(state, key)
```

Use `state.positions.getOr` to perform `touch`. Return paths include `touchSlot(state,slot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Cache lru state; accesses `positions`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L35)

<a id="function-function-mq3-botlib-cache-lru-touchslot-function-touchslot-state-slot-src-mq3-botlib-cache-lru-ml-1591503319"></a>
### touchSlot

```ml
function touchSlot(state, slot)
```

Update `state.next[before]`, `state.oldest` and `state.previous[after]` during `touchSlot`. Return paths include `append(state,slot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Cache lru state; accesses `newest`, `previous`, `next` and `oldest`. May update `state.next[before]`, `state.oldest` and `state.previous[after]` in place. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L25)
