# `mq3.server.snapshot_send.Services`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-send-ml-704467576.md)

<a id="struct-struct-mq3-server-snapshot-send-services-struct-services-src-mq3-server-snapshot-send-ml-397410979"></a>
## Services

```ml
struct Services
```

Services record for server.snapshot_send, containing `buildSnapshotFn`, `writeDownloadFn`, `transmitFn`, `localAddressFn`, `lanAddressFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L131)

## Members

<a id="field-field-mq3-server-snapshot-send-services-buildsnapshotfn-buildsnapshotfn-src-mq3-server-snapshot-send-ml-1795818201"></a>
### buildSnapshotFn

```ml
buildSnapshotFn
```

Host callback that builds the entity and player state for a client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L133)

<a id="field-field-mq3-server-snapshot-send-services-context-context-src-mq3-server-snapshot-send-ml-953044293"></a>
### context

```ml
context
```

Caller-supplied data associated with snapshot construction, download-block writing, and packet transmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L144)

<a id="field-field-mq3-server-snapshot-send-services-lanaddressfn-lanaddressfn-src-mq3-server-snapshot-send-ml-733870459"></a>
### lanAddressFn

```ml
lanAddressFn
```

Host callback that classifies whether a network endpoint belongs to the LAN.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L141)

<a id="field-field-mq3-server-snapshot-send-services-localaddressfn-localaddressfn-src-mq3-server-snapshot-send-ml-1014783699"></a>
### localAddressFn

```ml
localAddressFn
```

Host callback that tests whether a network endpoint is local.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L139)

<a id="field-field-mq3-server-snapshot-send-services-transmitfn-transmitfn-src-mq3-server-snapshot-send-ml-1471269141"></a>
### transmitFn

```ml
transmitFn
```

Host callback that transmits a complete message through a sequenced channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L137)

<a id="field-field-mq3-server-snapshot-send-services-writedownloadfn-writedownloadfn-src-mq3-server-snapshot-send-ml-1944537333"></a>
### writeDownloadFn

```ml
writeDownloadFn
```

Host callback that appends the next download block to an outgoing message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L135)
