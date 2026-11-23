# `src/mq3/botlib/ai_item_weights.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_item_weights`](Package-mq3-botlib-ai-item-weights-277749846.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-botlib-ai-item-weights-blerr-cannotloaditemweights-const-blerr-cannotloaditemweights-9-src-mq3-botlib-ai-item-weights-ml-1461875170"></a>
### BLERR_CANNOTLOADITEMWEIGHTS

```ml
const BLERR_CANNOTLOADITEMWEIGHTS = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L12)

<a id="constant-constant-mq3-botlib-ai-item-weights-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-ai-item-weights-ml-1730865805"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L11)

<a id="function-function-mq3-botlib-ai-item-weights-botpath-function-botpath-name-src-mq3-botlib-ai-item-weights-ml-306067159"></a>
### botPath

```ml
function botPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L53)

<a id="function-function-mq3-botlib-ai-item-weights-cached-function-cached-runtime-filename-src-mq3-botlib-ai-item-weights-ml-1829343449"></a>
### cached

```ml
function cached(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L222)

<a id="function-function-mq3-botlib-ai-item-weights-close-function-close-reader-src-mq3-botlib-ai-item-weights-ml-1146017143"></a>
### close

```ml
function close(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L64)

<a id="function-function-mq3-botlib-ai-item-weights-computedfromfirst-function-computedfromfirst-reader-token-src-mq3-botlib-ai-item-weights-ml-126103680"></a>
### computedFromFirst

```ml
function computedFromFirst(reader, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L134)

<a id="function-function-mq3-botlib-ai-item-weights-create-function-create-context-readfn-src-mq3-botlib-ai-item-weights-ml-1833614891"></a>
### create

```ml
function create(context, readFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L30)

<a id="function-function-mq3-botlib-ai-item-weights-ensureitems-function-ensureitems-runtime-src-mq3-botlib-ai-item-weights-ml-1260647190"></a>
### ensureItems

```ml
function ensureItems(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L232)

- [mq3.botlib.ai_item_weights.Eval](Type-mq3-botlib-ai-item-weights-eval-1136597710.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-evaladd-function-evaladd-state-src-mq3-botlib-ai-item-weights-ml-2108671551"></a>
### evalAdd

```ml
function evalAdd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L89)

<a id="function-function-mq3-botlib-ai-item-weights-evalbitwise-function-evalbitwise-state-src-mq3-botlib-ai-item-weights-ml-1534373823"></a>
### evalBitwise

```ml
function evalBitwise(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L119)

<a id="function-function-mq3-botlib-ai-item-weights-evalcompare-function-evalcompare-state-src-mq3-botlib-ai-item-weights-ml-1904488287"></a>
### evalCompare

```ml
function evalCompare(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L97)

<a id="function-function-mq3-botlib-ai-item-weights-evalconditional-function-evalconditional-state-src-mq3-botlib-ai-item-weights-ml-2108767533"></a>
### evalConditional

```ml
function evalConditional(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L127)

<a id="function-function-mq3-botlib-ai-item-weights-evalmatch-function-evalmatch-state-text-src-mq3-botlib-ai-item-weights-ml-345618298"></a>
### evalMatch

```ml
function evalMatch(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L71)

<a id="function-function-mq3-botlib-ai-item-weights-evalmultiply-function-evalmultiply-state-src-mq3-botlib-ai-item-weights-ml-139419989"></a>
### evalMultiply

```ml
function evalMultiply(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L82)

<a id="function-function-mq3-botlib-ai-item-weights-evalprimary-function-evalprimary-state-src-mq3-botlib-ai-item-weights-ml-1731014849"></a>
### evalPrimary

```ml
function evalPrimary(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L72)

<a id="function-function-mq3-botlib-ai-item-weights-evaltake-function-evaltake-state-src-mq3-botlib-ai-item-weights-ml-660177141"></a>
### evalTake

```ml
function evalTake(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L70)

<a id="function-function-mq3-botlib-ai-item-weights-evaluate-function-evaluate-tokens-src-mq3-botlib-ai-item-weights-ml-840159940"></a>
### evaluate

```ml
function evaluate(tokens)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L131)

<a id="function-function-mq3-botlib-ai-item-weights-evalunary-function-evalunary-state-src-mq3-botlib-ai-item-weights-ml-1812955231"></a>
### evalUnary

```ml
function evalUnary(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L76)

<a id="function-function-mq3-botlib-ai-item-weights-expect-function-expect-reader-text-src-mq3-botlib-ai-item-weights-ml-619831610"></a>
### expect

```ml
function expect(reader, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L66)

