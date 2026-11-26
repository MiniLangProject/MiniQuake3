# `src/mq3/game/initialization.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.initialization`](Package-mq3-game-initialization-518894078.md)

Reachable from entry: **no**

## Imports

- `mq3/shared/info.ml` as `initializationInfo` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-initialization-findteams-function-findteams-level-src-mq3-game-initialization-ml-118889240"></a>
### findTeams

```ml
function findTeams(level)
```

Use `level.gamePrintFn` to perform `findTeams`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `entities` and `gamePrintFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/initialization.ml#L9)
