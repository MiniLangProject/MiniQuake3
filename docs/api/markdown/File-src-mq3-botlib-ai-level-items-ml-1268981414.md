# `src/mq3/botlib/ai_level_items.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_level_items`](Package-mq3-botlib-ai-level-items-459411036.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/ai_item_weights.ml` as `itemWeights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-botlib-ai-level-items-areacontents-jumppad-const-areacontents-jumppad-128-src-mq3-botlib-ai-level-items-ml-1894826274"></a>
### AREACONTENTS_JUMPPAD

```ml
const AREACONTENTS_JUMPPAD = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L23)

<a id="function-function-mq3-botlib-ai-level-items-bind-function-bind-state-entities-aas-bspentities-gametype-callbackcontext-placefn-src-mq3-botlib-ai-level-items-ml-2016316342"></a>
### bind

```ml
function bind(state, entities, aas, bspEntities, gameType, callbackContext, placeFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `aas` | `dynamic` | — |  |
| `bspEntities` | `dynamic` | — |  |
| `gameType` | `dynamic` | — |  |
| `callbackContext` | `dynamic` | — |  |
| `placeFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L32)

- [mq3.botlib.ai_level_items.BotLevelItem](Type-mq3-botlib-ai-level-items-botlevelitem-802190352.md) — struct
<a id="function-function-mq3-botlib-ai-level-items-copyvector-function-copyvector-value-src-mq3-botlib-ai-level-items-ml-291229009"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L28)

<a id="function-function-mq3-botlib-ai-level-items-create-function-create-itemruntime-src-mq3-botlib-ai-level-items-ml-409833397"></a>
### create

```ml
function create(itemRuntime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemRuntime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L29)

<a id="function-function-mq3-botlib-ai-level-items-currenttime-function-currenttime-state-src-mq3-botlib-ai-level-items-ml-1232350941"></a>
### currentTime

```ml
function currentTime(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L114)

<a id="function-function-mq3-botlib-ai-level-items-defaultplace-function-defaultplace-state-origin-mins-maxs-floating-src-mq3-botlib-ai-level-items-ml-763670723"></a>
### defaultPlace

```ml
function defaultPlace(state, origin, mins, maxs, floating)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `floating` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L51)

<a id="function-function-mq3-botlib-ai-level-items-distance-function-distance-a-b-src-mq3-botlib-ai-level-items-ml-1600235779"></a>
### distance

```ml
function distance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L48)

<a id="function-function-mq3-botlib-ai-level-items-epair-function-epair-state-entity-key-src-mq3-botlib-ai-level-items-ml-1204007435"></a>
### epair

```ml
function epair(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L38)

<a id="function-function-mq3-botlib-ai-level-items-equalvector-function-equalvector-a-b-src-mq3-botlib-ai-level-items-ml-2019471513"></a>
### equalVector

```ml
function equalVector(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L47)

<a id="constant-constant-mq3-botlib-ai-level-items-et-item-const-et-item-2-src-mq3-botlib-ai-level-items-ml-796655751"></a>
### ET_ITEM

```ml
const ET_ITEM = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L15)

<a id="function-function-mq3-botlib-ai-level-items-findclass-function-findclass-items-classname-src-mq3-botlib-ai-level-items-ml-58823217"></a>
### findClass

```ml
function findClass(items, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L45)

<a id="function-function-mq3-botlib-ai-level-items-findmodel-function-findmodel-items-modelindex-src-mq3-botlib-ai-level-items-ml-1285305087"></a>
### findModel

```ml
function findModel(items, modelIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — |  |
| `modelIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L46)

<a id="function-function-mq3-botlib-ai-level-items-goalname-function-goalname-state-number-src-mq3-botlib-ai-level-items-ml-190896992"></a>
### goalName

```ml
function goalName(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L156)

<a id="constant-constant-mq3-botlib-ai-level-items-gt-single-player-const-gt-single-player-2-src-mq3-botlib-ai-level-items-ml-1661136213"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L16)

<a id="constant-constant-mq3-botlib-ai-level-items-gt-team-const-gt-team-3-src-mq3-botlib-ai-level-items-ml-676450362"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L17)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notbot-const-ifl-notbot-8-src-mq3-botlib-ai-level-items-ml-1029173839"></a>
### IFL_NOTBOT

