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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crc` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L32)

<a id="function-function-mq3-botlib-crc16-init-function-init-src-mq3-botlib-crc16-ml-1568837142"></a>
### init

```ml
function init()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L16)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crc` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L17)

<a id="function-function-mq3-botlib-crc16-processspan-function-processspan-data-offset-count-src-mq3-botlib-crc16-ml-1478239284"></a>
### processSpan

```ml
function processSpan(data, offset, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L20)

<a id="function-function-mq3-botlib-crc16-processstring-function-processstring-text-src-mq3-botlib-crc16-ml-774249215"></a>
### processString

```ml
function processString(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L27)

<a id="function-function-mq3-botlib-crc16-tablevalue-function-tablevalue-index-src-mq3-botlib-crc16-ml-2106170528"></a>
### tableValue

```ml
function tableValue(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L8)

<a id="function-function-mq3-botlib-crc16-value-function-value-crc-src-mq3-botlib-crc16-ml-2027873332"></a>
### value

```ml
function value(crc)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crc` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L18)

<a id="constant-constant-mq3-botlib-crc16-xor-value-const-xor-value-0-src-mq3-botlib-crc16-ml-1631731747"></a>
### XOR_VALUE

```ml
const XOR_VALUE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/crc16.ml#L6)
