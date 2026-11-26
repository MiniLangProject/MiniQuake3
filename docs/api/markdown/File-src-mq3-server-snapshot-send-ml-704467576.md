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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L52)

- [mq3.server.snapshot_send.Client](Type-mq3-server-snapshot-send-client-1694397985.md) — struct
<a id="constant-constant-mq3-server-snapshot-send-cs-active-const-cs-active-4-src-mq3-server-snapshot-send-ml-1969973901"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L13)

<a id="function-function-mq3-server-snapshot-send-currentframe-function-currentframe-clientstate-src-mq3-server-snapshot-send-ml-768425822"></a>
### currentFrame

```ml
function currentFrame(clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L78)

<a id="function-function-mq3-server-snapshot-send-deltabase-function-deltabase-clientstate-serverstate-src-mq3-server-snapshot-send-ml-1018972932"></a>
### deltaBase

```ml
function deltaBase(clientState, serverState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L85)

<a id="function-function-mq3-server-snapshot-send-frame-function-frame-firstentity-numentities-areabits-playerstate-src-mq3-server-snapshot-send-ml-1906574303"></a>
### frame

```ml
function frame(firstEntity, numEntities, areaBits, playerState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstEntity` | `dynamic` | — |  |
| `numEntities` | `dynamic` | — |  |
| `areaBits` | `dynamic` | — |  |
| `playerState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L30)

<a id="constant-constant-mq3-server-snapshot-send-header-rate-bytes-const-header-rate-bytes-48-src-mq3-server-snapshot-send-ml-1049322973"></a>
### HEADER_RATE_BYTES

```ml
const HEADER_RATE_BYTES = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L18)

<a id="constant-constant-mq3-server-snapshot-send-max-msglen-const-max-msglen-16384-src-mq3-server-snapshot-send-ml-870632349"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L10)

<a id="constant-constant-mq3-server-snapshot-send-packet-backup-const-packet-backup-32-src-mq3-server-snapshot-send-ml-85810832"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L11)

<a id="constant-constant-mq3-server-snapshot-send-packet-mask-const-packet-mask-31-src-mq3-server-snapshot-send-ml-564952257"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L12)

<a id="function-function-mq3-server-snapshot-send-packetbytes-function-packetbytes-msg-src-mq3-server-snapshot-send-ml-1140571955"></a>
### packetBytes

```ml
function packetBytes(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L119)

<a id="function-function-mq3-server-snapshot-send-ratemsec-function-ratemsec-clientstate-messagesize-maxrate-src-mq3-server-snapshot-send-ml-13010948"></a>
### rateMsec

```ml
function rateMsec(clientState, messageSize, maxRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `messageSize` | `dynamic` | — |  |
| `maxRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L108)

<a id="function-function-mq3-server-snapshot-send-sendclientsnapshot-function-sendclientsnapshot-clientstate-serverstate-host-src-mq3-server-snapshot-send-ml-579026312"></a>
### sendClientSnapshot

```ml
function sendClientSnapshot(clientState, serverState, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L144)

- [mq3.server.snapshot_send.SendFrame](Type-mq3-server-snapshot-send-sendframe-1281752461.md) — struct
<a id="function-function-mq3-server-snapshot-send-sendmessagetoclient-function-sendmessagetoclient-clientstate-serverstate-host-msg-src-mq3-server-snapshot-send-ml-1542293521"></a>
### sendMessageToClient

```ml
function sendMessageToClient(clientState, serverState, host, msg)
```

SV_SendMessageToClient plus the svc_EOF written by SV_Netchan_Transmit. `transmitFn` is the explicit server-netchan boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L127)

<a id="function-function-mq3-server-snapshot-send-server-function-server-time-snapshotentities-snapshotcapacity-baselines-src-mq3-server-snapshot-send-ml-139928184"></a>
### server

```ml
function server(time, snapshotEntities, snapshotCapacity, baselines)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — |  |
| `snapshotEntities` | `dynamic` | — |  |
| `snapshotCapacity` | `dynamic` | — |  |
| `baselines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L68)

- [mq3.server.snapshot_send.Server](Type-mq3-server-snapshot-send-server-1636242949.md) — struct
<a id="function-function-mq3-server-snapshot-send-services-function-services-buildsnapshotfn-writedownloadfn-transmitfn-localaddressfn-lanaddressfn-context-src-mq3-server-snapshot-send-ml-1513017604"></a>
### services

```ml
function services(buildSnapshotFn, writeDownloadFn, transmitFn, localAddressFn, lanAddressFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buildSnapshotFn` | `dynamic` | — |  |
| `writeDownloadFn` | `dynamic` | — |  |
| `transmitFn` | `dynamic` | — |  |
| `localAddressFn` | `dynamic` | — |  |
| `lanAddressFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L74)

- [mq3.server.snapshot_send.Services](Type-mq3-server-snapshot-send-services-347662494.md) — struct
<a id="constant-constant-mq3-server-snapshot-send-snapflag-not-active-const-snapflag-not-active-2-src-mq3-server-snapshot-send-ml-1556559247"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L15)

<a id="constant-constant-mq3-server-snapshot-send-snapflag-rate-delayed-const-snapflag-rate-delayed-1-src-mq3-server-snapshot-send-ml-1939360838"></a>
### SNAPFLAG_RATE_DELAYED

```ml
const SNAPFLAG_RATE_DELAYED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L14)

<a id="function-function-mq3-server-snapshot-send-snapshotflags-function-snapshotflags-clientstate-serverstate-src-mq3-server-snapshot-send-ml-1143984664"></a>
### snapshotFlags

```ml
function snapshotFlags(clientState, serverState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L94)

<a id="constant-constant-mq3-server-snapshot-send-svc-eof-const-svc-eof-8-src-mq3-server-snapshot-send-ml-444305329"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L17)

<a id="constant-constant-mq3-server-snapshot-send-svc-nop-const-svc-nop-1-src-mq3-server-snapshot-send-ml-1496603170"></a>
### SVC_NOP

```ml
const SVC_NOP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L16)

<a id="function-function-mq3-server-snapshot-send-writesnapshottoclient-function-writesnapshottoclient-clientstate-serverstate-msg-src-mq3-server-snapshot-send-ml-2065672671"></a>
### writeSnapshotToClient

```ml
function writeSnapshotToClient(clientState, serverState, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L101)
