# `src/mq3/qcommon/md4.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.md4`](Package-mq3-qcommon-md4-1790413445.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-qcommon-md4-add3-function-add3-a-b-c-src-mq3-qcommon-md4-ml-1803770878"></a>
### add3

```ml
function add3(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L28)

<a id="function-function-mq3-qcommon-md4-blockchecksum-function-blockchecksum-data-src-mq3-qcommon-md4-ml-213875124"></a>
### blockChecksum

```ml
function blockChecksum(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L88)

<a id="function-function-mq3-qcommon-md4-blockchecksumkey-function-blockchecksumkey-data-key-src-mq3-qcommon-md4-ml-295073233"></a>
### blockChecksumKey

```ml
function blockChecksumKey(data, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L93)

<a id="function-function-mq3-qcommon-md4-decode-function-decode-input-length-src-mq3-qcommon-md4-ml-1707366610"></a>
### Decode

```ml
function Decode(input, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L16)

<a id="function-function-mq3-qcommon-md4-digest-function-digest-data-src-mq3-qcommon-md4-ml-10795856"></a>
### digest

```ml
function digest(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L64)

<a id="function-function-mq3-qcommon-md4-encode-function-encode-input-length-src-mq3-qcommon-md4-ml-1899699970"></a>
### Encode

```ml
function Encode(input, length)
```

C-named little-endian conversion helpers.  The original functions accept output pointers; the native facade returns the produced buffer/word array so callers cannot observe partially initialized storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L9)

<a id="function-function-mq3-qcommon-md4-rol-function-rol-value-amount-src-mq3-qcommon-md4-ml-833271453"></a>
### rol

```ml
function rol(value, amount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L23)

<a id="function-function-mq3-qcommon-md4-step-function-step-work-target-word-rotation-round-src-mq3-qcommon-md4-ml-1401285280"></a>
### step

```ml
function step(work, target, word, rotation, round)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `word` | `dynamic` | — |  |
| `rotation` | `dynamic` | — |  |
| `round` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L32)

<a id="function-function-mq3-qcommon-md4-transform-function-transform-state-block-offset-src-mq3-qcommon-md4-ml-1595729661"></a>
### transform

```ml
function transform(state, block, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `block` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L43)
