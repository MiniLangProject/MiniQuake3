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

Set `ent.client` to `client` and `level.clients[ent.slot]` to `client` in `mq3.game.entities.bindClient`. Return paths include `client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. May update `level.clients[ent.slot]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. May update `ent.client` in place. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L654)

<a id="function-function-mq3-game-entities-blank-function-blank-slot-r-src-mq3-game-entities-ml-1138623842"></a>
### blank

```ml
function blank(slot, r)
```

Create an inactive entity record with the default game, collision and event fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `r` | `dynamic` | — | Initial value stored in `mq3.game.entities.Entity.r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L634)

- [mq3.game.entities.Client](Type-mq3-game-entities-client-1102521674.md) — struct
<a id="function-function-mq3-game-entities-create-function-create-world-src-mq3-game-entities-ml-1553679680"></a>
### create

```ml
function create(world)
```

Apply `mq3.server.world.create`, `mq3.game.cvar_maintenance.create` and `mq3.game.entities.blank` while evaluating `create`. Return paths include `level`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Initial value stored in `mq3.server.world.Scene.world`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L639)

<a id="function-function-mq3-game-entities-createclient-function-createclient-state-team-cmdangles-src-mq3-game-entities-ml-977957426"></a>
### createClient

```ml
function createClient(state, team, cmdAngles)
```

Create a client record with initialized player state, session data, statistics and gameplay timers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.game.entities.Client.ps`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `cmdAngles` | `dynamic` | — | Initial value stored in `mq3.game.entities.Client.cmdAngles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L596)

<a id="function-function-mq3-game-entities-diagnostic-function-diagnostic-level-text-src-mq3-game-entities-ml-569739761"></a>
### diagnostic

```ml
function diagnostic(level, text)
```

Use `level.gamePrintFn` to perform `diagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L769)

<a id="function-function-mq3-game-entities-diagnosticargument-function-diagnosticargument-text-src-mq3-game-entities-ml-622131885"></a>
### diagnosticArgument

```ml
function diagnosticArgument(text)
```

Convert a native diagnostic string to text up to its first zero byte, with a null-pointer placeholder.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L776)

<a id="function-function-mq3-game-entities-entitiesfree-function-entitiesfree-level-src-mq3-game-entities-ml-883391718"></a>
### entitiesFree

```ml
function entitiesFree(level)
```

Check whether any non-client entity slot below the active entity limit is unused.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L691)

- [mq3.game.entities.Entity](Type-mq3-game-entities-entity-1824582758.md) — struct
<a id="function-function-mq3-game-entities-free-function-free-level-ent-src-mq3-game-entities-ml-1602485441"></a>
### free

```ml
function free(level, ent)
```

Unlink and release a game entity while preserving the entity-slot lifecycle rules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `ent.r`, `ent.s` and `ent.client` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L724)

<a id="function-function-mq3-game-entities-initentity-function-initentity-ent-src-mq3-game-entities-ml-1653673953"></a>
### initEntity

```ml
function initEntity(ent)
```

Initialize an allocated game entity for use by the level and its collision services.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `inuse`, `classname`, `s`, `slot` and `r`. May update `ent.inuse`, `ent.classname` and `ent.s.number` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L669)

- [mq3.game.entities.Level](Type-mq3-game-entities-level-1198109129.md) — struct
<a id="function-function-mq3-game-entities-link-function-link-level-ent-src-mq3-game-entities-ml-617438733"></a>
### link

```ml
function link(level, ent)
```

Set `ent.s.solid` to `ent.r.solid` in `mq3.game.entities.link`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`, `s` and `r`. May update `ent.s.solid` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L709)

<a id="function-function-mq3-game-entities-observe-function-observe-level-kind-ent-src-mq3-game-entities-ml-562830299"></a>
### observe

```ml
function observe(level, kind, ent)
```

Use `level.observeFn` to perform `observe`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `observeFn`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `level.observeFn`. |
| `ent` | `dynamic` | — | Value passed as argument 3 to `level.observeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L663)

<a id="function-function-mq3-game-entities-picktarget-function-picktarget-level-name-src-mq3-game-entities-ml-1662904713"></a>
### pickTarget

```ml
function pickTarget(level, name)
```

Use `level.gamePrintFn` to perform `pickTarget`. Return paths include `choices[random(level) % len(choices)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L818)

<a id="function-function-mq3-game-entities-random-function-random-level-src-mq3-game-entities-ml-1367170630"></a>
### random

```ml
function random(level)
```

Set `level.randSeed` to `n.add32(n.mul32(level.randSeed,214013),2531011)` in `mq3.game.entities.random`. Return paths include `(n.u32(level.randSeed) >> 16) & 32767`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L810)

<a id="function-function-mq3-game-entities-resetclient-function-resetclient-client-src-mq3-game-entities-ml-1828809041"></a>
### resetClient

```ml
function resetClient(client)
```

Reset the existing client record to the default values used when binding a new player.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Client state; accesses `ps`, `team`, `cmdAngles`, `noclip` and `damage_armor` and related fields. May update `client.ps`, `client.team` and `client.cmdAngles` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L602)

<a id="function-function-mq3-game-entities-runthink-function-runthink-level-ent-src-mq3-game-entities-ml-1129061705"></a>
### runThink

```ml
function runThink(level, ent)
```

Set `ent.nextthink` to `0` in `mq3.game.entities.runThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L750)

<a id="function-function-mq3-game-entities-setorigin-function-setorigin-ent-origin-src-mq3-game-entities-ml-2031111583"></a>
### setOrigin

```ml
function setOrigin(ent, origin)
```

Update `ent.s.pos.trBase`, `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.s.pos.trDuration` and related state during `setOrigin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `r`. May update `ent.s.pos.trBase`, `ent.s.pos.trType` and `ent.s.pos.trTime` and additional fields in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L761)

<a id="function-function-mq3-game-entities-spawn-function-spawn-level-src-mq3-game-entities-ml-1994161584"></a>
### spawn

```ml
function spawn(level)
```

Set `level.num_entities` to `level.num_entities+1` in `mq3.game.entities.spawn`. Return paths include `initEntity(ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L675)

<a id="function-function-mq3-game-entities-syncspatial-function-syncspatial-ent-src-mq3-game-entities-ml-1744366203"></a>
### syncSpatial

```ml
function syncSpatial(ent)
```

Update `ent.r.number`, `ent.r.modelindex`, `ent.r.solid` and `ent.r.origin` and related state during `syncSpatial`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `s`. May update `ent.r.number`, `ent.r.modelindex` and `ent.r.solid` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L701)

<a id="function-function-mq3-game-entities-tempentity-function-tempentity-level-origin-event-src-mq3-game-entities-ml-471646302"></a>
### tempEntity

```ml
function tempEntity(level, origin, event)
```

Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.snapshot.snapVector` while evaluating `tempEntity`. Return paths include `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L802)

<a id="function-function-mq3-game-entities-unlink-function-unlink-level-ent-src-mq3-game-entities-ml-272856193"></a>
### unlink

```ml
function unlink(level, ent)
```

Apply `mq3.server.world.unlinkEntity` and `mq3.game.entities.observe` while evaluating `unlink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L717)

<a id="function-function-mq3-game-entities-vtos-function-vtos-level-vector-src-mq3-game-entities-ml-642816193"></a>
### vtos

```ml
function vtos(level, vector)
```

Use `level.gamePrintFn` to perform `vtos`. Return paths include `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `vector` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entities.ml#L787)
