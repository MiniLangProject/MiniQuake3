# `src/mq3/game/replay.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.replay`](Package-mq3-game-replay-976194437.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/movement.ml` as `kernel` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/playerstate.ml` as `states` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/pmove.ml` as `pm` → [src/mq3/game/pmove.ml](File-src-mq3-game-pmove-ml-1046301421.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-replay-commands-function-commands-text-src-mq3-game-replay-ml-1836555081"></a>
### commands

```ml
function commands(text)
```

Parse movement replay rows as nine tab-separated signed 32-bit integers, skipping empty lines and comments.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/replay.ml#L43)

<a id="function-function-mq3-game-replay-create-function-create-world-origin-src-mq3-game-replay-ml-130067730"></a>
### create

```ml
function create(world, origin)
```

Apply `mq3.game.playerstate.create`, `mq3.game.movement.copy` and `mq3.game.pmove.create` while evaluating `create`. Return paths include `pm.create(s,worldTrace,worldContents,world)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/replay.ml#L30)

<a id="function-function-mq3-game-replay-row-function-row-p-src-mq3-game-replay-ml-1858136656"></a>
### row

```ml
function row(p)
```

Serialize the selected player and movement-kernel fields as one tab-separated replay result row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/replay.ml#L66)

<a id="function-function-mq3-game-replay-run-function-run-world-origin-text-src-mq3-game-replay-ml-2082399719"></a>
### run

```ml
function run(world, origin, text)
```

Apply `mq3.game.replay.commands`, `mq3.game.replay.create` and `mq3.game.pmove.move` while evaluating `run`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/replay.ml#L80)

<a id="function-function-mq3-game-replay-worldcontents-function-worldcontents-p-point-src-mq3-game-replay-ml-754382228"></a>
### worldContents

```ml
function worldContents(p, point)
```

Forward `worldContents` to `mq3.collision.world.pointContents` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `context`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/replay.ml#L24)

<a id="function-function-mq3-game-replay-worldtrace-function-worldtrace-p-start-finish-src-mq3-game-replay-ml-1460069101"></a>
### worldTrace

```ml
function worldTrace(p, start, finish)
```

Build the `mq3.game.movement.Collision` result for `worldTrace`. Return paths include `kernel.Collision(hit.trace,hit.endpos,entity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `context` and `k`. |
| `start` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `finish` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/replay.ml#L15)
