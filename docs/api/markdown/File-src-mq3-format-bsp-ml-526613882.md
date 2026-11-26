# `src/mq3/format/bsp.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.bsp`](Package-mq3-format-bsp-520548302.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/qfiles.ml` as `qfiles` → [src/mq3/format/qfiles.ml](File-src-mq3-format-qfiles-ml-1013095051.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)

## Declarations

- [mq3.format.bsp.BSP](Type-mq3-format-bsp-bsp-1073698573.md) — struct
<a id="function-function-mq3-format-bsp-entities-function-entities-map-src-mq3-format-bsp-ml-501409632"></a>
### entities

```ml
function entities(map)
```

Compute entities in format.bsp; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `data`, `offsets`, `lengths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/bsp.ml#L119)

<a id="function-function-mq3-format-bsp-fail-function-fail-message-src-mq3-format-bsp-ml-1497269251"></a>
### fail

```ml
function fail(message)
```

Create the format.bsp error for `fail` with 3502 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("BSP46: " + message)` and `error(3502, ("BSP46: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/bsp.ml#L19)

<a id="function-function-mq3-format-bsp-load-function-load-data-src-mq3-format-bsp-ml-956873278"></a>
### load

```ml
function load(data)
```

Load bsp in format.bsp; the normal completion returns `BSP(data, offsets, lengths, counts)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/bsp.ml#L34)

<a id="function-function-mq3-format-bsp-range-function-range-first-count-limit-src-mq3-format-bsp-ml-987993176"></a>
### range

```ml
function range(first, count, limit)
```

Test range in format.bsp; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First used in `(first < 0)` and `(first + count)`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(first + count)`. |
| `limit` | `dynamic` | — | Limit used in `((first + count) > limit)` and `(((first < 0) or (count < 0)) or ((first + count) > limit))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/bsp.ml#L27)
