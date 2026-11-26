# `src/mq3/game/map_targets.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.map_targets`](Package-mq3-game-map-targets-1396279701.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/brush.ml` as `mapTargetBrush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `mapTargetEntities` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_utils.ml` as `gUtils` → [src/mq3/game/g_utils.ml](File-src-mq3-game-g-utils-ml-808912811.md)
- `mq3/game/items.ml` as `mapTargetItems` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/movement.ml` as `mapTargetMovement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/scores.ml` as `mapTargetScores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)

## Declarations

<a id="function-function-mq3-game-map-targets-givespawn-function-givespawn-level-ent-src-mq3-game-map-targets-ml-949800287"></a>
### giveSpawn

```ml
function giveSpawn(level, ent)
```

Set `ent.use` to `giveUse` in `mq3.game.map_targets.giveSpawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `giveSpawn` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L103)

<a id="function-function-mq3-game-map-targets-giveuse-function-giveuse-level-ent-other-activator-src-mq3-game-map-targets-ml-1482904080"></a>
### giveUse

```ml
function giveUse(level, ent, other, activator)
```

Apply `mq3.game.map_targets.mapTargetsEntity`, `mq3.game.map_targets.mapTargetsEntityLimit` and `mq3.game.map_targets.mapTargetsNamesEqual` while evaluating `giveUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `target`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `giveUse` signature. |
| `activator` | `dynamic` | — | Activator record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L77)

<a id="function-function-mq3-game-map-targets-maptargetscentercommand-function-maptargetscentercommand-ent-src-mq3-game-map-targets-ml-2007632639"></a>
### mapTargetsCenterCommand

```ml
function mapTargetsCenterCommand(ent)
```

Apply `mq3.game.map_targets.mapTargetsText` while evaluating `mapTargetsCenterCommand`. Return paths include `+mapTargetsText(ent.message,31994)+"\""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L165)

<a id="function-function-mq3-game-map-targets-maptargetsclientlimit-function-maptargetsclientlimit-level-src-mq3-game-map-targets-ml-974661046"></a>
### mapTargetsClientLimit

```ml
function mapTargetsClientLimit(level)
```

Validate the level client count against the native sixty-four-client storage limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L29)

<a id="function-function-mq3-game-map-targets-maptargetsentity-function-maptargetsentity-ent-src-mq3-game-map-targets-ml-1364278819"></a>
### mapTargetsEntity

```ml
function mapTargetsEntity(ent)
```

Require a non-void game entity for a map target operation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Operand used to evaluate the returned expression `ent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L15)

<a id="function-function-mq3-game-map-targets-maptargetsentitylimit-function-maptargetsentitylimit-level-src-mq3-game-map-targets-ml-83868818"></a>
### mapTargetsEntityLimit

```ml
function mapTargetsEntityLimit(level)
```

Validate the level entity count against the native 1024-entity storage limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L21)

<a id="function-function-mq3-game-map-targets-maptargetsnamesequal-function-maptargetsnamesequal-first-second-src-mq3-game-map-targets-ml-445154546"></a>
### mapTargetsNamesEqual

```ml
function mapTargetsNamesEqual(first, second)
```

Compare native target names case-insensitively through their zero terminators.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `second` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L53)

<a id="function-function-mq3-game-map-targets-maptargetspowerups-function-maptargetspowerups-activator-src-mq3-game-map-targets-ml-742300405"></a>
### mapTargetsPowerups

```ml
function mapTargetsPowerups(activator)
```

Require an activating client with the native sixteen-slot powerup array and return that array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `activator` | `dynamic` | — | Activator record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L109)

<a id="function-function-mq3-game-map-targets-maptargetsteamcommand-function-maptargetsteamcommand-level-team-command-src-mq3-game-map-targets-ml-695246890"></a>
### mapTargetsTeamCommand

```ml
function mapTargetsTeamCommand(level, team, command)
```

Forward `mapTargetsTeamCommand` to `mq3.game.g_utils.G_TeamCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `clients` and `serverCommandFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `command` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L174)

<a id="function-function-mq3-game-map-targets-maptargetstext-function-maptargetstext-text-limit-src-mq3-game-map-targets-ml-1044513422"></a>
### mapTargetsText

```ml
function mapTargetsText(text, limit)
```

Read bounded native target text through its zero terminator, rejecting invalid types or oversized text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `limit` | `dynamic` | — | Value used by `mapTargetsText` in `if length > limit then return error(477,"Map target format exceeds native va storage") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L38)

<a id="function-function-mq3-game-map-targets-printspawn-function-printspawn-level-ent-src-mq3-game-map-targets-ml-910607175"></a>
### printSpawn

```ml
function printSpawn(level, ent)
```

Set `ent.use` to `printUse` in `mq3.game.map_targets.printSpawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `printSpawn` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L203)

<a id="function-function-mq3-game-map-targets-printuse-function-printuse-level-ent-other-activator-src-mq3-game-map-targets-ml-782448328"></a>
### printUse

```ml
function printUse(level, ent, other, activator)
```

Apply `mq3.game.map_targets.mapTargetsEntity`, `mq3.game.scores.send` and `mq3.game.map_targets.mapTargetsCenterCommand` while evaluating `printUse`. Return paths include `mapTargetScores.send(level,-1,mapTargetsCenterCommand(ent))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `printUse` signature. |
| `activator` | `dynamic` | — | Activator record; accesses `client` and `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L184)

<a id="function-function-mq3-game-map-targets-removepowerupsspawn-function-removepowerupsspawn-level-ent-src-mq3-game-map-targets-ml-1364910679"></a>
### removePowerupsSpawn

```ml
function removePowerupsSpawn(level, ent)
```

Set `ent.use` to `removePowerupsUse` in `mq3.game.map_targets.removePowerupsSpawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `removePowerupsSpawn` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L139)

<a id="function-function-mq3-game-map-targets-removepowerupsuse-function-removepowerupsuse-level-ent-other-activator-src-mq3-game-map-targets-ml-697155128"></a>
### removePowerupsUse

```ml
function removePowerupsUse(level, ent, other, activator)
```

Apply `mq3.game.map_targets.mapTargetsEntity`, `mq3.game.map_targets.mapTargetsPowerups` and `mq3.game.items.returnFlag` while evaluating `removePowerupsUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `removePowerupsUse` signature. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `removePowerupsUse` signature. |
| `activator` | `dynamic` | — | Activator record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L121)

<a id="function-function-mq3-game-map-targets-scorespawn-function-scorespawn-level-ent-src-mq3-game-map-targets-ml-1564610795"></a>
### scoreSpawn

```ml
function scoreSpawn(level, ent)
```

Set `ent.count` to `1` and `ent.use` to `scoreUse` in `mq3.game.map_targets.scoreSpawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `scoreSpawn` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `count` and `use`. May update `ent.count` and `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L157)

<a id="function-function-mq3-game-map-targets-scoreuse-function-scoreuse-level-ent-other-activator-src-mq3-game-map-targets-ml-1711340620"></a>
### scoreUse

```ml
function scoreUse(level, ent, other, activator)
```

Apply `mq3.game.map_targets.mapTargetsEntity` and `mq3.game.scores.addScore` while evaluating `scoreUse`. Return paths include `mapTargetScores.addScore(level,activator,ent.r.currentOrigin,ent.count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `teamScores`. May update `level.teamScores[team]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `count`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `scoreUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L148)
