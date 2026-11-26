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

Builds `mq3.renderer.md3_cache_index.Index` for `mq3.renderer.md3_cache_index.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Argument 1 supplied to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L10)

<a id="function-function-mq3-renderer-md3-cache-index-first-function-first-index-hash-src-mq3-renderer-md3-cache-index-ml-1415376684"></a>
### first

```ml
function first(index, hash)
```

Computes `index.heads[hash&index.mask]` for `mq3.renderer.md3_cache_index.first`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Record providing `index.heads`, `index.mask`. |
| `hash` | `dynamic` | — | Input used in the result expression `index.heads[hash&index.mask]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L52)

<a id="function-function-mq3-renderer-md3-cache-index-floatkey-function-floatkey-value-src-mq3-renderer-md3-cache-index-ml-2137583715"></a>
### floatKey

```ml
function floatKey(value)
```

Returns `md3IndexNumeric.floatBits(value)` from `mq3.renderer.md3_cache_index.floatKey`; earlier branches return `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.floatBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L25)

<a id="function-function-mq3-renderer-md3-cache-index-framehash-function-framehash-model-surface-frame-oldframe-backlerp-src-mq3-renderer-md3-cache-index-ml-581448381"></a>
### frameHash

```ml
function frameHash(model, surface, frame, oldFrame, backlerp)
```

Returns `mix(hash,floatKey(backlerp))` from `mq3.renderer.md3_cache_index.frameHash`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`. |
| `surface` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`. |
| `frame` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_cache_index.mix`. |
| `backlerp` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_cache_index.floatKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L32)

- [mq3.renderer.md3_cache_index.Index](Type-mq3-renderer-md3-cache-index-index-665026481.md) — struct
<a id="function-function-mq3-renderer-md3-cache-index-mix-function-mix-hash-value-src-mq3-renderer-md3-cache-index-ml-1512248527"></a>
### mix

```ml
function mix(hash, value)
```

Computes `mix` from `mixed^(mixed>>16)` using `mq3.compat.numeric.i32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hash` | `dynamic` | — | Input used by `mixed=md3IndexNumeric.i32((hash^value)*16777619)`. |
| `value` | `dynamic` | — | Input used by `mixed=md3IndexNumeric.i32((hash^value)*16777619)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L17)

<a id="function-function-mq3-renderer-md3-cache-index-next-function-next-index-slot-src-mq3-renderer-md3-cache-index-ml-2037345772"></a>
### next

```ml
function next(index, slot)
```

Computes `index.links[slot]` for `mq3.renderer.md3_cache_index.next`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Record providing `index.links`. |
| `slot` | `dynamic` | — | Input used in the result expression `index.links[slot]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L56)

<a id="function-function-mq3-renderer-md3-cache-index-store-function-store-index-slot-hash-src-mq3-renderer-md3-cache-index-ml-1876967006"></a>
### store

```ml
function store(index, slot, hash)
```

Updates `index.heads[bucket]`, `index.links[previous]`, `index.links[slot]`, `index.hashes[slot]` in `mq3.renderer.md3_cache_index.store`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Mutable record or buffer; this call updates `index.heads[bucket]`, `index.links[previous]`, `index.links[slot]`, `index.hashes[slot]`. |
| `slot` | `dynamic` | — | Value assigned to `index.heads[bucket]`. |
| `hash` | `dynamic` | — | Input used by `bucket=hash&index.mask`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L61)

<a id="function-function-mq3-renderer-md3-cache-index-transformhash-function-transformhash-model-surface-frame-oldframe-backlerp-origin-axis-src-mq3-renderer-md3-cache-index-ml-57862254"></a>
### transformHash

```ml
function transformHash(model, surface, frame, oldFrame, backlerp, origin, axis)
```

Computes `transformHash` from `frameHash(model,surface,frame,oldFrame,backlerp)` using `mq3.renderer.md3_cache_index.frameHash`, `mq3.renderer.md3_cache_index.mix`, `mq3.renderer.md3_cache_index.floatKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Value forwarded as `model` to `mq3.renderer.md3_cache_index.frameHash`. |
| `surface` | `dynamic` | — | Value forwarded as `surface` to `mq3.renderer.md3_cache_index.frameHash`. |
| `frame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.md3_cache_index.frameHash`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `oldFrame` to `mq3.renderer.md3_cache_index.frameHash`. |
| `backlerp` | `dynamic` | — | Value forwarded as `backlerp` to `mq3.renderer.md3_cache_index.frameHash`. |
| `origin` | `dynamic` | — | Indexed input read at `component`. |
| `axis` | `dynamic` | — | Nested indexed data; outer entries read at `row`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L43)
