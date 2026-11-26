# `src/mq3/server/snapshot_send.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_send`](Package-mq3-server-snapshot-send-1940074088.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/server/reliable_commands.ml` as `reliable` → [src/mq3/server/reliable_commands.ml](File-src-mq3-server-reliable-commands-ml-1690433750.md)
- `mq3/server/snapshot_delta.ml` as `sendSnapshotDelta` → [src/mq3/server/snapshot_delta.ml](File-src-mq3-server-snapshot-delta-ml-942379398.md)

## Declarations

<a id="function-function-mq3-server-snapshot-send-client-function-client-src-mq3-server-snapshot-send-ml-1960619786"></a>
### client

```ml
function client()
```

Create `mq3.server.snapshot_send.Client` with state=CS_ACTIVE; reliableCommands=array(64, ""); reliableSequence=0; reliableAcknowledge=0; 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L91)

- [mq3.server.snapshot_send.Client](Type-mq3-server-snapshot-send-client-1694397985.md) — struct
<a id="constant-constant-mq3-server-snapshot-send-cs-active-const-cs-active-4-src-mq3-server-snapshot-send-ml-1969973901"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a client eligible to receive a normal world snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L17)

<a id="function-function-mq3-server-snapshot-send-currentframe-function-currentframe-clientstate-src-mq3-server-snapshot-send-ml-768425822"></a>
### currentFrame

```ml
function currentFrame(clientState)
```

Compute current frame in server.snapshot_send; the normal completion returns `result`.

Validation failures include `snapshot send: invalid client frame ring`; `snapshot send: current frame missing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `frames`, `outgoingSequence`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L161)

<a id="function-function-mq3-server-snapshot-send-deltabase-function-deltabase-clientstate-serverstate-src-mq3-server-snapshot-send-ml-1018972932"></a>
### deltaBase

```ml
function deltaBase(clientState, serverState)
```

Compute delta base in server.snapshot_send; the normal completion returns `[oldFrame, (clientState.outgoingSequence - clientState.deltaMessage)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `deltaMessage`, `state`, `outgoingSequence`, `frames`. |
| `serverState` | `dynamic` | — | Record exposing `nextSnapshotEntities`, `snapshotCapacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L171)

<a id="function-function-mq3-server-snapshot-send-frame-function-frame-firstentity-numentities-areabits-playerstate-src-mq3-server-snapshot-send-ml-1906574303"></a>
### frame

```ml
function frame(firstEntity, numEntities, areaBits, playerState)
```

Create `mq3.server.snapshot_send.SendFrame` with firstEntity=firstEntity; numEntities=numEntities; areaBits=areaBits; playerState=playerState; messageSent=0; messageAcked=0; messageSize=0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstEntity` | `dynamic` | — | Initial `firstEntity` field stored in the returned or constructed `mq3.server.snapshot_send.SendFrame` record. |
| `numEntities` | `dynamic` | — | Initial `numEntities` field stored in the returned or constructed `mq3.server.snapshot_send.SendFrame` record. |
| `areaBits` | `dynamic` | — | Initial `areaBits` field stored in the returned or constructed `mq3.server.snapshot_send.SendFrame` record. |
| `playerState` | `dynamic` | — | Initial `playerState` field stored in the returned or constructed `mq3.server.snapshot_send.SendFrame` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L52)

<a id="constant-constant-mq3-server-snapshot-send-header-rate-bytes-const-header-rate-bytes-48-src-mq3-server-snapshot-send-ml-1049322973"></a>
### HEADER_RATE_BYTES

```ml
const HEADER_RATE_BYTES = 48
```

Estimated IP and transport header overhead charged when enforcing the send rate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L27)

<a id="constant-constant-mq3-server-snapshot-send-max-msglen-const-max-msglen-16384-src-mq3-server-snapshot-send-ml-870632349"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```

Maximum byte length of a complete sequenced network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L11)

<a id="constant-constant-mq3-server-snapshot-send-packet-backup-const-packet-backup-32-src-mq3-server-snapshot-send-ml-85810832"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```

Number of old messages that must be kept on client and.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L13)

