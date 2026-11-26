# `src/mq3/server/snapshot_schedule.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_schedule`](Package-mq3-server-snapshot-schedule-535336239.md)

Reachable from entry: **yes**

## Imports

- `mq3/server/snapshot_send.ml` as `snapshotSend` → [src/mq3/server/snapshot_send.ml](File-src-mq3-server-snapshot-send-ml-704467576.md)

## Declarations

<a id="function-function-mq3-server-snapshot-schedule-client-function-client-slot-src-mq3-server-snapshot-schedule-ml-1103654898"></a>
### client

```ml
function client(slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L11)

- [mq3.server.snapshot_schedule.Client](Type-mq3-server-snapshot-schedule-client-1766125092.md) — struct
<a id="function-function-mq3-server-snapshot-schedule-netchan-function-netchan-src-mq3-server-snapshot-schedule-ml-934463200"></a>
### netchan

```ml
function netchan()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L6)

- [mq3.server.snapshot_schedule.Netchan](Type-mq3-server-snapshot-schedule-netchan-1273267814.md) — struct
<a id="function-function-mq3-server-snapshot-schedule-sendclientmessages-function-sendclientmessages-clients-servertime-maxrate-host-src-mq3-server-snapshot-schedule-ml-1823974230"></a>
### sendClientMessages

```ml
function sendClientMessages(clients, serverTime, maxRate, host)
```

SV_SendClientMessages. Snapshot construction/transmission stays behind the callback so the scheduler can drive snapshot_send.sendClientSnapshot without duplicating the already-ported packet pipeline.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `maxRate` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L23)

<a id="function-function-mq3-server-snapshot-schedule-services-function-services-sendclientsnapshotfn-transmitnextfragmentfn-context-src-mq3-server-snapshot-schedule-ml-500152765"></a>
### services

```ml
function services(sendClientSnapshotFn, transmitNextFragmentFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sendClientSnapshotFn` | `dynamic` | — |  |
| `transmitNextFragmentFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L16)

- [mq3.server.snapshot_schedule.Services](Type-mq3-server-snapshot-schedule-services-1471977631.md) — struct
