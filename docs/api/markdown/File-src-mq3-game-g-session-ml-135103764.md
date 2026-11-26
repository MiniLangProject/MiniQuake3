# `src/mq3/game/g_session.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_session`](Package-mq3-game-g-session-846858884.md)

Reachable from entry: **no**

## Imports

- `mq3/game/session.ml` as `session` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)

## Declarations

<a id="function-function-mq3-game-g-session-g-initsessiondata-function-g-initsessiondata-level-client-userinfo-src-mq3-game-g-session-ml-983451436"></a>
### G_InitSessionData

```ml
function G_InitSessionData(level, client, userinfo)
```

Forward `G_InitSessionData` to `mq3.game.session.initClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `teamAutoJoin`, `numNonSpectatorClients`, `maxGameClients` and `time`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `spectatorState` and `spectatorTime`. May update `client.team`, `client.spectatorState` and `client.spectatorTime` in place. |
| `userinfo` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_session.ml#L19)

<a id="function-function-mq3-game-g-session-g-initworldsession-function-g-initworldsession-level-src-mq3-game-g-session-ml-1709510328"></a>
### G_InitWorldSession

```ml
function G_InitWorldSession(level)
```

Forward `G_InitWorldSession` to `mq3.game.session.initWorld` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `newSession` and `gamePrintFn`. May update `level.newSession` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_session.ml#L22)

<a id="function-function-mq3-game-g-session-g-readsessiondata-function-g-readsessiondata-level-client-src-mq3-game-g-session-ml-1942018597"></a>
### G_ReadSessionData

```ml
function G_ReadSessionData(level, client)
```

Forward `G_ReadSessionData` to `mq3.game.session.readClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields. May update `client.team`, `client.spectatorTime` and `client.spectatorState` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_session.ml#L14)

<a id="function-function-mq3-game-g-session-g-writeclientsessiondata-function-g-writeclientsessiondata-level-client-src-mq3-game-g-session-ml-1121841965"></a>
### G_WriteClientSessionData

```ml
function G_WriteClientSessionData(level, client)
```

Forward `G_WriteClientSessionData` to `mq3.game.session.writeClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_session.ml#L10)

<a id="function-function-mq3-game-g-session-g-writesessiondata-function-g-writesessiondata-level-src-mq3-game-g-session-ml-1070656748"></a>
### G_WriteSessionData

```ml
function G_WriteSessionData(level)
```

Forward `G_WriteSessionData` to `mq3.game.session.writeWorld` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `maxclients` and `clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_session.ml#L25)
