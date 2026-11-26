# `src/mq3/game/session.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.session`](Package-mq3-game-session-815909614.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-session-broadcastteamchange-function-broadcastteamchange-level-client-oldteam-src-mq3-game-session-ml-1085084731"></a>
### broadcastTeamChange

```ml
function broadcastTeamChange(level, client, oldTeam)
```

Use `level.serverCommandFn` to perform `broadcastTeamChange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `client` | `dynamic` | — | Client state; accesses `team` and `netname`. |
| `oldTeam` | `dynamic` | — | Value used by `broadcastTeamChange` in `else if client.team == 3 and oldTeam != 3 then suffix = " joined the spectators.\\n\\""`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L66)

<a id="function-function-mq3-game-session-cvartext-function-cvartext-level-name-src-mq3-game-session-ml-1669105197"></a>
### cvarText

```ml
function cvarText(level, name)
```

Apply `mq3.qcommon.cvar.find` and `mq3.shared.info.copy` while evaluating `cvarText`. Return paths include `infoStrings.copy(variable.string,1024)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L23)

<a id="function-function-mq3-game-session-getsessiontext-function-getsessiontext-level-name-src-mq3-game-session-ml-464192361"></a>
### getSessionText

```ml
function getSessionText(level, name)
```

Use `level.cvarStringFn` to perform `getSessionText`. Return paths include `cvarText(level,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarStringFn`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L32)

<a id="function-function-mq3-game-session-initclient-function-initclient-level-client-userinfo-src-mq3-game-session-ml-470181232"></a>
### initClient

```ml
function initClient(level, client, userinfo)
```

Update `client.team`, `client.spectatorState` and `client.spectatorTime` during `initClient`. Return paths include `writeClient(level,client)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `teamAutoJoin`, `numNonSpectatorClients`, `maxGameClients` and `time`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `spectatorState` and `spectatorTime`. May update `client.team`, `client.spectatorState` and `client.spectatorTime` in place. |
| `userinfo` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L80)

<a id="function-function-mq3-game-session-initworld-function-initworld-level-src-mq3-game-session-ml-1238483728"></a>
### initWorld

```ml
function initWorld(level)
```

Set `level.newSession` to `true` in `mq3.game.session.initWorld`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `newSession` and `gamePrintFn`. May update `level.newSession` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L103)

<a id="function-function-mq3-game-session-readclient-function-readclient-level-client-src-mq3-game-session-ml-2120922973"></a>
### readClient

```ml
function readClient(level, client)
```

Update `client.team`, `client.spectatorTime`, `client.spectatorState` and `client.spectatorClient` and related state during `readClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields. May update `client.team`, `client.spectatorTime` and `client.spectatorState` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L56)

<a id="function-function-mq3-game-session-sessionslot-function-sessionslot-level-client-src-mq3-game-session-ml-1527144545"></a>
### sessionSlot

```ml
function sessionSlot(level, client)
```

Locate a client record within persistent client storage and reject records not bound to a native slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `client` | `dynamic` | — | Value used by `sessionSlot` in `if client == void then return error(492,"Session requires a client") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L13)

<a id="function-function-mq3-game-session-setsessiontext-function-setsessiontext-level-name-text-src-mq3-game-session-ml-724693788"></a>
### setSessionText

```ml
function setSessionText(level, name, text)
```

Use `level.cvarSetFn` to perform `setSessionText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarSetFn`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L40)

<a id="function-function-mq3-game-session-writeclient-function-writeclient-level-client-src-mq3-game-session-ml-784239229"></a>
### writeClient

```ml
function writeClient(level, client)
```

Apply `mq3.game.session.sessionSlot`, `mq3.game.client_info.leaderValue` and `mq3.game.session.setSessionText` while evaluating `writeClient`. Return paths include `setSessionText(level,"session"+str(slot),text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L47)

<a id="function-function-mq3-game-session-writeworld-function-writeworld-level-src-mq3-game-session-ml-495531296"></a>
### writeWorld

```ml
function writeWorld(level)
```

Apply `mq3.game.client_info.infoClientLimit`, `mq3.game.session.setSessionText` and `mq3.game.session.writeClient` while evaluating `writeWorld`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `maxclients` and `clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/session.ml#L115)
