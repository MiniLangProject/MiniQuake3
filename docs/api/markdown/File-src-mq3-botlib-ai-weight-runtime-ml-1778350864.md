# `src/mq3/botlib/ai_weight_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_weight_runtime`](Package-mq3-botlib-ai-weight-runtime-215350408.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_item_weights.ml` as `weights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-weight-runtime-botshutdownweights-function-botshutdownweights-state-src-mq3-botlib-ai-weight-runtime-ml-578603217"></a>
### BotShutdownWeights

```ml
function BotShutdownWeights(state)
```

Forward `BotShutdownWeights` to `mq3.botlib.ai_weight_runtime.botShutdownWeights` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `weights`. May update `state.weights.configs` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L254)

<a id="function-function-mq3-botlib-ai-weight-runtime-botshutdownweights-function-botshutdownweights-state-src-mq3-botlib-ai-weight-runtime-ml-1108068881"></a>
### botShutdownWeights

```ml
function botShutdownWeights(state)
```

Set `state.weights.configs` to `[]` in `mq3.botlib.ai_weight_runtime.botShutdownWeights`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `weights`. May update `state.weights.configs` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L216)

<a id="function-function-mq3-botlib-ai-weight-runtime-centeredrandom-function-centeredrandom-state-src-mq3-botlib-ai-weight-runtime-ml-2078709889"></a>
### centeredRandom

```ml
function centeredRandom(state)
```

Return the result of `n.fsub(n.fmul(randomValue(state),2.0),1.0)` for `centeredRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L36)

<a id="function-function-mq3-botlib-ai-weight-runtime-create-function-create-context-readfn-writefn-randomfn-src-mq3-botlib-ai-weight-runtime-ml-633327789"></a>
### create

```ml
function create(context, readFn, writeFn, randomFn)
```

Create a `mq3.botlib.ai_weight_runtime.State` record, initializing `weights` as `weights.create(context,readFn)`, `context` from `context` and `writeFn` from `writeFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |
| `writeFn` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_weight_runtime.State.writeFn`. |
| `randomFn` | `dynamic` | — | Callback that supplies the random value used by selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L30)

<a id="function-function-mq3-botlib-ai-weight-runtime-evolvefuzzyseperator-r-function-evolvefuzzyseperator-r-state-separators-src-mq3-botlib-ai-weight-runtime-ml-1393018745"></a>
### evolveFuzzySeperator_r

```ml
function evolveFuzzySeperator_r(state, separators)
```

Evolution, scaling and interbreeding ----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |
| `separators` | `dynamic` | — | Value used by `evolveFuzzySeperator_r` in `if separators==void then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L126)

<a id="function-function-mq3-botlib-ai-weight-runtime-evolveweightconfig-function-evolveweightconfig-state-config-src-mq3-botlib-ai-weight-runtime-ml-489820867"></a>
### EvolveWeightConfig

```ml
function EvolveWeightConfig(state, config)
```

Forward `EvolveWeightConfig` to `mq3.botlib.ai_weight_runtime.evolveWeightConfig` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L246)

<a id="function-function-mq3-botlib-ai-weight-runtime-evolveweightconfig-function-evolveweightconfig-state-config-src-mq3-botlib-ai-weight-runtime-ml-735301507"></a>
### evolveWeightConfig

```ml
function evolveWeightConfig(state, config)
```

