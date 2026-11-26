# `mq3.botlib.ai_resource_pools.Pools`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

<a id="struct-struct-mq3-botlib-ai-resource-pools-pools-struct-pools-src-mq3-botlib-ai-resource-pools-ml-1420475599"></a>
## Pools

```ml
struct Pools
```

`Pools` record for ai resource pools, containing `chatStates`, `goalStates`, `moveStates` and `weaponStates`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L176)

## Members

<a id="field-field-mq3-botlib-ai-resource-pools-pools-chatstates-chatstates-src-mq3-botlib-ai-resource-pools-ml-386668680"></a>
### chatStates

```ml
chatStates
```

Allocated per-bot chat-state slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L178)

<a id="field-field-mq3-botlib-ai-resource-pools-pools-goalstates-goalstates-src-mq3-botlib-ai-resource-pools-ml-399843926"></a>
### goalStates

```ml
goalStates
```

Allocated per-bot goal-stack and avoidance-state slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L180)

<a id="field-field-mq3-botlib-ai-resource-pools-pools-movestates-movestates-src-mq3-botlib-ai-resource-pools-ml-1130019926"></a>
### moveStates

```ml
moveStates
```

Allocated per-bot movement-state slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L182)

<a id="field-field-mq3-botlib-ai-resource-pools-pools-weaponstates-weaponstates-src-mq3-botlib-ai-resource-pools-ml-899324904"></a>
### weaponStates

```ml
weaponStates
```

Allocated per-bot weapon-selection-state slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L184)
