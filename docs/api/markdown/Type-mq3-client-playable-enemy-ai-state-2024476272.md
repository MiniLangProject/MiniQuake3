# `mq3.client.playable_enemy_ai.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-ai-ml-948510501.md)

<a id="struct-struct-mq3-client-playable-enemy-ai-state-struct-state-src-mq3-client-playable-enemy-ai-ml-1640028395"></a>
## State

```ml
struct State
```

Stores playable enemy ai state, including `brains`, `lastTime`, `events`, `visibleCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L50)

## Members

<a id="field-field-mq3-client-playable-enemy-ai-state-brains-brains-src-mq3-client-playable-enemy-ai-ml-1410342692"></a>
### brains

```ml
brains
```

When constructing this record, `state` supplies `brains` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L52)

<a id="field-field-mq3-client-playable-enemy-ai-state-events-events-src-mq3-client-playable-enemy-ai-ml-791367724"></a>
### events

```ml
events
```

When constructing this record, `state` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L56)

<a id="field-field-mq3-client-playable-enemy-ai-state-lasttime-lasttime-src-mq3-client-playable-enemy-ai-ml-317419328"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `state` supplies `now` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L54)

<a id="field-field-mq3-client-playable-enemy-ai-state-visiblecount-visiblecount-src-mq3-client-playable-enemy-ai-ml-1197222392"></a>
### visibleCount

```ml
visibleCount
```

Number of enemies that can see the player during the current AI update; cleared before each visibility pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L59)
