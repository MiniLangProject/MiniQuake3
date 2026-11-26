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

Creates a `mq3.client.demo.Record` record. Assigns `truncated` from `truncated`, `nextOffset` from `offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — | Value used to initialize `Record.nextOffset`. |
| `truncated` | `dynamic` | — | Value used to initialize `Record.truncated`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L68)

<a id="function-function-mq3-client-demo-decodemessage-function-decodemessage-data-offset-src-mq3-client-demo-ml-755324897"></a>
### decodeMessage

```ml
function decodeMessage(data, offset)
```

Calls `mq3.client.demo.completed`, `mq3.compat.numeric.readI32`, `mq3.client.demo.Record` from demo `decodeMessage`. The final path returns `Record(false,false,sequence,payload,offset+size)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[offset+index]`. |
| `offset` | `dynamic` | — | Value tested by `offset<0 or offset>len(data)`, `if len(data)-offset<4` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L75)

<a id="function-function-mq3-client-demo-demofilename-function-demofilename-number-src-mq3-client-demo-ml-913584517"></a>
### demoFilename

```ml
function demoFilename(number)
```

Calls `mq3.compat.numeric.trunc32` from demo `demoFilename`. The final path returns `"demo"+str(thousands)+str(hundreds)+str(tens)+str(ones)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value tested by `number<0 or number>9999` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L92)

<a id="function-function-mq3-client-demo-encodeend-function-encodeend-src-mq3-client-demo-ml-1806863166"></a>
### encodeEnd

```ml
function encodeEnd()
```

Evaluates demo `encodeEnd` and returns `result` according to its guard/selection conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L61)

<a id="function-function-mq3-client-demo-encodeinitialgamestate-function-encodeinitialgamestate-servermessagesequence-reliablesequence-servercommandsequence-gamestate-clientnum-checksumfeed-src-mq3-client-demo-ml-431698230"></a>
### encodeInitialGamestate

```ml
function encodeInitialGamestate(serverMessageSequence, reliableSequence, serverCommandSequence, gameState, clientNum, checksumFeed)
```

The synthetic first record written by CL_Record_f. It lets a demo start in the middle of a match with the current configstrings and entity baselines.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverMessageSequence` | `dynamic` | — | Sequence number of the received server message. |
| `reliableSequence` | `dynamic` | — | Value used by `message.writeLong(msg,reliableSequence)`. |
| `serverCommandSequence` | `dynamic` | — | Value used by `message.writeLong(msg,serverCommandSequence)`. |
| `gameState` | `dynamic` | — | Record read through `gameState.stringOffsets`, `gameState.baselines`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `checksumFeed` | `dynamic` | — | Value used by `message.writeLong(msg,checksumFeed)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L147)

<a id="function-function-mq3-client-demo-encodemessage-function-encodemessage-sequence-messagedata-headerbytes-src-mq3-client-demo-ml-2026373558"></a>
### encodeMessage

```ml
function encodeMessage(sequence, messageData, headerBytes)
```

Calls `mq3.client.demo.writeLong` from demo `encodeMessage`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sequence` | `dynamic` | — | Value used by `writeLong(result,0,sequence)`. |
| `messageData` | `dynamic` | — | Sequence read at `messageData[index+headerBytes]`. |
| `headerBytes` | `dynamic` | — | Number of transport/header bytes preceding the recorded message payload. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L51)

<a id="constant-constant-mq3-client-demo-max-msglen-const-max-msglen-16384-src-mq3-client-demo-ml-1535665913"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```

Maximum byte length accepted for a native network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L12)

<a id="function-function-mq3-client-demo-messagebytes-function-messagebytes-msg-src-mq3-client-demo-ml-1851547181"></a>
### messageBytes

```ml
function messageBytes(msg)
```

Evaluates demo `messageBytes` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record read through `msg.cursize`, `msg.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L133)

<a id="function-function-mq3-client-demo-playback-function-playback-src-mq3-client-demo-ml-780070496"></a>
### playback

```ml
function playback()
```

Creates a `mq3.client.demo.Playback` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L114)

- [mq3.client.demo.Playback](Type-mq3-client-demo-playback-688395329.md) — struct
<a id="function-function-mq3-client-demo-readdemomessage-function-readdemomessage-state-data-realtime-src-mq3-client-demo-ml-1775390344"></a>
### readDemoMessage

```ml
function readDemoMessage(state, data, realtime)
```

CL_ReadDemoMessage state around the filesystem/parser host boundaries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable demo record/storage; this routine assigns `state.serverMessageSequence`, `state.offset`, `state.completed`, `state.truncated` and additional values. |
| `data` | `dynamic` | — | Payload whose length/content is inspected by `readDemoMessage`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L120)

- [mq3.client.demo.Record](Type-mq3-client-demo-record-1152209509.md) — struct
<a id="constant-constant-mq3-client-demo-svc-baseline-const-svc-baseline-4-src-mq3-client-demo-ml-367925675"></a>
### SVC_BASELINE

```ml
const SVC_BASELINE = 4
```

Server-message command byte selecting the baseline protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L18)

<a id="constant-constant-mq3-client-demo-svc-configstring-const-svc-configstring-3-src-mq3-client-demo-ml-559941760"></a>
### SVC_CONFIGSTRING

```ml
const SVC_CONFIGSTRING = 3
```

Server-message command byte selecting the configstring protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L16)

<a id="constant-constant-mq3-client-demo-svc-eof-const-svc-eof-8-src-mq3-client-demo-ml-1151674205"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```

Server-message command byte selecting the eof protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L20)

<a id="constant-constant-mq3-client-demo-svc-gamestate-const-svc-gamestate-2-src-mq3-client-demo-ml-1968068331"></a>
### SVC_GAMESTATE

```ml
const SVC_GAMESTATE = 2
```

Server-message command byte selecting the gamestate protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L14)

<a id="function-function-mq3-client-demo-writelong-function-writelong-data-offset-value-src-mq3-client-demo-ml-364732422"></a>
### writeLong

```ml
function writeLong(data, offset, value)
```

Calls `mq3.compat.numeric.writeU32`, `mq3.compat.numeric.i32` from demo `writeLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `numeric.writeU32(data,offset,numeric.i32(value))`. |
| `offset` | `dynamic` | — | Value used by `numeric.writeU32(data,offset,numeric.i32(value))`. |
| `value` | `dynamic` | — | Value used by `numeric.writeU32(data,offset,numeric.i32(value))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L43)
