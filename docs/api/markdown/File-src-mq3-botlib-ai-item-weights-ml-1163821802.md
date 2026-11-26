# `src/mq3/botlib/ai_item_weights.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_item_weights`](Package-mq3-botlib-ai-item-weights-277749846.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-botlib-ai-item-weights-blerr-cannotloaditemweights-const-blerr-cannotloaditemweights-9-src-mq3-botlib-ai-item-weights-ml-1461875170"></a>
### BLERR_CANNOTLOADITEMWEIGHTS

```ml
const BLERR_CANNOTLOADITEMWEIGHTS = 9
```

Bot-library error indicating that an item-weight script could not be loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L14)

<a id="constant-constant-mq3-botlib-ai-item-weights-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-ai-item-weights-ml-1730865805"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```

Bot-library status indicating successful completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L12)

<a id="function-function-mq3-botlib-ai-item-weights-botpath-function-botpath-name-src-mq3-botlib-ai-item-weights-ml-306067159"></a>
### botPath

```ml
function botPath(name)
```

Normalize a ai item weights resource path by removing leading slashes and ensuring the botfiles prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L158)

<a id="function-function-mq3-botlib-ai-item-weights-cached-function-cached-runtime-filename-src-mq3-botlib-ai-item-weights-ml-1829343449"></a>
### cached

```ml
function cached(runtime, filename)
```

Find a previously loaded item-weight configuration by exact filename.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `configs`. |
| `filename` | `dynamic` | — | Lookup text matched against `config.filename`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L391)

<a id="function-function-mq3-botlib-ai-item-weights-close-function-close-reader-src-mq3-botlib-ai-item-weights-ml-1146017143"></a>
### close

```ml
function close(reader)
```

Apply `mq3.vm.pc_parser.free` while evaluating `close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L177)

<a id="function-function-mq3-botlib-ai-item-weights-computedfromfirst-function-computedfromfirst-reader-token-src-mq3-botlib-ai-item-weights-ml-126103680"></a>
### computedFromFirst

```ml
function computedFromFirst(reader, token)
```

Apply `mq3.botlib.ai_item_weights.readComputed`, `mq3.botlib.ai_item_weights.take` and `mq3.botlib.ai_item_weights.expect` while evaluating `computedFromFirst`. Return paths include `n.f32(token.floatValue)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |
| `token` | `dynamic` | — | Parsed token; accesses `text`, `type` and `floatValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L278)

<a id="function-function-mq3-botlib-ai-item-weights-create-function-create-context-readfn-src-mq3-botlib-ai-item-weights-ml-1833614891"></a>
### create

```ml
function create(context, readFn)
```

Create a `mq3.botlib.ai_item_weights.Runtime` record, initializing `context` from `context` and `readFn` from `readFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L125)

<a id="function-function-mq3-botlib-ai-item-weights-ensureitems-function-ensureitems-runtime-src-mq3-botlib-ai-item-weights-ml-1260647190"></a>
### ensureItems

```ml
function ensureItems(runtime)
```

Set `runtime.items` to `parseItems(runtime,"items.c")` in `mq3.botlib.ai_item_weights.ensureItems`. Return paths include `runtime.items`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `items`. May update `runtime.items` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L406)

- [mq3.botlib.ai_item_weights.Eval](Type-mq3-botlib-ai-item-weights-eval-1136597710.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-evaladd-function-evaladd-state-src-mq3-botlib-ai-item-weights-ml-2108671551"></a>
### evalAdd

```ml
function evalAdd(state)
```

Apply `mq3.botlib.ai_item_weights.evalMultiply` and `mq3.botlib.ai_item_weights.evalMatch` while evaluating `evalAdd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position` and `tokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L220)

<a id="function-function-mq3-botlib-ai-item-weights-evalbitwise-function-evalbitwise-state-src-mq3-botlib-ai-item-weights-ml-1534373823"></a>
### evalBitwise

```ml
function evalBitwise(state)
```

Apply `mq3.botlib.ai_item_weights.evalCompare` and `mq3.botlib.ai_item_weights.evalMatch` while evaluating `evalBitwise`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position` and `tokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L256)

<a id="function-function-mq3-botlib-ai-item-weights-evalcompare-function-evalcompare-state-src-mq3-botlib-ai-item-weights-ml-1904488287"></a>
### evalCompare

```ml
function evalCompare(state)
```

