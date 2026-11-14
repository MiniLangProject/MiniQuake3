# `src/mq3/game/team_status.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.team_status`](Package-mq3-game-team-status-24151910.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-team-status-boundclient-function-boundclient-ent-src-mq3-game-team-status-ml-906624151"></a>
### boundClient

```ml
function boundClient(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L50)

<a id="function-function-mq3-game-team-status-check-function-check-level-src-mq3-game-team-status-ml-88582312"></a>
### check

```ml
function check(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L93)

<a id="function-function-mq3-game-team-status-getlocation-function-getlocation-level-ent-src-mq3-game-team-status-ml-650712465"></a>
### getLocation

```ml
function getLocation(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L12)

<a id="function-function-mq3-game-team-status-getlocationmsg-function-getlocationmsg-level-ent-capacity-src-mq3-game-team-status-ml-766372091"></a>
### getLocationMsg

```ml
function getLocationMsg(level, ent, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L27)

<a id="function-function-mq3-game-team-status-overlaylimit-function-overlaylimit-level-src-mq3-game-team-status-ml-965036820"></a>
### overlayLimit

```ml
function overlayLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L46)

<a id="function-function-mq3-game-team-status-sendinfo-function-sendinfo-level-ent-src-mq3-game-team-status-ml-346757035"></a>
### sendInfo

```ml
function sendInfo(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L57)

<a id="function-function-mq3-game-team-status-sortclients-function-sortclients-a-b-src-mq3-game-team-status-ml-1701338567"></a>
### sortClients

```ml
function sortClients(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L54)

<a id="constant-constant-mq3-game-team-status-team-location-update-time-const-team-location-update-time-1000-src-mq3-game-team-status-ml-137245256"></a>
### TEAM_LOCATION_UPDATE_TIME

```ml
const TEAM_LOCATION_UPDATE_TIME = 1000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L10)

<a id="constant-constant-mq3-game-team-status-team-maxoverlay-const-team-maxoverlay-32-src-mq3-game-team-status-ml-1785622740"></a>
### TEAM_MAXOVERLAY

```ml
const TEAM_MAXOVERLAY = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_status.ml#L9)
