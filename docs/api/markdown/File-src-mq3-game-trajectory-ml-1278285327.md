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

Every branch returns. A dense switch here emits unresolved jump-table data when this package is imported by the published MiniLang 1.3.9 compiler.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — | Trajectory record containing type, base position, velocity, start time and duration. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/trajectory.ml#L29)

<a id="function-function-mq3-game-trajectory-evaluatedelta-function-evaluatedelta-tr-attime-src-mq3-game-trajectory-ml-332497278"></a>
### evaluateDelta

```ml
function evaluateDelta(tr, atTime)
```

Evaluate trajectory velocity for stationary, linear, stopped, sinusoidal and gravity-driven motion at the supplied time.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — | Trajectory record containing type, velocity, start time and duration. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/trajectory.ml#L58)

<a id="function-function-mq3-game-trajectory-phaseangle-function-phaseangle-tr-attime-src-mq3-game-trajectory-ml-959890316"></a>
### phaseAngle

```ml
function phaseAngle(tr, atTime)
```

Calculate the sine-trajectory phase in radians at the supplied game time; reject a zero trajectory duration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — | Trajectory record containing the start time and nonzero duration in milliseconds. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/trajectory.ml#L20)

<a id="function-function-mq3-game-trajectory-playertouchesitem-function-playertouchesitem-ps-trajectory-attime-src-mq3-game-trajectory-ml-718069784"></a>
### playerTouchesItem

```ml
function playerTouchesItem(ps, trajectory, atTime)
```

Test the player origin against the asymmetric item-pickup bounds after evaluating the item trajectory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `origin`. |
| `trajectory` | `dynamic` | — | Trajectory record containing type, base position, velocity, start time and duration. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/trajectory.ml#L84)

- [mq3.game.trajectory.Trajectory](Type-mq3-game-trajectory-trajectory-1628072410.md) — struct
