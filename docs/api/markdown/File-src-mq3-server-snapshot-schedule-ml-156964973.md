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

Create `mq3.server.snapshot_schedule.Client` with state=0; nextSnapshotTime=0; rate=25000; netchan=netchan(); slot=slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Initial `slot` field stored in the returned or constructed `mq3.server.snapshot_schedule.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L36)

- [mq3.server.snapshot_schedule.Client](Type-mq3-server-snapshot-schedule-client-1766125092.md) — struct
<a id="function-function-mq3-server-snapshot-schedule-netchan-function-netchan-src-mq3-server-snapshot-schedule-ml-934463200"></a>
### netchan

```ml
function netchan()
```

Create `mq3.server.snapshot_schedule.Netchan` with unsentFragments=false; unsentLength=0; unsentFragmentStart=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L16)

- [mq3.server.snapshot_schedule.Netchan](Type-mq3-server-snapshot-schedule-netchan-1273267814.md) — struct
<a id="function-function-mq3-server-snapshot-schedule-sendclientmessages-function-sendclientmessages-clients-servertime-maxrate-host-src-mq3-server-snapshot-schedule-ml-1823974230"></a>
### sendClientMessages

```ml
function sendClientMessages(clients, serverTime, maxRate, host)
```

SV_SendClientMessages. Snapshot construction/transmission stays behind the callback so the scheduler can drive snapshot_send.sendClientSnapshot without duplicating the already-ported packet pipeline.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — | Client scheduling records; disconnected clients and future deadlines are skipped. |
| `serverTime` | `dynamic` | — | Current server time in milliseconds. |
| `maxRate` | `dynamic` | — | Server rate cap passed to snapshot_send.rateMsec. |
| `host` | `dynamic` | — | Service record with sendClientSnapshotFn and transmitNextFragmentFn callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L64)

<a id="function-function-mq3-server-snapshot-schedule-services-function-services-sendclientsnapshotfn-transmitnextfragmentfn-context-src-mq3-server-snapshot-schedule-ml-500152765"></a>
### services

```ml
function services(sendClientSnapshotFn, transmitNextFragmentFn, context)
```

Create `mq3.server.snapshot_schedule.Services` with sendClientSnapshotFn=sendClientSnapshotFn; transmitNextFragmentFn=transmitNextFragmentFn; context=context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sendClientSnapshotFn` | `dynamic` | — | Initial `sendClientSnapshotFn` field stored in the returned or constructed `mq3.server.snapshot_schedule.Services` record. |
| `transmitNextFragmentFn` | `dynamic` | — | Initial `transmitNextFragmentFn` field stored in the returned or constructed `mq3.server.snapshot_schedule.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.snapshot_schedule.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L53)

- [mq3.server.snapshot_schedule.Services](Type-mq3-server-snapshot-schedule-services-1471977631.md) — struct
