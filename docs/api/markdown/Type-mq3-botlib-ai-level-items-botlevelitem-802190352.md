# `mq3.botlib.ai_level_items.BotLevelItem`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-level-items-ml-1268981414.md)

<a id="struct-struct-mq3-botlib-ai-level-items-botlevelitem-struct-botlevelitem-src-mq3-botlib-ai-level-items-ml-971657461"></a>
## BotLevelItem

```ml
struct BotLevelItem
```

`BotLevelItem` record for ai level items, containing `number`, `itemInfo`, `flags`, `weight` and `origin` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L38)

## Members

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-entitynum-entitynum-src-mq3-botlib-ai-level-items-ml-1719490091"></a>
### entityNum

```ml
entityNum
```

Number of the game entity associated with this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L54)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-flags-flags-src-mq3-botlib-ai-level-items-ml-1674656143"></a>
### flags

```ml
flags
```

Item restrictions and roam-goal properties combined from IFL flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L44)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-goalareanum-goalareanum-src-mq3-botlib-ai-level-items-ml-1323968279"></a>
### goalAreaNum

```ml
goalAreaNum
```

AAS area containing the destination of this route or goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L50)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-goalorigin-goalorigin-src-mq3-botlib-ai-level-items-ml-1009353353"></a>
### goalOrigin

```ml
goalOrigin
```

Goal origin within the area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L52)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-iteminfo-iteminfo-src-mq3-botlib-ai-level-items-ml-562194209"></a>
### itemInfo

```ml
itemInfo
```

Item-configuration index associated with this bot goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L42)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-number-number-src-mq3-botlib-ai-level-items-ml-1090180813"></a>
### number

```ml
number
```

Unique level-item goal identifier used by bot goal queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L40)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-origin-origin-src-mq3-botlib-ai-level-items-ml-1703051031"></a>
### origin

```ml
origin
```

World-space position of the tracked level item or roam entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L48)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-timeout-timeout-src-mq3-botlib-ai-level-items-ml-1141266571"></a>
### timeout

```ml
timeout
```

Item is removed after this time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L56)

<a id="field-field-mq3-botlib-ai-level-items-botlevelitem-weight-weight-src-mq3-botlib-ai-level-items-ml-1090971755"></a>
### weight

```ml
weight
```

Configured preference multiplier for a bot roam goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L46)
