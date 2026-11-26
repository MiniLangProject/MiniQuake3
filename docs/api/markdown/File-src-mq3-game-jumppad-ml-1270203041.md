# `src/mq3/game/jumppad.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.jumppad`](Package-mq3-game-jumppad-24583075.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-jumppad-touch-function-touch-ps-number-origin2-src-mq3-game-jumppad-ml-2018189262"></a>
### touch

```ml
function touch(ps, number, origin2)
```

Update `ps.events[slot]`, `ps.eventParms[slot]`, `ps.eventSequence` and `ps.jumppad_ent` and related state during `touch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `powerups`, `jumppad_ent`, `eventSequence` and `events` and related fields. May update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` and additional fields in place. |
| `number` | `dynamic` | — | Value used by `touch` in `if ps.jumppad_ent != number then`. |
| `origin2` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/jumppad.ml#L13)
