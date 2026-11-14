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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L8)

<a id="function-function-mq3-botlib-ai-genetic-parentsandchild-function-parentsandchild-runtime-numranks-ranks-src-mq3-botlib-ai-genetic-ml-1513347306"></a>
### parentsAndChild

```ml
function parentsAndChild(runtime, numRanks, ranks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `numRanks` | `dynamic` | — |  |
| `ranks` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L33)

<a id="function-function-mq3-botlib-ai-genetic-randomfloat-function-randomfloat-runtime-src-mq3-botlib-ai-genetic-ml-888286542"></a>
### randomFloat

```ml
function randomFloat(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L10)

<a id="function-function-mq3-botlib-ai-genetic-selection-function-selection-runtime-numranks-rankings-src-mq3-botlib-ai-genetic-ml-683098552"></a>
### selection

```ml
function selection(runtime, numRanks, rankings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `numRanks` | `dynamic` | — |  |
| `rankings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_genetic.ml#L17)
