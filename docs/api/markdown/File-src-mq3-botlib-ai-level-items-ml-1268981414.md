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

AAS area-contents bit marking jump pad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L35)

<a id="function-function-mq3-botlib-ai-level-items-bind-function-bind-state-entities-aas-bspentities-gametype-callbackcontext-placefn-src-mq3-botlib-ai-level-items-ml-2016316342"></a>
### bind

```ml
function bind(state, entities, aas, bspEntities, gameType, callbackContext, placeFn)
```

Update `state.aasEntities`, `state.aas`, `state.bspEntities` and `state.gameType` and related state during `bind`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `aasEntities`, `aas`, `bspEntities`, `gameType` and `callbackContext` and related fields. May update `state.aasEntities`, `state.aas` and `state.bspEntities` and additional fields in place. |
| `entities` | `dynamic` | — | Value used by `bind` in `state.aasEntities=entities`. |
| `aas` | `dynamic` | — | Value used by `bind` in `state.aas=aas`. |
| `bspEntities` | `dynamic` | — | Value used by `bind` in `state.bspEntities=bspEntities`. |
| `gameType` | `dynamic` | — | Value used by `bind` in `state.gameType=gameType`. |
| `callbackContext` | `dynamic` | — | Value used by `bind` in `state.callbackContext=callbackContext`. |
| `placeFn` | `dynamic` | — | Value used by `bind` in `state.placeFn=placeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L100)

- [mq3.botlib.ai_level_items.BotLevelItem](Type-mq3-botlib-ai-level-items-botlevelitem-802190352.md) — struct
<a id="function-function-mq3-botlib-ai-level-items-copyvector-function-copyvector-value-src-mq3-botlib-ai-level-items-ml-291229009"></a>
### copyVector

```ml
function copyVector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai level items.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L86)

<a id="function-function-mq3-botlib-ai-level-items-create-function-create-itemruntime-src-mq3-botlib-ai-level-items-ml-409833397"></a>
### create

```ml
function create(itemRuntime)
```

Create a `mq3.botlib.ai_level_items.LevelItemRuntime` record, initializing `itemRuntime` from `itemRuntime` and `maxLevelItems` as `MAX_LEVEL_ITEMS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemRuntime` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_level_items.LevelItemRuntime.itemRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L89)

<a id="function-function-mq3-botlib-ai-level-items-currenttime-function-currenttime-state-src-mq3-botlib-ai-level-items-ml-1232350941"></a>
### currentTime

```ml
function currentTime(state)
```

Apply `mq3.botlib.aas_runtime.getTime` while evaluating `currentTime`. Return paths include `aasRuntime.getTime(state.aas)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `aas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L231)

<a id="function-function-mq3-botlib-ai-level-items-defaultplace-function-defaultplace-state-origin-mins-maxs-floating-src-mq3-botlib-ai-level-items-ml-763670723"></a>
### defaultPlace

```ml
function defaultPlace(state, origin, mins, maxs, floating)
```

Apply `mq3.botlib.ai_level_items.copyVector`, `mq3.botlib.aas_runtime.pointAreaNum` and `mq3.botlib.aas_runtime.bboxAreas` while evaluating `defaultPlace`. Return paths include `[area,candidate]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `aas`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `floating` | `dynamic` | — | Not read by this implementation; retained in the `defaultPlace` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L152)

<a id="function-function-mq3-botlib-ai-level-items-distance-function-distance-a-b-src-mq3-botlib-ai-level-items-ml-1600235779"></a>
### distance

```ml
function distance(a, b)
```

Calculate Euclidean distance between two three-component points for ai level items.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L143)

<a id="function-function-mq3-botlib-ai-level-items-epair-function-epair-state-entity-key-src-mq3-botlib-ai-level-items-ml-1204007435"></a>
### epair

```ml
function epair(state, entity, key)
```

Look up an entity key in the BSP key-value table and return a found flag with its text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `bspEntities`. |
| `entity` | `dynamic` | — | Value used by `epair` in `if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if`. |
| `key` | `dynamic` | — | Lookup text matched against `pair[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L113)

<a id="function-function-mq3-botlib-ai-level-items-equalvector-function-equalvector-a-b-src-mq3-botlib-ai-level-items-ml-2019471513"></a>
### equalVector

```ml
function equalVector(a, b)
```