<a id="function-function-mq3-botlib-ai-item-weights-fail-function-fail-message-src-mq3-botlib-ai-item-weights-ml-1173564951"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L29)

<a id="function-function-mq3-botlib-ai-item-weights-findweight-function-findweight-config-name-src-mq3-botlib-ai-item-weights-ml-2056022409"></a>
### findWeight

```ml
function findWeight(config, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L220)

<a id="function-function-mq3-botlib-ai-item-weights-freeitemweights-function-freeitemweights-runtime-statepools-handle-src-mq3-botlib-ai-item-weights-ml-1712659688"></a>
### freeItemWeights

```ml
function freeItemWeights(runtime, statePools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L238)

<a id="function-function-mq3-botlib-ai-item-weights-fuzzyseparators-function-fuzzyseparators-inventory-separators-src-mq3-botlib-ai-item-weights-ml-644246750"></a>
### fuzzySeparators

```ml
function fuzzySeparators(inventory, separators)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L247)

<a id="function-function-mq3-botlib-ai-item-weights-fuzzyweight-function-fuzzyweight-inventory-config-weightnumber-src-mq3-botlib-ai-item-weights-ml-1424945523"></a>
### fuzzyWeight

```ml
function fuzzyWeight(inventory, config, weightNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `weightNumber` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L248)

- [mq3.botlib.ai_item_weights.ItemInfo](Type-mq3-botlib-ai-item-weights-iteminfo-967266419.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-itemweightindex-function-itemweightindex-config-items-src-mq3-botlib-ai-item-weights-ml-1335058722"></a>
### itemWeightIndex

```ml
function itemWeightIndex(config, items)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L221)

<a id="function-function-mq3-botlib-ai-item-weights-loaditemweights-function-loaditemweights-runtime-statepools-handle-filename-src-mq3-botlib-ai-item-weights-ml-1012590259"></a>
### loadItemWeights

```ml
function loadItemWeights(runtime, statePools, handle, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L233)

<a id="function-function-mq3-botlib-ai-item-weights-loadtext-function-loadtext-runtime-name-src-mq3-botlib-ai-item-weights-ml-1054562959"></a>
### loadText

```ml
function loadText(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L57)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-inventoryvalue-const-max-inventoryvalue-999999-src-mq3-botlib-ai-item-weights-ml-859303161"></a>
### MAX_INVENTORYVALUE

```ml
const MAX_INVENTORYVALUE = 999999
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L16)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-iteminfo-const-max-iteminfo-256-src-mq3-botlib-ai-item-weights-ml-1181481654"></a>
### MAX_ITEMINFO

```ml
const MAX_ITEMINFO = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L13)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-weight-files-const-max-weight-files-128-src-mq3-botlib-ai-item-weights-ml-845203884"></a>
### MAX_WEIGHT_FILES

```ml
const MAX_WEIGHT_FILES = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L15)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-weights-const-max-weights-128-src-mq3-botlib-ai-item-weights-ml-1564894892"></a>
### MAX_WEIGHTS

```ml
const MAX_WEIGHTS = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L14)

<a id="constant-constant-mq3-botlib-ai-item-weights-op-free-item-weights-const-op-free-item-weights-544-src-mq3-botlib-ai-item-weights-ml-1349560348"></a>
### OP_FREE_ITEM_WEIGHTS

```ml
const OP_FREE_ITEM_WEIGHTS = 544
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L19)

<a id="constant-constant-mq3-botlib-ai-item-weights-op-load-item-weights-const-op-load-item-weights-543-src-mq3-botlib-ai-item-weights-ml-1799544485"></a>
### OP_LOAD_ITEM_WEIGHTS

```ml
const OP_LOAD_ITEM_WEIGHTS = 543
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L18)

<a id="function-function-mq3-botlib-ai-item-weights-open-function-open-runtime-name-src-mq3-botlib-ai-item-weights-ml-1022866927"></a>
### open

```ml
function open(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L61)

<a id="function-function-mq3-botlib-ai-item-weights-parseitems-function-parseitems-runtime-name-src-mq3-botlib-ai-item-weights-ml-1662087135"></a>
### parseItems

```ml
function parseItems(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L156)

<a id="function-function-mq3-botlib-ai-item-weights-parseweightconfig-function-parseweightconfig-runtime-filename-src-mq3-botlib-ai-item-weights-ml-1242150499"></a>
### parseWeightConfig

```ml
function parseWeightConfig(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L203)

