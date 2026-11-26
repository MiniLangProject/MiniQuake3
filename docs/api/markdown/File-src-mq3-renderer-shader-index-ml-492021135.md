# `src/mq3/renderer/shader_index.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.shader_index`](Package-mq3-renderer-shader-index-1267151043.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-shader-index-build-function-build-text-src-mq3-renderer-shader-index-ml-739913325"></a>
### build

```ml
function build(text)
```

Builds `mq3.renderer.shader_index.Index` after updating `buckets[hash]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Initial value for `mq3.renderer.shader_index.Index.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_index.ml#L69)

- [mq3.renderer.shader_index.Entry](Type-mq3-renderer-shader-index-entry-1144026993.md) — struct
<a id="function-function-mq3-renderer-shader-index-find-function-find-index-name-src-mq3-renderer-shader-index-ml-509731407"></a>
### find

```ml
function find(index, name)
```

Looks up a shader by case-insensitive name within its shader-text hash bucket.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Record providing `index.buckets`, `index.entries`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_index.hashValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_index.ml#L88)

<a id="function-function-mq3-renderer-shader-index-hashvalue-function-hashvalue-name-size-src-mq3-renderer-shader-index-ml-837057394"></a>
### hashValue

```ml
function hashValue(name, size)
```

Computes `hashValue` from `hash&(size-1)` using `or`, `mq3.compat.numeric.i32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `size` | `dynamic` | — | Input tested by `size<=0 or (size&(size-1))!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_index.ml#L37)

- [mq3.renderer.shader_index.Index](Type-mq3-renderer-shader-index-index-1539757693.md) — struct
<a id="constant-constant-mq3-renderer-shader-index-max-shadertext-hash-const-max-shadertext-hash-2048-src-mq3-renderer-shader-index-ml-429604045"></a>
### MAX_SHADERTEXT_HASH

```ml
const MAX_SHADERTEXT_HASH = 2048
```

Number of buckets used to index shader definitions by name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_index.ml#L11)

<a id="function-function-mq3-renderer-shader-index-skipbracedsection-function-skipbracedsection-state-src-mq3-renderer-shader-index-ml-434617231"></a>
### skipBracedSection

```ml
function skipBracedSection(state)
```

Computes `skipBracedSection` from `depth==0` using `mq3.shared.parser.parseExt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_index.ml#L53)
