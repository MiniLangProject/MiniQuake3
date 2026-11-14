# `src/mq3/game/entities.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.entities`](Package-mq3-game-entities-365001845.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/cvar_maintenance.ml` as `cvarMaintenance` → [src/mq3/game/cvar_maintenance.ml](File-src-mq3-game-cvar-maintenance-ml-54356974.md)
- `mq3/game/entitystate.ml` as `es` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/playerstate.ml` as `ps` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-entities-bindclient-function-bindclient-level-ent-client-src-mq3-game-entities-ml-2100162686"></a>
### bindClient

```ml
function bindClient(level, ent, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L351)

<a id="function-function-mq3-game-entities-blank-function-blank-slot-r-src-mq3-game-entities-ml-1138623842"></a>
### blank

```ml
function blank(slot, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L337)

- [mq3.game.entities.Client](Type-mq3-game-entities-client-1102521674.md) — struct
<a id="function-function-mq3-game-entities-create-function-create-world-src-mq3-game-entities-ml-1553679680"></a>
### create

```ml
function create(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L340)

<a id="function-function-mq3-game-entities-createclient-function-createclient-state-team-cmdangles-src-mq3-game-entities-ml-977957426"></a>
### createClient

```ml
function createClient(state, team, cmdAngles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `cmdAngles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L304)

<a id="function-function-mq3-game-entities-diagnostic-function-diagnostic-level-text-src-mq3-game-entities-ml-569739761"></a>
### diagnostic

```ml
function diagnostic(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L436)

<a id="function-function-mq3-game-entities-diagnosticargument-function-diagnosticargument-text-src-mq3-game-entities-ml-622131885"></a>
### diagnosticArgument

```ml
function diagnosticArgument(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L441)

<a id="function-function-mq3-game-entities-entitiesfree-function-entitiesfree-level-src-mq3-game-entities-ml-883391718"></a>
### entitiesFree

```ml
function entitiesFree(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L378)

- [mq3.game.entities.Entity](Type-mq3-game-entities-entity-1824582758.md) — struct
<a id="function-function-mq3-game-entities-free-function-free-level-ent-src-mq3-game-entities-ml-1602485441"></a>
### free

```ml
function free(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L400)

<a id="function-function-mq3-game-entities-initentity-function-initentity-ent-src-mq3-game-entities-ml-1653673953"></a>
### initEntity

```ml
function initEntity(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L360)

- [mq3.game.entities.Level](Type-mq3-game-entities-level-1198109129.md) — struct
<a id="function-function-mq3-game-entities-link-function-link-level-ent-src-mq3-game-entities-ml-617438733"></a>
### link

```ml
function link(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L391)

<a id="function-function-mq3-game-entities-observe-function-observe-level-kind-ent-src-mq3-game-entities-ml-562830299"></a>
### observe

```ml
function observe(level, kind, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L356)

<a id="function-function-mq3-game-entities-picktarget-function-picktarget-level-name-src-mq3-game-entities-ml-1662904713"></a>
### pickTarget

```ml
function pickTarget(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L471)

<a id="function-function-mq3-game-entities-random-function-random-level-src-mq3-game-entities-ml-1367170630"></a>
### random

```ml
function random(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L466)

<a id="function-function-mq3-game-entities-resetclient-function-resetclient-client-src-mq3-game-entities-ml-1828809041"></a>
### resetClient

```ml
function resetClient(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L308)

<a id="function-function-mq3-game-entities-runthink-function-runthink-level-ent-src-mq3-game-entities-ml-1129061705"></a>
### runThink

```ml
function runThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L423)

<a id="function-function-mq3-game-entities-setorigin-function-setorigin-ent-origin-src-mq3-game-entities-ml-2031111583"></a>
### setOrigin

```ml
function setOrigin(ent, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L431)

<a id="function-function-mq3-game-entities-spawn-function-spawn-level-src-mq3-game-entities-ml-1994161584"></a>
### spawn

```ml
function spawn(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L364)

<a id="function-function-mq3-game-entities-syncspatial-function-syncspatial-ent-src-mq3-game-entities-ml-1744366203"></a>
### syncSpatial

```ml
function syncSpatial(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L386)

<a id="function-function-mq3-game-entities-tempentity-function-tempentity-level-origin-event-src-mq3-game-entities-ml-471646302"></a>
### tempEntity

```ml
function tempEntity(level, origin, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L460)

<a id="function-function-mq3-game-entities-unlink-function-unlink-level-ent-src-mq3-game-entities-ml-272856193"></a>
### unlink

```ml
function unlink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L396)

<a id="function-function-mq3-game-entities-vtos-function-vtos-level-vector-src-mq3-game-entities-ml-642816193"></a>
### vtos

```ml
function vtos(level, vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/entities.ml#L449)
