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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L11)

<a id="function-function-mq3-botlib-cache-lru-clear-function-clear-state-src-mq3-botlib-cache-lru-ml-1764260091"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L38)

<a id="function-function-mq3-botlib-cache-lru-create-function-create-capacity-src-mq3-botlib-cache-lru-ml-1126451574"></a>
### create

```ml
function create(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L7)

<a id="function-function-mq3-botlib-cache-lru-reserve-function-reserve-state-key-src-mq3-botlib-cache-lru-ml-1080681222"></a>
### reserve

```ml
function reserve(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L27)

- [mq3.botlib.cache_lru.State](Type-mq3-botlib-cache-lru-state-1176927479.md) — struct
<a id="function-function-mq3-botlib-cache-lru-touch-function-touch-state-key-src-mq3-botlib-cache-lru-ml-1748647972"></a>
### touch

```ml
function touch(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L23)

<a id="function-function-mq3-botlib-cache-lru-touchslot-function-touchslot-state-slot-src-mq3-botlib-cache-lru-ml-1591503319"></a>
### touchSlot

```ml
function touchSlot(state, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/cache_lru.ml#L16)