Apply `mq3.botlib.ai_weight_runtime.evolveFuzzySeperator_r` while evaluating `evolveWeightConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L136)

<a id="function-function-mq3-botlib-ai-weight-runtime-findfuzzyweight-function-findfuzzyweight-config-name-src-mq3-botlib-ai-weight-runtime-ml-122523159"></a>
### FindFuzzyWeight

```ml
function FindFuzzyWeight(config, name)
```

Exact be_ai_weight.h spellings for native-header consumers.  State-bearing operations keep the port's explicit owner as their leading argument.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L222)

<a id="function-function-mq3-botlib-ai-weight-runtime-findfuzzyweight-function-findfuzzyweight-config-name-src-mq3-botlib-ai-weight-runtime-ml-819118871"></a>
### findFuzzyWeight

```ml
function findFuzzyWeight(config, name)
```

Runtime evaluation -----------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L80)

<a id="function-function-mq3-botlib-ai-weight-runtime-freefuzzyseperators-r-function-freefuzzyseperators-r-separators-src-mq3-botlib-ai-weight-runtime-ml-987802612"></a>
### freeFuzzySeperators_r

```ml
function freeFuzzySeperators_r(separators)
```

Apply `mq3.botlib.ai_weight_runtime.freeFuzzySeperators_r` while evaluating `freeFuzzySeperators_r`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — | Value used by `freeFuzzySeperators_r` in `if separators==void then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L66)

<a id="function-function-mq3-botlib-ai-weight-runtime-freeweightconfig-function-freeweightconfig-state-config-src-mq3-botlib-ai-weight-runtime-ml-412673707"></a>
### freeWeightConfig

```ml
function freeWeightConfig(state, config)
```

Apply `mq3.botlib.ai_weight_runtime.freeWeightConfig2` while evaluating `freeWeightConfig`. Return paths include `freeWeightConfig2(config)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `weights`. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. May update `config.weights` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L75)

<a id="function-function-mq3-botlib-ai-weight-runtime-freeweightconfig2-function-freeweightconfig2-config-src-mq3-botlib-ai-weight-runtime-ml-1229961192"></a>
### freeWeightConfig2

```ml
function freeWeightConfig2(config)
```

Set `config.weights` to `[]` in `mq3.botlib.ai_weight_runtime.freeWeightConfig2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. May update `config.weights` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L71)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweight-function-fuzzyweight-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-1236932467"></a>
### FuzzyWeight

```ml
function FuzzyWeight(inventory, config, weightNumber)
```

Forward `FuzzyWeight` to `mq3.botlib.ai_weight_runtime.fuzzyWeight` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `weightNumber` | `dynamic` | — | Operand used to evaluate the returned expression `fuzzySeparators(inventory,config.weights[weightNumber].separators)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L227)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweight-function-fuzzyweight-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-509851315"></a>
### fuzzyWeight

```ml
function fuzzyWeight(inventory, config, weightNumber)
```

Forward `fuzzyWeight` to `mq3.botlib.ai_item_weights.fuzzyWeight` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `weightNumber` | `dynamic` | — | Operand used to evaluate the returned expression `fuzzySeparators(inventory,config.weights[weightNumber].separators)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L115)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweight-r-function-fuzzyweight-r-inventory-separators-src-mq3-botlib-ai-weight-runtime-ml-1115934044"></a>
### fuzzyWeight_r

```ml
function fuzzyWeight_r(inventory, separators)
```

Forward `fuzzyWeight_r` to `mq3.botlib.ai_item_weights.fuzzySeparators` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `separators` | `dynamic` | — | Array or byte sequence accessed at `index` and `index+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L84)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweightundecided-function-fuzzyweightundecided-state-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-676698598"></a>
### FuzzyWeightUndecided

```ml
function FuzzyWeightUndecided(state, inventory, config, weightNumber)
```

Forward `FuzzyWeightUndecided` to `mq3.botlib.ai_weight_runtime.fuzzyWeightUndecided` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `weightNumber` | `dynamic` | — | Operand used to evaluate the returned expression `fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L233)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweightundecided-function-fuzzyweightundecided-state-inventory-config-weightnumber-src-mq3-botlib-ai-weight-runtime-ml-240941606"></a>
### fuzzyWeightUndecided

```ml
function fuzzyWeightUndecided(state, inventory, config, weightNumber)
```

Apply `mq3.botlib.ai_weight_runtime.fuzzyWeightUndecided_r` while evaluating `fuzzyWeightUndecided`. Return paths include `fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `weightNumber` | `dynamic` | — | Operand used to evaluate the returned expression `fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L121)

