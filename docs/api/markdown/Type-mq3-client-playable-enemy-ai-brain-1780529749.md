# `mq3.client.playable_enemy_ai.Brain`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-ai-ml-948510501.md)

<a id="struct-struct-mq3-client-playable-enemy-ai-brain-struct-brain-src-mq3-client-playable-enemy-ai-ml-439346797"></a>
## Brain

```ml
struct Brain
```

Stores playable enemy ai brain record, including `mode`, `nextThink`, `nextAttack`, `strafeSide`, `lastSeen`, `visible`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L30)

## Members

<a id="field-field-mq3-client-playable-enemy-ai-brain-lastseen-lastseen-src-mq3-client-playable-enemy-ai-ml-1117165125"></a>
### lastSeen

```ml
lastSeen
```

When constructing this record, `state` supplies `[0.0,0.0,0.0]` for this member. Used by `stepWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L45)

<a id="field-field-mq3-client-playable-enemy-ai-brain-mode-mode-src-mq3-client-playable-enemy-ai-ml-610600525"></a>
### mode

```ml
mode
```

When constructing this record, `state` supplies `"patrol"` for this member. Used by `moveTarget` and `stepWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L33)

<a id="field-field-mq3-client-playable-enemy-ai-brain-nextattack-nextattack-src-mq3-client-playable-enemy-ai-ml-267316041"></a>
### nextAttack

```ml
nextAttack
```

When constructing this record, `state` supplies `now+350+(index%4)*90` for this member. Used by `stepWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L39)

<a id="field-field-mq3-client-playable-enemy-ai-brain-nextthink-nextthink-src-mq3-client-playable-enemy-ai-ml-769137099"></a>
### nextThink

```ml
nextThink
```

When constructing this record, `state` supplies `now+(index%3)*17` for this member. Used by `stepWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L36)

<a id="field-field-mq3-client-playable-enemy-ai-brain-strafeside-strafeside-src-mq3-client-playable-enemy-ai-ml-1133001539"></a>
### strafeSide

```ml
strafeSide
```

When constructing this record, `state` supplies `side` for this member. Used by `moveTarget` and `stepWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L42)

<a id="field-field-mq3-client-playable-enemy-ai-brain-visible-visible-src-mq3-client-playable-enemy-ai-ml-354367811"></a>
### visible

```ml
visible
```

True when the record is eligible for the current drawing or browser-display pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L47)
