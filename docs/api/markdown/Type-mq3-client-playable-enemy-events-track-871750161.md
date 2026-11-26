# `mq3.client.playable_enemy_events.Track`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-events-ml-1483454816.md)

<a id="struct-struct-mq3-client-playable-enemy-events-track-struct-track-src-mq3-client-playable-enemy-events-ml-890963647"></a>
## Track

```ml
struct Track
```

Stores playable enemy events track record, including `health`, `alive`, `origin`, `action`, `actionSince`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L27)

## Members

<a id="field-field-mq3-client-playable-enemy-events-track-action-action-src-mq3-client-playable-enemy-events-ml-235378970"></a>
### action

```ml
action
```

When constructing this record, `state` supplies `action` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L35)

<a id="field-field-mq3-client-playable-enemy-events-track-actionsince-actionsince-src-mq3-client-playable-enemy-events-ml-1773854330"></a>
### actionSince

```ml
actionSince
```

When constructing this record, `state` supplies `now` for this member. Used by `beginAction` and `appendInput` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L38)

<a id="field-field-mq3-client-playable-enemy-events-track-alive-alive-src-mq3-client-playable-enemy-events-ml-2042915402"></a>
### alive

```ml
alive
```

True while the simulated player or target remains alive and can participate in gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L31)

<a id="field-field-mq3-client-playable-enemy-events-track-health-health-src-mq3-client-playable-enemy-events-ml-2047893878"></a>
### health

```ml
health
```

Previously observed enemy health used to detect a new hurt event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L29)

<a id="field-field-mq3-client-playable-enemy-events-track-origin-origin-src-mq3-client-playable-enemy-events-ml-224414622"></a>
### origin

```ml
origin
```

Previous observed enemy position, retained to detect movement between event updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L33)
