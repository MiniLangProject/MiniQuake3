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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `challenge` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L23)

- [mq3.server.netchan.Client](Type-mq3-server-netchan-client-1487942333.md) — struct
<a id="function-function-mq3-server-netchan-clonemessage-function-clonemessage-source-src-mq3-server-netchan-ml-1814923741"></a>
### cloneMessage

```ml
function cloneMessage(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L33)

<a id="function-function-mq3-server-netchan-commandbyte-function-commandbyte-raw-index-src-mq3-server-netchan-ml-172155614"></a>
### commandByte

```ml
function commandByte(raw, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L41)

<a id="function-function-mq3-server-netchan-decode-function-decode-clientstate-msg-src-mq3-server-netchan-ml-932391113"></a>
### decode

```ml
function decode(clientState, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L91)

<a id="function-function-mq3-server-netchan-decodemessage-function-decodemessage-clientstate-msg-src-mq3-server-netchan-ml-845423083"></a>
### decodeMessage

```ml
function decodeMessage(clientState, msg)
```

The three compressed client header longs remain logically unread by the caller. Payload are restored exactly before the payload XOR begins.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L70)

<a id="function-function-mq3-server-netchan-encode-function-encode-clientstate-msg-src-mq3-server-netchan-ml-823417689"></a>
### encode

```ml
function encode(clientState, msg)
```

First four physical bytes remain clear. The initial compressed long is read only to reproduce the original msg_t cursor save/restore behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L51)

<a id="constant-constant-mq3-server-netchan-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-netchan-ml-524522555"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L9)

<a id="function-function-mq3-server-netchan-process-function-process-clientstate-data-maxsize-src-mq3-server-netchan-ml-1302344345"></a>
### process

```ml
function process(clientState, data, maxsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `maxsize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L135)

<a id="function-function-mq3-server-netchan-requireclient-function-requireclient-clientstate-src-mq3-server-netchan-ml-462414806"></a>
### requireClient

```ml
function requireClient(clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L27)

<a id="constant-constant-mq3-server-netchan-sv-decode-start-const-sv-decode-start-12-src-mq3-server-netchan-ml-108245914"></a>
### SV_DECODE_START

```ml
const SV_DECODE_START = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L11)

<a id="constant-constant-mq3-server-netchan-sv-encode-start-const-sv-encode-start-4-src-mq3-server-netchan-ml-729837553"></a>
### SV_ENCODE_START

```ml
const SV_ENCODE_START = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L10)

<a id="constant-constant-mq3-server-netchan-svc-eof-const-svc-eof-8-src-mq3-server-netchan-ml-880207625"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L12)

<a id="function-function-mq3-server-netchan-transmit-function-transmit-runtime-clientstate-msg-src-mq3-server-netchan-ml-935185241"></a>
### transmit

```ml
function transmit(runtime, clientState, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L93)

<a id="function-function-mq3-server-netchan-transmitnextfragment-function-transmitnextfragment-runtime-clientstate-src-mq3-server-netchan-ml-1992000058"></a>
### transmitNextFragment

```ml
function transmitNextFragment(runtime, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L121)

<a id="function-function-mq3-server-netchan-transmitpayload-function-transmitpayload-runtime-clientstate-payload-src-mq3-server-netchan-ml-1500947300"></a>
### transmitPayload

```ml
function transmitPayload(runtime, clientState, payload)
```

Snapshot construction already appends svc_EOF before reaching the netchan boundary. This entry point applies the server XOR and drains every fragment without adding a second terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L109)
