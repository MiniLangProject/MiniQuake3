# `mq3.server.snapshot_schedule.Client`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-schedule-ml-156964973.md)

<a id="struct-struct-mq3-server-snapshot-schedule-client-struct-client-src-mq3-server-snapshot-schedule-ml-1335706199"></a>
## Client

```ml
struct Client
```

Client record for server.snapshot_schedule, containing `state`, `nextSnapshotTime`, `rate`, `netchan`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_schedule.ml#L21)

## Members

<a id="field-field-mq3-server-snapshot-schedule-client-netchan-netchan-src-mq3-server-snapshot-schedule-ml-625276982"></a>
### netchan

```ml
netchan
```

Sequenced network channel used to exchange this client's packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_schedule.ml#L30)

<a id="field-field-mq3-server-snapshot-schedule-client-nextsnapshottime-nextsnapshottime-src-mq3-server-snapshot-schedule-ml-1666931574"></a>
### nextSnapshotTime

```ml
nextSnapshotTime
```

Earliest server timestamp for sending the next snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_schedule.ml#L26)

<a id="field-field-mq3-server-snapshot-schedule-client-rate-rate-src-mq3-server-snapshot-schedule-ml-215174318"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_schedule.ml#L28)

<a id="field-field-mq3-server-snapshot-schedule-client-slot-slot-src-mq3-server-snapshot-schedule-ml-1786646002"></a>
### slot

```ml
slot
```

Index identifying this entry in its owning slot table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_schedule.ml#L32)

<a id="field-field-mq3-server-snapshot-schedule-client-state-state-src-mq3-server-snapshot-schedule-ml-289610250"></a>
### state

```ml
state
```

Connection lifecycle value that controls whether snapshots or pending packet fragments may be scheduled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_schedule.ml#L24)
