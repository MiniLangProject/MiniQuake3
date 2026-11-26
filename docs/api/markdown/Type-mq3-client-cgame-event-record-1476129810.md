# `mq3.client.cgame_event.Record`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-event-ml-1436945917.md)

<a id="struct-struct-mq3-client-cgame-event-record-struct-record-src-mq3-client-cgame-event-ml-1084652523"></a>
## Record

```ml
struct Record
```

Stores client game event record, including `serverTime`, `sourceEntity`, `effectiveEntity`, `event`, `eventParm`, `position` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L64)

## Members

<a id="field-field-mq3-client-cgame-event-record-actions-actions-src-mq3-client-cgame-event-ml-1162135808"></a>
### actions

```ml
actions
```

Host operations produced by this single decoded entity event, in emission order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L78)

<a id="field-field-mq3-client-cgame-event-record-effectiveentity-effectiveentity-src-mq3-client-cgame-event-ml-919471972"></a>
### effectiveEntity

```ml
effectiveEntity
```

When constructing this record, `checkEvent` supplies `effectiveEntity` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L70)

<a id="field-field-mq3-client-cgame-event-record-event-event-src-mq3-client-cgame-event-ml-170455884"></a>
### event

```ml
event
```

When constructing this record, `checkEvent` supplies `event` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L72)

<a id="field-field-mq3-client-cgame-event-record-eventparm-eventparm-src-mq3-client-cgame-event-ml-951245156"></a>
### eventParm

```ml
eventParm
```

When constructing this record, `checkEvent` supplies `es.eventParm` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L74)

<a id="field-field-mq3-client-cgame-event-record-position-position-src-mq3-client-cgame-event-ml-1570656074"></a>
### position

```ml
position
```

When constructing this record, `checkEvent` supplies `position` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L76)

<a id="field-field-mq3-client-cgame-event-record-servertime-servertime-src-mq3-client-cgame-event-ml-1701232996"></a>
### serverTime

```ml
serverTime
```

Server snapshot timestamp in milliseconds at which the entity event position was evaluated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L66)

<a id="field-field-mq3-client-cgame-event-record-sourceentity-sourceentity-src-mq3-client-cgame-event-ml-106150300"></a>
### sourceEntity

```ml
sourceEntity
```

When constructing this record, `checkEvent` supplies `sourceEntity` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L68)

<a id="field-field-mq3-client-cgame-event-record-suppressed-suppressed-src-mq3-client-cgame-event-ml-505373108"></a>
### suppressed

```ml
suppressed
```

True when this event's effects were recorded without native dispatch because the retail CGame QVM owns them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_event.ml#L81)