Test `a[0]==b[0] and a[1]==b[1] and a[2]==b[2]` as the condition for `equalVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L139)

<a id="constant-constant-mq3-botlib-ai-level-items-et-item-const-et-item-2-src-mq3-botlib-ai-level-items-ml-796655751"></a>
### ET_ITEM

```ml
const ET_ITEM = 2
```

Network entity-type identifier for a collectible item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L19)

<a id="function-function-mq3-botlib-ai-level-items-findclass-function-findclass-items-classname-src-mq3-botlib-ai-level-items-ml-58823217"></a>
### findClass

```ml
function findClass(items, classname)
```

Find an item definition by exact class name and return its index, or -1 when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `classname` | `dynamic` | — | Value used by `findClass` in `for index=0 to len(items)-1 if items[index].classname==classname then return index end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L131)

<a id="function-function-mq3-botlib-ai-level-items-findmodel-function-findmodel-items-modelindex-src-mq3-botlib-ai-level-items-ml-1285305087"></a>
### findModel

```ml
function findModel(items, modelIndex)
```

Find an item definition by model index and return its table index, or -1 when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `modelIndex` | `dynamic` | — | Value used by `findModel` in `for index=0 to len(items)-1 if items[index].modelIndex==modelIndex then return index end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L135)

<a id="function-function-mq3-botlib-ai-level-items-goalname-function-goalname-state-number-src-mq3-botlib-ai-level-items-ml-190896992"></a>
### goalName

```ml
function goalName(state, number)
```

Apply `mq3.botlib.ai_item_weights.ensureItems` while evaluating `goalName`. Return paths include `items[levelItem.itemInfo].name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `itemRuntime` and `levelItems`. |
| `number` | `dynamic` | — | Value used by `goalName` in `for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name en...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L283)

<a id="constant-constant-mq3-botlib-ai-level-items-gt-single-player-const-gt-single-player-2-src-mq3-botlib-ai-level-items-ml-1661136213"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Game-mode identifier for single-player progression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L21)

<a id="constant-constant-mq3-botlib-ai-level-items-gt-team-const-gt-team-3-src-mq3-botlib-ai-level-items-ml-676450362"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Game-mode identifier for team deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L23)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notbot-const-ifl-notbot-8-src-mq3-botlib-ai-level-items-ml-1029173839"></a>
### IFL_NOTBOT

```ml
const IFL_NOTBOT = 8
```

Bot should never go for this.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L31)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notfree-const-ifl-notfree-1-src-mq3-botlib-ai-level-items-ml-1069787888"></a>
### IFL_NOTFREE

```ml
const IFL_NOTFREE = 1
```

Not in free for all.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L25)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notsingle-const-ifl-notsingle-4-src-mq3-botlib-ai-level-items-ml-1139947565"></a>
### IFL_NOTSINGLE

```ml
const IFL_NOTSINGLE = 4
```

Not in single player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L29)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-notteam-const-ifl-notteam-2-src-mq3-botlib-ai-level-items-ml-1472570363"></a>
### IFL_NOTTEAM

```ml
const IFL_NOTTEAM = 2
```

Not in team play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L27)

<a id="constant-constant-mq3-botlib-ai-level-items-ifl-roam-const-ifl-roam-16-src-mq3-botlib-ai-level-items-ml-510748128"></a>
### IFL_ROAM

```ml
const IFL_ROAM = 16
```

Bot roam goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L33)

<a id="function-function-mq3-botlib-ai-level-items-initialize-function-initialize-state-src-mq3-botlib-ai-level-items-ml-1777088133"></a>
### initialize

```ml
function initialize(state)
```

Update `state.levelItems`, `state.numLevelItems` and `state.initialized` during `initialize`. Return paths include `state.numLevelItems`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `itemRuntime`, `levelItems`, `numLevelItems`, `initialized` and `aas` and related fields. May update `state.levelItems`, `state.numLevelItems` and `state.initialized` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L196)

<a id="function-function-mq3-botlib-ai-level-items-intepair-function-intepair-state-entity-key-src-mq3-botlib-ai-level-items-ml-389308605"></a>
### intEpair

```ml
function intEpair(state, entity, key)
```

Apply `mq3.botlib.ai_level_items.epair` while evaluating `intEpair`. Return paths include `textNumbers.atoi(pair[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `bspEntities`. |
| `entity` | `dynamic` | — | Value used by `epair` in `if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L122)

<a id="function-function-mq3-botlib-ai-level-items-jumppadarea-function-jumppadarea-state-area-src-mq3-botlib-ai-level-items-ml-1746520964"></a>
### jumpPadArea

```ml
function jumpPadArea(state, area)
```

Apply `mq3.botlib.aas_runtime.areaInfo` while evaluating `jumpPadArea`. Return paths include `(areaInfo.contents&AREACONTENTS_JUMPPAD)!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `aas`. |
| `area` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L235)

- [mq3.botlib.ai_level_items.LevelItemRuntime](Type-mq3-botlib-ai-level-items-levelitemruntime-1611641085.md) — struct
<a id="constant-constant-mq3-botlib-ai-level-items-max-level-items-const-max-level-items-256-src-mq3-botlib-ai-level-items-ml-58997490"></a>
### MAX_LEVEL_ITEMS

```ml
const MAX_LEVEL_ITEMS = 256
```

Maximum number of item and roam-goal records tracked for one level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L17)