```ml
const IFL_NOTBOT = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L21)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notfree-const-ifl-notfree-1-src-mq3-botlib-ai-level-items-ml-1069787888"></a>
### IFL_NOTFREE

```ml
const IFL_NOTFREE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L18)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notsingle-const-ifl-notsingle-4-src-mq3-botlib-ai-level-items-ml-1139947565"></a>
### IFL_NOTSINGLE

```ml
const IFL_NOTSINGLE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L20)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notteam-const-ifl-notteam-2-src-mq3-botlib-ai-level-items-ml-1472570363"></a>
### IFL_NOTTEAM

```ml
const IFL_NOTTEAM = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L19)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-roam-const-ifl-roam-16-src-mq3-botlib-ai-level-items-ml-510748128"></a>
### IFL_ROAM

```ml
const IFL_ROAM = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L22)

<a id="function-function-mq3-botlib-ai-level-items-initialize-function-initialize-state-src-mq3-botlib-ai-level-items-ml-1777088133"></a>
### initialize

```ml
function initialize(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L84)

<a id="function-function-mq3-botlib-ai-level-items-intepair-function-intepair-state-entity-key-src-mq3-botlib-ai-level-items-ml-389308605"></a>
### intEpair

```ml
function intEpair(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L43)

<a id="function-function-mq3-botlib-ai-level-items-jumppadarea-function-jumppadarea-state-area-src-mq3-botlib-ai-level-items-ml-1746520964"></a>
### jumpPadArea

```ml
function jumpPadArea(state, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L115)

- [mq3.botlib.ai_level_items.LevelItemRuntime](Type-mq3-botlib-ai-level-items-levelitemruntime-1611641085.md) — struct
<a id="constant-constant-mq3-botlib-ai-level-items-max-level-items-const-max-level-items-256-src-mq3-botlib-ai-level-items-ml-58997490"></a>
### MAX_LEVEL_ITEMS

```ml
const MAX_LEVEL_ITEMS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L14)

<a id="constant-constant-mq3-botlib-ai-level-items-op-init-level-items-const-op-init-level-items-541-src-mq3-botlib-ai-level-items-ml-572939857"></a>
### OP_INIT_LEVEL_ITEMS

```ml
const OP_INIT_LEVEL_ITEMS = 541
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L12)

<a id="constant-constant-mq3-botlib-ai-level-items-op-update-entity-items-const-op-update-entity-items-542-src-mq3-botlib-ai-level-items-ml-1508249652"></a>
### OP_UPDATE_ENTITY_ITEMS

```ml
const OP_UPDATE_ENTITY_ITEMS = 542
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L13)

<a id="function-function-mq3-botlib-ai-level-items-permitted-function-permitted-state-item-src-mq3-botlib-ai-level-items-ml-126536154"></a>
### permitted

```ml
function permitted(state, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L79)

<a id="function-function-mq3-botlib-ai-level-items-place-function-place-state-origin-mins-maxs-floating-src-mq3-botlib-ai-level-items-ml-382426133"></a>
### place

```ml
function place(state, origin, mins, maxs, floating)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `floating` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L75)

<a id="function-function-mq3-botlib-ai-level-items-removeat-function-removeat-values-index-src-mq3-botlib-ai-level-items-ml-1013167650"></a>
### removeAt

```ml
function removeAt(values, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L108)

<a id="function-function-mq3-botlib-ai-level-items-setgametype-function-setgametype-state-value-src-mq3-botlib-ai-level-items-ml-862523202"></a>
### setGameType

```ml
function setGameType(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L37)

<a id="function-function-mq3-botlib-ai-level-items-shutdown-function-shutdown-state-src-mq3-botlib-ai-level-items-ml-49861629"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L155)

<a id="function-function-mq3-botlib-ai-level-items-update-function-update-state-src-mq3-botlib-ai-level-items-ml-58784257"></a>
### update

```ml
function update(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L119)

<a id="function-function-mq3-botlib-ai-level-items-vectorepair-function-vectorepair-state-entity-key-src-mq3-botlib-ai-level-items-ml-80590433"></a>
### vectorEpair

```ml
function vectorEpair(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_level_items.ml#L44)
