# `src/mq3/client/netchan.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.netchan`](Package-mq3-client-netchan-1788128040.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)

## Declarations

<a id="constant-constant-mq3-client-netchan-cl-decode-start-const-cl-decode-start-4-src-mq3-client-netchan-ml-1799516389"></a>
### CL_DECODE_START

```ml
const CL_DECODE_START = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L11)

<a id="constant-constant-mq3-client-netchan-cl-encode-start-const-cl-encode-start-12-src-mq3-client-netchan-ml-314709170"></a>
### CL_ENCODE_START

```ml
const CL_ENCODE_START = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L10)

<a id="constant-constant-mq3-client-netchan-clc-eof-const-clc-eof-5-src-mq3-client-netchan-ml-451588990"></a>
### CLC_EOF

```ml
const CLC_EOF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L12)

<a id="function-function-mq3-client-netchan-commandbyte-function-commandbyte-raw-index-src-mq3-client-netchan-ml-616275622"></a>
### commandByte

```ml
function commandByte(raw, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L26)

- [mq3.client.netchan.Connection](Type-mq3-client-netchan-connection-2082296022.md) — struct
<a id="function-function-mq3-client-netchan-create-function-create-transport-connection-src-mq3-client-netchan-ml-1834088693"></a>
### create

```ml
function create(transport, connection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `transport` | `dynamic` | — |  |
| `connection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L21)

<a id="function-function-mq3-client-netchan-createconnection-function-createconnection-src-mq3-client-netchan-ml-256599054"></a>
### createConnection

```ml
function createConnection()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L17)

<a id="function-function-mq3-client-netchan-decodemessage-function-decodemessage-connection-msg-src-mq3-client-netchan-ml-986081967"></a>
### decodeMessage

```ml
function decodeMessage(connection, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connection` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L56)

<a id="function-function-mq3-client-netchan-encode-function-encode-connection-msg-src-mq3-client-netchan-ml-121676017"></a>
### encode

```ml
function encode(connection, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connection` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L45)

<a id="constant-constant-mq3-client-netchan-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-netchan-ml-644304483"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L9)

<a id="function-function-mq3-client-netchan-mix-function-mix-msg-start-key-text-src-mq3-client-netchan-ml-1977471697"></a>
### mix

```ml
function mix(msg, start, key, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L31)

<a id="function-function-mq3-client-netchan-process-function-process-runtime-channel-msg-src-mq3-client-netchan-ml-1725972660"></a>
### process

```ml
function process(runtime, channel, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L76)

- [mq3.client.netchan.Runtime](Type-mq3-client-netchan-runtime-1419768234.md) — struct
<a id="function-function-mq3-client-netchan-transmit-function-transmit-runtime-channel-msg-src-mq3-client-netchan-ml-1093050390"></a>
### transmit

```ml
function transmit(runtime, channel, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L70)

<a id="function-function-mq3-client-netchan-transmitnextfragment-function-transmitnextfragment-runtime-channel-src-mq3-client-netchan-ml-930026895"></a>
### transmitNextFragment

```ml
function transmitNextFragment(runtime, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L66)
