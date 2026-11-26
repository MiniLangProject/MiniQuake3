# `mq3.botlib.ai_item_weights.Separator`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)

<a id="struct-struct-mq3-botlib-ai-item-weights-separator-struct-separator-src-mq3-botlib-ai-item-weights-ml-970432183"></a>
## Separator

```ml
struct Separator
```

`Separator` record for ai item weights, containing `inventoryIndex`, `value`, `type`, `weight` and `minWeight` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L54)

## Members

<a id="field-field-mq3-botlib-ai-item-weights-separator-child-child-src-mq3-botlib-ai-item-weights-ml-1449400690"></a>
### child

```ml
child
```

Child decision-tree node reached by this separator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L68)

<a id="field-field-mq3-botlib-ai-item-weights-separator-inventoryindex-inventoryindex-src-mq3-botlib-ai-item-weights-ml-610187458"></a>
### inventoryIndex

```ml
inventoryIndex
```

Index of the bot inventory value used by this item or weight rule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L56)

<a id="field-field-mq3-botlib-ai-item-weights-separator-maxweight-maxweight-src-mq3-botlib-ai-item-weights-ml-815583922"></a>
### maxWeight

```ml
maxWeight
```

Upper bound used when balancing a fuzzy-weight leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L66)

<a id="field-field-mq3-botlib-ai-item-weights-separator-minweight-minweight-src-mq3-botlib-ai-item-weights-ml-141611982"></a>
### minWeight

```ml
minWeight
```

Lower bound used when balancing a fuzzy-weight leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L64)

<a id="field-field-mq3-botlib-ai-item-weights-separator-type-type-src-mq3-botlib-ai-item-weights-ml-1621724658"></a>
### type

```ml
type
```

Fuzzy-weight node type, including balanceable leaf nodes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L60)

<a id="field-field-mq3-botlib-ai-item-weights-separator-value-value-src-mq3-botlib-ai-item-weights-ml-1260179902"></a>
### value

```ml
value
```

Inventory comparison threshold used to choose a decision-tree branch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L58)

<a id="field-field-mq3-botlib-ai-item-weights-separator-weight-weight-src-mq3-botlib-ai-item-weights-ml-1678333602"></a>
### weight

```ml
weight
```

Fuzzy score returned at this separator when no child expression is selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L62)
