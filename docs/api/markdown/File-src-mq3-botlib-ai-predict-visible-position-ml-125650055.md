# `src/mq3/botlib/ai_predict_visible_position.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_predict_visible_position`](Package-mq3-botlib-ai-predict-visible-position-855450653.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_routing.ml` as `routing` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/ai_resource_pools.ml` as `resources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

## Declarations

<a id="constant-constant-mq3-botlib-ai-predict-visible-position-contents-solid-playerclip-const-contents-solid-playerclip-65537-src-mq3-botlib-ai-predict-visible-position-ml-1454675973"></a>
### CONTENTS_SOLID_PLAYERCLIP

```ml
const CONTENTS_SOLID_PLAYERCLIP = 65537
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L10)

<a id="function-function-mq3-botlib-ai-predict-visible-position-copyvector-function-copyvector-value-src-mq3-botlib-ai-predict-visible-position-ml-2094431555"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L16)

<a id="function-function-mq3-botlib-ai-predict-visible-position-create-function-create-router-context-tracefn-src-mq3-botlib-ai-predict-visible-position-ml-24007345"></a>
### create

```ml
function create(router, context, traceFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `traceFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L15)

<a id="constant-constant-mq3-botlib-ai-predict-visible-position-max-hops-const-max-hops-20-src-mq3-botlib-ai-predict-visible-position-ml-34502443"></a>
### MAX_HOPS

```ml
const MAX_HOPS = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L11)

<a id="function-function-mq3-botlib-ai-predict-visible-position-nextreachability-function-nextreachability-runtime-origin-areanum-lastgoalareanum-lastareanum-goal-travelflags-src-mq3-botlib-ai-predict-visible-position-ml-1484436946"></a>
### nextReachability

```ml
function nextReachability(runtime, origin, areaNum, lastGoalAreaNum, lastAreaNum, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `lastGoalAreaNum` | `dynamic` | — |  |
| `lastAreaNum` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L24)

<a id="constant-constant-mq3-botlib-ai-predict-visible-position-op-predict-visible-position-const-op-predict-visible-position-572-src-mq3-botlib-ai-predict-visible-position-ml-1584133457"></a>
### OP_PREDICT_VISIBLE_POSITION

```ml
const OP_PREDICT_VISIBLE_POSITION = 572
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L9)

<a id="function-function-mq3-botlib-ai-predict-visible-position-predict-function-predict-runtime-origin-areanum-goal-travelflags-src-mq3-botlib-ai-predict-visible-position-ml-219963169"></a>
### predict

```ml
function predict(runtime, origin, areaNum, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L38)

- [mq3.botlib.ai_predict_visible_position.Result](Type-mq3-botlib-ai-predict-visible-position-result-560751592.md) — struct
- [mq3.botlib.ai_predict_visible_position.Runtime](Type-mq3-botlib-ai-predict-visible-position-runtime-1716822191.md) — struct
<a id="function-function-mq3-botlib-ai-predict-visible-position-valid-function-valid-runtime-areanum-src-mq3-botlib-ai-predict-visible-position-ml-1694657983"></a>
### valid

```ml
function valid(runtime, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L17)

<a id="function-function-mq3-botlib-ai-predict-visible-position-visible-function-visible-runtime-goal-point-src-mq3-botlib-ai-predict-visible-position-ml-593120151"></a>
### visible

```ml
function visible(runtime, goal, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L18)