Apply `mq3.botlib.ai_item_weights.evalAdd` and `mq3.botlib.ai_item_weights.evalMatch` while evaluating `evalCompare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position` and `tokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L232)

<a id="function-function-mq3-botlib-ai-item-weights-evalconditional-function-evalconditional-state-src-mq3-botlib-ai-item-weights-ml-2108767533"></a>
### evalConditional

```ml
function evalConditional(state)
```

Set `state.valid` to `false` in `mq3.botlib.ai_item_weights.evalConditional`. Return paths include `no`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `valid`. May update `state.valid` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L266)

<a id="function-function-mq3-botlib-ai-item-weights-evalmatch-function-evalmatch-state-text-src-mq3-botlib-ai-item-weights-ml-345618298"></a>
### evalMatch

```ml
function evalMatch(state, text)
```

Set `state.position` to `state.position+1` in `mq3.botlib.ai_item_weights.evalMatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position` and `tokens`. May update `state.position` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L194)

<a id="function-function-mq3-botlib-ai-item-weights-evalmultiply-function-evalmultiply-state-src-mq3-botlib-ai-item-weights-ml-139419989"></a>
### evalMultiply

```ml
function evalMultiply(state)
```

Set `state.valid` to `false` in `mq3.botlib.ai_item_weights.evalMultiply`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position`, `tokens` and `valid`. May update `state.valid` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L211)

<a id="function-function-mq3-botlib-ai-item-weights-evalprimary-function-evalprimary-state-src-mq3-botlib-ai-item-weights-ml-1731014849"></a>
### evalPrimary

```ml
function evalPrimary(state)
```

Set `state.valid` to `false` in `mq3.botlib.ai_item_weights.evalPrimary`. Return paths include `token.floatValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `valid`. May update `state.valid` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L197)

<a id="function-function-mq3-botlib-ai-item-weights-evaltake-function-evaltake-state-src-mq3-botlib-ai-item-weights-ml-660177141"></a>
### evalTake

```ml
function evalTake(state)
```

Set `state.valid` to `false` and `state.position` to `state.position+1` in `mq3.botlib.ai_item_weights.evalTake`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position`, `tokens` and `valid`. May update `state.valid` and `state.position` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L190)

<a id="function-function-mq3-botlib-ai-item-weights-evaluate-function-evaluate-tokens-src-mq3-botlib-ai-item-weights-ml-840159940"></a>
### evaluate

```ml
function evaluate(tokens)
```

Apply `mq3.botlib.ai_item_weights.evalConditional` while evaluating `evaluate`. Return paths include `n.f32(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_item_weights.Eval.tokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L272)

<a id="function-function-mq3-botlib-ai-item-weights-evalunary-function-evalunary-state-src-mq3-botlib-ai-item-weights-ml-1812955231"></a>
### evalUnary

```ml
function evalUnary(state)
```

Apply `mq3.botlib.ai_item_weights.evalMatch`, `mq3.botlib.ai_item_weights.evalUnary` and `mq3.botlib.ai_item_weights.evalPrimary` while evaluating `evalUnary`. Return paths include `evalPrimary(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI item weights state; accesses `position` and `tokens`. May update `state.position` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L203)

<a id="function-function-mq3-botlib-ai-item-weights-expect-function-expect-reader-text-src-mq3-botlib-ai-item-weights-ml-619831610"></a>
### expect

```ml
function expect(reader, text)
```

Apply `mq3.botlib.ai_item_weights.take` while evaluating `expect`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L184)

<a id="function-function-mq3-botlib-ai-item-weights-fail-function-fail-message-src-mq3-botlib-ai-item-weights-ml-1173564951"></a>
### fail

```ml
function fail(message)
```

Construct error `7570` with diagnostic text `"AI item weights: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L121)

<a id="function-function-mq3-botlib-ai-item-weights-findweight-function-findweight-config-name-src-mq3-botlib-ai-item-weights-ml-2056022409"></a>
### findWeight

```ml
function findWeight(config, name)
```

Find the index of a named fuzzy weight, returning -1 when the configuration or weight is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `name` | `dynamic` | — | Lookup text matched against `config.weights[index].name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L383)

<a id="function-function-mq3-botlib-ai-item-weights-freeitemweights-function-freeitemweights-runtime-statepools-handle-src-mq3-botlib-ai-item-weights-ml-1712659688"></a>
### freeItemWeights

```ml
function freeItemWeights(runtime, statePools, handle)
```

Apply `mq3.botlib.ai_resource_pools.goalState` while evaluating `freeItemWeights`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Not read by this implementation; retained in the `freeItemWeights` signature. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L421)

