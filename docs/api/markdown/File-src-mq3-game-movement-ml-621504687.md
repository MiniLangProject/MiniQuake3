# `src/mq3/game/movement.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.movement`](Package-mq3-game-movement-984213995.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/game_internal_headers.ml` as `internal` → [src/mq3/game/game_internal_headers.ml](File-src-mq3-game-game-internal-headers-ml-370319487.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-movement-accelerate-function-accelerate-state-wishdir-wishspeed-accel-src-mq3-game-movement-ml-712332753"></a>
### accelerate

```ml
function accelerate(state, wishdir, wishspeed, accel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `wishdir` | `dynamic` | — |  |
| `wishspeed` | `dynamic` | — |  |
| `accel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L100)

<a id="function-function-mq3-game-movement-addevent-function-addevent-state-event-src-mq3-game-movement-ml-217927101"></a>
### addEvent

```ml
function addEvent(state, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L60)

<a id="function-function-mq3-game-movement-addtouchent-function-addtouchent-state-entity-src-mq3-game-movement-ml-1890416392"></a>
### addTouchEnt

```ml
function addTouchEnt(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L51)

<a id="function-function-mq3-game-movement-clipvelocity-function-clipvelocity-velocity-normal-overbounce-src-mq3-game-movement-ml-1294174308"></a>
### clipVelocity

```ml
function clipVelocity(velocity, normal, overbounce)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `overbounce` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L68)

<a id="function-function-mq3-game-movement-cmdscale-function-cmdscale-state-forward-right-up-src-mq3-game-movement-ml-1793007649"></a>
### cmdScale

```ml
function cmdScale(state, forward, right, up)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L110)

- [mq3.game.movement.Collision](Type-mq3-game-movement-collision-582373361.md) — struct
<a id="function-function-mq3-game-movement-copy-function-copy-v-src-mq3-game-movement-ml-1543934706"></a>
### copy

```ml
function copy(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L47)

<a id="function-function-mq3-game-movement-create-function-create-tracefn-context-src-mq3-game-movement-ml-1081605290"></a>
### create

```ml
function create(traceFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L43)

<a id="function-function-mq3-game-movement-friction-function-friction-state-src-mq3-game-movement-ml-843375885"></a>
### friction

```ml
function friction(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L74)

- [mq3.game.movement.Movement](Type-mq3-game-movement-movement-782007670.md) — struct
<a id="function-function-mq3-game-movement-slidemove-function-slidemove-state-gravity-src-mq3-game-movement-ml-35594123"></a>
### slideMove

```ml
function slideMove(state, gravity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gravity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L125)

<a id="function-function-mq3-game-movement-stepslidemove-function-stepslidemove-state-gravity-src-mq3-game-movement-ml-1481808387"></a>
### stepSlideMove

```ml
function stepSlideMove(state, gravity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gravity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/movement.ml#L205)
