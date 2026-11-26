# `mq3.client.playable_enemy_events.Event`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-events-ml-1483454816.md)

<a id="struct-struct-mq3-client-playable-enemy-events-event-struct-event-src-mq3-client-playable-enemy-events-ml-1336113969"></a>
## Event

```ml
struct Event
```

Stores playable enemy events event record, including `kind`, `targetIndex`, `at`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L65)

## Members

<a id="field-field-mq3-client-playable-enemy-events-event-at-at-src-mq3-client-playable-enemy-events-ml-1607252019"></a>
### at

```ml
at
```

When constructing this record, `beginAction` supplies `now` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L71)

<a id="field-field-mq3-client-playable-enemy-events-event-kind-kind-src-mq3-client-playable-enemy-events-ml-1492584333"></a>
### kind

```ml
kind
```

Enemy-state event category selected by comparing the current target with its previous observation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L67)

<a id="field-field-mq3-client-playable-enemy-events-event-targetindex-targetindex-src-mq3-client-playable-enemy-events-ml-1505307553"></a>
### targetIndex

```ml
targetIndex
```

Index identifying the selected target in the owning target collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L69)
