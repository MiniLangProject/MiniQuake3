# `src/mq3/botlib/ai_avoid_spots.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_avoid_spots`](Package-mq3-botlib-ai-avoid-spots-644891014.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `resources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-ai-avoid-spots-add-function-add-pools-movehandle-origin-radius-type-src-mq3-botlib-ai-avoid-spots-ml-759764958"></a>
### add

```ml
function add(pools, moveHandle, origin, radius, type)
```

Apply `mq3.botlib.ai_resource_pools.moveState` while evaluating `add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. |
| `moveHandle` | `dynamic` | — | Handle identifying the allocated bot movement state. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `radius` | `dynamic` | — | Radius used by the spatial or damage query. |
| `type` | `dynamic` | — | Value used by `add` in `if type==AVOID_CLEAR then state.numAvoidSpots=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_avoid_spots.ml#L24)

<a id="constant-constant-mq3-botlib-ai-avoid-spots-avoid-always-const-avoid-always-1-src-mq3-botlib-ai-avoid-spots-ml-689660804"></a>
### AVOID_ALWAYS

```ml
const AVOID_ALWAYS = 1
```

Avoidance-spot mode that always rejects paths through the spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_avoid_spots.ml#L14)

<a id="constant-constant-mq3-botlib-ai-avoid-spots-avoid-clear-const-avoid-clear-0-src-mq3-botlib-ai-avoid-spots-ml-1633109713"></a>
### AVOID_CLEAR

```ml
const AVOID_CLEAR = 0
```

Avoidance-spot mode that removes the previously registered spots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_avoid_spots.ml#L12)

<a id="constant-constant-mq3-botlib-ai-avoid-spots-avoid-dontblock-const-avoid-dontblock-2-src-mq3-botlib-ai-avoid-spots-ml-1784997587"></a>
### AVOID_DONTBLOCK

```ml
const AVOID_DONTBLOCK = 2
```

Avoidance-spot mode that influences path choice without blocking all movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_avoid_spots.ml#L16)

<a id="constant-constant-mq3-botlib-ai-avoid-spots-op-add-avoid-spot-const-op-add-avoid-spot-574-src-mq3-botlib-ai-avoid-spots-ml-157969529"></a>
### OP_ADD_AVOID_SPOT

```ml
const OP_ADD_AVOID_SPOT = 574
```

Bot-library syscall identifier for add avoid spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_avoid_spots.ml#L10)