<a id="function-function-mq3-botlib-ai-item-weights-fuzzyseparators-function-fuzzyseparators-inventory-separators-src-mq3-botlib-ai-item-weights-ml-644246750"></a>
### fuzzySeparators

```ml
function fuzzySeparators(inventory, separators)
```

Apply `mq3.botlib.ai_item_weights.separatorWeight` while evaluating `fuzzySeparators`. Return paths include `separatorWeight(inventory,separators,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `separators` | `dynamic` | — | Array or byte sequence accessed at `index` and `index+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L437)

<a id="function-function-mq3-botlib-ai-item-weights-fuzzyweight-function-fuzzyweight-inventory-config-weightnumber-src-mq3-botlib-ai-item-weights-ml-1424945523"></a>
### fuzzyWeight

```ml
function fuzzyWeight(inventory, config, weightNumber)
```

Apply `mq3.botlib.ai_item_weights.fuzzySeparators` while evaluating `fuzzyWeight`. Return paths include `fuzzySeparators(inventory,config.weights[weightNumber].separators)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `weightNumber` | `dynamic` | — | Operand used to evaluate the returned expression `fuzzySeparators(inventory,config.weights[weightNumber].separators)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L442)

- [mq3.botlib.ai_item_weights.ItemInfo](Type-mq3-botlib-ai-item-weights-iteminfo-967266419.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-itemweightindex-function-itemweightindex-config-items-src-mq3-botlib-ai-item-weights-ml-1335058722"></a>
### itemWeightIndex

```ml
function itemWeightIndex(config, items)
```

Apply `mq3.botlib.ai_item_weights.findWeight` while evaluating `itemWeightIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `items` | `dynamic` | — | Value used by `itemWeightIndex` in `for each item in items result=result+[findWeight(config,item.classname)] end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L387)

<a id="function-function-mq3-botlib-ai-item-weights-loaditemweights-function-loaditemweights-runtime-statepools-handle-filename-src-mq3-botlib-ai-item-weights-ml-1012590259"></a>
### loadItemWeights

```ml
function loadItemWeights(runtime, statePools, handle, filename)
```

Apply `mq3.botlib.ai_resource_pools.goalState`, `mq3.botlib.ai_item_weights.weightConfig` and `mq3.botlib.ai_item_weights.ensureItems` while evaluating `loadItemWeights`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `reloadCharacters` and `configs`. May update `runtime.configs` in place. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L412)

<a id="function-function-mq3-botlib-ai-item-weights-loadtext-function-loadtext-runtime-name-src-mq3-botlib-ai-item-weights-ml-1054562959"></a>
### loadText

```ml
function loadText(runtime, name)
```

Set `runtime.fileReads` to `runtime.fileReads+1` in `mq3.botlib.ai_item_weights.loadText`. Return paths include `runtime.readFn(runtime.context,botPath(name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `readFn`, `fileReads` and `context`. May update `runtime.fileReads` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L165)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-inventoryvalue-const-max-inventoryvalue-999999-src-mq3-botlib-ai-item-weights-ml-859303161"></a>
### MAX_INVENTORYVALUE

```ml
const MAX_INVENTORYVALUE = 999999
```

Upper inventory threshold used when evaluating fuzzy-weight separators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L22)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-iteminfo-const-max-iteminfo-256-src-mq3-botlib-ai-item-weights-ml-1181481654"></a>
### MAX_ITEMINFO

```ml
const MAX_ITEMINFO = 256
```

Maximum number of item definitions in the bot item configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L16)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-weight-files-const-max-weight-files-128-src-mq3-botlib-ai-item-weights-ml-845203884"></a>
### MAX_WEIGHT_FILES

```ml
const MAX_WEIGHT_FILES = 128
```

Maximum number of fuzzy-weight files retained by the bot configuration cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L20)

<a id="constant-constant-mq3-botlib-ai-item-weights-max-weights-const-max-weights-128-src-mq3-botlib-ai-item-weights-ml-1564894892"></a>
### MAX_WEIGHTS

```ml
const MAX_WEIGHTS = 128
```

Maximum number of named fuzzy-weight expressions in a configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L18)

<a id="constant-constant-mq3-botlib-ai-item-weights-op-free-item-weights-const-op-free-item-weights-544-src-mq3-botlib-ai-item-weights-ml-1349560348"></a>
### OP_FREE_ITEM_WEIGHTS

```ml
const OP_FREE_ITEM_WEIGHTS = 544
```

Bot-library syscall identifier for free item weights.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L28)

<a id="constant-constant-mq3-botlib-ai-item-weights-op-load-item-weights-const-op-load-item-weights-543-src-mq3-botlib-ai-item-weights-ml-1799544485"></a>
### OP_LOAD_ITEM_WEIGHTS

```ml
const OP_LOAD_ITEM_WEIGHTS = 543
```

Bot-library syscall identifier for load item weights.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L26)

<a id="function-function-mq3-botlib-ai-item-weights-open-function-open-runtime-name-src-mq3-botlib-ai-item-weights-ml-1022866927"></a>
### open

```ml
function open(runtime, name)
```

Build the `mq3.botlib.ai_item_weights.Reader` result for `open`. Return paths include `Reader(registry,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L172)

