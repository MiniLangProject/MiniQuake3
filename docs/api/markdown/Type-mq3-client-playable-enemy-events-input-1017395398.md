# `mq3.client.playable_enemy_events.Input`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-events-ml-1483454816.md)

<a id="struct-struct-mq3-client-playable-enemy-events-input-struct-input-src-mq3-client-playable-enemy-events-ml-804393941"></a>
## Input

```ml
struct Input
```

Stores playable enemy events input record, including `targetIndex`, `lowerAnimation`, `upperAnimation`, `elapsedMilliseconds`, `action`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L52)

## Members

<a id="field-field-mq3-client-playable-enemy-events-input-action-action-src-mq3-client-playable-enemy-events-ml-67932833"></a>
### action

```ml
action
```

When constructing this record, `appendInput` supplies `track.action` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L62)

<a id="field-field-mq3-client-playable-enemy-events-input-elapsedmilliseconds-elapsedmilliseconds-src-mq3-client-playable-enemy-events-ml-288534553"></a>
### elapsedMilliseconds

```ml
elapsedMilliseconds
```

When constructing this record, `appendInput` supplies `elapsed` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L60)

<a id="field-field-mq3-client-playable-enemy-events-input-loweranimation-loweranimation-src-mq3-client-playable-enemy-events-ml-1002062695"></a>
### lowerAnimation

```ml
lowerAnimation
```

When constructing this record, `appendInput` supplies `lower` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L56)

<a id="field-field-mq3-client-playable-enemy-events-input-targetindex-targetindex-src-mq3-client-playable-enemy-events-ml-714031277"></a>
### targetIndex

```ml
targetIndex
```

Index identifying the selected target in the owning target collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L54)

<a id="field-field-mq3-client-playable-enemy-events-input-upperanimation-upperanimation-src-mq3-client-playable-enemy-events-ml-110230425"></a>
### upperAnimation

```ml
upperAnimation
```

When constructing this record, `appendInput` supplies `upper` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L58)