<a id="function-function-mq3-botlib-ai-weight-runtime-fuzzyweightundecided-r-function-fuzzyweightundecided-r-state-inventory-separators-src-mq3-botlib-ai-weight-runtime-ml-1801111635"></a>
### fuzzyWeightUndecided_r

```ml
function fuzzyWeightUndecided_r(state, inventory, separators)
```

Forward `fuzzyWeightUndecided_r` to `mq3.botlib.ai_weight_runtime.undecidedAt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `separators` | `dynamic` | — | Array or byte sequence accessed at `index` and `index+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L110)

<a id="function-function-mq3-botlib-ai-weight-runtime-indent-function-indent-count-src-mq3-botlib-ai-weight-runtime-ml-1831707559"></a>
### indent

```ml
function indent(count)
```

The C writer is enclosed in #if 0 in the released source.  Keep its exact text format available behind an explicit, suppressible host write callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L185)

<a id="function-function-mq3-botlib-ai-weight-runtime-interbreedfuzzyseperator-r-function-interbreedfuzzyseperator-r-first-second-result-src-mq3-botlib-ai-weight-runtime-ml-1028194835"></a>
### interbreedFuzzySeperator_r

```ml
function interbreedFuzzySeperator_r(first, second, result)
```

Apply `mq3.botlib.ai_weight_runtime.interbreedFuzzySeperator_r` while evaluating `interbreedFuzzySeperator_r`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `second` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `result` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L166)

<a id="function-function-mq3-botlib-ai-weight-runtime-interbreedweightconfigs-function-interbreedweightconfigs-first-second-result-src-mq3-botlib-ai-weight-runtime-ml-1830579529"></a>
### InterbreedWeightConfigs

```ml
function InterbreedWeightConfigs(first, second, result)
```

Forward `InterbreedWeightConfigs` to `mq3.botlib.ai_weight_runtime.interbreedWeightConfigs` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First record; accesses `weights`. |
| `second` | `dynamic` | — | Second record; accesses `weights`. |
| `result` | `dynamic` | — | Result record; accesses `weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L251)

<a id="function-function-mq3-botlib-ai-weight-runtime-interbreedweightconfigs-function-interbreedweightconfigs-first-second-result-src-mq3-botlib-ai-weight-runtime-ml-255702665"></a>
### interbreedWeightConfigs

```ml
function interbreedWeightConfigs(first, second, result)
```

Apply `mq3.botlib.ai_weight_runtime.interbreedFuzzySeperator_r` while evaluating `interbreedWeightConfigs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First record; accesses `weights`. |
| `second` | `dynamic` | — | Second record; accesses `weights`. |
| `result` | `dynamic` | — | Result record; accesses `weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L178)

<a id="function-function-mq3-botlib-ai-weight-runtime-numbertext-function-numbertext-value-src-mq3-botlib-ai-weight-runtime-ml-1170991973"></a>
### numberText

```ml
function numberText(value)
```

Format a numeric fuzzy-weight value and remove a trailing decimal point when present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `str`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L188)

<a id="function-function-mq3-botlib-ai-weight-runtime-parserfail-function-parserfail-message-src-mq3-botlib-ai-weight-runtime-ml-500152603"></a>
### parserFail

```ml
function parserFail(message)
```

Parser and ownership ----------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L40)

<a id="function-function-mq3-botlib-ai-weight-runtime-randomvalue-function-randomvalue-state-src-mq3-botlib-ai-weight-runtime-ml-1393340761"></a>
### randomValue

```ml
function randomValue(state)
```

Use `state.randomFn` to perform `randomValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `randomFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L33)

<a id="function-function-mq3-botlib-ai-weight-runtime-readfuzzyseperators-r-function-readfuzzyseperators-r-reader-src-mq3-botlib-ai-weight-runtime-ml-701110777"></a>
### readFuzzySeperators_r

```ml
function readFuzzySeperators_r(reader)
```

Forward `readFuzzySeperators_r` to `mq3.botlib.ai_item_weights.readSeparators` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L59)

<a id="function-function-mq3-botlib-ai-weight-runtime-readfuzzyweight-function-readfuzzyweight-reader-src-mq3-botlib-ai-weight-runtime-ml-1464972299"></a>
### readFuzzyWeight

```ml
function readFuzzyWeight(reader)
```

Apply `mq3.botlib.ai_item_weights.take`, `mq3.botlib.ai_weight_runtime.parserFail` and `mq3.botlib.ai_item_weights.expect` while evaluating `readFuzzyWeight`. Return paths include `[0,weight,weight,weight]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L52)