<a id="function-function-mq3-botlib-ai-item-weights-qvminventoryindex-function-qvminventoryindex-index-src-mq3-botlib-ai-item-weights-ml-1716390458"></a>
### qvmInventoryIndex

```ml
function qvmInventoryIndex(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L35)

<a id="function-function-mq3-botlib-ai-item-weights-readcomputed-function-readcomputed-reader-src-mq3-botlib-ai-item-weights-ml-2030156623"></a>
### readComputed

```ml
function readComputed(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L148)

- [mq3.botlib.ai_item_weights.Reader](Type-mq3-botlib-ai-item-weights-reader-738797067.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-readfuzzyweight-function-readfuzzyweight-reader-src-mq3-botlib-ai-item-weights-ml-2058903027"></a>
### readFuzzyWeight

```ml
function readFuzzyWeight(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L176)

<a id="function-function-mq3-botlib-ai-item-weights-readinteger-function-readinteger-reader-src-mq3-botlib-ai-item-weights-ml-1798860315"></a>
### readInteger

```ml
function readInteger(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L149)

<a id="function-function-mq3-botlib-ai-item-weights-readseparators-function-readseparators-reader-src-mq3-botlib-ai-item-weights-ml-228758831"></a>
### readSeparators

```ml
function readSeparators(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L186)

<a id="function-function-mq3-botlib-ai-item-weights-readvector-function-readvector-reader-src-mq3-botlib-ai-item-weights-ml-1904615503"></a>
### readVector

```ml
function readVector(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L150)

- [mq3.botlib.ai_item_weights.Runtime](Type-mq3-botlib-ai-item-weights-runtime-1588812156.md) — struct
- [mq3.botlib.ai_item_weights.Separator](Type-mq3-botlib-ai-item-weights-separator-240953263.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-separatorweight-function-separatorweight-inventory-separators-index-src-mq3-botlib-ai-item-weights-ml-890100020"></a>
### separatorWeight

```ml
function separatorWeight(inventory, separators, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L239)

<a id="function-function-mq3-botlib-ai-item-weights-setqvminventorylayout-function-setqvminventorylayout-runtime-enabled-src-mq3-botlib-ai-item-weights-ml-1780619537"></a>
### setQvmInventoryLayout

```ml
function setQvmInventoryLayout(runtime, enabled)
```

The shipped pak0 botfiles/inv.h predates the pinned 1.32b game/inv.h. Qagame fills inventory using the latter; translate retail profile indices once at parse time so the botlib reads the same slots as its caller.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L34)

<a id="function-function-mq3-botlib-ai-item-weights-setreloadcharacters-function-setreloadcharacters-runtime-value-src-mq3-botlib-ai-item-weights-ml-1349990003"></a>
### setReloadCharacters

```ml
function setReloadCharacters(runtime, value)
```

ReadWeightConfig and FreeWeightConfig use the global bot_reloadcharacters libvar in the released botlib. Keep that policy on the shared fuzzy-weight runtime so item and weapon profiles observe the same ownership mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L52)

<a id="function-function-mq3-botlib-ai-item-weights-shutdown-function-shutdown-runtime-src-mq3-botlib-ai-item-weights-ml-2035362054"></a>
### shutdown

```ml
function shutdown(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L249)

<a id="function-function-mq3-botlib-ai-item-weights-take-function-take-reader-src-mq3-botlib-ai-item-weights-ml-1241287299"></a>
### take

```ml
function take(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L65)

<a id="function-function-mq3-botlib-ai-item-weights-translateseparators-function-translateseparators-separators-src-mq3-botlib-ai-item-weights-ml-1772342974"></a>
### translateSeparators

```ml
function translateSeparators(separators)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L41)

<a id="function-function-mq3-botlib-ai-item-weights-truth-function-truth-value-src-mq3-botlib-ai-item-weights-ml-1849732347"></a>
### truth

```ml
function truth(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L96)

- [mq3.botlib.ai_item_weights.Weight](Type-mq3-botlib-ai-item-weights-weight-580247880.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-weightconfig-function-weightconfig-runtime-filename-src-mq3-botlib-ai-item-weights-ml-50108977"></a>
### weightConfig

```ml
function weightConfig(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L223)

- [mq3.botlib.ai_item_weights.WeightConfig](Type-mq3-botlib-ai-item-weights-weightconfig-709290726.md) — struct
<a id="constant-constant-mq3-botlib-ai-item-weights-wt-balance-const-wt-balance-1-src-mq3-botlib-ai-item-weights-ml-1222326604"></a>
### WT_BALANCE

```ml
const WT_BALANCE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L17)
