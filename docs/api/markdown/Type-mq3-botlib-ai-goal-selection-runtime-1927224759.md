# `mq3.botlib.ai_goal_selection.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-goal-selection-ml-603097719.md)

<a id="struct-struct-mq3-botlib-ai-goal-selection-runtime-struct-runtime-src-mq3-botlib-ai-goal-selection-ml-2123514597"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for ai goal selection, containing `levelItems`, `goals`, `services`, `droppedWeight` and `randomSeed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L70)

## Members

<a id="field-field-mq3-botlib-ai-goal-selection-runtime-droppedweight-droppedweight-src-mq3-botlib-ai-goal-selection-ml-356093539"></a>
### droppedWeight

```ml
droppedWeight
```

Additional scoring factor applied to dropped-item goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L78)

<a id="field-field-mq3-botlib-ai-goal-selection-runtime-goals-goals-src-mq3-botlib-ai-goal-selection-ml-196501823"></a>
### goals

```ml
goals
```

Goal-state runtime supplying active stacks and avoidance policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L74)

<a id="field-field-mq3-botlib-ai-goal-selection-runtime-levelitems-levelitems-src-mq3-botlib-ai-goal-selection-ml-590724783"></a>
### levelItems

```ml
levelItems
```

Current item goals discovered from the map and its dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L72)

<a id="field-field-mq3-botlib-ai-goal-selection-runtime-randomseed-randomseed-src-mq3-botlib-ai-goal-selection-ml-1933336543"></a>
### randomSeed

```ml
randomSeed
```

Seed retained for repeatable bot-goal selection randomness.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L80)

<a id="field-field-mq3-botlib-ai-goal-selection-runtime-services-services-src-mq3-botlib-ai-goal-selection-ml-1005937291"></a>
### services

```ml
services
```

Route-cost, collision, and entity queries used when comparing item goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L76)