<a id="function-function-mq3-botlib-ai-weight-runtime-readvalue-function-readvalue-reader-src-mq3-botlib-ai-weight-runtime-ml-1072181501"></a>
### readValue

```ml
function readValue(reader)
```

Forward `readValue` to `mq3.botlib.ai_weight_runtime.valueFromFirst` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L49)

<a id="function-function-mq3-botlib-ai-weight-runtime-readweightconfig-function-readweightconfig-state-filename-src-mq3-botlib-ai-weight-runtime-ml-1636603234"></a>
### readWeightConfig

```ml
function readWeightConfig(state, filename)
```

Forward `readWeightConfig` to `mq3.botlib.ai_item_weights.weightConfig` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `weights`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L63)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalebalancerange-function-scalebalancerange-config-scale-src-mq3-botlib-ai-weight-runtime-ml-1366864596"></a>
### ScaleBalanceRange

```ml
function ScaleBalanceRange(config, scale)
```

Forward `ScaleBalanceRange` to `mq3.botlib.ai_weight_runtime.scaleFuzzyBalanceRange` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L242)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalefuzzybalancerange-function-scalefuzzybalancerange-config-scale-src-mq3-botlib-ai-weight-runtime-ml-1225001694"></a>
### scaleFuzzyBalanceRange

```ml
function scaleFuzzyBalanceRange(config, scale)
```

Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperatorBalanceRange_r` while evaluating `scaleFuzzyBalanceRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L159)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalefuzzyseperator-r-function-scalefuzzyseperator-r-separators-scale-src-mq3-botlib-ai-weight-runtime-ml-211697640"></a>
### scaleFuzzySeperator_r

```ml
function scaleFuzzySeperator_r(separators, scale)
```

Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperator_r` while evaluating `scaleFuzzySeperator_r`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — | Value used by `scaleFuzzySeperator_r` in `if separators==void then return 0 end if`. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L140)

<a id="function-function-mq3-botlib-ai-weight-runtime-scalefuzzyseperatorbalancerange-r-function-scalefuzzyseperatorbalancerange-r-separators-scale-src-mq3-botlib-ai-weight-runtime-ml-24999286"></a>
### scaleFuzzySeperatorBalanceRange_r

```ml
function scaleFuzzySeperatorBalanceRange_r(separators, scale)
```

Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperatorBalanceRange_r` while evaluating `scaleFuzzySeperatorBalanceRange_r`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — | Value used by `scaleFuzzySeperatorBalanceRange_r` in `if separators==void then return 0 end if`. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L153)

<a id="function-function-mq3-botlib-ai-weight-runtime-scaleweight-function-scaleweight-config-name-scale-src-mq3-botlib-ai-weight-runtime-ml-820378109"></a>
### ScaleWeight

```ml
function ScaleWeight(config, name, scale)
```

Forward `ScaleWeight` to `mq3.botlib.ai_weight_runtime.scaleWeight` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L238)

<a id="function-function-mq3-botlib-ai-weight-runtime-scaleweight-function-scaleweight-config-name-scale-src-mq3-botlib-ai-weight-runtime-ml-558020733"></a>
### scaleWeight

```ml
function scaleWeight(config, name, scale)
```

Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperator_r` while evaluating `scaleWeight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |
| `name` | `dynamic` | — | Lookup text matched against `weight.name`. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L147)

