# `mq3.server.snapshot_schedule.Netchan`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-schedule-ml-156964973.md)

<a id="struct-struct-mq3-server-snapshot-schedule-netchan-struct-netchan-src-mq3-server-snapshot-schedule-ml-512376399"></a>
## Netchan

```ml
struct Netchan
```

Netchan record for server.snapshot_schedule, containing `unsentFragments`, `unsentLength`, `unsentFragmentStart`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L7)

## Members

<a id="field-field-mq3-server-snapshot-schedule-netchan-unsentfragments-unsentfragments-src-mq3-server-snapshot-schedule-ml-274352752"></a>
### unsentFragments

```ml
unsentFragments
```

True while a large outgoing message still has fragments to transmit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L9)

<a id="field-field-mq3-server-snapshot-schedule-netchan-unsentfragmentstart-unsentfragmentstart-src-mq3-server-snapshot-schedule-ml-1673382300"></a>
### unsentFragmentStart

```ml
unsentFragmentStart
```

Byte offset of the next outgoing fragment within that message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L13)

<a id="field-field-mq3-server-snapshot-schedule-netchan-unsentlength-unsentlength-src-mq3-server-snapshot-schedule-ml-1892823810"></a>
### unsentLength

```ml
unsentLength
```

Total byte length of the outgoing message being fragmented.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_schedule.ml#L11)
