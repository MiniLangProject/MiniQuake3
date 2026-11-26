# `src/mq3/game/command_args.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.command_args`](Package-mq3-game-command-args-827290081.md)

Reachable from entry: **no**

## Imports

- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-command-args-argument-function-argument-argv-index-capacity-src-mq3-game-command-args-ml-1781955470"></a>
### argument

```ml
function argument(argv, index, capacity)
```

Read one argument from the game command token list with the command parser's missing-argument fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/command_args.ml#L11)

<a id="function-function-mq3-game-command-args-concat-function-concat-argv-start-src-mq3-game-command-args-ml-122410886"></a>
### concat

```ml
function concat(argv, start)
```

Join the selected game command arguments into the text consumed by command handlers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `start` | `dynamic` | — | Value used by `concat` in `index = start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/command_args.ml#L19)
