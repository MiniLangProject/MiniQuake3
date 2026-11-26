# `src/mq3/game/bg_slidemove_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bg_slidemove_runtime`](Package-mq3-game-bg-slidemove-runtime-1053814729.md)

Reachable from entry: **no**

## Imports

- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)

## Declarations

<a id="function-function-mq3-game-bg-slidemove-runtime-pm-slidemove-function-pm-slidemove-state-gravity-src-mq3-game-bg-slidemove-runtime-ml-898281759"></a>
### PM_SlideMove

```ml
function PM_SlideMove(state, gravity)
```

Forward `PM_SlideMove` to `mq3.game.movement.slideMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `velocity`, `gravity`, `frametime`, `groundPlane` and `groundNormal` and related fields. May update `state.velocity[2]`, `state.velocity` and `state.origin` and additional fields in place. |
| `gravity` | `dynamic` | — | Value used by `slideMove` in `if gravity then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_slidemove_runtime.ml#L10)

<a id="function-function-mq3-game-bg-slidemove-runtime-pm-stepslidemove-function-pm-stepslidemove-state-gravity-src-mq3-game-bg-slidemove-runtime-ml-953260251"></a>
### PM_StepSlideMove

```ml
function PM_StepSlideMove(state, gravity)
```

Forward `PM_StepSlideMove` to `mq3.game.movement.stepSlideMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `origin`, `velocity` and `traceFn`. May update `state.origin` and `state.velocity` in place. |
| `gravity` | `dynamic` | — | Value used by `slideMove` in `if gravity then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_slidemove_runtime.ml#L14)
