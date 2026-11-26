# `src/mq3/renderer/md3_cache_index.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.md3_cache_index`](Package-mq3-renderer-md3-cache-index-672995767.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `md3IndexNumeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-md3-cache-index-create-function-create-capacity-src-mq3-renderer-md3-cache-index-ml-1336081818"></a>
### create

```ml
function create(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L7)

<a id="function-function-mq3-renderer-md3-cache-index-first-function-first-index-hash-src-mq3-renderer-md3-cache-index-ml-1415376684"></a>
### first

```ml
function first(index, hash)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `hash` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L27)

<a id="function-function-mq3-renderer-md3-cache-index-floatkey-function-floatkey-value-src-mq3-renderer-md3-cache-index-ml-2137583715"></a>
### floatKey

```ml
function floatKey(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L17)

<a id="function-function-mq3-renderer-md3-cache-index-framehash-function-framehash-model-surface-frame-oldframe-backlerp-src-mq3-renderer-md3-cache-index-ml-581448381"></a>
### frameHash

```ml
function frameHash(model, surface, frame, oldFrame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L18)

- [mq3.renderer.md3_cache_index.Index](Type-mq3-renderer-md3-cache-index-index-665026481.md) — struct
<a id="function-function-mq3-renderer-md3-cache-index-mix-function-mix-hash-value-src-mq3-renderer-md3-cache-index-ml-1512248527"></a>
### mix

```ml
function mix(hash, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hash` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L11)

<a id="function-function-mq3-renderer-md3-cache-index-next-function-next-index-slot-src-mq3-renderer-md3-cache-index-ml-2037345772"></a>
### next

```ml
function next(index, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L28)

<a id="function-function-mq3-renderer-md3-cache-index-store-function-store-index-slot-hash-src-mq3-renderer-md3-cache-index-ml-1876967006"></a>
### store

```ml
function store(index, slot, hash)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `hash` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L29)

<a id="function-function-mq3-renderer-md3-cache-index-transformhash-function-transformhash-model-surface-frame-oldframe-backlerp-origin-axis-src-mq3-renderer-md3-cache-index-ml-57862254"></a>
### transformHash

```ml
function transformHash(model, surface, frame, oldFrame, backlerp, origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L21)
