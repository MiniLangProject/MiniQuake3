# `mq3.botlib.ai_item_weights.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)

<a id="struct-struct-mq3-botlib-ai-item-weights-runtime-struct-runtime-src-mq3-botlib-ai-item-weights-ml-1886202485"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for ai item weights, containing `context`, `readFn`, `items`, `configs` and `fileReads` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L101)

## Members

<a id="field-field-mq3-botlib-ai-item-weights-runtime-configs-configs-src-mq3-botlib-ai-item-weights-ml-1976812069"></a>
### configs

```ml
configs
```

Loaded fuzzy-weight configurations retained for reuse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L110)

<a id="field-field-mq3-botlib-ai-item-weights-runtime-context-context-src-mq3-botlib-ai-item-weights-ml-2010275957"></a>
### context

```ml
context
```

Caller-supplied data associated with loading item definitions and fuzzy item-weight configurations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L104)

<a id="field-field-mq3-botlib-ai-item-weights-runtime-filereads-filereads-src-mq3-botlib-ai-item-weights-ml-266117257"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L112)

<a id="field-field-mq3-botlib-ai-item-weights-runtime-items-items-src-mq3-botlib-ai-item-weights-ml-2122735265"></a>
### items

```ml
items
```

Item definitions available to the goal-weight evaluator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L108)

<a id="field-field-mq3-botlib-ai-item-weights-runtime-qvminventory-qvminventory-src-mq3-botlib-ai-item-weights-ml-2108753069"></a>
### qvmInventory

```ml
qvmInventory
```

Inventory integer values imported from the bot VM call.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L116)

<a id="field-field-mq3-botlib-ai-item-weights-runtime-readfn-readfn-src-mq3-botlib-ai-item-weights-ml-806074725"></a>
### readFn

```ml
readFn
```

Host callback that reads item configuration and fuzzy-weight source files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L106)

<a id="field-field-mq3-botlib-ai-item-weights-runtime-reloadcharacters-reloadcharacters-src-mq3-botlib-ai-item-weights-ml-978029883"></a>
### reloadCharacters

```ml
reloadCharacters
```

True when bot definitions should be reloaded instead of reused from cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_item_weights.ml#L114)
