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

Require a valid client entity and return its client state for a spectator-follow command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L32)

<a id="function-function-mq3-game-follow-commands-clientnumber-function-clientnumber-level-ent-text-src-mq3-game-follow-commands-ml-140410898"></a>
### clientNumber

```ml
function clientNumber(level, ent, text)
```

Apply `mq3.game.follow_commands.caller`, `mq3.game.client_info.infoClientLimit` and `mq3.shared.info.textBytes` while evaluating `clientNumber`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L40)

<a id="function-function-mq3-game-follow-commands-cycle-function-cycle-level-ent-direction-src-mq3-game-follow-commands-ml-888054494"></a>
### cycle

```ml
function cycle(level, ent, direction)
```

Set `ent.client.spectatorClient` to `slot` and `ent.client.spectatorState` to `2` in `mq3.game.follow_commands.cycle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `maxclients` and `clients`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.spectatorClient` and `ent.client.spectatorState` in place. |
| `direction` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L79)

<a id="function-function-mq3-game-follow-commands-follow-function-follow-level-ent-argv-src-mq3-game-follow-commands-ml-766171577"></a>
### follow

```ml
function follow(level, ent, argv)
```

Set `ent.client.spectatorState` to `2` and `ent.client.spectatorClient` to `slot` in `mq3.game.follow_commands.follow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.spectatorState` and `ent.client.spectatorClient` in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L61)

<a id="function-function-mq3-game-follow-commands-sanitize-function-sanitize-text-src-mq3-game-follow-commands-ml-472988715"></a>
### sanitize

```ml
function sanitize(text)
```

Apply `mq3.shared.info.textBytes` while evaluating `sanitize`. Return paths include `decode(bytes(output))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/follow_commands.ml#L14)
