# `src/mq3/game/follow_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.follow_commands`](Package-mq3-game-follow-commands-1665348166.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/team_changes.ml` as `teamChanges` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-follow-commands-caller-function-caller-ent-src-mq3-game-follow-commands-ml-1030057297"></a>
### caller

```ml
function caller(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L28)

<a id="function-function-mq3-game-follow-commands-clientnumber-function-clientnumber-level-ent-text-src-mq3-game-follow-commands-ml-140410898"></a>
### clientNumber

```ml
function clientNumber(level, ent, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L32)

<a id="function-function-mq3-game-follow-commands-cycle-function-cycle-level-ent-direction-src-mq3-game-follow-commands-ml-888054494"></a>
### cycle

```ml
function cycle(level, ent, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L63)

<a id="function-function-mq3-game-follow-commands-follow-function-follow-level-ent-argv-src-mq3-game-follow-commands-ml-766171577"></a>
### follow

```ml
function follow(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L49)

<a id="function-function-mq3-game-follow-commands-sanitize-function-sanitize-text-src-mq3-game-follow-commands-ml-472988715"></a>
### sanitize

```ml
function sanitize(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L12)
