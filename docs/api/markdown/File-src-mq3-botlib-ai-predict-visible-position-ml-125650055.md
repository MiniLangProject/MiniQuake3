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

Combined collision mask for solid geometry and player-only clipping volumes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L12)

<a id="function-function-mq3-botlib-ai-predict-visible-position-copyvector-function-copyvector-value-src-mq3-botlib-ai-predict-visible-position-ml-2094431555"></a>
### copyVector

```ml
function copyVector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai predict visible position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L43)

<a id="function-function-mq3-botlib-ai-predict-visible-position-create-function-create-router-context-tracefn-src-mq3-botlib-ai-predict-visible-position-ml-24007345"></a>
### create

```ml
function create(router, context, traceFn)
```

Create a `mq3.botlib.ai_predict_visible_position.Runtime` record, initializing `router` from `router`, `context` from `context` and `traceFn` from `traceFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_predict_visible_position.Runtime.router`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `traceFn` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_predict_visible_position.Runtime.traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L40)

<a id="constant-constant-mq3-botlib-ai-predict-visible-position-max-hops-const-max-hops-20-src-mq3-botlib-ai-predict-visible-position-ml-34502443"></a>
### MAX_HOPS

```ml
const MAX_HOPS = 20
```

Maximum reachability transitions explored while predicting a visible goal position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L14)

<a id="function-function-mq3-botlib-ai-predict-visible-position-nextreachability-function-nextreachability-runtime-origin-areanum-lastgoalareanum-lastareanum-goal-travelflags-src-mq3-botlib-ai-predict-visible-position-ml-1484436946"></a>
### nextReachability

```ml
function nextReachability(runtime, origin, areaNum, lastGoalAreaNum, lastAreaNum, goal, travelFlags)
```

Apply `mq3.botlib.ai_predict_visible_position.valid`, `mq3.botlib.aas_routing.edgeAllowed` and `mq3.botlib.aas_routing.areaTravelTimeToGoalArea` while evaluating `nextReachability`. Return paths include `bestReach`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI predict visible position runtime; accesses `router`. |
| `origin` | `dynamic` | — | Not read by this implementation; retained in the `nextReachability` signature. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `lastGoalAreaNum` | `dynamic` | — | Value used by `nextReachability` in `if lastGoalAreaNum==goal.areaNum and reach.areaNum==lastAreaNum then continue end if`. |
| `lastAreaNum` | `dynamic` | — | Previously visited AAS area number. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L66)

<a id="constant-constant-mq3-botlib-ai-predict-visible-position-op-predict-visible-position-const-op-predict-visible-position-572-src-mq3-botlib-ai-predict-visible-position-ml-1584133457"></a>
### OP_PREDICT_VISIBLE_POSITION

```ml
const OP_PREDICT_VISIBLE_POSITION = 572
```

Bot-library syscall identifier for predict visible position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L10)

<a id="function-function-mq3-botlib-ai-predict-visible-position-predict-function-predict-runtime-origin-areanum-goal-travelflags-src-mq3-botlib-ai-predict-visible-position-ml-219963169"></a>
### predict

```ml
function predict(runtime, origin, areaNum, goal, travelFlags)
```

Apply `mq3.botlib.ai_predict_visible_position.copyVector`, `mq3.botlib.ai_predict_visible_position.valid` and `mq3.botlib.ai_predict_visible_position.nextReachability` while evaluating `predict`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI predict visible position runtime; accesses `router`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L86)

- [mq3.botlib.ai_predict_visible_position.Result](Type-mq3-botlib-ai-predict-visible-position-result-560751592.md) — struct
- [mq3.botlib.ai_predict_visible_position.Runtime](Type-mq3-botlib-ai-predict-visible-position-runtime-1716822191.md) — struct
<a id="function-function-mq3-botlib-ai-predict-visible-position-valid-function-valid-runtime-areanum-src-mq3-botlib-ai-predict-visible-position-ml-1694657983"></a>
### valid

```ml
function valid(runtime, areaNum)
```

Test `runtime!=void and runtime.router!=void and runtime.router.runtime!=void and areaNum>0 and areaNum<len(runtime.router.settings)` as the condition for `valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI predict visible position runtime; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L47)

<a id="function-function-mq3-botlib-ai-predict-visible-position-visible-function-visible-runtime-goal-point-src-mq3-botlib-ai-predict-visible-position-ml-593120151"></a>
### visible

```ml
function visible(runtime, goal, point)
```

Use `runtime.traceFn` to perform `visible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI predict visible position runtime; accesses `traceFn` and `context`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin` and `entityNum`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position.ml#L52)
