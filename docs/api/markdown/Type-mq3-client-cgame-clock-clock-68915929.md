# `mq3.client.cgame_clock.Clock`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-clock-ml-1618125963.md)

<a id="struct-struct-mq3-client-cgame-clock-clock-struct-clock-src-mq3-client-cgame-clock-ml-1595039341"></a>
## Clock

```ml
struct Clock
```

Stores client game clock clock record, including `state`, `snapshotNumber`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_clock.ml#L9)

## Members

<a id="field-field-mq3-client-cgame-clock-clock-snapshotnumber-snapshotnumber-src-mq3-client-cgame-clock-ml-437767211"></a>
### snapshotNumber

```ml
snapshotNumber
```

When constructing this record, `create` supplies `snapshotNumber` for this member. Used by `publishSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_clock.ml#L15)

<a id="field-field-mq3-client-cgame-clock-clock-state-state-src-mq3-client-cgame-clock-ml-222510781"></a>
### state

```ml
state
```

When constructing this record, `create` supplies `state` for this member. Used by `publishSnapshot` and `setTimeNudge` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_clock.ml#L12)
