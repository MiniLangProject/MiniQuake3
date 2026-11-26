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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-replay-commands-function-commands-text-src-mq3-game-replay-ml-1836555081"></a>
### commands

```ml
function commands(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/replay.ml#L31)

<a id="function-function-mq3-game-replay-create-function-create-world-origin-src-mq3-game-replay-ml-130067730"></a>
### create

```ml
function create(world, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/replay.ml#L20)

<a id="function-function-mq3-game-replay-row-function-row-p-src-mq3-game-replay-ml-1858136656"></a>
### row

```ml
function row(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/replay.ml#L52)

<a id="function-function-mq3-game-replay-run-function-run-world-origin-text-src-mq3-game-replay-ml-2082399719"></a>
### run

```ml
function run(world, origin, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/replay.ml#L62)

<a id="function-function-mq3-game-replay-worldcontents-function-worldcontents-p-point-src-mq3-game-replay-ml-754382228"></a>
### worldContents

```ml
function worldContents(p, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/replay.ml#L17)

<a id="function-function-mq3-game-replay-worldtrace-function-worldtrace-p-start-finish-src-mq3-game-replay-ml-1460069101"></a>
### worldTrace

```ml
function worldTrace(p, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/replay.ml#L11)
