# `src/mq3/botlib/ai_weight_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_weight_runtime`](Package-mq3-botlib-ai-weight-runtime-215350408.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_item_weights.ml` as `weights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-weight-runtime-botshutdownweights-function-botshutdownweights-state-src-mq3-botlib-ai-weight-runtime-ml-578603217"></a>
### BotShutdownWeights

```ml
function BotShutdownWeights(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L121)

<a id="function-function-mq3-botlib-ai-weight-runtime-botshutdownweights-function-botshutdownweights-state-src-mq3-botlib-ai-weight-runtime-ml-1108068881"></a>
### botShutdownWeights

```ml
function botShutdownWeights(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L110)

<a id="function-function-mq3-botlib-ai-weight-runtime-centeredrandom-function-centeredrandom-state-src-mq3-botlib-ai-weight-runtime-ml-2078709889"></a>
### centeredRandom

```ml
function centeredRandom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L15)

<a id="function-function-mq3-botlib-ai-weight-runtime-create-function-create-context-readfn-writefn-randomfn-src-mq3-botlib-ai-weight-runtime-ml-633327789"></a>
### create

```ml
function create(context, readFn, writeFn, randomFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `writeFn` | `dynamic` | — |  |
| `randomFn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L13)

<a id="function-function-mq3-botlib-ai-weight-runtime-evolvefuzzyseperator-r-function-evolvefuzzyseperator-r-state-separators-src-mq3-botlib-ai-weight-runtime-ml-1393018745"></a>
### evolveFuzzySeperator_r

```ml
function evolveFuzzySeperator_r(state, separators)
```

Evolution, scaling and interbreeding ----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L60)

<a id="function-function-mq3-botlib-ai-weight-runtime-evolveweightconfig-function-evolveweightconfig-state-config-src-mq3-botlib-ai-weight-runtime-ml-489820867"></a>
### EvolveWeightConfig

```ml
function EvolveWeightConfig(state, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L119)

<a id="function-function-mq3-botlib-ai-weight-runtime-evolveweightconfig-function-evolveweightconfig-state-config-src-mq3-botlib-ai-weight-runtime-ml-735301507"></a>
### evolveWeightConfig

```ml
function evolveWeightConfig(state, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L67)

<a id="function-function-mq3-botlib-ai-weight-runtime-findfuzzyweight-function-findfuzzyweight-config-name-src-mq3-botlib-ai-weight-runtime-ml-122523159"></a>
### FindFuzzyWeight

```ml
function FindFuzzyWeight(config, name)
```

Exact be_ai_weight.h spellings for native-header consumers.  State-bearing operations keep the port's explicit owner as their leading argument.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L114)

<a id="function-function-mq3-botlib-ai-weight-runtime-findfuzzyweight-function-findfuzzyweight-config-name-src-mq3-botlib-ai-weight-runtime-ml-819118871"></a>
### findFuzzyWeight

```ml
function findFuzzyWeight(config, name)
```

Runtime evaluation -----------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L37)

<a id="function-function-mq3-botlib-ai-weight-runtime-freefuzzyseperators-r-function-freefuzzyseperators-r-separators-src-mq3-botlib-ai-weight-runtime-ml-987802612"></a>
### freeFuzzySeperators_r

```ml
function freeFuzzySeperators_r(separators)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L30)

<a id="function-function-mq3-botlib-ai-weight-runtime-freeweightconfig-function-freeweightconfig-state-config-src-mq3-botlib-ai-weight-runtime-ml-412673707"></a>
### freeWeightConfig

```ml
function freeWeightConfig(state, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L34)

<a id="function-function-mq3-botlib-ai-weight-runtime-freeweightconfig2-function-freeweightconfig2-config-src-mq3-botlib-ai-weight-runtime-ml-1229961192"></a>
### freeWeightConfig2

```ml
function freeWeightConfig2(config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L33)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweight-function-fuzzyweight-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-1236932467"></a>
### FuzzyWeight