<a id="constant-constant-mq3-server-snapshot-send-packet-mask-const-packet-mask-31-src-mq3-server-snapshot-send-ml-564952257"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```

Mask converting a network sequence number into a circular packet-history slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L15)

<a id="function-function-mq3-server-snapshot-send-packetbytes-function-packetbytes-msg-src-mq3-server-snapshot-send-ml-1140571955"></a>
### packetBytes

```ml
function packetBytes(msg)
```

Compute packet bytes in server.snapshot_send; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `cursize`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L220)

<a id="function-function-mq3-server-snapshot-send-ratemsec-function-ratemsec-clientstate-messagesize-maxrate-src-mq3-server-snapshot-send-ml-13010948"></a>
### rateMsec

```ml
function rateMsec(clientState, messageSize, maxRate)
```

Compute rate msec in server.snapshot_send; the normal completion returns `numeric.trunc32((((messageSize + HEADER_RATE_BYTES) * 1000) / rate))`.

Validation failures include `snapshot send: invalid client rate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `rate`. |
| `messageSize` | `dynamic` | — | Message size used in `(messageSize > 1500)` and `(messageSize + HEADER_RATE_BYTES)`. |
| `maxRate` | `dynamic` | — | Max rate used in `(maxRate != 0)` and `(maxRate < 1000)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L207)

<a id="function-function-mq3-server-snapshot-send-sendclientsnapshot-function-sendclientsnapshot-clientstate-serverstate-host-src-mq3-server-snapshot-send-ml-579026312"></a>
### sendClientSnapshot

```ml
function sendClientSnapshot(clientState, serverState, host)
```

Send client snapshot in server.snapshot_send; the normal completion returns `sendMessageToClient(clientState, serverState, host, msg)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `bot`, `lastClientCommand`. |
| `serverState` | `dynamic` | — | Server state passed as `serverState` to `mq3.server.snapshot_send.writeSnapshotToClient`. |
| `host` | `dynamic` | — | Record exposing `buildSnapshotFn`, `writeDownloadFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L253)

- [mq3.server.snapshot_send.SendFrame](Type-mq3-server-snapshot-send-sendframe-1281752461.md) — struct
<a id="function-function-mq3-server-snapshot-send-sendmessagetoclient-function-sendmessagetoclient-clientstate-serverstate-host-msg-src-mq3-server-snapshot-send-ml-1542293521"></a>
### sendMessageToClient

```ml
function sendMessageToClient(clientState, serverState, host, msg)
```

SV_SendMessageToClient plus the svc_EOF written by SV_Netchan_Transmit. `transmitFn` is the explicit server-netchan boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `snapshotMsec`, `state`, `downloadName`, `nextSnapshotTime`. Updated in place: `nextSnapshotTime`, `rateDelayed`. |
| `serverState` | `dynamic` | — | Record exposing `time`, `lanForceRate`, `maxRate`. |
| `host` | `dynamic` | — | Record exposing `transmitFn`, `localAddressFn`, `lanAddressFn`. |
| `msg` | `dynamic` | — | Record exposing `cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L232)

<a id="function-function-mq3-server-snapshot-send-server-function-server-time-snapshotentities-snapshotcapacity-baselines-src-mq3-server-snapshot-send-ml-139928184"></a>
### server

```ml
function server(time, snapshotEntities, snapshotCapacity, baselines)
```

Compute server in server.snapshot_send; the normal completion returns `Server(time, 0, snapshotEntities, snapshotCapacity, 0, baselines, 0, 0, false)`.

Validation failures include `snapshot send: invalid entity ring`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — | Initial `time` field stored in the returned or constructed `mq3.server.snapshot_send.Server` record. |
| `snapshotEntities` | `dynamic` | — | Initial `snapshotEntities` field stored in the returned or constructed `mq3.server.snapshot_send.Server` record. |
| `snapshotCapacity` | `dynamic` | — | Initial `snapshotCapacity` field stored in the returned or constructed `mq3.server.snapshot_send.Server` record. |
| `baselines` | `dynamic` | — | Initial `baselines` field stored in the returned or constructed `mq3.server.snapshot_send.Server` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L125)

