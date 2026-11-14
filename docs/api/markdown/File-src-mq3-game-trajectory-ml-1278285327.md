# `src/mq3/game/trajectory.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.trajectory`](Package-mq3-game-trajectory-318563159.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-trajectory-evaluate-function-evaluate-tr-attime-src-mq3-game-trajectory-ml-356182760"></a>
### evaluate

```ml
function evaluate(tr, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L21)

<a id="function-function-mq3-game-trajectory-evaluatedelta-function-evaluatedelta-tr-attime-src-mq3-game-trajectory-ml-332497278"></a>
### evaluateDelta

```ml
function evaluateDelta(tr, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L50)

<a id="function-function-mq3-game-trajectory-phaseangle-function-phaseangle-tr-attime-src-mq3-game-trajectory-ml-959890316"></a>
### phaseAngle

```ml
function phaseAngle(tr, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L16)

<a id="function-function-mq3-game-trajectory-playertouchesitem-function-playertouchesitem-ps-trajectory-attime-src-mq3-game-trajectory-ml-718069784"></a>
### playerTouchesItem

```ml
function playerTouchesItem(ps, trajectory, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `trajectory` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L75)

- [mq3.game.trajectory.Trajectory](Type-mq3-game-trajectory-trajectory-1628072410.md) — struct
