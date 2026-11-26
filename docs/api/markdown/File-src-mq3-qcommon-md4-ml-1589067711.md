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

Return `mq3.compat.numeric.add32(n.add32(a, b), c)` from `qcommon.md4.add3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left integer operand; only its low 32 bits participate. |
| `b` | `dynamic` | — | Right integer operand; only its low 32 bits participate. |
| `c` | `dynamic` | — | Right integer operand; only its low 32 bits participate. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L42)

<a id="function-function-mq3-qcommon-md4-blockchecksum-function-blockchecksum-data-src-mq3-qcommon-md4-ml-213875124"></a>
### blockChecksum

```ml
function blockChecksum(data)
```

Compute block checksum in qcommon.md4; the normal completion returns `n.i32((((n.readI32(hash, 0) ^ n.readI32(hash, 4)) ^ n.readI32(hash, 8)) ^ n.readI32(hash, 12)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.md4.digest`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L120)

<a id="function-function-mq3-qcommon-md4-blockchecksumkey-function-blockchecksumkey-data-key-src-mq3-qcommon-md4-ml-295073233"></a>
### blockChecksumKey

```ml
function blockChecksumKey(data, key)
```

Compute block checksum key in qcommon.md4; the normal completion returns `blockChecksum(keyed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |
| `key` | `dynamic` | — | Value passed as `value` to `mq3.compat.numeric.writeU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L128)

<a id="function-function-mq3-qcommon-md4-decode-function-decode-input-length-src-mq3-qcommon-md4-ml-1707366610"></a>
### Decode

```ml
function Decode(input, length)
```

Decode md 4 in qcommon.md4; the normal completion returns `output`.

Validation failures include `MD4 Decode: invalid length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readI32`. |
| `length` | `dynamic` | — | Length used in `(length < 0)` and `(length & 3)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L23)

<a id="function-function-mq3-qcommon-md4-digest-function-digest-data-src-mq3-qcommon-md4-ml-10795856"></a>
### digest

```ml
function digest(data)
```

Compute digest in qcommon.md4; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L94)

<a id="function-function-mq3-qcommon-md4-encode-function-encode-input-length-src-mq3-qcommon-md4-ml-1899699970"></a>
### Encode

```ml
function Encode(input, length)
```

C-named little-endian conversion helpers.  The original functions accept output pointers; the native facade returns the produced buffer/word array so callers cannot observe partially initialized storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Input used in `len(input)` and `input[index]`. |
| `length` | `dynamic` | — | Length used in `(length < 0)` and `(length & 3)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L11)

<a id="function-function-mq3-qcommon-md4-rol-function-rol-value-amount-src-mq3-qcommon-md4-ml-833271453"></a>
### rol

```ml
function rol(value, amount)
```

Compute rol in qcommon.md4; the normal completion returns `n.i32(((value << amount) | (value >> (32 - amount))))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |
| `amount` | `dynamic` | — | Amount used in `(32 - amount)` and `(value << amount)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L33)

<a id="function-function-mq3-qcommon-md4-step-function-step-work-target-word-rotation-round-src-mq3-qcommon-md4-ml-1401285280"></a>
### step

```ml
function step(work, target, word, rotation, round)
```

Update `work entries` in qcommon.md4.

Direct state writes: `work elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Mutable sequence written at `target`. |
| `target` | `dynamic` | — | Zero-based index into `work`. |
| `word` | `dynamic` | — | C passed as `c` to `mq3.qcommon.md4.add3`. |
| `rotation` | `dynamic` | — | Amount passed as `amount` to `mq3.qcommon.md4.rol`. |
| `round` | `dynamic` | — | Round used in `(round == 1)` and `(round == 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L54)

<a id="function-function-mq3-qcommon-md4-transform-function-transform-state-block-offset-src-mq3-qcommon-md4-ml-1595729661"></a>
### transform

```ml
function transform(state, block, offset)
```

Update `state entries` in qcommon.md4.

Direct state writes: `state elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable sequence written at `index`. |
| `block` | `dynamic` | — | Block used in `slice(block, offset, 64)` and `Decode(slice(block, offset, 64), 64)`. |
| `offset` | `dynamic` | — | Offset used in `slice(block, offset, 64)` and `Decode(slice(block, offset, 64), 64)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/md4.ml#L71)
