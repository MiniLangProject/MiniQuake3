# `src/mq3/server/netchan.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.netchan`](Package-mq3-server-netchan-717957636.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/netchan.ml` as `net` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `std/ds/queue.ml` as `queues` → `../MiniLangCompilerML/std/ds/queue.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-netchan-client-function-client-challenge-channel-src-mq3-server-netchan-ml-1661064526"></a>
### client

```ml
function client(challenge, channel)
```

Create `mq3.server.netchan.Client` with challenge=challenge; lastClientCommandString=""; reliableCommands=array(MAX_RELIABLE_COMMANDS, ""); channel=channel; queue=queues.Queue.withCapacity(8); queueInitialized=true.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `challenge` | `dynamic` | — | Initial `challenge` field stored in the returned or constructed `mq3.server.netchan.Client` record. |
| `channel` | `dynamic` | — | Initial `channel` field stored in the returned or constructed `mq3.server.netchan.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L37)

- [mq3.server.netchan.Client](Type-mq3-server-netchan-client-1487942333.md) — struct
<a id="function-function-mq3-server-netchan-clonemessage-function-clonemessage-source-src-mq3-server-netchan-ml-1814923741"></a>
### cloneMessage

```ml
function cloneMessage(source)
```

Compute clone message in server.netchan; the normal completion returns `target`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `maxsize`, `allowoverflow`, `overflowed`, `oob`, `cursize`, `readcount`, `bit` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L53)

<a id="function-function-mq3-server-netchan-commandbyte-function-commandbyte-raw-index-src-mq3-server-netchan-ml-172155614"></a>
### commandByte

```ml
function commandByte(raw, index)
```

Compute command byte in server.netchan; the normal completion returns `[value, (index + 1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — | Raw used in `len(raw)` and `raw[index]`. |
| `index` | `dynamic` | — | Zero-based index into `raw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L64)

<a id="function-function-mq3-server-netchan-decode-function-decode-clientstate-msg-src-mq3-server-netchan-ml-932391113"></a>
### decode

```ml
function decode(clientState, msg)
```

Return `mq3.server.netchan.decodeMessage(clientState, msg)` from `server.netchan.decode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Client state passed as `clientState` to `mq3.server.netchan.decodeMessage`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.netchan.decodeMessage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L121)

<a id="function-function-mq3-server-netchan-decodemessage-function-decodemessage-clientstate-msg-src-mq3-server-netchan-ml-845423083"></a>
### decodeMessage

```ml
function decodeMessage(clientState, msg)
```

The three compressed client header longs remain logically unread by the caller. Payload are restored exactly before the payload XOR begins.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `reliableCommands`, `challenge`. |
| `msg` | `dynamic` | — | Record exposing `readcount`, `bit`, `oob`, `cursize`, `data`. Updated in place: `oob`, `bit`, `readcount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L97)

<a id="function-function-mq3-server-netchan-encode-function-encode-clientstate-msg-src-mq3-server-netchan-ml-823417689"></a>
### encode

```ml
function encode(clientState, msg)
```

First four physical bytes remain clear. The initial compressed long is read only to reproduce the original msg_t cursor save/restore behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `lastClientCommandString`, `challenge`, `channel`. |
| `msg` | `dynamic` | — | Record exposing `cursize`, `readcount`, `bit`, `oob`, `data`. Updated in place: `bit`, `readcount`, `oob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L76)

<a id="constant-constant-mq3-server-netchan-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-netchan-ml-524522555"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity of the reliable-command ring retained until acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L10)

<a id="function-function-mq3-server-netchan-process-function-process-clientstate-data-maxsize-src-mq3-server-netchan-ml-1302344345"></a>
### process

```ml
function process(clientState, data, maxsize)
```

Process netchan in server.netchan; the normal completion returns `net.ProcessResult(true, decodedData, result.cursize, result.readcount, result.bit)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `channel`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.netchan.process`. |
| `maxsize` | `dynamic` | — | Maxsize passed as `maxsize` to `mq3.qcommon.netchan.process`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L183)

<a id="function-function-mq3-server-netchan-requireclient-function-requireclient-clientstate-src-mq3-server-netchan-ml-462414806"></a>
### requireClient

```ml
function requireClient(clientState)
```

Compute require client in server.netchan.

Validation failures include `server netchan: invalid client`; `server netchan: invalid reliable ring`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `channel`, `reliableCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L45)

<a id="constant-constant-mq3-server-netchan-sv-decode-start-const-sv-decode-start-12-src-mq3-server-netchan-ml-108245914"></a>
### SV_DECODE_START

```ml
const SV_DECODE_START = 12
```

Byte offset at which client-to-server payload decoding begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L14)

<a id="constant-constant-mq3-server-netchan-sv-encode-start-const-sv-encode-start-4-src-mq3-server-netchan-ml-729837553"></a>
### SV_ENCODE_START

```ml
const SV_ENCODE_START = 4
```

Byte offset at which server-to-client payload obfuscation begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L12)

<a id="constant-constant-mq3-server-netchan-svc-eof-const-svc-eof-8-src-mq3-server-netchan-ml-880207625"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```

Server-to-client opcode marking the end of a message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L16)

<a id="function-function-mq3-server-netchan-transmit-function-transmit-runtime-clientstate-msg-src-mq3-server-netchan-ml-935185241"></a>
### transmit

```ml
function transmit(runtime, clientState, msg)
```

Compute transmit in server.netchan; the normal completion returns `net.transmit(runtime, clientState.channel, data)`.

Validation failures include `server netchan: queue is not initialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.qcommon.netchan.transmitNextFragment`. |
| `clientState` | `dynamic` | — | Record exposing `channel`, `queueInitialized`, `queue`. |
| `msg` | `dynamic` | — | Record exposing `cursize`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L129)

<a id="function-function-mq3-server-netchan-transmitnextfragment-function-transmitnextfragment-runtime-clientstate-src-mq3-server-netchan-ml-1992000058"></a>
### transmitNextFragment

```ml
function transmitNextFragment(runtime, clientState)
```

Compute transmit next fragment in server.netchan; the normal completion returns `packets`.

Validation failures include `server netchan: queue is not initialized after fragment drain`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.qcommon.netchan.transmitNextFragment`. |
| `clientState` | `dynamic` | — | Record exposing `channel`, `queueInitialized`, `queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L165)

<a id="function-function-mq3-server-netchan-transmitpayload-function-transmitpayload-runtime-clientstate-payload-src-mq3-server-netchan-ml-1500947300"></a>
### transmitPayload

```ml
function transmitPayload(runtime, clientState, payload)
```

Snapshot construction already appends svc_EOF before reaching the netchan boundary. This entry point applies the server XOR and drains every fragment without adding a second terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.qcommon.netchan.transmit`. |
| `clientState` | `dynamic` | — | Record exposing `channel`. |
| `payload` | `dynamic` | — | Payload used in `len(payload)` and `(payload == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L148)
