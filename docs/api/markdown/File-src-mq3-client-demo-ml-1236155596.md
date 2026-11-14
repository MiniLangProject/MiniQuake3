# `src/mq3/client/demo.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.demo`](Package-mq3-client-demo-1719929070.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_state_delta.ml` as `delta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)

## Declarations

<a id="function-function-mq3-client-demo-completed-function-completed-offset-truncated-src-mq3-client-demo-ml-62884005"></a>
### completed

```ml
function completed(offset, truncated)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — |  |
| `truncated` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L36)

<a id="function-function-mq3-client-demo-decodemessage-function-decodemessage-data-offset-src-mq3-client-demo-ml-755324897"></a>
### decodeMessage

```ml
function decodeMessage(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L40)

<a id="function-function-mq3-client-demo-demofilename-function-demofilename-number-src-mq3-client-demo-ml-913584517"></a>
### demoFilename

```ml
function demoFilename(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L55)

<a id="function-function-mq3-client-demo-encodeend-function-encodeend-src-mq3-client-demo-ml-1806863166"></a>
### encodeEnd

```ml
function encodeEnd()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L32)

<a id="function-function-mq3-client-demo-encodeinitialgamestate-function-encodeinitialgamestate-servermessagesequence-reliablesequence-servercommandsequence-gamestate-clientnum-checksumfeed-src-mq3-client-demo-ml-431698230"></a>
### encodeInitialGamestate

```ml
function encodeInitialGamestate(serverMessageSequence, reliableSequence, serverCommandSequence, gameState, clientNum, checksumFeed)
```

The synthetic first record written by CL_Record_f. It lets a demo start in the middle of a match with the current configstrings and entity baselines.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverMessageSequence` | `dynamic` | — |  |
| `reliableSequence` | `dynamic` | — |  |
| `serverCommandSequence` | `dynamic` | — |  |
| `gameState` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `checksumFeed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L86)

<a id="function-function-mq3-client-demo-encodemessage-function-encodemessage-sequence-messagedata-headerbytes-src-mq3-client-demo-ml-2026373558"></a>
### encodeMessage

```ml
function encodeMessage(sequence, messageData, headerBytes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sequence` | `dynamic` | — |  |
| `messageData` | `dynamic` | — |  |
| `headerBytes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L23)

<a id="constant-constant-mq3-client-demo-max-msglen-const-max-msglen-16384-src-mq3-client-demo-ml-1535665913"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L11)

<a id="function-function-mq3-client-demo-messagebytes-function-messagebytes-msg-src-mq3-client-demo-ml-1851547181"></a>
### messageBytes

```ml
function messageBytes(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L78)

<a id="function-function-mq3-client-demo-playback-function-playback-src-mq3-client-demo-ml-780070496"></a>
### playback

```ml
function playback()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L64)

- [mq3.client.demo.Playback](Type-mq3-client-demo-playback-688395329.md) — struct
<a id="function-function-mq3-client-demo-readdemomessage-function-readdemomessage-state-data-realtime-src-mq3-client-demo-ml-1775390344"></a>
### readDemoMessage

```ml
function readDemoMessage(state, data, realtime)
```

CL_ReadDemoMessage state around the filesystem/parser host boundaries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L67)

- [mq3.client.demo.Record](Type-mq3-client-demo-record-1152209509.md) — struct
<a id="constant-constant-mq3-client-demo-svc-baseline-const-svc-baseline-4-src-mq3-client-demo-ml-367925675"></a>
### SVC_BASELINE

```ml
const SVC_BASELINE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L14)

<a id="constant-constant-mq3-client-demo-svc-configstring-const-svc-configstring-3-src-mq3-client-demo-ml-559941760"></a>
### SVC_CONFIGSTRING

```ml
const SVC_CONFIGSTRING = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L13)

<a id="constant-constant-mq3-client-demo-svc-eof-const-svc-eof-8-src-mq3-client-demo-ml-1151674205"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L15)

<a id="constant-constant-mq3-client-demo-svc-gamestate-const-svc-gamestate-2-src-mq3-client-demo-ml-1968068331"></a>
### SVC_GAMESTATE

```ml
const SVC_GAMESTATE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L12)

<a id="function-function-mq3-client-demo-writelong-function-writelong-data-offset-value-src-mq3-client-demo-ml-364732422"></a>
### writeLong

```ml
function writeLong(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/demo.ml#L19)