- [mq3.server.snapshot_send.Server](Type-mq3-server-snapshot-send-server-1636242949.md) — struct
<a id="function-function-mq3-server-snapshot-send-services-function-services-buildsnapshotfn-writedownloadfn-transmitfn-localaddressfn-lanaddressfn-context-src-mq3-server-snapshot-send-ml-1513017604"></a>
### services

```ml
function services(buildSnapshotFn, writeDownloadFn, transmitFn, localAddressFn, lanAddressFn, context)
```

Create `mq3.server.snapshot_send.Services` with buildSnapshotFn=buildSnapshotFn; writeDownloadFn=writeDownloadFn; transmitFn=transmitFn; localAddressFn=localAddressFn; lanAddressFn=lanAddressFn; context=context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buildSnapshotFn` | `dynamic` | — | Initial `buildSnapshotFn` field stored in the returned or constructed `mq3.server.snapshot_send.Services` record. |
| `writeDownloadFn` | `dynamic` | — | Initial `writeDownloadFn` field stored in the returned or constructed `mq3.server.snapshot_send.Services` record. |
| `transmitFn` | `dynamic` | — | Initial `transmitFn` field stored in the returned or constructed `mq3.server.snapshot_send.Services` record. |
| `localAddressFn` | `dynamic` | — | Initial `localAddressFn` field stored in the returned or constructed `mq3.server.snapshot_send.Services` record. |
| `lanAddressFn` | `dynamic` | — | Initial `lanAddressFn` field stored in the returned or constructed `mq3.server.snapshot_send.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.snapshot_send.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L153)

- [mq3.server.snapshot_send.Services](Type-mq3-server-snapshot-send-services-347662494.md) — struct
<a id="constant-constant-mq3-server-snapshot-send-snapflag-not-active-const-snapflag-not-active-2-src-mq3-server-snapshot-send-ml-1556559247"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```

Snapshot used during connection and for zombies.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L21)

<a id="constant-constant-mq3-server-snapshot-send-snapflag-rate-delayed-const-snapflag-rate-delayed-1-src-mq3-server-snapshot-send-ml-1939360838"></a>
### SNAPFLAG_RATE_DELAYED

```ml
const SNAPFLAG_RATE_DELAYED = 1
```

Snapshot flag indicating that transmission was delayed by rate limiting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L19)

<a id="function-function-mq3-server-snapshot-send-snapshotflags-function-snapshotflags-clientstate-serverstate-src-mq3-server-snapshot-send-ml-1143984664"></a>
### snapshotFlags

```ml
function snapshotFlags(clientState, serverState)
```

Compute snapshot flags in server.snapshot_send; the normal completion returns `flags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `rateDelayed`, `state`. |
| `serverState` | `dynamic` | — | Record exposing `snapFlagServerBit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L183)

<a id="constant-constant-mq3-server-snapshot-send-svc-eof-const-svc-eof-8-src-mq3-server-snapshot-send-ml-444305329"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```

Server-to-client opcode marking the end of a message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L25)

<a id="constant-constant-mq3-server-snapshot-send-svc-nop-const-svc-nop-1-src-mq3-server-snapshot-send-ml-1496603170"></a>
### SVC_NOP

```ml
const SVC_NOP = 1
```

Server-to-client no-operation opcode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L23)

<a id="function-function-mq3-server-snapshot-send-writesnapshottoclient-function-writesnapshottoclient-clientstate-serverstate-msg-src-mq3-server-snapshot-send-ml-2065672671"></a>
### writeSnapshotToClient

```ml
function writeSnapshotToClient(clientState, serverState, msg)
```

Write snapshot to client in server.snapshot_send; the normal completion returns `emitted`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Client state passed as `clientState` to `mq3.server.snapshot_send.deltaBase`. |
| `serverState` | `dynamic` | — | Record exposing `snapshotEntities`, `snapshotCapacity`, `baselines`, `time`, `padPackets`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.snapshot_delta.writeSnapshotPayload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L194)
