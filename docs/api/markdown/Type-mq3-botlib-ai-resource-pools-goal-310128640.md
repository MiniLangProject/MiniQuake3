# `mq3.botlib.ai_resource_pools.Goal`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

<a id="struct-struct-mq3-botlib-ai-resource-pools-goal-struct-goal-src-mq3-botlib-ai-resource-pools-ml-1666492391"></a>
## Goal

```ml
struct Goal
```

`Goal` record for ai resource pools, containing `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L71)

## Members

<a id="field-field-mq3-botlib-ai-resource-pools-goal-areanum-areanum-src-mq3-botlib-ai-resource-pools-ml-1313810630"></a>
### areaNum

```ml
areaNum
```

Navigation area containing the position of this bot goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L75)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-entitynum-entitynum-src-mq3-botlib-ai-resource-pools-ml-420822786"></a>
### entityNum

```ml
entityNum
```

Number of the game entity associated with this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L81)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-flags-flags-src-mq3-botlib-ai-resource-pools-ml-1360814854"></a>
### flags

```ml
flags
```

Combined goal-property flags, including item, dropped, and roam markers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L85)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-iteminfo-iteminfo-src-mq3-botlib-ai-resource-pools-ml-1348439076"></a>
### itemInfo

```ml
itemInfo
```

Item-configuration index associated with this bot goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L87)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-maxs-maxs-src-mq3-botlib-ai-resource-pools-ml-1759027368"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the bot goal volume relative to the goal position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L79)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-mins-mins-src-mq3-botlib-ai-resource-pools-ml-1000913760"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the bot goal volume relative to the goal position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L77)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-number-number-src-mq3-botlib-ai-resource-pools-ml-947567632"></a>
### number

```ml
number
```

Goal identifier associated with the level item or named destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L83)

<a id="field-field-mq3-botlib-ai-resource-pools-goal-origin-origin-src-mq3-botlib-ai-resource-pools-ml-52859198"></a>
### origin

```ml
origin
```

World-space target position of this stored bot goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L73)