<a id="constant-constant-mq3-botlib-ai-level-items-op-init-level-items-const-op-init-level-items-541-src-mq3-botlib-ai-level-items-ml-572939857"></a>
### OP_INIT_LEVEL_ITEMS

```ml
const OP_INIT_LEVEL_ITEMS = 541
```

Bot-library syscall identifier for init level items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L13)

<a id="constant-constant-mq3-botlib-ai-level-items-op-update-entity-items-const-op-update-entity-items-542-src-mq3-botlib-ai-level-items-ml-1508249652"></a>
### OP_UPDATE_ENTITY_ITEMS

```ml
const OP_UPDATE_ENTITY_ITEMS = 542
```

Bot-library syscall identifier for update entity items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L15)

<a id="function-function-mq3-botlib-ai-level-items-permitted-function-permitted-state-item-src-mq3-botlib-ai-level-items-ml-126536154"></a>
### permitted

```ml
function permitted(state, item)
```

Apply single-player, team-game and free-for-all exclusion flags to a level item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `gameType`. |
| `item` | `dynamic` | — | Item record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L189)

<a id="function-function-mq3-botlib-ai-level-items-place-function-place-state-origin-mins-maxs-floating-src-mq3-botlib-ai-level-items-ml-382426133"></a>
### place

```ml
function place(state, origin, mins, maxs, floating)
```

Use `state.placeFn` to perform `place`. Return paths include `defaultPlace(state,origin,mins,maxs,floating)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `placeFn` and `callbackContext`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `floating` | `dynamic` | — | Value passed as argument 5 to `state.placeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L182)

<a id="function-function-mq3-botlib-ai-level-items-removeat-function-removeat-values-index-src-mq3-botlib-ai-level-items-ml-1013167650"></a>
### removeAt

```ml
function removeAt(values, index)
```

Return an item array with the selected position removed while preserving the order of the remaining entries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `removeAt`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L223)

<a id="function-function-mq3-botlib-ai-level-items-setgametype-function-setgametype-state-value-src-mq3-botlib-ai-level-items-ml-862523202"></a>
### setGameType

```ml
function setGameType(state, value)
```

Set `state.gameType` to `value` in `mq3.botlib.ai_level_items.setGameType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `gameType`. May update `state.gameType` in place. |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L108)

<a id="function-function-mq3-botlib-ai-level-items-shutdown-function-shutdown-state-src-mq3-botlib-ai-level-items-ml-49861629"></a>
### shutdown

```ml
function shutdown(state)
```

Update `state.levelItems`, `state.numLevelItems`, `state.initialized` and `state.aasEntities` and related state during `shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `levelItems`, `numLevelItems`, `initialized`, `aasEntities` and `aas`. May update `state.levelItems`, `state.numLevelItems` and `state.initialized` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L279)

<a id="function-function-mq3-botlib-ai-level-items-update-function-update-state-src-mq3-botlib-ai-level-items-ml-58784257"></a>
### update

```ml
function update(state)
```

Update `state.levelItems` during `update`. Return paths include `len(state.levelItems)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `initialized`, `itemRuntime`, `levelItems`, `aasEntities` and `maxLevelItems` and related fields. May update `state.levelItems` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L241)

<a id="function-function-mq3-botlib-ai-level-items-vectorepair-function-vectorepair-state-entity-key-src-mq3-botlib-ai-level-items-ml-80590433"></a>
### vectorEpair

```ml
function vectorEpair(state, entity, key)
```

Apply `mq3.botlib.ai_level_items.epair` while evaluating `vectorEpair`. Return paths include `[value[0]==3,value[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI level items state; accesses `bspEntities`. |
| `entity` | `dynamic` | — | Value used by `epair` in `if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_level_items.ml#L127)
