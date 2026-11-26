# `mq3.botlib.ai_level_items.LevelItemRuntime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-level-items-ml-1268981414.md)

<a id="struct-struct-mq3-botlib-ai-level-items-levelitemruntime-struct-levelitemruntime-src-mq3-botlib-ai-level-items-ml-663013721"></a>
## LevelItemRuntime

```ml
struct LevelItemRuntime
```

`LevelItemRuntime` record for ai level items, containing `itemRuntime`, `aasEntities`, `aas`, `bspEntities` and `gameType` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L59)

## Members

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-aas-aas-src-mq3-botlib-ai-level-items-ml-1009603708"></a>
### aas

```ml
aas
```

AAS navigation runtime used for area and route queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L65)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-aasentities-aasentities-src-mq3-botlib-ai-level-items-ml-740367716"></a>
### aasEntities

```ml
aasEntities
```

Navigation entity information used to track live map items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L63)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-bspentities-bspentities-src-mq3-botlib-ai-level-items-ml-927145896"></a>
### bspEntities

```ml
bspEntities
```

Parsed key/value definitions from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L67)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-callbackcontext-callbackcontext-src-mq3-botlib-ai-level-items-ml-2144778872"></a>
### callbackContext

```ml
callbackContext
```

Opaque host data passed to the bound callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L71)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-gametype-gametype-src-mq3-botlib-ai-level-items-ml-1867219080"></a>
### gameType

```ml
gameType
```

Game-mode identifier used when applying mode-specific rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L69)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-initialized-initialized-src-mq3-botlib-ai-level-items-ml-2089377336"></a>
### initialized

```ml
initialized
```

True after item and roam goals have been discovered for the current level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L81)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-itemruntime-itemruntime-src-mq3-botlib-ai-level-items-ml-1961052008"></a>
### itemRuntime

```ml
itemRuntime
```

Runtime containing the item definitions and fuzzy-weight rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L61)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-levelitems-levelitems-src-mq3-botlib-ai-level-items-ml-2020394836"></a>
### levelItems

```ml
levelItems
```

Current item goals discovered from the map and its dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L75)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-maxlevelitems-maxlevelitems-src-mq3-botlib-ai-level-items-ml-856539400"></a>
### maxLevelItems

```ml
maxLevelItems
```

Maximum number of map and dynamic item goals retained by this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L79)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-numlevelitems-numlevelitems-src-mq3-botlib-ai-level-items-ml-466569800"></a>
### numLevelItems

```ml
numLevelItems
```

Number of level items represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L77)

<a id="field-field-mq3-botlib-ai-level-items-levelitemruntime-placefn-placefn-src-mq3-botlib-ai-level-items-ml-768870300"></a>
### placeFn

```ml
placeFn
```

Host callback that places a discovered item goal in a usable AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L73)
