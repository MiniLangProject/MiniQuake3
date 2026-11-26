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

Byte offset after the connection header at which client message decoding begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L14)

<a id="constant-constant-mq3-client-netchan-cl-encode-start-const-cl-encode-start-12-src-mq3-client-netchan-ml-314709170"></a>
### CL_ENCODE_START

```ml
const CL_ENCODE_START = 12
```

Byte offset after the connection header at which client message encoding begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L12)

<a id="constant-constant-mq3-client-netchan-clc-eof-const-clc-eof-5-src-mq3-client-netchan-ml-451588990"></a>
### CLC_EOF

```ml
const CLC_EOF = 5
```

Client-message command byte selecting the eof protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L16)

<a id="function-function-mq3-client-netchan-commandbyte-function-commandbyte-raw-index-src-mq3-client-netchan-ml-616275622"></a>
### commandByte

```ml
function commandByte(raw, index)
```

Returns a command-string byte, using zero for indices outside the string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — | Sequence read at `raw[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(raw)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L56)

- [mq3.client.netchan.Connection](Type-mq3-client-netchan-connection-2082296022.md) — struct
<a id="function-function-mq3-client-netchan-create-function-create-transport-connection-src-mq3-client-netchan-ml-1834088693"></a>
### create

```ml
function create(transport, connection)
```

Binds a transport to protocol-68 client channel state, creating the reliable-command rings when omitted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `transport` | `dynamic` | — | Value used by `return Runtime(transport,connection,0)`. |
| `connection` | `dynamic` | — | Value used by `if connection==void then connection=createConnection() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L48)

<a id="function-function-mq3-client-netchan-createconnection-function-createconnection-src-mq3-client-netchan-ml-256599054"></a>
### createConnection

```ml
function createConnection()
```

Creates the challenge state and separate 64-entry client/server reliable-command rings used by packet XOR encoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L41)

<a id="function-function-mq3-client-netchan-decodemessage-function-decodemessage-connection-msg-src-mq3-client-netchan-ml-986081967"></a>
### decodeMessage

```ml
function decodeMessage(connection, msg)
```

XOR-decodes an accepted server payload using its sequence and the acknowledged client command while preserving the message-reader cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connection` | `dynamic` | — | Record read through `connection.reliableCommands`, `connection.challenge`. |
| `msg` | `dynamic` | — | Mutable netchan record/storage; this routine assigns `msg.oob`, `msg.bit`, `msg.readcount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L97)

<a id="function-function-mq3-client-netchan-encode-function-encode-connection-msg-src-mq3-client-netchan-ml-121676017"></a>
### encode

```ml
function encode(connection, msg)
```

XOR-encodes the outgoing payload after its 12-byte header using challenge, server ID, acknowledgement and the referenced server command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connection` | `dynamic` | — | Record read through `connection.serverCommands`, `connection.challenge`. |
| `msg` | `dynamic` | — | Mutable netchan record/storage; this routine assigns `msg.bit`, `msg.readcount`, `msg.oob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L83)

<a id="constant-constant-mq3-client-netchan-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-netchan-ml-644304483"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity limit for the reliable commands collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L10)

<a id="function-function-mq3-client-netchan-mix-function-mix-msg-start-key-text-src-mq3-client-netchan-ml-1977471697"></a>
### mix

```ml
function mix(msg, start, key, text)
```

XORs packet bytes in place using a cycling command string and alternating key shifts, replacing high bytes and percent signs with periods.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Mutable netchan record/storage; this routine assigns `msg.data[offset]`. |
| `start` | `dynamic` | — | Value tested by `start<msg.cursize` before the calculation continues. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding netchan entry. |
| `text` | `dynamic` | — | Text consumed or emitted by `mix` in the netchan path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L66)

<a id="function-function-mq3-client-netchan-process-function-process-runtime-channel-msg-src-mq3-client-netchan-ml-1725972660"></a>
### process

```ml
function process(runtime, channel, msg)
```

Reassembles and validates a received channel packet, then installs and decodes accepted message bytes and updates received-size accounting.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable netchan record/storage; this routine assigns `runtime.newsize`. |
| `channel` | `dynamic` | — | Value used by `result=netchan.process(channel,slice(msg.data,0,msg.cursize),msg.maxsize)`. |
| `msg` | `dynamic` | — | Mutable netchan record/storage; this routine assigns `msg.data`, `msg.cursize`, `msg.readcount`, `msg.bit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L128)

- [mq3.client.netchan.Runtime](Type-mq3-client-netchan-runtime-1419768234.md) — struct
<a id="function-function-mq3-client-netchan-transmit-function-transmit-runtime-channel-msg-src-mq3-client-netchan-ml-1093050390"></a>
### transmit

```ml
function transmit(runtime, channel, msg)
```

Appends CLC_EOF, encodes the client message and passes its used bytes to the channel transport.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.connection`, `runtime.transport`. |
| `channel` | `dynamic` | — | Value used by `return netchan.transmit(runtime.transport,channel,slice(msg.data,0,msg.cursize))`. |
| `msg` | `dynamic` | — | Record read through `msg.data`, `msg.cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L118)

<a id="function-function-mq3-client-netchan-transmitnextfragment-function-transmitnextfragment-runtime-channel-src-mq3-client-netchan-ml-930026895"></a>
### transmitNextFragment

```ml
function transmitNextFragment(runtime, channel)
```

Sends the next queued channel fragment through the configured transport.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.transport`. |
| `channel` | `dynamic` | — | Argument 2 of `mq3.qcommon.netchan.transmitNextFragment`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L110)