- [mq3.botlib.ai_weight_runtime.State](Type-mq3-botlib-ai-weight-runtime-state-2107027319.md) — struct
<a id="function-function-mq3-botlib-ai-weight-runtime-undecidedat-function-undecidedat-state-inventory-separators-index-src-mq3-botlib-ai-weight-runtime-ml-787995993"></a>
### undecidedAt

```ml
function undecidedAt(state, inventory, separators, index)
```

Apply `mq3.botlib.ai_weight_runtime.fuzzyWeightUndecided_r`, `mq3.botlib.ai_weight_runtime.randomValue` and `mq3.botlib.ai_weight_runtime.fuzzyWeight_r` while evaluating `undecidedAt`. Return paths include `separator.weight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as argument 1 to `mq3.botlib.ai_weight_runtime.undecidedAt`. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `separators` | `dynamic` | — | Array or byte sequence accessed at `index` and `index+1`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L90)

<a id="function-function-mq3-botlib-ai-weight-runtime-valuefromfirst-function-valuefromfirst-reader-token-src-mq3-botlib-ai-weight-runtime-ml-1603101678"></a>
### valueFromFirst

```ml
function valueFromFirst(reader, token)
```

Apply `mq3.botlib.ai_weight_runtime.parserFail` and `mq3.botlib.ai_item_weights.take` while evaluating `valueFromFirst`. Return paths include `value.floatValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |
| `token` | `dynamic` | — | Value used by `valueFromFirst` in `value=token`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L44)

<a id="function-function-mq3-botlib-ai-weight-runtime-weightconfigtext-function-weightconfigtext-config-src-mq3-botlib-ai-weight-runtime-ml-1875913668"></a>
### weightConfigText

```ml
function weightConfigText(config)
```

Apply `mq3.botlib.ai_weight_runtime.writeFuzzySeperators_r`, `mq3.botlib.ai_weight_runtime.indent` and `mq3.botlib.ai_weight_runtime.writeFuzzyWeight` while evaluating `weightConfigText`. Return paths include `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L206)

<a id="function-function-mq3-botlib-ai-weight-runtime-writefuzzyseperators-r-function-writefuzzyseperators-r-separators-indentlevel-src-mq3-botlib-ai-weight-runtime-ml-576152054"></a>
### writeFuzzySeperators_r

```ml
function writeFuzzySeperators_r(separators, indentLevel)
```

Apply `mq3.botlib.ai_weight_runtime.indent`, `mq3.botlib.ai_weight_runtime.writeFuzzySeperators_r` and `mq3.botlib.ai_weight_runtime.writeFuzzyWeight` while evaluating `writeFuzzySeperators_r`. Return paths include `text+indent(indentLevel)+"} //end switch\n"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separators` | `dynamic` | — | Array or byte sequence accessed at `0` and `index`. |
| `indentLevel` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L197)

<a id="function-function-mq3-botlib-ai-weight-runtime-writefuzzyweight-function-writefuzzyweight-separator-src-mq3-botlib-ai-weight-runtime-ml-655754859"></a>
### writeFuzzyWeight

```ml
function writeFuzzyWeight(separator)
```

Apply `mq3.botlib.ai_weight_runtime.numberText` while evaluating `writeFuzzyWeight`. Return paths include `+numberText(separator.weight)+";\n"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `separator` | `dynamic` | — | Separator record; accesses `type`, `weight`, `minWeight` and `maxWeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L191)

<a id="function-function-mq3-botlib-ai-weight-runtime-writeweightconfig-function-writeweightconfig-state-filename-config-src-mq3-botlib-ai-weight-runtime-ml-1686428534"></a>
### writeWeightConfig

```ml
function writeWeightConfig(state, filename, config)
```

Use `state.writeFn` to perform `writeWeightConfig`. Return paths include `state.writeFn(state.context,filename,weightConfigText(config))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI weight runtime state; accesses `writeFn` and `context`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `config` | `dynamic` | — | Configuration record; accesses `weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L213)