<a id="function-function-mq3-botlib-ai-item-weights-parseitems-function-parseitems-runtime-name-src-mq3-botlib-ai-item-weights-ml-1662087135"></a>
### parseItems

```ml
function parseItems(runtime, name)
```

Apply `mq3.botlib.ai_item_weights.open`, `mq3.botlib.ai_item_weights.take` and `mq3.botlib.ai_item_weights.close` while evaluating `parseItems`. Return paths include `fail("unknown item field "+field.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `qvmInventory`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L309)

<a id="function-function-mq3-botlib-ai-item-weights-parseweightconfig-function-parseweightconfig-runtime-filename-src-mq3-botlib-ai-item-weights-ml-1242150499"></a>
### parseWeightConfig

```ml
function parseWeightConfig(runtime, filename)
```

Build the `mq3.botlib.ai_item_weights.WeightConfig` result for `parseWeightConfig`. Return paths include `fail("unterminated weight body")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `qvmInventory`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L363)

<a id="function-function-mq3-botlib-ai-item-weights-qvminventoryindex-function-qvminventoryindex-index-src-mq3-botlib-ai-item-weights-ml-1716390458"></a>
### qvmInventoryIndex

```ml
function qvmInventoryIndex(index)
```

Translate native inventory indices to the QVM inventory layout, preserving indices without a remapping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L134)

<a id="function-function-mq3-botlib-ai-item-weights-readcomputed-function-readcomputed-reader-src-mq3-botlib-ai-item-weights-ml-2030156623"></a>
### readComputed

```ml
function readComputed(reader)
```

Forward `readComputed` to `mq3.botlib.ai_item_weights.computedFromFirst` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L294)

- [mq3.botlib.ai_item_weights.Reader](Type-mq3-botlib-ai-item-weights-reader-738797067.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-readfuzzyweight-function-readfuzzyweight-reader-src-mq3-botlib-ai-item-weights-ml-2058903027"></a>
### readFuzzyWeight

```ml
function readFuzzyWeight(reader)
```

Apply `mq3.botlib.ai_item_weights.take`, `mq3.botlib.ai_item_weights.expect` and `mq3.botlib.ai_item_weights.readComputed` while evaluating `readFuzzyWeight`. Return paths include `[0,weight,weight,weight]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L331)

<a id="function-function-mq3-botlib-ai-item-weights-readinteger-function-readinteger-reader-src-mq3-botlib-ai-item-weights-ml-1798860315"></a>
### readInteger

```ml
function readInteger(reader)
```

Apply `mq3.botlib.ai_item_weights.readComputed` while evaluating `readInteger`. Return paths include `n.trunc32(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L297)

<a id="function-function-mq3-botlib-ai-item-weights-readseparators-function-readseparators-reader-src-mq3-botlib-ai-item-weights-ml-228758831"></a>
### readSeparators

```ml
function readSeparators(reader)
```

Apply `mq3.botlib.ai_item_weights.expect`, `mq3.botlib.ai_item_weights.readInteger` and `mq3.botlib.ai_item_weights.take` while evaluating `readSeparators`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L343)

<a id="function-function-mq3-botlib-ai-item-weights-readvector-function-readvector-reader-src-mq3-botlib-ai-item-weights-ml-1904615503"></a>
### readVector

```ml
function readVector(reader)
```