```ml
function FuzzyWeight(inventory, config, weightNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `weightNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L115)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweight-function-fuzzyweight-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-509851315"></a>
### fuzzyWeight

```ml
function fuzzyWeight(inventory, config, weightNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `weightNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L56)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweight-r-function-fuzzyweight-r-inventory-separators-src-mq3-botlib-ai-weight-runtime-ml-1115934044"></a>
### fuzzyWeight_r

```ml
function fuzzyWeight_r(inventory, separators)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L38)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweightundecided-function-fuzzyweightundecided-state-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-676698598"></a>
### FuzzyWeightUndecided

```ml
function FuzzyWeightUndecided(state, inventory, config, weightNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `weightNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L116)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweightundecided-function-fuzzyweightundecided-state-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-240941606"></a>
### fuzzyWeightUndecided

```ml
function fuzzyWeightUndecided(state, inventory, config, weightNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `weightNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L57)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweightundecided-r-function-fuzzyweightundecided-r-state-inventory-separators-src-mq3-botlib-ai-weight-runtime-ml-1801111635"></a>
### fuzzyWeightUndecided_r

```ml
function fuzzyWeightUndecided_r(state, inventory, separators)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L55)

<a id="function-function-mq3-botlib-ai-weight-runtime-indent-function-indent-count-src-mq3-botlib-ai-weight-runtime-ml-1831707559"></a>
### indent

```ml
function indent(count)
```

The C writer is enclosed in #if 0 in the released source.  Keep its exact text format available behind an explicit, suppressible host write callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L94)

<a id="function-function-mq3-botlib-ai-weight-runtime-interbreedfuzzyseperator-r-function-interbreedfuzzyseperator-r-first-second-result-src-mq3-botlib-ai-weight-runtime-ml-1028194835"></a>
### interbreedFuzzySeperator_r

```ml
function interbreedFuzzySeperator_r(first, second, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L80)

<a id="function-function-mq3-botlib-ai-weight-runtime-interbreedweightconfigs-function-interbreedweightconfigs-first-second-result-src-mq3-botlib-ai-weight-runtime-ml-1830579529"></a>
### InterbreedWeightConfigs

```ml
function InterbreedWeightConfigs(first, second, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L120)

<a id="function-function-mq3-botlib-ai-weight-runtime-interbreedweightconfigs-function-interbreedweightconfigs-first-second-result-src-mq3-botlib-ai-weight-runtime-ml-255702665"></a>
### interbreedWeightConfigs

```ml
function interbreedWeightConfigs(first, second, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L88)

<a id="function-function-mq3-botlib-ai-weight-runtime-numbertext-function-numbertext-value-src-mq3-botlib-ai-weight-runtime-ml-1170991973"></a>
### numberText

```ml
function numberText(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L95)

<a id="function-function-mq3-botlib-ai-weight-runtime-parserfail-function-parserfail-message-src-mq3-botlib-ai-weight-runtime-ml-500152603"></a>
### parserFail

```ml
function parserFail(message)
```

Parser and ownership ----------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L18)

<a id="function-function-mq3-botlib-ai-weight-runtime-randomvalue-function-randomvalue-state-src-mq3-botlib-ai-weight-runtime-ml-1393340761"></a>
### randomValue

```ml
function randomValue(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L14)

<a id="function-function-mq3-botlib-ai-weight-runtime-readfuzzyseperators-r-function-readfuzzyseperators-r-reader-src-mq3-botlib-ai-weight-runtime-ml-701110777"></a>
### readFuzzySeperators_r

```ml
function readFuzzySeperators_r(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L28)

<a id="function-function-mq3-botlib-ai-weight-runtime-readfuzzyweight-function-readfuzzyweight-reader-src-mq3-botlib-ai-weight-runtime-ml-1464972299"></a>
### readFuzzyWeight

```ml
function readFuzzyWeight(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L23)

<a id="function-function-mq3-botlib-ai-weight-runtime-readvalue-function-readvalue-reader-src-mq3-botlib-ai-weight-runtime-ml-1072181501"></a>
### readValue

```ml
function readValue(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L22)

