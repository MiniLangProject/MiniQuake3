# `mq3.botlib.ai_item_weights.ItemInfo`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)

<a id="struct-struct-mq3-botlib-ai-item-weights-iteminfo-struct-iteminfo-src-mq3-botlib-ai-item-weights-ml-579549919"></a>
## ItemInfo

```ml
struct ItemInfo
```

`ItemInfo` record for ai item weights, containing `classname`, `name`, `model`, `modelIndex` and `type` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L31)

## Members

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-classname-classname-src-mq3-botlib-ai-item-weights-ml-1926523186"></a>
### classname

```ml
classname
```

Classname of the item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L33)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-inventoryindex-inventoryindex-src-mq3-botlib-ai-item-weights-ml-529414254"></a>
### inventoryIndex

```ml
inventoryIndex
```

Index of the bot inventory value used by this item or weight rule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L43)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-maxs-maxs-src-mq3-botlib-ai-item-weights-ml-569238792"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the pickup volume specified by this item definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L49)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-mins-mins-src-mq3-botlib-ai-item-weights-ml-1820221332"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the pickup volume specified by this item definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L47)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-model-model-src-mq3-botlib-ai-item-weights-ml-198836270"></a>
### model

```ml
model
```

Model of the item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L37)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-modelindex-modelindex-src-mq3-botlib-ai-item-weights-ml-568682100"></a>
### modelIndex

```ml
modelIndex
```

Model index used to associate this entity or item with registered model data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L39)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-name-name-src-mq3-botlib-ai-item-weights-ml-1538813028"></a>
### name

```ml
name
```

Name of the item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L35)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-number-number-src-mq3-botlib-ai-item-weights-ml-1715246952"></a>
### number

```ml
number
```

Identifier of this item definition in the loaded configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L51)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-respawntime-respawntime-src-mq3-botlib-ai-item-weights-ml-1756732658"></a>
### respawnTime

```ml
respawnTime
```

Configured interval before this item is expected to respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L45)

<a id="field-field-mq3-botlib-ai-item-weights-iteminfo-type-type-src-mq3-botlib-ai-item-weights-ml-2067866046"></a>
### type

```ml
type
```

Configured item category used by the goal-selection rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L41)
