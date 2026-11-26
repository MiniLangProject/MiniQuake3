# `mq3.client.playable_enemy_ai.Event`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-ai-ml-948510501.md)

<a id="struct-struct-mq3-client-playable-enemy-ai-event-struct-event-src-mq3-client-playable-enemy-ai-ml-1196380053"></a>
## Event

```ml
struct Event
```

Stores playable enemy ai event record, including `damage`, `side`, `attacker`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L62)

## Members

<a id="field-field-mq3-client-playable-enemy-ai-event-attacker-attacker-src-mq3-client-playable-enemy-ai-ml-803642013"></a>
### attacker

```ml
attacker
```

When constructing this record, `stepWithTrace` supplies `index` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L68)

<a id="field-field-mq3-client-playable-enemy-ai-event-damage-damage-src-mq3-client-playable-enemy-ai-ml-1032184273"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L64)

<a id="field-field-mq3-client-playable-enemy-ai-event-side-side-src-mq3-client-playable-enemy-ai-ml-815191677"></a>
### side

```ml
side
```

When constructing this record, `stepWithTrace` supplies `brain.strafeSide` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L66)