<a id="function-function-mq3-botlib-ai-weight-runtime-readweightconfig-function-readweightconfig-state-filename-src-mq3-botlib-ai-weight-runtime-ml-1636603234"></a>
### readWeightConfig

```ml
function readWeightConfig(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L29)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalebalancerange-function-scalebalancerange-config-scale-src-mq3-botlib-ai-weight-runtime-ml-1366864596"></a>
### ScaleBalanceRange

```ml
function ScaleBalanceRange(config, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L118)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalefuzzybalancerange-function-scalefuzzybalancerange-config-scale-src-mq3-botlib-ai-weight-runtime-ml-1225001694"></a>
### scaleFuzzyBalanceRange

```ml
function scaleFuzzyBalanceRange(config, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L77)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalefuzzyseperator-r-function-scalefuzzyseperator-r-separators-scale-src-mq3-botlib-ai-weight-runtime-ml-211697640"></a>
### scaleFuzzySeperator_r

```ml
function scaleFuzzySeperator_r(separators, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L68)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalefuzzyseperatorbalancerange-r-function-scalefuzzyseperatorbalancerange-r-separators-scale-src-mq3-botlib-ai-weight-runtime-ml-24999286"></a>
### scaleFuzzySeperatorBalanceRange_r

```ml
function scaleFuzzySeperatorBalanceRange_r(separators, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L74)

<a id="function-function-mq3-botlib-ai-weight-runtime-scaleweight-function-scaleweight-config-name-scale-src-mq3-botlib-ai-weight-runtime-ml-820378109"></a>
### ScaleWeight

```ml
function ScaleWeight(config, name, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L117)

<a id="function-function-mq3-botlib-ai-weight-runtime-scaleweight-function-scaleweight-config-name-scale-src-mq3-botlib-ai-weight-runtime-ml-558020733"></a>
### scaleWeight

```ml
function scaleWeight(config, name, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L71)

- [mq3.botlib.ai_weight_runtime.State](Type-mq3-botlib-ai-weight-runtime-state-2107027319.md) — struct
<a id="function-function-mq3-botlib-ai-weight-runtime-undecidedat-function-undecidedat-state-inventory-separators-index-src-mq3-botlib-ai-weight-runtime-ml-787995993"></a>
### undecidedAt

```ml
function undecidedAt(state, inventory, separators, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L39)

<a id="function-function-mq3-botlib-ai-weight-runtime-valuefromfirst-function-valuefromfirst-reader-token-src-mq3-botlib-ai-weight-runtime-ml-1603101678"></a>
### valueFromFirst

```ml
function valueFromFirst(reader, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L19)

<a id="function-function-mq3-botlib-ai-weight-runtime-weightconfigtext-function-weightconfigtext-config-src-mq3-botlib-ai-weight-runtime-ml-1875913668"></a>
### weightConfigText

```ml
function weightConfigText(config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L106)

<a id="function-function-mq3-botlib-ai-weight-runtime-writefuzzyseperators-r-function-writefuzzyseperators-r-separators-indentlevel-src-mq3-botlib-ai-weight-runtime-ml-576152054"></a>
### writeFuzzySeperators_r

```ml
function writeFuzzySeperators_r(separators, indentLevel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — |  |
| `indentLevel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L99)

<a id="function-function-mq3-botlib-ai-weight-runtime-writefuzzyweight-function-writefuzzyweight-separator-src-mq3-botlib-ai-weight-runtime-ml-655754859"></a>
### writeFuzzyWeight

```ml
function writeFuzzyWeight(separator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L96)

<a id="function-function-mq3-botlib-ai-weight-runtime-writeweightconfig-function-writeweightconfig-state-filename-config-src-mq3-botlib-ai-weight-runtime-ml-1686428534"></a>
### writeWeightConfig

```ml
function writeWeightConfig(state, filename, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weight_runtime.ml#L109)
