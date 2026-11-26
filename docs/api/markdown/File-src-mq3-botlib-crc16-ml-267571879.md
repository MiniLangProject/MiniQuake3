# `src/mq3/botlib/crc16.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.crc16`](Package-mq3-botlib-crc16-1011539693.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-botlib-crc16-continuespan-function-continuespan-crc-data-offset-count-src-mq3-botlib-crc16-ml-2075578786"></a>
### continueSpan

```ml
function continueSpan(crc, data, offset, count)
```

Apply `mq3.botlib.crc16.processByte` while evaluating `continueSpan`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crc` | `dynamic` | — | Value used by `continueSpan` in `result=crc&0xffff`. |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset+index`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L51)

<a id="function-function-mq3-botlib-crc16-init-function-init-src-mq3-botlib-crc16-ml-1568837142"></a>
### init

```ml
function init()
```

Return `INIT_VALUE` for `init`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L19)

<a id="constant-constant-mq3-botlib-crc16-init-value-const-init-value-65535-src-mq3-botlib-crc16-ml-1761703869"></a>
### INIT_VALUE

```ml
const INIT_VALUE = 65535
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L5)

<a id="function-function-mq3-botlib-crc16-processbyte-function-processbyte-crc-value-src-mq3-botlib-crc16-ml-846748941"></a>
### processByte

```ml
function processByte(crc, value)
```

Fold one byte into the running 16-bit cyclic redundancy check.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crc` | `dynamic` | — | Operand used to evaluate the returned expression `(((crc&0xffff)<<8)^tableValue(((crc>>8)^(value&255))&255))&0xffff`. |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `(((crc&0xffff)<<8)^tableValue(((crc>>8)^(value&255))&255))&0xffff`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L23)

<a id="function-function-mq3-botlib-crc16-processspan-function-processspan-data-offset-count-src-mq3-botlib-crc16-ml-1478239284"></a>
### processSpan

```ml
function processSpan(data, offset, count)
```

Update the 16-bit cyclic redundancy check over the selected byte span.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset+index`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L32)

<a id="function-function-mq3-botlib-crc16-processstring-function-processstring-text-src-mq3-botlib-crc16-ml-774249215"></a>
### processString

```ml
function processString(text)
```

Apply `mq3.botlib.crc16.value`, `mq3.botlib.crc16.init` and `mq3.botlib.crc16.processSpan` while evaluating `processString`. Return paths include `processSpan(data,0,len(data))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L41)

<a id="function-function-mq3-botlib-crc16-tablevalue-function-tablevalue-index-src-mq3-botlib-crc16-ml-2106170528"></a>
### tableValue

```ml
function tableValue(index)
```

Compute one CRC-16 lookup-table entry using polynomial 0x1021 and eight shift steps.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L10)

<a id="function-function-mq3-botlib-crc16-value-function-value-crc-src-mq3-botlib-crc16-ml-2027873332"></a>
### value

```ml
function value(crc)
```

Return `(crc^XOR_VALUE)&0xffff` for `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crc` | `dynamic` | — | Operand used to evaluate the returned expression `(crc^XOR_VALUE)&0xffff`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L26)

<a id="constant-constant-mq3-botlib-crc16-xor-value-const-xor-value-0-src-mq3-botlib-crc16-ml-1631731747"></a>
### XOR_VALUE

```ml
const XOR_VALUE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L6)