Apply `mq3.botlib.ai_item_weights.expect` and `mq3.botlib.ai_item_weights.readComputed` while evaluating `readVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L300)

- [mq3.botlib.ai_item_weights.Runtime](Type-mq3-botlib-ai-item-weights-runtime-1588812156.md) — struct
- [mq3.botlib.ai_item_weights.Separator](Type-mq3-botlib-ai-item-weights-separator-240953263.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-separatorweight-function-separatorweight-inventory-separators-index-src-mq3-botlib-ai-item-weights-ml-890100020"></a>
### separatorWeight

```ml
function separatorWeight(inventory, separators, index)
```

Apply `mq3.botlib.ai_item_weights.fuzzySeparators` and `mq3.botlib.ai_item_weights.separatorWeight` while evaluating `separatorWeight`. Return paths include `current.weight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `separators` | `dynamic` | — | Array or byte sequence accessed at `index` and `index+1`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L426)

<a id="function-function-mq3-botlib-ai-item-weights-setqvminventorylayout-function-setqvminventorylayout-runtime-enabled-src-mq3-botlib-ai-item-weights-ml-1780619537"></a>
### setQvmInventoryLayout

```ml
function setQvmInventoryLayout(runtime, enabled)
```

The shipped pak0 botfiles/inv.h predates the pinned 1.32b game/inv.h. Qagame fills inventory using the latter; translate retail profile indices once at parse time so the botlib reads the same slots as its caller.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `qvmInventory`. May update `runtime.qvmInventory` in place. |
| `enabled` | `dynamic` | — | Value used by `setQvmInventoryLayout` in `if runtime!=void then runtime.qvmInventory=enabled end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L131)

<a id="function-function-mq3-botlib-ai-item-weights-setreloadcharacters-function-setreloadcharacters-runtime-value-src-mq3-botlib-ai-item-weights-ml-1349990003"></a>
### setReloadCharacters

```ml
function setReloadCharacters(runtime, value)
```

ReadWeightConfig and FreeWeightConfig use the global bot_reloadcharacters libvar in the released botlib. Keep that policy on the shared fuzzy-weight runtime so item and weapon profiles observe the same ownership mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `reloadCharacters`. May update `runtime.reloadCharacters` in place. |
| `value` | `dynamic` | — | Value used by `setReloadCharacters` in `if runtime!=void then runtime.reloadCharacters=value!=0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L155)

<a id="function-function-mq3-botlib-ai-item-weights-shutdown-function-shutdown-runtime-src-mq3-botlib-ai-item-weights-ml-2035362054"></a>
### shutdown

```ml
function shutdown(runtime)
```

Set `runtime.items` to `void` and `runtime.configs` to `[]` in `mq3.botlib.ai_item_weights.shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `items` and `configs`. May update `runtime.items` and `runtime.configs` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L445)

<a id="function-function-mq3-botlib-ai-item-weights-take-function-take-reader-src-mq3-botlib-ai-item-weights-ml-1241287299"></a>
### take

```ml
function take(reader)
```

Forward `take` to `mq3.vm.pc_parser.read` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L180)

<a id="function-function-mq3-botlib-ai-item-weights-translateseparators-function-translateseparators-separators-src-mq3-botlib-ai-item-weights-ml-1772342974"></a>
### translateSeparators

```ml
function translateSeparators(separators)
```

Apply `mq3.botlib.ai_item_weights.qvmInventoryIndex` and `mq3.botlib.ai_item_weights.translateSeparators` while evaluating `translateSeparators`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — | Value used by `translateSeparators` in `if separators==void then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L142)

<a id="function-function-mq3-botlib-ai-item-weights-truth-function-truth-value-src-mq3-botlib-ai-item-weights-ml-1849732347"></a>
### truth

```ml
function truth(value)
```

Test `value!=0.0` as the condition for `truth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value!=0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L229)

- [mq3.botlib.ai_item_weights.Weight](Type-mq3-botlib-ai-item-weights-weight-580247880.md) — struct
<a id="function-function-mq3-botlib-ai-item-weights-weightconfig-function-weightconfig-runtime-filename-src-mq3-botlib-ai-item-weights-ml-50108977"></a>
### weightConfig

```ml
function weightConfig(runtime, filename)
```

Set `runtime.configs` to `runtime.configs+[config]` in `mq3.botlib.ai_item_weights.weightConfig`. Return paths include `config`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `reloadCharacters` and `configs`. May update `runtime.configs` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L395)

- [mq3.botlib.ai_item_weights.WeightConfig](Type-mq3-botlib-ai-item-weights-weightconfig-709290726.md) — struct
<a id="constant-constant-mq3-botlib-ai-item-weights-wt-balance-const-wt-balance-1-src-mq3-botlib-ai-item-weights-ml-1222326604"></a>
### WT_BALANCE

```ml
const WT_BALANCE = 1
```

Fuzzy-weight node kind whose value can be adjusted during weight balancing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L24)
