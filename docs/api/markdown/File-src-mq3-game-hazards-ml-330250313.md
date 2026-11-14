# `src/mq3/game/hazards.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.hazards`](Package-mq3-game-hazards-465460243.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-hazards-hurttouch-function-hurttouch-level-self-other-trace-src-mq3-game-hazards-ml-855921177"></a>
### hurtTouch

```ml
function hurtTouch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L46)

<a id="function-function-mq3-game-hazards-hurtuse-function-hurtuse-level-self-other-activator-src-mq3-game-hazards-ml-287052607"></a>
### hurtUse

```ml
function hurtUse(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L42)

<a id="function-function-mq3-game-hazards-killuse-function-killuse-level-self-other-activator-src-mq3-game-hazards-ml-94901481"></a>
### killUse

```ml
function killUse(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L55)

<a id="function-function-mq3-game-hazards-laseroff-function-laseroff-level-self-src-mq3-game-hazards-ml-375225108"></a>
### laserOff

```ml
function laserOff(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L33)

<a id="function-function-mq3-game-hazards-laseron-function-laseron-level-self-src-mq3-game-hazards-ml-1119559564"></a>
### laserOn

```ml
function laserOn(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L29)

<a id="function-function-mq3-game-hazards-laserthink-function-laserthink-level-self-src-mq3-game-hazards-ml-1306509692"></a>
### laserThink

```ml
function laserThink(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L11)

<a id="function-function-mq3-game-hazards-laseruse-function-laseruse-level-self-other-activator-src-mq3-game-hazards-ml-1209378407"></a>
### laserUse

```ml
function laserUse(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L37)
