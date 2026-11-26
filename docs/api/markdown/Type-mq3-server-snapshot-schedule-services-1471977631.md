# `mq3.server.snapshot_schedule.Services`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-schedule-ml-156964973.md)

<a id="struct-struct-mq3-server-snapshot-schedule-services-struct-services-src-mq3-server-snapshot-schedule-ml-1330248087"></a>
## Services

```ml
struct Services
```

Services record for server.snapshot_schedule, containing `sendClientSnapshotFn`, `transmitNextFragmentFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L41)

## Members

<a id="field-field-mq3-server-snapshot-schedule-services-context-context-src-mq3-server-snapshot-schedule-ml-776788489"></a>
### context

```ml
context
```

Caller-supplied data associated with scheduled snapshot sends and pending-fragment transmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L47)

<a id="field-field-mq3-server-snapshot-schedule-services-sendclientsnapshotfn-sendclientsnapshotfn-src-mq3-server-snapshot-schedule-ml-700994255"></a>
### sendClientSnapshotFn

```ml
sendClientSnapshotFn
```

Host callback that sends the next snapshot to a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L43)

<a id="field-field-mq3-server-snapshot-schedule-services-transmitnextfragmentfn-transmitnextfragmentfn-src-mq3-server-snapshot-schedule-ml-1852591963"></a>
### transmitNextFragmentFn

```ml
transmitNextFragmentFn
```

Host callback that sends the next pending fragment of a large network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L45)
