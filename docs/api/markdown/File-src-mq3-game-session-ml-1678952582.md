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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `oldTeam` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L43)

<a id="function-function-mq3-game-session-cvartext-function-cvartext-level-name-src-mq3-game-session-ml-1669105197"></a>
### cvarText

```ml
function cvarText(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L17)

<a id="function-function-mq3-game-session-getsessiontext-function-getsessiontext-level-name-src-mq3-game-session-ml-464192361"></a>
### getSessionText

```ml
function getSessionText(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L23)

<a id="function-function-mq3-game-session-initclient-function-initclient-level-client-userinfo-src-mq3-game-session-ml-470181232"></a>
### initClient

```ml
function initClient(level, client, userinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `userinfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L53)

<a id="function-function-mq3-game-session-initworld-function-initworld-level-src-mq3-game-session-ml-1238483728"></a>
### initWorld

```ml
function initWorld(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L74)

<a id="function-function-mq3-game-session-readclient-function-readclient-level-client-src-mq3-game-session-ml-2120922973"></a>
### readClient

```ml
function readClient(level, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L37)

<a id="function-function-mq3-game-session-sessionslot-function-sessionslot-level-client-src-mq3-game-session-ml-1527144545"></a>
### sessionSlot

```ml
function sessionSlot(level, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L10)

<a id="function-function-mq3-game-session-setsessiontext-function-setsessiontext-level-name-text-src-mq3-game-session-ml-724693788"></a>
### setSessionText

```ml
function setSessionText(level, name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L27)

<a id="function-function-mq3-game-session-writeclient-function-writeclient-level-client-src-mq3-game-session-ml-784239229"></a>
### writeClient

```ml
function writeClient(level, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L31)

<a id="function-function-mq3-game-session-writeworld-function-writeworld-level-src-mq3-game-session-ml-495531296"></a>
### writeWorld

```ml
function writeWorld(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/session.ml#L84)
