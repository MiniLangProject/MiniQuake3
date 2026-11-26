# `mq3.botlib.ai_resource_pools.GoalState`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

<a id="struct-struct-mq3-botlib-ai-resource-pools-goalstate-struct-goalstate-src-mq3-botlib-ai-resource-pools-ml-1376639761"></a>
## GoalState

```ml
struct GoalState
```

`GoalState` record for ai resource pools, containing `itemWeightConfig`, `itemWeightIndex`, `client`, `lastReachabilityArea` and `goalStack` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L90)

## Members

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-avoidgoals-avoidgoals-src-mq3-botlib-ai-resource-pools-ml-1125177309"></a>
### avoidGoals

```ml
avoidGoals
```

Goals to avoid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L104)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-avoidgoaltimes-avoidgoaltimes-src-mq3-botlib-ai-resource-pools-ml-569179463"></a>
### avoidGoalTimes

```ml
avoidGoalTimes
```

Times to avoid the goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L106)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-client-client-src-mq3-botlib-ai-resource-pools-ml-336139437"></a>
### client

```ml
client
```

Client using this goal state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L96)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-goalstack-goalstack-src-mq3-botlib-ai-resource-pools-ml-1256688067"></a>
### goalStack

```ml
goalStack
```

Stack of active and suspended goals for this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L100)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-goalstacktop-goalstacktop-src-mq3-botlib-ai-resource-pools-ml-1851680023"></a>
### goalStackTop

```ml
goalStackTop
```

The top of the goal stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L102)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-itemweightconfig-itemweightconfig-src-mq3-botlib-ai-resource-pools-ml-716625637"></a>
### itemWeightConfig

```ml
itemWeightConfig
```

Fuzzy-weight configuration used to score item goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L92)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-itemweightindex-itemweightindex-src-mq3-botlib-ai-resource-pools-ml-1242308523"></a>
### itemWeightIndex

```ml
itemWeightIndex
```

Index from item to weight.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L94)

<a id="field-field-mq3-botlib-ai-resource-pools-goalstate-lastreachabilityarea-lastreachabilityarea-src-mq3-botlib-ai-resource-pools-ml-270603879"></a>
### lastReachabilityArea

```ml
lastReachabilityArea
```

Last area with reachabilities the bot was in.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L98)
