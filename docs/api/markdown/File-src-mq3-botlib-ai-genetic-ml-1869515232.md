# `src/mq3/botlib/ai_genetic.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_genetic`](Package-mq3-botlib-ai-genetic-1259765798.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `geneticNumeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-botlib-ai-genetic-max-ranks-const-max-ranks-256-src-mq3-botlib-ai-genetic-ml-568339250"></a>
### MAX_RANKS

```ml
const MAX_RANKS = 256
```

Maximum number of fitness ranks processed by genetic parent and child selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L9)

<a id="function-function-mq3-botlib-ai-genetic-parentsandchild-function-parentsandchild-runtime-numranks-ranks-src-mq3-botlib-ai-genetic-ml-1513347306"></a>
### parentsAndChild

```ml
function parentsAndChild(runtime, numRanks, ranks)
```

Apply `mq3.botlib.ai_genetic.selection` while evaluating `parentsAndChild`. Return paths include `[1,parent1,parent2,child]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |
| `numRanks` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `ranks` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L44)

<a id="function-function-mq3-botlib-ai-genetic-randomfloat-function-randomfloat-runtime-src-mq3-botlib-ai-genetic-ml-888286542"></a>
### randomFloat

```ml
function randomFloat(runtime)
```

Update `runtime.randomSeed` during `randomFloat`. Return paths include `geneticNumeric.fdiv((geneticNumeric.u32(runtime.randomSeed)>>16)&32767,32767.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L13)

<a id="function-function-mq3-botlib-ai-genetic-selection-function-selection-runtime-numranks-rankings-src-mq3-botlib-ai-genetic-ml-683098552"></a>
### selection

```ml
function selection(runtime, numRanks, rankings)
```

Apply `mq3.botlib.ai_genetic.randomFloat` while evaluating `selection`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |
| `numRanks` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `rankings` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L24)
