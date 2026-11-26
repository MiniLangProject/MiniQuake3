# `mq3.game.trajectory.Trajectory`

[Home](README.md) · [Source file](File-src-mq3-game-trajectory-ml-1278285327.md)

<a id="struct-struct-mq3-game-trajectory-trajectory-struct-trajectory-src-mq3-game-trajectory-ml-749528483"></a>
## Trajectory

```ml
struct Trajectory
```

`Trajectory` record for trajectory, containing `trType`, `trTime`, `trDuration`, `trBase` and `trDelta`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L10)

## Members

<a id="field-field-mq3-game-trajectory-trajectory-trbase-trbase-src-mq3-game-trajectory-ml-1972874838"></a>
### trBase

```ml
trBase
```

Base position or angle vector from which the trajectory is evaluated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L18)

<a id="field-field-mq3-game-trajectory-trajectory-trdelta-trdelta-src-mq3-game-trajectory-ml-44573968"></a>
### trDelta

```ml
trDelta
```

Trajectory velocity or amplitude vector, interpreted according to trType.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L20)

<a id="field-field-mq3-game-trajectory-trajectory-trduration-trduration-src-mq3-game-trajectory-ml-59991172"></a>
### trDuration

```ml
trDuration
```

Trajectory duration or sinusoidal period in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L16)

<a id="field-field-mq3-game-trajectory-trajectory-trtime-trtime-src-mq3-game-trajectory-ml-147500990"></a>
### trTime

```ml
trTime
```

Game time in milliseconds at which the trajectory starts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L14)

<a id="field-field-mq3-game-trajectory-trajectory-trtype-trtype-src-mq3-game-trajectory-ml-1670478924"></a>
### trType

```ml
trType
```

Trajectory evaluation mode, selected from the TR_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/trajectory.ml#L12)
