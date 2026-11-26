# `src/mq3/game/events.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.events`](Package-mq3-game-events-1620383919.md)

Reachable from entry: **no**

## Imports

- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)

## Declarations

<a id="function-function-mq3-game-events-add-function-add-level-ent-event-parm-src-mq3-game-events-ml-1041507045"></a>
### add

```ml
function add(level, ent, event, parm)
```

Update `ent.s.event`, `ent.s.eventParm` and `ent.eventTime` during `add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `eventTime`. May update `ent.s.event`, `ent.s.eventParm` and `ent.eventTime` in place. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `parm` | `dynamic` | — | Integer parameter stored alongside the emitted event. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/events.ml#L11)

<a id="function-function-mq3-game-events-sound-function-sound-level-ent-channel-index-src-mq3-game-events-ml-1716547734"></a>
### sound

```ml
function sound(level, ent, channel, index)
```

Create an entity sound event using the game event-delivery path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `channel` | `dynamic` | — | Not read by this implementation; retained in the `sound` signature. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/events.ml#L27)
